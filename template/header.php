<?php
session_start();

function item_type_links($category, $id_category) {
    $item_type_links = '';
    foreach ($category as $key => $value) {
        $item_type_links .= '<a href="?page=items&category=' . $id_category
                . '&type=' . $value[0] . '">' . $value[1] . '</a><br>';
    }
    return $item_type_links;
}

;
$sql_zenski = 'SELECT `id_type_item`, `type`FROM `type_item` '
        . 'INNER JOIN `category_item` ON `type_item`.`id_category_item`=`category_item`.`id_category_item` '
        . 'WHERE `category_item`.`category` = ' . "'Zene'";
$sql_muski = 'SELECT `id_type_item`, `type`FROM `type_item` '
        . 'INNER JOIN `category_item` ON `type_item`.`id_category_item`=`category_item`.`id_category_item` '
        . 'WHERE `category_item`.`category` = ' . "'Muskarci'";
$sql_deca = 'SELECT `id_type_item`, `type`FROM `type_item` '
        . 'INNER JOIN `category_item` ON `type_item`.`id_category_item`=`category_item`.`id_category_item` '
        . 'WHERE `category_item`.`category` = ' . "'Deca'";
$zenski1 = mysqli_query($link, $sql_zenski);
$muski1 = mysqli_query($link, $sql_muski);
$deca1 = mysqli_query($link, $sql_deca);
$zenski = mysqli_fetch_all($zenski1);
$muski = mysqli_fetch_all($muski1);
$deca = mysqli_fetch_all($deca1);
?>
<html>
    <head>
        <?php if (isset($_GET['page']) && $_GET['page'] == 'panel'): ?>
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
            <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.css">
            <script src="https://cdnjs.cloudflare.com/ajax/libs/raphael/2.2.7/raphael.min.js"></script>
            <script src="<?= DJS?>morris.min.js"></script>
            <link rel="stylesheet" href="<?= DCSS ?>morris.css">
        <?php endif; ?>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="<?= DJS?>jquery.cookie.js"></script>
        <script src= "<?= DJS ?>script.js" ></script>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.2/css/all.css" integrity="sha384-/rXc/GQVaYpyDdyxK+ecHPVYJSN9bmVFBvjA/9eOB+pb3F2w2N6fc5qB9Ew5yIns" crossorigin="anonymous">
        <link rel="stylesheet" href="<?= DCSS ?>style.css">
        <title>Diamond fashion</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0" charset="utf8" >

    </head>	
    <body>
        <?php include_once(DINCLUDES . 'login_line.php'); ?>
        <header>
            <div class="logo">
                <a href="./"><img src="<?= DIMAGES ?>logo2.png"></a>
            </div>
            <div class="padajuceliste">
                <div class="dropdown zene">
                    <span>Žene</span>
                    <div class="sadrzajliste">
                        <?php echo item_type_links($zenski, 1) ?>
                    </div>
                </div> 
                <div class="dropdown muskarci">
                    <span>Muškarci</span>
                    <div class="sadrzajliste">
                        <?php echo item_type_links($muski, 2) ?>
                    </div>
                </div> 
                <div class="dropdown deca">
                    <span>Deca</span>
                    <div class="sadrzajliste">
                        <?php echo item_type_links($deca, 3) ?>
                    </div>
                </div> 
            </div>
        </header>
        <div class="search">
            <form method="post" action="?page=items">
                <button type="submit" >Trazi</button>
                <input type="text" placeholder="Pretrazi.." name="search" >
            </form>
        </div>