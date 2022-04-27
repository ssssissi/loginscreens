<?php
require('connection.php');
$makeQuery= "SELECT * FROM client WHERE id='729818';";
$statement = $connection->prepare($makeQuery);
$statement->execute();

$myarray=array();
while($resultsFrom= $statement->fetch()){
array_push(
$myarray,array(
"id"=>$resultsFrom['id'],
"name"=>$resultsFrom['name'],
"surname"=>$resultsFrom['surname'],
"nationality"=>$resultsFrom['nationality'],
"birthday"=>$resultsFrom['birthDate'],
"sector"=>$resultsFrom['sector'],
"status"=>$resultsFrom['status'],
"lang"=>$resultsFrom['lang'],
"address"=>$resultsFrom['address'],
"intBank"=>$resultsFrom['internetBanking'],
"currency"=>$resultsFrom['currency'],
"portfolio"=>$resultsFrom['portfolio']
)
);
}
echo json_encode($myarray);
?>