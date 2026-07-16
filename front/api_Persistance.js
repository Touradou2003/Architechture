const API_BASE = '../back';

async function fetchArticles(params = '') {
    const r = await fetch(`${API_BASE}/get_articles_controle.php${params}`);
    return r.json();
}

async function fetchArticle(id) {
    const r = await fetch(`${API_BASE}/get_article_controle.php?id=${id}`);
    return r.json();
}
