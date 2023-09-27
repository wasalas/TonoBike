
lc_anocot = RIGHT(STR(YEAR(DATE()),4),2)

SELECT MAX( SUBSTR( idcab, 3, 5 )) AS correl ;
	FROM cotcab ;
	WHERE LEFT( cotcab.idcab, 2 ) == lc_anocot ;
	INTO CURSOR cur1

IF _TALLY = 0
	lc_corcot = PADL( "1", 5, "0" )
ELSE
	lc_corcot = PADL(  ALLTRIM(STR(VAL( cur1.correl ) + 1)), 5, "0" )

ENDIF
lc_indice = lc_anocot + lc_corcot

clear
?lc_indice
