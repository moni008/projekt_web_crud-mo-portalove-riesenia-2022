<?php
include_once "class/db.php";

use portalove\DB;

$db = new DB("localhost", "mo_kaviaren", "root", "",3306);
global $menuItems;
$menuItems = $db->getMenu();
?>

