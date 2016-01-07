<?php
require 'connect.php';

//Auto update test job

$sql = "INSERT INTO MB3 (day, influenza, gastroenteritis, conjunctivitis) VALUES (NULL, default, default, default)";
$result = $conn->query($sql);

$conn->close;
?>
