<?php
session_start();
$sql="select proceso.*, flujousuario.codT, flujousuario.fechaini, ";
$sql.="flujousuario.fechafin ";
$sql.="from flujousuario inner join proceso ";
$sql.="on flujousuario.codF=proceso.codF and flujousuario.codP=proceso.codP ";
$sql.="where flujousuario.fechafin is not null ";
$sql.="and flujousuario.codU = '".$_SESSION["codUsuario"]."'";
$conexion=mysql_connect("localhost","usuario","123456");
$bd_conexion=mysql_select_db("workflow",$conexion);
$consulta=mysql_query($sql);
?>

<a href="bandeja.php">Bandeja de Entrada</a>
<a>Bandeja de Salida</a>

<table border="1px">
<tr>
	<td>Flujo</td>
	<td>Proceso</td>
	<td>Accion</td>
</tr>
<?php
while ($filas=mysql_fetch_array($consulta))
{
	echo "<tr>";
	echo "<td>".$filas['codF']."</td>";
	echo "<td>".$filas['codP']."</td>";
	echo "<td>";
	echo "<a href='flujo.php?codflujo=".$filas['codF']."&codproceso=".$filas['codP']."'>";
	echo "Ver</a>";
	echo "</td>";
	echo "<tr>";
}
?>
</table>
