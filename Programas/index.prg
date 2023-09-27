CLOSE DATA
SET TEXTMERGE ON
SET TEXTMERGE TO programas\utindex.prg
ruta = "datos\"
N = ADIR( tabla1, ruta + "*.dbf", "a" )
= ASORT( tabla1 )
\CLOSE DATA ALL
FOR i = 1 TO N
	SELECT (i)
	USE (ruta + tabla1(i,1) )
	\
	\WAIT WINDOW "Procesando archivo <<tabla1(i,1)>> " NOWAIT
	\SELECT 0
	\USE <<ruta>><<lower(tabla1(i,1))>>
	IF !EMPTY(TAG(1))
		\DELE TAG ALL
	ENDIF
	\PACK
	j = 1
	lhaytag = .F.
	DO WHILE .T.
		m.tag = LOWER( TAG( j ))
		m.key = LOWER( KEY( j ))
		IF EMPTY( m.tag ) .OR. EMPTY( m.key )
			EXIT
		ELSE
			\INDEX ON <<m.key>> TAG <<m.tag>>
			lhaytag = .T.
		ENDIF
		j = j + 1
	ENDDO
	IF lhaytag
		\SET ORDER TO 1
		lhaytag = .F.
	ENDIF
ENDFOR
SET TEXTMERGE OFF
SET TEXTMERGE TO
CLOSE DATA
*modi comm prgs\utindex.prg