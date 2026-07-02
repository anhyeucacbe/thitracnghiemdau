<?php


$isHttps = (
  (!empty($_SERVER['HTTPS']) && $_SERVER['HTTPS'] !== 'off') ||
  (isset($_SERVER['SERVER_PORT']) && $_SERVER['SERVER_PORT'] == 443)
);

$scheme = $isHttps ? 'https' : 'http';
$host = $_SERVER['HTTP_HOST'] ?? 'localhost';

define("BASE_URL", $scheme . "://" . $host . "/");


define("DB_HOST", "mysql");
define("DB_NAME", "thitracnghiem");
define("DB_USER", "root");
define("DB_PASS", "123456");
define("DB_PORT", 3306);