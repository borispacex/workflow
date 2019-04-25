<?php
session_start();
$user = $_GET["user"];
$password = $_GET["password"];
$conexion=mysql_connect("localhost","usuario","123456");
$bd_conexion=mysql_select_db("workflow",$conexion);
$sql="select * from usuario inner join rol";
$sql.=" on usuario.codR=rol.codR ";
$sql.=" where usr='$user' and pwd='$password'";
$consulta=mysql_query($sql);
$filas=mysql_fetch_array($consulta);
if (isset($filas["usr"]))
{
	$_SESSION["codRol"]=$filas["codR"];
	$_SESSION["codUsuario"]=$filas["codU"];
	header('Location: bandeja.php');
}
else
{
	$_SESSION["codRol"]="-1";
	$_SESSION["codUsuario"]="-1";
	header('Location: usuario.php');
}
?>
