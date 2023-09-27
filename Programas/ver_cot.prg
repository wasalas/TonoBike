CLOSE DATABASES ALL

USE cotcab IN 0
USE cotdet IN 0

USE productos IN 0
USE clientes  IN 0

USE area IN 0
USE zona IN 0
USE situac IN 0

USE familia IN 0

*DO p0
DO p1


PROCEDURE p0
SELECT productos
REPLACE idfamilia WITH "01" FOR RECNO()%2 = 0
REPLACE idfamilia WITH "02" FOR RECNO()%2 != 0
REPLACE idfamilia WITH "03" FOR RECNO()%3 = 0
REPLACE idfamilia WITH "04" FOR RECNO()%5 = 0
REPLACE idfamilia WITH "05" FOR RECNO()%7 = 0

BROWSE FOR idfamilia == "01"
BROWSE FOR idfamilia == "02"
BROWSE FOR idfamilia == "03"
BROWSE FOR idfamilia == "04"
BROWSE FOR idfamilia == "05"

ENDPROC

PROCEDURE p1


	SELECT cotcab
	INDEX ON idcab TAG tag_x1

	SELECT cotdet
	INDEX ON idcab TAG tag_x1

	SELECT productos
	INDEX ON idproducto TAG tag_x1

	SELECT familia
	INDEX ON idfamilia TAG tag_x1

	SELECT clientes
	INDEX ON idcli TAG tag_x1
	
	SELECT area
	INDEX ON idarea TAG tag_x1

	SELECT zona
	INDEX ON idarea + idzona TAG tag_x1

	SELECT situac
	INDEX ON idsit TAG tag_x1
	

	SELECT cotcab
	SET RELATION TO idcab INTO cotdet
	SET RELATION TO idcli INTO clientes ADDITIVE 

	SELECT cotdet
	SET RELATION TO idproducto INTO productos ADDITIVE 
	
	SELECT clientes
	SET RELATION TO idarea          INTO area   ADDITIVE 
	SET RELATION TO idarea + idzona INTO zona   ADDITIVE 
	SET RELATION TO idsit           INTO situac ADDITIVE 

	SELECT productos
	SET RELATION TO idfamilia INTO familia ADDITIVE 

	SELECT cotcab
	BROWSE NOWAIT LAST

	SELECT cotdet
	BROWSE NOWAIT LAST

	SELECT productos
	BROWSE NOWAIT LAST

	SELECT clientes
	BROWSE NOWAIT LAST

	SELECT area
	BROWSE NOWAIT LAST

	SELECT zona
	BROWSE NOWAIT LAST
	
	SELECT situac
	BROWSE NOWAIT LAST

	SELECT familia
	BROWSE NOWAIT LAST


ENDPROC


PROCEDURE p2
	SELECT idcab, iddet, ;
		cotdet.idproducto, NVL(productos.DESCRIP, SPACE(50)) AS DESCRIP, ;
		idunidad, ingreso, dosis, peso, cantidad, precio, subtot ;
		FROM cotdet ;
		LEFT OUTER JOIN productos ON productos.idproducto == cotdet.idproducto ;
		ORDER BY idcab, productos.DESCRIP ;
		INTO CURSOR cur_cotizacion
	BROWSE

ENDPROC
