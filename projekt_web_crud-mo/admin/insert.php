<?php
include_once "header.php";
$db = $GLOBALS['db'];

if(isset($_POST['submit'])) {
    $insertMenuItem = $db->insertMenuItem($_POST['zobr_nazov'], $_POST['sys_nazov'], $_POST['cesta_path']);

    if($insertMenuItem) {
        header("Location: menu-web.php");
    } else {
        echo "ERROR!!!";
    }
} else {
    ?>
    <form action="" method="post">
        Display name: <br>
        <input name="zobr_nazov" type="text" placeholder="Menu display name"><br>
        Sys name:<br>
        <input name="sys_nazov" type="text" placeholder="Menu system name"><br>
        Path:<br>
        <input name="cesta_path" type="text" placeholder="Menu URL"><br>
        <input type="submit" name="submit" value="Insert"><br>
    </form>
    <?php
}
?>
