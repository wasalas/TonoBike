CLOSE DATABASES all

CREATE TABLE tabla ( c1 c(2), c2 c(2), c3 c(2))

INSERT INTO tabla (c1)values("01")
INSERT INTO tabla (c1)values("06")
INSERT INTO tabla (c1)values("06")
INSERT INTO tabla (c1)values("06")
INSERT INTO tabla (c1)values("06")
INSERT INTO tabla (c1)values("01")
INSERT INTO tabla (c1)values("07")
INSERT INTO tabla (c1)values("08")
INSERT INTO tabla (c1)values("07")
INSERT INTO tabla (c1)values("01")
INSERT INTO tabla (c1)values("03")
INSERT INTO tabla (c1)values("08")
INSERT INTO tabla (c1)values("03")
INSERT INTO tabla (c1)values("05")
INSERT INTO tabla (c1)values("05")
INSERT INTO tabla (c1)values("02")
INSERT INTO tabla (c1)values("02")
INSERT INTO tabla (c1)values("04")
INSERT INTO tabla (c1)values("04")
INSERT INTO tabla (c1)values("05")
INSERT INTO tabla (c1)values("06")
INSERT INTO tabla (c1)values("07")
INSERT INTO tabla (c1)values("09")
INSERT INTO tabla (c1)values("07")
INSERT INTO tabla (c1)values("01")
INSERT INTO tabla (c1)values("01")
INSERT INTO tabla (c1)values("06")
INSERT INTO tabla (c1)values("06")
INSERT INTO tabla (c1)values("01")
INSERT INTO tabla (c1)values("09")

* regisdtros duplicados
Select c1, COUNT(c1) as canti ;
From Tabla ;
Group By c1 Having Count(C1)> 1

WAIT window

CLOSE DATABASES all
DELETE FILE tabla.dbf