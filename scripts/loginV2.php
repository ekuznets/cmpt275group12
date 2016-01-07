<?php
require 'connect.php';

//Take and parse parameters for username and password
/* TEST VALUES
$email = "evgeny@sfu.ca";
$password = "evgeny";
*/

$email = $_POST['email'];
$password = $_POST['password'];
//Compare username and password, update authentication value 
$sql = "UPDATE Accounts2 SET Authenticated = true WHERE Email = '".$email."' AND Password = '".$password."'"; 
$conn->query($sql);
//Verify Authentication
$sql = "SELECT * FROM Accounts2 WHERE Email = '".$email."' AND Password = '".$password."'";
$result = $conn->query($sql);

//Return True/False
if ($result->num_rows == 1)
{
        $r = $result->fetch_assoc();
        if ($r[Authenticated] == 1)
	{
                $output = array(
			'response' => array(
				'email' => $r[Email] ,
				'password' => $r[Password] ,
				'contact' => $r[contact] ,
				'location' => $r[Location] ,
				'device_token' => $r[device_token]
				)
				);
	echo json_encode($output);
//	echo "works";
        }
}
else
{
	$output = array(
		'error' => 'Incorrect email or password'
			);
echo json_encode($output);;
}

$conn->close;

?>
