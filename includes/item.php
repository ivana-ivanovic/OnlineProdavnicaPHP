<?php 
function add_session(){
    global $link;
    $sql = '';
    if (isset($_SESSION['logged']) && is_numeric($_SESSION['logged']) ){
        $sql = "INSERT INTO `session`(`session_id_number`, `id_user`, `id_item`, `browser`, `ip_address` ) VALUES ('"
                .$_COOKIE['PHPSESSID']."', ".$_SESSION['logged'].",".$_GET['i'].", '"
                .$_SERVER['HTTP_USER_AGENT']."', '".$_SERVER['REMOTE_ADDR']."')";
        
    }else {
        $sql = "INSERT INTO `session`(`session_id_number`, `id_item`, `browser`, `ip_address` ) VALUES ('"
                .$_COOKIE['PHPSESSID']."',".$_GET['i'].", '"
                .$_SERVER['HTTP_USER_AGENT']."', '".$_SERVER['REMOTE_ADDR']."' )";        
    }
    $outcome = mysqli_query($link, $sql);
};
function make_similar($similar){
    global $item ;
    $similar_table = '';
    foreach ($similar as $key => $value) {
            $similar_table .='<div class="card">'.
                 '<a href="?page=item&i='.$value[0].'"><img src="'.DIMAGES.$value[4].'" style="width:5em; height: 8em;  margin: 0px"></a>'.
                 '<a href="?page=item&i='.$value[0].'"><p style="margin: 0px; font-size: 12px">'.$value[1].'</p></a>'.
                 '<p class="price" style="margin: 0px;  font-size: 12px">'.$value[2].'.din</p>'.
                 '<a href="?page=item&i='.$value[0].'"><p style="margin: 0px; font-size: 12px">'.$value[3].'</p></a></div>';  
    }   
    return $similar_table;  
};
function last_watch($last_watch){
    global $link;
    $last_watch_table = '';
    foreach ($last_watch as $key => $value) {
        $item_sql = 'SELECT `id_item`, `name`, `price`,  `description`, `image` FROM `item` WHERE `id_item` = '.$value[0];
        //echo $item_sql;
        $item = mysqli_fetch_assoc(mysqli_query($link, $item_sql));
        $last_watch_table .='<div class="card">'.
             '<a href="?page=item&i='.$item['id_item'].'"><img src="'.DIMAGES.$item['image'].'" style="width:5em; height: 8em;  margin: 0px"></a>'.
             '<a href="?page=item&i='.$item['id_item'].'"><p style="margin: 0px; font-size: 12px">'.$item['name'].'</p></a>'.
             '<p class="price" style="margin: 0px;  font-size: 12px">'.$item['price'].'.din</p>'.
             '<a href="?page=item&i='.$item['id_item'].'"><p style="margin: 0px; font-size: 12px">'.$item['description'].'</p></a></div>';  
    }
    return $last_watch_table;
};
function orders_item($orders_item){
    global $link, $i;
    $orders_item_table = '';
    foreach ($orders_item as $key => $value) {
        if($value[0]!== $i){
            $item_sql = 'SELECT `id_item`, `name`, `price`,  `description`, `image` FROM `item` WHERE `id_item` = '.$value[0];
            //echo $item_sql;
            $item = mysqli_fetch_assoc(mysqli_query($link, $item_sql));
            $orders_item_table .='<div class="card">'.
                 '<a href="?page=item&i='.$item['id_item'].'"><img src="'.DIMAGES.$item['image'].'" style="width:5em; height: 8em;  margin: 0px"></a>'.
                 '<a href="?page=item&i='.$item['id_item'].'"><p style="margin: 0px; font-size: 12px">'.$item['name'].'</p></a>'.
                 '<p class="price" style="margin: 0px;  font-size: 12px">'.$item['price'].'.din</p>'.
                 '<a href="?page=item&i='.$item['id_item'].'"><p style="margin: 0px; font-size: 12px">'.$item['description'].'</p></a></div>';  
        }
    }
    return $orders_item_table;
}


$range_similar = 200.00;

$a= $item['price'] - $range_similar;
$b= $item['price'] + $range_similar;
$similar_sql = 'SELECT `id_item`, `name`, `price`,  `description`, `image` FROM `item` WHERE `id_category_item` = '.$item['id_category_item'].
                    ' AND `id_type_item` = '.$item['id_type_item'].' AND `price` BETWEEN '.$a.' AND '.$b.' ORDER BY `id_item` LIMIT 5';
$similar = mysqli_fetch_all(mysqli_query($link, $similar_sql));
$last_watch_sql ="SELECT DISTINCT  `id_item`  FROM `session` WHERE `session_id_number` = '".$_COOKIE['PHPSESSID']."' ORDER BY `id_session` DESC LIMIT 5";
$last_watch = mysqli_fetch_all(mysqli_query($link, $last_watch_sql));
$orders_item_sql = "SELECT DISTINCT `id_item` FROM `orders_item` WHERE `id_orders` IN (SELECT DISTINCT `id_orders` FROM `orders_item` WHERE  `id_item`= $i)";
$orders_item = mysqli_fetch_all(mysqli_query($link, $orders_item_sql));
$orders_item_items = orders_item($orders_item);
$similar_items = make_similar($similar);
$last_watch_items = last_watch($last_watch);
add_session();
$cart = [];
if(isset($_POST['size'])){
    extract($_POST);
    if(isset($_COOKIE['cart'])) {
       $cart = unserialize($_COOKIE['cart']);
       if(isset($cart[$i][$size])){
           $cart[$i][$size]++;
        }else {
           $cart[$i][$size]= 1;
        }
       setcookie('cart', serialize($cart), time()+3600, '/');
    }else {
       $cart[$i][$size] = 1;
       //print_r($cart);
       setcookie('cart', serialize($cart), time()+3600, '/');
    } 
}

?>

<div class="majca">
  <table>
    <tbody>
        <tr>
            <td>
              <img id="myImg" src="<?= DIMAGES.$item['image'] ?>">
              <p>Za uvelicani prikaz kliknite na sliku</p>
            </td>
            <td>
              <p>Cena: <?=$item['price'].' din.' ?></p><br>
              <b>Izaberite velicinu:</b><br>
              <form method="post">
                <?php
                    $radiobutton = mysqli_query($link,  'SELECT * FROM `size`');
                    foreach ($radiobutton as $key => $value)
                    echo '<input type="radio" name="size" value="'.$value['size'].'">'.$value['size'].'<br>';
                ?>
                <input type="submit" value="naruči">
              </form>
              <br><br>
              <b>Opis proizvoda:</b>
              <div class="opisproizvoda">
                <p><?=$item['description'] ?></p>
              </div>
            </td>
        </tr>
    </tbody>
  </table>
   <div class="similar">
       <table><tr><td><b>Slicni proizvodi:</b></td><td><b>Poslednje pregledano:</b></td></tr>
           <tr><td><?=$similar_items?></td><td><?=$last_watch_items?></td></tr>
           <tr><td  colspan="2" ><b>Drugi su kulipi i ovo:</b></td></tr>
           <tr><td colspan="2"><?=$orders_item_items?></td></tr></table>
   </div>
 </div>