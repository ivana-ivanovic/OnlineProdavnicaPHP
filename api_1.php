<?php
define('DINCLUDES', 'includes/');
include(DINCLUDES.'config.php');
include_once(DINCLUDES.'functions_panel.php');
include_once(DINCLUDES.'mysql.php');
$from_date = $_GET['from_date'];
$to_date = $_GET['to_date'];
$day_table_sql = "SELECT DISTINCT `date` , SUM(`for_payment`) AS `for_date` FROM `orders` WHERE `date` BETWEEN '$from_date' AND '$to_date' GROUP BY `date` ORDER BY `date` ";
$day_table= mysqli_fetch_all(mysqli_query($link, $day_table_sql));
$datetime1 = strtotime($from_date.' 00:00:00 GMT');
$datetime2 = strtotime($to_date.' 23:59:59 GMT');
$secs = $datetime2 - $datetime1;
$days = $secs / 86400;
$from_date_ar= date_parse($from_date);
$day = (int)$from_date_ar['day'];
$month = (int)$from_date_ar['month'];
$year = (int)$from_date_ar['year'];
//echo $days;


$to_date_ar= date_parse($to_date);
$data = [];

for ($index = 0; $index < $days; $index++) {
    $sale = 0;
    foreach ($day_table as $key => $value) {
        $day_table_ar = date_parse($value[0]);
        if ($day===$day_table_ar['day'] && $month===$day_table_ar['month'] 
                && $year===$day_table_ar['year']) {$sale = (int)$value[1]; break;}
        else { $sale = 0;}
    }
    //echo $sale.'<br>';
    $data[] =  array(
            'day' => $day.'-'.$month.'-'.$year,
            'sales' => $sale
        );
     //echo $day.'<br>' ;
     switch ($day) {
        case 31:
            if ($month == 1 || $month == 3 || $month == 5 
                    || $month == 7 || $month == 8 || $month == 10 
                    || $month == 12 ) {
                $day = 1; 
                if($month==12) { $year++; $month=1;}
                else $month++;
            }
            break;
        case 30:
            if ($month == 4 || $month == 6 || $month == 9 
                    || $month == 11) {
                $day = 1;
                $month++;
            }else  {$day++;}
            break;
        case 29:
            if($month == 2){
                $day = 1;
                $month++;
            }else {$day++;}
            break;
        case 28:
            if($month == 2) {
                if ($year%400 == 0)	$day++; 
                else if (( $year%100 != 0) && ($year%4 == 0))$day++; 
                else {
                    $day = 1;
                    $month++; }
            }else {$day++; }
            break;
        default:
            $day++;
            break;   
    }   
}
   //print_r($data);
echo json_encode($data);