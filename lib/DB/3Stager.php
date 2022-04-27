<?php
require('connection.php');
$makeQuery= "SELECT * FROM thirdTradingMonth WHERE portfolioID LIKE '442232%';";
$statement = $connection->prepare($makeQuery);
$statement->execute();

$myarray=array();
while($resultsFrom= $statement->fetch()){
array_push(
$myarray,array(
"portfolioID"=>$resultsFrom['portfolioID'],
"securityID3.1"=>$resultsFrom['securityID3.1'],
"securityAmount3.1"=>$resultsFrom['securituAmount3.1'],
"tranDate3"=>$resultsFrom['date3OfTransaction'],
"typeTran3"=>$resultsFrom['transType3.1'],
"company3.1"=>$resultsFrom['company3.1'],
"compDescr3.1"=>$resultsFrom['companyDescr3.1'],
"currency3.1"=>$resultsFrom['currency3.1'],
"price1"=>$resultsFrom['price1_3_1'],
"price1Date"=>$resultsFrom['price1_3_1Date'],
"price2"=>$resultsFrom['price2_3_1'],
"price2Date"=>$resultsFrom['price2_3_1Date'],
"price3"=>$resultsFrom['price3_3_1'],
"price3Date"=>$resultsFrom['price3_3_1Date'],
"price4"=>$resultsFrom['price4_3_1'],
"price4Date"=>$resultsFrom['price4_3_1Date'],
"price5"=>$resultsFrom['price5_3_1'],
"price5Date"=>$resultsFrom['price5_3_1Date'],
"securityID3.2"=>$resultsFrom['securityID3.2'],
"securityAmount3.2"=>$resultsFrom['securityAmount3.2'],
"typeTran3.2"=>$resultsFrom['transType3.2'],
"company3.2"=>$resultsFrom['company3.2'],
"compDescr3.2"=>$resultsFrom['companyDescr3.2'],
"currency3.2"=>$resultsFrom['currency3.2'],
"price1_3_2"=>$resultsFrom['price1_3_2'],
"price1_3_1Date"=>$resultsFrom['price1_3_2Date'],
"price2_3_2"=>$resultsFrom['price2_3_2'],
"price2_3_2Date"=>$resultsFrom['price2_3_2Date'],
"price3_3_2"=>$resultsFrom['price3_3_2'],
"price3_3_2Date"=>$resultsFrom['price3_3_2Date'],
"price4_3_2"=>$resultsFrom['price4_3_2'],
"price4_3_2Date"=>$resultsFrom['price4_3_2Date'],
"price5_3_2"=>$resultsFrom['price5_3_2'],
"price5_3_2Date"=>$resultsFrom['price5_3_2Date']
)
);
}
echo json_encode($myarray);
?>