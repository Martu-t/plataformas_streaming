# Modelado de datos de streaming
## Data Engineering
<img src="https://ruidoenlared.com/wp-content/uploads/2022/08/plataformas-streaming-en-mexico.jpg"  height=50% width=50%> 


##  Propuesta de trabajo
Bienvenido/a!

Este repositorio fue realizado en base un challenge propuesto para evaluar conocimientos en Data Engineer.

El mismo consta de 4 partes y se intentó resolver de la mejor manera posible en 3 días.
La idea general es descargar archivos de un bucket de s3 en formato .csv para trabajarlo. Luego explorarlos, analizarlos y en caso de encontrar problemas, proponer soluciones. Entendiendo la problematica, se debe armar un modelado de datos. Una vez planteado el modelo, se deben cargar las tablas en el gestor de base de datos a elección (en mi caso MySQL). 

¿Me acompañas a ver cómo lo resolví?

## Herramientas utilizadas:

 - Python y sus librerías, cómo Pandas y SQLalchemy
 - Gestor de base de datos: MySQL 
 - Jupyter Notebook 


## Pre-requisitos para correr todo correctamente

- Se debe tener instalado Python y las librerías que se importan en los archivos.
- Jupyter Notebook instalado (puede ser extensión del VSC)
- Si se desea utilizar otro gestor de base de datos diferente a MySQL, se debe adaptar las conexiones, según indique la documentación de SQLAlchemy. 
- Se intenta utilizar siempre rutas relativas para evitar cualquier problema, pero en caso de existir problemas en las rutas, cambiarlas a las correspondientes de su equipo.
- Las credenciales tanto del bucket, cómo de la base de datos se encuentran en un archivo .env que deberá crear. El mismo debe tener el siguiente formato:

```
DATABASE_USERNAME='usuario_raiz' 
DATABASE_PASSWORD='contraseña'
DATABASE_IP='localhost' o 'host_name_aws' 
DATABASE_NAME='nombre de la bd'

BUCKET_NAME = 'desafio-rkd'
ACCESSKEY = 'acces_key_bucket'
SECRETKEY='secret_key_bucket'
```

## Flujo del dato

A continuación se muestra el flujo de ciclo de vida del dato.

<img src="https://iili.io/H1p9una.png"> 


## Estructura del repositorio

### 1.Programática

Aquí se encuentra un archivo .py que contiene sólo una función para descargar los datos de un bucket de Amazon (S3). Se puede poner las rutas y nombres que se deseen de forma flexible en los parámetros de la función.
Para acceder corretamente, se debe contar con credenciales.

### 2.QA

Dentro de esta carpeta de encuentra el archivo qa_eda.ipnyb, donde se hace un análisis descriptivo y control de datos con Python.
Además se explican los hayasgos y posibles problemas con soluciones sugeridas. También es donde se hacen ciertas transformaciones del dataset original para llegar al modelo de datos deseado.
Se recomienda ejecutar una por una las celdas y leer los comentarios.

### 3.Modelado 

Contiene una carpeta "tablas" con todos los DataFrames del punto anterior, convertidos a .csv. 
Por cuestiones de tamaño serán ignorados en GitHub, pero al ejecurase el .ipynb del paso anterior se irán creando de manera local.
Además hay dos archivos, que se deben ejecutar en el siguiente orden:

1_modelado_modelo_ddl.py : Aquí se encuentran declaradas las clases, según la documentación de SQLAlchemy para crear modelos. Se recomienda ajustar los datos en este punto si se trabaja con otro gestor de base de datos para evitar problemas.
    
2_modelado_carga_tablas: Permite poblar las tablas previamentes creadas.

En caso de no poder hacer la carga correctamente se puede optar por utilizar una versión simplificada. Tener en cuenta que de esta manera se deberás asignar las PK, FK e índices después de crearlas. También se crean con tipo de dato por defecto.

```
# Ejemplo de sintaxis cómo sería enviando directamente la tabla a tráves de sqlalchemy

import sqlalchemy as db

database_conection=db.create_engine(f"mysql+pymysql://{database_username}:{database_password}@{database_ip}/{database_name}")
conect=database_conection.connect()
metadata=db.MetaData()

df.to_sql(con=conect, name='nombre_tabla', if_exists='replace', index=False)

conect.close()
```
Para detalles del funcionamiento, se recomienda ir a la documentación de Pandas: https://pandas.pydata.org/docs/reference/api/pandas.DataFrame.to_sql.html

### 4.SQL

En esta carpeta encontrá algunas consultas (.sql) y un procedimiento, los cuales van acompañados de imagenes de cómo deberían verse.
Además podrá ver el Diagrama de Entidad Relación propuesto.

#### funciones.py

Hay un archivo llamado funciones.py con todas las funciones utlizadas para hacer transformaciones. Este archivo no hace nada al ejecutarse ya que nunca se laman a dichas funciones, pero sirve para tener una vista rápida de algunas transformaciones realizadas a lo largo del proceso.

## ¿Dudas? ¿Problemas? - Feedback

Espero que todo pueda correr sin problemas. Pero sabemos que siempre hay lugar para el error así que ante cualquier cosa no dudes en escribirme:

Mail: ma.tarantino@hotmail.com
Linkedin: https://www.linkedin.com/in/martha-alejandra-tarantino/

También te invito a contarme que te pareció la resolución y cómo lo hubieras hecho vos. Ya que aún estoy aprendiendo me sirve MUCHO todas tus ideas para mejorar 

## Otros Proyectos

También aprovecho para invitarte a ver otros proyectos en: https://github.com/Martu-t 

