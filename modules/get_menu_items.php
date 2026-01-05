<?php
include("../connect.php");

$data = $connect->query("select * from ".$_POST["table"]);

$response = [];

while ($row = mysqli_fetch_assoc($data)) {
    array_push($response, $row);
}

echo json_encode($response);



?>