<?php
class ArticleRepository {

    public function __construct(private PDO $pdo) {}

    public function findAll(): array {
        return $this->pdo->query(
            'SELECT a.id, a.titre, a.dateCreation, c.libelle AS categorie
             FROM Article a
             JOIN Categorie c ON a.categorie = c.id
             ORDER BY a.dateCreation DESC'
        )->fetchAll();
    }

    public function findByCategorie(int $categorieId): array {
        $stmt = $this->pdo->prepare(
            'SELECT a.id, a.titre, a.dateCreation, c.libelle AS categorie
             FROM Article a
             JOIN Categorie c ON a.categorie = c.id
             WHERE a.categorie = ?
             ORDER BY a.dateCreation DESC'
        );
        $stmt->execute([$categorieId]);
        return $stmt->fetchAll();
    }

    public function findLatestPerCategorie(): array {
        return $this->pdo->query(
            'SELECT a.id, a.titre, a.dateCreation, c.libelle AS categorie
             FROM Article a
             JOIN Categorie c ON a.categorie = c.id
             WHERE a.dateCreation = (
                 SELECT MAX(a2.dateCreation) FROM Article a2
                 WHERE a2.categorie = a.categorie
             )
             ORDER BY c.id ASC'
        )->fetchAll();
    }

    public function findById(int $id): array|false {
        $stmt = $this->pdo->prepare(
            'SELECT a.id, a.titre, a.contenu, a.dateCreation, c.libelle AS categorie
             FROM Article a
             JOIN Categorie c ON a.categorie = c.id
             WHERE a.id = ?'
        );
        $stmt->execute([$id]);
        return $stmt->fetch();
    }
}
