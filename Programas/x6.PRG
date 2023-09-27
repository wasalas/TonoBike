clear
x = 1
y = 1
FOR i = 1 TO 255
	@x,y say CHR(i) + CHR(9) + CHR(131) + ALLTRIM(STR(i))
*	@x,y+10 say CHR(9)

	IF x = 20
		x = 1
		y = y + 20
	ENDIF
	x = x+1
NEXT i


