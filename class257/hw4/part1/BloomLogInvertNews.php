<?php
require_once 'debug.php';
class BloomLogInvertNews extends debug{
    function ingest($some_folder){
        if(empty($some_folder)){
            echo "please enter the folder name\n";
            exit;
        }
        
        if(!is_dir($some_folder)){
            echo "folder not exsist\n";
            exit;
        }
        
        $rs_files=$this->get_all_files($some_folder,"rss");
        if(empty($rs_files)){
            echo "no rss files \n";
            exit;
        }
        
        //init bloom filter
        $this->init_bloom_filter($rs_files);
        
        //create items in file
        $mem_item=[];
        $last_length=16;
        $this->current_indexing=[];
        $this->level=1;
        $this->pair="B";
        $item_count=0;
        foreach($rs_files as $v){
            $tmp_files = file_get_contents($v);
            $rs_xml = json_decode(json_encode(simplexml_load_string($tmp_files)),true);
            $rs_items = $rs_xml['channel']['item'];
            
            //format rss items
            foreach($rs_items as $kk=>$vv){
                $title=empty($vv['title'])?"":$vv['title'];
                $description=empty($vv['description'])?"":$vv['description'];
                $vv['hash']=md5($title.$description);
                $vv['timestamp']=$this->rsstotime($vv['pubDate']);
                
                //checkblook filter
                if($this->check_bloom_filter($vv['title'],$vv['hash'])){
                    //create news_data item
                    $item=$this->create_item($vv);
                    
                    //put item in memory
                    $mem_item[]=$item;
                    
                    //create indexing file and reset memory
                    if(count($mem_item)==3){
                        $last_length=$this->create_indexing($last_length,$mem_item);
                        $mem_item=[];
                    }
                    
                    //insert new item
                    $file = fopen("news_data.txt", "a") or die("Unable to open file!");
                    fwrite($file, $item['txt']);
                    fclose($file);
                    $item_count++;
                }
            }
        }
    }
    
    function create_indexing($last_length,$mem_item){
        if($this->pair=="A"){
            $this->pair="B";
        }else{
            $this->pair="A";
        }
        
        $filename="tier_{$this->level}_{$this->pair}.txt";
        $this->current_indexing[$this->level][]=$this->pair;
        
        $length=0;
        if(!empty($mem_item)){
            $bag_of_word=[];
            foreach($mem_item as $k=>$v){
                if(!empty($mem_item[$k-1]['length'])){
                    $last_length+=$mem_item[$k-1]['length']+17;
                }
                $bag_of_word[$last_length]=str_word_count($v['txt'],2);
            }
        }
        
        $rs=[];$count_key=0;
        foreach($bag_of_word as $k=>$v){
            foreach($v as $vv){
                //one charater continue
                if(strlen($vv)==1){
                    continue;
                }
                
                $lastPos = 0;
                $positions = [];
                while (($lastPos = strpos($mem_item[$count_key]['txt'], $vv, $lastPos))!== false) {
                    $positions[] = $lastPos;
                    $lastPos = $lastPos + strlen($vv);
                }
                
                if(!empty($positions)){
                    foreach($positions as $vvv){
                        $rs[$vv][]=$k;
                        $rs[$vv]=array_unique($rs[$vv]);
                    }
                }
            }
            $count_key++;
        }
        
        $file = fopen($filename, "w") or die("Unable to open file!");
        fwrite($file, json_encode($rs,JSON_PRETTY_PRINT));
        fclose($file);
        
        //merge indexing
        foreach($this->current_indexing as $k=>$v){
            if(count($v)==2){
                $this->merge_indexing($k);
                unset($this->current_indexing[$k]);
                $this->level=1;
                
                if(empty($this->current_indexing[1])){
                    $this->pair="B";
                }else{
                    $this->pair="A";
                }
                
                if(empty($this->current_indexing[$k+1])){
                    $this->current_indexing[$k+1][]="A";
                }else{
                    $this->current_indexing[$k+1][]="B";
                }
            }
            
        }
        
        return $last_length+$mem_item[2]['length']+17;
    }
    
    
    function merge_indexing($level){
        $tier_A=json_decode(file_get_contents("tier_{$level}_A.txt"),true);
        $tier_B=json_decode(file_get_contents("tier_{$level}_B.txt"),true);
        
        $tier_new=[];
        if(!empty($tier_A)){
            foreach($tier_A as $k=>$v){
                foreach($v as $vv){
                    $tier_new[$k][]=$vv;
                }
            }
        }
        if(!empty($tier_B)){
            foreach($tier_B as $k=>$v){
                foreach($v as $vv){
                    $tier_new[$k][]=$vv;
                }
            }
        }
        
        unlink("tier_{$level}_A.txt");
        unlink("tier_{$level}_B.txt");
        
        $level++;
        if(empty($this->current_indexing[$level])){
            $filename="tier_{$level}_A.txt";
        }else{
            $filename="tier_{$level}_B.txt";
        }
        
        $file = fopen($filename, "w") or die("Unable to open file!");
        fwrite($file, json_encode($tier_new,JSON_PRETTY_PRINT));
        fclose($file);
    }
    
    function init_bloom_filter($rs_files){
        //caculate totally keys
        $this->bloom_key=0;
        foreach($rs_files as $v){
            $tmp_files = file_get_contents($v);
            $rs_xml = json_decode(json_encode(simplexml_load_string($tmp_files)),true);
            $rs_items = $rs_xml['channel']['item'];
            foreach($rs_items as $kk=>$vv){
                $this->bloom_key++;
            }
        }
        //init bloom filter size
        //for a 1% error rate, need abiyt 9.6/key * bloom_key
        $this->n=intval($this->bloom_key*19.6);
        $this->hash_size=7;
        $this->bloom_filter=[];
        $this->a=$this->generate_prime_number();
        $this->b=$this->generate_prime_number();
    }
    
    function check_bloom_filter($title,$hash){
        $key=intval(hexdec($hash)/pow(10,25));
        
        //hash all the function
        for($i=0;$i<$this->hash_size;$i++){
            $hash_func[]=$this->my_bcmod( (($this->a * $key) + $this->b) , $this->n );
        }
        
        $check=false;
        foreach($hash_func as $v){
            if(empty($this->bloom_filter[$v])){
                $check=true;
            }
        }
        
        if(!empty($check)){
            foreach($hash_func as $v){
                $this->bloom_filter[$v]=true;
            }
        }else{
            echo "{$title} ---- was previously seen\n";
            return false;
        }
        
        return true;
    }
    
    function generate_prime_number(){
        do{
            $random_number = mt_rand(0, $this->n);
        }while(!$this->is_prime($random_number));
        
        return $random_number;
    }
    
    //check prime number
    function is_prime($n){for($i=$n;--$i&&$n%$i;);return$i==1;}
    
    function mod($num, $a)
    {
        // Initialize result
        $res = 0;
        
        // One by one process
        // all digits of 'num'
        for ($i = 0; $i < $r = strlen($num); $i++)
            $res = ($res * 10 +
                $num[$i] - '0') % $a;
                
                return $res;
    } 
    
    function my_bcmod( $x, $y )
    {
        $take = 10;
        $mod = '';
        do
        {
            $a = (int)$mod.substr( $x, 0, $take );
            $x = substr( $x, $take );
            $mod = $a % $y;
        }
        while ( strlen($x) );
        return (int)$mod;
    } 
    
    function create_item($vv){
        //format json_obj
        $json_obj=json_encode($vv);
        
        //length
        $rs['length']=strlen($json_obj);
        $hex_json_obj=str_pad(dechex($rs['length']), 8, '0', STR_PAD_LEFT);
        $length="";
        foreach(str_split($hex_json_obj) as $k=>$v){
            if($k%2==0){
                $tmp="";
                $tmp.=$v;
            }else{
                $tmp.=$v;
                $length.=str_pad(hexdec($tmp), 3, '0', STR_PAD_LEFT)." ";
                //echo "{$tmp} ======== {$k} ========= {$length}\n";
            }
        }
        
        $rs['txt']=$length.$json_obj."\n";
        
        return $rs;
    }
    
    function query($some_query){
        if(empty($some_query)){
            echo "please enter the query\n";
            exit;
        }
        $terms=str_word_count($some_query,2);
        $indexing_file=file_get_contents("news_data.txt");
        
        $rs_files=$this->get_all_files(".","txt");
        $rs_key=[];
        if(!empty($rs_files)){
            foreach($rs_files as $v){
                if($v=="./news_data.txt"){
                    continue;
                }
                
                $file=json_decode(file_get_contents($v),true);
                foreach($terms as $vv){
                    if(!empty($file[$vv])){
                        if(empty($rs_key[$vv])){
                            $rs_key[$vv]=$file[$vv];
                        }else{
                            $rs_key[$vv]=array_merge($rs_key[$vv],$file[$vv]);
                        }
                    }
                }
            }
        }
        
        $rs=[];
        if(!empty($rs_key)){
            foreach($rs_key as $k=>$v){
                
                foreach($v as $vv){
                    $position=substr($indexing_file,$vv-16,16);
                    $position_array=explode(" ",$position);
                    unset($position_array[4]);
                    $end="";
                    foreach($position_array as $v){
                        $end.=dechex($v);
                    }
                    $end=hexdec($end);
                    if(!empty(json_decode(substr($indexing_file,$vv,$end),true))){
                        $rs[]=json_decode(substr($indexing_file,$vv,$end),true);
                    }
                }
            }
        }
        
        //sort
        usort($rs, function($a, $b) {
            return $b['timestamp'] <=> $a['timestamp'];
        });
        
        debug::D($rs);
    }
}



$command=empty($argv[1])?"":$argv[1];
$parameter=empty($argv[2])?"":$argv[2];
$obj = new BloomLogInvertNews();
if (method_exists($obj,$command)) {
    $obj -> $command($parameter);
}else{
    echo "please enter 'ingest' or 'query'\n";
}



































