<?php
    include ("datiConnessione.php");
    include("connessione.php");

    $stmtComuni = $conn->query("
        SELECT IDComune, nome
        FROM comune
        WHERE 1
    ");
    $stmtComuni->execute();
    $comuni = $stmtComuni->fetchAll(PDO::FETCH_ASSOC);
?>

<html>
    <head>
        <title>Registrati</title>
    </head>
    <body>
        <label>Telefono</label>
			<input type="text" name="nTel">
			<br>

			<label>Nome</label>
			<input type="text" name="nome">
			<br>

			<label>Cognome</label>
			<input type="text" name="cognome">
			<br>

			<label>Via</label>
			<input type="text" name="via">
			<br>

			<label>Civico</label>
			<input type="text" name="civ">
			<br>

			<label>CAP</label>
			<input type="number" name="cap">
			<br>

			<form method="post" action="registrati.php">
                <label>Comune</label>
                <select name="comune" required>
                    <option value="">Seleziona un comune</option>
                    <?php foreach ($comuni as $comune): ?>
                        <option value="<?= $comune['IDComune'] ?>"><?= $comune['nome'] ?></option>
                    <?php endforeach; ?>
                </select>
            </form>

            <br>
            <label>Password</label>
            <input id="pwd" type="password" name="password">
        </form>
        <br>
        <br>
        <button type="submit">Registrati</button>

        <script>
            // Function to hash string with SHA-256
            async function sha256(message) {
                const msgBuffer = new TextEncoder().encode(message); // encode as UTF-8
                const hashBuffer = await crypto.subtle.digest('SHA-256', msgBuffer); // hash
                const hashArray = Array.from(new Uint8Array(hashBuffer)); // convert buffer to byte array
                const hashHex = hashArray.map(b => b.toString(16).padStart(2, '0')).join(''); // convert bytes to hex string
                return hashHex;
            }

            document.getElementById('registerForm').addEventListener('submit', async (e) => {
                e.preventDefault(); // Stop form from submitting immediately
            
                const passwordInput = document.getElementById('pwd');
                const passwordValue = passwordInput.value;
            
                // Hash the password
                const hashed = await sha256(passwordValue);
            
                // Replace with hash
                passwordInput.value = hashed;
            
                // Submit form
                e.target.submit();
            });
        </script>
    </body>
</html>