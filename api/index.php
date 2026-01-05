<?php
session_start();

include("config.php");

$instruction = explode("/", $_GET["par1"]);

switch ($instruction[0]) {
    case "loginguard":
        $data = [
            "api_key" => $api_key,
            "table" => $users_table,
            "data" => json_encode($_POST["data"]),
            "password_field" => $_POST["passwordField"]
        ];

        $url = $base_url_endpoint."login";

        $ch = curl_init();

        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_POST, true);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $data);

        $response = curl_exec($ch);

        $response_array = json_decode($response, true);

        if (!isset($response_array["error"])) {
            $_SESSION["user"] = $response_array;
        }

        break;

    case "signupguard":
        $data = [
            "api_key" => $api_key,
            "table" => $users_table,
            "data" => json_encode($_POST["data"]),
            "password_field" => $_POST["passwordField"],
            "password_check" => $_POST["passwordCheck"],
            "email_field" => $_POST["emailField"]
        ];

        $url = $base_url_endpoint."signup";

        $ch = curl_init();

        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_POST, true);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $data);

        $response = curl_exec($ch); 

        break;

    case "logincheck":
        if (isset($_SESSION["user"])) $response = json_encode($_SESSION["user"]);
        else $response = json_encode(false);

        break;
    
    case "logout":
        unset($_SESSION["user"]);
        $response = json_encode("ok");

        break;

    case "get-product-lists":
        $data = [
            "api_key" => $api_key,
            "data" => json_encode($_POST),
        ];

        $url = $base_url_endpoint."get-product-lists";

        $ch = curl_init();

        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_POST, true);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $data);

        $response = curl_exec($ch); 

        break;

    case "addproduct":
        $data = [
            "api_key" => $api_key,
            "table" => $products_table,
            "data" => json_encode($_POST)
        ];

        $image = null;
        if (isset($_FILES["kep"])) {
            $image = new CURLFile(
                $_FILES["kep"]["tmp_name"],
                $_FILES["kep"]["type"],
                $_FILES["kep"]["name"]
            );
        }

        if ($image) {
            $data["image"] = $image;
        }

        $url = $base_url_endpoint."addproduct";

        $ch = curl_init();

        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_POST, true);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $data);

        $response = curl_exec($ch); 

        break;

    case "delete-product":
        $data = [
            "api_key" => $api_key,
            "table" => $products_table,
            "id_field" => $_POST["idField"],
            "id_value" => $_POST["id"]
        ];

        $url = $base_url_endpoint."delete-product";

        $ch = curl_init();

        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_POST, true);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $data);

        $response = curl_exec($ch); 

        break;
    case "get-product-by-id":
        $data = [
            "api_key" => $api_key,
            "table" => $products_table,
            "id_field" => $_POST["idField"],
            "id_value" => $_POST["id"]
        ];

        $url = $base_url_endpoint."get-product-by-id";

        $ch = curl_init();

        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_POST, true);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $data);

        $response = curl_exec($ch); 

        break;
    case "update-product":
        $data = [
            "api_key" => $api_key,
            "table" => $products_table,
            "images" => $product_images,
            "image_field" => $image_field,
            "product_id" => $product_id,
            "special_field" => $product_special,
            "special_true" => $special_true,
            "special_false" => $special_false,
            "data" => json_encode($_POST)
        ];

        $image = null;
        if (isset($_FILES["kep"]) && $_FILES["kep"]["name"] != "") {
            $image = new CURLFile(
                $_FILES["kep"]["tmp_name"],
                $_FILES["kep"]["type"],
                $_FILES["kep"]["name"]
            );
        }

        if ($image) {
            $data["image"] = $image;
        }

        $url = $base_url_endpoint."update-product";

        $ch = curl_init();

        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_POST, true);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $data);

        $response = curl_exec($ch); 

        break;
}


echo $response;



?>