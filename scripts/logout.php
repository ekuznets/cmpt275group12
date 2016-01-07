<?php
require 'connect.php';

//Take and parse username and password
/* TEST VALUES 
$email = "evgeny@sfu.ca";
$password = "evgeny";
*/

$email = $_POST['email'];
$password = $_POST['password'];
//Compare username and password, update authentication value
$sql = "UPDATE Accounts SET Authenticated = false WHERE Email = '".$email."' AND Password = '".$password."'";
$conn->query($sql);
//Verify Authentication was changed
$sql = "SELECT Authenticated FROM Accounts WHERE Email = '".$email."'";
$result = $conn->query($sql);
//Return True/False
if ($result->num_rows == 1){
	$r = $result->fetch_assoc();
	if ($r[Authenticated] == 0){
		echo "true";
	}
	else{
		echo "false0"; //script didn't update most likely incorrect password
	}
}
else {
	echo "false1"; //account doesn't exist
}
$conn->close;
?>
