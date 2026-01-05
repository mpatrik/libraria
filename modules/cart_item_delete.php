<?php
session_start();

unset($_SESSION["cart"][$_POST["id"]]);

echo json_encode("ok");

?>