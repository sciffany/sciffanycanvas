<?php
$url = parse_url(getenv("CLEARDB_DATABASE_URL"));

$server = $url["host"];
$username = $url["user"];
$password = $url["pass"];
$db = substr($url["path"], 1);

//create connection
$conn = new mysqli($server, $username, $password, $db);

//create database
$sql = "CREATE TABLE MyGuests (
name VARCHAR(50)
)"
if ($conn->query($sql) === TRUE){
	echo "DATABASE created successfully";
} else {
	echo "Error";
};

$conn->close();

?>
