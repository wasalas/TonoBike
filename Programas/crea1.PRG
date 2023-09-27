CLOSE DATABASES ALL
SET EXCLUSIVE ON

USE E:\Programacion\Sistemas\VFP60\sistinmu\VENTAS\DATA\d02a

SELECT cod, d13_mat, UPPER(ALLTRIM(desc1)) as desc1, punit, d02a_und  ;
	FROM d02a ;
	WHERE NOT EMPTY(desc1) AND ;
	d13_mat != "999999999999999" ;
	ORDER BY d13_mat ;
	GROUP BY d13_mat ;
	INTO TABLE temp_prod
*BROWSE

CREATE TABLE datos\productos( ;
	idproducto	c(5),;
	DESCRIP		c(100), ;
	cod1		c(20), ;
	cod2		c(20), ;
	idfamilia	c(2),;
	activo		l(1))

SELECT temp_prod
SCAN
	INSERT INTO productos (idproducto, DESCRIP, cod1, cod2, idfamilia, activo ) ;
		VALUES("", temp_prod.desc1, temp_prod.cod, temp_prod.d13_mat, "", .T.)

ENDSCAN

SELECT productos
replace idproducto WITH PADL(recno(),5,"0") all
BROWSE

MESSAGEBOX("Proceso terminado",64,"Aviso")