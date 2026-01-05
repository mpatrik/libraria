<?php
include("../connect.php");

$data = $connect->query("select ".$_POST["nameField"]." from ".$_POST["table"]." where ".$_POST["idField"]."=".$_POST["category"]);



$response = mysqli_fetch_assoc($data);

echo json_encode($response);

?>