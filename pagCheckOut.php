<?php
include "datiConnessione.php";
include "connessione.php";

$email = $_SESSION['email'];
$indirizzo = $_POST['indirizzo'];

$sql = "INSERT INTO ORDINE (stato, FKEmail, FKIDindirizzo, FK_IDmetodo)
VALUES ('ricevuto', '$email', $indirizzo, 1)";

$conn->query($sql);
$ordine_id = $conn->lastInsertId();
?>