<?php
$time_start = microtime(true); 

$a=[];
for($i=0;$i<1000000;$i++){
    array_push($a,['a','b','c','d','e','f','g']);
}

$time_end = microtime(true);
echo (memory_get_usage(true)/1024/1024)." MB";
echo "\n";
echo ($time_end - $time_start)." sec";
echo "\n";




