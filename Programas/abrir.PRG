CLEAR ALL
RELEASE ALL
RELEASE ALL EXTENDED
SET EXCLUSIVE ON
CLOSE DATABASES ALL
CLEAR
?CURDIR()
?

DO abrirDbf WITH "faccab", "Z"
DO abrirDbf WITH "facdet", "Z"

DO abrirDbf WITH "cotcab", "Z"
DO abrirDbf WITH "cotdet", "Z"

DO abrirDbf WITH "certificadoi", "Z"
DO abrirDbf WITH "faccot", "Z"


WAIT WINDOW "Proceso terminado" at 10,50 TIMEOUT 1
RETURN

PROCEDURE abrirDbf
	LPARAMETERS tcTabla, tcZap
	
	tcZap = UPPER( tcZap )
	? "Tabla: " + tcTabla + " - " + tcZap

	ls_ruta = "datos\"
	ls_archivo = ls_ruta + tcTabla

	SELECT 0
	USE ( ls_archivo )
	IF tcZap == "Z"
		ZAP
	ELSE
		PACK
	ENDIF

ENDPROC
