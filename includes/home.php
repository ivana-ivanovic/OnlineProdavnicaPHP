<?php
    $sale_sql="SELECT `id_sale`, `image` , `name` FROM `sale` WHERE `active`= '1'";
    $sale = mysqli_fetch_all(mysqli_query($link, $sale_sql));
    $link_sale = '';
    foreach ($sale as $key => $value) 
        $link_sale .= '<div><h3><b>'.$value[2].'</b></h3><a href="?page=items&sale='.$value[0].'"><img src="'.DIMAGES.$value[1].'"></a></div>';
    
?>
<div class="strana">
    <?php echo $link_sale;?>
</div>