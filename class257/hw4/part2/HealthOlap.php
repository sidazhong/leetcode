<?php
require_once 'debug.php';
class HealthOlap extends debug{
    
    
//SELECT workout_type,'start-year','start-month', avg(duration) as avg 
//FROM `WORK_OUT` where workout_type="swim" 
//group by workout_type,'start-year','start-month' with ROLLUP                     

//SELECT workout_type,'start-year','start-month', avg(duration) as avg
//FROM `WORK_OUT` where workout_type="swim"
//group by ROLLUP (workout_type,'start-year','start-month')

    //please change the username and password
    function __construct($region,$workout_type,$date){
        $servername = "127.0.0.1";
        $username = "root";
        $password = '';
        $dbname = "EXERCISE";
        
        $this->db_EXERCISE = new mysqli($servername, $username, $password,$dbname);
        if ($this->db_EXERCISE->connect_error) {
            echo "Please change the username and password on line 17,18\n";
            exit;
        }
        
        
        $this->where=[];
        if(!empty($region)){
            $region=explode(":",$region);
            foreach($region as $k=>$v){
                
                $region_point=explode("-",$v);
                if($k==0){
                    $this->min_longitude=$region_point[0];
                    $this->min_latitude=$region_point[1];
                }else{
                    $this->max_longitude=$region_point[0];
                    $this->max_latitude=$region_point[1];
                }
            }
            
            $this->where['region_where']="(longitude>{$this->min_longitude} AND longitude<{$this->max_longitude}) AND (latitude>{$this->min_latitude} AND latitude<{$this->max_latitude})";                
        }
        
        if(!empty($workout_type)){
            $this->where['workout_type']="workout_type='{$workout_type}'";
        }
        
        if(!empty($date)){
            $date=explode("-",$date);
            foreach($date as $k=>$v){
                if($k==0)   $this->year=$v;
                if($k==1)   $this->month=$v;
                if($k==2)   $this->day=$v;
            }
            if(!empty($this->year)) $this->where['year']="start-year = {$this->year}";
            if(!empty($this->month)) $this->where['month']="start-month = {$this->month}";
            if(!empty($this->day)) $this->where['day']="start-day = {$this->day}";
        }
        
        $this->query_where="";
        if(!empty($this->where)){
            $count=0;
            foreach($this->where as $k=>$v){
                if($count==0){
                    $this->query_where.="{$v} ";
                }else{
                    $this->query_where.=" AND {$v}";
                }
                $count++;
            }
        }
    }
    
    
    function start(){
        $sql = "SELECT workout_type,start-year,start-month,start-day,avg(duration) as avg 
                FROM `WORK_OUT` 
                WHERE {$this->query_where}
                group by workout_type,start-year,start-month,start-day with ROLLUP   
        ";
        
        $sql=str_replace("start-year", "`start-year`", $sql);
        $sql=str_replace("start-month", "`start-month`", $sql);
        $sql=str_replace("start-day", "`start-day`", $sql);
        
        $rs_query = $this->db_EXERCISE->query($sql);
        
        $rs=[];
        if ($rs_query->num_rows > 0) {
            while($v = $rs_query->fetch_assoc()) {
                $rs[]=$v;
            }
        }
        
        $row_workout_type=[];
        if(!empty($rs)){
            foreach($rs as $k=>$v){
                $v['workout_type']=str_pad(empty($v['workout_type'])?"NULL":$v['workout_type'], 5, ' ', STR_PAD_RIGHT);
                $v['start-year']=str_pad(empty($v['start-year'])?"NULL":$v['start-year'], 4, ' ', STR_PAD_RIGHT);
                $v['start-month']=str_pad(empty($v['start-month'])?"NULL":$v['start-month'], 4, ' ', STR_PAD_RIGHT);
                $v['start-day']=str_pad(empty($v['start-day'])?"NULL":$v['start-day'], 4, ' ', STR_PAD_RIGHT);
                
                $row_workout_type[$k]="{$v['workout_type']}             {$v['start-year']}            {$v['start-month']}            {$v['start-day']}          {$v['avg']}";
            }
            
            debug::D("workout_type      start-year      start-month     start-day     avg");
            foreach($row_workout_type as $v){
                debug::D($v);
            }
        }else{
            echo "these commands will give a certian result: \n";
            echo "php HealthOlap.php 35.5322-72.691:46.0122-122.3 bike 2020 \n";
            echo "php HealthOlap.php 35.5322-72.691:46.0122-122.3 bike 2021 \n";
            echo "php HealthOlap.php 35.5322-72.691:46.0122-122.3 swim 2020 \n";
            echo "php HealthOlap.php 35.5322-72.691:46.0122-122.3 swim 2021 \n";
        }
        exit;
    }
    
    

}


$region=empty($argv[1])?"":$argv[1];
$workout_type=empty($argv[2])?"":$argv[2];
$date=empty($argv[3])?"":$argv[3];

$obj = new HealthOlap($region,$workout_type,$date);
$obj->start();


































