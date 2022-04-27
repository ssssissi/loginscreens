<?php
require('connection.php');
$makeQuery= "SELECT * FROM portfolio WHERE portfolioID LIKE '168652%';";
$statement = $connection->prepare($makeQuery);
$statement->execute();

$myarray=array();
while($resultsFrom= $statement->fetch()){
array_push(
$myarray,array(
"portfolioID"=>$resultsFrom['portfolioID'],
"status"=>$resultsFrom['status'],
"type"=>$resultsFrom['type'],
"feeCode"=>$resultsFrom['feeCode'],
"initialValue"=>$resultsFrom['initialValue'],
"currency"=>$resultsFrom['currency'],
"fee"=>$resultsFrom['fee'],
"feeDescr"=>$resultsFrom['feeDescr']
)
);
}
echo json_encode($myarray);
?>