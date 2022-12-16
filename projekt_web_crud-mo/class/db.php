<?php

namespace portalove;
class DB
{
    private $host;
    private $dbname;
    private $username;
    private $password;
    private $port;

    private $connection;

    public function __construct($host, $dbname, $username, $password, $port = 3306)
    {
        $this->host = $host;
        $this->dbname = $dbname;
        $this->username = $username;
        $this->password = $password;
        $this->port = $port;

        try{
            $this->connection = new \PDO('mysql:host=' . $host . ';dbname=' . $dbname .";port=" . $port, $username, $password);

            $dbh = null;

        }catch (\PDOException $e){
            print "Error!: " .$e->getMessage() . "<br/>";
            die();
        }
    }
    public function printNapojRows()
    {
        foreach ($this->connection->query('SELECT * FROM napoj') as $row){
            var_dump($row);
            echo "<br><br>";
        }
    }
    public function insertMenuItem($zobr_nazov, $sys_nazov, $cesta_path)
    {
        $currentDate = date('Y-m-d', time());
        $sql = "INSERT INTO menu(zobr_nazov, sys_nazov, cesta_path, vytvorene, upravene) 
                VALUE ('".$zobr_nazov."', '".$sys_nazov."','".$cesta_path."', '".$currentDate."', '".$currentDate."')";

        try{
            $this->connection->exec($sql);

            return true;

        }catch (\PDOException $e){
            print "Error!: " .$e->getMessage() . "<br/>";
            return false;
        }
    }
    public function getMenu()
    {
        $menuItems = [];

        $sql = "SELECT * FROM menu";
        $query = $this->connection->query($sql);
        while ($row = $query->fetch())  {
            $menuItems[] = [
                "id" => $row['id'],
                "name" => $row['zobr_nazov'],
                "path" => $row['cesta_path'],

            ];
        }
        return $menuItems;
    }
    public function getMenuItem($id)
    {
        $sql = "SELECT * FROM menu WHERE id = " . $id;
        try {
            $query = $this->connection->query($sql);
            $menuItem = $query->fetch(\PDO::FETCH_ASSOC);

            return $menuItem;

        } catch (\PDOException $e) {
            print "Error!: " . $e->getMessage() . "<br/>";
            return [];
        }
    }

    public function deleteMenuItem($id)
    {
        $sql = "DELETE FROM menu WHERE id = ".$id;
        try {
            $this->connection->exec($sql);
            return true;
        } catch (\PDOException $e) {
            print "Error!: " . $e->getMessage() . "<br/>";
            return false;
        }
    }
    public function updateMenuItem($zobr_nazov, $sys_nazov, $cesta_path, $id)
    {
        $currentDate = date('Y-m-d', time());
        $sql = "UPDATE menu SET zobr_nazov = '".$zobr_nazov."', sys_nazov = '".$sys_nazov."', cesta_path = '".$cesta_path."', upravene = '".$currentDate."' WHERE id = ".$id;

        try {
            $this->connection->exec($sql);

            return true;

        } catch (\PDOException $e) {
            print "Error!: " . $e->getMessage() . "<br/>";
            return false;
        }

    }
}

?>