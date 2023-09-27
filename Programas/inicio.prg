SET CLASSLIB TO
CLEAR
CLEAR ALL
CLOSE ALL
RELEASE ALL EXTENDED
SET SYSMENU OFF

SET CLASSLIB TO clases\aplicacion, clases\claseBase, clases\objetos

PUBLIC oEntorno, oMetodos, oNegocio
PUBLIC skipvar, cCabecera1, cCabecera2
PUBLIC nIGV

oEntorno     = CREATEOBJECT("Entorno")
oPropiedades = CREATEOBJECT("Propiedades")
oMetodos     = CREATEOBJECT("Metodos")
oNegocio     = CREATEOBJECT("Negocio")

oEntorno.SETUP
oMetodos.IniVarMenuArchivo
oPropiedades.dirdat = "datos\"

DO FOXYPREVIEWER.APP 

* carpeta para crear las OT de los clientes en formato PDF
IF NOT DIRECTORY("c:\OT")
	MD c:\OT
ENDIF

IF NOT USED("paramsis")
	USE(oPropiedades.dirdat + "paramsis" ) IN 0
ENDIF
*nIGV = paramsis.igv

IF oMetodos.validar()
	DO FORM utAcceso
	IF oPropiedades.lAccSis

		*oNegocio.alertas( oPropiedades.usuario )
		*DO FORM utAcerca WITH .T.
		
*		DO FORM clientes WITH "C"		
*		DO FORM productos
*		DO FORM OT
*		DO FORM familias
		
		DO MENU.mpr
		DO util.mpr

		READ EVENTS

		
	ENDIF
ENDIF
oEntorno.cleanup
oMetodos.Delete_temporales
*oNegocio.alertas( oPropiedades.usuario )
SET PATH TO datos

SET CLASSLIB TO
CLEAR
CLEAR ALL
CLOSE ALL
RELEASE ALL EXTENDED
SET EXCLUSIVE ON
_SCREEN.WINDOWSTATE = 2
DO FoxyPreviewer.app WITH "Release"
