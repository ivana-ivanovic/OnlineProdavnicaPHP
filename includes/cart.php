<?php
function print_cart(){
    global $cart, $link;
    echo '<table>';
    $suma = 0;
    foreach($cart AS $k => $v){
        $item_sql = 'SELECT * FROM `item` WHERE `id_item` ='.$k;
        $outcome = mysqli_query($link, $item_sql);
        $item = mysqli_fetch_assoc($outcome);
        foreach($v AS $k1 => $v1){
            $tr = '<tr><td><img src="'.DIMAGES.$item['image'].'"></td>'
                   .'<td><p>Velicina: '.$k1.' </p><p>Kolicina: '.$v1.' </p>'
                   .'<p>Cena po kolicini: '.$item['price'].' din</p></td></tr>';  
            echo $tr;
            $suma+= ($v1*$item['price']);
        }
    }
    echo '</table>';
    echo '<p class="suma"><b>Ukupno: '.$suma.'</b></p>';
    if (isset($_SESSION['logged']))
        echo '<form method="post"><button name="place_order" type="submit" value="true"><b>Naruci</b></button></form>';
    else echo '<p class="suma"><b>Ulogujte se da bi ste narucili.</b></p>';
}
function make_order(){
    global $err, $link, $cart;
    $suma = 0;
    foreach($cart AS $k => $v){
        $item_sql = 'SELECT * FROM `item` WHERE `id_item` ='.$k;
        $outcome = mysqli_query($link, $item_sql);
        $item = mysqli_fetch_assoc($outcome);
        foreach ($v AS $k1 => $v1) {
            $suma += ($v1 * $item['price']);
        }
    }
    $sql = 'INSERT INTO `orders`( `for_payment`, `id_user`) '
            .'VALUES ('.$suma.','.$_SESSION['logged'].')';
    //echo $sql;
    if(mysqli_query($link, $sql) === FALSE) 
            $err[] = 'Greska pravljenje racuna: '. $link->error.'<br>';
}
function fill_order(){
    global $err, $link, $cart;
    $sql = 'SELECT MAX(`id_orders`)AS `id_orders` FROM `orders` ';
    $outcome = mysqli_query($link, $sql);
    $id_order = mysqli_fetch_assoc($outcome);
    $amount_on_orders = 0;
    $price_on_orders = 0;
    foreach($cart AS $k => $v){
        $item_sql = 'SELECT * FROM `item` WHERE `id_item` ='.$k;
        $outcome = mysqli_query($link, $item_sql);
        $item = mysqli_fetch_assoc($outcome);
        foreach ($v AS $k1 => $v1) {
            $amount_on_orders += $v1;
        }
        $price_on_orders += ($amount_on_orders * $item['price'] );
        $sql =' INSERT INTO `orders_item` ( `id_orders`, `id_item`, `amount_on_orders`, `price_on_orders`)'
                .' VALUES ( '.$id_order['id_orders'].', '.$k.', '.$amount_on_orders.', '.$price_on_orders.' )';
        if(mysqli_query($link, $sql) === FALSE) $err[] = 'Greska popunjavanja racuna: '. $link->error.'<br>';
        $amount_on_orders = 0;
        $price_on_orders = 0;
    }
}
function delete_items(){
    global $err, $link, $cart, $message;
    $sql1 = '';
    foreach($cart AS $k => $v){
        foreach($v AS $k1 => $v1){
            $sql ="SELECT `id_item_size`, `on_stock` FROM `item_size` "
                 ."INNER JOIN `size` ON `item_size`.`id_size` = `size`.`id_size` "
                 ."WHERE `size` = '".$k1."' AND `id_item` = ".$k;
            $outcome = mysqli_query($link, $sql);
            $item = mysqli_fetch_assoc($outcome);
            if($item['on_stock'] == 0){ $err[] = 'Trenutno nemamo artikal sa sifrom '.$k.'.<br>';}
            else {
                if ($v1 > $item['on_stock']) {
                    $message[] = 'Naruceno ' . $item['on_stock'] . ' artikla sifre: ' . $k . ' velicine: ' . $k1;
                    $item['on_stock'] = 0;
                } else {
                    $item['on_stock'] = $item['on_stock'] - $v1;
                }
            }
            $sql1 ='UPDATE `item_size` SET `on_stock`= '.$item['on_stock']
                 .' WHERE `id_item_size`= '.$item['id_item_size'];
            //echo $sql1;
            mysqli_query($link, $sql1);     
        }
    }
}
$err = [];
$message = [];
if(isset($_COOKIE['cart'])){
    $cart = [];
    $cart = unserialize($_COOKIE['cart']);
}
if(isset($_POST['place_order'])&& $_POST['place_order'] == true && isset($_COOKIE['cart'])){
    delete_items();
    if($err) {
        echo 'Narucite ponovo. <br>';        
    }else {
        make_order();
        fill_order();
    }
    setcookie('cart',"", time() - 3600);
    if($err){
        echo 'Status: <br>';
        foreach ($err as $e) echo $e.'<br>';
    }else
        echo'Narucili ste majce   <a href="./" >Vrati se na pocetnu.</a><br>';
    $err = null;    
}
?>
<cart>
    <div id="thanks_cart_order" style="display: none;">
        <img src="<?php echo DIMAGES."thanks_for_order.jpg"; ?>">
    </div>
    <?php if(isset($_COOKIE['cart'])):?>
        <?php print_cart(); ?>
    <?php else:?>
        <p>Korpa je prazna.</p>
    <?php endif;?>
</cart>