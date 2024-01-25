<?php
function ispisi_tabelu() {
    global $a, $majca_boja;
    if(isset($_POST['boja'])){ispisi($a);}
    else {ispisi($majca_boja);}
}
function ispisi($a){
    global $link;
    $k=0;
    foreach($a as $b=>$m){
        foreach($m as $m1=>$m2){
            if (($k % 2 == 0) && ($k!=0)){
                    echo '</tr>';
                    echo '<tr>';
            }
            $item_sql = 'SELECT * FROM `item` WHERE `id_item` ='.$m2;
            $outcome = mysqli_query($link, $item_sql);
            $item = mysqli_fetch_assoc($outcome);
            echo '<td><a href="?page=item&i='.$item['id_item'].'"><img src="'.DIMAGES.$item['image'].'"></a><br><p>'.$item['name'].'</p>cena: '.$item['price'].' din.<p></td>';
            $k++;
        }
    }
}
function ispisi_search($search_string){
    global $link;
    $k=0;
    $item_sql = "SELECT * FROM `item` WHERE `name` LIKE '%$search_string%'";
    //echo $item_sql;
    $outcome = mysqli_query($link, $item_sql);
    $items = mysqli_fetch_all($outcome);
    foreach($items as $k=>$v){
        if (($k % 2 == 0) && ($k!=0)){
                echo '</tr>';
                echo '<tr>';
        }
        echo '<td><a href="?page=item&i='.$v[0].'"><img src="'.DIMAGES.$v[5].'"></a><br><p>'.$v[1].'</p>cena: '.$v[2].' din.<p></td>';
        $k++;
    }
}
function ispisi_checkbox() {
    global $a, $link;
    $colors = mysqli_query($link,  'SELECT * FROM `color`');
    $ispisano = false;
    if(isset($_POST['boja'])){
        foreach ($colors as $key1 => $value1) {
            foreach ($a as $key => $value)
                if($key == $value1['id_color']){
                    echo '<input type="checkbox" name="boja[]" value="'.$value1['id_color'].'" checked>'.$value1['color'].'<br>'; 
                    $ispisano = true;
                }
            if($ispisano != true)
                echo '<input type="checkbox" name="boja[]" value="'.$value1['id_color'].'">'.$value1['color'].'<br>';
            $ispisano = false;
        }
    } else {
        foreach ($colors as $key => $value)
        echo '<input type="checkbox" name="boja[]" value="'.$value['id_color'].'">'.$value['color'].'<br>';
    }
}

$majca_boja = [];

if (isset($_COOKIE['majca_boja']) && isset($_POST['boja']) && !isset($_POST['search'])){
    $majca_boja = unserialize($_COOKIE['majca_boja']);
    $a=[];
    for ($i=0;$i<count($_POST['boja']);$i++)
        foreach($majca_boja as $bm=>$majca)
            if ($_POST['boja'][$i]==$bm)
                    $a[$bm]=$majca;
    $rowspan = count($majca_boja);
}else if(!isset($_POST['search']) && !isset($_POST['boja']) && isset($_GET['category']) && isset($_GET['type'])){
    //echo 'SELECT COUNT(`id_item`) AS `sum` FROM `item` WHERE `id_category_item`='.$_GET['category'].' AND `id_type_item`='.$_GET['type'];
    $outcome = mysqli_query($link, 'SELECT COUNT(`id_item`) AS `sum` FROM `item` WHERE `id_category_item` = '.$_GET['category'].' AND `id_type_item` = '.$_GET['type']);
    $item = mysqli_fetch_assoc($outcome);
    $outcome = mysqli_query($link, 'SELECT DISTINCT `id_color` FROM `item`WHERE `id_category_item` = '.$_GET['category'].' AND `id_type_item` = '.$_GET['type']);
    //echo 'SELECT DISTINCT `id_color` FROM `item`WHERE `id_category_item` = '.$_GET['category'].' AND `id_type_item` = '.$_GET['type'];
    $color = mysqli_fetch_all($outcome);
    foreach ($color as $key => $value) {
        $sql = 'SELECT `id_item` FROM `item` WHERE `id_color` ='.$value[0].' AND `id_category_item` = '.$_GET['category'].' AND `id_type_item` = '.$_GET['type'];      
        //echo $sql;
        $outcome = mysqli_query($link, $sql);
        $item1 = mysqli_fetch_all($outcome);
        //print_r($item);    echo '<br>';
        $i = 0;
        foreach ($item1 as $key1 => $value1) {
            $majca_boja[$value[0]][] = $value1[0];
            $i++;
        }
    }
    setcookie('majca_boja', serialize($majca_boja), time()+3600, './');
    $rowspan = $item['sum'];
} else if(isset($_POST['search'])  ){
    $sql= "SELECT COUNT(`id_item`) AS `sum` FROM `item` WHERE `name` LIKE '%".$_POST['search']."%'";
    //echo $sql;
    $outcome= mysqli_query($link, $sql);
    $item = mysqli_fetch_assoc($outcome);
    $outcome = mysqli_query($link, 'SELECT DISTINCT `id_color` FROM `item`'."WHERE `name` LIKE '%".$_POST['search']."%'");
    $color = mysqli_fetch_all($outcome);
    foreach ($color as $key => $value) {
        $sql = 'SELECT `id_item` FROM `item` WHERE `id_color` ='.$value[0]." AND `name` LIKE '%".$_POST['search']."%'";      
        $outcome = mysqli_query($link, $sql);
        $item1 = mysqli_fetch_all($outcome);
        //print_r($item);    echo '<br>';
        $i = 0;
        foreach ($item1 as $key1 => $value1) {
            $majca_boja[$value[0]][] = $value1[0];
            $i++;
        }
    }
    setcookie('majca_boja', serialize($majca_boja), time()+3600, './');
    $rowspan = $item['sum'];
} else if(isset($_GET['sale']) && is_numeric($_GET['sale'])){
    $outcome = mysqli_query($link, 'SELECT COUNT(`id_item`) AS `sum` FROM `item` WHERE `id_sale` = '.$_GET['sale']);
    $item = mysqli_fetch_assoc($outcome);
    $rowspan = $item['sum'];
    $outcome = mysqli_query($link, 'SELECT DISTINCT `id_color` FROM `item`WHERE `id_sale` = '.$_GET['sale']);
    $color = mysqli_fetch_all($outcome);
    foreach ($color as $key => $value) {
        $sql = 'SELECT `id_item` FROM `item` WHERE `id_color` ='.$value[0].' AND `id_sale` = '.$_GET['sale'];  
        $item1 = mysqli_fetch_all(mysqli_query($link, $sql));
        $i = 0;
        foreach ($item1 as $key1 => $value1) {
            $majca_boja[$value[0]][] = $value1[0];
            $i++;
        }
    }
    setcookie('majca_boja', serialize($majca_boja), time()+3600, './');
    
} else {
    $majca_boja = unserialize($_COOKIE['majca_boja']);
     $rowspan = count($majca_boja);
}

 
//print_r($color);

if($rowspan == 0 ) $rowspan = 1;
 //print_r($majca_boja);
?>

<div class="glavni">
    <?php if(isset($_GET['sale']) && is_numeric($_GET['sale'])):?>
        <p><?php 
            $sale_sql="SELECT `description` FROM `sale` WHERE `id_sale`= ".$_GET['sale'];
            $sale = mysqli_fetch_assoc(mysqli_query($link, $sale_sql));
             echo $sale['description']?></p>
    <?php endif;?>
  <table>
    <tr>
        <td rowspan="<?=$rowspan ?>">
        <form class="levo" method="post">
           <b>Izaberite boju:</b><br>
           <?php ispisi_checkbox()?>
           <input type="submit" value="sačuvaj" >
        </form>
      </td>
      <?php if(isset($_POST['search']))  ispisi_search($_POST['search']) ;
      else ispisi_tabelu();?>
    </tr>
  </table> 
</div>