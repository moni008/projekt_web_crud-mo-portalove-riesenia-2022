<?php
include_once "header.php";
$db = $GLOBALS['db'];

if(isset($_POST['submit'])) {
    $updateMenuItem = $db->updateMenuItem($_POST['zobr_nazov'], $_POST['sys_nazov'], $_POST['cesta_path'], $_POST['id']);

    if($updateMenuItem) {
        header("Location: menu-web.php");
    } else {
        echo "ERROR!!!";
    }
} else {
    if(isset($_GET['id'])) {
        $menuItem = $db->getMenuItem($_GET['id']);
        ?>
        <form action="" method="post">
            Display name: <br>
            <input name="zobr_nazov" type="text" value="<?php echo $menuItem['zobr_nazov'] ?>"><br>
            Sys name:<br>
            <input name="sys_nazov" type="text" value="<?php echo $menuItem['sys_nazov'] ?>"><br>
            Path:<br>
            <input name="cesta_path" type="text" value="<?php echo $menuItem['cesta_path'] ?>"><br>
            <input name="id" type="hidden" value="<?php echo $menuItem['id'] ?>">
            <input type="submit" name="submit" value="Update"><br>
        </form>
        <?php
    } else {
        header("Location: menu-web.php");
    }
}
?>

