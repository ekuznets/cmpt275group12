<?php
require 'connect.php';

//instantiate SQL connection



//*********************************************************
//		VARIABLE DEFINITIONS 			  *
//*********************************************************/



// Store POST values
//Initialize connection


$deviceToken = "";
$load = $_POST['load'];
$email = $_POST['email'];


//*********************************************************
//              PARSING $ SECURITY                        *
//*********************************************************/


if ( ("" == trim($email)) || ("" == trim($load)) )
{
		$output = array(
				'error' => 'Empty username or password or load.'
				);
		echo json_encode($output);
		exit();

}


//***********************************************************
//              PROGRAM                                     *
//**********************************************************/

//Find emergency contact
$sql = "SELECT Contact FROM Accounts2 WHERE Email = '".$email."'";

$result = $conn->query($sql);

if ($result->num_rows == 1)
{
	if ("" == trim($contact) )
	{
		while($row = $result->fetch_assoc()) {


			$lemail = $row["Contact"];
		}
	}

	else
	{
	$output = array(
			'error' => 'Contact not set.'
			);
	echo json_encode($output);

	exit();
	}
}

else
{
	$output = array(
			'error' => 'Problem retrieving account'
			);
	echo json_encode($output);
	exit();
}

//Locate Device Token of Emergency Contact
$sql = "SELECT device_token FROM Accounts2 WHERE Email = '".$lemail."'";
$result = $conn->query($sql);

if ($result->num_rows == 1)
{
	while ($row = $result->fetch_assoc()) {

		$deviceToken = $row["device_token"];
	}
}

else
{

$output = array(
		'error' => 'Emergency contact unreachable.'
		);
echo json_encode($output);

} 

$conn->close;

//Code to set up connection with APNS ANd send load to $deviceID

$ctx = stream_context_create();
stream_context_set_option($ctx, 'ssl', 'local_cert', 'ck.pem');

$fp = stream_socket_client('ssl://gateway.sandbox.push.apple.com:2195', $err, $errstr, 60, STREAM_CLIENT_CONNECT|STREAM_CLIENT_PERSISTENT, $ctx);

if (!$fp){
	exit("Failed to connect: $err $errstr" . PHP_EOL);
}

echo 'Connected to APNS' . PHP_EOL;

// Create the payload body $body['aps'] = array(
	'alert' => $load,
	'sound' => 'default'
	); 
// Encode the payload as JSON 
$payload = json_encode($body);

// Build the binary notification 
$msg = chr(0) . pack('n', 32) . pack('H*', $deviceToken) . pack('n', strlen($payload)) . $payload; 
// Send it to the server 
$result = fwrite($fp, $msg, strlen($msg)); 
if (!$result){
	echo 'Message not delivered' . PHP_EOL; 
}
else{
	echo 'Message successfully delivered' . PHP_EOL; 
}
*/
// Close the connection to the server
fclose($fp);

?>
