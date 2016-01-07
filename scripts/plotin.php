<?php

//INPUT: JSON Array {STRING: location, STRING: diseasetype}
//TODO: Access the related table and increment the last row's infected amount by 1.
$loc = $_POST['Location']; 
$diseasetype = $_POST['Disease'];
//$value = json_decode($json);
//include the database connection
require 'connect.php';

//verify location
if ($loc == "BC")
{
	if($diseasetype = "flu")
	{
		//If location and disease are valid, update table
		$sql = "UPDATE BC SET infected = infected + 1 WHERE deseasetype = 'flu' ORDER BY day DESC LIMIT 1";
		$conn->query($sql);
		echo "true";
	}
	else
	{
		echo "false0";
	}
}
else {
	echo "false1";
}
//$sql = "UPDATE TEST_WILL_DELETE SET postn=0,content= '".$loc."' ";
//$result = $conn->query($sql);

//Done.
$conn->close;
?>
