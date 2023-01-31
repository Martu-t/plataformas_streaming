## Aquí se harán las transformaciones de las tablas para luego ser cargadas

## librerías
import pandas as pd
import numpy as np
import os
import re


# guardar los datos en df
disney = 'disney.csv'
netflix = 'netflix.csv'

df_disney = pd.read_csv(disney, delimiter=",")
df_netflix = pd.read_csv(netflix, delimiter=";")

#Agrego las una columna al final con las plataformas

df_disney['platform'] = 'Disney'
df_netflix['platform'] = 'Netflix'

def change_id(df):
    ## voy a remplazar los ids para que no se pisen, sustituyendo s por la primer letra de la plataforma
    if df == 'df_disney':
        df_disney['show_id'] = df_disney['show_id'].str.replace('s','D')
    elif df == 'df_netlfix':
        df_netflix['show_id'] = df_netflix['show_id'].str.replace('s','N')
    return df

def fix_rating(df_shows):
    df_shows['duration'] = np.where(df_shows['show_id'].isin(['N5542', 'N5795', 'N5814']), df_shows['rating'], df_shows['duration'])
    df_shows['rating'] = np.where(df_shows['show_id'].isin(['N5542', 'N5795', 'N5814']), 'NR', df_shows['rating'])
    df_shows['listed_in'] = np.where(df_shows['show_id'].isin(['N5542', 'N5795', 'N5814']), 'Comedy', df_shows['listed_in'])
    df_shows['rating'] = df_shows['rating'].fillna('NR')
    return df_shows


def fix_date(df_shows):
    try:
        df_shows['date_added']= pd.to_datetime(df_shows['date_added'])
        min_date = df_shows['date_added'].min()
        df_shows['date_added'] = df_shows['date_added'].fillna(min_date)
        return df_shows
    except:
        print("no se pudo cambiar el tipo de dato a datetime")

def fillna(df_shows):
    df_shows[['director', 'cast', 'country', 'listed_in']] = df_shows[['director', 'cast', 'country', 'listed_in']].fillna('unknown')
    return df_shows

def rename_col(df_shows):
    # voy a renombrar el show_id para que quede consistente con los otros ids y el de listed_in para que sea más descriptivo
    df_shows.rename(columns={"show_id": "id_show", "listed_in": "genres" }, inplace=True)
    return df_shows

def extract_duration_info(duration):
    '''esta funcion toma como argumento un string que contiene la duración (en minutos o season) y las separa en dos (num y unit). 
    Devuelve en tupla dichos valores '''
    split = duration.split(" ")
    num = int(split[0])
    unit = split[1]
    return num, unit

def check_and_remove(string):
    pattern = re.compile('^[^a-zA-Z]+|[^a-zA-Z]+$') 
    return re.sub(pattern, '', string)

def create_intermediate_table(df, column_name):
    intermediate_table = pd.melt(df, id_vars=["id_show"], value_vars=[column_name])
    intermediate_table = intermediate_table.assign(column_name=intermediate_table[column_name].str.split(', ')).explode(column_name)
    intermediate_table = intermediate_table.drop(columns=['variable', 'value'])
    intermediate_table["id_" + column_name] = intermediate_table.groupby([column_name]).ngroup() + 1
    #intermediate_table = intermediate_table.drop(columns=[column_name])
    return intermediate_table

def create_base_table(df_base, table_name):

    table_name = df_base.drop_duplicates(subset='table_name')
    table_name = table_name [['id_' + table_name, table_name]]
    table_name = table_name.sort_values(by='id_' + table_name)

    return table_name


