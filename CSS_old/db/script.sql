DROP TABLE IF EXISTS pis_mdc;
DROP TABLE IF EXISTS textfiletable;

CREATE TABLE IF NOT EXISTS PIS_MDC
(UD_MDC_CODE VARCHAR(25) ,
DRUG_GNR_NAME VARCHAR(200)DEFAULT 'NULL',
DRUG_PRODUCT_NAME VARCHAR(100),
UD_MDC_DESC VARCHAR(200)DEFAULT 'NULL',
ACTIVE_INGREDIENT_CODE VARCHAR(600),
DEF_CAUTIONARY_CODE VARCHAR(200),
DOSAGE_FORM_CODE VARCHAR(100)DEFAULT 'NULL',
DEF_DOSAGE VARCHAR (50) DEFAULT 'NULL',
DEF_ROUTE_CODE VARCHAR(100)DEFAULT 'NULL',
DEF_ADVISORY_CODE VARCHAR(200)DEFAULT 'NULL',
UD_ATC_CODE VARCHAR(15),
STATUS VARCHAR(20),
DRUG_STRENGTH VARCHAR(30),
STOCK_QTY DOUBLE,
LOCATION_CODE VARCHAR(4) DEFAULT 'P',
PRIMARY KEY(UD_MDC_CODE,UD_ATC_CODE));

CREATE text TABLE IF NOT EXISTS textfiletable 
(UD_MDC_CODE VARCHAR(25) ,
DRUG_GNR_NAME VARCHAR(100)DEFAULT 'NULL',
DRUG_PRODUCT_NAME VARCHAR(200),
UD_MDC_DESC VARCHAR(200)DEFAULT 'NULL',
ACTIVE_INGREDIENT_CODE VARCHAR(600),
DEF_CAUTIONARY_CODE VARCHAR(200),
DOSAGE_FORM_CODE VARCHAR(100)DEFAULT 'NULL',
DEF_DOSAGE VARCHAR (50) DEFAULT 'NULL',
DEF_ROUTE_CODE VARCHAR(100)DEFAULT 'NULL',
DEF_ADVISORY_CODE VARCHAR(200)DEFAULT 'NULL',
UD_ATC_CODE VARCHAR(15) ,
STATUS VARCHAR(20),
DRUG_STRENGTH VARCHAR(30),
STOCK_QTY DOUBLE,
LOCATION_CODE VARCHAR(4) DEFAULT 'P') ;

SET TABLE textfiletable SOURCE "data_mdc.csv"

INSERT INTO PIS_MDC (UD_MDC_CODE,DRUG_GNR_NAME,DRUG_PRODUCT_NAME,UD_MDC_DESC,ACTIVE_INGREDIENT_CODE,DEF_CAUTIONARY_CODE,DOSAGE_FORM_CODE,DEF_DOSAGE,DEF_ROUTE_CODE,DEF_ADVISORY_CODE,UD_ATC_CODE,STATUS,DRUG_STRENGTH,STOCK_QTY,LOCATION_CODE)
SELECT UD_MDC_CODE,DRUG_GNR_NAME,DRUG_PRODUCT_NAME,UD_MDC_DESC,ACTIVE_INGREDIENT_CODE,DEF_CAUTIONARY_CODE,DOSAGE_FORM_CODE,DEF_DOSAGE,DEF_ROUTE_CODE,DEF_ADVISORY_CODE,UD_ATC_CODE,STATUS,DRUG_STRENGTH,STOCK_QTY,LOCATION_CODE 
FROM textfiletable;

TRUNCATE TABLE textfiletable;

COMMIT;
