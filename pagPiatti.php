<?php
include "datiConnessione.php";
include "connessione.php";

$id = $_GET['id'];

$sql = "SELECT * FROM PIATTO WHERE IDpiatto=$id";
$piatto = $conn->query($sql)->fetch(PDO::FETCH_ASSOC);
?>

<h1>Piatto <?php echo $piatto['IDpiatto']; ?></h1>
<p>Prezzo: <?php echo $piatto['prezzo']; ?> €</p>

<h3>Ingredienti</h3>

<?php

$sql = "SELECT I.nome
FROM INGREDIENTE I
JOIN INGREDIENTE_PIATTO IP ON I.IDingrediente = IP.FK_IDingrediente
WHERE IP.FK_IDpiatto = $id
";

$res = $conn->query($sql);

while($ing = $res->fetch(PDO::FETCH_ASSOC)){
    echo $ing['nome']."<br>";
}

?>

<h3>Allergeni</h3>

<?php

$sql = " SELECT DISTINCT A.nome
        FROM ALLERGENE A
        JOIN INGREDIENTE_ALLERGENE IA 
        ON A.IDallergene = IA.FK_IDallergene
        JOIN INGREDIENTE_PIATTO IP 
        ON IA.FK_IDingrediente = IP.FK_IDingrediente
        WHERE IP.FK_IDpiatto = $id
";

$res = $conn->query($sql);

while($all = $res->fetch_assoc()){
    echo $all['nome']."<br>";
}

?>

<form action="carrello.php" method="POST">

<input type="hidden" name="piatto_id" value="<?php echo $id; ?>">

Quantità
<input type="number" name="quantita" value="1">

<button type="submit">
Aggiungi al carrello
</button>

</form>