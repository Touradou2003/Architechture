<?php
require_once 'connexion_Persistance.php';
require_once 'Article_Persistance.php';
require_once 'Article_Service.php';
header('Content-Type: application/json');

$id = (int)($_GET['id'] ?? 0);
if (!$id) {
    echo json_encode(['erreur' => 'id manquant']);
    exit;
}

$service = new ArticleService(new ArticleRepository($pdo));
$article = $service->getArticle($id);

echo json_encode($article ?: ['erreur' => 'article introuvable']);
