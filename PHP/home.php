<?php
   ob_start();
   session_start();
?>
<html>
	<head>
		<title>Admin Login</title>
	</head>
	<body>
		<form method = "post">
		<p>Logged into admin</p>
		<button type="submit" name="login">Logout</button>
		<form>
		<?php
			$msg = '';
			if (isset($_POST['login'])) {
			    unset($_SESSION["username"]);
			    unset($_SESSION["password"]);
				header('Refresh: 0; URL = /PHP/');
			}
		?>
	</body>
</html>