<?php
$bd_conexion=mysql_select_db("ejemplobd324",$conexion);
$consulta=mysql_query("select * from alumno where ci='$_SESSION[ci]'");
$filas=mysql_fetch_array($consulta);
$ci=$filas["ci"];
$nombre=$filas["nombre"];
$apellido=$filas["apellido"];
?>