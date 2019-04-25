<?php
$codflujo=$_GET["codflujo"];
$codproceso=$_GET["codproceso"];
$nombreform=$_GET["nombreform"];

$conexion=mysql_connect("localhost","usuario","123456");

include $nombreform."_update.php";

if (isset($_GET['siguiente']))
	$sql = "select * from proceso where codF='$codflujo' and codP='$codproceso'";
else
	$sql = "select * from proceso where codF='$codflujo' and codPS='$codproceso'";

$bd_conexion=mysql_select_db("workflow",$conexion);
$consulta=mysql_query($sql);

$filas=mysql_fetch_array($consulta);
$nombreform=$filas['form'];
if (isset($_GET['siguiente']))
	$codproceso=$filas['codPS'];
else 
	$codproceso=$filas['codP'];


session_start();
if ($filas['codP']==$_SESSION["codRol"])
	header('Location: '.'flujo.php?codflujo='.$codflujo.'&codproceso='.$codproceso);
else 
	echo "No tiene privilegios";

?>