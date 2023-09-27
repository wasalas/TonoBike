close data all

USE cli IN 0
USE datos\clientes IN 0

SELECT clientes
replace idcli WITH "" all

SELECT cli

SCAN
	SELECT clientes
	LOCATE FOR UPPER( ALLTRIM( clientes.nomcli )) == UPPER( ALLTRIM( cli.empresa ))
	IF FOUND()
		replace clientes.idcli WITH PADL(ALLTRIM(cli.id),5,"0")
	endif
	SELECT cli
endscan