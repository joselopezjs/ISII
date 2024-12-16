<?php
  require '../php/conexionbd.php';
  $alert = '';

  session_start();
  $nivel_acceso = $_SESSION['nivel_acceso'];

  if (empty($_SESSION['active'])) {
    header('location: ../');
  }

  require '../php/conexionbd.php';

  if (isset($_POST['idreg']) && !empty($_POST['idreg'])) {
    $idr = $_POST['idreg'];
    $sql = "DELETE FROM inventario WHERE id = '$idr'";

    if (mysqli_query($conn, $sql)) {
      header('location: eliminar_inventario.php');  // Update the redirection location
    } else {
      echo "Error deleting record: " . mysqli_error($conn);  // Display error message
    }

    mysqli_close($conn);
  }
?>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>Control de Inventario</title>
  <link rel="icon" href="../images/cross.png">
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
        <a href="registrar.php">Registrar</a>
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
    <u><h2>Eliminar Producto</h2></u>  <form action="" method="POST">
      <div class="login">
        <div class="textbox">
          <i class="fas fa-hashtag"></i>
          <input type="text" placeholder="ID del Producto" name="idreg" autocomplete="off">
        </div>
        <input class="btn" type="submit" value="Eliminar">
      </div>
    </form>
  </div>

  <div>
    <table style="width:100%; text-align: center;">
      <thead>
        <tr>
          <th>ID Producto</th>  <th>Producto</th>
          <th>Código</th>
          <th>Descripción</th>
          <th>Stock</th>
          <th>Precio</th>
          <th>Fecha Ingreso</th>
          <th>Proveedor</th>
          <th>Ubicación</th>
          <th></th>
        </tr>
      </thead>
      <tbody>
        <?php
          $sql = "SELECT * FROM inventario";
          $result = mysqli_query($conn, $sql);

          while ($producto = mysqli_fetch_array($result)) {
        ?>
          <tr>
            <td><?php echo $producto['id']; ?></td>
            <td><?php echo $producto['producto']; ?></td>
            <td><?php echo $producto['codigo']; ?></td>
            <td><?php echo $producto['descripcion']; ?></td>
            <td><?php echo $producto['stock']; ?></td>
            <td><?php echo $producto['precio']; ?></td>
            <td><?php echo $producto['fecha_ingreso']; ?></td>
            <td><?php echo $producto['proveedor']; ?></td>
            <td><?php echo $producto['ubicacion']; ?></td>
            </tr>
        <?php
          }
        ?>
      </tbody>