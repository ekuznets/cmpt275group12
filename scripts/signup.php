<?php
require 'connect.php';

//recieve JSON object here


//parse POST method here to get these variables:
/* TEST VALUES
$email = "evgeny@sfu.ca";
$password = "evgeny";
*/

$email = $_POST['email'];
$password = $_POST['password'];
$flagg = 1;
//Access SQL and check for an already existing row with Email == $Email
if ( ("" == trim($email)) || ("" == trim($password)) )
{
	exit("Empty username or Password");
	$flagg = 0; 
}

$sql = "SELECT Email FROM Accounts WHERE Email = '".$email."'"; 
$result = $conn->query($sql);


// if a value is returned(other than NULL), echo error and

if (($result->num_rows == 0) && ($flagg ==  1) )
{
	$sql = "INSERT INTO Accounts(Email, Password, Authenticated, Contact) VALUES ('".$email."','".$password."',true,NULL)";
	$conn->query($sql);
	echo "account created";
}
//else SQL: INSERT $Email + $Password
else
{
	echo "account already exists";
}


$conn->close;
//DONE
?>
