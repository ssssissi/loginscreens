<?php
require('connection.php');
$makeQuery= "SELECT * FROM secondTradingMonth WHERE portfolioID LIKE '442232%';";
$statement = $connection->prepare($makeQuery);
$statement->execute();

$myarray=array();
while($resultsFrom= $statement->fetch()){
array_push(
$myarray,array(
"portfolioID"=>$resultsFrom['portfolioID'],
"securityID2_1"=>$resultsFrom['securityID2_1'],
"securityAmount2_1"=>$resultsFrom['securityAmount2_1'],
"tranDate2"=>$resultsFrom['dateOfTran2'],
"typeTran2"=>$resultsFrom['transType2_1'],
"company"=>$resultsFrom['company'],
"compDescr"=>$resultsFrom['compDescr'],
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
"securityID2_2"=>$resultsFrom['securityID2_2'],
"typeTran2_2"=>$resultsFrom['transType2_2'],
"company2"=>$resultsFrom['company2'],
"compDescr2"=>$resultsFrom['companyDescr2'],
"currency2"=>$resultsFrom['currency2'],
"price1_2"=>$resultsFrom['price1_2'],
"price1_2Date"=>$resultsFrom['price1_2Date'],
"price2_2"=>$resultsFrom['price2_2'],
"price2_2Date"=>$resultsFrom['price2_2Date'],
"price3_2"=>$resultsFrom['price3_2'],
"price3_2Date"=>$resultsFrom['price3_2Date'],
"price4_2"=>$resultsFrom['price4_2'],
"price4_2Date"=>$resultsFrom['price4_2Date'],
"price5_2"=>$resultsFrom['price5_2'],
"price5_2Date"=>$resultsFrom['price5_2Date']
)
);
}
echo json_encode($myarray);
?>