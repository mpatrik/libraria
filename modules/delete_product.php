<?php


$query = "delete from ".$_POST["table"]." where ".$_POST["id_field"]."=".$_POST["id_value"];

$connect->query($query);

$response["message"] = "ok";


?>