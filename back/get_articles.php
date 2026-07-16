<?php
require_once 'connexion.php';
header('Content-Type: application/json');

$categorie = (int)($_GET['categorie'] ?? 0);
$mode      = $_GET['mode'] ?? '';

if ($mode === 'accueil') {
    $sql  = 'SELECT a.id, a.titre, a.dateCreation, c.libelle AS categorie
             FROM Article a
             JOIN Categorie c ON a.categorie = c.id
             WHERE a.dateCreation = (
                 SELECT MAX(a2.dateCreation) FROM Article a2
                 WHERE a2.categorie = a.categorie
             )
             ORDER BY c.id ASC';
    $stmt = $pdo->query($sql);

} elseif ($categorie) {
    $stmt = $pdo->prepare('SELECT a.id, a.titre, a.dateCreation, c.libelle AS categorie
                           FROM Article a
                           JOIN Categorie c ON a.categorie = c.id
                           WHERE a.categorie = ?
                           ORDER BY a.dateCreation DESC');
    $stmt->execute([$categorie]);

} else {
    $stmt = $pdo->query('SELECT a.id, a.titre, a.dateCreation, c.libelle AS categorie
                         FROM Article a
                         JOIN Categorie c ON a.categorie = c.id
                         ORDER BY a.dateCreation DESC');
}

echo json_encode($stmt->fetchAll());
