
CLOSE DATA ALL

WAIT WINDOW "Procesando archivo ACCESOS.DBF " NOWAIT
SELECT 0
USE datos\accesos.dbf
DELE TAG ALL
PACK
INDEX ON codusu TAG tag1
INDEX ON codusu+varmenu TAG tag2
SET ORDER TO 1

WAIT WINDOW "Procesando archivo ACCESOSX.DBF " NOWAIT
SELECT 0
USE datos\accesosx.dbf
PACK

WAIT WINDOW "Procesando archivo ARO_BICI.DBF " NOWAIT
SELECT 0
USE datos\aro_bici.dbf
DELE TAG ALL
PACK
INDEX ON id_arobici TAG tag1
SET ORDER TO 1

WAIT WINDOW "Procesando archivo BICICLETAS.DBF " NOWAIT
SELECT 0
USE datos\bicicletas.dbf
DELE TAG ALL
PACK
INDEX ON id_bici TAG tag1
INDEX ON id_cli TAG tag2
SET ORDER TO 1

WAIT WINDOW "Procesando archivo CLIENTES.DBF " NOWAIT
SELECT 0
USE datos\clientes.dbf
DELE TAG ALL
PACK
INDEX ON id_cli TAG tag1
SET ORDER TO 1

WAIT WINDOW "Procesando archivo DISTRITOS.DBF " NOWAIT
SELECT 0
USE datos\distritos.dbf
DELE TAG ALL
PACK
INDEX ON id_dis TAG tag1
SET ORDER TO 1

WAIT WINDOW "Procesando archivo ERRORES.DBF " NOWAIT
SELECT 0
USE datos\errores.dbf
PACK

WAIT WINDOW "Procesando archivo ESTADOS.DBF " NOWAIT
SELECT 0
USE datos\estados.dbf
PACK

WAIT WINDOW "Procesando archivo FAMILIAS.DBF " NOWAIT
SELECT 0
USE datos\familias.dbf
DELE TAG ALL
PACK
INDEX ON id_familia TAG tag1
SET ORDER TO 1

WAIT WINDOW "Procesando archivo MARCAS.DBF " NOWAIT
SELECT 0
USE datos\marcas.dbf
DELE TAG ALL
PACK
INDEX ON id_marca TAG tag1
SET ORDER TO 1

WAIT WINDOW "Procesando archivo MARCA_BICI.DBF " NOWAIT
SELECT 0
USE datos\marca_bici.dbf
DELE TAG ALL
PACK
INDEX ON id_marbici TAG tag1
SET ORDER TO 1

WAIT WINDOW "Procesando archivo MENUS.DBF " NOWAIT
SELECT 0
USE datos\menus.dbf
DELE TAG ALL
PACK
INDEX ON varmenu TAG tag1
SET ORDER TO 1

WAIT WINDOW "Procesando archivo MODELOS.DBF " NOWAIT
SELECT 0
USE datos\modelos.dbf
DELE TAG ALL
PACK
INDEX ON id_modelo TAG tag1
SET ORDER TO 1

WAIT WINDOW "Procesando archivo MONEDA.DBF " NOWAIT
SELECT 0
USE datos\moneda.dbf
PACK

WAIT WINDOW "Procesando archivo MOTIVO.DBF " NOWAIT
SELECT 0
USE datos\motivo.dbf
DELE TAG ALL
PACK
INDEX ON idmotivo TAG tag1
SET ORDER TO 1

WAIT WINDOW "Procesando archivo OTCAB.DBF " NOWAIT
SELECT 0
USE datos\otcab.dbf
DELE TAG ALL
PACK
INDEX ON id_cab TAG tag1
SET ORDER TO 1

WAIT WINDOW "Procesando archivo OTDET.DBF " NOWAIT
SELECT 0
USE datos\otdet.dbf
DELE TAG ALL
PACK
INDEX ON id_det TAG tag1
SET ORDER TO 1

WAIT WINDOW "Procesando archivo PARAMSIS.DBF " NOWAIT
SELECT 0
USE datos\paramsis.dbf
PACK

WAIT WINDOW "Procesando archivo PRODUCTOS.DBF " NOWAIT
SELECT 0
USE datos\productos.dbf
DELE TAG ALL
PACK
INDEX ON id_prod TAG tag1
SET ORDER TO 1

WAIT WINDOW "Procesando archivo TIPDOC.DBF " NOWAIT
SELECT 0
USE datos\tipdoc.dbf
PACK

WAIT WINDOW "Procesando archivo TIPO_BICI.DBF " NOWAIT
SELECT 0
USE datos\tipo_bici.dbf
DELE TAG ALL
PACK
INDEX ON id_tipbici TAG tag1
SET ORDER TO 1

WAIT WINDOW "Procesando archivo TIPO_PRODUCTO.DBF " NOWAIT
SELECT 0
USE datos\tipo_producto.dbf
DELE TAG ALL
PACK
INDEX ON id_tipprod TAG tag1
SET ORDER TO 1

WAIT WINDOW "Procesando archivo USUARIOS.DBF " NOWAIT
SELECT 0
USE datos\usuarios.dbf
DELE TAG ALL
PACK
INDEX ON codigo TAG tag1
INDEX ON nombre TAG tag2
SET ORDER TO 1