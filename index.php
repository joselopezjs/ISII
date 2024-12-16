<?php
// Inicio de sesión
$alert = '';
session_start();
if (!empty($_SESSION['active'])) {
    header('location: sistema/');
} else {
    if (!empty($_POST)) {
        if (empty($_POST['username1']) || empty($_POST['password1'])) {
            $alert = 'Ingrese su usuario y contraseña';
        } else {
            require 'php/conexionbd.php'; // Conexión a la base de datos

            $user = $_POST['username1'];
            $psw = $_POST['password1'];

            // Consulta sensible a mayúsculas/minúsculas usando BINARY se modifico el campo en la bd...
            $query = mysqli_query($conn, "SELECT * FROM usuarios WHERE BINARY username = '$user' AND BINARY password = '$psw'");
            $result = mysqli_num_rows($query);

            if ($result > 0) {
                $data = mysqli_fetch_array($query);
                $_SESSION['active'] = true;
                $_SESSION['idus'] = $data['id'];
                $_SESSION['usernameus'] = $data['username'];
                $_SESSION['passwordus'] = $data['password'];
				$_SESSION['nivel_acceso'] = $data['nivel_acceso'];
                header('location: sistema/');
            } else {
                $alert = 'Usuario y/o contraseña incorrecto';
                session_destroy();
            }
        }
    }
}
?>
<!DOCTYPE html>
<html>
<head> <!--Atributos necesarios para el funcionamiento-->
	<meta charset="utf-8"> 
	<title>Control de Ventas</title>
	<link rel="icon" href="images/open-book.png">
	<link rel="stylesheet" href="styles/style.css">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.13.0/css/all.css">
</head>
<body>
	<form action= "" method="POST"> <!--Formulario para el inicio de sesión-->
	<div class="login-box">
		<h1>Iniciar sesión</h1>
		<div class="textbox">
			<i class="fas fa-user"></i>
			<input type="text" placeholder="Usuario" name="username1" autocomplete="off" required>
		</div>
		<div class="textbox">
			<i class="fas fa-lock"></i>
			<input type="password" placeholder="Contraseña" name="password1" autocomplete="off" required>
		</div>
		<div class="alert" style="text-align: center;"><?php echo isset($alert)? $alert : ''; ?></div>
		<input class="btn" type="submit" value="Iniciar sesión">
	</div>
	</form>
</body>
</html>