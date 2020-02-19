#3. Créer une base de données « RNE »
#4. Y créer les tables destinées à accueillir les six fichiers cités plus haut. 
#A vous de bien choisir la longueur des champs et les types adéquate.
#Utilisez pour noms de colonnes ceux renvoyer par r_names(). Le nom des tables doit être :

CREATE TABLE categorie (
id INTEGER PRIMARY KEY,
code varchar (10),
Nb_emplois_lieu_de_travail varchar (10),
Artisans_commerçants_chef_entreprise varchar (10),
Cadre_et_profession_intellectuelles varchar (10),
Cadre_professions varchar (10),
Professions_intermediaires varchar (10),
Employes varchar (10),
Ouvriers varchar (10)
);

CREATE TABLE villes ( 
id INTEGER PRIMARY KEY,
departement_code varchar(8),
insee_code varchar(15),
zip_code varchar(10),
name varchar(50)
)

CREATE TABLE codes_nuances (
id INTEGER PRIMARY KEY,
code varchar(4),
libellé varchar(45),
ordre int(2),
définition varchar(350));


CREATE TABLE departements (
id INTEGER PRIMARY KEY,
region_code varchar(4),
name varchar (45),
nom_normalisé varchar (45)
);

CREATE TABLE elus (
code_insee varchar (7),
mode_scrutin varchar (15),
num_list int(2),
code_nuance_liste varchar(6),
numero_candidat_liste varchar(2), 
tour varchar(2),
nom varchar(50),
prenom varchar (50),
sexe varchar (2),
date_de_naissance DATETIME ,
libelle_profession varchar (100),
nationalite varchar(1))


CREATE TABLE population (
id INTEGER PRIMARY KEY,
code int (6),
population_légale_2017 int (7)
)

#Ecrire la requête qui va créer un nouvelle utilisateur MySQL « RNE_user » avec pour
# mot de passe « RNE_pasword » et lui accorder tous les droits sur la base RNE. Utiliser
# cette utilisateur pour la suite.

CREATE USER 'RNE_user'@'localhost' IDENTIFIED by 'RNE_password13';
GRANT ALL PRIVILEGES ON *.* TO  'RNE_user'@'localhost'
FLUSH PRIVILEGES;


