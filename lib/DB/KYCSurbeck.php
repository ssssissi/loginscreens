<?php
require('connection.php');
$makeQuery= "SELECT * FROM KYC WHERE clientID='168652';";
$statement = $connection->prepare($makeQuery);
$statement->execute();

$myarray=array();
while($resultsFrom= $statement->fetch()){
array_push(
$myarray,array(
"clientID"=>$resultsFrom['clientID'],
"firstName"=>$resultsFrom['firstName'],
"surname"=>$resultsFrom['surname'],
"address"=>$resultsFrom['address'],
"dateBirth"=>$resultsFrom['dateBirth'],
"govDocAttached"=>$resultsFrom['govDocAttached'],
"pepCheck"=>$resultsFrom['pepCheck'],
"mailAddress"=>$resultsFrom['mailAddress'],
"transitAccountNo"=>$resultsFrom['transitAccountNo'],
"transitAccountHolder"=>$resultsFrom['transitAccountHolder'],
"sourceWealth"=>$resultsFrom['sourceWealth'],
"clientKnow"=>$resultsFrom['clientKnow'],
"paperMail"=>$resultsFrom['paperMail']
)
);
}
echo json_encode($myarray);
?>