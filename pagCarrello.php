<?php
session_start();
include "datiConnessione.php";
include "connessione.php";

if(!isset($_SESSION['carrello'])){
   $_SESSION['carrello'] = [];
}

if(isset($_POST['piatto_id'])){

$id = $_POST['piatto_id'];
$q = $_POST['quantita'];

$_SESSION['carrello'][$id] = $q;

}

$total = 0;

foreach($_SESSION['carrello'] as $id=>$q){

$sql = "SELECT * FROM PIATTO WHERE id=$id";
$piatto = $conn->query($sql)->fetch(PDO::FETCH_ASSOC);

echo $piatto['nome']." x ".$q."<br>";

$total += $piatto['prezzo']*$q;

}

echo "<h3>Totale: $total €</h3>";

echo "<a href='pagCheckOut.php'>Vai al checkout</a>";
