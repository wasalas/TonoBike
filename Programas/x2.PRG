ls_area = ""
ls_zona = ""

ls_cliente  = "00248"
ls_producto = ""

ls_mesini = ""
ls_mesfin = ""

ls_anoini = "2018"
ls_anofin = "2018"

ls_perini = ls_anoini + ls_mesini
ls_perfin = ls_anofin + ls_mesfin


*clear
ln_tipo = 2



*IF ln_tipo = 1

	SELECT faccab.idcab, faccab.fecfac, ;
		faccab.idcli,    NVL(clientes.nomcli, SPACE(50)) as nomcli, ;
		clientes.idarea, NVL(area.desarea,    SPACE(10)) AS desarea, ;
		clientes.idzona, NVL(zona.deszona,    SPACE(10)) AS deszona, ;
		PADL(YEAR(faccab.fecfac),4,"0") AS anno, ;
		COUNT(facdet.peso)   AS conteo, ;
		SUM(facdet.cantidad) AS cantidad, ;
		SUM(facdet.peso)     AS peso, ;
		SUM(facdet.subtot)   AS importe ;
		FROM facdet ;
		LEFT OUTER JOIN faccab ON faccab.idcab == facdet.idcab ;
		left outer join clientes on clientes.idcli == faccab.idcli ;
		LEFT OUTER JOIN area ON clientes.idarea == area.idarea ;
		LEFT OUTER JOIN zona ON clientes.idarea + clientes.idzona == zona.idarea + zona.idzona ;
		WHERE faccab.estado != "A" AND ;
		( EMPTY(ls_perini) OR PADL(YEAR(faccab.fecfac),4,"0")+PADL(MONTH(faccab.fecfac),2,"0") >= ls_perini ) AND ;
		( EMPTY(ls_perfin) OR PADL(YEAR(faccab.fecfac),4,"0")+PADL(MONTH(faccab.fecfac),2,"0") <= ls_perfin ) AND ;
		( EMPTY(ls_cliente) OR clientes.idcli == ls_cliente ) AND ;
		( EMPTY(ls_area) or clientes.idarea == ls_area ) AND ;
		( EMPTY(ls_zona) or clientes.idarea + clientes.idzona == ls_area + ls_zona ) ;
		ORDER BY clientes.idarea, clientes.idzona, clientes.nomcli, anno ;
		GROUP BY faccab.idcli, anno ;
		INTO TABLE cur_consulta_año

		SUM importe TO importe_año
		?"Importe año "
		??TRANSFORM( importe_año,"999,999,999.99")

*ELSE
	SELECT faccab.idcab, faccab.fecfac, ;
		faccab.idcli,    NVL(clientes.nomcli, SPACE(50)) as nomcli, ;
		clientes.idarea, NVL(area.desarea,    SPACE(10)) AS desarea, ;
		clientes.idzona, NVL(zona.deszona,    SPACE(10)) AS deszona, ;
		PADL(YEAR(faccab.fecfac),4,"0") AS anno, ;
		PADL(MONTH(faccab.fecfac),2,"0") AS mes, ;
		COUNT(facdet.peso)   AS conteo, ;
		SUM(facdet.cantidad) AS cantidad, ;
		SUM(facdet.peso)     AS peso, ;
		SUM(facdet.subtot)   AS importe ;
		FROM facdet ;
		LEFT OUTER JOIN faccab ON faccab.idcab == facdet.idcab ;
		left outer join clientes on clientes.idcli == faccab.idcli ;
		LEFT OUTER JOIN area ON clientes.idarea == area.idarea ;
		LEFT OUTER JOIN zona ON clientes.idarea + clientes.idzona == zona.idarea + zona.idzona ;
		WHERE faccab.estado != "A" AND ;
		( EMPTY(ls_perini) OR PADL(YEAR(faccab.fecfac),4,"0")+PADL(MONTH(faccab.fecfac),2,"0") >= ls_perini ) AND ;
		( EMPTY(ls_perfin) OR PADL(YEAR(faccab.fecfac),4,"0")+PADL(MONTH(faccab.fecfac),2,"0") <= ls_perfin ) AND ;
		( EMPTY(ls_cliente) OR clientes.idcli == ls_cliente ) AND ;
		( EMPTY(ls_area) or clientes.idarea == ls_area ) AND ;
		( EMPTY(ls_zona) or clientes.idarea + clientes.idzona == ls_area + ls_zona ) ;
		ORDER BY clientes.idarea, clientes.idzona, clientes.nomcli, anno, mes ;
		GROUP BY faccab.idcli, anno, mes ;
		INTO table cur_consulta_mes
		
				SUM importe TO importe_mes

		?"Importe mes "
		??TRANSFORM( importe_mes,"999,999,999.99")


*ENDIF

