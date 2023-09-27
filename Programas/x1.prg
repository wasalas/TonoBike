CLEAR
CLOSE DATA
SET EXCLUSIVE ON

cPath = "datos\"
cMask = "*.dbf"

N = ADIR( aFiles, cPath + cMask, "a" )
= ASORT( aFiles )

FOR i = 1 TO N
	SELECT 0
	USE( cPath + aFiles( i, 1 ) )
	BROWSE
	pack

NEXT i
*CLOSE DATABASES all