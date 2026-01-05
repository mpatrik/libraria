<?php
$data_array = json_decode($_POST["data"], true);

foreach ($data_array as $idx => $item) {
    $result = $connect->query("select * from ".$item["table"]);

    $response[$idx] = [];

    while ($row = mysqli_fetch_assoc($result)) {
        array_push($response[$idx], $row);
    }
}


?>