<?php
session_start();
$sql="SELECT * FROM proceso WHERE codR='".$_SESSION["codRol"]."' and codP='P1' ";
$conexion=mysql_connect("localhost","usuario","123456");
$bd_conexion=mysql_select_db("workflow",$conexion);
$consulta=mysql_query($sql);
?>

<a>Flujo de Inicio</a>

<table border="1px">
<tr>
	<td>Flujo</td>
	<td>Accion</td>
</tr>
<?php
while ($filas=mysql_fetch_array($consulta))
{
	echo "<tr>";
	echo "<td>".$filas['codF']."</td>";
	echo "<td>";
	echo "<a href='motorinicio.php?codflujo=".$filas['codF']."&codproceso=p1'>";
	echo "Iniciar</a>";
	echo "</td>";
	echo "<tr>";
}
?>
</table>