<?php
//funcion conexion a base de mysql

function dbconnection()
{
    $con = mysqli_connect("localhost","root","","dbventas");
    return $con;
}