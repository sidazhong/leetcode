<?php
require_once 'debug.php';
class Cluster extends debug{
    
    public $some_number=0;
    public $word_of_bag=[];
    public $term_of_skipgram=[];
    public $term_of_frequency=[];
    public $top_frequency=[];
    public $stop_list=[];
    
    //php Cluster.php txt 6 "the and in as of a to are is for have it"
    function __construct($some_folder,$some_number,$stop_list){
        if(empty($some_folder) || empty($some_number) || empty($stop_list)){
            echo "please enter the parameters\n";
            exit;
        }
        $this->some_number=$some_number;
        
        //get all txt files
        $rs_files=$this->get_all_files($some_folder,'txt');
        
        $msgbody="";
        if(!empty($rs_files)){
            foreach($rs_files as $v){
                $msgbody.= file_get_contents($v);
            }
        }
        
        $this->word_of_bag=str_word_count(strtolower($msgbody),2);
        if(empty($this->word_of_bag)){
            echo "empty txt files\n";
        }
        
        
        $this->stop_list=explode(" ",$stop_list);
        for($i=0;$i<2;$i++){
            array_unshift($this->word_of_bag,"*");
            array_push($this->word_of_bag,"*");
        }
    }
    
    function start(){
        foreach($this->word_of_bag as $k=>$v){
            if($k<=3){
                continue;
            }
            
            /*
            foreach($this->word_of_bag as $kk=>$vv){
                if($kk<$k){
                    continue;
                }
                for($i=4;$i>=0;$i--){
                    $skipgram=$this->word_of_bag[$kk-$i];
                    if($skipgram!=$v){
                        $this->term_of_skipgram[$v][$kk][]=$this->word_of_bag[$kk-$i];
                    }
                }
                if($kk>$k+1){
                    break;
                }
            }
            */
            
            $this->term_of_skipgram[$v][]=[
                $this->word_of_bag[$k-2],
                $this->word_of_bag[$k-1],
                "_",
                $this->word_of_bag[$k+1],
                $this->word_of_bag[$k+2],
            ];
            
            //term frequency
            if(empty($this->term_of_frequency[$v])){
                $this->term_of_frequency[$v]=1;
            }else{
                $this->term_of_frequency[$v]++;
            }
            if($k+3==count($this->word_of_bag)){
                break;
            }
        }
        
        asort($this->term_of_frequency);
        $count_term_of_frequency=count($this->term_of_frequency);
        for($i=1;$i<=$count_term_of_frequency;$i++){
            end($this->term_of_frequency);        
            $key = key($this->term_of_frequency);
            array_pop($this->term_of_frequency);
            if(!in_array($key, $this->stop_list) && $this->some_number > 0){
                $this->top_frequency[]=$key;
                $this->some_number--;
            }
        }
        
        //sort by distance
        $layer[]=$this->top_frequency;
        $cluster=$this->get_cluster();
        array_multisort(array_column($cluster, 'distance'), SORT_ASC, $cluster);
        
        //sort frequence
        $top_frequency=[];
        foreach($cluster as $k=>$v){
            if(!in_array($v['t1'],$top_frequency)){
                $top_frequency[]=$v['t1'];
            }
            if(!in_array($v['t2'],$top_frequency)){
                $top_frequency[]=$v['t2'];
            }
        }
        
        //start to merge
        $tmp_layer=$layer[0];
        $t1_key=array_search($cluster[0]['t1'],$tmp_layer);
        $t2_key=array_search($cluster[0]['t2'],$tmp_layer);
        unset($tmp_layer[$t1_key]);
        unset($tmp_layer[$t2_key]);
        $layer[1]=array_merge([$cluster[0]['t1']."_".$cluster[0]['t2']],$tmp_layer);
        
        $tmp_layer=$layer[1];
        foreach($tmp_layer as $k=>$v){
            if(!empty($tmp_layer[1])){
                $merge_value=$tmp_layer[0]."_".$tmp_layer[1];
                unset($tmp_layer[0]);
                unset($tmp_layer[1]);
                array_unshift($tmp_layer,$merge_value);
                $layer[$k+2]=$tmp_layer;
            }
        }
        
        krsort($layer);
        debug::d($layer);
        exit;
    }
    
    //Define the distance between two terms t1 and t2 to be:
    //1 - [ 2*(the total number of skipgrams they share) / (the total number of skipgrams t1 is in + the total number of skipgrams t2 is in) ].
    //1 - (  2 * ($skipgrams_share / ($skipgrams_t1 + $skipgrams_t2)) )
    function get_cluster(){
        $cluster=[];
        foreach($this->top_frequency as $k=>$v){
            foreach($this->top_frequency as $kk=>$vv){
                if($kk<=$k){
                    continue;
                }
                
                
                $t1=$this->term_of_skipgram[$v];
                $t2=$this->term_of_skipgram[$vv];
                //sort
                /*
                 foreach($this->term_of_skipgram[$v] as $kkk=>$vvv){
                 sort($vvv);
                 $t1[$kkk]=$vvv;
                 }
                 foreach($this->term_of_skipgram[$vv] as $kkk=>$vvv){
                 sort($vvv);
                 $t2[$kkk]=$vvv;
                 }
                 */
                
                $skipgrams_share=0;
                foreach($t1 as $vvv){
                    if(in_array($vvv, $t2)){
                        $skipgrams_share++;
                    }
                }
                
                $skipgrams_t1=count($t1);
                $skipgrams_t2=count($t2);
                $distance=1-(2*$skipgrams_share/($skipgrams_t1+$skipgrams_t2));
                $cluster[]=["t1"=>$v,"t2"=>$vv,'distance'=>$distance];
                
                /*
                 if($v=='cat' && $vv=='dogs'){
                 debug::D($v."___".$vv);
                 debug::d($t1);
                 debug::d($t2);
                 debug::D($skipgrams_share);
                 debug::D($skipgrams_t1);
                 debug::D($skipgrams_t2);
                 $distance= 1-(2*$skipgrams_share/($skipgrams_t1+$skipgrams_t2));
                 debug::d($distance);
                 exit;
                 }
                 */
            }
        }
        return $cluster;
    }
}


$some_folder=empty($argv[1])?"":$argv[1];
$some_number=empty($argv[2])?"":$argv[2];
$stop_list=empty($argv[3])?"":$argv[3];

$obj = new Cluster($some_folder,$some_number,$stop_list);
$obj->start();


































