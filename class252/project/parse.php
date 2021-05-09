<?php
$time_start = microtime(true);

$json = file_get_contents("100mb.json");
$obj = json_decode($json);
var_dump (gettype($obj));

$time_end = microtime(true);
echo memory_get_usage(true);
echo "\n";
echo $time_end - $time_start;
echo "\n";