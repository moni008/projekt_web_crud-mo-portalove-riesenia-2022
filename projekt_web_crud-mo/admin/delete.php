<?php
include_once "header.php";
$db = $GLOBALS['db'];

if(isset($_GET['id'])) {
    $deleteMenuItem = $db->deleteMenuItem($_GET['id']);

    if($deleteMenuItem) {
        header("Location: menu-web.php");
    } else {
        echo "ERROR!!!";
    }
} else {
    echo "ERROR!!!";
}
?>
