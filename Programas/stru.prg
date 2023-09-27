* Maetra todos los archivos con :
* 		ARCHIVO
*		INDICES
*		ESTRUCTURA
*
ON KEY LABEL f12 CANCEL
CLOSE DATA
SET TEXTMERGE ON
SET TEXTMERGE TO programas\strudbf.txt
ruta = "datos\"
N = ADIR( tabla, ruta + "*.dbf", "ad" )
= ASORT( tabla )

\ESTRUCTURA DE ARCHIVOS AL <<DATE()>>
\---------- -- -------- -- ----------
\
FOR i = 1 TO N
	SELECT (i)
	USE (ruta + tabla(i,1) )
	\	<<tabla(i,1)>>
	\	<<replicate("-",len(tabla(i,1)))>>
	j = 1
	m.tag = TAG(j)
	m.key = KEY(j)
	m.for = FOR(j)
	m.descending  = DESCENDING(j)
	DO WHILE !EMPTY( m.key ) .OR. !EMPTY( m.key )
		m.labdescend = IIF( m.descending, "DESCENDENTE", "")
		m.labelfor = UPPER(IIF( !EMPTY( m.for ), "for", "" ))
		m.keyfor = IIF( !EMPTY( m.for ), m.for, "" )
		\ <<m.tag>> => <<lower(m.key)>> <<m.labdescend>> <<m.labelfor>> <<m.keyfor>>
		j = j + 1
		m.tag = TAG(j)
		m.key = KEY(j)
		m.for = FOR(j)
		m.descending  = DESCENDING(j)
	ENDDO
	F = AFIELD(campos)
	\
	FOR l = 1 TO F
		l1 = LEN(campos(l,1))
		\<<campos(l,1)>> <<chr(9)>><<chr(9)>><<iif(l1<7,chr(9),"")>>
		\\<<campos(l,2)>> <<chr(9)>>
		\\<<campos(l,3)>> <<chr(9)>>
		\\<<campos(l,4)>>
	ENDFOR
	\
ENDFOR
SET TEXTMERGE OFF
SET TEXTMERGE TO
ON KEY LABEL f12
CLOSE DATA
*MODI COMM prgs\strudbf.txt
