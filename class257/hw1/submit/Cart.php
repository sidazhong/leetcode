<?php 
class Shopping{
    function __construct($debug){
        //connect DB shopping
        $this->obj_shopping = new db_conn("shopping");
        
        if(!empty($debug)){
            if($debug=='clear'){
                $this->drop_cart();
                echo "all table removed\n";
                return;
            }
        }else{
            echo "command: 'php Cart.php clear' will removed all the tables.\n\n";
        }
        
        //check table cart
        $this->check_xml_cart();
        
        //insert cart
        $this->insert_cart();
        
        //select 'sida' cart items, and all items price is bewteen between $5 and $15.
        $this->select_cart();
    }
    
    function select_cart(){
        $query_select_cart = "SELECT xpath('company/shopping_cart[@user=\"sida\"]/item[price>5 and price < 15]', company) FROM cart;";                                
        $rs_select_cart = $this->obj_shopping->exec($query_select_cart);
        
        echo "select 'sida' cart items, and all items price is bewteen between $5 and $15.\n";
        debug::d($rs_select_cart);
    }
    
    function check_xml_cart(){
        //check table
        $query_check_cart = "select table_name FROM information_schema.tables WHERE table_name = 'cart';";
        $rs_check_cart = $this->obj_shopping->exec($query_check_cart);
        //create table
        if(empty($rs_check_cart)){
            $query_create_cart = 'CREATE TABLE IF NOT EXISTS cart(ID INT NOT NULL PRIMARY KEY,company XML);';
            $this->obj_shopping->exec($query_create_cart);
            
            echo "table cart created \n\n";
        }
    }
    
    function insert_cart(){
        //get all cart*.xml
        $rs_xml_files = $this->get_all_files();
        if(!empty($rs_xml_files)){
            foreach($rs_xml_files as $k=>$v){
                $rs_xml = $this->format_xml_file(file_get_contents($v));
                $rs_ID = $k+1;
                
                $query_check_cart = "SELECT * FROM cart WHERE ID = {$rs_ID}";
                $check_cart = $this->obj_shopping->exec($query_check_cart);
                if(empty($check_cart)){
                    $query_insert_cart = "INSERT INTO cart (ID,company)VALUES({$rs_ID},XMLPARSE(CONTENT '{$rs_xml}'));";
                    $this->obj_shopping->exec($query_insert_cart);
                    
                    echo "{$v} finished insert \n";
                }
            }
            
            echo "\n";
        }
    }
    
    function format_xml_file($rs){
        //remove ""
        $rs = str_replace("'", '"', $rs);
        return $rs;
    }
    
    //get all cart*.xml
    function get_all_files(){
        $rs = [];
        if ($handle = opendir('.')) {
            while (false !== ($entry = readdir($handle))) {
                if ($entry != "." && $entry != "..") {
                    $pathinfo = pathinfo($entry);
                    if(strpos($entry, "cart")!==false && $pathinfo['extension']=='xml'){
                        $rs[]=$entry;
                    }
                }
            }
            
            closedir($handle);
        }
        
        return $rs;
    }
    
    //drop all cart tables;
    function drop_cart(){
        $query_drop_cart = "DROP TABLE IF EXISTS company,shopping_cart,item,collection,cart;";
        $rs_drop_cart = $this->obj_shopping->exec($query_drop_cart);
    }
}

echo "\n\n\n==================******==================\n";
$argv[1] = empty($argv[1])?"":$argv[1];
$obj = new Shopping($argv[1]);
echo "==================******==================\n\n\n\n";















/**
 * tools
 * 
 */
class db_conn{
    function __construct($dbname){
        $this->conn = pg_connect("dbname={$dbname}");
    }
    
    function exec($query){
        $rs_query = pg_query($this->conn, $query);
        $rs = pg_fetch_all($rs_query);
        return $rs;
    }
}


class debug{
    static function d($data){
        print_r($data);
    }
}


