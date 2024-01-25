<?php
$err = [];
$users_sql = 'SELECT `username`,`password`, `id_user`, `type` FROM `user`';
$outcome = mysqli_query($link, $users_sql);
$users = mysqli_fetch_all($outcome);
if ($_POST) {
    if (!($_POST['username'] ?? ''))
        $err[] = 'Unesite username';
    if (!($_POST['pass1'] ?? ''))
        $err[] = 'Unesite sifru';
    if (!$err)
        foreach ($users AS $k)
            if ($k[0] == $_POST['username'] && $k[1] == md5($_POST['pass1'])) {
                $_SESSION['logged'] = $k[2];
                $_SESSION['admin'] = $k[3];
                if ($k[3] == 'admin')
                    header('location: ./index.php?page=panel');
                else
                    header('location: ./index.php');
            }
}
?>
<login>
    <?php if (!isset($_SESSION['logged'])): ?>
        <?php if (isset($_GET['logout'])): ?> 
            <?php header('location: ./index.php'); ?>
            <?php endif; ?>
            <?php if ($err): ?>
            <ul>
                <?php foreach ($err AS $i): ?>
                    <li><?= $i ?></li>
            <?php endforeach; ?>
            </ul>
    <?php endif; ?>
        <form method="post">
            <label>Username:</label>
            <input type="text" name="username" value="<?= $_POST['username'] ?? '' ?>">
            <label>Sifra:</label>
            <input type="password" name="pass1">
            <button type="submit">Posalji</button>
        </form>
    <?php else: ?>
        <?php if (isset($_GET['logout'])): ?>
            <?php $_SESSION['logged'] = null; ?>
        <?php $_SESSION['admin'] = null; ?>
            <?php header('location: ./index.php'); ?>
            <p><b>Uspesno ste se izlogovali.</b></p>
            <a href="./">Vrati se na pocetnu.</a>
        <?php else: ?>
            <p><b>Uspesno ste se ulogovali.</b></p>
    <?php endif; ?>
<?php endif; ?>	
</login>
