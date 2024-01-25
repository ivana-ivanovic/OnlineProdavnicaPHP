<?php 
if(isset($_SESSION['logged'])){
    global $link;
    $a = $_SESSION['logged'];
    $user_sql = 'SELECT * FROM `user` WHERE `id_user` ='.$a;
    $outcome = mysqli_query($link, $user_sql);
    $user = mysqli_fetch_assoc($outcome);
}
?>
<div class="linija">
    <div class="registracija">
      <?php if(!isset($_SESSION['logged'])):?>
        <a href="?page=login">Uloguj se</a>
        <a href="?page=register">Registruj se</a>
      <?php else :?>
        Zdravo, <?php echo $user['firstname'];?>
        <a href="?page=login&logout=true">Izloguj se</a>
        <?php if (isset($_SESSION['admin'])&& $_SESSION['admin'] == 'admin'):?>
            <a href="?page=panel">Administrativni panel</a>
        <?php endif;?>
      <?php endif;?>
    </div>
    <div class="korpa">
      <a href="?page=cart"><i class="fas fa-cart-arrow-down"></i></a>
    </div>
</div>