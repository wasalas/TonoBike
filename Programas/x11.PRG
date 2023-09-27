tc_correl = "2200001"

SELECT idcab, iddet, ;
	cotdet.idProducto, NVL(productos.DESCRIP, SPACE(50)) AS DESCRIP, ;
	dosis, idunidad, ingreso, cotdet.idEmbalaje, lote, peso, cantidad, precio, subtot, unico ;
	FROM cotdet ;
	LEFT OUTER JOIN productos ON productos.idProducto == cotdet.idProducto ;
	WHERE idcab == tc_correl ;
	ORDER BY productos.DESCRIP, dosis asc ;
	INTO CURSOR cur_consulta_det READWRITE

INDEX on idproducto + ALLTRIM(PADL(dosis,2)) TAG tag1

browse