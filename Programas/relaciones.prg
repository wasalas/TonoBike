CLOSE DATABASES ALL

USE faccab IN 0
USE facdet IN 0

USE cotcab IN 0
USE cotdet IN 0

USE productos IN 0
USE clientes  IN 0

USE area IN 0
USE zona IN 0
USE situac IN 0

USE familia IN 0

*DO relaciones_cot
*DO relaciones_fac
DO borra_indices


PROCEDURE relaciones_cot

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


PROCEDURE relaciones_fac
	SELECT faccab
	INDEX ON idcab TAG tag_x1

	SELECT facdet
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


	SELECT faccab
	SET RELATION TO idcab INTO facdet
	SET RELATION TO idcli INTO clientes ADDITIVE

	SELECT facdet
	SET RELATION TO idproducto INTO productos ADDITIVE

	SELECT clientes
	SET RELATION TO idarea          INTO area   ADDITIVE
	SET RELATION TO idarea + idzona INTO zona   ADDITIVE
	SET RELATION TO idsit           INTO situac ADDITIVE

	SELECT productos
	SET RELATION TO idfamilia INTO familia ADDITIVE

	SELECT faccab
	BROWSE NOWAIT LAST

	SELECT facdet
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

PROCEDURE borra_indices
	SELECT faccab
	SET RELATION TO
	DELETE TAG tag_x1

	SELECT facdet
	SET RELATION TO
	DELETE TAG tag_x1

	SELECT cotcab
	SET RELATION TO
	DELETE TAG tag_x1

	SELECT cotdet
	SET RELATION TO
	DELETE TAG tag_x1

	SELECT productos
	SET RELATION TO
	DELETE TAG tag_x1

	SELECT familia
	DELETE TAG tag_x1

	SELECT clientes
	SET RELATION TO
	DELETE TAG tag_x1

	SELECT area
	DELETE TAG tag_x1

	SELECT zona
	DELETE TAG tag_x1

	SELECT situac
	DELETE TAG tag_x1
ENDPROC
