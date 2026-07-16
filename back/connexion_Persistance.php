<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);

$pdo = new PDO('mysql:host=localhost;dbname=mglsi_news;charset=utf8', 'touradou', 'passer', [
    PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION,
    PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
]);
