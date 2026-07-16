<?php
require_once 'connexion_Persistance.php';
require_once 'Article_Persistance.php';
require_once 'Article_Service.php';
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');

$service   = new ArticleService(new ArticleRepository($pdo));
$categorie = (int)($_GET['categorie'] ?? 0);
$mode      = $_GET['mode'] ?? '';

if ($mode === 'accueil') {
    $data = $service->getArticlesPourAccueil();
} elseif ($categorie) {
    $data = $service->getArticlesParCategorie($categorie);
} else {
    $data = $service->getTousLesArticles();
}

echo json_encode($data);
