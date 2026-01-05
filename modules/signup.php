<?php
$data_array = json_decode($_POST["data"], true);

$response["error"] = [];

$fields = [];
$values = [];
$placeholders = [];
$types = "";

foreach ($data_array as $field => $value) {
    array_push($fields, $field);
    array_push($placeholders, "?");
    $types .= "s";

    if ($value == "") {
        array_push($response["error"], "Hiányos kitöltés!");
    } else {
        if ($field == $_POST["password_field"]) {
            if ($value != $_POST["password_check"]) {
                array_push($response["error"], "Jelszavak nem egyeznek!");
            }
            
            array_push($values, md5($value));
        } else array_push($values, $value);

        if ($field == $_POST["email_field"]) {
            if (!str_contains($value, "@")) {
                array_push($response["error"], "Nem szabványos email cím!");
            } else {
                $email_guard = $connect->query("select * from ".$_POST["table"]." where ".$field."='".$value."'");
                if (mysqli_num_rows($email_guard) == 1) {
                    array_push($response["error"], "Már létező email cím!");
                }
            }
        } 
    }

}

if (count($response["error"]) == 0) {
    $fields = implode(",", $fields);
    $placeholders = implode(",", $placeholders);

    $stmt = $connect->prepare("insert into ".$_POST["table"]." (".$fields.") values(".$placeholders.")");
    $stmt->bind_param($types, ...$values);
    $stmt->execute();
} else {
    $response["error"] = array_values(array_unique($response["error"]));
}




?>