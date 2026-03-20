<?php

session_start();
$_SESSION['IDristorante'] = $_GET['id'];

include('connessione.php');

$sql = $conn->prepare("
    SELECT *
    FROM PIATTO
    WHERE FK_IDristorante = ?"
);
$sql->execute([$_SESSION['IDristorante']]);
$piatti = $sql->fetchAll(PDO::FETCH_ASSOC);

?>

<div class="row">

<?php 
foreach($piatti as $piatto) {    
    echo '
        <div class="col-lg-4">
        <h2 class="fw-normal">'.$piatto['nome'].' - '.$piatto['prezzo'].'€</h2>
        <img src="img/'.$piatto['image'].'" class="rounded-circle" height="140" alt="Piatto">
        <br>
        <a class="btn btn-secondary" href="pagPiatti.php?id='.$piatto['IDpiatto'].'">
        Vedi piatto »
        </a>
        </p>
        </div>
    ';
}
?>