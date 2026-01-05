<?php
$data_array = json_decode($_POST["data"], true);
$fields = [];
$values = [];

foreach ($data_array as $field => $value) {
    array_push($fields, $field);

    if ($field == "kiemelt") array_push($values, 1);
    else array_push($values, $value);
}

$image = "";

if ($_FILES["image"]["type"] == "image/png" || $_FILES["image"]["type"] == "image/jpeg") {
    move_uploaded_file($_FILES["image"]["tmp_name"], "../../images/books/".$_FILES["image"]["name"]);
    $image = "images/books/".$_FILES["image"]["name"];
}

array_push($fields, "kep");
array_push($values, $image);

$query = "insert into ".$_POST["table"]." (".implode(",", $fields)." ) values ('".implode("','", $values)."')";

$connect->query($query);

$response["message"] = "ok";


?>