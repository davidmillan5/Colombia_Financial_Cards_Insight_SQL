# Colombia Financial Cards Insight

## Summary
The information corresponds to the number of active credit and debit 
cards as of the reporting date, active during the month, canceled and 
blocked, the outstanding loan portfolio balance from purchases and cash 
advances by card network, and the purchases and withdrawals made with debit 
cards at credit institutions.


## Tools

In this project I will use SQL to response relevant questions around the dataset that will give you an important insight into the evolution of different important accounts related to the debit and credit card universe in Colombia financial sector.

- Used relational database
  - [PostgreSQL](https://www.postgresql.org/)


![Debit & Credit Cards in Colombia](https://imgs.search.brave.com/2arTFg-iQNavLBAVFX0_ukwFwIC5mJMCLIdzKbp7nrc/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9pbWFn/ZW5lcy5wb3J0YWZv/bGlvLmNvL2ZpbGVz/L2ltYWdlXzEyMDBf/NjAwL3VwbG9hZHMv/MjAyMy8wNy8zMS82/NGM4MjRkODRlNDZj/LmpwZWc)


Here is a data description of the columns you may find helpful.

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


## Column Specifications

### Tipo Entidad

| TIPOENTIDAD | Classification Name | Description |
|-------------|--------------------|-------------|
| 1 | Banking Institutions | Institutions supervised by the Superintendencia Financiera de Colombia (SFC). |
| 4 | Multi-activity Cooperatives (No Savings & Credit Section) | Statistical classification used in solidarity economy datasets. Not directly supervised by the SFC. |
| 32 | Financial Cooperatives | Financial cooperatives under supervision of the Superintendencia Financiera de Colombia (SFC). |
| 118 | Payment Networks & Electronic Payment Infrastructure Operators | Entities operating payment networks and electronic payment systems (e.g., Credibanco, ACH Colombia, ATH, Redeban). |


### Entidades Financieras y Operadores de Pago

| CODIGOENTIDAD | NOMBREENTIDAD | Description |
|---------------|---------------|--------------------|
| 1 | CREDIBANCO S.A. (CREDIBANCO) | Red de pagos y procesamiento electrónico de transacciones en Colombia. |
| 1 | COOPERATIVA FINANCIERA DE ANTIOQUIA CFA | Cooperativa financiera supervisada, ofrece productos de ahorro y crédito. |
| 1 | BANCO DE BOGOTA S. A. | Banco comercial tradicional del sistema financiero colombiano. |
| 2 | BANCO POPULAR S.A. | Banco comercial enfocado en banca empresarial y pública. |
| 2 | JFK COOPERATIVA FINANCIERA | Cooperativa financiera supervisada por la SFC. |
| 3 | TECNIBANCA S.A. | Empresa de tecnología y sistematización bancaria. |
| 3 | COOFINEP COOPERATIVA FINANCIERA | Cooperativa financiera supervisada. |
| 4 | COTRAFA FINANCIERA | Cooperativa financiera colombiana. |
| 4 | A TODA HORA S.A. | Operador de red de cajeros automáticos (ATH). |
| 5 | REDEBAN S.A. | Red de procesamiento de pagos electrónicos en Colombia. |
| 5 | CONFIAR COOPERATIVA FINANCIERA | Cooperativa financiera colombiana. |
| 5 | FINAMÉRICA S.A C.F. | Compañía de financiamiento. |
| 6 | ITAU CORPBANCA COLOMBIA S.A. | Banco comercial internacional con operación en Colombia. |
| 6 | VISIONAMOS SISTEMA DE PAGO COOPERATIVO | Red de pagos del sector cooperativo. |
| 7 | ASSENDA RED S.A. | Red de servicios y corresponsalía bancaria. |
| 7 | BANCOLOMBIA S.A. | Uno de los principales bancos comerciales de Colombia. |
| 8 | VISA COLOMBIA SUPPORT SERVICES S.A. | Servicios de soporte para red internacional de pagos Visa. |
| 8 | GIROS & FINANZAS S.A C.F | Compañía de financiamiento enfocada en consumo. |
| 9 | CITIBANK - COLOMBIA S.A. | Banco internacional con operación en Colombia. |
| 9 | MASTERCARD COLOMBIA ADMINISTRADORA S.A. | Administrador de red internacional de pagos Mastercard. |
| 12 | BANCO GNB SUDAMERIS S.A. | Banco comercial colombiano. |
| 13 | BBVA COLOMBIA S.A. | Banco comercial perteneciente al grupo BBVA. |
| 23 | SERFINANSA S.A C.F | Compañía de financiamiento. |
| 23 | BANCO DE OCCIDENTE S.A. | Banco comercial colombiano. |
| 26 | TUYA S.A C.F | Compañía de financiamiento enfocada en consumo. |
| 30 | BANCO CAJA SOCIAL S.A. | Banco comercial con enfoque social. |
| 33 | INTERNACIONAL S.A. C.F | Compañía de financiamiento. |
| 35 | MACROFINANCIERA S.A. C.F | Compañía de financiamiento. |
| 39 | BANCO DAVIVIENDA S.A. | Banco comercial colombiano. |
| 42 | SCOTIABANK COLPATRIA S.A. | Banco comercial con participación internacional. |
| 43 | BANCO AGRARIO DE COLOMBIA S.A. | Banco estatal enfocado en el sector rural. |
| 46 | COLTEFINANCIERA S.A C.F | Compañía de financiamiento. |
| 49 | BANCO AV VILLAS S.A. | Banco comercial colombiano. |
| 51 | BANCO PROCREDIT COLOMBIA S.A. | Banco enfocado en pymes. |
| 52 | BANCAMIA S.A. | Banco especializado en microfinanzas. |
| 53 | BANCO W S.A. | Banco enfocado en microcrédito. |
| 54 | BANCO COOMEVA S.A. | Banco del sector cooperativo. |
| 55 | BANCO FINANDINA S.A. | Banco comercial colombiano. |
| 56 | BANCO FALABELLA S.A. | Banco enfocado en consumo y retail financiero. |
| 57 | BANCO PICHINCHA S.A. | Banco internacional con operación en Colombia. |
| 58 | BANCO COOPERATIVO COOPCENTRAL S.A. | Banco cooperativo colombiano. |
| 59 | BANCO SANTANDER DE NEGOCIOS COLOMBIA S.A. | Banco corporativo internacional. |
| 60 | BANCO MUNDO MUJER S.A. | Banco especializado en microfinanzas. |
| 61 | BANCO MULTIBANK S.A. | Banco comercial internacional. |
| 62 | MIBANCO S.A. | Banco especializado en microfinanzas. |
| 63 | BANCO SERFINANZA S.A. | Banco comercial colombiano. |
| 65 | LULO BANK | Banco digital colombiano. |
| 67 | BANCO UNIÓN S.A. | Banco comercial colombiano. |
| 108 | FINANCIERA DANN REGIONAL S.A C.F | Compañía de financiamiento. |
| 119 | RIPLEY COMPAÑÍA DE FINANCIAMIENTO S.A. | Compañía de financiamiento vinculada al retail. |
| 121 | FINANCIERA JURISCOOP C.F. | Compañía de financiamiento del sector solidario. |
| 123 | BANCAR TECNOLOGÍA CO S.A. C.F | Compañía de financiamiento tecnológica. |
| 124 | RAPPIPAY | Entidad financiera digital vinculada a Rappi. |
| 127 | BOLD CF S.A. | Compañía de financiamiento enfocada en pagos digitales. |
| 128 | NU FINANCIERA | Entidad financiera digital (Nubank Colombia). |


### Unidades de Clasificación Contable (UCA)

| COD_UCA | NOMBRE_UCA | Description |
|----------|-------------|-------------|
| 1 | CREDIBANCO-VISA | Category associated with transactions processed through the Credibanco network under the Visa franchise. |
| 2 | MASTERCARD | Category corresponding to transactions carried out under the Mastercard franchise. |
| 3 | DINERS | Classification for transactions made using Diners Club cards. |
| 4 | AMERICAN EXPRESS | Category for transactions processed under the American Express franchise. |
| 5 | OTRAS TARJETAS DE CREDITO | Groups other credit card franchises not individually classified. |
| 6 | TARJETA DEBITO | Classification corresponding to debit card transactions. |
| 7 | ADMINISTRADORAS DE SISTEMAS DE PAGO DE BAJO VALOR | Category for entities that administer low-value payment systems within the financial system. |
| 8 | CREDIBANCO SOCIA | Category associated with a specific segment or program identified as Credibanco Socia. |


### Subcuentas - Métricas de Tarjetas

| SUBCUENTA | DESCRIPCION |
|------------|-------------|
| 5 | Número de transacciones por compras a nivel nacional con tarjeta de crédito de entidades nacionales |
| 5 | Número total de tarjetas de crédito vigentes a la fecha de corte |
| 5 | Número total de tarjetas débito vigentes a la fecha de corte |
| 10 | Número de transacciones por avances a nivel nacional con tarjeta de crédito |
| 10 | Número total de tarjetas de crédito vigentes durante el mes |
| 10 | Número total de tarjetas débito vigentes durante el mes |
| 15 | Número de transacciones por compras en el exterior con tarjeta de crédito de entidades nacionales |
| 15 | Número total de tarjetas de crédito canceladas |
| 15 | Número total de tarjetas débito canceladas |
| 20 | Número de transacciones por avances en el exterior con tarjeta de crédito de entidades nacionales |
| 20 | Número total de tarjetas de créditos bloqueadas temporalmente |
| 20 | Número total de tarjetas débito bloqueadas temporalmente |
| 25 | Número de transacciones por compras a nivel nacional con tarjeta de crédito |
| 25 | Número de transacciones por compras a nivel nacional con tarjeta de crédito de entidades extranjeras |
| 25 | Número de transacciones por compras con tarjetas débito |
| 30 | Número de transacciones por avances a nivel nacional con tarjeta de crédito |
| 30 | Número de transacciones por avances a nivel nacional con tarjeta de crédito de entidades extranjeras |
| 30 | Número de transacciones por retiros con tarjetas débito |
| 35 | Monto de transacciones por compras a nivel nacional con tarjeta de crédito |
| 35 | Monto de transacciones por compras con tarjetas débito |
| 35 | Número de transacciones por compras en el exterior con tarjeta de crédito |
| 40 | Monto de transacciones por avances a nivel nacional con tarjeta de crédito |
| 40 | Monto de transacciones por retiros con tarjetas débito |
| 40 | Número de transacciones por avances en el exterior con tarjeta de crédito |
| 45 | Ingresos por Tarifa Interbancaria de Intercambio - TII por Tarjeta Débito Visa |
| 45 | Monto de las transacciones por compras con tarjeta de crédito a nivel nacional |
| 45 | Monto de transacciones por compras en el exterior con tarjeta de crédito |
| 50 | Ingresos por Tarifa Interbancaria de Intercambio - TII por Tarjeta Master Débito |
| 50 | Monto de transacciones por avances en el exterior con tarjeta de crédito |
| 50 | Monto de las transacciones por avances con tarjeta de crédito a nivel nacional |
| 55 | Ingresos por Tarifa Interbancaria de Intercambio - TII por Tarjeta Débito Electrón |
| 55 | Monto de las transacciones por compras en el exterior con tarjeta de crédito |
| 55 | Monto de transacciones por compras a nivel nacional con tarjeta de crédito de entidades extranjeras |
| 60 | Ingresos por Tarifa Interbancaria de Intercambio - TII por Tarjeta Débito Maestro |
| 60 | Monto de las transacciones por avances en el exterior con tarjeta de crédito |
| 60 | Monto de transacciones por avances a nivel nacional con tarjeta de crédito de entidades extranjeras |
| 65 | Gastos por Tarifa Interbancaria de Intercambio - TII por Tarjeta Débito Visa |
| 65 | Monto de los intereses corrientes por compras y avances con tarjeta de crédito |
| 65 | Número de transacciones por compras con tarjetas débito |
| 70 | Gastos por Tarifa Interbancaria de Intercambio - TII por Tarjeta Master Débito |
| 70 | Monto de los intereses de mora por compras y avances con tarjeta de crédito |
| 70 | Número de transacciones por retiros con tarjetas débito |
| 75 | Gastos por Tarifa Interbancaria de Intercambio - TII por Tarjeta Débito Electrón |
| 75 | Monto de los castigos de cartera por tarjeta de crédito, únicamente capital |
| 75 | Número de transacciones por compras con tarjetas débito de entidades extranjeras |
| 80 | Gastos por Tarifa Interbancaria de Intercambio - TII por Tarjeta Débito Maestro |
| 80 | Monto de los castigos de cartera por tarjeta de crédito, conceptos diferentes a capital |
| 80 | Número de transacciones por retiros con tarjetas débito de entidades extranjeras |
| 85 | Ingresos Comisión de Adquirencia por Tarjeta Débito |
| 85 | Monto de transacciones por compras con tarjetas débito |
| 85 | Saldo de la cartera por tarjeta de crédito |
| 90 | Monto de transacciones por retiros con tarjetas débito |
| 90 | Total cupo de crédito no utilizado por todos los tarjetahabientes |
| 95 | INGRESOS POR TARIFA INTERBANCARIA DE INT |
| 95 | Monto de transacciones por compras con tarjetas débito de entidades extranjeras |
| 100 | GASTOS POR TARIFA INTER |
| 100 | Gastos por Tarifa Interbancaria de Intercambio - TII por Tarjeta de Crédito |
| 100 | Monto de transacciones por retiros con tarjetas débito de entidades extranjeras |
| 105 | Ingresos Comisión de Adquirencia por Tarjeta de Crédito |
| 105 | Número de participantes |
| 110 | Número total de tarjetas de crédito que no tienen chip de seguridad vigentes a la fecha de corte |
| 110 | Número total de tarjetas débito que no tienen chip de seguridad vigentes a la fecha de corte |
| 110 | NUMERO TOTAL T. CON CHIP |
| 110 | Tarifa Interbancaria de Intercambio - TII por Tarjeta de Crédito |
| 115 | NUME TOTAL TA. TECNOLOGIA |
| 115 | Número total de tarjetas de crédito que cuentan con la tecnología contactless vigentes a la fecha de corte |
| 115 | Número total de tarjetas débito que cuentan con la tecnología contactless vigentes a la fecha de corte |
| 115 | Tarifa Interbancaria de Intercambio - TII por Tarjeta Débito Visa |
| 120 | Tarifa Interbancaria de Intercambio - TII por Tarjeta Master Débito |
| 125 | Tarifa Interbancaria de Intercambio - TII por Tarjeta Débito Electrón |
| 130 | Tarifa Interbancaria de Intercambio - TII por Tarjeta Débito Maestro |


## Analysis 


### Ranking top 5 financial entity from 2025 to 2021 by year on the amount of trx for advances with credit cards.


| tipoentidad | codigoentidad | nombreentidad | year | total_tarjetas_credito_vigentes | total_trx_por_tarjetas_credito_avances_nacionales | total_trx_avances_por_tarjeta_credito_vigente | rnk |
|---|---|---|---|---|---|---|---|
| 1 | 7 | BANCOLOMBIA S.A. | 2025 | 935,540.00 | 8,412,194.00 | 9.0 | 1 |
| 4 | 128 | NU O NU FINANCIERA | 2025 | 462,628.00 | 2,786,100.00 | 6.0 | 2 |
| 1 | 13 | BANCO BILBAO VIZCAYA ARGENTARIA COLOMBIA S.A. BBVA COLOMBIA | 2025 | 361,480.00 | 3,805,106.00 | 10.5 | 3 |
| 1 | 39 | BANCO DAVIVIENDA S.A. | 2025 | 352,616.00 | 3,445,578.00 | 9.8 | 4 |
| 1 | 56 | BANCO FALABELLA S.A. | 2025 | 236,564.00 | 1,049,806.00 | 4.4 | 5 |
| 1 | 7 | BANCOLOMBIA S.A. | 2024 | 579,581.00 | 8,160,599.00 | 14.1 | 1 |
| 1 | 42 | SCOTIABANK COLPATRIA S.A. | 2024 | 270,486.00 | 665,903.00 | 2.5 | 2 |
| 1 | 39 | BANCO DAVIVIENDA S.A. | 2024 | 264,387.00 | 3,614,267.00 | 13.7 | 3 |
| 1 | 1 | BANCO DE BOGOTA S. A. | 2024 | 215,596.00 | 2,119,765.00 | 9.8 | 4 |
| 1 | 13 | BANCO BILBAO VIZCAYA ARGENTARIA COLOMBIA S.A. BBVA COLOMBIA | 2024 | 172,452.00 | 3,240,454.00 | 18.8 | 5 |
| 1 | 7 | BANCOLOMBIA S.A. | 2023 | 582,907.00 | 10,075,509.00 | 17.3 | 1 |
| 1 | 1 | BANCO DE BOGOTA S. A. | 2023 | 531,773.00 | 2,543,933.00 | 4.8 | 2 |
| 4 | 26 | TUYA S.A C.F | 2023 | 418,185.00 | 2,689,464.00 | 6.4 | 3 |
| 1 | 39 | BANCO DAVIVIENDA S.A. | 2023 | 362,840.00 | 3,779,386.00 | 10.4 | 4 |
| 1 | 42 | SCOTIABANK COLPATRIA S.A. | 2023 | 318,760.00 | 756,271.00 | 2.4 | 5 |
| 1 | 7 | BANCOLOMBIA S.A. | 2022 | 1,076,452.00 | 9,881,397.00 | 9.2 | 1 |
| 4 | 26 | TUYA S.A C.F | 2022 | 673,154.00 | 4,538,134.00 | 6.7 | 2 |
| 1 | 1 | BANCO DE BOGOTA S. A. | 2022 | 574,421.00 | 2,367,329.00 | 4.1 | 3 |
| 1 | 56 | BANCO FALABELLA S.A. | 2022 | 525,407.00 | 1,699,712.00 | 3.2 | 4 |
| 1 | 39 | BANCO DAVIVIENDA S.A. | 2022 | 507,572.00 | 3,156,823.00 | 6.2 | 5 |
| 1 | 7 | BANCOLOMBIA S.A. | 2021 | 791,123.00 | 7,029,845.00 | 8.9 | 1 |
| 1 | 56 | BANCO FALABELLA S.A. | 2021 | 544,857.00 | 873,766.00 | 1.6 | 2 |
| 4 | 26 | TUYA S.A C.F | 2021 | 530,319.00 | 3,426,152.00 | 6.5 | 3 |
| 1 | 1 | BANCO DE BOGOTA S. A. | 2021 | 406,473.00 | 1,841,348.00 | 4.5 | 4 |
| 1 | 42 | SCOTIABANK COLPATRIA S.A. | 2021 | 362,461.00 | 901,627.00 | 2.5 | 5 |

From the information that we gather and analyze I have the following 5 insights:

1. The amount of trx of credit card avances in 2025(until October) are at levels of 2021 which is important to see ho the 2025 ends and if it is a trend towards a lesser need of using cash money.
2. From 2021 until 2024 the trend based on the ranking and based on the leader Bancolombia show that the avergae customer make more than one advance with their credit card each month which can be study further and find out if their is a need for advancing the biweekly payment from employees and create products such as MyPay by Chime which allows access to a portion of the earned wages from customers before their regular payday, and establish a product or services with those characteristics to help employees manage their own financial needs and goals.
3. There is an important demand for credit cards in the financial market in Colombia, as NU shows. As October 2025 these Fintech ranks number two in overall active credict card nationwide which means that the consumner is demanding this kind of products and also that new players can challenge the well establish banks and win a broad share of the market.
4. For the market Leader Bancolombia we see that after 2021 the year after COVID-19 the valid amount of credit cards in the market have been growing comming from 791123 valid credit cards by december 2021 to 935540 valids credit cards to October 2025 which represent a growth of 18.25%. 
5. Banco Falabella and Tuya from 2021 to 2025 have been in the ranking of top 5 valid credit cards 3 out 5 years which means that the retailer players are ghuges players in the country and their related offer of credit attach to a credit card represent a great hook to gain clients in the country.


### Market Leaders in International Credit Card Purchases from Colombia

| tipoentidad | codigoentidad | nombreentidad                                                         | year | num_trx     | total_tarjetas | ratio | ranking |
|------------|--------------|-----------------------------------------------------------------------|------|------------|---------------|-------|---------|
| 1 | 7   | BANCOLOMBIA S.A. | 2025 | 935540.00 | 26634592.00 | 28.5 | 1 |
| 4 | 128 | NU O NU FINANCIERA | 2025 | 462628.00 | 8299546.00 | 17.9 | 2 |
| 1 | 13  | BANCO BILBAO VIZCAYA ARGENTARIA COLOMBIA S.A. BBVA COLOMBIA | 2025 | 361480.00 | 4032326.00 | 11.2 | 3 |
| 1 | 39  | BANCO DAVIVIENDA S.A. | 2025 | 352616.00 | 14622137.00 | 41.5 | 4 |
| 1 | 56  | BANCO FALABELLA S.A. | 2025 | 236564.00 | 4256396.00 | 18.0 | 5 |
| 1 | 7   | BANCOLOMBIA S.A. | 2024 | 579581.00 | 25716346.00 | 44.4 | 1 |
| 1 | 42  | SCOTIABANK COLPATRIA S.A. | 2024 | 270486.00 | 6107517.00 | 22.6 | 2 |
| 1 | 39  | BANCO DAVIVIENDA S.A. | 2024 | 264387.00 | 14298839.00 | 54.1 | 3 |
| 1 | 1   | BANCO DE BOGOTA S. A. | 2024 | 215596.00 | 4728973.00 | 21.9 | 4 |
| 1 | 13  | BANCO BILBAO VIZCAYA ARGENTARIA COLOMBIA S.A. BBVA COLOMBIA | 2024 | 172452.00 | 3975856.00 | 23.1 | 5 |
| 1 | 7   | BANCOLOMBIA S.A. | 2023 | 582907.00 | 22712124.00 | 39.0 | 1 |
| 1 | 1   | BANCO DE BOGOTA S. A. | 2023 | 531773.00 | 4100471.00 | 7.7 | 2 |
| 4 | 26  | TUYA S.A C.F | 2023 | 418185.00 | 1176061.00 | 2.8 | 3 |
| 1 | 39  | BANCO DAVIVIENDA S.A. | 2023 | 362840.00 | 11263672.00 | 31.0 | 4 |
| 1 | 42  | SCOTIABANK COLPATRIA S.A. | 2023 | 318760.00 | 5538035.00 | 17.4 | 5 |
| 1 | 7   | BANCOLOMBIA S.A. | 2022 | 1076452.00 | 23437015.00 | 21.8 | 1 |
| 4 | 26  | TUYA S.A C.F | 2022 | 673154.00 | 1296427.00 | 1.9 | 2 |
| 1 | 1   | BANCO DE BOGOTA S. A. | 2022 | 574421.00 | 4310674.00 | 7.5 | 3 |
| 1 | 56  | BANCO FALABELLA S.A. | 2022 | 525407.00 | 4139471.00 | 7.9 | 4 |
| 1 | 39  | BANCO DAVIVIENDA S.A. | 2022 | 507572.00 | 10831991.00 | 21.3 | 5 |
| 1 | 7   | BANCOLOMBIA S.A. | 2021 | 791123.00 | 20168799.00 | 25.5 | 1 |
| 1 | 56  | BANCO FALABELLA S.A. | 2021 | 544857.00 | 3088535.00 | 5.7 | 2 |
| 4 | 26  | TUYA S.A C.F | 2021 | 530319.00 | 896582.00 | 1.7 | 3 |
| 1 | 1   | BANCO DE BOGOTA S. A. | 2021 | 406473.00 | 3851686.00 | 9.5 | 4 |
| 1 | 42  | SCOTIABANK COLPATRIA S.A. | 2021 | 362461.00 | 6003521.00 | 16.6 | 5 |