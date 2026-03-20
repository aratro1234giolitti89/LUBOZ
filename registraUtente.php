<?php
try {
	include "datiConnessione.php";
    include "connessione.php";
    $errors = array();

	
    function controlla($campo, $messaggio_errore, & $errors){

        if(isset($_POST[$campo]) && trim($_POST[$campo]) != "") {
            return true;
        }
        else {
            $errors[] = $messaggio_errore;
            return false;
        }
    }

    /*
     *
     * Validiamo l'input ricevuto dal client
     * 
     * Dal client ci aspettiamo: 
     * - nome
     * - cognome
     * - username
     * - email
     * - password(hash)
     * 
     * Tutti i campi sono obbligatori, in più dobbiamo controllare che l'email sia formalmente corretta
     * 
     */

    controlla("nome", "E necessario inserire un nome", $errors);
    controlla("cognome", "E necessario inserire un cognome", $errors);
    if(controlla("email", "E necessario inserire una email", $errors)){
        if(!filter_var($_POST['email'], FILTER_VALIDATE_EMAIL)) {
            $errors[] = "L'email: " . $_POST['email'] . " non è valida\n";
        }
    }
    controlla("password", "E necessario inserire una password", $errors);


    if(count($errors) > 0){
        die(var_dump($errors));
    }

    /*
     *
     * Dopo aver verificato la correttezza dei dati ricevuti dal client
     * 
     * Generiamo il salt casualmente
     * 
     * Lo concateniamo all'hash ricevuto
     * 
     * Generiamo l'hash finale
     * 
    **/
	
	if (strlen($_POST["password"]) != 64 || $_POST["password"] === hash('sha256', '')) {
		die("Hash password non valido");
	}

    $salt = hash('sha256', rand());
	

    var_dump($_POST);
	
	//echo "<br>Salt: " . $salt;
	
	$salt_div = str_split($salt, strlen($salt)/2);
	
	//echo "<br>Salt: " . strlen($salt);
	
	//echo "<br>Salt 1: " . $salt_div[0];
	//echo "<br>Salt 2: " . $salt_div[1];
	
	$saved_pwd = hash('sha256', $salt_div[0].$_POST['password'].$salt_div[1]);
	
	echo "<br>Final: " . $saved_pwd;
	
	
	
	
	/*
     *
     * eseguiamo la query per inserire l'utente nel db
     * 
    **/
	
    $sql = "INSERT INTO cliente
        (Email, nTel, nome, cognome,
        ind_fatt_via, ind_fatt_civ,
        ind_fatt_cap, ind_fatt_comune,
        password, salt, FK_IDcomune)
        VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
    $stmt = $conn->prepare($sql);
    $stmt->execute([
        $_POST['email'],
        $_POST['nTel'],
        $_POST['nome'],
        $_POST['cognome'],
        $_POST['via'],
        $_POST['civ'],
        $_POST['cap'],
        $_POST['comune'],
        $saved_pwd,
        $salt,
        $_POST['idcomune']
    ]);
    header("Location: pagPrincipale.php");
    exit;
	

} catch (PDOException $e) {
	echo $e->getMessage();
}	
?>