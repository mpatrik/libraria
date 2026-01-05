<?php
session_start();

if (!isset($_SESSION["cart"])) {
    $_SESSION["cart"] = []; // ha nem létezik még a "kosar", akkor üres tömbként kerül definiálásra
}

$response = [
    "cart_items" => $_SESSION["cart"],
    "cart_size" => count($_SESSION["cart"])
];

echo json_encode($response);




?>