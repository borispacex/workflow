<?php
$codflujo=$_GET["codflujo"];
$codproceso=$_GET["codproceso"];

session_start();

$sql="select max(codT)+1 codTS from flujousuario";
$conexion=mysql_connect("localhost","usuario","123456");
$bd_conexion=mysql_select_db("workflow",$conexion);
$consulta=mysql_query($sql);
$filas=mysql_fetch_array($consulta);
$codTS=$filas['codTS'];
$sql="insert into flujousuario values('$codflujo','$codproceso','$codTS','".$_SESSION["codUsuario"]."','".date('m/d/y g:i')."',null)";
print($sql);
$consulta=mysql_query($sql);

header('Location: '."flujo.php?codflujo=".$codflujo."&codproceso=p1");
?>