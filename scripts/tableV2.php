\<?php
require 'connect.php';

//recieve JSON object here


//parse POST method here to get these variables:
/* TEST VALUES
$email = "evgeny@sfu.ca";
$password = "evgeny";
*/


//Access SQL and check for an already existing row with Email == $Email

$sql = "SELECT * FROM Accounts2 WHERE 1 LIMIT 0, 500 ";
$result = $conn->query($sql);

// if a value is returned(other than NULL), echo error and DONE.
echo "EMAIL  || PASSWORD  || AUTHENTICATED? || CONTACT || Location  ";
echo "<br>";

while($row = mysqli_fetch_array($result)) 
{
echo $row['Email'];
echo " || is_SET ";
echo "   || ";
echo $row['Authenticated'];
echo "   || ";
echo $row['Contact'];
echo "    || ";
echo $row['Location'];
echo "<br>";
}
echo "DONE!";
//deletethis
//$sql = "SELECT COUNT(*) AS numacc FROM Accounts";
//$totals = $conn->query($sql);

//echo "<br>";
//while ($total = mysqli_fetch_array($totals))
//{
//echo total['numacc'];

//}
//deletethis

echo "<br>";
echo "Scripts that interact with this table: ->signup.php ->login.php ->logout.php ->table.php";
$conn->close;
//DONE
?>

