<?php
$_SESSION["ci"]=1;

$codflujo=$_GET["codflujo"];
$codproceso=$_GET["codproceso"];
$sql = "select * from proceso where codF='$codflujo' and codP='$codproceso'";

$conexion=mysql_connect("localhost","usuario","123456");
$bd_conexion=mysql_select_db("workflow",$conexion);
$consulta=mysql_query($sql);

$filas=mysql_fetch_array($consulta);
$nombreform=$filas['form'];

include $nombreform."_head.php";
?>
<html>
<body>
	Motor de Flujo
	<form action="motor.php" method="GET">
		<?php include $nombreform."_body.php";?>
		<br/>
		<input type="hidden" value="<?php echo $codflujo; ?>" name="codflujo"/>
		<input type="hidden" value="<?php echo $codproceso; ?>" name="codproceso"/>
		<input type="hidden" value="<?php echo $nombreform; ?>" name="nombreform"/>
		<input type="submit" value="siguiente" name="siguiente"/>
		<input type="submit" value="anterior" name="anterior"/>
	</form>
</body>
</html>