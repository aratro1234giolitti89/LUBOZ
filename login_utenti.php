<?php
try {

session_start();
include "datiConnessione.php";
include "connessione.php";

$errors = array();

function controlla($campo, $messaggio_errore, &$errors){
    if(isset($_POST[$campo]) && trim($_POST[$campo]) != ""){
        return true;
    } else {
        $errors[] = $messaggio_errore;
        return false;
    }
}

controlla("email","Inserire email",$errors);
controlla("password","Inserire password",$errors);

if(count($errors)>0){
    die(var_dump($errors));
}

$email = $_POST["email"];

$sql = "SELECT * FROM CLIENTE WHERE Email = '$email'";
$results = $conn->query($sql);

if($results->rowCount()==1){

    $row = $results->fetch();

    $salt_div = str_split($row["salt"], strlen($row["salt"])/2);

    $pass_salt = hash('sha256', $salt_div[0].$_POST['password'].$salt_div[1]);

    if($pass_salt === $row["password"]){

        echo "Accesso consentito";

        $_SESSION["email"] = $row["Email"];
        $_SESSION["nome"] = $row["nome"];
        $_SESSION["cognome"] = $row["cognome"];

    }else{
        die("Password errata");
    }

}else{
    die("Utente non trovato");
}

}catch(PDOException $e){
echo $e->getMessage();
}
?>