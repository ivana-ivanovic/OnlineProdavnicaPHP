<?php 
function add_user() {
    global $link, $err;
    $sql = 'INSERT INTO `user`( `firstname`, `lastname`, `username`, `email`, `password`, `type`)'
          ."VALUES ('".htmlspecialchars_decode($_POST['firstname'])."','".htmlspecialchars_decode($_POST['lastname'])."','"
                     .htmlspecialchars_decode($_POST['username'])."','".htmlspecialchars_decode($_POST['email'])."','"
                     .md5($_POST['pass1'])."', 'user')";
    if (mysqli_query($link, $sql) !== TRUE) 
        return 'Nalog nije kreiran pokusajte ponovo'; 
    else
        return 'Nalog je kreiran. <a href="?page=login">Uloguj se</a>';
}

function check_registration_data(){
    global $err, $link;
    $users_sql = 'SELECT `username` FROM `user`';
    $outcome = mysqli_query($link, $users_sql);
    $users = mysqli_fetch_all($outcome);
    if(!($_POST['firstname'] ?? ''))
            $err[] = 'Unesite ime';
    if (!($_POST['lastname'] ?? ''))
            $err[] = 'Unesite prezime';
    if (!($_POST['username'] ?? ''))
            $err[] = 'Unesite username';
    if (!($_POST['email'] ?? ''))
            $err[] = 'Unesite email';
    if (!($_POST['pass1'] ?? ''))
            $err[] = 'Unesite sifru';
    if (!($_POST['pass2'] ?? ''))
            $err[] = 'Potvrdite sifru';
    if ($_POST['pass1'] !== $_POST['pass2'])
            $err[] = 'Ponovite sifru';
    if (!$err) 
        foreach($users AS $u )
            if ($u[0] === $_POST['username'])
                $err[] = 'Username vec postoji.';
}
$err = [];  

if($_POST){
    check_registration_data();
    if(!$err) $err[] = add_user();
}

?>
<register>
    <?php if ($err): ?>
        <ul>
           <?php foreach($err AS $e ):?>
           <li><?= $e ?></li>
           <?php endforeach;?>
        </ul>
    <?php endif;?>
    <form method="post">
        <label>Ime:</label>
        <input type="text" name="firstname" value="<?= $_POST['firstname'] ?? '' ?>">
        <label>Prezime:</label>
        <input type="text" name="lastname" value="<?= $_POST['lastname'] ?? '' ?>">
        <label>Username:</label>
        <input type="text" name="username" value="<?= $_POST['username'] ?? '' ?>">
        <label>Vas email</label>
        <input type="email" name="email" value="<?= $_POST['email'] ?? '' ?>">
        <label>Sifra:</label>
        <input type="password" name="pass1">
        <label>Potvrdi sifru:</label>
        <input type="password" name="pass2">
        <button type="submit">Posalji</button> 
    </form>
</register>
