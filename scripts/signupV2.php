<?php
// Instantiate SQL connection. 
require 'connect.php';

/* TEST VALUES, only for debugging.
$email = "evgeny@sfu.ca";
$password = "evgeny";
*/

//************************************************
//*                     VARIABLE DEFINITIONS     *
//************************************************

// Store POST values.
$email = $_POST['email'];
$password = $_POST['password'];
$loc = $_POST['location'];
$contact = $_POST['contact'];
$deviceID = $_POST['device_token'];
//Define a flag for legal access.
$flagg = 1;
$error = 0;




//************************************************
//*                   PARSING & SECURITY         *
//************************************************

//Parse variables for illegal DB access.
//Method: If username/password not provided, Exit.
if ( ("" == trim($email)) || ("" == trim($password)) )
{
	$flagg = 0;
	$output = array(
                       'error' => 'Empty username or password.'
                        );
        echo json_encode($output);

        exit();
 
}

//Method: Check for table-name match. If no match, Exit.
if (($loc == "AB"||$loc == "BC"||$loc == "MB"||$loc == "NB"||$loc == "NL"||$loc == "NS"||$loc == "NT"||$loc == "NU"||$loc == "ONT"||$loc == "PE"||$loc == "QC"||$loc == "SK"||$loc == "YT"))
{
//Continue.
}
else
{
	$output = array(
                       'error' => 'Invalid location'
                        );
        echo json_encode($output);
        exit();
}

//Check for a pre-existing contact.
//Method: Query Accounts with provided Email. If a row is returned, exit.

//Define SQL Query.
$sql = "SELECT Email FROM Accounts2 WHERE Email = '".$email."'";

//Submit SQL Query. 
$result = $conn->query($sql);

//************************************************
//*                     PROGRAM                  *
//************************************************

//Store account in Database.
//Method: If Email not returned & Contact not provided [Store without contact].
//        If Email not returned & Contact provided, check if contact exists as account.
//             If yes, [Store with contact]; 
//             Else, Exit with error ->Contact not defined.
//        Else Exit with error ->Account already exists.

// CASE: Account does not already exist. 
if (($result->num_rows == 0) && ($flagg ==  1)) 
{

	// CASE: No contact is supplied.
	if ("" == trim($contact) )
	{
		//Define SQL Query.
 		$sql = "INSERT INTO Accounts2(Email, Password, Authenticated, Contact, Location, device_token) VALUES ('".$email."','".$password."',true,NULL,'".$loc."','".$deviceID."')";
        	
		//Submit SQL Query.
		$conn->query($sql);
		$output = array(
			'response' => array(
                       		'email' => $email ,
                       		'password' => $password ,
		       		'location' => $loc ,
		       		'contact' => $contact ,
		       		'device_token' => $deviceID
				)
                                );
        echo json_encode($output);
	}
	else
	// CASE: contact is provided.  
	{
	//       --> check for contact eligibility.
		
		//Define SQL Query.
		$sql = "SELECT Email FROM Accounts2 WHERE Email = '".$contact."'";
		
		//Submit SQL QUery.
		$result = $conn->query($sql);
		
		//CASE: Contact is an existing account.
		if (($result->num_rows != 0))
		{

			//Define SQL Query.
			$sql = "INSERT INTO Accounts2(Email, Password, Authenticated, Contact, Location, device_token) VALUES ('".$email."','".$password."',true,'".$contact."','".$loc."','".$deviceID."')";
			
			//Submit SQL Query.
			$conn->query($sql);
			$output = array(
			'response' => array(
                       'email' => $email ,
                       'password' => $password ,
                       'location' => $loc ,
                       'contact' => $contact ,
                       'device_token' => $deviceID
				)
                                );
			
			echo json_encode($output);

		}
		//CASE: Contact is not an existing account.
		else 
		{
			$output = array(
                        'error' => 'Contact is not an existing account in database.'
                                       );
        		echo json_encode($output);

			exit();
		}
	}
}

//CASE: Account is already in DB.
else
{
	$output = array(
	'error' => 'Account already exists.'
			);
	echo json_encode($output);
}


//Close connection.
$conn->close;
//DONE
?>
