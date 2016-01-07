<?php
//Test of php scripting
//Correct Output is: Hello World!
$servername = "localhost";
$username = "root";
$password = "h3alth275";
$dbname = "TestDB";
// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
} 

$sql = "SELECT  `Itemstuff` FROM  `TestTable1` WHERE ItemID = 3";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    // output data of each row
    while($row = $result->fetch_assoc()) {
       // echo $row["Itemstuff"]. "<br>";
        echo json_encode($row);
    }
} else {
    echo "0 results";
}
$conn->close();
?>
