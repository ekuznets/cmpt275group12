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
$loc = $_POST['location'];
$contact = $_POST['contact'];
$flagg = 1;
//Access SQL and check for an already existing row with Email == $Email
if ( ("" == trim($email)) || ("" == trim($password)) )
{
	exit("Empty username or Password");
	$flagg = 0; 
}

$sql = "SELECT Email FROM Accounts2 WHERE Email = '".$email."'"; 
$result = $conn->query($sql);

if ($loc == "AB"||$loc == "BC"||$loc == "MB"||$loc == "NB"||$loc == "NL"||$loc == "NS"||$loc == "NT"||$loc == "NU"||$loc == "ON"||$loc == "PE"||$loc == "QC"||$loc == "SK"||$loc == "YT")
{

}
else {
exit("invalid location");
}

// if a value is returned(other than NULL), echo error and

if (($result->num_rows == 0) && ($flagg ==  1) )
{
	$sql = "SELECT Email FROM Accounts2 WHERE Email = '".$contact."'";
	$result = $conn->query($sql);
	if (($result->num_rows != 0))
	{
		$sql = "INSERT INTO Accounts2(Email, Password, Authenticated, Contact, Location) VALUES ('".$email."','".$password."',true,NULL,'".$loc."')";
		$conn->query($sql);
		echo "account created";
	}
	else
	{
		exit("Contact does not exist in DB");
	}
}
//else SQL: INSERT $Email + $Password
else
{
	echo "account already exists";
}


$conn->close;
//DONE
?>
