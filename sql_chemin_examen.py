from sqlalchemy import create_engine
import pandas as pd

engine = create_engine('mysql+pymysql://RNE_user:RNE_password13@localhost:3306/Repertoire_elus_nationaux')

nom_col_emboite = ['id', 'code_insee' , 'mode_scrutin', 'num_list', 'numero_candidat_liste', 'tour', 'nom', 'prenom', 'date_de_naissance', 'libellé_profession', 'nationalité']

def chargement(link,table):
    print("Chargement des données")
    df = pd.read_excel(link , skiprows=0,header=1, names = nom_col_emboite)
    df.to_sql('elus', con = engine, if_exists='append', index = False)
    return print("Fin du chargement des données")

chargement('/home/utilisateur/Téléchargements/Projet_examen/elus_mun2014.xlsx', 'elus')

