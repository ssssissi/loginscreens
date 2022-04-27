<?php
try{
$connection = new PDO('mysql:host=localhost,dbname=id18772989_performserver','id18772989_performuser','Pa$$w0rd2468');
$connection -> setAtrribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
echo "yes Connected";
} catch(PDOException $exc){
echo $exc -> getMessage();
die("could not connect");
}
?>