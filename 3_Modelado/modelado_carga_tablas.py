## Bienvenido al segundo script del Modelado de datos. A ejecutar este script vas a poblar las tablas en una se de datos MySQL
## Deberías tener tus credenciales cargadas en un .env según se explica en el Readme.
## Este script está pensado para ejecutarse una sola vez.


# importamos librerías
import pandas as pd
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker
from dotenv import load_dotenv
import os

##importo las clases

from modelado_modelo_ddl import Show, Show_type, Platform, Rating, Country, Show_for_country, Actor, Show_for_actor, Director, Show_for_director, Genre, Show_for_genre


# variables globales para la conexión
load_dotenv()
database_username= os.getenv('DATABASE_USERNAME')
database_password= os.getenv('DATABASE_PASSWORD')
database_ip= os.getenv('DATABASE_IP')
database_name=os.getenv('DATABASE_NAME')

engine = create_engine(f"mysql+pymysql://{database_username}:{database_password}@{database_ip}/{database_name}")
Session = sessionmaker(bind=engine)
session = Session()

#mini funcion para leer el csv

actor = pd.read_csv("./tablas/actor.csv")
country= pd.read_csv("./tablas/country.csv")
director = pd.read_csv("./tablas/director.csv")
genre = pd.read_csv("./tablas/genre.csv")
platform = pd.read_csv("./tablas/platform.csv")
rating = pd.read_csv("./tablas/rating.csv")
show_for_actor = pd.read_csv("./tablas/show_for_actor.csv")
show_for_country = pd.read_csv("./tablas/show_for_country.csv")
show_for_director = pd.read_csv("./tablas/show_for_director.csv")
show_for_genre = pd.read_csv("./tablas/show_for_genre.csv")
show_type = pd.read_csv("./tablas/show_type.csv")
show = pd.read_csv("./tablas/show.csv")

def populate_table(df, session, model_class):
    for i, row in df.iterrows():
        obj = model_class(**row.to_dict())
        session.add(obj)
    session.commit()
    print(f"La tabla {model_class.__tablename__} se ha poblado con éxito.")

populate_table(show_type, session, Show_type)    
populate_table(show_type, session, Show_type)    
populate_table(show_type, session, Platform)    
populate_table(show_type, session, Rating)    
populate_table(show_type, session, Show)    
populate_table(show_type, session, Country)    
populate_table(show_type, session, Show_for_country)    
populate_table(show_type, session, Actor)    
populate_table(show_type, session, Show_for_actor)    
populate_table(show_type, session, Director)    
populate_table(show_type, session, Show_for_director)    
populate_table(show_type, session, Genre)    
populate_table(show_type, session, Show_for_genre) 