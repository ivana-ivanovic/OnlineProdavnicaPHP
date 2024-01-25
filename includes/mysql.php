<?php
$link = mysqli_connect($db_server, $db_username, $db_password, $db_name);
if (mysqli_connect_error($link)) echo 'Greska: '.mysqli_connect_error($link);
else mysqli_set_charset($link, "utf8");
?>