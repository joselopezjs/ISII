<?php
  $alert = '';
  session_start();

  if (empty($_SESSION['active'])) {
    header('location: ../');
  }
  $nivel_acceso = $_SESSION['nivel_acceso'];
  require '../php/conexionbd.php';


  if (isset($_POST['producto']) && !empty($_POST['producto']) &&
      isset($_POST['codigo']) && !empty($_POST['codigo']) &&
      isset($_POST['descripcion']) && !empty($_POST['descripcion']) &&
      isset($_POST['stock']) && !empty($_POST['stock']) &&
      isset($_POST['precio']) && !empty($_POST['precio']) &&
      isset($_POST['fecha_ingreso']) && !empty($_POST['fecha_ingreso']) &&
      isset($_POST['proveedor']) && !empty($_POST['proveedor']) &&
      isset($_POST['ubicacion']) && !empty($_POST['ubicacion'])) {

    $producto = mysqli_real_escape_string($conn, $_POST['producto']);
    $codigo = mysqli_real_escape_string($conn, $_POST['codigo']);
    $descripcion = mysqli_real_escape_string($conn, $_POST['descripcion']);
    $stock = mysqli_real_escape_string($conn, $_POST['stock']);
    $precio = mysqli_real_escape_string($conn, $_POST['precio']);
    $fecha_ingreso = mysqli_real_escape_string($conn, $_POST['fecha_ingreso']);
    $proveedor = mysqli_real_escape_string($conn, $_POST['proveedor']);
    $ubicacion = mysqli_real_escape_string($conn, $_POST['ubicacion']);

    $sql = "INSERT INTO inventario (producto, codigo, descripcion, stock, precio, fecha_ingreso, proveedor, ubicacion) 
            VALUES ('$producto', '$codigo', '$descripcion', '$stock', '$precio', '$fecha_ingreso', '$proveedor', '$ubicacion')";

    if (mysqli_query($conn, $sql)) {
      echo '<script language="javascript">alert("Producto registrado exitosamente");</script>';
    } else {
      echo '<script language="javascript">alert("Error al registrar el producto");</script>';
    }

    mysqli_close($conn);
  }
?>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>Registro de Productos</title>
  <link rel="icon" href="../images/check.png">
  <link rel="stylesheet" href="../styles/style.css">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.13.0/css/all.css">
</head>
<body>
  <div>
  <ul>
		  <li>
		  	<a href="index.php">Ver</a>
		  </li>
		  <li>
		  	<a href="registrar.php" class="active">Registrar</a>
		  </li>
		  <li>
		  	<a href="modificar.php">Modificar</a>
		  </li>
		  <li>
		  	<?php if ($nivel_acceso == 'admin'): ?>
		  	<a href="eliminar.php">Eliminar</a>
			<a href="registrar_inventario.php">Registro Inventario</a>
			<a href="ver_inventario.php">Ver Inventario</a>
			<a href="eliminar_inventario.php">Modificar Inventario</a>
			<?php endif; ?>
		  </li>
		  <li style="float:right">
		  	<a href="../php/salir.php" class="sesion">Cerrar sesión</a>
		  </li>
		</ul>
  </div>
  <div style="text-align: center; color: #3f51b5;">
    <u><h2>Registro de Productos</h2></u>
  </div>
  <div>
    <form action="" method="POST"> <div class="login">
        <div class="textbox">
          <i class="fas fa-barcode"></i>
          <input type="text" placeholder="Código" name="codigo" autocomplete="off" required>
        </div>
        <div class="textbox">
          <i class="fas fa-box"></i>
          <input type="text" placeholder="Producto" name="producto" autocomplete="off" required>
        </div>
        <div class="textbox">
          <i class="fas fa-file-alt"></i>
          <textarea name="descripcion" placeholder="Descripción" cols="30" rows="5" required></textarea>
        </div>
        <div class="textbox">
        <div class="textbox">
          <i class="fas fa-boxes"></i>
          <input type="number" placeholder="Stock" name="stock" autocomplete="off" required>
        </div>
        <div class="textbox">
          <i class="fas fa-dollar-sign"></i>
          <input type="number" step="0.01" placeholder="Precio" name="precio" autocomplete="off" required>
        </div>
        <div class="textbox">
          <i class="fas fa-calendar-alt"></i>
          <input type="date" name="fecha_ingreso" required>
        </div>
        <div class="textbox">
          <i class="fas fa-truck"></i>
          <input type="text" placeholder="Proveedor" name="proveedor" autocomplete="off" required>
        </div>
        <div class="textbox">
          <i class="fas fa-map-marker-alt"></i>
          <input type="text" placeholder="Ubicación" name="ubicacion" autocomplete="off" required>
        </div>
        <label for="estado">Estado:</label>
<select name="estado">
    <option value="disponible">Disponible</option>
    <option value="agotado">Agotado</option>
    <option value="en_pedido">En pedido</option>
</select>
        <div class="alert" align-te></div>
        <input class="btn" type="submit" value="Registrar">
      </div>
    </form>
  </div>
</body>
</html>