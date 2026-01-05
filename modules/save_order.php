<?php
session_start();
include("../connect.php");

$post_data = $_POST["data"];
$key_data = $_POST["keyData"];
$order_data = $_POST["orderData"];
$order_items = $_POST["orderItems"];


//megrendelő kezelése
$guard = $connect->query("select * from ".$key_data["table"]." where ".$key_data["field"]."='".$_POST["data"][$key_data["table"]][$key_data["field"]]."'");

if (mysqli_num_rows($guard) == 0) { // nincs még regisztrálva
    // regisztrálom
    $fields = [];
    $values = [];

    foreach ($_POST["data"][$key_data["table"]] as $field => $value) {
        array_push($fields, $field);
        array_push($values, $value);
    }

    // alap jelszó generálása
    array_push($fields, $key_data["passwordField"]);
    array_push($values, md5("123456aA"));

    $query = "insert into ".$key_data["table"]." (".implode(",", $fields)." ) values ('".implode("','", $values)."')";

    $connect->query($query);

    // lekérdezzük a frissen felvitt record adatait
    $result = $connect->query("select * from ".$key_data["table"]." order by ".$key_data["keyField"]." DESC limit 0,1");

    $user_row = mysqli_fetch_assoc($result);

} else {
    // már regisztrált az email cím tehát csak az azonosító kell 
    $user_row = mysqli_fetch_assoc($guard);
}

// megrendelés törzsadatok
$fields = [];
$values = [];

foreach ($_POST["data"][$order_data["table"]] as $field => $value) {
    array_push($fields, $field);
    array_push($values, $value);
}

array_push($fields, $order_data["customerField"]);

array_push($values, $user_row[$key_data["keyField"]]);

array_push($fields, $order_data["dateField"]);

array_push($values, date("Y-m-d H:i:s"));

$query = "insert into ".$order_data["table"]." (".implode(",", $fields)." ) values ('".implode("','", $values)."')";

$connect->query($query);

// lekérdezzük a frissen felvitt record adatait
$result = $connect->query("select * from ".$order_data["table"]." order by ".$order_items["orderId"]." DESC limit 0,1");

$order_row = mysqli_fetch_array($result);

$new_order_id = $order_row[$order_items["orderId"]];

// megrendelés tételeinek mentése
foreach ($_SESSION["cart"] as $idx => $item ) {
    $fields = [];
    $values = [];

    foreach ($order_items["cartFields"] as $field) {
        array_push($fields, $field);
        array_push($values, $item[$field]);
    }

    array_push($fields, $order_items["orderId"]);
    array_push($values, $new_order_id);

    $query = "insert into ".$order_items["table"]." (".implode(",", $fields)." ) values ('".implode("','", $values)."')";

    $connect->query($query);
}


echo json_encode($query);

?>