<?php
class ArticleService {

    public function __construct(private ArticleRepository $repo) {}

    public function getArticlesPourAccueil(): array {
        return $this->repo->findLatestPerCategorie();
    }

    public function getArticlesParCategorie(int $categorieId): array {
        return $this->repo->findByCategorie($categorieId);
    }

    public function getTousLesArticles(): array {
        return $this->repo->findAll();
    }

    public function getArticle(int $id): array|false {
        return $this->repo->findById($id);
    }
}
