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
$sql = "UPDATE Accounts2 SET Authenticated = false WHERE Email = '".$email."' AND Password = '".$password."'";
$conn->query($sql);
//Verify Authentication was changed
$sql = "SELECT Authenticated FROM Accounts2 WHERE Email = '".$email."'";
$result = $conn->query($sql);
//Return True/False
if ($result->num_rows == 1)
{
	$r = $result->fetch_assoc();
	if ($r[Authenticated] == 0)
	{
                $output = array(
                        'response' => array(
                                'email' => $email ,
                                'password' => $password ,
                                'authenticated' => $r[Authenticated]
	                                  )
                                );
        echo json_encode($output);
        }
	else 
	{
		$output = array(
			'error' => 'Invalid email/password'
				);
		echo json_encode($output);
	} 
}
else
{
	$output = array(
			'error' => 'account does not exist'
			);
	echo json_encode($output); 
}

$conn->close;

?>
