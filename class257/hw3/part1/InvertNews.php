<?php
require_once 'debug.php';
class InvertNews extends debug{
    
    function ingest($some_folder){
        if(empty($some_folder)){
            echo "please enter the folder name\n";
            exit;
        }
        
        if(!is_dir($some_folder)){
            echo "folder not exsist\n";
            exit;
        }
        
        $rs_files=$this->get_all_files($some_folder);
        if(empty($rs_files)){
            echo "no rss files \n";
            exit;
        }
        
        $check_timestamp=[];
        $bag_of_word=[];
        
        //create feed_items
        foreach($rs_files as $v){
            $tmp_files = file_get_contents($v);
            $rs_xml = json_decode(json_encode(simplexml_load_string($tmp_files)),true);
            $rs_items = $rs_xml['channel']['item'];
            
            //format rss items
            foreach($rs_items as $kk=>$vv){
                if(empty($vv['pubDate'])){
                    continue;
                }
                
                $timestamp = $this->rsstotime($vv['pubDate']);
                if(in_array($timestamp,$check_timestamp)){
                    unset($rs_items[$kk]);
                    continue;
                }
                
                $rs_items[$kk]['timestamp']=$timestamp;
                $check_timestamp[]=$timestamp;
                
                $title_of_word=empty($vv['title'])?[]:str_word_count($vv['title'],2);
                $description_of_word=empty($vv['description'])?[]:str_word_count($vv['description'],2);
                
                $bag_of_word=array_unique($bag_of_word+$title_of_word+$description_of_word);
            }
            $this->obj_feed_items->insertMany($rs_items);
        }
        
        //prepare to insert keys
        $count_term=count($bag_of_word);
        $time=5;
        echo "feed_items is finished.\n"."ready to create inverted file in {$time} seconds.\n"."totally terms is {$count_term}.\n\n";
        while($time){
            echo "{$time}\n";
            sleep(1);
            $time--;
        }
        
        //create inverted file
        $map_js=file_get_contents("map.js");
        $reduce_js=file_get_contents("reduce.js");
        foreach($bag_of_word as $v){
            $map = new MongoDB\BSON\Javascript(str_replace('$key',$v,$map_js));
            $reduce = new MongoDB\BSON\Javascript($reduce_js);
            $out = ['inline' => 1];
            
            $rs_mapReduce = $this->obj_feed_items->mapReduce($map, $reduce, $out);
            foreach($rs_mapReduce as $vv){
                $fields=[
                    "term"=>$vv->_id,
                    "postings"=>[],
                ];
                foreach($vv->value as $vvv){
                    $fields['postings'][]=$vvv;
                }
                $count_term--;
            }
            
            //decent timestamp order 
            //rsort($fields["postings"]);
            
            $this->obj_inverted_file->insertOne($fields);
            echo "totally terms left: {$count_term}, insert term '{$vv->_id}'\n";
        }
        
        echo "inverted file is finished\n\n";
    }
    
    function query($some_query){
        if(empty($some_query)){
            echo "please enter the query\n";
            exit;
        }
        $terms=str_word_count($some_query,2);

        
        //get timestamp from inverted_file
        foreach($terms as $v){
            $or_inverted_file[]=['term'=>$v];
        }
        $rs_inverted_file=$this->obj_inverted_file->find(['$or'=>$or_inverted_file],['sort'=>["timestamp"=>-1]]);
        if(!empty($rs_inverted_file)){
            foreach($rs_inverted_file as $v){
                foreach($v->postings as $vv){
                    $rs[$vv]=[];
                }
            }
        }
        if(empty($rs)){
            echo "no such key word in documents\n";
            exit;
        }
        
        //get document from feed_items
        foreach($rs as $k=>$v){
            $or_feed_items[]=['timestamp'=>$k];
        }
        $rs_feed_items=$this->obj_feed_items->find(['$or'=>$or_feed_items],['sort'=>["timestamp"=>-1]]);
        foreach($rs_feed_items as $v){
            $items=json_decode(json_encode($v), true);
            foreach($items as $kk=>$vv){
                $rs[$items['timestamp']][$kk]=$vv;
            }
        }

        krsort($rs);
        debug::d($rs);
    }
    
}


$command=empty($argv[1])?"":$argv[1];
$parameter=empty($argv[2])?"":$argv[2];
$obj = new InvertNews();
if (method_exists($obj,$command)) {
    $obj -> $command($parameter);
}else{
    echo "please enter 'ingest' or 'query'\n";
}


















