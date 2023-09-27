IF NOT DIRECTORY("OT")
	MD OT
	WAIT WINDOW "Carpeta creada"
ELSE
	WAIT WINDOW "Carpeta ya existe"
ENDIF
