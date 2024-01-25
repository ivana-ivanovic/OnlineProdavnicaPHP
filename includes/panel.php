<?php
include_once(DINCLUDES . 'functions_panel.php');
$err = [];

if (isset($_SESSION['admin']) && $_SESSION['admin'] == 'admin') {
    $sql_colors = 'SELECT `color` FROM `color` ';
    $colors = mysqli_fetch_all(mysqli_query($link, $sql_colors));
    $sql_category_item = 'SELECT `category` FROM `category_item`';
    $category_item = mysqli_fetch_all(mysqli_query($link, $sql_category_item));
    if (isset($_POST['id_user_change']) && is_numeric($_POST['id_user_change']) && $_POST['id_user_change'] > 0) {
        $type = '';
        $id = $_POST['id_user_change'];
        $users_sql = 'SELECT `id_user`,`firstname`,`lastname`,`username`,`email`,`type` FROM `user` ';
        $outcome = mysqli_query($link, $users_sql);
        if ($link->error === TRUE)
            $err[] = 'Greska: ' . $link->error . '<br>';
        $users = mysqli_fetch_all($outcome);
        foreach ($users as $key => $value) {
            if ($value[0] == $id) {
                if ($value[5] == 'admin')
                    $type = 'user';
                if ($value[5] == 'user')
                    $type = 'admin';
                $sql = "UPDATE `user` SET `type`= '$type' WHERE `id_user` = $id";
                $outcome = mysqli_query($link, $sql);
                if ($link->error === TRUE) {
                    $err[] = 'Greska: ' . $link->error . '<br>';
                }
            }
        }
    }
    if (isset($_POST['id_orders_delete']) && $_POST['id_orders_delete'] > 0) {
        delete_order($_POST['id_orders_delete']);
    }
    if (isset($_POST['id_item_update']) && isset($_POST['item_size']) && isset($_POST['item_to_stock']) && $_POST['item_to_stock'] > 0) {
        $sql = "UPDATE `item_size` INNER JOIN `size` ON `item_size`.`id_size` = `size`.`id_size`"
                . " SET `on_stock`= " . $_POST['item_to_stock'] . " WHERE `id_item` = " . $_POST['id_item_update']
                . " AND `size` = '" . $_POST['item_size'] . "' ";
        mysqli_query($link, $sql);
        if ($link->error === TRUE)
            $err[] = 'Greska: ' . $link->error . '<br>';
    }
    if (isset($_POST['item_name']) && isset($_POST['item_price']) && isset($_POST['item_color']) && isset($_POST['item_description']) && isset($_FILES['item_image']) && $_FILES['item_image']['size'] !== 0 && isset($_POST['item_type']) && isset($_POST['item_category'])) {
        $item_name = htmlspecialchars_decode($_POST['item_name']);
        $item_price = htmlspecialchars_decode($_POST['item_price']);
        $item_color = htmlspecialchars_decode($_POST['item_color']);
        $item_description = htmlspecialchars_decode($_POST['item_description']);
        $item_category = htmlspecialchars_decode($_POST['item_category']);
        $item_type = htmlspecialchars_decode($_POST['item_type']);
        $select_id_color = "SELECT `id_color` FROM `color` WHERE `color` = '$item_color'";
        $outcome = mysqli_query($link, $select_id_color);
        $id_color = mysqli_fetch_assoc($outcome);
        $select_id_category = "SELECT `id_category_item` FROM `category_item` WHERE `category` = '$item_category'";
        $id_category = mysqli_fetch_assoc(mysqli_query($link, $select_id_category));
        $select_id_type = "SELECT `id_type_item` FROM `type_item` WHERE `type`='$item_type' AND `id_category_item` =" . $id_category['id_category_item'];
        echo $select_id_type;
        $id_type = mysqli_fetch_assoc(mysqli_query($link, $select_id_type));
        $insert_item_sql = "INSERT INTO `item`( `name`, `price`, `id_color`, `description`, `id_category_item`, `id_type_item`) "
                . "VALUES ( '$item_name' , $item_price , " . $id_color['id_color'] . " , '$item_description'," . $id_category['id_category_item'] . " , " . $id_type['id_type_item'] . " )";
        if ($link->query($insert_item_sql) === TRUE)
            $last_id = $link->insert_id;
        else
            $err[] = 'Greska: ' . $link->error . '<br>';
        move_image($last_id);
        $size_sql = 'SELECT `id_size` FROM `size`';
        $outcome = mysqli_query($link, $size_sql);
        $size = mysqli_fetch_all($outcome);
        foreach ($size as $key => $value) {
            $update_size_sql = "INSERT INTO `item_size`( `id_item`, `id_size`) VALUES ( $last_id , $value[0])";
            mysqli_query($link, $update_size_sql);
        }
    }
    if (isset($_POST['delete_item']) && is_numeric($_POST['delete_item'])) {
        delete_item($_POST['delete_item']);
    }
    if (isset($_POST['sale_name']) && isset($_FILES['sale_image']) && $_FILES['sale_image']['size'] !== 0 && isset($_POST['sale_description']) && isset($_POST['id_item_sale'])) {
        $sale_name = htmlspecialchars_decode($_POST['sale_name']);
        $sale_rescription = htmlspecialchars_decode($_POST['sale_description']);
        $id_item_sale = $_POST['id_item_sale'];
        $insert_sale_sql = "INSERT INTO `sale`(`name`, `description`, `active`) VALUES ( '$sale_name' , '$sale_rescription' , '1' )";
        mysqli_query($link, $insert_sale_sql);
        $id_sale = $link->insert_id;
        move_image_sale($id_sale);
        $update_item_sale_sql = '';
        foreach ($id_item_sale as $value) {
            $update_item_sale_sql = "UPDATE `item` SET `id_sale`= $id_sale  WHERE `id_item` = $value";
            mysqli_query($link, $update_item_sale_sql);
        }
    }
    if (isset($_POST['id_sale_change']) && is_numeric($_POST['id_sale_change']) && $_POST['id_sale_change'] > 0) {
        $active = '';
        $id = $_POST['id_sale_change'];
        $sale_sql = 'SELECT `id_sale`,`active` FROM `sale` WHERE `id_sale` = ' . $id;
        $sale = mysqli_fetch_assoc(mysqli_query($link, $sale_sql));
        if ($sale['active'] == '1')
            $active = '0';
        if ($sale['active'] == '0')
            $active = '1';
        $sql = "UPDATE `sale` SET `active`= '$active' WHERE `id_sale` = $id";
        $outcome = mysqli_query($link, $sql);
    }
    if (isset($_POST['id_item']) && is_numeric($_POST['id_item']) && $_POST['id_item'] > 0 && isset($_POST['new_price'])) {
        $new_price = $_POST['new_price'];
        $id_item = $_POST['id_item'];
        $update_item_price_sql = "UPDATE `item` SET `price`= $new_price WHERE `id_item` = $id_item";
        mysqli_query($link, $update_item_price_sql);
    }
}
?>

<?php if (isset($_SESSION['admin']) && $_SESSION['admin'] == 'admin'): ?>
    <div class="container">
        <ul class="nav nav-tabs">
            <li><a href="?page=panel&panel_part=home" >Izmena artikla</a></li>
            <li><a href="?page=panel&panel_part=menu4" >Akcije</a></li>    
            <li style="border-left: 1px solid rgb(167, 0, 4);"><a href="?page=panel&panel_part=menu2"  >Brisanje i pregled narudzbuna</a></li>
            <li><a href="?page=panel&panel_part=menu3">Pregled stanja</a></li>
            <li style="border-left: 1px solid rgb(167, 0, 4);"><a href="?page=panel&panel_part=menu1" >Promena tipa korisnika</a></li>
            <li style="border-left: 1px solid rgb(167, 0, 4);"><a href="?page=panel&panel_part=menu5" >Analiza proizvoda</a></li>
            <li id="menu61" ><a href="?page=panel&panel_part=menu6" >Analiza prodaje</a></li>
        </ul>

        <div class="tab-content">
            <div id="home" class="tab-pane">
                <h3><u>Izmena artikla</u></h3>
                <div>
                    <form class="item-change-align" method="post"  enctype="multipart/form-data">
                        <h5><b>Dodavanje novog artikla</b></h5>
                        Unesite naziv artikla: <input type="text" name="item_name" value="<?= $_POST['item_name'] ?? '' ?>">
                        Unesite cenu artikla: <input type="text" name="item_price" value="<?= $_POST['item_price'] ?? '' ?>">
                        Unesite boju artikla: 
                        <input list="color" name="item_color" value="<?= $_POST['item_color'] ?? '' ?>">
                        <datalist id="color"><?php echo datalist_options($colors); ?></datalist>
                        Unesite kategoriju artikla:
                        <input list="category" name="item_category" value="<?= $_POST['item_category'] ?? '' ?>">
                        <datalist id="category"><?php echo datalist_options($category_item); ?></datalist>
                        Unesite tip artikla: 
                        <input list="type" name="item_type" value="<?= $_POST['item_type'] ?? '' ?>">
                        <datalist id="type"></datalist>
                        Unesite sliku artikla: <input type="file" name="item_image" accept="image/png, image/jpeg" >
                        Unesite opis artikla: <textarea class="textarea_add_item" name="item_description"><?php echo $_POST['item_description'] ?? ''; ?></textarea>
                        <button type="submit">Dodaj</button>
                    </form>
                </div>
                <div>
                    <?php update_items(); ?>
                </div>
                <div>
                    <h5><b>Izmena cene artiklu</b></h5>
                    <form class="item-change-align" method="post" >
                        Unesite sifru artikla:
                        <input type="text" name="id_item" value="<?= $_POST['id_item'] ?? '' ?>">
                        Unesite novu cenu artikla:
                        <input type="text" name="new_price" value="<?= $_POST['new_price'] ?? '' ?>">
                        <button type="submit">Promeni</button>
                    </form>
                </div>
            </div>
            <div id="menu1" class="tab-pane"  >
                <h3><u>Promena tipa korisnika</u></h3>
    <?php $i = change_user_type(); ?>
                <form method="post">
                    <p>Unesite ID korisnika kome zelite da promenite tip:</p>
                    <input type="text" name="id_user_change">
                    <button type="submit">Promeni</button>
                </form>
            </div>
            <div id="menu2" class="tab-pane" >
                <h3><u>Brisanje i pregled narudzbina</u></h3>
                <h5>Spisak narudzbina</h5>
    <?php view_orders(); ?> 
            </div>
            <div id="menu3" class="tab-pane"  >
                <h3><u>Pregled stanja</u></h3>
                <h5>Trenutno stanje u magacinu</h5>
    <?php on_stock(); ?>      
            </div>
            <div id="menu4" class="tab-pane" >
                <h3><u>Izmena akcija</u></h3>
                <div>        
                    <h5><b>Aktiviraj/Deaktiviraj akciju</b></h5>
    <?php change_sale_active(); ?>
                    <form method="post">
                        <p>Unesite ID akcije koju zelite da aktivirate/deaktivirate:</p>
                        <input type="text" name="id_sale_change">
                        <button type="submit">Promeni</button>
                    </form>
                </div>  
                <div>
                    <form class="item-change-align"  method="post"  enctype="multipart/form-data">
                        <h5><b>Dodavanje nove akcije</b></h5>
                        Unesite naziv akcije: <input type="text" name="sale_name" value="<?= $_POST['sale_name'] ?? '' ?>">
                        Unesite sliku akcije: <input type="file" name="sale_image" accept="image/png, image/jpeg" >
                        Unesite opis akcije: <textarea class="textarea_add_item" name="sale_description"><?php echo $_POST['sale_description'] ?? ''; ?></textarea>
                        <h5>Spisak artikla</h5>
                    <?php chose_items_table(); ?>
                        <button type="submit">Dodaj</button>
                    </form>
                </div>
            </div>
            <div id="menu5" class="tab-pane">
                <h3><u>Analiza proizvoda</u></h3>
                <div>
                    <h5><b>Najprodavaniji artikli:</b></h5>
    <?php best_sellers_items_table(); ?>
                </div>
                <div>
                    <h5><b>Preporuka za akciju:</b></h5>
    <?php worst_sellers_items_table(); ?>
                </div>
                <div>
                    <h5><b>Najposeceniji artikli:</b></h5> 
    <?php most_watched_items_table(); ?>
                </div>
            </div>
            <div id="menu6" class="tab-pane">
                <h3><u>Analiza prodaje</u></h3>
                <table><tr><td style="text-align: left;">
                            <h5><b>Prikaz prodaje po vremenu:</b></h5>
                            <form class="item-change-align">
                                Od datuma: <input type="date"  name="from_date" value="2020-10-15" style="display: inline;">
                                Do datuma: <input type="date"  name="to_date" value="2020-11-19" style="display: inline;">
                                <button type="submit" id="graph1" style="display: inline;">Prikazi</button>   
                            </form>
                            <div id="graph11" style="width: 800px;"></div>
                        </td>
                        <td>
                            <h5><b>Prikaz prodaje po kategoriji artikla:</b></h5>
                            <div id="graph22"></div>
                            <div id='graph22_data'></div>
                        </td>
                    </tr><tr>
                        <td style="text-align: left;">
                            <h5><b>Prikaz prodaje po vremenu raščlanjeno po kategoriji:</b></h5>
                            <form class="item-change-align">
                                Od datuma: <input type="date"  name="from_date1" value="2020-10-15" style="display: inline;">
                                Do datuma: <input type="date"  name="to_date1" value="2020-11-19" style="display: inline;">
                                <button type="submit" id="graph3" style="display: inline;">Prikazi</button>   
                            </form>
                            <div id="graph33" style="width: 800px;"></div>
                        </td>
                    </tr>
                </table>      
            </div>
        </div>
    </div>
<?php endif; ?>