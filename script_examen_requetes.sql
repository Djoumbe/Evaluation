# 8. Quel sont les parties politiques qui dans leur libellé comporte le terme « Union »
SELECT libelle from nuancier 
where libelle 
like "%Union%";

#9. Quels élus du département du « var » sont naît entre le mois de juin et aout ?
SELECT nom , prenom , date_de_naissance , name from elus 
INNER JOIN departement on departement.code = nuancier.code
INNER JOIN nuancier on 
where name like "%Var%" limit 15

#10. Quel est l’âge moyen des élus homme au 01/01/2014 ? Celui des élus femme ?
SELECT prenom , sexe , datediff(date_de_naissance date())
As age_moyen from elus 
where sexe like "%M%"
group by nom , prenom , sexe 
 limit 10; 

#11. Afficher la population totale du département des « Bouches-du-Rhône »
select name , population_legale from departement as totale_habitants
INNER JOIN population on 
population.code_insee = departement.code limit 10

#12. Quel sont les 10 départements comptant le plus d’ouvriers.
#13. Afficher le nombre d’élus regrouper par nuance politique et par département.
#14. Afficher le nombre d’élus regroupé par nuance politique et par villes pour le département des « Bouches-du-Rhône ».
#15. Afficher les 10 départements dans lesquelles il y a le plus d’élus femme, ainsi que le nombre d’élus femme correspondant.
#16. Donner l’âge moyen des élus par départements au 01/01/2014. Les afficher par ordre décroissant.