<?php
require 'connect.php';

//Auto update test job

$sql = "INSERT INTO NL3 (day, influenza, gastroenteritis, conjunctivitis) VALUES (NULL, default, default, default)";
$result = $conn->query($sql);

$conn->close;
?>
