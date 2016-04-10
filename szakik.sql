--------------------------------------------------------------
-- Adatbázist létrehozó script
--------------------------------------------------------------

ALTER SESSION SET NLS_DATE_LANGUAGE = HUNGARIAN;
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';

CREATE TABLE  "FELHASZNALO" 
   (	"F_ID" NUMBER(*,0) NOT NULL ENABLE, 
	"NEV" VARCHAR2(40), 
	"FELHASZNALONEV" VARCHAR2(20), 
	"JELSZO" VARCHAR2(20), 
	"CIM" VARCHAR2(100), 
	"varos_CIM" VARCHAR2(100),
	"iranyito_CIM" VARCHAR2(100),
	"FOTO" VARCHAR2(100), 
	"TELEFONSZAM" NUMBER(11,0), 
	"EMAIL" VARCHAR2(30), 
	 CONSTRAINT "FELHASZNALO_PRIMARY_KEY" PRIMARY KEY ("F_ID") ENABLE
   ) ;

CREATE SEQUENCE felh_seq
START WITH 1
INCREMENT BY 1
NOMAXVALUE;

CREATE OR REPLACE TRIGGER  "FELH_BIR" 
BEFORE INSERT ON Felhasznalo 
FOR EACH ROW
BEGIN
  :NEW.F_ID := felh_seq.NEXTVAL;
END;
/
ALTER TRIGGER  "FELH_BIR" ENABLE;


   
CREATE TABLE  "SZAKI" 
   (	"SZ_ID" NUMBER(*,0) NOT NULL ENABLE, 
	"Munkanev" VARCHAR2(100) NOT NULL ENABLE, 
	"NEVE" VARCHAR2(40), 
	"FELHASZNALONEV" VARCHAR2(20), 
	"JELSZO" VARCHAR2(20), 
	"TELEFONSZAM" NUMBER(11,0), 
	"EMAIL" VARCHAR2(30), 
	"FOTO" VARCHAR2(100), 
	"MUNKATERULET" VARCHAR2(30), 
	"TIPUS" VARCHAR2(10),
	 CONSTRAINT "SZAKI_PRIMARY_KEY" PRIMARY KEY ("SZ_ID") ENABLE
   ) ;

CREATE OR REPLACE TRIGGER  "SZ_BIR" 
BEFORE INSERT ON Szaki
FOR EACH ROW
BEGIN
  :NEW.SZ_ID := sz_seq.NEXTVAL;
END;
/
ALTER TRIGGER  "SZ_BIR" ENABLE;
   CREATE SEQUENCE sz_seq
START WITH 1
INCREMENT BY 1
NOMAXVALUE;


CREATE TABLE  "ERTEKELES" 
   (	"E_ID" NUMBER(4,0) NOT NULL ENABLE, 
	"SZ_ID" NUMBER(4,0) NOT NULL ENABLE, 
	"F_ID" NUMBER(4,0) NOT NULL ENABLE, 
	"PONT" NUMBER(*,0) NOT NULL ENABLE, 
	"DATUM" DATE, 
	"SZOVEG" VARCHAR2(200), 
	 CONSTRAINT "ERTEKELES_PRIMARY_KEY" PRIMARY KEY ("E_ID", "SZ_ID", "F_ID", "DATUM") ENABLE
   ) ;ALTER TABLE  "ERTEKELES" ADD CONSTRAINT "ERTEKELES_FOREIGN_KEY" FOREIGN KEY ("SZ_ID")
	  REFERENCES  "SZAKI" ("SZ_ID") ENABLE;ALTER TABLE  "ERTEKELES" ADD CONSTRAINT "ERTEKELES_FOREIGN_KEY2" FOREIGN KEY ("F_ID")
	  REFERENCES  "FELHASZNALO" ("F_ID") ENABLE;


CREATE TABLE  "IGENYLES" 
   (	"H_ID" NUMBER(4,0) NOT NULL ENABLE, 
	"F_ID" NUMBER(4,0) NOT NULL ENABLE, 
	"DATUM" DATE,
	"SZOVEG" VARCHAR2(500), 
	"Munkakat" VARCHAR2(50),
	 CONSTRAINT "IGENYLES_PRIMARY_KEY" PRIMARY KEY ("H_ID", "F_ID", "DATUM") ENABLE
   ) ;ALTER TABLE  "IGENYLES" ADD CONSTRAINT "IGENYLES_FOREIGN_KEY" FOREIGN KEY ("F_ID")
	  REFERENCES  "SZAKI" ("F_ID") ENABLE;


	 ) ;
CREATE TABLE  "PANASZ" 

   (	"P_ID" NUMBER(4,0) NOT NULL ENABLE, 
   "F_ID" NUMBER(4,0) NOT NULL ENABLE, 
	"PANASZ" VARCHAR2(100) NOT NULL ENABLE, 
	 CONSTRAINT "PANASZ_PRIMARY_KEY" PRIMARY KEY ("F_ID", "P_ID") ENABLE
   ) ;ALTER TABLE  "PANASZ" ADD CONSTRAINT "PANASZ_FOREIGN_KEY" FOREIGN KEY ("F_ID")
	  REFERENCES  "FELHASZNALO" ("F_ID") ENABLE;
	 

	 CREATE TABLE  "UZENET" 
   (	"U_ID" NUMBER(4,0) NOT NULL ENABLE, 
	"SZ_ID" NUMBER(4,0) NOT NULL ENABLE, 
	"F_ID" NUMBER(4,0) NOT NULL ENABLE, 
	"DATUM" DATE, 
	"SZOVEG" VARCHAR2(500), 
	 CONSTRAINT "UZENET_PRIMARY_KEY" PRIMARY KEY ("U_ID", "SZ_ID", "DATUM", "F_ID") ENABLE
   ) ;ALTER TABLE  "UZENET" ADD CONSTRAINT "UZENET_FOREIGN_KEY" FOREIGN KEY ("SZ_ID")
	  REFERENCES  "SZAKI" ("SZ_ID") ENABLE;ALTER TABLE  "UZENET" ADD CONSTRAINT "UZENET_FOREIGN_KEY2" FOREIGN KEY ("F_ID")
	  REFERENCES  "FELHASZNALO" ("F_ID") ENABLE;

CREATE TABLE  "KEDVENCEK" 

   (
   "F_ID" NUMBER(4,0) NOT NULL ENABLE, 
    "SZ_ID" NUMBER(4,0) NOT NULL ENABLE, 
	 CONSTRAINT "KEDVENCEK_PRIMARY_KEY" PRIMARY KEY ("F_ID", "SZ_ID") ENABLE
   ) ;ALTER TABLE  "KEDVENCEK" ADD CONSTRAINT "KEDVENCEK_FOREIGN_KEY" FOREIGN KEY ("F_ID")
	  REFERENCES  "FELHASZNALO" ("F_ID") ENABLE;
	  ;ALTER TABLE  "KEDVENCEK" ADD CONSTRAINT "KEDVENCEK_FOREIGN_KEY2" FOREIGN KEY ("SZ_ID")
	  REFERENCES  "SZAKI" ("SZ_ID") ENABLE;
	  
 CREATE TABLE  "Fizetes" 
   (	"Fiz_ID" NUMBER(4,0) NOT NULL AUTOINCREMENT ENABLE, 
	"SZ_ID" NUMBER(4,0) NOT NULL ENABLE, 
	"DATUM" DATE, 
	"osszeg" INTEGER, 
	 CONSTRAINT "Fizetes_PRIMARY_KEY" PRIMARY KEY ("Fiz_ID", "SZ_ID", "DATUM") ENABLE
   ) ;ALTER TABLE  "Fizetes" ADD CONSTRAINT "Fizetes_FOREIGN_KEY" FOREIGN KEY ("SZ_ID")
	  REFERENCES  "SZAKI" ("SZ_ID") ENABLE;
	  


	  
	  

   