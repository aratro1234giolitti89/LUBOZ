<?php
include "datiConnessione.php";
include "connessione.php";
?>

<!DOCTYPE html>
<html lang="it">

<head>


<meta charset="UTF-8">
<title>Ristoranti</title>

<link href="css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
<script src="js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>


</head>

<body>

<!-- NAVBAR -->
<nav class="navbar navbar-light bg-light mb-4">

<div class="container">

<span class="navbar-brand mb-0 h1">
Ristoranti
</span>

<div>

<a href="login.php" class="btn btn-outline-primary me-2">
Login
</a>

<a href="register.php" class="btn btn-outline-secondary me-2">
Registrati
</a>

<a href="pagCarrello.php" class="btn btn-success">
Carrello
</a>

</div>

</div>

</nav>


<div class="container">

<div class="feature col"> <div class="feature-icon d-inline-flex align-items-center justify-content-center text-bg-primary bg-gradient fs-2 mb-3"> <svg class="bi" width="1em" height="1em" aria-hidden="true"><use xlink:href="#people-circle"></use></svg> </div> <h3 class="fs-2 text-body-emphasis">DE FORC</h3> <p>Se hai voglia di un paio di sfiziosità, deliziati con i ristoranti più vicini a te</p> <a href="#" class="icon-link">
<svg class="bi" aria-hidden="true"><use xlink:href="#chevron-right"></use></svg> </a> </div>

<!-- BARRA DI RICERCA -->

<form method="GET" class="mb-4">

<div class="input-group">

<input type="text"
name="zona"
class="form-control"
placeholder="Cerca per zona">

<button class="btn btn-primary" type="submit">
Cerca
</button>

</div>

</form>


<!-- LISTA RISTORANTI -->

<div class="row">

<?php

$zona = $_GET['zona'] ?? '';

if($zona != ''){

$sql = "SELECT * FROM RISTORANTE WHERE zona LIKE :zona";

$stmt = $conn->prepare($sql);

$stmt->execute([
'zona' => "%$zona%"
]);

}else{

$stmt = $conn->query("SELECT * FROM RISTORANTE");

}

while($row = $stmt->fetch(PDO::FETCH_ASSOC)){

echo "

<div class='col-md-4 mb-4'>

<div class='card h-100'>

<img src='img/".$row['img']."' class='card-img-top'>

<div class='card-body'>

<h5 class='card-title'>
    ".$row['nome']."
</h5>

<p class='card-text'>
    ".$row['descrizione']."
</p>

<p>
<strong>Indirizzo:</strong> ".$row['ind_fatt_via']." ".$row['ind_fatt_civ']." ".$row['ind_fatt_cap']." ".$row['ind_fatt_comune']."<br><br>
<strong>Telefono:</strong> ".$row['nTel']."
</p>

<a href='pagRistoranti.php?id=".$row['IDristorante']."' class='btn btn-primary'>
Visualizza ristorante
</a>

</div>

</div>

</div>

";

}

?>

</div>

</div>


<!-- FOOTER -->

<footer class="bg-light text-center py-3 mt-4">


<!-- Bootstrap JS -->

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
