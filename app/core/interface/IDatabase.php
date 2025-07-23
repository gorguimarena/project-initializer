<?php

interface IDatabase {
    public function getConnexion(): PDO;
}