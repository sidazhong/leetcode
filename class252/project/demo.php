<?php 
//动态参数
/*
$a="1";
$a++;
var_dump($a);
echo "=====================================================\n";
exit;
*/

/*
//===
var_dump("test" == true);
var_dump("test" == 0);
var_dump(0 == true);
var_dump(0 == false);
echo "=====================================================\n";
exit;
*/

/*
//all empty
var_dump(empty($aa));
var_dump(empty(""));
var_dump(empty(0));
var_dump(empty(NULL));
var_dump(empty(false));
echo "=====================================================\n";
exit;
*/

/*
//引用可能发生的混乱
$list = ['a', 'b', 'c'];
foreach ($list as &$value){
    $value = strtoupper($value);
}
var_dump($list);
//$value="";
foreach ($list as $value){
    var_dump($value);
}
echo "=====================================================\n";
exit;
*/

/*
//函数命名混乱
strpos();
str_replace();

strtotime();
nl2br();

substr();       //subtract a string
strrev();       //Reverses a string
echo "=====================================================\n";
exit;
*/


//magic empty
interface base1{
    public function set();
}
class base2 {
    public $test;
}
class Regular extends base2 implements base1{
    public function __construct() {
        $this->set();
    }
    public function set(){
        $this->test="1";
    }
}
$regular = new Regular();
var_dump($regular->test);    // string(4) "value"

class Magic{
    private $test = '1';
    public function __get($key){
        return $this->$key;
    }
}
$magic = new Magic();
var_dump($magic->test);      // string(4) "value"

var_dump(empty($regular->test));
var_dump(empty($magic->test));
echo "=====================================================\n";
exit;
?>



























