<?php
session_start();

$_SESSION["cart"][$_POST["id"]]["quantity"] += $_POST["difference"];

if ($_SESSION["cart"][$_POST["id"]]["quantity"] == 0) {
    $_SESSION["cart"][$_POST["id"]]["quantity"] = 1;
}

echo json_encode("ok");



?>