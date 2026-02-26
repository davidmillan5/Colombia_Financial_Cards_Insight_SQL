# Colombia Financial Cards Insight SQL




```sql
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

```



```sql
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
```




| descripcion | subcuenta |
|-------------|------------|
| Número de transacciones por compras a nivel nacional con tarjeta de crédito de entidades nacionales | 5 |
| Número total de tarjetas de crédito vigentes a la fecha de corte | 5 |
| Número total de tarjetas débito vigentes a la fecha de corte | 5 |
| Número de transacciones por avances a nivel nacional con tarjeta de crédito | 10 |
| Número total de tarjetas de crédito vigentes durante el mes | 10 |
| Número total de tarjetas débito vigentes durante el mes | 10 |
| Número de transacciones por compras en el exterior con tarjeta de crédito de entidades nacionales | 15 |
| Número total de tarjetas de crédito canceladas | 15 |
| Número total de tarjetas débito canceladas | 15 |
| Número de transacciones por avances en el exterior con tarjeta de crédito de entidades nacionales | 20 |
| Número total de tarjetas de créditos bloqueadas temporalmente | 20 |
| Número total de tarjetas débito bloqueadas temporalmente | 20 |
| Número de transacciones por compras a nivel nacional con tarjeta de crédito | 25 |
| Número de transacciones por compras a nivel nacional con tarjeta de crédito de entidades extranjeras | 25 |
| Número de transacciones por compras con tarjetas débito | 25 |
| Número de transacciones por avances a nivel nacional con tarjeta de crédito | 30 |
| Número de transacciones por avances a nivel nacional con tarjeta de crédito de entidades extranjeras | 30 |
| Número de transacciones por retiros con tarjetas débito | 30 |
| Monto de transacciones por compras a nivel nacional con tarjeta de crédito | 35 |
| Monto de transacciones por compras con tarjetas débito | 35 |
| Número de transacciones por compras en el exterior con tarjeta de crédito | 35 |
| Monto de transacciones por avances a nivel nacional con tarjeta de crédito | 40 |
| Monto de transacciones por retiros con tarjetas débito | 40 |
| Número de transacciones por avances en el exterior con tarjeta de crédito | 40 |
| Ingresos por Tarifa Interbancaria de Intercambio - TII por Tarjeta Débito Visa | 45 |
| Monto de las transacciones por compras con tarjeta de crédito a nivel nacional | 45 |
| Monto de transacciones por compras en el exterior con tarjeta de crédito | 45 |
| Ingresos por Tarifa Interbancaria de Intercambio - TII por Tarjeta Master Débito | 50 |
| Monto de transacciones por avances en el exterior con tarjeta de crédito | 50 |
| Monto de las transacciones por avances con tarjeta de crédito a nivel nacional | 50 |
| Ingresos por Tarifa Interbancaria de Intercambio - TII por Tarjeta Débito Electrón | 55 |
| Monto de las transacciones por compras en el exterior con tarjeta de crédito | 55 |
| Monto de transacciones por compras a nivel nacional con tarjeta de crédito de entidades extranjeras | 55 |
| Ingresos por Tarifa Interbancaria de Intercambio - TII por Tarjeta Débito Maestro | 60 |
| Monto de las transacciones por avances en el exterior con tarjeta de crédito | 60 |
| Monto de transacciones por avances a nivel nacional con tarjeta de crédito de entidades extranjeras | 60 |
| Gastos por Tarifa Interbancaria de Intercambio - TII por Tarjeta Débito Visa | 65 |
| Monto de los intereses corrientes por compras y avances con tarjeta de crédito | 65 |
| Número de transacciones por compras con tarjetas débito | 65 |
| Gastos por Tarifa Interbancaria de Intercambio - TII por Tarjeta Master Débito | 70 |
| Monto de los intereses de mora por compras y avances con tarjeta de crédito | 70 |
| Número de transacciones por retiros con tarjetas débito | 70 |
| Gastos por Tarifa Interbancaria de Intercambio - TII por Tarjeta Débito Electrón | 75 |
| Monto de los castigos de cartera por tarjeta de crédito, únicamente capital. | 75 |
| Número de transacciones por compras con tarjetas débito de entidades extranjeras | 75 |
| Gastos por Tarifa Interbancaria de Intercambio - TII por Tarjeta Débito Maestro | 80 |
| Monto de los castigos de cartera por tarjeta de crédito, conceptos diferentes a capital | 80 |
| Número de transacciones por retiros con tarjetas débito de entidades extranjeras | 80 |
| Ingresos Comisión de Adquirencia por Tarjeta Débito | 85 |
| Monto de transacciones por compras con tarjetas débito | 85 |
| Saldo de la cartera por tarjeta de crédito | 85 |
| Monto de transacciones por retiros con tarjetas débito | 90 |
| Total cupo de crédito no utilizado por todos los tarjetahabientes | 90 |
| INGRESOS POR TARIFA INTERBANCARIA DE INT | 95 |
| Monto de transacciones por compras con tarjetas débito de entidades extranjeras | 95 |
| GASTOS POR TARIFA INTER. | 100 |
| Gastos por Tarifa Interbancaria de Intercambio - TII por Tarjeta de Crédito | 100 |
| Monto de transacciones por retiros con tarjetas débito de entidades extranjeras | 100 |
| Ingresos Comisión de Adquirencia por Tarjeta de Crédito | 105 |
| Número de participantes | 105 |
| Número total de tarjetas de crédito que no tienen chip de seguridad vigentes a la fecha de corte | 110 |
| Número total de tarjetas débito que no tienen chip de seguridad vigentes a la fecha de corte | 110 |
| NUMERO TOTAL T. CON CHIP | 110 |
| Tarifa Interbancaria de Intercambio - TII por Tarjeta de Crédito | 110 |
| NUME TOTAL TA. TECNOLOGIA | 115 |
| Número total de tarjetas de crédito que cuentan con la tecnología contactless vigentes a la fecha de corte | 115 |
| Número total de tarjetas débito que cuentan con la tecnología contactless vigentes a la fecha de corte | 115 |
| Tarifa Interbancaria de Intercambio - TII por Tarjeta Débito Visa | 115 |
| Tarifa Interbancaria de Intercambio - TII por Tarjeta Master Débito | 120 |
| Tarifa Interbancaria de Intercambio - TII por Tarjeta Débito Electrón | 125 |
| Tarifa Interbancaria de Intercambio - TII por Tarjeta Débito Maestro | 130 |




| nombreentidad |
|---------------|
| A TODA HORA S.A. |
| ASSENDA RED S.A. |
| BANCAR TECNOLOGÍA CO S.A. COMPAÑÍA DE FINANCIAMIENTO |
| BANCO AGRARIO DE COLOMBIA S.A. |
| BANCO BILBAO VIZCAYA ARGENTARIA COLOMBIA S.A. BBVA COLOMBIA |
| BANCO CAJA SOCIAL S.A. |
| BANCO COMERCIAL AV VILLAS S.A. |
| BANCO COOMEVA S.A. |
| BANCO COOPERATIVO COOPCENTRAL S.A. |
| BANCO DAVIVIENDA S.A. |
| BANCO DE BOGOTA S. A. |
| BANCO DE LAS MICROFINANZAS BANCAMIA S.A. |
| BANCO DE OCCIDENTE S.A. |
| BANCO FALABELLA S.A. |
| BANCO FINANDINA S.A. |
| BANCO GNB SUDAMERIS S.A. |
| BANCO MULTIBANK S.A. |
| BANCO MUNDO MUJER S.A. |
| BANCO PICHINCHA S.A. |
| BANCO POPULAR S.A. |
| BANCO PROCREDIT COLOMBIA S.A. |
| BANCO SANTANDER DE NEGOCIOS COLOMBIA S.A. |
| BANCO SERFINANZA S.A. |
| BANCO UNIÓN S.A. |
| BANCO W S.A. |
| BANCOLOMBIA S.A. |
| BOLD C.F., BOLD CF S.A., O BOLD. CF |
| CITIBANK - COLOMBIA S.A. |
| COLTEFINANCIERA S.A C.F |
| CONFIAR COOPERATIVA FINANCIERA |
| COOFINEP COOPERATIVA FINANCIERA |
| COOPERATIVA FINANCIERA DE ANTIOQUIA CFA |
| COTRAFA FINANCIERA |
| CREDIBANCO S.A. PUDIENDO SIN PERDER SU NATURALEZA UTILIZAR LA SIGLA CREDIBANCO |
| FINAMÉRICA S.A C.F. |
| FINANCIERA DANN REGIONAL S.A C.F |
| FINANCIERA JURISCOOP C.F. |
| GIROS & FINANZAS S.A C.F |
| INTERNACIONAL S.A. C.F |
| ITAU CORPBANCA COLOMBIA S.A. |
| JFK COOPERATIVA FINANCIERA |
| LULO BANK |
| MACROFINANCIERA S.A. C.F |
| MASTERCARD COLOMBIA ADMINISTRADORA S.A. |
| MIBANCO S.A. |
| NU O NU FINANCIERA |
| RAPPIPAY |
| REDEBAN S.A. |
| RIPLEY COMPAÑÍA DE FINANCIAMIENTO S.A. |
| SCOTIABANK COLPATRIA S.A. |
| SERFINANSA S.A C.F |
| SOCIEDAD AL SERVICIO DE LA TECNOLOGÍA Y SISTEMATIZACIÓN BANCARIA TECNIBANCA S.A. |
| TUYA S.A C.F |
| VISA COLOMBIA SUPPORT SERVICES SOCIEDAD ANONIMA |
| VISIONAMOS SISTEMA DE PAGO COOPERATIVO |



# Colombia Financial Cards Insight


The information corresponds to the number of active credit and debit 
cards as of the reporting date, active during the month, canceled and 
blocked, the outstanding loan portfolio balance from purchases and cash 
advances by card network, and the purchases and withdrawals made with debit 
cards at credit institutions.

| Column Name      | API Field Name   | Data Type        | Description |
|------------------|------------------|------------------|-------------|
| TIPOENTIDAD      | tipoentidad      | int              | Numeric code identifying the institutional classification of the reporting entity. Examples include: 01 = Banking institutions supervised by the Superintendencia Financiera de Colombia (SFC); 32 = Financial cooperatives under SFC supervision; 04 = Multi-activity cooperatives without savings and credit section (statistical classification used in solidarity economy datasets, not direct SFC supervision); 118 = Payment networks and electronic payment infrastructure operators (e.g., Credibanco, ACH Colombia, ATH, Redeban). |
| CODIGOENTIDAD    | codigoentidad    | int              | Unique identification code assigned to each reporting entity within regulatory or statistical reporting systems. Used to distinguish financial institutions, cooperatives, or payment operators. |
| NOMBREENTIDAD    | nombreentidad    | str              | Official name of the reporting entity (e.g., bank, cooperative, or payment network). |
| FECHACORTE       | fechacorte       | datetime64[ns]   | Reporting cutoff date for the financial data. Indicates the reference period for card balances, active cards, cancellations, and transaction activity. |
| COD_UCA          | cod_uca          | int              | Code corresponding to the reporting unit or accounting classification structure used for regulatory submissions. Organizes financial metrics within standardized reporting frameworks. |
| NOMBRE_UCA       | nombre_uca       | str              | Name of the reporting or accounting category associated with the UCA code. Provides higher-level grouping of financial metrics. |
| SUBCUENTA        | subcuenta        | int              | Specific sub-account code identifying the financial metric reported (e.g., active cards, cards active during the month, canceled cards, blocked cards, portfolio balance from purchases, cash advances). |
| DESCRIPCION      | descripcion      | str              | Text description explaining the metric represented by the sub-account, including operational definitions such as number of active cards, balance of credit portfolio, or transaction volume. |
| PERSONA_NATURAL  | persona_natural  | int              | Reported value (number of cards or monetary balance) corresponding to individual customers (natural persons). |
| PERSONA_JURIDICA | persona_juridica | int              | Reported value (number of cards or monetary balance) corresponding to corporate customers (legal entities). |
| TOTAL_TARJETAS   | total_tarjetas   | int              | Aggregate total of the metric reported, typically representing the sum of natural and legal persons where applicable. |

- [Information Source](https://www.datos.gov.co/Econom-a-y-Finanzas/Tarjetas-de-cr-dito-y-d-bito/h2jg-r3zg/about_data)

| cod_uca | nombre_uca |
|---------|------------|
| 1 | CREDIBANCO-VISA |
| 2 | MASTERCARD |
| 3 | DINERS |
| 4 | AMERICAN EXPRESS |
| 5 | OTRAS TARJETAS DE CREDITO |
| 6 | TARJETA DEBITO |
| 7 | ADMINISTRADORAS DE SISTEMAS DE PAGO DE BAJO VALOR |
| 8 | CREDIBANCO SOCIA |


```sql
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
	descripcion

```


| nombreentidad | codigoentidad | tipoentidad |
|---------------|--------------|-------------|
| BANCO DE BOGOTA S. A. | 1 | 1 |
| COOPERATIVA FINANCIERA DE ANTIOQUIA CFA | 1 | 32 |
| CREDIBANCO S.A. PUDIENDO SIN PERDER SU NATURALEZA UTILIZAR LA SIGLA CREDIBANCO | 1 | 118 |
| BANCO POPULAR S.A. | 2 | 1 |
| JFK COOPERATIVA FINANCIERA | 2 | 32 |
| COOFINEP COOPERATIVA FINANCIERA | 3 | 32 |
| SOCIEDAD AL SERVICIO DE LA TECNOLOGÍA Y SISTEMATIZACIÓN BANCARIA TECNIBANCA S.A. | 3 | 118 |
| COTRAFA FINANCIERA | 4 | 32 |
| A TODA HORA S.A. | 4 | 118 |
| FINAMÉRICA S.A C.F. | 5 | 4 |
| CONFIAR COOPERATIVA FINANCIERA | 5 | 32 |
| REDEBAN S.A. | 5 | 118 |
| ITAU CORPBANCA COLOMBIA S.A. | 6 | 1 |
| VISIONAMOS SISTEMA DE PAGO COOPERATIVO | 6 | 118 |
| BANCOLOMBIA S.A. | 7 | 1 |
| ASSENDA RED S.A. | 7 | 118 |
| GIROS & FINANZAS S.A C.F | 8 | 4 |
| VISA COLOMBIA SUPPORT SERVICES SOCIEDAD ANONIMA | 8 | 118 |
| CITIBANK - COLOMBIA S.A. | 9 | 1 |
| MASTERCARD COLOMBIA ADMINISTRADORA S.A. | 9 | 118 |
| BANCO GNB SUDAMERIS S.A. | 12 | 1 |
| BANCO BILBAO VIZCAYA ARGENTARIA COLOMBIA S.A. BBVA COLOMBIA | 13 | 1 |
| BANCO DE OCCIDENTE S.A. | 23 | 1 |
| SERFINANSA S.A C.F | 23 | 4 |
| TUYA S.A C.F | 26 | 4 |
| BANCO CAJA SOCIAL S.A. | 30 | 1 |
| INTERNACIONAL S.A. C.F | 33 | 4 |
| MACROFINANCIERA S.A. C.F | 35 | 4 |
| BANCO DAVIVIENDA S.A. | 39 | 1 |
| SCOTIABANK COLPATRIA S.A. | 42 | 1 |
| BANCO AGRARIO DE COLOMBIA S.A. | 43 | 1 |
| COLTEFINANCIERA S.A C.F | 46 | 4 |
| BANCO COMERCIAL AV VILLAS S.A. | 49 | 1 |
| BANCO PROCREDIT COLOMBIA S.A. | 51 | 1 |
| BANCO DE LAS MICROFINANZAS BANCAMIA S.A. | 52 | 1 |
| BANCO W S.A. | 53 | 1 |
| BANCO COOMEVA S.A. | 54 | 1 |
| BANCO FINANDINA S.A. | 55 | 1 |
| BANCO FALABELLA S.A. | 56 | 1 |
| BANCO PICHINCHA S.A. | 57 | 1 |
| BANCO COOPERATIVO COOPCENTRAL S.A. | 58 | 1 |
| BANCO SANTANDER DE NEGOCIOS COLOMBIA S.A. | 59 | 1 |
| BANCO MUNDO MUJER S.A. | 60 | 1 |
| BANCO MULTIBANK S.A. | 61 | 1 |
| MIBANCO S.A. | 62 | 1 |
| BANCO SERFINANZA S.A. | 63 | 1 |
| LULO BANK | 65 | 1 |
| BANCO UNIÓN S.A. | 67 | 1 |
| FINANCIERA DANN REGIONAL S.A C.F | 108 | 4 |
| RIPLEY COMPAÑÍA DE FINANCIAMIENTO S.A. | 119 | 4 |
| FINANCIERA JURISCOOP C.F. | 121 | 4 |
| BANCAR TECNOLOGÍA CO S.A. COMPAÑÍA DE FINANCIAMIENTO | 123 | 4 |
| RAPPIPAY | 124 | 4 |
| BOLD C.F., BOLD CF S.A., O BOLD. CF | 127 | 4 |
| NU O NU FINANCIERA | 128 | 4 |



```sql
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
	descripcion
```


```sql

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
 	bancolombia

```



```sql

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
cod_uca IN (1,2,4)

```



```sql

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
```