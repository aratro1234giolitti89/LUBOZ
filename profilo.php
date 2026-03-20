<?php
session_start();

if(isset($_SESSION['email'])){

    echo "<p>Bentornato "
        . $_SESSION['nome']
        . " "
        . $_SESSION['cognome']
        . "!</p>";

    echo "<a href='logout.php'>Logout</a>";

}else{

    echo "<a href='login.php'>Effettua login</a>";

}
?>