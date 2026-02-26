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


-- numero total de tarjetas de credito vigentes por ano 
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
		AND subcuenta = 10
		AND descripcion LIKE '%Número total de tarjetas de crédito vigentes durante el mes%'
	GROUP BY 
	tipoentidad,
	codigoentidad,
	nombreentidad,
	EXTRACT(YEAR FROM fechacorte),
	cod_uca,
	nombre_uca,
	subcuenta,
	descripcion

	SELECT 
	tipoentidad,
	codigoentidad,
	nombreentidad,
	EXTRACT(YEAR FROM fechacorte) AS year,
	subcuenta,
	descripcion,
	SUM(persona_natural) AS persona_natural,
   	SUM(persona_juridica) AS persona_juridica,
    SUM(total_tarjetas) AS total_tarjetas
	FROM	
		tarjetas
	WHERE
		codigoentidad = 7
		AND subcuenta = 10
		AND descripcion LIKE '%Número total de tarjetas de crédito vigentes durante el mes%'
	GROUP BY 
	tipoentidad,
	codigoentidad,
	nombreentidad,
	EXTRACT(YEAR FROM fechacorte),
	subcuenta,
	descripcion

CREATE VIEW active_credit_cards AS 
	SELECT 
		tipoentidad,
		codigoentidad,
		nombreentidad,
		EXTRACT(YEAR FROM fechacorte) AS year,
		subcuenta,
		descripcion,
		SUM(persona_natural) AS persona_natural,
	   	SUM(persona_juridica) AS persona_juridica,
	    SUM(total_tarjetas) AS total_tarjetas
		FROM	
			tarjetas
		WHERE
			subcuenta = 10
			AND descripcion LIKE '%Número total de tarjetas de crédito vigentes durante el mes%'
		GROUP BY 
		tipoentidad,
		codigoentidad,
		nombreentidad,
		EXTRACT(YEAR FROM fechacorte),
		subcuenta,
		descripcion

SELECT
	tipoentidad,
	codigoentidad,
	nombreentidad,
	EXTRACT(YEAR FROM fechacorte) AS year,
	subcuenta,
	descripcion,
	SUM(persona_natural) AS persona_natural,
   	SUM(persona_juridica) AS persona_juridica,
    SUM(total_tarjetas) AS total_tarjetas
	
FROM
	tarjetas
WHERE
	subcuenta = 30
	AND descripcion LIKE '%avances a nivel nacional con tarjeta de crédito%'
GROUP BY 
	tipoentidad,
	codigoentidad,
	nombreentidad,
	EXTRACT(YEAR FROM fechacorte),
	subcuenta,
	descripcion;

CREATE VIEW vw_annual_foreign_cc_purchase_txn_count AS
	SELECT
		tipoentidad,
		codigoentidad,
		nombreentidad,
		EXTRACT(YEAR FROM fechacorte) AS year,
		subcuenta,
		descripcion,
		SUM(persona_natural) AS persona_natural,
	   	SUM(persona_juridica) AS persona_juridica,
	    SUM(total_tarjetas) AS total_tarjetas
		
	FROM
		tarjetas
	WHERE
		 subcuenta = 35
		 AND
		 descripcion LIKE '%compras en el exterior con tarjeta de crédito%'
	GROUP BY 
		tipoentidad,
		codigoentidad,
		nombreentidad,
		EXTRACT(YEAR FROM fechacorte),
		subcuenta,
		descripcion;
	
SELECT
	vw_yearly_active_credit_cards.nombreentidad,
	vw_yearly_active_credit_cards.tipoentidad,
	vw_yearly_active_credit_cards.codigoentidad,
	vw_yearly_active_credit_cards.year,
---	vw_yearly_active_credit_cards.total_tarjetas AS active_cc,
	vw_yearly_domestic_cc_cash_adv_txn.total_tarjetas AS yearly_trx
FROM 
	vw_yearly_active_credit_cards
LEFT JOIN 
	vw_yearly_domestic_cc_cash_adv_txn
ON
	vw_yearly_active_credit_cards.codigoentidad = vw_yearly_domestic_cc_cash_adv_txn.codigoentidad
WHERE
	vw_yearly_active_credit_cards.year = 2025
	AND vw_yearly_domestic_cc_cash_adv_txn.year = 2025



--- AVG annual trx adv by year by cc 

SELECT
	vw_yearly_active_credit_cards.nombreentidad,
	vw_yearly_active_credit_cards.tipoentidad,
	vw_yearly_active_credit_cards.codigoentidad,
	vw_yearly_active_credit_cards.year,
	vw_yearly_active_credit_cards.total_tarjetas AS active_cc,
	vw_yearly_domestic_cc_cash_adv_txn.total_tarjetas AS yearly_trx,
	vw_yearly_domestic_cc_cash_adv_txn.total_tarjetas/ vw_yearly_active_credit_cards.total_tarjetas AS avg_trx_adv_by_cc
FROM 
	vw_yearly_active_credit_cards
LEFT JOIN 
	vw_yearly_domestic_cc_cash_adv_txn
ON
	vw_yearly_active_credit_cards.nombreentidad = vw_yearly_domestic_cc_cash_adv_txn.nombreentidad
WHERE
	vw_yearly_active_credit_cards.year = 2025
	AND vw_yearly_domestic_cc_cash_adv_txn.year = 2025
ORDER BY
	active_cc DESC
LIMIT
	5;
