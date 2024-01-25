<?php
function delete_item($id) {
    global $err, $link;
    $image_sql = 'SELECT `image` FROM `item` WHERE `id_item` ='.$id;
    $outcome = mysqli_query($link, $image_sql);
    $image = mysqli_fetch_assoc($outcome);
    $url_image = DIMAGES.$image['image'];
    $delete_item_sql = 'DELETE FROM `item` WHERE `id_item` ='.$id;
    if(!mysqli_query($link, $delete_item_sql)) {
        $err[] = 'Greska: Ne mozete obrisati artikal koji se nalazi na porudzbini.'
                .' Morate prvo obrisati porudzbinu.<br>';
    }
    if(!$err){
        unlink($url_image);
        header('location: ./?page=panel');
    }else {
        foreach ($err as $value) { echo $value; }
    }
    
}
function move_image($id_image) {
    global $link;
    $item_picture_err = [];
    if (!is_array($_FILES) || empty($_FILES))
        return false;
    extract($_FILES['item_image']);
    if ($error !== 0) {
        switch ($item_picture_err) {
                case UPLOAD_ERR_INI_SIZE:
                case UPLOAD_ERR_FORM_SIZE:
                        $item_picture_err[] = 'Veličina fajla je veća od dozvoljene.';
                        break;
                case UPLOAD_ERR_PARTIAL:
                        $item_picture_err[] = 'Fajl je samo delimično preuzet.';
                        break;
                case UPLOAD_ERR_NO_FILE:
                        $item_picture_err[] = 'Fajl nije preuzet.';
                        break;
                case UPLOAD_ERR_NO_TMP_DIR:
                case UPLOAD_ERR_CANT_WRITE:
                        $item_picture_err[] = 'Greška na serveru.';
                        break;
                case UPLOAD_ERR_EXTENSION:
                        break;
        }
        return false;
    }
    $name = "zm$id_image.jpg";
    move_uploaded_file($tmp_name, DIMAGES . $name);  
    $update_item_image_sql= "UPDATE `item` SET `image`='$name' WHERE `id_item` = $id_image";
    mysqli_query($link, $update_item_image_sql);
}
function delete_order($id_order) {
    global $err, $link;
    $sql = 'DELETE FROM `orders` WHERE `id_orders`= '.$id_order;
    $outcome = mysqli_query($link, $sql);
    if($link->error === TRUE) 
        $err[] = 'Greska: '. $link->error.'<br>';
    header('location: ./?page=panel');
}
function update_items(){
    global $err, $link;
    $items_sql = 'SELECT `id_item`,`name`,`price`,`color`,`image` FROM `item` '
            .'INNER JOIN `color` ON `item`.`id_color` = `color`.`id_color` ORDER BY `id_item`';
    $outcome = mysqli_query($link, $items_sql);
    if($link->error === TRUE) 
        $err[] = 'Greska: '. $link->error.'<br>';
    $items = mysqli_fetch_all($outcome);
    $table = '<table>';
    $table .= '<tr><td></td><td><b>SIFRA</b></td><td><b>NAZIV</b></td><td><b>CENA</b></td><td><b>BOJA</b></td>'
            .'<td><b>NA ZALIHAMA</b></td><td><b>IZMENI</b></td><td></td></tr>';
    $table .= '<form method = "post">';
    foreach ($items as $key => $value){
        $on_stock_item_sql = 'SELECT `size`.`size`, `on_stock` FROM `item_size` INNER JOIN `size` '
                .'ON `item_size`.`id_size` = `size`.`id_size` WHERE `id_item` = '.$value[0];
        $outcome = mysqli_query($link, $on_stock_item_sql);
        $on_stock_item = mysqli_fetch_all($outcome);
        $on_stock_by_size = '<table><tr>';
        foreach ($on_stock_item as $key1 => $value1) {
            $on_stock_by_size .= '<td>'.$value1[0].':'.$value1[1].'';
            if ($key1 == 2){$on_stock_by_size .= '</tr><tr>';}
        }
        $on_stock_by_size .= '</tr></table>';
        $table .= '<tr><td class="image2x3"><img src="'.DIMAGES.$value[4].'"></td><td>'.$value[0].'</td><td>'.$value[1].'</td><td>'
                .$value[2].'</td><td>'.$value[3].'</td><td>'.$on_stock_by_size.'</td><td><input type="radio" name="id_item_update" value="'.$value[0].'"></td>'
                .'<td><button name="delete_item" type="submit" value="'.$value[0].'">Obrisi</button></td></tr>';
    }
    
    $size_sql = 'SELECT `size` FROM `size`';
    $outcome = mysqli_query($link, $size_sql);
    if($link->error === TRUE) 
        $err[] = 'Greska: '. $link->error.'<br>';
    $size = mysqli_fetch_all($outcome);
    $input_size = '<p style="text-align:left;">Unesite kolicinu:</p><input type="number" name="item_to_stock" >'
            .'<p style="text-align:left;">Unesite velicinu:</p><input list="size" name="item_size"><datalist id="size">';
    foreach ($size as $key => $value) $input_size .='<option value="'.$value[0].'">';
    $table .= '<tr><td colspan="6">'.$input_size.'</datalist></td></tr>';
    $table .= '<tr><td colspan="6"><button type="submit">Izmeni zalihe</button></td></tr>';
    $table .= '</form>';
    $table .= '</table>';
    echo '<h5><b>Promena kolicine i brisanje artikla</b></h5>';
    echo '<h5>Spisak artikala</h5>';
    echo $table.'<br>';
    }
function on_stock(){
    global $err, $link;
    $size = [];
    $items_sql = 'SELECT `id_item`, `name`, `price`, `color` '
            .'FROM `item` INNER JOIN `color` '
            .'ON `color`.`id_color` = `item`.`id_color` ORDER BY `id_item`';
    $outcome = mysqli_query($link, $items_sql);
    if($link->error === TRUE) 
        $err[] = 'Greska: '. $link->error.'<br>';
    $items = mysqli_fetch_all($outcome);
    $table = '<table>';
    $table .= '<tr><td><b>SIFRA</b></td><td><b>NAZIV</b></td><td><b>CENA</b></td><td><b>BOJA</b></td><td><b>U MAGACINU</b></td></tr>';
    foreach ($items as $key => $value) {
        $on_stock_item_sql = 'SELECT SUM(`on_stock`) AS `sum` '
                .'FROM `item_size` WHERE `id_item` ='.$value[0];
        $outcome = mysqli_query($link, $on_stock_item_sql);
        $on_stock_item = mysqli_fetch_assoc($outcome);
        $table .= '<tr><td>'.$value[0].'</td><td>'.$value[1].'</td><td>'
                .$value[2].'</td><td>'.$value[3].'</td><td>'.$on_stock_item['sum'].'</td></tr>';
    }
    $table .= '</table>';
    echo $table;    
}
function view_orders() {
    global $err, $link;
    $orders_sql = 'SELECT `id_orders`, `for_payment`, `firstname`, `lastname` '
            .' FROM `orders` INNER JOIN `user` ON `user`.`id_user` = `orders`.`id_user` ';
    $outcome = mysqli_query($link, $orders_sql);
    if($link->error === TRUE) 
        $err[] = 'Greska: '. $link->error.'<br>';
    $orders = mysqli_fetch_all($outcome);
    $table = '<table>';
    $table .= '<form method="post">';
    $table .= '<tr><td><b>BROJ RACUNA</b></td><td><b>IME</b></td><td><b>PREZIME</b></td><td><b>ZA NAPLATU</b></td><td><b>OBRISI</b></td></tr>';
    foreach ($orders as $key => $value){
        $table .= '<tr class = "order_margin"><td><b>'.$value[0].'</b></td><td><b>'.$value[2].'</b></td><td><b>'.$value[3].'</b></td><td><b>'
                .$value[1].'</b></td><td><input type="radio" name="id_orders_delete" value="'.$value[0].'"></td></tr>';
        $table .= '<tr><td>SIFRA ARTIKLA</td><td>NAZIV</td><td>KOLICINA</td><td>CENA NA RACUNU</td></tr>';
        $orders_item_sql = 'SELECT `orders_item`.`id_item`,`name`,`amount_on_orders`, `price_on_orders` '
                .'FROM `orders_item` INNER JOIN `orders` ON `orders_item`.`id_orders` = `orders`.`id_orders` '
                .'INNER JOIN `item` ON `orders_item`.`id_item` = `item`.`id_item` WHERE `orders_item`.`id_orders` ='.$value[0];
        $outcome = mysqli_query($link, $orders_item_sql);
        if($link->error === TRUE) 
            $err = 'Greska: '. $link->error.'<br>';
        $orders_item = mysqli_fetch_all($outcome);
        foreach ($orders_item as $key1 => $value1) {
            $table .= '<tr><td>'.$value1[0].'</td><td>'.$value1[1].'</td><td>'.$value1[2].'</td><td>'.$value1[3].'</td></tr>';
        }
    }
    $table .= '<tr><td colspan="5"><button type="submit">Obrisi</button></td></tr>';
    $table .= '</form>';
    $table .= '</table>';
    echo $table;
    
}
function change_user_type() {
    global $err, $link;
    $users_sql = 'SELECT `id_user`,`firstname`,`lastname`,`username`,`email`,`type` FROM `user` ';
    $outcome = mysqli_query($link, $users_sql);
    if($link->error === TRUE) 
            $err[] = 'Greska: '. $link->error.'<br>';
    $users = mysqli_fetch_all($outcome);
    $table = '<table>';
    $table .= '<tr><td><b>ID</b></td><td><b>IME</b></td><td><b>PREZIME</b></td><td><b>USERNAME</b></td><td><b>EMAIL</b></td><td><b>TIP</b></td></tr>';
    foreach ($users as $key => $value) {
        $table .= '<tr><td>'.$value[0].'</td><td>'.$value[1].'</td><td>'.$value[2].'</td><td>'.$value[3].'</td><td>'.$value[4].'</td><td>'.$value[5].'</td></tr>';
    }
    $table .= '</table>';
    echo '<h5><b>Spisak korisnika</b></h5>';
    echo $table.'<br>';  
    return $users;  
}
function datalist_options($list){
    $datalist_options='';
    foreach ($list as $key => $value)
        $datalist_options.= '<option value="'.$value[0].'">';
    return $datalist_options;
}
function change_sale_active() {
    global $link;
    $sale_sql = 'SELECT * FROM `sale` ';
    $sale = mysqli_fetch_all(mysqli_query($link, $sale_sql));
    $table = '<table>';
    $table .= '<tr><td><b>SIFRA</b></td><td><b>SLIKA</b></td><td><b>IME</b></td><td><b>AKTIVNA</b></td></tr>';
    foreach ($sale as $key => $value) 
        $table .= '<tr><td>'.$value[0].'</td><td><img src="'.DIMAGES.$value[3].'"  style = "height: 30px;" ></td><td>'.$value[1].'</td><td>'.$value[4].'</td></tr>';
    $table .= '</table>';
    echo '<h5>Spisak akcija</h5>';
    echo $table.'<br>';  
    //return $sale;  
}
function chose_items_table(){
    global $link;
    $items_sql = 'SELECT `id_item`,`name`,`price`,`image` FROM `item` ';
    $items = mysqli_fetch_all(mysqli_query($link, $items_sql));
    $table = '<table>';
    $table .= '<tr><td><b>SIFRA</b></td><td><b>SLIKA</b></td><td><b>NAZIV</b></td><td><b>CENA</b></td>'
            .'<td><b>UBACI U<br>AKCIJU</b></td></tr>';
    $table .= '<form method = "post">';
    foreach ($items as $key => $value)
        $table .= '<tr><td>'.$value[0].'</td><td class="image2x3"><img src="'.DIMAGES.$value[3].'"></td><td>'.$value[1].'</td><td>'.$value[2].'</td><td>'
                .'<input type="checkbox" name="id_item_sale[]" value="'.$value[0].'"></td></tr>';
    $table .= '</table>';
    echo $table;
}
function move_image_sale($id_image) {
    global $link;
    $item_picture_err = [];
    if (!is_array($_FILES) || empty($_FILES))
        return false;
    extract($_FILES['sale_image']);
    if ($error !== 0) {
        switch ($item_picture_err) {
                case UPLOAD_ERR_INI_SIZE:
                case UPLOAD_ERR_FORM_SIZE:
                        $item_picture_err[] = 'Veličina fajla je veća od dozvoljene.';
                        break;
                case UPLOAD_ERR_PARTIAL:
                        $item_picture_err[] = 'Fajl je samo delimično preuzet.';
                        break;
                case UPLOAD_ERR_NO_FILE:
                        $item_picture_err[] = 'Fajl nije preuzet.';
                        break;
                case UPLOAD_ERR_NO_TMP_DIR:
                case UPLOAD_ERR_CANT_WRITE:
                        $item_picture_err[] = 'Greška na serveru.';
                        break;
                case UPLOAD_ERR_EXTENSION:
                        break;
        }
        return false;
    }
    $name = $id_image."sale.jpg";
    move_uploaded_file($tmp_name, DIMAGES . $name);  
    $update_item_image_sql= "UPDATE `sale` SET `image`='$name' WHERE `id_sale` = $id_image";
    mysqli_query($link, $update_item_image_sql);
}
function best_sellers_items_table(){
    global $link;
    if (isset($_GET['best_sellers_page'])){
        $page = (int) $_GET['best_sellers_page'];
        $from = ($page-1) * 10 + 1;
        $items_sql = 'SELECT DISTINCT `id_item`, SUM(`price_on_orders`) AS `total`, SUM(`amount_on_orders`) AS `amounts`'
                .' FROM `orders_item` GROUP BY `id_item` ORDER BY `amounts` DESC LIMIT 10 OFFSET '.$from ;
        } else {
        $items_sql = 'SELECT DISTINCT `id_item`, SUM(`price_on_orders`) AS `total`, SUM(`amount_on_orders`) AS `amounts`'
                .' FROM `orders_item` GROUP BY `id_item` ORDER BY `amounts` DESC LIMIT 10 ' ;
    }
    
    $items = mysqli_fetch_all(mysqli_query($link, $items_sql));
    $table = '<table>';
    $table .= '<tr><td><b>SIFRA</b></td><td><b>SLIKA</b></td><td><b>NAZIV</b></td><td><b>CENA</b></td>'
            .'<td><b>PRODATO<br>PO KOMADU</b></td><td><b>UKUPNO DIN</b></td></tr>';
    $table .= '<form method = "post">';
    foreach ($items as $key => $value){
        $item_sql = 'SELECT `id_item`,`name`,`price`,`image`  FROM `item` WHERE `id_item` = '.$value[0];
        $item = mysqli_fetch_assoc(mysqli_query($link, $item_sql));
        $table .= '<tr><td>'.$item['id_item'].'</td><td class="image2x3"><img src="'.DIMAGES.$item['image'].'"></td><td>'.$item['name']
                .'</td><td>'.$item['price'].'</td><td>'.$value[2].'</td><td>'.$value[1].'</td></tr>';
    }
    $number_of_items_sql = 'SELECT COUNT(DISTINCT `id_item`) AS `items_count` FROM `orders_item`';
    $number_of_items = mysqli_fetch_assoc(mysqli_query($link, $number_of_items_sql));
    $number_of_pages = ceil($number_of_items['items_count'] / 10);
    $table .= '<tr><td  colspan="6" >';
    for ($index = 1; $index <= $number_of_pages; $index++) {
        $table .= '<a href="?page=panel&panel_part=menu5&best_sellers_page='.$index.'">'.$index.'</a>';
    }
    $table .= '</td></tr>';
    $table .= '</table>';  
    echo $table;
}
function worst_sellers_items_table(){
    global $link;
    if (isset($_GET['worst_sellers_page'])){
        $page = (int) $_GET['worst_sellers_page'];
        $from = ($page-1) * 10 + 1;
        $items_sql = 'SELECT `id_item`, `name`, `price`, `image`'
        .'FROM `item` WHERE `id_item` NOT IN ('
        .'SELECT DISTINCT `id_item` FROM `orders_item`) LIMIT 10 OFFSET '.$from ;
    } else {
        $items_sql = 'SELECT `id_item`, `name`, `price`, `image`'
        .'FROM `item` WHERE `id_item` NOT IN ('
        .'SELECT DISTINCT `id_item` FROM `orders_item`) LIMIT 10 ' ;
    }
//    $items_sql = 'SELECT `id_item`, `name`, `price`, `image`'
//        .'FROM `item` WHERE `id_item` NOT IN ('
//        .'SELECT DISTINCT `id_item` FROM `orders_item`)';
    $items = mysqli_fetch_all(mysqli_query($link, $items_sql));
    $table = '<table>';
    $table .= '<tr><td><b>SIFRA</b></td><td><b>SLIKA</b></td><td><b>NAZIV</b></td><td><b>CENA</b></td></tr>';
    foreach ($items as $key => $value)
        $table .= '<tr><td>'.$value[0].'</td><td class="image2x3"><img src="'
            .DIMAGES.$value[3].'"></td><td>'.$value[1].'</td><td>'.$value[2].'</td></tr>';
    $number_of_items_sql = 'SELECT COUNT(DISTINCT `id_item`) AS `items_count` '
            .'FROM `item` WHERE `id_item` NOT IN ('
            .'SELECT DISTINCT `id_item` FROM `orders_item`)';
    $number_of_items = mysqli_fetch_assoc(mysqli_query($link, $number_of_items_sql));
    $number_of_pages = ceil($number_of_items['items_count'] / 10);
    $table .= '<tr><td colspan="4">';
    for ($index = 1; $index <= $number_of_pages; $index++) {
        $table .= '<a href="?page=panel&panel_part=menu5&worst_sellers_page='.$index.'">'.$index.'</a>';
    }
    $table .= '</td></tr>';
    $table .= '</table>';
    echo $table;
}
function most_watched_items_table(){
    global $link;
    if (isset($_GET['most_watched_page'])){
        $page = (int) $_GET['most_watched_page'];
        $from = ($page-1) * 10 + 1;
        $items_sql = 'SELECT DISTINCT `id_item`, COUNT(`id_session`) AS `total` FROM `session` GROUP BY `id_item` ORDER BY `total` DESC LIMIT 10 OFFSET '.$from ;
    } else {
        $items_sql = 'SELECT DISTINCT `id_item`, COUNT(`id_session`) AS `total` FROM `session` GROUP BY `id_item` ORDER BY `total` DESC LIMIT 10 ' ;
    }
    
    //$items_sql = 'SELECT DISTINCT `id_item`, COUNT(`id_session`) AS `total` FROM `session` GROUP BY `id_item` ORDER BY `total` DESC ';
    $items = mysqli_fetch_all(mysqli_query($link, $items_sql));
    $table = '<table>';
    $table .= '<tr><td><b>SIFRA</b></td><td><b>SLIKA</b></td><td><b>NAZIV</b></td><td><b>CENA</b></td>'
            .'<td><b>UKUPNO<br>PREGLEDA</b></td></tr>';
    $table .= '<form method = "post">';
    foreach ($items as $key => $value){
        $item_sql = 'SELECT `id_item`,`name`,`price`,`image`  FROM `item` WHERE `id_item` = '.$value[0];
        $item = mysqli_fetch_assoc(mysqli_query($link, $item_sql));
        $table .= '<tr><td>'.$item['id_item'].'</td><td class="image2x3"><img src="'.DIMAGES.$item['image'].'"></td><td>'.$item['name']
                .'</td><td>'.$item['price'].'</td><td>'.$value[1].'</td></tr>';
    }
    $number_of_items_sql = 'SELECT COUNT(DISTINCT `id_item`) AS `items_count`  FROM `session`';
    $number_of_items = mysqli_fetch_assoc(mysqli_query($link, $number_of_items_sql));
    $number_of_pages = ceil($number_of_items['items_count'] / 10);
    $table .= '<tr><td colspan="5">';
    for ($index = 1; $index <= $number_of_pages; $index++) {
        $table .= '<a href="?page=panel&panel_part=menu5&most_watched_page='.$index.'">'.$index.'</a>';
    }
    $table .= '</td></tr>';
    $table .= '</table>';
    echo $table;
}
?>
