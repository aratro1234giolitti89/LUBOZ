<?php
include "datiConnessione.php";
include "connessione.php";
session_start();
if(!isset($_SESSION['email'])){
    header("Location: login.php");
    exit();
}
$email = $_SESSION['email'];

$sql = "SELECT * FROM CLIENTE WHERE Email='$email'";
$user = $conn->query($sql)->fetch(PDO::FETCH_ASSOC);

?>

<h1>Il mio account</h1>

<p>Nome: <?php echo $user['nome']; ?></p>
<p>Cognome: <?php echo $user['cognome']; ?></p>
<p>Email: <?php echo $user['Email']; ?></p>
<p>Telefono: <?php echo $user['nTel']; ?></p>
