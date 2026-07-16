async function afficherArticles(params) {
    const container = document.getElementById('articles-container');
    const articles   = await fetchArticles(params);

    if (!articles.length) {
        container.innerHTML = '<p class="chargement">Aucun article disponible.</p>';
        return;
    }

    container.innerHTML = '';
    articles.forEach(a => {
        const div = document.createElement('div');
        div.className = 'article-card';
        div.innerHTML = `<h3>${a.titre}</h3><p class="article-meta">${a.categorie} &mdash; ${a.dateCreation.substring(0, 10)}</p>`;
        div.addEventListener('click', () => ouvrirModal(a.id));
        container.appendChild(div);
    });
}

async function ouvrirModal(id) {
    const a = await fetchArticle(id);
    document.getElementById('modal-categorie').textContent = a.categorie;
    document.getElementById('modal-titre').textContent     = a.titre;
    document.getElementById('modal-date').textContent      = a.dateCreation.substring(0, 10);
    document.getElementById('modal-contenu').textContent   = a.contenu;
    document.getElementById('overlay').classList.add('actif');
}

function fermerModal() {
    document.getElementById('overlay').classList.remove('actif');
}
