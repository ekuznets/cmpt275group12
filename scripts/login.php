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
$sql = "UPDATE Accounts SET Authenticated = true WHERE Email = '".$email."' AND Password = '".$password."'"; 
$conn->query($sql);
//Verify Authentication
$sql = "SELECT * FROM Accounts WHERE Email = '".$email."' AND Password = '".$password."'";
$result = $conn->query($sql);

//Return True/False
if ($result->num_rows == 1){
        $r = $result->fetch_assoc();
        if ($r[Authenticated] == 1){
                $output = array(
		'email' => $r['Email'] ,
		'password' => $r['Password'] ,
		'contact' => $r['Contact'] , 
		'location' => $r['Location'] ,
		'device_id' => $r['device_token'] ,
		'authenticated' => $r['Authenticated']
				)
				);
		echo json_encode($output);
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
