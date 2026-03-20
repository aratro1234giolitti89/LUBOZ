<?php
include "datiConnessione.php";
include "connessione.php";
$comuni = $conn->query("SELECT IDcomune, nome FROM comune")->fetchAll(PDO::FETCH_ASSOC);
?>
<html>
   <head>
   <noscript><style> #registerForm { display: none } </style></noscript>
   </head>
   <body>
	   <form id="registerForm" method='post' action='registraUtente.php'>
		   <label>Email</label>
		   <input type="email" name="email">
		   <br>

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

			   <label>Comune</label>
			   <select name="comune" required>
				   <option value="">Seleziona Comune</option>
				   <?php foreach($comuni as $comune): ?>
					   <option value="<?= htmlspecialchars($comune['nome']) ?>" data-idcomune="<?= $comune['IDcomune'] ?>">
						   <?= htmlspecialchars($comune['nome']) ?>
					   </option>
				   <?php endforeach; ?>
			   </select>
			   <input type="hidden" name="idcomune" id="idcomune" />
			   <br>

			<label>Password</label>
			<input id="pwd" type="password" name="password">
			<br>
			<br>
		</form>

		<button type="submit">Registrati</button>
		
		<noscript>
			<p>Il tuo Browser non support JavaScript.</p>
			<p>E' necessario abilitarlo per proseguire.</p>
		  
		</noscript>	
		
		   <script>
			   // Function to hash string with SHA-256
			   async function sha256(message) {
				   const msgBuffer = new TextEncoder().encode(message); // encode as UTF-8
				   const hashBuffer = await crypto.subtle.digest('SHA-256', msgBuffer); // hash
				   const hashArray = Array.from(new Uint8Array(hashBuffer)); // convert buffer to byte array
				   const hashHex = hashArray.map(b => b.toString(16).padStart(2, '0')).join(''); // convert bytes to hex string
				   return hashHex;
			   }

			   // Imposta idcomune nascosto in base alla select
			   document.querySelector('select[name="comune"]').addEventListener('change', function() {
				   var selected = this.options[this.selectedIndex];
				   document.getElementById('idcomune').value = selected.getAttribute('data-idcomune') || '';
			   });

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