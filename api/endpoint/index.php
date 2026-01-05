<?php
include("connect.php");

$url_data = explode("/", $_GET["par1"]);

switch ($url_data[0]) {
    case "signup":
        include("../../modules/signup.php");
        break;
    case "login":
        include("../../modules/login.php");
        break;
    case "get-product-lists":
        include("../../modules/get_product_lists.php");
        break;
    case "addproduct":
        include("../../modules/save_product.php");
        break;
    case "delete-product":
        include("../../modules/delete_product.php");
        break;
    case "get-product-by-id":
        include("../../modules/get_product_by_id.php");
        break;
    case "update-product":
        include("../../modules/update_product.php");
        break;
}


echo json_encode($response);



?>