## Bienvenido al primer script del modelado de datos. A ejecutar este script vas a crear las clases y cargar las tablas en una se de datos MySQL
## Deberías tener tus credenciales cargadas en un .env según se explica en el Readme.


#importar sqlalquemy para conectar a la base de datos y pymysql para usar sentencias sql
import sqlalchemy as db
import pymysql
import pandas as pd

from dotenv import load_dotenv
import os

from sqlalchemy import create_engine, Column, Integer, String, Date, ForeignKey
from sqlalchemy.ext.declarative import declarative_base


#Se prepara la conexión para la prueba. Luego hay que pasar las variables de entorno a un .env e importarlas en este .ipynb

load_dotenv()

database_username= os.getenv('DATABASE_USERNAME')
database_password= os.getenv('DATABASE_PASSWORD')
database_ip= os.getenv('DATABASE_IP')
database_name=os.getenv('DATABASE_NAME')


Base = declarative_base()

class Show(Base):
    __tablename__ = 'shows'
    id_show = Column(String(40), primary_key=True)
    id_type = Column(Integer, ForeignKey('show_type.id_type'))
    id_rating = Column(Integer, ForeignKey('rating.id_rating'))
    title = Column(String(500))
    duration_num = Column(Integer)
    duration_unit = Column(String(100))
    date_added = Column(Date)
    release_year = Column(Integer)
    description = Column(String(1000))
    platform = Column(String(100))

    def __repr__(self):
        return f"Show(id_show={self.id_show}, id_type={self.id_type}, id_rating={self.id_rating}, title='{self.title}', duration_num={self.duration_num}, duration_unit='{self.duration_unit}', date_added={self.date_added}, release_year={self.release_year}, rating={self.rating}, description='{self.description}, platform='{self.platform}')"


class Show_type(Base):
    __tablename__ = 'show_type'
    id_type = Column(Integer, primary_key=True)
    type = Column(String(100))
    
    def __repr__(self):
        return f"<ShowType(id='{self.id_type}', type='{self.type}')>" 

class Rating(Base):
    __tablename__ = 'rating'
    id_rating = Column(Integer, primary_key=True)
    rating = Column(String(100))
    
    def __repr__(self):
        return f"<Rating(id='{self.id_rating}', rating='{self.rating})')>"  
 
                
class Country(Base):
    __tablename__ = 'country'
    id_country = Column(Integer, primary_key=True)
    country = Column(String(100))
    
    def __repr__(self):
        return f"<Country(id='{self.id_country}', country='{self.country}')>"

class Show_for_country(Base):
    __tablename__ = 'show_for_country'
    id_show = Column(String(40), ForeignKey('shows.id_show'), primary_key=True)
    id_country = Column(Integer, ForeignKey('country.id_country'), primary_key=True)

    
    def __repr__(self):
        return f"<Show_country(id_show='{self.id_show}', id_country='{self.id_country}')>"

class Actor(Base):
    __tablename__ = 'actor'
    id_actor = Column(Integer, primary_key=True)
    full_name = Column(String(1000), index=True) #agrego un idex para hacer mas rapida la consulta
    
    def __repr__(self):
        return f"<Actor(id='{self.id_actor}', full_name='{self.full_name}')>"

class Show_for_actor(Base):
    __tablename__ = 'show_for_actor'
    id_show = Column(String(40), ForeignKey('shows.id_show'), primary_key=True)
    id_actor = Column(Integer, ForeignKey('actor.id_actor'), primary_key=True)

    
    def __repr__(self):
        return f"<Show_for_actor(id_show='{self.id_show}', id_actor='{self.id_actor}')>"

class Director(Base):
    __tablename__ = 'director'
    id_director = Column(Integer, primary_key=True)
    full_name = Column(String(1000))
    
    def __repr__(self):
        return f"<Director(id='{self.id_director}', full_name='{self.full_name}')>"

class Show_for_director(Base):
    __tablename__ = 'show_for_director'
    id_show = Column(String(40), ForeignKey('shows.id_show'), primary_key=True)
    id_director = Column(Integer, ForeignKey('director.id_director'), primary_key=True)
    
    def __repr__(self):
        return f"<Show_for_director(id_show='{self.id_show}', id_director='{self.id_director}')>"

class Genre(Base):
    __tablename__ = 'genre'
    id_genre = Column(Integer, primary_key=True)
    genre = Column(String(1000))
    
    def __repr__(self):
        return f"<Genre(id='{self.id_genre}', genre='{self.genre}')>"

class Show_for_genre(Base):
    __tablename__ = 'show_for_genre'
    id_show = Column(String(40), ForeignKey('shows.id_show'), primary_key=True)
    id_genre = Column(Integer, ForeignKey('genre.id_genre'), primary_key=True)
    
    def __repr__(self):
        return f"<Show_for_genre(id_show='{self.id_show}', id_genre='{self.id_genre}')>"


#database_conection=db.create_engine(f"mysql+pymysql://{database_username}:{database_password}@{database_ip}/{database_name}")
#conect=database_conection.connect()
#metadata=db.MetaData()


def create_tables():
    try:
        engine = create_engine(f"mysql+pymysql://{database_username}:{database_password}@{database_ip}/{database_name}")
        Base.metadata.create_all(engine)
        print('Las tablas se han creado con éxito')
    except Exception as e:
        print(f'Ha ocurrido un problema: {e}')

#Crear todas tablas con create_all
create_tables()
