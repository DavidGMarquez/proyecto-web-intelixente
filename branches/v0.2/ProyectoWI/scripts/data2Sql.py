# -*- coding: utf-8 -*-
import sys,os

# Script para generacion de las tablas del dataset de movielens. 
# La variable {{{path}}} indica el directorio en el que estan los {{{.dat}}} 
# relativo al directorio en el que se encuentra el script.

# Uso:
# Todos los registros: *python data2Sql.py*
# Para generar un numero de concreto de registros: *python data2Sql.py numero*

# FUNCIONS  

#####################################################
# Engade '' aos elementos da lista que non son numeros
#####################################################
def quote(n):

        n = n.replace("\"","").replace("'","")  

        if n.isdigit() or isfloat(n):  
                return n
        elif n == "N":
                return 0
        elif len(n) == 0:
                return "\' \'"
        else:
                return  "\'" + n  + "\'"
               
#####################################################          
# comproba se un string e un numero con decimais
#####################################################
def isfloat(s):
        try:
                if s == "Infinity":
                        return False
                else:  
                    float(s)
                return True
        except ValueError:
            return False
           
#####################################################      
# devolve un tipo sql
#####################################################
def tipo(field, value):
        t = "VARCHAR(255)"
       
        if field == "timestamp":
                t = "TIMESTAMP"
        elif value.isdigit():
                t = "INTEGER"
        elif isfloat(value):
                t = "FLOAT"
        if(field == "id"):
                t+=" NOT NULL PRIMARY KEY AUTO_INCREMENT"                      
        return t
#####################################################      
# crea a sentencia CREATE para unha taboa        
#####################################################

def createStatement(filename,fields,example, encode="utf8"):
        tname = filename.upper().replace("-","_")
        string = "\n\n### BEGIN CREATE TABLE " + tname +"\nDROP TABLE IF EXISTS `" + tname + "`;\nCREATE TABLE `" + tname + "` ( \n"
        for field in fields:
                                field_n = field.rstrip("\r\n")
                                string +=  "`" + field_n + "` " + tipo(field_n, example[fields.index(field)]) + ",\n"
        sql = string[0:len(string)-2]
        return sql + ") ENGINE=InnoDB DEFAULT CHARSET=" + encode + ";\n#### END CREATE TABLE "+ tname + "\n\n"              
       
################################################################################
#  PROGRAMA PRINCIPAL
################################################################################

# Páxina: http://www.grouplens.org/node/462 (arquivo: HetRec 2011 MovieLens Data Set (.zip))

# DIRECTORIO DOS FONTES
path = 'hetrec2011-movielens-2k/'
# FICHEIRO DE SAIDA
outputscript = "./movies-data.sql"
# EXTENSION DOS ARQUIVOS
ext  = '.dat'
# LISTA  DE FICHEIROS
filelist = []

# OBTEMOS UNHA LISTA COS ARQUIVOS .DAT
for filename in os.listdir(path):
  if filename.endswith(ext):
    filelist.append(filename.replace(".dat",""))

# limite de filas a ler
limit = 0
if len(sys.argv) == 2:
        limit = int(sys.argv[1])

out = open(outputscript,"w")

# PARA CADA UN DELES        
for filename in filelist:

        f = open(path + filename + ".dat","r")                                  # ficheiro de lectura
        first_line = f.readline()                                               # lemos a linea dos campos
        second_line = f.readline()                                              # lemos a primeira linea de datos (para saber os tipos)
        headers = first_line.split("\t")                                        # obtemos unha lista cos campos
       
        print "Generating SQL for " + filename

        createStmt = createStatement(filename,headers,second_line.split("\t"))  # XERAMOS O SQL DA TABOA
        out.write (createStmt)
       
        # XERAMOS OS INSERTS
        i = 0
        for line in f:
                if  i < limit or limit == 0:
						if i % 500 == 0:
								if i != 0:
										out.write(";")
								out.write("\nINSERT INTO `" + filename.upper().replace("-","_") + "` (" + ", ".join(headers) + ") values ")
						elif i != 0:
								out.write(",")
						i=i+1
						datos = map(quote, line.rstrip("\r\n").split("\t"))
						out.write("\n(" + ", ".join(datos) + ")")
                else:
                        out.write(";")
                        break
        f.close()

#Pechamos o arquivo .sql
out.close()



