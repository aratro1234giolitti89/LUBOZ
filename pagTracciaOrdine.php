<?php
include "datiConnessione.php";
include "connessione.php";
$id = $_GET['id'];
$sql = "SELECT stato FROM ORDINE WHERE IDordine=$id";
$ordine = $conn->query($sql)->fetch(PDO::FETCH_ASSOC);

echo "Stato ordine: ".$ordine['stato'];
$result = $conn->query($sql);
?>