ON KEY LABEL CTRL+F12 CANCEL

ON KEY LABEL ESC

CLOSE DATA ALL

USE faccab IN 0
USE facdet IN 0

USE cotcab IN 0
USE cotdet IN 0

USE clientes IN 0
USE productos IN 0

*SET STEP ON

DO llena_cotizacion
DO actualiza_cotdet
DO llena_factura

MESSAGEBOX("Terminado",64,"Aviso")

***********************************************************
PROCEDURE llena_factura

SET STEP ON


	IF .T.
		SELECT faccab
		ZAP

		SELECT facdet
		ZAP

		SELECT cotcab
		REPLACE estado WITH "F" ALL
	ENDIF

	ln_cotmayor = 10	&&	cot_mayor()

	ln_contador = 1
	ln_contador_max = aleatorio(1, ln_cotmayor)

	DO WHILE ln_contador < ln_contador_max
*		IF MOD(ln_contador,10) = 0
			WAIT WINDOW "Factura : " + ALLTRIM(STR(ln_contador)) + " de " + ALLTRIM(STR(ln_contador_max)) NOWAIT
*		ENDIF

		lc_idcot    = PADL(aleatorio(1, ln_cotmayor),7,"0")

		IF SEEK( lc_idcot, "cotcab", "tag1" )
			IF cotcab.estado == "P"
	
				SELECT cotcab
				REPLACE cotcab.estado WITH "F"
				
				lc_idfac = PADL(ln_contador,7,"0")

				SELECT faccab
				APPEND BLANK

				REPLACE idcab WITH lc_idfac
				REPLACE idcli WITH cotcab.idcli
				REPLACE fecfac WITH DATE()
				REPLACE idcot WITH cotcab.idcab		&&	lc_idcot
				REPLACE subtot WITH cotcab.subtot
				REPLACE porigv WITH cotcab.porigv
				REPLACE impigv WITH cotcab.impigv
				REPLACE imptot WITH cotcab.imptot
				REPLACE pordet WITH cotcab.pordet
				REPLACE impdet WITH cotcab.impdet
				REPLACE impinm WITH cotcab.impinm
				REPLACE estado WITH "P"

				SELECT facdet
				APPEND FROM cotdet FOR idcab == lc_idcot			

				ln_contador = ln_contador + 1

			ENDIF
		ENDIF
	ENDDO

	***********************************************************


PROCEDURE llena_cotizacion
	SELECT cotcab
	ZAP

	SELECT cotdet
	ZAP


	ln_maxcab = aleatorio(10,15)
	FOR i = 1 TO ln_maxcab
*		IF MOD(i,10) = 0
			WAIT WINDOW "Cotizacion : " + ALLTRIM(STR(i)) + " de " + ALLTRIM(STR(ln_maxcab)) NOWAIT
*		ENDIF

		ls_idcab = "21" + PADL(ALLTRIM(STR(i)),5,"0")
		ls_idcli = get_cliente()
		ld_feccot = DATE()
		ls_estado = "P"

		ln_maxdet = aleatorio(1,10)
		FOR j = 1 TO ln_maxdet
			ls_iddet = ""		&&	PADL(ALLTRIM(STR(j)),2,"0")
			ls_idproducto = get_producto()
			ln_peso = aleatorio(1,100)
			ln_dosis = aleatorio(1,3)
			ln_cantidad = aleatorio(1,50)
			ln_precio = aleatorio(1,100)
			ln_subtot = ln_cantidad * ln_precio

			INSERT INTO cotdet( idcab, iddet, idproducto, peso, dosis, cantidad, precio, subtot ) ;
				VALUES ( ls_idcab, ls_iddet, ls_idproducto, ln_peso, ln_dosis, ln_cantidad, ln_precio, ln_subtot)
		NEXT j
		SELECT SUM(subtot) AS subtot FROM cotdet WHERE idcab == ls_idcab INTO CURSOR cur1

*SET STEP ON

		ln_subtot = cur1.subtot
		ln_porigv = 0.18
		ln_impigv = cur1.subtot * ln_porigv
		ln_imptot = ln_impsubtot + ln_impigv
		ln_pordet = 0.12
		ln_topdet = 700
		ln_impdet = IIF( ln_imptot < ln_topdet, 0, ln_imptot * ln_pordet )
		ln_impinm = ln_imptot - ln_impdet

		INSERT INTO cotcab (idcab, idcli, feccot, subtot, porigv, impigv, imptot, pordet, impdet, impinm, estado) ;
			VALUES ( ls_idcab, ls_idcli, ld_feccot, ln_subtot, ln_porigv, ln_impigv, ln_imptot, ln_pordet, ln_impdet, ln_impinm, ls_estado)

	NEXT i
ENDPROC

PROCEDURE actualiza_cotdet
	SELECT cotdet.idcab, cotdet.iddet, cotdet.idproducto, ;
		NVL(productos.DESCRIP, SPACE(50)) AS DESCRIP ;
		FROM cotdet ;
		LEFT OUTER JOIN productos ON productos.idproducto = cotdet.idproducto ;
		ORDER BY cotdet.idcab, productos.DESCRIP ;
		INTO CURSOR cur_consulta READWRITE

	SELECT cur_consulta

	m.idcab = ""
	i = 0

	DO WHILE NOT EOF()
		i = IIF( m.idcab != idcab, 1, i + 1 )
		m.iddet = PADL( i, 2, "0" )
		REPLACE iddet WITH m.iddet

		m.idcab = idcab
		SKIP
	ENDDO

	SCAN
		IF SEEK( idcab + idproducto, "cotdet", "tag1" )
			REPLACE cotdet.iddet WITH iddet
		ENDIF

	ENDSCAN


FUNCTION aleatorio
	LPARAMETERS tn_ini, tn_fin

	IF tn_fin = 0 OR tn_ini > tn_fin
		ln_nro = 0
	ELSE
		ln_nro = INT((tn_fin - tn_ini + 1)  * RAND() + tn_ini)
	ENDIF

	RETURN ln_nro
ENDFUNC

FUNCTION cot_mayor
	SELECT MAX(idcab) AS ln_idcab FROM cotcab WHERE estado == "P" INTO CURSOR cur1
	ln_cont = INT(VAL(ln_idcab))

	USE IN( SELECT( "cur1" ))
	RETURN ln_cont
ENDFUNC

FUNCTION get_cliente
	ii = 0
	ls_cli = ""
	DO WHILE .T.
		ii = ii + 1
		ls_cli = PADL( aleatorio(1,500),5,"0")
		IF SEEK(ls_cli, "clientes", "tag1")
			EXIT
		ENDIF
		IF ii >= 10
			EXIT
		ENDIF
	ENDDO
	RETURN ls_cli
ENDFUNC

FUNCTION get_producto
	ii = 0
	ls_pro = ""
	DO WHILE .T.
		ii = ii + 1
		ls_pro = PADL( aleatorio(1,1000),5,"0")
		IF SEEK(ls_pro, "productos", "tag1")
			EXIT
		ENDIF
		IF ii >= 10
			EXIT
		ENDIF
	ENDDO
	RETURN ls_pro
ENDFUNC
