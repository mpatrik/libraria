<?php
$data_array = json_decode($_POST["data"], true);

$conditions = [];

foreach ($data_array as $field => $value) {
    if ($field == $_POST["password_field"]) {
        array_push($conditions, $field."='".md5($value)."'");
    } else {
        array_push($conditions, $field."='".$value."'");
    }
}

$query = "select * from ".$_POST["table"]." where ".implode(" and ", $conditions);

$result = $connect->query($query);

if (mysqli_num_rows($result) == 1) {
    $response = mysqli_fetch_assoc($result);
} else $response["error"] = "Sikertelen belépés!";


?>