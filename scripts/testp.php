<?php
// sends out JSON{STRING: location, STRING : disease, ARRAY: { INT: infected} }
// ex. {"BC", "flu", {45, 55, 80, 32, 48}} this is for the past 5 days because there are 5 values.



// starts connection, see file for more info.
require 'connect.php';

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

$output = new Plotout();
//SQL query goes here
//Location is default to "BC", Days is defaulted to 5, 
//Desease is defauled to 'flu'
$output->diseasetype = "flu";
$output->location = "BC"; 
$sql = "SELECT infected FROM ".$output->getLocation()." WHERE deseasetype = '".$output->getDiseasetype()."' LIMIT 5";
$result = $conn->query($sql);
var_dump($result);
/*
//JSON parsing and echo go here
if ($result->num_rows == 5) {
	while($r = $result->fetch_assoc()){
		$output->arrayInfected[] = $r;
	}
	echo json_encode($output);
}
else{
	echo "something went wrong";
}

*/
$conn->close;

?>


