	*!******************************************************************************
PROCEDURE GoPos
	PARAMETER puntero
	GO TOP
	IF RECNO() <= RECCOUNT() .AND. !EOF() .AND. RECCOUNT() != 0 .AND. puntero <= RECCOUNT()
		GO puntero
	ENDIF
	*!******************************************************************************

* no se utiliza ninguno de los de abajo
*!******************************************************************************
PROCEDURE AbrirDBF
	PARAMETERS cTabla, cTag
	IF USED( cTabla )
		SELECT &cTabla
	ELSE
		USE &cTabla IN 0
		SELECT &cTabla
	ENDIF
	IF !EMPTY(cTag)
		SET ORDER TO TAG &cTag
	ENDIF
	*!******************************************************************************
PROCEDURE box_avis
	PARAMETER cMensaje
	MESSAGEBOX(cMensaje, 64, "Ingreso de Datos")
	*!******************************************************************************
FUNCTION ceros
	PARAMETER cadena, tamano
	cadena = PADL( ALLTRIM( cadena ), tamano, "0" )
	RETURN cadena
	*!******************************************************************************
PROCEDURE CerrarDBF
	PARAMETERS cTabla
	IF USED( cTabla )
		SELECT &cTabla
		USE
	ENDIF
	*!******************************************************************************
PROCEDURE cierra
	CLOSE DATA ALL
	CLEAR ALL
	CLEAR
	SET SYSMENU TO DEFA
	ON KEY
	*ON KEY LABEL rightmouse KEYBOARD(CHR(13))
	RELEASE ALL
	*!******************************************************************************
PROCEDURE CreaVar
	PARAMETER cAccion
	cAccion = UPPER(ALLTRIM(cAccion))
	IF cAccion = "INI"
		PUBLIC cwCodTipMov, cwCodFam, cwCodSubFam, cwCodEst, cwCodTipMov, cwMatricula, cwKardex
		STORE "@" TO cwCodTipMov, cwCodFam, cdCodSubFam, cwCodEst, cwCodTipMov, cwMatricula, cwKardex
	ELSE
		RELEASE cwCodTipMov, cwCodFam, cwCodSubFam, cwCodEst, cwCodTipMov, cwMatricula, cwKardex
	ENDIF
	*!******************************************************************************
FUNCTION Cript
	LPARAMETERS Texto
	Texto = ALLTRIM(Texto)

	Clave_encriptar  = LEFT("62584810384672085073914067",LEN(Texto))

	LOCAL Clave,LongTexto,LongClave,Resultado,Cont1,Cont2,Val1,Val2,Val3

	Clave = LEFT(Clave_encriptar,LEN(Texto))

	LongTexto = LEN(Texto)
	LongClave = LEN(Clave)
	Resultado = ''
	Cont1 = 1
	Cont2 = LongClave

	IF PARAMETERS() < 1
		RETURN Resultado
	ENDIF

	FOR I=1 TO LongClave
		Val1 = ASC(SUBSTR(Texto,I,1))
		Val2 = BITXOR(ASC(SUBSTR(Clave,Cont1,1)),Cont2)
		Val3 = BITXOR(Val1,Val2)

		Resultado = Resultado + CHR(Val3)

		Cont1 = Cont1 + 1
		Cont2 = Cont2 + 1

		IF Cont1 > LongClave
			Cont1 = 1
		ENDIF
	ENDFOR

	RETURN Resultado
	*!******************************************************************************
FUNCTION GenCodMK
	PARAMETER cTipo

	lEncontro = .T.
	SELECT material
	DO CASE
		CASE cTipo = "M"
			SET ORDER TO TAG tag2	&&	matricula
		CASE cTipo = "K"
			SET ORDER TO TAG tag3	&&	kardex
	ENDCASE
	GO BOTTOM
	I = 1
	DO WHILE I < 9999999
		wCod = ceros( STR( I ),7)
		I = I + 1
		IF !SEEK(ALLTRIM( wCod ))
			lEncontro = .F.
			EXIT
		ENDIF
	ENDDO
	RETURN IIF(!lEncontro,wCod,"")
	*!******************************************************************************

FUNCTION NomRandom
	PARAMETER pnLongitud
	LOCAL x
	x = ""
	FOR I=1 TO 10
		x = x + RIGHT(ALLTRIM(STR((VAL(SYS(2))+I)*I)),1)
	NEXT I
	RETURN LEFT(x,pnLongitud)
	*!******************************************************************************
PROCEDURE delfile
	PARAMETER m.archivo

	a1 = m.archivo + ".dbf"
	a2 = m.archivo + ".cdx"
	a3 = m.archivo + ".fpt"
	a4 = m.archivo + ".tbk"
	a5 = m.archivo + ".bak"
	SELECT ( m.archivo )
	USE
	DELETE FILE &a1
	DELETE FILE &a2
	DELETE FILE &a3
	DELETE FILE &a4
	DELETE FILE &a5
	*!******************************************************************************
PROCEDURE disbl_menu
	* Descripcion : Bloquea el acceso a las opciones del menu
	STORE .F. TO _MN_cs, _MN_pot, _MN_lum, _mn_kar, ;
		_rp_kar, _rp_stk, _rp_seg,;
		_UT_BAC, _UT_RES, _UT_ARC, _UT_USU, _UT_ACC ,;
		_ut_sal, _ut_ade, skipvar
	*!******************************************************************************
PROCEDURE editacampo
	PARAMETER ptipo
	ptipo = UPPER( ptipo )
	DO CASE
		CASE ptipo = "N"
			lEdita  = .T.
			lNuevo  = .T.
		CASE ptipo = "E"
			lEdita  = .T.
			lNuevo  = .F.
		CASE ptipo = "C"
			lEdita  = .F.
			lNuevo  = .F.
	ENDCASE
	*!******************************************************************************
FUNCTION EntraAlCampo
	PARAMETER ptipo
	* Permite ingresar a un CAMPO CLAVE cuando relizamos las siguientes acciones:
	* NUEVO   = Permite ingresar/no ingresar al campo para ingresar uno nuevo
	* EDITA   = No permite ingresar al campo
	* CANCELA = Permite ingresar al campo para realizar la busqueda por codigo
	* PTIPO :
	* 		Normal
	* 		Clave
	* 		Auto

	ptipo = UPPER( ptipo )
	lRetorno = .F.
	DO CASE
		CASE !lEdita .AND. !lNuevo	&& No presiona ningún botón
			lRetorno = .T.
		CASE lNuevo					&& Presionó botón NUEVO
			DO CASE
				CASE ptipo = "NORMAL" OR ptipo = "CLAVE" && codigo ingresado por el usuario
					lRetorno = .T.
				CASE ptipo = "AUTO"	&& codigo autogenerado
					lRetorno = .F.
			ENDCASE
		CASE lEdita .AND. !lNuevo	&& Presionó botón EDITA
			DO CASE
				CASE ptipo = "CLAVE"    && campos clave
					lRetorno = .F.
				CASE ptipo = "NORMAL"	&& Campos no claves
					lRetorno = .T.
			ENDCASE
	ENDCASE
	RETURN lRetorno
PROCEDURE Imp_Rpt
	IF _TALLY = 0
		MESSAGEBOX("No existen datos para el reporte", 0+16, "Reportes")
	ELSE
		IF nDestino = 3
			COPY TO &cFile TYPE XLS
			MESSAGEBOX("Se ha creado el archivo " + UPPER(cFile) + ".XLS",64,"Emision de reportes")
		ELSE
			DO cab_rep
			REPORT FORM &cFile &aDesRep( nDestino )
			*REPORT FORM &cFile preview
			DO delfile WITH cFile
		ENDIF
	ENDIF
	RELEASE cab1, cab2, cab3, cab4
	*!******************************************************************************
PROCEDURE cab_rep
	PUBLIC cab1, cab2, cab3, cab4
	nSele = SELECT()
	IF !USED("paramsis")
		SELECT 0
		USE datos\paramsis
	ELSE
		SELECT paramsis
	ENDIF
	cab1 = paramsis.cab1
	cab2 = paramsis.cab2
	cab3 = paramsis.cab3
	cab4 = paramsis.cab4
	SELECT( nSele )
	*!******************************************************************************
PROCEDURE last_key
	nlast = LASTKEY()
	KEYBOARD("{ctrl+w}")
	*!******************************************************************************
PROCEDURE logotipo
	CLEAR
	MODI WINDOW SCREEN TITLE "Sistema Control del Almacen de Sub Estaciones de Transmision"
	*!******************************************************************************
PROCEDURE nada
	* aqui no pasa nada
	*!******************************************************************************
	*!******************************************************************************
PROCEDURE set_acceso
	PARAMETERS c_Usuario
	SELECT VarMenu, CodMenu FROM datos\MENUS ORDER BY CodMenu INTO ARRAY aMenu
	DO AbrirDBF WITH "Accesos", "Tag2"
	I=1
	FOR I = 1 TO ALEN(aMenu,1)
		IF SEEK( c_Usuario + aMenu(I,1))
			STORE !EstMenu TO &aMenu(I,1)
		ENDIF
	NEXT I
	STORE .F. TO _ut_sal, _ut_ade, skipvar
	DO CerrarDBF WITH "Accesos"
	DO CerrarDBF WITH "aMenu"
	*!******************************************************************************
FUNCTION vacio
	PARAMETER cAlias
	IF RECCOUNT( cAlias )  = 0 .OR. RECCOUNT( cAlias ) < RECNO( cAlias ) .OR. EOF( cAlias )
		RETURN .T.
	ELSE
		RETURN .F.
	ENDIF
	*!******************************************************************************
PROCEDURE QuitSystem
	nResp = MESSAGEBOX("Realmente desea sailir del sistema",32+4,"Salir del sitema")
	IF nResp = 6
		CLEAR EVENTS ALL
	ENDIF
