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


SELECT
	vw_yearly_active_credit_cards.nombreentidad,
	vw_yearly_active_credit_cards.tipoentidad,
	vw_yearly_active_credit_cards.codigoentidad,
	vw_yearly_active_credit_cards.year,
	vw_yearly_active_credit_cards.total_tarjetas AS tarjetasdecreditoactivas,
	vw_yearly_domestic_cc_cash_adv_txn.total_tarjetas AS transaccionesanuales,
	vw_yearly_domestic_cc_cash_adv_txn.total_tarjetas/ vw_yearly_active_credit_cards.total_tarjetas AS promediotraccionesanualesportarjeta
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
	tarjetasdecreditoactivas DESC
LIMIT
	5;


SELECT
	DISTINCT(num_trx_exterior_anual.tipoentidad) AS tipoentidad,
	num_trx_exterior_anual.codigoentidad AS codigoentidad,
	num_trx_exterior_anual.nombreentidad AS nombreentidad,
	num_trx_exterior_anual.year AS year,
	num_total_tc_anual.total_tarjetas AS total_tarjetas_activas_anual,
	num_trx_exterior_anual.total_tarjetas AS total_monto_anual_compras_ext_tarjetas,
	(num_trx_exterior_anual.total_tarjetas / num_total_tc_anual.total_tarjetas) AS total_num_trx_exterior_por_tarjeta
FROM
	vw_num_trx_por_compras_exterior_con_tarjetacredito_anual AS num_trx_exterior_anual
LEFT JOIN
	vw_num_total_tarjetas_credito_vigentes_ano AS num_total_tc_anual
ON
	num_trx_exterior_anual.nombreentidad = num_total_tc_anual.nombreentidad

----

SELECT
	DISTINCT(num_trx_exterior_anual.tipoentidad) AS tipoentidad,
	num_trx_exterior_anual.codigoentidad AS codigoentidad,
	num_trx_exterior_anual.nombreentidad AS nombreentidad,
	num_trx_exterior_anual.year AS year,
	num_total_tc_anual.total_tarjetas AS total_tarjetas_activas_anual,
	num_trx_exterior_anual.total_tarjetas AS total_monto_anual_compras_ext_tarjetas,
	(num_trx_exterior_anual.total_tarjetas / num_total_tc_anual.total_tarjetas) AS total_num_trx_exterior_por_tarjeta
FROM
	vw_num_trx_por_compras_exterior_con_tarjetacredito_anual AS num_trx_exterior_anual
LEFT JOIN
	vw_num_total_tarjetas_credito_vigentes_ano AS num_total_tc_anual
ON
	num_trx_exterior_anual.nombreentidad = num_total_tc_anual.nombreentidad
WHERE
	num_trx_exterior_anual.year = 2025 AND num_total_tc_anual.year = 2025
ORDER BY
	total_tarjetas_activas_anual DESC
LIMIT
	5;


SELECT
	DISTINCT(num_trx_exterior_anual.tipoentidad) AS tipoentidad,
	num_trx_exterior_anual.codigoentidad AS codigoentidad,
	num_trx_exterior_anual.nombreentidad AS nombreentidad,
	num_trx_exterior_anual.year AS year,
	num_total_tc_anual.total_tarjetas AS total_tarjetas_activas_anual,
	num_trx_exterior_anual.total_tarjetas AS total_monto_anual_compras_ext_tarjetas,
	(num_trx_exterior_anual.total_tarjetas / num_total_tc_anual.total_tarjetas) AS total_num_trx_exterior_por_tarjeta
FROM
	vw_num_trx_por_compras_exterior_con_tarjetacredito_anual AS num_trx_exterior_anual
LEFT JOIN
	vw_num_total_tarjetas_credito_vigentes_ano AS num_total_tc_anual
ON
	num_trx_exterior_anual.nombreentidad = num_total_tc_anual.nombreentidad
WHERE
	num_trx_exterior_anual.year = 2025 AND num_total_tc_anual.year = 2025
ORDER BY
	total_tarjetas_activas_anual DESC, total_num_trx_exterior_por_tarjeta DESC
LIMIT
	5;


SELECT
	DISTINCT(num_trx_exterior_anual.tipoentidad) AS tipoentidad,
	num_trx_exterior_anual.codigoentidad AS codigoentidad,
	num_trx_exterior_anual.nombreentidad AS nombreentidad,
	num_trx_exterior_anual.year AS year,
	num_total_tc_anual.total_tarjetas AS total_tarjetas_activas_anual,
	num_trx_exterior_anual.total_tarjetas AS total_num_anual_compras_ext_tarjetas,
	(num_trx_exterior_anual.total_tarjetas / num_total_tc_anual.total_tarjetas) AS total_num_trx_exterior_por_tarjeta
FROM
	vw_num_trx_por_compras_exterior_con_tarjetacredito_anual AS num_trx_exterior_anual
LEFT JOIN
	vw_num_total_tarjetas_credito_vigentes_ano AS num_total_tc_anual
ON
	num_trx_exterior_anual.nombreentidad = num_total_tc_anual.nombreentidad
WHERE
	num_trx_exterior_anual.year = 2025 AND num_total_tc_anual.year = 2025
ORDER BY
	total_tarjetas_activas_anual DESC, total_num_trx_exterior_por_tarjeta DESC
LIMIT
	5;

---

WITH total_num_trx_exterior_por_tarjeta_2025 AS (
SELECT
	DISTINCT(num_trx_exterior_anual.tipoentidad) AS tipoentidad,
	num_trx_exterior_anual.codigoentidad AS codigoentidad,
	num_trx_exterior_anual.nombreentidad AS nombreentidad,
	num_trx_exterior_anual.year AS year,
	num_total_tc_anual.total_tarjetas AS total_tarjetas_activas_anual,
	num_trx_exterior_anual.total_tarjetas AS total_num_anual_compras_ext_tarjetas,
	(num_trx_exterior_anual.total_tarjetas / num_total_tc_anual.total_tarjetas) AS total_num_trx_exterior_por_tarjeta
FROM
	vw_num_trx_por_compras_exterior_con_tarjetacredito_anual AS num_trx_exterior_anual
LEFT JOIN
	vw_num_total_tarjetas_credito_vigentes_ano AS num_total_tc_anual
ON
	num_trx_exterior_anual.nombreentidad = num_total_tc_anual.nombreentidad
WHERE
	num_trx_exterior_anual.year = 2025 AND num_total_tc_anual.year = 2025
ORDER BY
	total_tarjetas_activas_anual DESC, total_num_trx_exterior_por_tarjeta DESC
LIMIT
	10),

total_num_trx_exterior_por_tarjeta_2024 AS (
SELECT
	DISTINCT(num_trx_exterior_anual.tipoentidad) AS tipoentidad,
	num_trx_exterior_anual.codigoentidad AS codigoentidad,
	num_trx_exterior_anual.nombreentidad AS nombreentidad,
	num_trx_exterior_anual.year AS year,
	num_total_tc_anual.total_tarjetas AS total_tarjetas_activas_anual,
	num_trx_exterior_anual.total_tarjetas AS total_num_anual_compras_ext_tarjetas,
	(num_trx_exterior_anual.total_tarjetas / num_total_tc_anual.total_tarjetas) AS total_num_trx_exterior_por_tarjeta
FROM
	vw_num_trx_por_compras_exterior_con_tarjetacredito_anual AS num_trx_exterior_anual
LEFT JOIN
	vw_num_total_tarjetas_credito_vigentes_ano AS num_total_tc_anual
ON
	num_trx_exterior_anual.nombreentidad = num_total_tc_anual.nombreentidad
WHERE
	num_trx_exterior_anual.year = 2024 AND num_total_tc_anual.year = 2024
ORDER BY
	total_tarjetas_activas_anual DESC, total_num_trx_exterior_por_tarjeta DESC
LIMIT
	10)


SELECT
	*
FROM
	total_num_trx_exterior_por_tarjeta_2025
LEFT JOIN
	total_num_trx_exterior_por_tarjeta_2024
ON
	total_num_trx_exterior_por_tarjeta_2025.nombreentidad = total_num_trx_exterior_por_tarjeta_2024.nombreentidad


WITH total_num_trx_exterior_por_tarjeta_2025 AS (
SELECT
	DISTINCT(num_trx_exterior_anual.tipoentidad) AS tipoentidad,
	num_trx_exterior_anual.codigoentidad AS codigoentidad,
	num_trx_exterior_anual.nombreentidad AS nombreentidad,
	num_trx_exterior_anual.year AS year,
	num_total_tc_anual.total_tarjetas AS total_tarjetas_activas_anual,
	num_trx_exterior_anual.total_tarjetas AS total_num_anual_compras_ext_tarjetas,
	(num_trx_exterior_anual.total_tarjetas / num_total_tc_anual.total_tarjetas) AS total_num_trx_exterior_por_tarjeta
FROM
	vw_num_trx_por_compras_exterior_con_tarjetacredito_anual AS num_trx_exterior_anual
LEFT JOIN
	vw_num_total_tarjetas_credito_vigentes_ano AS num_total_tc_anual
ON
	num_trx_exterior_anual.nombreentidad = num_total_tc_anual.nombreentidad
WHERE
	num_trx_exterior_anual.year = 2025 AND num_total_tc_anual.year = 2025
ORDER BY
	total_tarjetas_activas_anual DESC, total_num_trx_exterior_por_tarjeta DESC
LIMIT
	10),

total_num_trx_exterior_por_tarjeta_2024 AS (
SELECT
	DISTINCT(num_trx_exterior_anual.tipoentidad) AS tipoentidad,
	num_trx_exterior_anual.codigoentidad AS codigoentidad,
	num_trx_exterior_anual.nombreentidad AS nombreentidad,
	num_trx_exterior_anual.year AS year,
	num_total_tc_anual.total_tarjetas AS total_tarjetas_activas_anual,
	num_trx_exterior_anual.total_tarjetas AS total_num_anual_compras_ext_tarjetas,
	(num_trx_exterior_anual.total_tarjetas / num_total_tc_anual.total_tarjetas) AS total_num_trx_exterior_por_tarjeta
FROM
	vw_num_trx_por_compras_exterior_con_tarjetacredito_anual AS num_trx_exterior_anual
LEFT JOIN
	vw_num_total_tarjetas_credito_vigentes_ano AS num_total_tc_anual
ON
	num_trx_exterior_anual.nombreentidad = num_total_tc_anual.nombreentidad
WHERE
	num_trx_exterior_anual.year = 2024 AND num_total_tc_anual.year = 2024
ORDER BY
	total_tarjetas_activas_anual DESC, total_num_trx_exterior_por_tarjeta DESC
LIMIT
	10),
total_num_trx_exterior_por_tarjeta_2023 AS (
SELECT
	DISTINCT(num_trx_exterior_anual.tipoentidad) AS tipoentidad,
	num_trx_exterior_anual.codigoentidad AS codigoentidad,
	num_trx_exterior_anual.nombreentidad AS nombreentidad,
	num_trx_exterior_anual.year AS year,
	num_total_tc_anual.total_tarjetas AS total_tarjetas_activas_anual,
	num_trx_exterior_anual.total_tarjetas AS total_num_anual_compras_ext_tarjetas,
	(num_trx_exterior_anual.total_tarjetas / num_total_tc_anual.total_tarjetas) AS total_num_trx_exterior_por_tarjeta
FROM
	vw_num_trx_por_compras_exterior_con_tarjetacredito_anual AS num_trx_exterior_anual
LEFT JOIN
	vw_num_total_tarjetas_credito_vigentes_ano AS num_total_tc_anual
ON
	num_trx_exterior_anual.nombreentidad = num_total_tc_anual.nombreentidad
WHERE
	num_trx_exterior_anual.year = 2023 AND num_total_tc_anual.year = 2023
ORDER BY
	total_tarjetas_activas_anual DESC, total_num_trx_exterior_por_tarjeta DESC
LIMIT
	10)


SELECT
	*
FROM
	total_num_trx_exterior_por_tarjeta_2025
LEFT JOIN
	total_num_trx_exterior_por_tarjeta_2024
ON
	total_num_trx_exterior_por_tarjeta_2025.codigoentidad = total_num_trx_exterior_por_tarjeta_2024.codigoentidad
LEFT JOIN
	total_num_trx_exterior_por_tarjeta_2023
ON
	total_num_trx_exterior_por_tarjeta_2024.codigoentidad = total_num_trx_exterior_por_tarjeta_2023.codigoentidad


WITH total_num_trx_exterior_por_tarjeta_2025 AS (
SELECT
	DISTINCT(num_trx_exterior_anual.tipoentidad) AS tipoentidad,
	num_trx_exterior_anual.codigoentidad AS codigoentidad,
	num_trx_exterior_anual.nombreentidad AS nombreentidad,
	num_trx_exterior_anual.year AS year,
	num_total_tc_anual.total_tarjetas AS total_tarjetas_activas_anual,
	num_trx_exterior_anual.total_tarjetas AS total_num_anual_compras_ext_tarjetas,
	(num_trx_exterior_anual.total_tarjetas / num_total_tc_anual.total_tarjetas) AS total_num_trx_exterior_por_tarjeta
FROM
	vw_num_trx_por_compras_exterior_con_tarjetacredito_anual AS num_trx_exterior_anual
LEFT JOIN
	vw_num_total_tarjetas_credito_vigentes_ano AS num_total_tc_anual
ON
	num_trx_exterior_anual.nombreentidad = num_total_tc_anual.nombreentidad
WHERE
	num_trx_exterior_anual.year = 2025 AND num_total_tc_anual.year = 2025
ORDER BY
	total_tarjetas_activas_anual DESC, total_num_trx_exterior_por_tarjeta DESC
LIMIT
	10),

total_num_trx_exterior_por_tarjeta_2024 AS (
SELECT
	DISTINCT(num_trx_exterior_anual.tipoentidad) AS tipoentidad,
	num_trx_exterior_anual.codigoentidad AS codigoentidad,
	num_trx_exterior_anual.nombreentidad AS nombreentidad,
	num_trx_exterior_anual.year AS year,
	num_total_tc_anual.total_tarjetas AS total_tarjetas_activas_anual,
	num_trx_exterior_anual.total_tarjetas AS total_num_anual_compras_ext_tarjetas,
	(num_trx_exterior_anual.total_tarjetas / num_total_tc_anual.total_tarjetas) AS total_num_trx_exterior_por_tarjeta
FROM
	vw_num_trx_por_compras_exterior_con_tarjetacredito_anual AS num_trx_exterior_anual
LEFT JOIN
	vw_num_total_tarjetas_credito_vigentes_ano AS num_total_tc_anual
ON
	num_trx_exterior_anual.nombreentidad = num_total_tc_anual.nombreentidad
WHERE
	num_trx_exterior_anual.year = 2024 AND num_total_tc_anual.year = 2024
ORDER BY
	total_tarjetas_activas_anual DESC, total_num_trx_exterior_por_tarjeta DESC
LIMIT
	10),
total_num_trx_exterior_por_tarjeta_2023 AS (
SELECT
	DISTINCT(num_trx_exterior_anual.tipoentidad) AS tipoentidad,
	num_trx_exterior_anual.codigoentidad AS codigoentidad,
	num_trx_exterior_anual.nombreentidad AS nombreentidad,
	num_trx_exterior_anual.year AS year,
	num_total_tc_anual.total_tarjetas AS total_tarjetas_activas_anual,
	num_trx_exterior_anual.total_tarjetas AS total_num_anual_compras_ext_tarjetas,
	(num_trx_exterior_anual.total_tarjetas / num_total_tc_anual.total_tarjetas) AS total_num_trx_exterior_por_tarjeta
FROM
	vw_num_trx_por_compras_exterior_con_tarjetacredito_anual AS num_trx_exterior_anual
LEFT JOIN
	vw_num_total_tarjetas_credito_vigentes_ano AS num_total_tc_anual
ON
	num_trx_exterior_anual.nombreentidad = num_total_tc_anual.nombreentidad
WHERE
	num_trx_exterior_anual.year = 2023 AND num_total_tc_anual.year = 2023
ORDER BY
	total_tarjetas_activas_anual DESC, total_num_trx_exterior_por_tarjeta DESC
LIMIT
	10)


SELECT
	total_num_trx_exterior_por_tarjeta_2025.nombreentidad AS nombreentidad,
	total_num_trx_exterior_por_tarjeta_2025.tipoentidad AS tipoentidad,
	total_num_trx_exterior_por_tarjeta_2025.codigoentidad AS codigoentidad,
	total_num_trx_exterior_por_tarjeta_2025.year AS year_2025,
	total_num_trx_exterior_por_tarjeta_2025.total_tarjetas_activas_anual AS total_tarjetas_activas_anual_2025,
	total_num_trx_exterior_por_tarjeta_2025.total_num_anual_compras_ext_tarjetas AS total_num_anual_compras_ext_tarjetas_2025,
	total_num_trx_exterior_por_tarjeta_2025.total_num_trx_exterior_por_tarjeta AS total_num_trx_exterior_por_tarjeta_2025,
	total_num_trx_exterior_por_tarjeta_2024.year AS year_2024,
	total_num_trx_exterior_por_tarjeta_2024.total_tarjetas_activas_anual AS total_tarjetas_activas_anual_2024,
	total_num_trx_exterior_por_tarjeta_2024.total_num_anual_compras_ext_tarjetas AS total_num_anual_compras_ext_tarjetas_2024,
	total_num_trx_exterior_por_tarjeta_2024.total_num_trx_exterior_por_tarjeta AS total_num_trx_exterior_por_tarjeta_2024,
	total_num_trx_exterior_por_tarjeta_2023.year AS year_2023,
	total_num_trx_exterior_por_tarjeta_2023.total_tarjetas_activas_anual AS total_tarjetas_activas_anual_2023,
	total_num_trx_exterior_por_tarjeta_2023.total_num_anual_compras_ext_tarjetas AS total_num_anual_compras_ext_tarjetas_2023,
	total_num_trx_exterior_por_tarjeta_2023.total_num_trx_exterior_por_tarjeta AS total_num_trx_exterior_por_tarjeta_2023
	
FROM
	total_num_trx_exterior_por_tarjeta_2025
LEFT JOIN
	total_num_trx_exterior_por_tarjeta_2024
ON
	total_num_trx_exterior_por_tarjeta_2025.codigoentidad = total_num_trx_exterior_por_tarjeta_2024.codigoentidad
LEFT JOIN
	total_num_trx_exterior_por_tarjeta_2023
ON
	total_num_trx_exterior_por_tarjeta_2024.codigoentidad = total_num_trx_exterior_por_tarjeta_2023.codigoentidad

--- updated 

WITH total_num_trx_exterior_por_tarjeta_2025 AS (
SELECT
	num_trx_exterior_anual.tipoentidad AS tipoentidad,
	num_trx_exterior_anual.codigoentidad AS codigoentidad,
	num_trx_exterior_anual.nombreentidad AS nombreentidad,
	num_trx_exterior_anual.year AS year,
	num_total_tc_anual.total_tarjetas AS total_tarjetas_activas_anual,
	num_trx_exterior_anual.total_tarjetas AS total_num_anual_compras_ext_tarjetas,
	(num_trx_exterior_anual.total_tarjetas / num_total_tc_anual.total_tarjetas) AS total_num_trx_exterior_por_tarjeta
FROM
	vw_num_trx_por_compras_exterior_con_tarjetacredito_anual AS num_trx_exterior_anual
LEFT JOIN
	vw_num_total_tarjetas_credito_vigentes_ano AS num_total_tc_anual
ON
	num_trx_exterior_anual.nombreentidad = num_total_tc_anual.nombreentidad
WHERE
	num_trx_exterior_anual.year = 2025 AND num_total_tc_anual.year = 2025
ORDER BY
	total_tarjetas_activas_anual DESC, total_num_trx_exterior_por_tarjeta DESC
LIMIT
	10),

total_num_trx_exterior_por_tarjeta_2024 AS (
SELECT
	num_trx_exterior_anual.tipoentidad AS tipoentidad,
	num_trx_exterior_anual.codigoentidad AS codigoentidad,
	num_trx_exterior_anual.nombreentidad AS nombreentidad,
	num_trx_exterior_anual.year AS year,
	num_total_tc_anual.total_tarjetas AS total_tarjetas_activas_anual,
	num_trx_exterior_anual.total_tarjetas AS total_num_anual_compras_ext_tarjetas,
	(num_trx_exterior_anual.total_tarjetas / num_total_tc_anual.total_tarjetas) AS total_num_trx_exterior_por_tarjeta
FROM
	vw_num_trx_por_compras_exterior_con_tarjetacredito_anual AS num_trx_exterior_anual
LEFT JOIN
	vw_num_total_tarjetas_credito_vigentes_ano AS num_total_tc_anual
ON
	num_trx_exterior_anual.nombreentidad = num_total_tc_anual.nombreentidad
WHERE
	num_trx_exterior_anual.year = 2024 AND num_total_tc_anual.year = 2024
ORDER BY
	total_tarjetas_activas_anual DESC, total_num_trx_exterior_por_tarjeta DESC
LIMIT
	10),
total_num_trx_exterior_por_tarjeta_2023 AS (
SELECT
	num_trx_exterior_anual.tipoentidad AS tipoentidad,
	num_trx_exterior_anual.codigoentidad AS codigoentidad,
	num_trx_exterior_anual.nombreentidad AS nombreentidad,
	num_trx_exterior_anual.year AS year,
	num_total_tc_anual.total_tarjetas AS total_tarjetas_activas_anual,
	num_trx_exterior_anual.total_tarjetas AS total_num_anual_compras_ext_tarjetas,
	(num_trx_exterior_anual.total_tarjetas / num_total_tc_anual.total_tarjetas) AS total_num_trx_exterior_por_tarjeta
FROM
	vw_num_trx_por_compras_exterior_con_tarjetacredito_anual AS num_trx_exterior_anual
LEFT JOIN
	vw_num_total_tarjetas_credito_vigentes_ano AS num_total_tc_anual
ON
	num_trx_exterior_anual.nombreentidad = num_total_tc_anual.nombreentidad
WHERE
	num_trx_exterior_anual.year = 2023 AND num_total_tc_anual.year = 2023
ORDER BY
	total_tarjetas_activas_anual DESC, total_num_trx_exterior_por_tarjeta DESC
LIMIT
	10)


SELECT
	total_num_trx_exterior_por_tarjeta_2025.nombreentidad AS nombreentidad,
	total_num_trx_exterior_por_tarjeta_2025.tipoentidad AS tipoentidad,
	total_num_trx_exterior_por_tarjeta_2025.codigoentidad AS codigoentidad,
	total_num_trx_exterior_por_tarjeta_2025.year AS year_2025,
	total_num_trx_exterior_por_tarjeta_2025.total_tarjetas_activas_anual AS total_tarjetas_activas_anual_2025,
	total_num_trx_exterior_por_tarjeta_2025.total_num_anual_compras_ext_tarjetas AS total_num_anual_compras_ext_tarjetas_2025,
	total_num_trx_exterior_por_tarjeta_2025.total_num_trx_exterior_por_tarjeta AS total_num_trx_exterior_por_tarjeta_2025,
	total_num_trx_exterior_por_tarjeta_2024.year AS year_2024,
	total_num_trx_exterior_por_tarjeta_2024.total_tarjetas_activas_anual AS total_tarjetas_activas_anual_2024,
	total_num_trx_exterior_por_tarjeta_2024.total_num_anual_compras_ext_tarjetas AS total_num_anual_compras_ext_tarjetas_2024,
	total_num_trx_exterior_por_tarjeta_2024.total_num_trx_exterior_por_tarjeta AS total_num_trx_exterior_por_tarjeta_2024,
	total_num_trx_exterior_por_tarjeta_2023.year AS year_2023,
	total_num_trx_exterior_por_tarjeta_2023.total_tarjetas_activas_anual AS total_tarjetas_activas_anual_2023,
	total_num_trx_exterior_por_tarjeta_2023.total_num_anual_compras_ext_tarjetas AS total_num_anual_compras_ext_tarjetas_2023,
	total_num_trx_exterior_por_tarjeta_2023.total_num_trx_exterior_por_tarjeta AS total_num_trx_exterior_por_tarjeta_2023
	
FROM
	total_num_trx_exterior_por_tarjeta_2025
LEFT JOIN
	total_num_trx_exterior_por_tarjeta_2024
ON
	total_num_trx_exterior_por_tarjeta_2025.codigoentidad = total_num_trx_exterior_por_tarjeta_2024.codigoentidad
LEFT JOIN
	total_num_trx_exterior_por_tarjeta_2023
ON
	total_num_trx_exterior_por_tarjeta_2025.codigoentidad = total_num_trx_exterior_por_tarjeta_2023.codigoentidad


WITH total_num_trx_exterior_por_tarjeta_2025 AS (
SELECT
	num_trx_exterior_anual.tipoentidad AS tipoentidad,
	num_trx_exterior_anual.codigoentidad AS codigoentidad,
	num_trx_exterior_anual.nombreentidad AS nombreentidad,
	num_trx_exterior_anual.year AS year,
	num_total_tc_anual.total_tarjetas AS total_tarjetas_activas_anual,
	num_trx_exterior_anual.total_tarjetas AS total_num_anual_compras_ext_tarjetas,
	(num_trx_exterior_anual.total_tarjetas / num_total_tc_anual.total_tarjetas) AS total_num_trx_exterior_por_tarjeta
FROM
	vw_num_trx_por_compras_exterior_con_tarjetacredito_anual AS num_trx_exterior_anual
LEFT JOIN
	vw_num_total_tarjetas_credito_vigentes_ano AS num_total_tc_anual
ON
	num_trx_exterior_anual.nombreentidad = num_total_tc_anual.nombreentidad
WHERE
	num_trx_exterior_anual.year = 2025 AND num_total_tc_anual.year = 2025
ORDER BY
	total_tarjetas_activas_anual DESC, total_num_trx_exterior_por_tarjeta DESC
LIMIT
	10),

total_num_trx_exterior_por_tarjeta_2024 AS (
SELECT
	num_trx_exterior_anual.tipoentidad AS tipoentidad,
	num_trx_exterior_anual.codigoentidad AS codigoentidad,
	num_trx_exterior_anual.nombreentidad AS nombreentidad,
	num_trx_exterior_anual.year AS year,
	num_total_tc_anual.total_tarjetas AS total_tarjetas_activas_anual,
	num_trx_exterior_anual.total_tarjetas AS total_num_anual_compras_ext_tarjetas,
	(num_trx_exterior_anual.total_tarjetas / num_total_tc_anual.total_tarjetas) AS total_num_trx_exterior_por_tarjeta
FROM
	vw_num_trx_por_compras_exterior_con_tarjetacredito_anual AS num_trx_exterior_anual
LEFT JOIN
	vw_num_total_tarjetas_credito_vigentes_ano AS num_total_tc_anual
ON
	num_trx_exterior_anual.nombreentidad = num_total_tc_anual.nombreentidad
WHERE
	num_trx_exterior_anual.year = 2024 AND num_total_tc_anual.year = 2024
ORDER BY
	total_tarjetas_activas_anual DESC, total_num_trx_exterior_por_tarjeta DESC
LIMIT
	10),
total_num_trx_exterior_por_tarjeta_2023 AS (
SELECT
	num_trx_exterior_anual.tipoentidad AS tipoentidad,
	num_trx_exterior_anual.codigoentidad AS codigoentidad,
	num_trx_exterior_anual.nombreentidad AS nombreentidad,
	num_trx_exterior_anual.year AS year,
	num_total_tc_anual.total_tarjetas AS total_tarjetas_activas_anual,
	num_trx_exterior_anual.total_tarjetas AS total_num_anual_compras_ext_tarjetas,
	(num_trx_exterior_anual.total_tarjetas / num_total_tc_anual.total_tarjetas) AS total_num_trx_exterior_por_tarjeta
FROM
	vw_num_trx_por_compras_exterior_con_tarjetacredito_anual AS num_trx_exterior_anual
LEFT JOIN
	vw_num_total_tarjetas_credito_vigentes_ano AS num_total_tc_anual
ON
	num_trx_exterior_anual.nombreentidad = num_total_tc_anual.nombreentidad
WHERE
	num_trx_exterior_anual.year = 2023 AND num_total_tc_anual.year = 2023
ORDER BY
	total_tarjetas_activas_anual DESC, total_num_trx_exterior_por_tarjeta DESC
LIMIT
	10)


SELECT
	total_num_trx_exterior_por_tarjeta_2025.nombreentidad AS nombreentidad,
	total_num_trx_exterior_por_tarjeta_2025.tipoentidad AS tipoentidad,
	total_num_trx_exterior_por_tarjeta_2025.codigoentidad AS codigoentidad,
	total_num_trx_exterior_por_tarjeta_2025.year AS year_2025,
	total_num_trx_exterior_por_tarjeta_2025.total_tarjetas_activas_anual AS total_tarjetas_activas_anual_2025,
	total_num_trx_exterior_por_tarjeta_2025.total_num_anual_compras_ext_tarjetas AS total_num_anual_compras_ext_tarjetas_2025,
	total_num_trx_exterior_por_tarjeta_2025.total_num_trx_exterior_por_tarjeta AS total_num_trx_exterior_por_tarjeta_2025,
	total_num_trx_exterior_por_tarjeta_2024.year AS year_2024,
	total_num_trx_exterior_por_tarjeta_2024.total_tarjetas_activas_anual AS total_tarjetas_activas_anual_2024,
	total_num_trx_exterior_por_tarjeta_2024.total_num_anual_compras_ext_tarjetas AS total_num_anual_compras_ext_tarjetas_2024,
	total_num_trx_exterior_por_tarjeta_2024.total_num_trx_exterior_por_tarjeta AS total_num_trx_exterior_por_tarjeta_2024,
	total_num_trx_exterior_por_tarjeta_2023.year AS year_2023,
	total_num_trx_exterior_por_tarjeta_2023.total_tarjetas_activas_anual AS total_tarjetas_activas_anual_2023,
	total_num_trx_exterior_por_tarjeta_2023.total_num_anual_compras_ext_tarjetas AS total_num_anual_compras_ext_tarjetas_2023,
	total_num_trx_exterior_por_tarjeta_2023.total_num_trx_exterior_por_tarjeta AS total_num_trx_exterior_por_tarjeta_2023
	
FROM
	total_num_trx_exterior_por_tarjeta_2025
LEFT JOIN
	total_num_trx_exterior_por_tarjeta_2024
ON
	total_num_trx_exterior_por_tarjeta_2025.codigoentidad = total_num_trx_exterior_por_tarjeta_2024.codigoentidad
LEFT JOIN
	total_num_trx_exterior_por_tarjeta_2023
ON
	total_num_trx_exterior_por_tarjeta_2025.codigoentidad = total_num_trx_exterior_por_tarjeta_2023.codigoentidad


-- polish trx avances por tarjetas 2025 SELECT
	tarjetas_vigentes.tipoentidad,
	tarjetas_vigentes.codigoentidad,
	tarjetas_vigentes.nombreentidad,
	tarjetas_vigentes.year,
	tarjetas_vigentes.total_tarjetas AS total_tarjetas_credito_vigentes,
	trx_por_avances_tarjetas.total_tarjetas AS total_trx_por_tarjetas_credito_avances_nacionales,
	trx_por_avances_tarjetas.total_tarjetas/tarjetas_vigentes.total_tarjetas AS total_trx_avances_por_tarjeta_credito_vigente_2025
FROM
	vw_num_total_tarjetas_credito_vigentes_anual AS tarjetas_vigentes
LEFT JOIN
	vw_num_trx_por_avances_nacional_tarjcredito_anual AS trx_por_avances_tarjetas
ON
	tarjetas_vigentes.codigoentidad = trx_por_avances_tarjetas.codigoentidad
WHERE
	(tarjetas_vigentes.year 
	IN (2025) AND trx_por_avances_tarjetas.year IN (2025))
ORDER BY
	trx_por_avances_tarjetas.total_tarjetas DESC
LIMIT
	5


--- including cte #1

WITH trx_avances_por_tarjeta_credito_vigente_2025 AS (

SELECT
	ROUND(trx_por_avances_tarjetas.total_tarjetas/tarjetas_vigentes.total_tarjetas,1) AS total_trx_avances_por_tarjeta_credito_vigente_2025,
	tarjetas_vigentes.tipoentidad,
	tarjetas_vigentes.codigoentidad,
	tarjetas_vigentes.nombreentidad,
	tarjetas_vigentes.year,
	tarjetas_vigentes.total_tarjetas AS total_tarjetas_credito_vigentes,
	trx_por_avances_tarjetas.total_tarjetas AS total_trx_por_tarjetas_credito_avances_nacionales
FROM
	vw_num_total_tarjetas_credito_vigentes_anual AS tarjetas_vigentes
LEFT JOIN
	vw_num_trx_por_avances_nacional_tarjcredito_anual AS trx_por_avances_tarjetas
ON
	tarjetas_vigentes.codigoentidad = trx_por_avances_tarjetas.codigoentidad 
	AND
	tarjetas_vigentes.nombreentidad = trx_por_avances_tarjetas.nombreentidad
WHERE
	(tarjetas_vigentes.year 
	IN (2025) AND trx_por_avances_tarjetas.year IN (2025)))

SELECT 
	tipoentidad,
    codigoentidad,
    nombreentidad,
    year,
    total_tarjetas_credito_vigentes,
    total_trx_por_tarjetas_credito_avances_nacionales,
    total_trx_avances_por_tarjeta_credito_vigente_2025
FROM
	trx_avances_por_tarjeta_credito_vigente_2025
ORDER BY
	total_tarjetas_credito_vigentes DESC
LIMIT 
	5;


---- 

WITH vars AS (
    SELECT 
        2025 AS target_year_1,
        2024 AS target_year_2,
        2023 AS target_year_3,
        2022 AS target_year_4,
        2021 AS target_year_5
),
base AS (
    SELECT
        tv.tipoentidad,
        tv.codigoentidad,
        tv.nombreentidad,
        tv.year,
        tv.total_tarjetas AS total_tarjetas_credito_vigentes,
        trx.total_tarjetas AS total_trx_por_tarjetas_credito_avances_nacionales,
        ROUND(trx.total_tarjetas / tv.total_tarjetas, 1) AS total_trx_avances_por_tarjeta_credito_vigente,
        RANK() OVER (PARTITION BY tv.year ORDER BY tv.total_tarjetas DESC) AS rnk
    FROM vw_num_total_tarjetas_credito_vigentes_anual AS tv
    LEFT JOIN vw_num_trx_por_avances_nacional_tarjcredito_anual AS trx
        ON tv.codigoentidad = trx.codigoentidad
        AND tv.nombreentidad = trx.nombreentidad
        AND tv.year = trx.year  
    CROSS JOIN vars
    WHERE tv.year IN (vars.target_year_1, vars.target_year_2, vars.target_year_3, vars.target_year_4, vars.target_year_5)
)
SELECT
    tipoentidad,
    codigoentidad,
    nombreentidad,
    year,
    total_tarjetas_credito_vigentes,
    total_trx_por_tarjetas_credito_avances_nacionales,
    total_trx_avances_por_tarjeta_credito_vigente,
    rnk
FROM base
WHERE rnk <= 5
ORDER BY year DESC, rnk ASC;




-- Market Leaders in International Credit Card Purchases from Colombia

WITH vars AS (
    SELECT 
        2025 AS target_year_1,
        2024 AS target_year_2,
        2023 AS target_year_3,
        2022 AS target_year_4,
        2021 AS target_year_5
),
base AS (
    SELECT
        tv.tipoentidad,
        tv.codigoentidad,
        tv.nombreentidad,
        tv.year,
        tv.total_tarjetas AS total_tarjetas_credito_vigentes,
        trx_compras_ext.total_tarjetas AS total_trx_por_tarjetas_credito_compras_internacionales,
        ROUND(trx_compras_ext.total_tarjetas / tv.total_tarjetas, 1) AS total_trx_compras_internacionales_por_tarjeta_credito_vigente,
        RANK() OVER (PARTITION BY tv.year ORDER BY tv.total_tarjetas DESC) AS rnk
    FROM vw_num_total_tarjetas_credito_vigentes_anual AS tv
    LEFT JOIN vw_num_trx_por_compras_exterior_con_tarjetacredito_anual AS trx_compras_ext
        ON tv.codigoentidad = trx_compras_ext.codigoentidad
        AND tv.nombreentidad = trx_compras_ext.nombreentidad
        AND tv.year = trx_compras_ext.year  
    CROSS JOIN vars
    WHERE tv.year IN (vars.target_year_1, vars.target_year_2, vars.target_year_3, vars.target_year_4, vars.target_year_5)
)
SELECT
    tipoentidad,
    codigoentidad,
    nombreentidad,
    year,
    total_tarjetas_credito_vigentes,
    total_trx_por_tarjetas_credito_compras_internacionales,
    total_trx_compras_internacionales_por_tarjeta_credito_vigente,
    rnk
FROM base
WHERE rnk <= 5
ORDER BY year DESC, rnk ASC;