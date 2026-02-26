SELECT 
	nombre_uca, 
	nombreentidad, 
	cod_uca,
	descripcion,
	SUM(persona_natural) AS "persona natural 2025",
	SUM(persona_juridica) AS "persona judirica 2025",
	SUM(total_tarjetas) AS "total tarjetas 2025"
FROM
	tarjetas
WHERE
	subcuenta = 55
AND
	nombre_uca = 'CREDIBANCO-VISA'
AND
	(fechacorte >= '2025-01-01' AND fechacorte <= '2025-12-31')
GROUP BY
	nombre_uca, 
	nombreentidad, 
	cod_uca, 
	descripcion
ORDER BY
	"total tarjetas 2025" DESC;



SELECT 
	nombre_uca, 
	nombreentidad, 
	cod_uca,
	descripcion,
	SUM(persona_natural) AS "persona natural 2025",
	SUM(persona_juridica) AS "persona judirica 2025",
	SUM(total_tarjetas) AS "total tarjetas 2025"
FROM
	tarjetas
WHERE
	subcuenta = 55
AND
	nombre_uca = 'CREDIBANCO-VISA'
AND
	(fechacorte >= '2025-01-01' AND fechacorte <= '2025-12-31')
GROUP BY
	nombre_uca, 
	nombreentidad, 
	cod_uca, 
	descripcion
ORDER BY
	"total tarjetas 2025" DESC;


SELECT
	tipoentidad,
	codigoentidad,
	nombreentidad,
	fechacorte,
	cod_uca,
	nombre_uca,
	subcuenta,
	descripcion,
	persona_natural,
	persona_juridica,
	total_tarjetas,
CASE
	WHEN fechacorte >= '2025-01-01' THEN '2025'
	WHEN fechacorte <= '2025-12-31' THEN '2025'
	ELSE 'another year'
END AS fecha
FROM
	tarjetas;

SELECT
	tipoentidad,
	codigoentidad,
	nombreentidad,
	EXTRACT(YEAR FROM fechacorte) AS year,
	cod_uca,
	nombre_uca,
	subcuenta,
	descripcion,
	SUM(persona_natural) AS persona_natural,
   	SUM(persona_juridica) AS persona_juridica,
    SUM(total_tarjetas) AS total_tarjetas
FROM
	tarjetas
GROUP BY 
	tipoentidad,
	codigoentidad,
	nombreentidad,
	EXTRACT(YEAR FROM fechacorte),
	cod_uca,
	nombre_uca,
	subcuenta,
	descripcion;

SELECT
	tipoentidad,
	codigoentidad,
	nombreentidad,
	EXTRACT(YEAR FROM fechacorte) AS year,
	cod_uca,
	nombre_uca,
	subcuenta,
	descripcion,
	SUM(persona_natural) AS persona_natural,
   	SUM(persona_juridica) AS persona_juridica,
    SUM(total_tarjetas) AS total_tarjetas
	
FROM
	tarjetas
WHERE
	tipoentidad = 1
	AND subcuenta = 30
	AND descripcion LIKE 'Número de%avances a nivel nacional con tarjeta de crédito%'
	AND codigoentidad = 7
GROUP BY 
	tipoentidad,
	codigoentidad,
	nombreentidad,
	EXTRACT(YEAR FROM fechacorte),
	cod_uca,
	nombre_uca,
	subcuenta,
	descripcion;


WITH bancolombia AS (
	SELECT 
	tipoentidad,
	codigoentidad,
	nombreentidad,
	EXTRACT(YEAR FROM fechacorte) AS year,
	cod_uca,
	nombre_uca,
	subcuenta,
	descripcion,
	SUM(persona_natural) AS persona_natural,
   	SUM(persona_juridica) AS persona_juridica,
    SUM(total_tarjetas) AS total_tarjetas
	FROM	
		tarjetas
	WHERE
		codigoentidad = 7
	GROUP BY 
	tipoentidad,
	codigoentidad,
	nombreentidad,
	EXTRACT(YEAR FROM fechacorte),
	cod_uca,
	nombre_uca,
	subcuenta,
	descripcion
)


SELECT
	*
FROM	
 	bancolombia;


select 
	SUM(persona_natural) AS persona_natural, 
	SUM(persona_juridica) AS persona_juridica,
	SUM(total_tarjetas) AS total_tarjetas
from bancolombia
where
(year = 2025
and subcuenta = 30
and cod_uca in (1, 2, 4)) 
AND
cod_uca IN (1,2,4);


SELECT
	tipoentidad,
	codigoentidad,
	nombreentidad,
	year,
	subcuenta,
	descripcion,
	SUM(persona_natural) AS persona_natural, 
	SUM(persona_juridica) AS persona_juridica,
	SUM(total_tarjetas) AS total_tarjetas
FROM
	bancolombia
WHERE

	 subcuenta = 30
	AND cod_uca in (1, 2, 4) 
	AND	cod_uca IN (1,2,4)
GROUP BY
	tipoentidad,
	codigoentidad,
	nombreentidad,
	year, 
	subcuenta,
	descripcion
ORDER BY
	total_tarjetas DESC;