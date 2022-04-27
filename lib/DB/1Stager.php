<?php
require('connection.php');
$makeQuery= "SELECT * FROM firstTradingMonth WHERE id='442232';";
$statement = $connection->prepare($makeQuery);
$statement->execute();

$myarray=array();
while($resultsFrom= $statement->fetch()){
array_push(
$myarray,array(
"portfolioID"=>$resultsFrom['portfolioID'],
"securityID"=>$resultsFrom['securityID'],
"tranDate"=>$resultsFrom['dateOfTran'],
"typeTran"=>$resultsFrom['typeOfTran'],
"securityAmount"=>$resultsFrom['securityAmount1'],
"company"=>$resultsFrom['company'],
"companyDesc"=>$resultsFrom['companyDescr'],
"currency"=>$resultsFrom['currency'],
"price1"=>$resultsFrom['price1'],
"price1Date"=>$resultsFrom['price1Date'],
"price2"=>$resultsFrom['price2'],
"price2Date"=>$resultsFrom['price2Date'],
"price3"=>$resultsFrom['price3'],
"price3Date"=>$resultsFrom['price3Date'],
"price4"=>$resultsFrom['price4'],
"price4Date"=>$resultsFrom['price4Date'],
"price5"=>$resultsFrom['price5'],
"price5Date"=>$resultsFrom['price5Date'],

)
);
}
echo json_encode($myarray);
?>