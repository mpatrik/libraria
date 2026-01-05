<?php
include("../connect.php");
session_start();

$stmt = $connect->prepare("select * from ".$_POST["table"]." where ".$_POST["productId"]." = ?");
$stmt->bind_param("d", $_POST["id"]);
$stmt->execute();

$res = $stmt->get_result();

$product_data = mysqli_fetch_assoc($res);

if (isset($_SESSION["cart"][$_POST["id"]])) { // ha az adott cikkszám már benne van a kosárban
    $_SESSION["cart"][$_POST["id"]]["quantity"]++;
} else {
    $_SESSION["cart"][$_POST["id"]] = $product_data;
    $_SESSION["cart"][$_POST["id"]]["quantity"] = 1;
}



echo json_encode($product_data);




?>