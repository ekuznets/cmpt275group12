<?php
// sends out JSON{STRING: location, STRING : disease, ARRAY: { INT: infected} }
// ex. {"BC", "flu", {45, 55, 80, 32, 48}} this is for the past 5 days because there are 5 values.



// starts connection, see file for more info.
require 'connect.php';


//$email = $_POST['email'];
$location = $_POST['location'];
$rangestr = $_POST['rangein'];
$range = intval($range_string);

//echo $range;
//$sql = "SELECT Location FROM Accounts2 WHERE Email = '".$email."'";
//$result = $conn->query($sql);

//if ($result->num_rows == 1){
//       $r = $result->fetch_assoc();
//        echo($r[Location]);
//}
//else{
//       exit("No Location on Account");
//}

//Tablename in DB is BC 
//Schema: Tablename = Location: [Day, Desease, Infected]
class Plotout{
	public $diseasetype = "";
	public $location = "";
	public $arrayInfected;
	public function getDiseasetype()
	{
		return $this->diseasetype;
	}
	public function getLocation()
	{
		return $this->location;
	}
	public function getInfected()
	{
		return $this->infected;
	}
}

$response = new Plotout();

//SQL query goes here
//Location is default to "BC", Days is defaulted to 5, 
//Desease is defauled to 'flu'
$response->diseasetype = "flu";
$response->location = $location;
//$sql = "SELECT MAX(day) AS most FROM ".$location."";
//$result = $conn->query($sql);

//$mres = $result['most'];

//if ($rangestr > $mres)
//{
//	echo "false"
//	exit();
//
//}

//else
//{
//}

$sql = "SELECT infected FROM ".$location." WHERE deseasetype = 'flu' ORDER BY day DESC LIMIT ".$rangestr."";
$result = $conn->query($sql);
//.$output->getLocation().
//.$output->getDiseasetype().
//JSON parsing and echo go here
$counter = 0;

if ( $result->num_rows == $rangestr)
{
	while($r = $result->fetch_assoc())
	{
		$response->arrayInfected[] = $r;
		$counter = $counter + 1;
	}

	$output = array(
			'response' => $response
			);
	echo json_encode($output);

}
else
{
	$output = array(
			'error' => 'Invalid range or location.'
			);

	echo $json_encode($output);
}

$conn->close;
?>


