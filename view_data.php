<?php
header("Access-Control-Allow-Origin: *"); // Permite cualquier origen, esto puede ser restrictivo en producción
header("Content-Type: application/json");
include("dbconnection.php");
$con = dbconnection();

$query = "SELECT id_usuario, name, email, password FROM user_table";

$exe = mysqli_query($con, $query);
$arr = [];
while ($row = mysqli_fetch_array($exe)) {
    $arr[] = $row;
}

// Agregamos mensajes de depuración
if (count($arr) > 0) {
    error_log("Consulta SQL exitosa. Se encontraron registros.");
} else {
    error_log("Consulta SQL exitosa. No se encontraron registros.");
}

print(json_encode($arr));


// <?php
// include("dbconnection.php");
// $con=dbconnection();


// $query = "SELECT id_usuario, name, email, password FROM user_table";

// $exe=mysqli_query($con, $query);
// $arr=[];
// while($row=mysqli_fetch_array($exe))
// {
//     $arr[]=$row;
// }
// print(json_encode($arr));