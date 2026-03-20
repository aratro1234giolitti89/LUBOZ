<html>
	<head>
	<noscript><style> #registerForm { display: none } </style></noscript>
	</head>
	<body>
		<p>5C it</p>
		<form id="registerForm" method='post' action='registraUtente.php'>
			<label>Email</label>
			<input type="email" name="email">

			<label>Telefono</label>
			<input type="text" name="nTel">

			<label>Nome</label>
			<input type="text" name="nome">

			<label>Cognome</label>
			<input type="text" name="cognome">

			<label>Via</label>
			<input type="text" name="via">

			<label>Civico</label>
			<input type="text" name="civ">

			<label>CAP</label>
			<input type="number" name="cap">

			<label>Comune</label>
			<input type="text" name="comune">

			<label>ID Comune</label>
			<input type="number" name="idcomune">

			<label>Password</label>
			<input id="pwd" type="password" name="password">
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

			document.getElementById('registerForm').addEventListener('submit', async (e) => {
				e.preventDefault(); // Stop form from submitting immediately
				
				const passwordInput = document.getElementById('pwd');
				const passwordValue = passwordInput.value;
				
				// Hash the password
				const hashed = await sha256(passwordValue);
				
				// Replace with hash
				passwordInput.value = hashed;
				
				console.log('Original hashed before submission:', hashed);
				
				// Submit form
				e.target.submit();
				
				e.target.reset();
			});
		</script>
	</body>
</html>