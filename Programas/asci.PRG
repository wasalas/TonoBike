CLEAR
f=0
c=0
FOR i=1 TO 94
	@f,c SAY CHR(i) + "  "
	c = c+ 2
	IF c = 50
		f = f +1
		c = 0
	ENDIF
NEXT i
