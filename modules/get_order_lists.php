<?php
include("../connect.php");

$response = [];

foreach ($_POST as $idx => $item) {
    $result = $connect->query("select * from ".$item["table"]);

    $response[$idx] = [];

    while ($row = mysqli_fetch_assoc($result)) {
        array_push($response[$idx], $row);
    }
}

echo json_encode($response);




?>