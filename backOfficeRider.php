<?php
include "datiConnessione.php";
include "connessione.php";
$sql = "SELECT *
FROM ORDINE
WHERE stato='in preparazione'
AND FKRider IS NULL
";
$result = $conn->query($sql);
?>