<?php
include_once "header.php";
$db = $GLOBALS['db'];
$menu = $db->getMenu();

echo "<ul>";
foreach ($menu as $menuItem) {
    echo "<li><b>".$menuItem['name']."</b> &nbsp&nbsp<a href='update.php?id=".$menuItem['id']."'style='color:#18a558'>Update</a>&nbsp&nbsp
            <a href='delete.php?id=".$menuItem['id']."'style='color:#FF0000'>DELETE</a> </li>";
}
echo "</ul>";
?>
<br>
&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<b><a href='insert.php'style='color:#110ece'>Insert new menu item</a></b>

