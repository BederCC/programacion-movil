<?php
include("dbconnection.php"); 
$con=dbconnection();
if(isset($_POST["name"]))
{
    $name=$_POST["name"];
}
else return;
if(isset($_POST["email"]))
{
    $email=$_POST["email"];
}
else return;
if(isset($_POST["password"]))
{
    $password=$_POST["password"];
}
else return;

$query = "INSERT INTO user_table (name, email, password) 
VALUES ('$name', '$email', '$password')";


// $query=INSERT INTO `user_table` (`id_usuario`, `name`, `email`, `password`) 
// VALUES ('[value-1]', '[value-2]', '[value-3]', '[value-4]')

$exe=mysqli_query($con, $query);

$arr=[];
if($exe)
{
    $arr["success"]="true";
}
else
{
    $arr["success"]="false";
}
print(json_encode($arr));
?>