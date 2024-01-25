<?php

define('DINCLUDES', 'includes/');
define('DTEMPLATE', 'template/');
define('DPUBLIC', 'public/');
define('DCSS', DPUBLIC.'css/');
define('DIMAGES', DPUBLIC.'images/');
define('DJS', DPUBLIC.'js/');

include(DINCLUDES.'config.php');
include(DINCLUDES.'mysql.php');

$page = $_GET['page'] ?? '';

switch ($page) {
	case '' :
		$page = "home";
	case 'home' :
	case 'item' :
	case 'items' :
	case 'contact' :
	case 'register' :
	case 'login' :
	case 'cart' :
    case 'panel' :
		$pozovi = "$page.php";
		if (!file_exists(DINCLUDES.$pozovi))
			$pozovi = 'greska404.php';
		break;
	default:
		$pozovi = 'greska404.php';
		break;
} 
include_once(DTEMPLATE.'header.php');
if (!($page == 'home'))
	include_once(DINCLUDES.'breadcrumb.php');

include_once(DINCLUDES.$pozovi);
include_once(DTEMPLATE.'footer.php');

@mysqli_close($link);

?>