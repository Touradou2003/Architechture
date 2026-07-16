CREATE DATABASE IF NOT EXISTS mglsi_news;
USE mglsi_news;

DROP TABLE IF EXISTS Article, Categorie;

CREATE TABLE Categorie (
    id int primary key auto_increment,
    libelle varchar(20)
);

CREATE TABLE Article (
    id int primary key auto_increment,
    titre varchar(255),
    contenu text,
    dateCreation datetime DEFAULT NOW(),
    categorie int,
    CONSTRAINT fk_categorie_article FOREIGN KEY(categorie) REFERENCES Categorie(id)
);

INSERT INTO Categorie(libelle) VALUES ('Sport'), ('Santé'), ('Education'), ('Politique');

INSERT INTO Article (titre, contenu, dateCreation, categorie) VALUES
    -- Sport (categorie 1)
    ('Première victoire du Sénégal en Coupe du Monde',
     'Le Sénégal a remporté une victoire historique lors de sa première participation à la Coupe du Monde. L équipe nationale, portée par un public en délire, a battu son adversaire sur le score de 3-1. Le capitaine a inscrit un doublé en seconde période, offrant une joie immense à tout le peuple sénégalais. Cette victoire marque un tournant dans l histoire du football africain et place le Sénégal parmi les nations à suivre sur la scène internationale.',
     '2026-06-10 08:00:00', 1),
    ('Début de la CAN 2026 : le Sénégal favori',
     'La Coupe d Afrique des Nations 2026 a officiellement débuté avec un match d ouverture spectaculaire. Le Sénégal, tenant du titre, est présenté comme le grand favori de cette édition. Le sélectionneur a dévoilé sa liste de 23 joueurs, avec plusieurs nouvelles têtes prometteuses. Les matchs de poule se jouent dans trois pays hôtes différents, ce qui promet une compétition ouverte et passionnante pour tous les amateurs de football africain.',
     '2026-06-20 09:00:00', 1),
    ('Le lutteur Modou Lô remporte le titre suprême',
     'Dans une arène de Demba Diop comble, Modou Lô a défendu avec brio son titre de roi des arènes. Face à un adversaire coriace, le lutteur de Pikine a montré toute sa technique et sa puissance en remportant le combat en moins de dix minutes. Des milliers de supporters ont envahi les rues de Dakar pour célébrer cette victoire. La lutte sénégalaise confirme une fois de plus son statut de sport roi dans le pays.',
     '2026-06-28 10:00:00', 1),
    ('Les Lions de la Téranga qualifiés pour la CAN',
     'Après une campagne de qualification sans faute, les Lions de la Téranga ont validé leur billet pour la prochaine édition de la Coupe d Afrique des Nations. Six victoires en six matchs, dix-huit buts marqués et seulement deux encaissés : le bilan est impressionnant. Le staff technique se dit satisfait de la progression du groupe et compte bien aller chercher un deuxième trophée continental consécutif.',
     '2026-07-05 11:00:00', 1),
    ('Création d une académie de football à Thiès',
     'Une nouvelle académie de football a ouvert ses portes à Thiès, avec pour objectif de former les talents de demain. Financée en partie par une fédération européenne partenaire, elle accueille cent jeunes joueurs âgés de douze à dix-huit ans. Les infrastructures comprennent trois terrains synthétiques, un internat et un centre médical. Le président de la fédération sénégalaise de football a salué cette initiative qui contribue au développement du football à la base.',
     '2026-07-14 08:30:00', 1),

    -- Santé (categorie 2)
    ('Campagne nationale de vaccination contre le paludisme',
     'Le ministère de la Santé a lancé une vaste campagne de vaccination contre le paludisme ciblant les enfants de moins de cinq ans dans les régions à forte prévalence. Plus de deux millions de doses ont été distribuées à travers le pays. Les équipes médicales mobiles sillonnent les zones rurales pour atteindre les populations les plus éloignées des centres de santé. Les premiers résultats montrent une adhésion massive de la population à cette initiative de santé publique.',
     '2026-06-12 09:00:00', 2),
    ('Ouverture du nouveau CHU de Diamniadio',
     'Le Centre Hospitalier Universitaire de Diamniadio a officiellement ouvert ses portes après deux ans de travaux. D une capacité de cinq cents lits, il est équipé des technologies médicales les plus récentes et dispose d un service de chirurgie cardiaque, une première en dehors de Dakar. Cet hôpital représente un investissement de plus de cent milliards de francs CFA et devrait réduire significativement les évacuations sanitaires vers l étranger.',
     '2026-06-22 10:00:00', 2),
    ('Lutte contre le diabète : les chiffres alarmants au Sénégal',
     'Selon une étude publiée par l Institut de Santé Publique, le diabète touche désormais près de dix pour cent de la population adulte sénégalaise. L urbanisation rapide et le changement des habitudes alimentaires sont pointés comme les principaux facteurs. Le ministère de la Santé a annoncé un plan national de prévention incluant des campagnes de sensibilisation dans les écoles et les entreprises, ainsi que la distribution gratuite de bandelettes de glycémie dans les postes de santé.',
     '2026-06-30 11:00:00', 2),
    ('Les herbes médicinales africaines sous la loupe des chercheurs',
     'Une équipe de chercheurs de l Université Cheikh Anta Diop mène des travaux approfondis sur les propriétés thérapeutiques de plantes médicinales utilisées depuis des générations au Sénégal. Parmi les résultats prometteurs, le kinkeliba montrerait des effets antidiabétiques significatifs et le neem des propriétés antiparasitaires confirmées. Ces recherches pourraient déboucher sur la production de médicaments locaux à moindre coût.',
     '2026-07-07 09:30:00', 2),
    ('Santé mentale : briser le tabou dans les universités',
     'Face à la montée des cas de détresse psychologique chez les étudiants, plusieurs universités sénégalaises ont mis en place des cellules d écoute et d accompagnement psychologique. Un programme pilote lancé à l UCAD a permis de prendre en charge plus de trois cents étudiants en un semestre. Les spécialistes insistent sur la nécessité de déstigmatiser les troubles mentaux et d intégrer la santé mentale dans les politiques de santé publique.',
     '2026-07-14 09:00:00', 2),

    -- Education (categorie 3)
    ("Inauguration d'un ENO à l'UVS",
     'L Université Virtuelle du Sénégal a inauguré un nouvel Espace Numérique Ouvert dans la région de Ziguinchor. Cet espace, entièrement connecté à la fibre optique, permet aux étudiants de la région d accéder aux cours en ligne dans des conditions optimales. Équipé de cent postes informatiques et d une salle de visioconférence, l ENO accueillera également des formations professionnelles courtes pour les jeunes de la région. Le ministre de l Enseignement Supérieur a présidé la cérémonie d inauguration.',
     '2026-06-15 08:00:00', 3),
    ('Réforme du baccalauréat sénégalais dès 2027',
     'Le gouvernement sénégalais a annoncé une réforme en profondeur du baccalauréat qui entrera en vigueur à partir de 2027. Le nouveau dispositif introduira des épreuves pratiques obligatoires, une réduction du nombre de séries et une plus grande place accordée aux matières scientifiques et technologiques. L objectif est d aligner le système éducatif sénégalais sur les standards internationaux et de mieux préparer les lycéens aux exigences du marché du travail.',
     '2026-06-25 10:00:00', 3),
    ('Le numérique au cœur de la nouvelle politique éducative',
     'Le Plan Sénégal Numérique 2025 prévoit la distribution de tablettes éducatives à tous les élèves du primaire dans les zones rurales. Ce projet ambitieux vise à réduire la fracture numérique et à moderniser les pratiques pédagogiques. Des formations ont déjà été dispensées à plus de dix mille enseignants sur l utilisation des outils numériques en classe. Les premiers retours des enseignants et des parents d élèves sont globalement positifs.',
     '2026-07-02 11:00:00', 3),
    ('Grève dans les universités : les étudiants réclament des bourses',
     'Les syndicats étudiants ont déclenché un mouvement de grève dans les universités publiques pour réclamer le paiement des bourses en retard et l amélioration des conditions d hébergement dans les campus. Des négociations sont en cours avec le ministère de tutelle. Le Crous a annoncé un plan d urgence pour régulariser les paiements en suspens d ici la fin du mois. Les cours reprennent progressivement dans certaines facultés.',
     '2026-07-09 09:00:00', 3),
    ('Les grandes écoles sénégalaises en tête des classements africains',
     'Plusieurs grandes écoles d ingénieurs et de commerce basées à Dakar figurent désormais dans le top vingt des meilleures institutions d enseignement supérieur du continent africain selon le dernier classement annuel. Cette reconnaissance internationale attire de plus en plus d étudiants étrangers, notamment de la sous-région ouest-africaine. Les experts attribuent ces bons résultats à la qualité du corps enseignant et aux partenariats avec des universités européennes et américaines.',
     '2026-07-14 10:00:00', 3),

    -- Politique (categorie 4)
    ('Election présidentielle : les candidats officiellement déclarés',
     'La Commission Electorale Nationale Autonome a publié la liste définitive des candidats retenus pour la prochaine élection présidentielle. Dix candidats ont été validés après vérification des parrainages et des dossiers administratifs. La campagne électorale débutera officiellement dans trois semaines. Les observateurs internationaux de l Union Africaine et de la CEDEAO seront présents pour superviser le bon déroulement du scrutin sur l ensemble du territoire national.',
     '2026-06-08 08:00:00', 4),
    ('Pétrole au Sénégal : les premiers revenus attendus',
     'Avec le démarrage de la production pétrolière offshore, le Sénégal attend ses premiers revenus significatifs issus des hydrocarbures. Le gouvernement a annoncé la création d un fonds souverain destiné à investir une partie de ces revenus dans les infrastructures, l éducation et la santé. Des économistes estiment que ces ressources pourraient transformer profondément l économie sénégalaise à condition d être gérées avec transparence et efficacité.',
     '2026-06-18 09:00:00', 4),
    ('Election en Mauritanie : tensions à la frontière',
     'La récente élection présidentielle en Mauritanie suscite des inquiétudes au niveau régional en raison de tensions post-électorales signalées dans plusieurs villes du pays. Le Sénégal a appelé au calme et au dialogue entre les différentes parties mauritaniennes. Des ressortissants sénégalais résidant en Mauritanie ont été invités à faire preuve de prudence. Le ministère des Affaires Etrangères suit de près l évolution de la situation et maintient des canaux de communication ouverts avec Nouakchott.',
     '2026-06-29 10:00:00', 4),
    ('Conseil des ministres : nouvelles nominations à la tête des institutions',
     'A l issue du dernier Conseil des ministres, le président de la République a procédé à plusieurs nominations importantes au sein des institutions de l Etat. Un nouveau directeur général a été nommé à la tête de la SENELEC, tandis que trois ministres ont vu leur portefeuille remanié. Ces changements interviennent dans un contexte de restructuration de l administration publique visant à améliorer l efficacité des services de l Etat et à renforcer la gouvernance.',
     '2026-07-06 11:00:00', 4),
    ('Le Sénégal préside le sommet de la CEDEAO',
     'Dakar accueille le sommet extraordinaire des chefs d Etat et de gouvernement de la Communauté Economique des Etats de l Afrique de l Ouest. Le Sénégal, qui assure la présidence tournante de l organisation, a inscrit à l ordre du jour les questions de sécurité au Sahel, la stabilité monétaire et le renforcement des échanges commerciaux intra-régionaux. Une déclaration commune est attendue en fin de sommet sur la situation sécuritaire dans la région.',
     '2026-07-14 11:00:00', 4);

CREATE USER IF NOT EXISTS 'touradou'@'localhost' IDENTIFIED BY 'passer';
GRANT ALL PRIVILEGES ON mglsi_news.* TO 'touradou'@'localhost';
FLUSH PRIVILEGES;
