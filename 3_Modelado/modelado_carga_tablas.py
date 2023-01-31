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

from modelado_modelo_ddl import Show, Show_type, Rating, Country, Show_for_country, Actor, Show_for_actor, Director, Show_for_director, Genre, Show_for_genre


# variables globales para la conexión
load_dotenv()
database_username= os.getenv('DATABASE_USERNAME')
database_password= os.getenv('DATABASE_PASSWORD')
database_ip= os.getenv('DATABASE_IP')
database_name=os.getenv('DATABASE_NAME')

engine = create_engine(f"mysql+pymysql://{database_username}:{database_password}@{database_ip}/{database_name}")
Session = sessionmaker(bind=engine)
session = Session()

#guardo todos los .csv en df
actor = pd.read_csv("./tablas/actor.csv")
country= pd.read_csv("./tablas/country.csv")
director = pd.read_csv("./tablas/director.csv")
genre = pd.read_csv("./tablas/genre.csv")
rating = pd.read_csv("./tablas/rating.csv")
show_for_actor = pd.read_csv("./tablas/show_for_actor.csv")
show_for_country = pd.read_csv("./tablas/show_for_country.csv")
show_for_director = pd.read_csv("./tablas/show_for_director.csv")
show_for_genre = pd.read_csv("./tablas/show_for_genre.csv")
show_type = pd.read_csv("./tablas/show_type.csv")
show = pd.read_csv("./tablas/show.csv")



# Show_Type
for i, row in show_type.iterrows():
        show_t = Show_type(id_type=row['id_type'],
                        type=row['type'])
        session.add(show_t)
# Hacer un commit para guardar los cambios
session.commit()

# Ratings
for i, row in rating.iterrows():
    rat = Rating(id_rating=row['id_rating'],
                 rating=row['rating'])
    session.add(rat)

# Shows *ojo que la tabla es Shows pero la clase Show*
for i, row in show.iterrows():
    show = Show(
        id_show=row["id_show"],
        id_type=row["id_type"],
        id_rating=row["id_rating"],
        title=row["title"],
        duration_num=row["duration_num"],
        duration_unit=row["duration_unit"],
        date_added=row["date_added"],
        release_year=row["release_year"],
        description=row["description"],
        platform=row["platform"],
    )   
    session.add(show)

# Country
for i, row in country.iterrows():
    # Crear un objeto del tipo Country y asignar los valores de las columnas del dataframe
    country_obj = Country(id_country=row['id_country'],
                          country=row['country'])
    # Agregar el objeto a la sesión
    session.add(country_obj)

# Show_for_country
for i, row in show_for_country.iterrows():
    # Crear un objeto del tipo Show_for_country y asignar los valores de las columnas del dataframe
    show_for_country_obj = Show_for_country(id_country=row['id_country'],
                          id_show=row['id_show'])
    # Agregar el objeto a la sesión
    session.add(show_for_country_obj)

# Actor
for i, row in actor.iterrows():
    # Crear un objeto del tipo actor y asignar los valores de las columnas del dataframe
    actor_obj = Actor(id_actor=row['id_actor'],
                          full_name=row['full_name'])
    # Agregar el objeto a la sesión
    session.add(actor_obj)

# show_for_actor
for i, row in show_for_actor.iterrows():
    # Crear un objeto del tipo Show_for_actor y asignar los valores de las columnas del dataframe
    show_for_actor_obj = Show_for_actor(id_actor=row['id_actor'],
                          id_show=row['id_show'])
    # Agregar el objeto a la sesión
    session.add(show_for_actor_obj)

# Director
for i, row in director.iterrows():
    # Crear un objeto del tipo director y asignar los valores de las columnas del dataframe
    director_obj = Director(id_director=row['id_director'],
                          full_name=row['full_name'])
    # Agregar el objeto a la sesión
    session.add(director_obj)

#  Show_for_director
for i, row in show_for_director.iterrows():
    # Crear un objeto del tipo Show_for_director y asignar los valores de las columnas del dataframe
    show_for_director_obj = Show_for_director(id_director=row['id_director'],
                          id_show=row['id_show'])
    # Agregar el objeto a la sesión
    session.add(show_for_director_obj)

# Genre
for i, row in genre.iterrows():
    # Crear un objeto del tipo genre y asignar los valores de las columnas del dataframe
    genre_obj = Genre(id_genre=row['id_genre'],
                          genre=row['genre'])
    # Agregar el objeto a la sesión
    session.add(genre_obj)

# Show_for_genre
for i, row in show_for_genre.iterrows():
    # Crear un objeto del tipo Show_for_genre y asignar los valores de las columnas del dataframe
    show_for_genre_obj = Show_for_genre(id_genre=row['id_genre'],
                          id_show=row['id_show'])
    # Agregar el objeto a la sesión
    session.add(show_for_genre_obj)

# commit the changes
session.commit()
