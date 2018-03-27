<?php
   ob_start();
   session_start();
?>
<html>
	<head>
		<title>Basic Login Form</title>
	</head>
	<body>
		<form method = "post">
		<p>Username :</p>
		<input type = "text" name = "username"></br>
		<p>Password :</p>
		<input type = "password" name = "password"></br>
		<button type="submit" name="login">Login</button>
		</form>
		<?php
			$msg = '';
			if (isset($_POST['login']) && !empty($_POST['username']) 
               && !empty($_POST['password'])) {
				
               if ($_POST['username'] == 'admin' && 
                  $_POST['password'] == 'admin') {
                  $_SESSION['valid'] = true;
                  $_SESSION['timeout'] = time();
                  $_SESSION['username'] = 'admin';
				  header('Refresh: 0; URL = home.php');
               }else {
                  echo '<p>Wrong username or password<p>';
               }
			}
		?>
	</body>
</html>