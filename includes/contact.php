<?php
$err = [];  
if($_POST){
	if(!($_POST['name'] ?? ''))
		$err[] = 'Unesite ime';
	if (!($_POST['email'] ?? ''))
		$err[] = 'Unesite email adresu';
	if (!($_POST['message'] ?? ''))
		$err[] = 'Unesite poruku';
	if (!$err) {
		$header = "MIME-Version: 1.0"."\r\n";
		$header .= "Content-type:text/html:charset=UTF-8"."\r\n";
		//$header .= "From: ivana.ivanovic.18@singimail.rs";
		$header . sprintf("From: %s <%s> \r\n", $_POST['name'], $_POST['email']);
		$mail_poslat = @mail("ekwelika@hotmail.com", "Poruka sa veb sajta", $_POST['message'], $header);
		if($mail_poslat === false) {
			$err[] = "Doslo je do greske, poruka nije poslata";
		}
	}
}
 ?>

<div class="kontaktstrana">
  <h1>Kontaktirajte nas:</h1>
  <?php if($err): ?>
	 <ul>
		<?php foreach($err AS $i ):?>
		<li><?= $i ?></li>
		<?php endforeach;?>
	 </ul>
  <?php endif;?>
  <form method="post">
	 <label>Ime:</label>
	 <input type="text" name="name" value="<?= $_POST['name'] ?? '' ?>">
	 <label>Vas email:</label>
	 <input type="email" name="email" value="<?= $_POST['email'] ?? '' ?>">
	 <label>Kratka poruka:</label>
	 <textarea name="message" value="<?= $_POST['message'] ?? '' ?>"></textarea>
	 <button type="submit">Posalji</button> 
   </form>
 
</div>