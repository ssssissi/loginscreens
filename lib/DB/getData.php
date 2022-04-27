<?php
require('connection.php');
$makeQuery= "SELECT * FROM client";
$statement = $connection->prepare($makeQuery);
$statement->execute();

$myarray=array();
while($resultsFrom= $statement->fetch()){
array_push(
$myarray,array(
"id"=>$resultsFrom['id'],
"name"=>$resultsFrom['name'],
"surname"=>$resultsFrom['surname']
)
);
}
echo json_encode($myarray);
?>