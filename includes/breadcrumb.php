
<?php 
$page = $_GET['page'] ?? '';
$f='';
if ($page == 'item'){
    $i = $_GET['i'];
    $item_sql = 'SELECT * FROM `item` WHERE `id_item` ='.$i;
    $item = mysqli_fetch_assoc(mysqli_query($link, $item_sql));
    $category_item_sql = 'SELECT `category` FROM `category_item`  '
            .'WHERE `id_category_item` = '.$item['id_category_item'];
    $category_item = mysqli_fetch_assoc(mysqli_query($link, $category_item_sql));
    $type_item_sql = 'SELECT `type` FROM `type_item` WHERE `id_type_item` = '.$item['id_type_item'];
    $type_item = mysqli_fetch_assoc(mysqli_query($link, $type_item_sql));
    $f='<li><a href="?page=items&category='.$item['id_category_item'].'&type='.$item['id_type_item'].'">'
            .$category_item['category'].' /</a></li><li>'.$type_item['type'].'</li>';
}
if ($page == 'items'){
    if(isset($_GET['category']) && isset($_GET['type']) 
            && is_numeric($_GET['category']) && is_numeric($_GET['type'])) {
        $category_item_sql = 'SELECT `category` FROM `category_item`  '
                .'WHERE `id_category_item` = '.$_GET['category'];
        $category_item = mysqli_fetch_assoc(mysqli_query($link, $category_item_sql));
        $type_item_sql = 'SELECT `type` FROM `type_item` WHERE `id_type_item` = '.$_GET['type'];
        $type_item = mysqli_fetch_assoc(mysqli_query($link, $type_item_sql));
        $f='<li>'.$category_item['category'].' /</li><li>'.$type_item['type'].'</li>';
    }else if(isset($_POST['search']) && $_POST['search'] !== '' ) {
        $f = '<li>Pretraga</li>';
    }else if (isset($_GET['sale']) && is_numeric($_GET['sale'])) {
        $sale_sql = 'SELECT  `name` FROM `sale` WHERE `id_sale` = '.$_GET['sale'];
        $sale = mysqli_fetch_assoc(mysqli_query($link, $sale_sql));
        $f = '<li>Akcija /</li><li>'.$sale['name'].'</li>';
    }else {
        $f = '';
    }
}
switch ($page) {

	case 'item' :
		$b = $f;
		break;
	case 'items' :
		$b = $f;
		break;
	case 'contact' :
		$b = '<li>Kontakt</li>';
		break;
	case 'register' :
		$b = '<li>Registracija</li>';
		break;
	case 'login' :
		$b = '<li>Uloguj se</li>';
		break;
	case 'cart' :
		$b = '<li>Korpa</li>';
		break;
        case 'panel' :
		$b = '<li>Administrativni panel</li>';
		break;
	default:
                $b = '';
		break;
} 
?>
<div class="breadcrumb" >
    <ul>
        <li><a href="./">Početna  /</a></li>
        <?php echo $b?>

    </ul> 
</div>