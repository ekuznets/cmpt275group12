<?php
require 'connect.php';

//Auto update test job

$sql = "INSERT INTO NS3 (day, influenza, gastroenteritis, conjunctivitis) VALUES (NULL, default, default, default)";
$result = $conn->query($sql);

$conn->close;
?>
