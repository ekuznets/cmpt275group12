<?php
require 'connect.php';

//Auto update test job

$something = flu;
$sql = "INSERT INTO NL (day, deseasetype, infected) VALUES (NULL,'".$something."', default )";
$result = $conn->query($sql);


$conn->close;
?>
