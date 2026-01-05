<?php
$data_array = json_decode($_POST["data"], true);

$updates = [];
$special = 0;

foreach ($data_array as $field => $value) {

    if ($field == $_POST["special_field"]) {
        $special = 1;
        array_push($updates, $_POST["special_field"]."=".$_POST["special_true"]);
    } else if ($field != $_POST["product_id"]) {
        array_push($updates, $field."='".$value."'");
    }
}

if ($special == 0) array_push($updates, $_POST["special_field"]."=".$_POST["special_false"]);

if (isset($_FILES["image"])) {
    $image = "";

    if ($_FILES["image"]["type"] == "image/png" || $_FILES["image"]["type"] == "image/jpeg") {
        move_uploaded_file($_FILES["image"]["tmp_name"], "../../".$_POST["images"].$_FILES["image"]["name"]);
        $image = $_POST["images"].$_FILES["image"]["name"];
    }

    array_push($updates, $_POST["image_field"]."='".$image."'");
}


$query = "update ".$_POST["table"]." set ".implode(", ", $updates)." where ".$_POST["product_id"]."=".$data_array[$_POST["product_id"]];

$connect->query($query);

$response["message"] = "ok";


?>