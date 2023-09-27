ON KEY LABEL CTRL+F12 CANCEL
ON KEY LABEL ESC

ld_fecini = DATE(2021,10,1)
ld_fecfin = DATE()

ln_total_cot = 10
ln_total_fac = 10

DO abre_tablas
DO limpia_tablas
*DO llena_cotizacion WITH ld_fecini, ld_fecfin, ln_total_cot

*DO llena_factura_1 WITH ln_total_fac

*****DO llena_factura_2

MESSAGEBOX("Terminado",64,"Aviso")

***********************************************************

PROCEDURE llena_cotizacion
	LPARAMETERS td_fecini, td_fecfin, tn_total_cot

	FOR i = 1 TO tn_total_cot
		WAIT WINDOW "Cotizacion : " + ALLTRIM(STR(i)) + " de " + ALLTRIM(STR( tn_total_cot )) NOWAIT

		ls_idcab  = "21" + PADL(ALLTRIM(STR(i)),5,"0")
		ls_idcli  = get_cliente()
		ld_feccot = get_fecha(td_fecini, td_fecfin)
		ls_moneda = "SOL"
		ls_estado = "P"

		ln_maxdet = 10	&&	aleatorio(1,10)
		ln_suma = 0
		FOR j = 1 TO i
			ln_tipo   = aleatorio(1,2)
			ln_unidad =  aleatorio(1,2)

			ls_iddet      = ""
			ls_idproducto = get_producto(ls_idcab)
			ls_unidad     = IIF(ln_unidad = 1, "KGS", "CAJ")
			ln_ingreso    = aleatorio(1,100)
			ln_dosis      = get_dosis()
			ln_peso       = IIF( ln_tipo = 1 , aleatorio(1,100), 0 )
			ln_cantidad   = IIF( ln_tipo = 1 , 0, aleatorio(1,100) )
			ln_precio     = IIF( SEEK( ln_dosis, "dosis", "tag1"), dosis.precio, 1 )
			ln_subtot     = IIF( ln_tipo = 1 , ln_peso * ln_precio, ln_cantidad * ln_precio )

			ln_suma = ln_suma + ln_subtot

			INSERT INTO cotdet( ;
				idcab,    iddet,    idproducto,    idunidad,  ingreso,    peso,    dosis,    cantidad,    precio,    subtot   ) VALUES ( ;
				ls_idcab, ls_iddet, ls_idproducto, ls_unidad, ln_ingreso, ln_peso, ln_dosis, ln_cantidad, ln_precio, ln_subtot)
		NEXT j

		ln_subtot = ln_suma
		ln_porigv = 18
		ln_impigv = ROUND(ln_subtot * (ln_porigv / 100),2)
		ln_imptot = ln_subtot + ln_impigv
		ln_pordet = 12
		ln_topdet = 700
		ln_impdet = IIF( ln_imptot < ln_topdet, 0, ROUND( ln_imptot * ( ln_pordet/ 100 ), 2 ))
		ln_impinm = ln_imptot - ln_impdet

		INSERT INTO cotcab ( ;
			idcab,    idcli,    feccot,    idmoneda,  subtot,    porigv,    impigv,    imptot,    pordet,    topdet,    impdet,    impinm,    estado   ) VALUES ( ;
			ls_idcab, ls_idcli, ld_feccot, ls_moneda, ln_subtot, ln_porigv, ln_impigv, ln_imptot, ln_pordet, ln_topdet, ln_impdet, ln_impinm, ls_estado)

	NEXT i

	DO actualiza_cotdet

ENDPROC

***********************************************************

PROCEDURE llena_factura_1
	LPARAMETERS tn_nrofacs

	SELECT cotcab
	REPLACE estado WITH "P" ALL

	ln_contador = 1
	ln_contador_max = 10	&& aleatorio(tn_nrofacs, tn_nrofacs)


	FOR ln_contador = 1 TO ln_contador_max
		WAIT WINDOW "Factura : " + ALLTRIM(STR(ln_contador)) + " de " + ALLTRIM(STR(ln_contador_max)) NOWAIT

		SELECT * FROM cotcab WHERE estado == "P" INTO CURSOR cur1
		nCantCot = _TALLY

		IF nCantCot = 0
			EXIT
		ENDIF

		ln_pos = ln_contador &&	aleatorio(1, nCantCot)

		SELECT cur1
		GO ln_pos

		IF SEEK( cur1.idcab, "cotcab", "tag1" )

			ld_fecfac = cotcab.feccot + aleatorio(1,15)

			SELECT cotcab
			REPLACE cotcab.estado WITH "F"
			REPLACE cotcab.fecfin WITH ld_fecfac

			lc_idfac = PADL(ln_contador,7,"0")

			SELECT faccab
			APPEND BLANK

			REPLACE idcab  WITH lc_idfac
			REPLACE idcli  WITH cotcab.idcli
			REPLACE fecfac WITH ld_fecfac
			REPLACE idcot  WITH cotcab.idcab
			REPLACE subtot WITH cotcab.subtot
			REPLACE porigv WITH cotcab.porigv
			REPLACE impigv WITH cotcab.impigv
			REPLACE imptot WITH cotcab.imptot
			REPLACE pordet WITH cotcab.pordet
			REPLACE impdet WITH cotcab.impdet
			REPLACE impinm WITH cotcab.impinm
			REPLACE estado WITH "P"

			SELECT * FROM cotdet WHERE idcab == cotcab.idcab INTO CURSOR cur_cotdet READWRITE
			REPLACE idcab WITH lc_idfac ALL

			SELECT facdet
			APPEND FROM DBF("cur_cotdet")

		ENDIF
	ENDFOR
ENDPROC

***********************************************************

PROCEDURE llena_factura_2

	SELECT cotcab
	REPLACE estado WITH "P" ALL

	SELECT * FROM cotcab WHERE estado == "P" INTO CURSOR cur1

	nCantCot = _TALLY
	ln_contador = 1
	SCAN
		WAIT WINDOW "Factura : " + ALLTRIM(STR(ln_contador)) + " de " + ALLTRIM(STR(nCantCot)) NOWAIT

		IF SEEK( cur1.idcab, "cotcab", "tag1" )
			ld_fecfac = cotcab.feccot + aleatorio(1,15)

			SELECT cotcab
			REPLACE cotcab.estado WITH "F"
			REPLACE cotcab.fecfin WITH ld_fecfac

			lc_idfac = PADL(ln_contador,7,"0")

			SELECT faccab
			APPEND BLANK

			REPLACE idcab  WITH lc_idfac
			REPLACE idcli  WITH cotcab.idcli
			REPLACE fecfac WITH ld_fecfac
			REPLACE idcot  WITH cotcab.idcab
			REPLACE subtot WITH cotcab.subtot
			REPLACE porigv WITH cotcab.porigv
			REPLACE impigv WITH cotcab.impigv
			REPLACE imptot WITH cotcab.imptot
			REPLACE pordet WITH cotcab.pordet
			REPLACE impdet WITH cotcab.impdet
			REPLACE impinm WITH cotcab.impinm
			REPLACE estado WITH "P"

			SELECT * FROM cotdet WHERE idcab == cotcab.idcab INTO CURSOR cur_cotdet READWRITE
			REPLACE idcab WITH lc_idfac ALL

			SELECT facdet
			APPEND FROM DBF("cur_cotdet")

		ENDIF



		ln_contador = ln_contador +1
		SELECT cotcab
	ENDSCAN



ENDPROC

***********************************************************

PROCEDURE actualiza_cotdet

	LOCAL i

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
ENDPROC

***********************************************************

PROCEDURE limpia_tablas
	SELECT faccab
	ZAP

	SELECT facdet
	ZAP

	SELECT cotcab
	ZAP

	SELECT cotdet
	ZAP

ENDPROC

***********************************************************

PROCEDURE abre_tablas
	CLOSE DATA ALL

	USE faccab IN 0
	USE facdet IN 0
	USE cotcab IN 0
	USE cotdet IN 0
	USE clientes IN 0
	USE productos IN 0

	USE dosis IN 0
	USE moneda IN 0
	USE unidad  IN 0

ENDPROC

***********************************************************

FUNCTION aleatorio
	LPARAMETERS tn_ini, tn_fin

	IF tn_fin = 0 OR tn_ini > tn_fin
		ln_nro = 0
	ELSE
		ln_nro = INT((tn_fin - tn_ini + 1)  * RAND() + tn_ini)
	ENDIF

	RETURN ln_nro
ENDFUNC

***********************************************************

FUNCTION cot_mayor
	LOCAL ln_cont
	SELECT MAX(idcab) AS ln_idcab FROM cotcab WHERE estado == "P" INTO CURSOR cur1
	ln_cont = INT(VAL(ln_idcab))

	USE IN( SELECT( "cur1" ))
	RETURN ln_cont
ENDFUNC

***********************************************************

FUNCTION get_cliente
	LOCAL ii, ls_cli

	ii = 0
	ls_cli = ""
	DO WHILE .T.
		ii = ii + 1
		ls_cli = PADL( aleatorio(1,250),5,"0")
		IF SEEK(ls_cli, "clientes", "tag1")
			EXIT
		ENDIF
		IF ii >= 10
			EXIT
		ENDIF
	ENDDO
	RETURN ls_cli
ENDFUNC

***********************************************************

FUNCTION get_producto
	LPARAMETERS tc_idcab

	ls_prod = ""
	FOR ii = 1 TO 500
		ls_prod = PADL( aleatorio(1,800), 5, "0" )
		IF SEEK(ls_prod, "productos", "tag1")
			IF NOT SEEK( tc_idcab + ls_prod, "cotdet", "tag1" )
				EXIT
			ENDIF
		ENDIF
	ENDFOR
	RETURN ls_prod
ENDFUNC

***********************************************************

FUNCTION get_fecha
	LPARAMETERS td_fi, td_ff

	LOCAL ln_resta, ln_nro, ld_fecha

	ln_resta = td_ff - td_fi
	ln_nro = aleatorio(1, ln_resta)
	ld_fecha = td_fi + ln_nro

	RETURN ld_fecha

ENDFUNC

***********************************************************

FUNCTION get_dosis
	LOCAL ii, ln_dosis_retorno, ll_encontro

	ln_dosis_retorno = 0
	ll_encontro = .F.

	FOR ii = 1 TO 100
		ln_dosis_retorno = aleatorio(1,25)
		IF SEEK(ln_dosis_retorno, "dosis", "tag1" )
			ll_encontro = .T.
			EXIT
		ENDIF
	NEXT

	IF NOT ll_encontro
		ln_dosis_retorno = 1
	ENDIF

	RETURN ln_dosis_retorno
ENDFUNC
