CLEAR
CLOSE DATABASES ALL
SET EXCLUSIVE ON


SET DEFAULT TO "C:\Programacion\Sistemas\Vfp90\TonoBike\Datos"

DO limpia_tablas
*DO crear_bicis
*DO abrir_bicis
* DO crear_ot
*DO crear
*DO llenar
*DO formato
*DO consulta_productos

SET DEFAULT TO "C:\Programacion\Sistemas\Vfp90\TonoBike"

PROCEDURE limpia_tablas
	USE aro_bici
	ZAP

	USE bicicletas
	ZAP

	USE clientes
	ZAP

	USE distritos
	ZAP

	USE marca_bici
	ZAP

	USE otcab
	ZAP

	USE otdet
	ZAP

	USE tipo_bici
	ZAP

ENDPROC

PROCEDURE abrir_bicis
	USE bicicletas IN 0
	USE tipo_bici IN 0
	USE aro_bici IN 0
	USE marca_bici IN 0
ENDPROC

PROCEDURE crear_bicis
	CREATE TABLE bicicletas ( ;
		id_bici	c(5),;
		id_cli	c(5),;
		id_tipbici	c(2),;
		id_arobici	c(2),;
		id_marbici	c(2),;
		modelo		c(50),;
		COLOR		c(50),;
		nroserie	c(50),;
		obs			c(100))

	CREATE TABLE tipo_bici(;
		id_tipbici	c(2),;
		DESCRIP	c(50))

	INSERT INTO tipo_bici( id_tipbici, DESCRIP) VALUES ("01", "MTB")
	INSERT INTO tipo_bici( id_tipbici, DESCRIP) VALUES ("02", "RUTA")
	INSERT INTO tipo_bici( id_tipbici, DESCRIP) VALUES ("03", "PASEO")
	INSERT INTO tipo_bici( id_tipbici, DESCRIP) VALUES ("04", "BMX")

	CREATE TABLE aro_bici(;
		id_arobici	c(2),;
		DESCRIP	c(50))

	INSERT INTO aro_bici( id_arobici, DESCRIP) VALUES ("01", "26")
	INSERT INTO aro_bici( id_arobici, DESCRIP) VALUES ("02", "29/700")

	CREATE TABLE marca_bici(;
		id_marbici	c(2),;
		DESCRIP	c(50))

	INSERT INTO marca_bici( id_marbici, DESCRIP) VALUES ("01", "FUJI")
	INSERT INTO marca_bici( id_marbici, DESCRIP) VALUES ("02", "TREK")

ENDPROC

PROCEDURE crear_ot
	CREATE TABLE otcab( ;
		id_cab	c(10),;
		id_cli	c(5),;
		fecing	  d(8),;
		horing	  c(10),;
		usuing	  c(2),;
		fecmod	  d(8),;
		hormod	  c(10),;
		usumod	  c(2),;
		fecrec	      d(8),;
		horrec	      c(10),;
		fecestent	d(8),;
		horestent	c(10),;
		fecent		  d(8),;
		horent		  c(10),;
		subtotal N(12,2),;
		igv		N(12,2),;
		porigv	N(6,3),;
		TOTAL	N(12,2),;
		estado	c(1))
	INDEX ON id_cab TAG tag1

	CREATE TABLE otdet( ;
		id_det		c(10),;
		id_cab		c(10),;
		id_prod		c(10), ;
		precio		N(12,2),;
		cantidad	N(12,2))
	INDEX ON id_det TAG tag1

	CREATE TABLE clientes( ;
		id_cli		c(5),;
		id_tipdoc	c(1),;
		numdoc		c(11),;
		nomcli	c(100),;
		telf		c(50),;
		direccion	c(100),;
		id_dis		c(2), ;
		activo		l)
	INDEX ON id_cli TAG tag1

	CREATE TABLE distritos( ;
		id_dis	c(3), ;
		DESCRIP	c(50))
	INDEX ON id_dis TAG tag1

	INSERT INTO distritos(id_dis, DESCRIP) VALUES("001","SAN BORJA")
	INSERT INTO distritos(id_dis, DESCRIP) VALUES("002","SURCO")
	INSERT INTO distritos(id_dis, DESCRIP) VALUES("003","SURQUILLO")
	INSERT INTO distritos(id_dis, DESCRIP) VALUES("004","CHORRILLOS")
	INSERT INTO distritos(id_dis, DESCRIP) VALUES("005","LA MOLINA")

ENDPROC


PROCEDURE crear
	*
	* productos del taller
	*
	CREATE TABLE productos( ;
		id_prod		c(10), ;
		id_tipprod 	c(2), ;
		id_familia 	c(2), ;
		id_marca 	c(5), ;
		id_modelo 	c(5), ;
		DESCRIP		c(100), ;
		precio		N(12,2))

	INDEX ON id_prod TAG tag1

	*
	* tipo de productos	(Servicio, Repuesto)
	*
	CREATE TABLE tipo_producto( ;
		id_tipprod 	c(2), ;
		DESCRIP	c(100))

	INDEX ON id_tipprod TAG tag1

	*
	* familia de productos	(frenos, transmision, ruedass)
	CREATE TABLE familias( ;
		id_familia 	c(2), ;
		DESCRIP	c(100))

	INDEX ON id_familia TAG tag1

	CREATE TABLE marcas( ;
		id_marca 	c(5), ;
		DESCRIP	c(100))

	INDEX ON id_marca TAG tag1


	CREATE TABLE modelos( ;
		id_modelo 	c(5), ;
		DESCRIP	c(100))

	INDEX ON id_modelo TAG tag1

ENDPROC

PROCEDURE llenar

	*
	INSERT INTO tipo_producto( id_tipprod, DESCRIP) VALUES ("S","Servicio")
	INSERT INTO tipo_producto( id_tipprod, DESCRIP) VALUES ("R","Respuesto")

	*
	INSERT INTO familias( id_familia, DESCRIP) VALUES ("01","Mantenimiento")
	INSERT INTO familias( id_familia, DESCRIP) VALUES ("02","Frenos")
	INSERT INTO familias( id_familia, DESCRIP) VALUES ("03","Ruedas")
	INSERT INTO familias( id_familia, DESCRIP) VALUES ("04","Transmision")
	INSERT INTO familias( id_familia, DESCRIP) VALUES ("05","Horquilla")
	INSERT INTO familias( id_familia, DESCRIP) VALUES ("06","Amortiguador")
	INSERT INTO familias( id_familia, DESCRIP) VALUES ("07","Cuadro o Chasis")

	*
	INSERT INTO  productos( id_prod, id_tipprod, id_familia, DESCRIP, precio) VALUES ("0000000001", "S", "01", "servicio simple",90)
	INSERT INTO  productos( id_prod, id_tipprod, id_familia, DESCRIP, precio) VALUES ("0000000001", "S", "01", "servicio completo", 120)

	INSERT INTO  productos( id_prod, id_tipprod, id_familia, DESCRIP) VALUES ("0000000001", "S", "02", "purgado del.")
	INSERT INTO  productos( id_prod, id_tipprod, id_familia, DESCRIP) VALUES ("0000000001", "S", "02", "purgado post.")
	INSERT INTO  productos( id_prod, id_tipprod, id_familia, DESCRIP) VALUES ("0000000001", "S", "02", "cambio pastilla del.")
	INSERT INTO  productos( id_prod, id_tipprod, id_familia, DESCRIP) VALUES ("0000000001", "S", "02", "cambio pastilla post.")
	INSERT INTO  productos( id_prod, id_tipprod, id_familia, DESCRIP) VALUES ("0000000001", "S", "02", "cambio de disco del.")
	INSERT INTO  productos( id_prod, id_tipprod, id_familia, DESCRIP) VALUES ("0000000001", "S", "02", "cambio de disco post.")
	INSERT INTO  productos( id_prod, id_tipprod, id_familia, DESCRIP) VALUES ("0000000001", "S", "02", "cambio de cables freno del.")
	INSERT INTO  productos( id_prod, id_tipprod, id_familia, DESCRIP) VALUES ("0000000001", "S", "02", "cambio de cables freno post.")
	INSERT INTO  productos( id_prod, id_tipprod, id_familia, DESCRIP) VALUES ("0000000001", "S", "02", "cambio de fundas freno del.")
	INSERT INTO  productos( id_prod, id_tipprod, id_familia, DESCRIP) VALUES ("0000000001", "S", "02", "cambio de fundas freno post.")

	INSERT INTO  productos( id_prod, id_tipprod, id_familia, DESCRIP) VALUES ("0000000001", "S", "03", "cambio de camara del.")
	INSERT INTO  productos( id_prod, id_tipprod, id_familia, DESCRIP) VALUES ("0000000001", "S", "03", "cambio de camara post.")
	INSERT INTO  productos( id_prod, id_tipprod, id_familia, DESCRIP) VALUES ("0000000001", "S", "03", "parchado de camara del.")
	INSERT INTO  productos( id_prod, id_tipprod, id_familia, DESCRIP) VALUES ("0000000001", "S", "03", "parchado de camara post.")
	INSERT INTO  productos( id_prod, id_tipprod, id_familia, DESCRIP) VALUES ("0000000001", "S", "03", "cambio de llanta del.")
	INSERT INTO  productos( id_prod, id_tipprod, id_familia, DESCRIP) VALUES ("0000000001", "S", "03", "cambio de llanta post.")
	INSERT INTO  productos( id_prod, id_tipprod, id_familia, DESCRIP) VALUES ("0000000001", "S", "03", "ajuste y centrado de aro del.")
	INSERT INTO  productos( id_prod, id_tipprod, id_familia, DESCRIP) VALUES ("0000000001", "S", "03", "ajuste y centrado de aro post.")
	INSERT INTO  productos( id_prod, id_tipprod, id_familia, DESCRIP) VALUES ("0000000001", "S", "03", "cambio de radios del.")
	INSERT INTO  productos( id_prod, id_tipprod, id_familia, DESCRIP) VALUES ("0000000001", "S", "03", "cambio de radios port.")
	INSERT INTO  productos( id_prod, id_tipprod, id_familia, DESCRIP) VALUES ("0000000001", "S", "03", "tubelizacion del.")
	INSERT INTO  productos( id_prod, id_tipprod, id_familia, DESCRIP) VALUES ("0000000001", "S", "03", "tubelizacion post.")
	INSERT INTO  productos( id_prod, id_tipprod, id_familia, DESCRIP) VALUES ("0000000001", "S", "03", "relleno de liquido tubeless del.")
	INSERT INTO  productos( id_prod, id_tipprod, id_familia, DESCRIP) VALUES ("0000000001", "S", "03", "relleno de liquido tubeless post.")

	INSERT INTO  productos( id_prod, id_tipprod, id_familia, DESCRIP) VALUES ("0000000001", "S", "04", "cambio de cadena")
	INSERT INTO  productos( id_prod, id_tipprod, id_familia, DESCRIP) VALUES ("0000000001", "S", "04", "cambio de plato")
	INSERT INTO  productos( id_prod, id_tipprod, id_familia, DESCRIP) VALUES ("0000000001", "S", "04", "cambio de pinon")
	INSERT INTO  productos( id_prod, id_tipprod, id_familia, DESCRIP) VALUES ("0000000001", "S", "04", "cambio de catalina")
	INSERT INTO  productos( id_prod, id_tipprod, id_familia, DESCRIP) VALUES ("0000000001", "S", "04", "cambio de cables cambio del.")
	INSERT INTO  productos( id_prod, id_tipprod, id_familia, DESCRIP) VALUES ("0000000001", "S", "04", "cambio de cables cambio post.")
	INSERT INTO  productos( id_prod, id_tipprod, id_familia, DESCRIP) VALUES ("0000000001", "S", "04", "cambio de fundas cambio del.")
	INSERT INTO  productos( id_prod, id_tipprod, id_familia, DESCRIP) VALUES ("0000000001", "S", "04", "cambio de fundas cambio post.")
	INSERT INTO  productos( id_prod, id_tipprod, id_familia, DESCRIP) VALUES ("0000000001", "S", "04", "cambio de masas del.")
	INSERT INTO  productos( id_prod, id_tipprod, id_familia, DESCRIP) VALUES ("0000000001", "S", "04", "cambio de masas post.")

	INSERT INTO  productos( id_prod, id_tipprod, id_familia, DESCRIP) VALUES ("0000000001", "S", "05", "reparacion horquilla")

	INSERT INTO  productos( id_prod, id_tipprod, id_familia, DESCRIP) VALUES ("0000000001", "S", "06", "reparacion amortiguador")

	INSERT INTO  productos( id_prod, id_tipprod, id_familia, DESCRIP) VALUES ("0000000001", "S", "07", "cambio de rodajes de direccion")
	INSERT INTO  productos( id_prod, id_tipprod, id_familia, DESCRIP) VALUES ("0000000001", "S", "07", "cambio de rodajes de eje central")
	INSERT INTO  productos( id_prod, id_tipprod, id_familia, DESCRIP) VALUES ("0000000001", "S", "07", "cambio de rodajes de masa")



ENDPROC

PROCEDURE formato
	SELECT familias
	REPLACE id_familia WITH PADL(RECNO(),2,"0") ALL
	REPLACE DESCRIP WITH UPPER(ALLTRIM(DESCRIP)) ALL

	SELECT tipo_producto
	REPLACE DESCRIP WITH UPPER(ALLTRIM(DESCRIP)) ALL

	SELECT productos
	REPLACE id_prod WITH PADL(RECNO(),10,"0") ALL
	REPLACE DESCRIP WITH UPPER(ALLTRIM(DESCRIP)) ALL

ENDPROC

PROCEDURE consulta_productos
	SELECT p.id_prod, p.id_tipprod, T.DESCRIP AS descrip_tipo, ;
		p.id_familia, F.DESCRIP AS descrip_familia, ;
		p.DESCRIP, p.precio ;
		FROM productos p ;
		LEFT OUTER JOIN tipo_producto T ON p.id_tipprod = T.id_tipprod ;
		LEFT OUTER JOIN familias      F ON p.id_familia = F.id_familia ;
		LEFT OUTER JOIN marcas         m ON p.id_marca = m.id_marca ;
		LEFT OUTER JOIN modelos        d ON p.id_modelo = d.id_modelo




ENDPROC
