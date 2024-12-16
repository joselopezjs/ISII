<?php
ob_start(); // Inicia el buffer de salida
session_start();
require '../php/conexionbd.php'; // Archivo de conexión a la base de datos

// Validar sesión
if (empty($_SESSION['active'])) {
    header('location: ../');
    exit(); // Detener script si no hay sesión
}

// Nivel de acceso
$nivel_acceso = $_SESSION['nivel_acceso'];

// Incluir TCPDF
require_once('../tcpdf/tcpdf.php');

// Inicializar PDF
$pdf = new TCPDF(PDF_PAGE_ORIENTATION, PDF_UNIT, PDF_PAGE_FORMAT, true, 'UTF-8', false);
$pdf->SetMargins(15, 15, 15);
$pdf->AddPage();
$pdf->SetFont('helvetica', '', 10);

// Encabezado de la tabla
$pdf->Cell(25, 7, 'ID', 1, 0, 'C');
$pdf->Cell(50, 7, 'Producto', 1, 0, 'C');
$pdf->Cell(30, 7, 'Código', 1, 0, 'C');
$pdf->Cell(50, 7, 'Descripción', 1, 0, 'C');
$pdf->Cell(20, 7, 'Stock', 1, 0, 'C');
$pdf->Cell(25, 7, 'Precio', 1, 0, 'C');
$pdf->Cell(30, 7, 'Fecha Ingreso', 1, 0, 'C');
$pdf->Cell(30, 7, 'Proveedor', 1, 0, 'C');
$pdf->Cell(25, 7, 'Ubicación', 1, 0, 'C');
$pdf->Cell(30, 7, 'Fecha Actualización', 1, 0, 'C');
$pdf->Cell(20, 7, 'Estado', 1, 1, 'C');

// Consulta a la base de datos
$sql = "SELECT * FROM inventario";
$result = mysqli_query($conn, $sql);

// Verificar si la consulta fue exitosa
if (!$result) {
    die("Error en la consulta: " . mysqli_error($conn));
}

// Rellenar filas de la tabla con los datos
while ($row = mysqli_fetch_assoc($result)) {
    $id = $row['id'];
    $producto = $row['producto'];
    $codigo = $row['codigo'];
    $descripcion = $row['descripcion'];
    $stock = $row['stock'];
    $precio = number_format($row['precio'], 2, '.', ','); // Formatear precio
    $fecha_ingreso = date('d-m-Y', strtotime($row['fecha_ingreso']));
    $proveedor = $row['proveedor'];
    $ubicacion = $row['ubicacion'];
    $fecha_actualizacion = date('d-m-Y H:i:s', strtotime($row['fecha_actualizacion']));
    $estado = $row['estado'];

    // Agregar datos al PDF
    $pdf->Cell(25, 7, $id, 1, 0, 'C');
    $pdf->Cell(50, 7, $producto, 1, 0, 'L');
    $pdf->Cell(30, 7, $codigo, 1, 0, 'C');
    $pdf->Cell(50, 7, $descripcion, 1, 0, 'L');
    $pdf->Cell(20, 7, $stock, 1, 0, 'C');
    $pdf->Cell(25, 7, $precio, 1, 0, 'C');
    $pdf->Cell(30, 7, $fecha_ingreso, 1, 0, 'C');
    $pdf->Cell(30, 7, $proveedor, 1, 0, 'L');
    $pdf->Cell(25, 7, $ubicacion, 1, 0, 'L');
    $pdf->Cell(30, 7, $fecha_actualizacion, 1, 0, 'C');
    $pdf->Cell(20, 7, $estado, 1, 1, 'C'); // Nueva línea
}

// Limpia buffer y genera PDF
ob_end_clean();
$pdf->Output('reporte_inventario.pdf', 'I');
exit(); // Finaliza script
?>