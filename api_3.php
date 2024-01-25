<?php
define('DINCLUDES', 'includes/');
include(DINCLUDES.'config.php');
include_once(DINCLUDES.'functions_panel.php');
include_once(DINCLUDES.'mysql.php');

$from_date = $_GET['from_date'];
$to_date = $_GET['to_date'];
$day_table_deca_sql = "SELECT DISTINCT `date` , SUM(`price_on_orders`) AS `sum` FROM `orders` "
        ."INNER JOIN `orders_item` ON `orders`.`id_orders` = `orders_item`.`id_orders` "
        ."INNER JOIN `item` ON `item`.`id_item` = `orders_item`.`id_item`"
        ." INNER JOIN `category_item` ON `item`.`id_category_item` = `category_item`.`id_category_item`"
        ." WHERE `category_item`.`category` = 'Deca'"
        ." AND `date` BETWEEN '$from_date' AND '$to_date' GROUP BY `date` ORDER BY `date`  ";
$day_table_zene_sql = "SELECT DISTINCT `date` , SUM(`price_on_orders`) AS `sum` FROM `orders` "
        ."INNER JOIN `orders_item` ON `orders`.`id_orders` = `orders_item`.`id_orders` "
        ."INNER JOIN `item` ON `item`.`id_item` = `orders_item`.`id_item`"
        ." INNER JOIN `category_item` ON `item`.`id_category_item` = `category_item`.`id_category_item`"
        ." WHERE `category_item`.`category` = 'Zene'"
        ." AND `date` BETWEEN '$from_date' AND '$to_date' GROUP BY `date` ORDER BY `date`  ";
$day_table_muskarci_sql = "SELECT DISTINCT `date` , SUM(`price_on_orders`) AS `sum` FROM `orders` "
        ."INNER JOIN `orders_item` ON `orders`.`id_orders` = `orders_item`.`id_orders` "
        ."INNER JOIN `item` ON `item`.`id_item` = `orders_item`.`id_item`"
        ." INNER JOIN `category_item` ON `item`.`id_category_item` = `category_item`.`id_category_item`"
        ." WHERE `category_item`.`category` = 'Muskarci'"
        ." AND `date` BETWEEN '$from_date' AND '$to_date' GROUP BY `date` ORDER BY `date`  ";
$day_table_deca= mysqli_fetch_all(mysqli_query($link, $day_table_deca_sql));
$day_table_zene= mysqli_fetch_all(mysqli_query($link, $day_table_zene_sql));
$day_table_muskarci= mysqli_fetch_all(mysqli_query($link, $day_table_muskarci_sql));
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
    $sale_deca = 0;
    $sale_zene = 0;
    $sale_muskarci = 0;
    foreach ($day_table_deca as $key => $value) {
        $day_table_ar = date_parse($value[0]);
        if ($day===$day_table_ar['day'] && $month===$day_table_ar['month'] 
                && $year===$day_table_ar['year']) {$sale_deca = (int)$value[1]; break;}
        else { $sale_deca = 0;}
    }
    foreach ($day_table_zene as $key => $value) {
        $day_table_ar = date_parse($value[0]);
        if ($day===$day_table_ar['day'] && $month===$day_table_ar['month'] 
                && $year===$day_table_ar['year']) {$sale_zene = (int)$value[1]; break;}
        else { $sale_zene = 0;}
    }
    foreach ($day_table_muskarci as $key => $value) {
        $day_table_ar = date_parse($value[0]);
        if ($day===$day_table_ar['day'] && $month===$day_table_ar['month'] 
                && $year===$day_table_ar['year']) {$sale_muskarci = (int)$value[1]; break;}
        else { $sale_muskarci = 0;}
    }
    //echo $sale.'<br>';
    $data[] =  array(
            'day' => $day.'-'.$month.'-'.$year,
            'sales_deca' => $sale_deca,
            'sales_zene' => $sale_zene,
            'sales_muskarci' => $sale_muskarci,
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
            }else  $day++;
            break;
        case 29:
            if($month == 2){
                $day = 1;
                $month++;
            } {$day++;}
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