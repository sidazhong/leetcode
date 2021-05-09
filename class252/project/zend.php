<?php 
/*
function test1(){
    $a = "test";
    return "test";
}
*/

function test2(){
    if ($x){
        $a = [1,2];
    } else{
        $a = [1,3];
    }
    return $a[0];
}

// php -d opcache.optimization_level=-1 -d opcache.opt_debug_level=0x20000 zend.php
