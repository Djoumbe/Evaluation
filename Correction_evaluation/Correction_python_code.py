# 2 Ecrire une fonction python parse_dates() qui admet pour entrer la liste renvoyer par
# r_names() et qui retourne une liste contenant seulement les noms de colonnes
# commençant par « Date».
from re import sub


def parse_dates(issou) :
  return [i for i in issou if i.startwith ('Date')]