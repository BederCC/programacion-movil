<?php
include("dbconnection.php"); 
$con=dbconnection();

if(isset($_POST["id"]))
{
    $id=$_POST["id"];
}
else return;
$query="DELETE FROM user_table WHERE id_usuario=$id";

$exe=mysqli_query($con, $query);
$arr=[];
if($exe)
{
    $arr["success"]="true";
}
else{
    $arr["success"]="false";
}
print(json_encode($arr));
?>