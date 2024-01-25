<?php
define('DINCLUDES', 'includes/');
include(DINCLUDES.'config.php');
include_once(DINCLUDES.'functions_panel.php');
include_once(DINCLUDES.'mysql.php');
$category_item_sql='SELECT `category_item`.`category` , SUM(`price_on_orders`) FROM `category_item` INNER JOIN `item`'
    .'ON `category_item`.`id_category_item` = `item`.`id_category_item` INNER JOIN `orders_item`' 
    .'ON `item`.`id_item` = `orders_item`.`id_item` GROUP BY `category_item`.`category`';
$category_item = mysqli_fetch_all(mysqli_query($link, $category_item_sql));
$data = [];
$i=0;
foreach ($category_item as $key => $value) {
    $data[] =  array(
            'label' => $value[0],
            'value' => $value[1]
        );
}
echo json_encode($data);
