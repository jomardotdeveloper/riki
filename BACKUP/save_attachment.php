<?php
require_once('config.php');
$success = False;
if ($_FILES["attached_payment"]['size'] != 0) {
    $target_dir = "uploads/payments/";
    $target_file = $target_dir . basename($_FILES["attached_payment"]["name"]);
    $uploadOk = 1;
    $imageFileType = strtolower(pathinfo($target_file, PATHINFO_EXTENSION));
    $check = getimagesize($_FILES["attached_payment"]["tmp_name"]);

    if ($check !== false) {
        $uploadOk = 1;
    } else {
        $uploadOk = 0;
    }
    if ($uploadOk != 0) {
        move_uploaded_file($_FILES["attached_payment"]["tmp_name"], $target_file);
        $id = $_POST["id"];
        $sql = "UPDATE service_requests SET attached_payment='$target_file' WHERE id=$id";
        $conn->query($sql);
        $success = true;
    }
}

$bits = explode("?", $_SERVER['HTTP_REFERER']);
$redirect = $bits[0] . "?p=my_services";
if (!$success) {
    $redirect .= "&&has_error=1";
}
header('Location: ' . $redirect);
