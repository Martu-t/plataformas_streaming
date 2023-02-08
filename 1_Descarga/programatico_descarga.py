## Bienvenido al paso 1 de este challenge. Ejecuntando este script vas a poder descargar los archivos necesarios del bucket. 
## Una vez realizado este paso puedes ir al paso 2

# importar librerías
import boto3
from dotenv import load_dotenv
import os

from sqlalchemy.orm import sessionmaker


#función para descargar los archivos del bucket

#Declaro estas variable como globales ya puede ser que las necesite en varias funciones y no las voy a modificar.
load_dotenv()
AccessKey= os.getenv('ACCESSKEY')
SecretKey= os.getenv('SECRETKEY')

def download_s3_data(file_name, file_path, bucket_name='desafio-rkd'):
    '''
    Esta función recibe se conecta a un bucket s3 de Amazon y descarga un archivo. 
    tiene 3 parametros de los cuales los primeros 2 son obligatorio: Nombre del archivos (especificar la extención) y
    ruta donde se almacenará la descarga. Puede ser absoluta o relativa
    El último es el nombre del bucket y es opcional, ya que por default es: desafio-rkd.
    '''

    session = boto3.Session(aws_access_key_id=AccessKey, aws_secret_access_key=SecretKey)
    s3 = session.resource('s3')
    s3.Bucket(bucket_name).download_file(file_name, file_path)
    print(f'{file_name} descargado en {file_path}')

# Uso la función con los parämetros necesarios, de forma flexible - uso rutas absolutas para evitar problemas
download_s3_data('disney_plus_titles.csv', '../disney.csv')
download_s3_data('netflix_titles.csv', '../neflix.csv')
