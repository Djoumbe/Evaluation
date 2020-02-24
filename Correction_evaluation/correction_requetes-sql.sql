# 8. Quel sont les parties politiques qui dans leur libellé comporte le terme « Union »
USE Repertoire_elus_nationaux;
SELECT libelle from nuancier 
where libelle 
like "%Union%";

#9. Quels élus du département du « var » sont naît entre le mois de juin et aout ?

SELECT nom ,prenom , villes.name
FROM elus 
INNER JOIN villes  ON elus.code_insee = villes.code_insee and month (Date_de_naissance) between 06 AND 08
INNER JOIN departement ON villes.departement_code = departement.code
and departement.name = 'var';


#10. Quel est l’âge moyen des élus homme au 01/01/2014 ? Celui des élus femme ?

SELECT nom , prenom ,sexe , TIMESTAMPDIFF(year,date_de_naissance,"2014-01-01") AS age
FROM elus group by sexe;

SELECT nom ,prenom ,sexe , TIMESTAMPDIFF(year,date_de_naissance,"2014-01-01") AS age
FROM elus where sexe like "%F%" limit 20;

#11. Afficher la population totale du département des « Bouches-du-Rhône »
SELECT sum(population_legale) as totale_population 
from population 
join villes 
on villes.code_insee = population.code_insee and departements.code = 13;

#12. Quel sont les 10 départements comptant le plus d’ouvriers.
select sum(ouvriers) as totale_ouvriers
from categorie c 
join villes v on v.code_insee = c.code
join departemets on d.code = v.departement_code 
group by nom_normalise
order by totale_ouvriers desc limit 10;

#13. Afficher le nombre d’élus regrouper par nuance politique et par département.

SELECT COUNT(nom) as nombre_elus , departement.name , nuancier.libelle
from elus 
join villes
on elus.code_insee = villes.code_insee
JOIN departements
ON departements.code = villes.departement_code
JOIN nuancier 
on elus.code_nuance_liste = nuancier.code 
group by libelle , departement.name; 

#14. Afficher le nombre d’élus regroupé par nuance politique et par villes pour le département des « Bouches-du-Rhône ».
SELECT COUNT(nom) as nombre_elus , ville.name , nuancier.libelle
from elus 
join villes
on elus.code_insee = villes.code_insee
JOIN departements
ON departements.code = villes.departement_code and villes.departement_code = "13" 
JOIN nuancier 
on elus.code_nuance_liste = nuancier.code  
where departements.name = "Bouches-du-Rhône" 
group by libelle , villes.name ; 

#15. Afficher les 10 départements dans lesquelles il y a le plus d’élus femme, ainsi que le nombre d’élus femme correspondant.
SELECT COUNT(sexe) as nb_delus, departement_code as num_departement 
from elus 
inner join as villes on elus.code_insee = villes.code_insee and sexe = "F"
group by departement_code
order by nb_delus desc limit 10;

#16. Donner l’âge moyen des élus par départements au 01/01/2014. Les afficher par ordre décroissant.
SELECT - 2013 YEAR(Date_de_naissance) as age 
from elus 
inner join villes on elus.code_insee = villes.code_insee
inner join deparetments on villes.departement_code = departement;


# 17. Afficher les départements où l’âge moyen des élus est strictement inférieur à 54 ans.
SELECT AVG(2019 - YEAR(DATE_DE_NAISSANCE)) AS AGE, DEPARTEMENT_CODE
FROM ELUS
INNER JOIN VILLES ON ELUS.CODE_INSEE = VILLES.CODE_INSEE
GROUP BY DEPARTEMENT_CODE
HAVING AVG(AGE) < 54 
ORDER BY AGE
;
