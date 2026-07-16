<?php
require_once 'connexion.php';
header('Content-Type: application/json');

$id = (int)($_GET['id'] ?? 0);
if (!$id) {
    echo json_encode(['erreur' => 'id manquant']);
    exit;
}

$stmt = $pdo->prepare('SELECT a.id, a.titre, a.contenu, a.dateCreation, c.libelle AS categorie
                       FROM Article a
                       JOIN Categorie c ON a.categorie = c.id
                       WHERE a.id = ?');
$stmt->execute([$id]);
$article = $stmt->fetch();

echo json_encode($article ?: ['erreur' => 'article introuvable']);
