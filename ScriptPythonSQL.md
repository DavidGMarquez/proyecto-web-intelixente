Script para generáción de las tablas del dataset de movielens.

La variable `path` indica el directorio en el que están los `.dat` relativo al directorio en el que se encuentra el script.



Uso:
**python data2Sql.py**

Para generar un número de concreto de registros:
**python data2Sql.py numero**



```
import sys,os 

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
		return 	"\'" + n.replace("\"","").replace("'","")  + "\'"
		
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
		t+=" NOT NULL PRIMARY KEY"			
	return t
#####################################################	    
# crea a sentencia CREATE para unha taboa        
#####################################################

def createStatement(filename,l,l2):
	tname = filename.upper().replace("-","_")
	string = "### BEGIN CREATE TABLE " + tname +"\nCREATE TABLE " + tname + " ( \n" 
	for field in l:
				field_n = field.rstrip("\r\n")
				string +=  field_n + " " + tipo(field_n, l2[l.index(field)]) + ",\n" 
	sql = string[0:len(string)-2]
	return sql + ");\n#### END CREATE TABLE "+ tname + "\n\n"		
	
################################################################################
#  PROGRAMA PRINCIPAL
################################################################################

# DIRECTORIO DOS FONTES
path = '../'
# DIRECTORIO DE SAIDA
outputpath = "sql/"
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

#filelist = ["movies"]


out = open(outputpath + "data.sql","w") 

# PARA CADA UN DELES        
for filename in filelist:

	f = open("../" + filename + ".dat","r")				# ficheiro de lectura
	#out = open(outputpath + filename + ".sql","w") 		# ficheiro de escritura
	first_line = f.readline()							# lemos a linea dos campos
	second_line = f.readline()							# lemos a primeira linea de datos (para saber os tipos)
	headers = first_line.split("\t")					# obtemos unha lista cos campos
	
	print "Generating SQL for " + filename

	createStmt = createStatement(filename,headers,second_line.split("\t"))	# XERAMOS O SQL DA TABOA
	out.write (createStmt)
	
	# XERAMOS OS INSERTS
	i = 0
	for line in f:
		if  i < limit or limit == 0:
			i=i+1	
			datos = map(quote, line.rstrip("\r\n").split("\t"))
			out.write("\nINSERT INTO " + filename.upper().replace("-","_") + " (" + ", ".join(headers) + ") values (" + ", ".join(datos) + ");\n") 
		else:
			break
	f.close()
out.close()


```