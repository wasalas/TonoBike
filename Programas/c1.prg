ls_id_cab = "0000000001"
*ls_id_cab = ""

CLOSE DATABASES ALL

USE otcab IN 0
USE otdet IN 0

SELECT c.id_cab, ;
	c.fecing, c.horing, c.usuing, ;
	c.fecmod, c.hormod, c.usumod, ;
	c.fecrec, c.horrec, ;
	c.fecestent, c.horestent, ;
	c.fecent, c.horent, ;
	c.subtotal, c.igv, c.porigv, c.TOTAL, ;
	c.estado, c.id_moneda, c.obs AS obs_ot, ;
	c.id_cli, cl.id_tipdoc, NVL(td.DESCRIP, SPACE(50)) AS destipdoc, ;
	cl.numdoc, cl.nomcli, cl.telf, cl.direccion, cl.id_dis, ;
	NVL(di.DESCRIP, SPACE(50)) AS desdis, ;
	c.id_bici, ;
	b.id_tipbici, NVL(T.DESCRIP, SPACE(50)) AS destip_bici, ;
	b.id_arobici, NVL(a.DESCRIP, SPACE(50)) AS desaro_bici, ;
	b.id_marbici, NVL(m.DESCRIP, SPACE(50)) AS desmar_bici, ;
	b.modelo,     b.COLOR, b.nroserie, b.obs AS obs__bici, ;	
	d.id_det, d.id_prod, ;
	p.id_tipprod, tp.DESCRIP AS destipprod, ;
	p.id_familia, F.DESCRIP AS desfam, ;
	p.id_marca, p.id_modelo, p.DESCRIP AS desprod, ;
	d.precio, d.cantidad ;
	FROM otcab c ;
	LEFT OUTER JOIN otdet         d  ON c.id_cab     == d.id_cab ;
	LEFT OUTER JOIN productos     p  ON d.id_prod    == p.id_prod ;
	LEFT OUTER JOIN tipo_producto tp ON p.id_tipprod == tp.id_tipprod ;
	LEFT OUTER JOIN familias      F  ON p.id_familia == F.id_familia ;
	LEFT OUTER JOIN clientes      cl ON c.id_cli     == cl.id_cli ;
	LEFT OUTER JOIN bicicletas    b  ON c.id_bici    == b.id_bici ;
	LEFT OUTER JOIN tipo_bici     T  ON b.id_tipbici == T.id_tipbici ;
	LEFT OUTER JOIN aro_bici      a  ON b.id_arobici == a.id_arobici ;
	LEFT OUTER JOIN marca_bici    m  ON b.id_marbici == m.id_marbici ;
	LEFT OUTER JOIN distritos     di ON cl.id_dis    == di.id_dis ;
	LEFT OUTER JOIN tipdoc        td ON cl.id_tipdoc == td.id_tipdoc ;
	WHERE d.activo AND (EMPTY( ls_id_cab ) OR d.id_cab = ls_id_cab) ;
	ORDER BY desprod ;
	INTO CURSOR cur_cboBicicletas




BROWSE

