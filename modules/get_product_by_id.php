<?php

$result = $connect->query("select * from ".$_POST["table"]." where ".$_POST["id_field"]."=".$_POST["id_value"]);

$response = mysqli_fetch_assoc($result);

?>