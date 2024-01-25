<?php
define('DINCLUDES', 'includes/');
include(DINCLUDES.'config.php');
include_once(DINCLUDES.'functions_panel.php');
include_once(DINCLUDES.'mysql.php');
$type_item_sql='SELECT `type` FROM `type_item` INNER JOIN `category_item` '
        .'ON `type_item`.`id_category_item` = `category_item`.`id_category_item`'
        ." WHERE `category_item`.`category`='".$_GET['category']."'";
$type_item = mysqli_fetch_all(mysqli_query($link, $type_item_sql));
echo datalist_options($type_item);