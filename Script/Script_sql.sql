BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "DWH_DIM_DEMOGRAPHIE" (
	"id_demographie"	INTEGER,
	"code_commune_insee"	TEXT NOT NULL,
	"population_totale"	INTEGER,
	"nb_hommes_65_79"	INTEGER,
	"nb_femmes_65_79"	INTEGER,
	"nb_hommes_80_plus"	INTEGER,
	"nb_femmes_80_plus"	INTEGER,
	"nb_total_65_79"	INTEGER,
	"nb_total_80_plus"	INTEGER,
	"nb_foyers_fiscaux"	INTEGER,
	"revenu_fiscal_moyen"	REAL,
	PRIMARY KEY("id_demographie" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "DWH_DIM_GEOGRAPHIE" (
	"id_geographie"	INTEGER,
	"code_postal"	TEXT,
	"code_commune_insee"	TEXT,
	"nom_commune"	TEXT,
	"code_departement"	TEXT,
	"nom_departement"	TEXT,
	"code_region"	TEXT,
	"nom_region"	TEXT,
	PRIMARY KEY("id_geographie" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "DWH_DIM_GESTIONNAIRE" (
	"id_gestionnaire"	INTEGER,
	"nom_gestionnaire"	TEXT NOT NULL,
	"est_grand_groupe"	INTEGER,
	PRIMARY KEY("id_gestionnaire" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "DWH_DIM_STATUT" (
	"id_status"	INTEGER,
	"libelle_status"	TEXT NOT NULL,
	PRIMARY KEY("id_status" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "DWH_DIM_TYPE" (
	"id_type"	INTEGER,
	"libelle_type"	TEXT NOT NULL,
	PRIMARY KEY("id_type" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "DWH_FAIT_ETABLISSEMENT" (
	"id_etablissement"	INTEGER,
	"no_finess"	TEXT NOT NULL,
	"raison_sociale"	TEXT,
	"id_geographie"	INTEGER,
	"id_statut"	INTEGER,
	"id_type"	INTEGER,
	"id_gestionnaire"	INTEGER,
	"id_demographie"	INTEGER,
	"capacite"	INTEGER,
	"prix_heb_perm_cs"	REAL,
	"prix_heb_temp_cs"	REAL,
	"tarif_gir_1_2"	REAL,
	"tarif_gir_3_4"	REAL,
	"tarif_gir_5_6"	REAL,
	"is_alzheimer"	INTEGER,
	"is_accueil_jour"	INTEGER,
	"is_habilite_aide_sociale"	INTEGER,
	PRIMARY KEY("id_etablissement" AUTOINCREMENT),
	FOREIGN KEY("id_demographie") REFERENCES "DWH_DIM_DEMOGRAPHIE"("id_demographie"),
	FOREIGN KEY("id_geographie") REFERENCES "DWH_DIM_GEOGRAPHIE"("id_geographie"),
	FOREIGN KEY("id_gestionnaire") REFERENCES "DWH_DIM_GESTIONNAIRE"("id_gestionnaire"),
	FOREIGN KEY("id_statut") REFERENCES "DWH_DIM_STATUT"("id_statut"),
	FOREIGN KEY("id_type") REFERENCES "DWH_DIM_TYPE"("id_type")
);
CREATE TABLE IF NOT EXISTS "ODS_DEMOGRAPHIE" (
	"code_commune_insee"	TEXT,
	"nom_commune"	TEXT,
	"code_departement"	TEXT,
	"code_region"	TEXT,
	"population_totale"	INTEGER,
	"nb_hommes_65_79"	INTEGER,
	"nb_femmes_65_79"	INTEGER,
	"nb_hommes_80_plus"	INTEGER,
	"nb_femmes_80_plus"	INTEGER,
	"nb_foyers_fiscaux"	INTEGER,
	"revenu_fiscal_total"	REAL,
	"revenu_fiscal_moyen"	REAL,
	PRIMARY KEY("code_commune_insee")
);
CREATE TABLE IF NOT EXISTS "ODS_ETABLISSEMENT" (
	"no_finess"	TEXT,
	"raison_sociale"	TEXT,
	"capacite"	INTEGER,
	"legal_status"	TEXT,
	"code_postal"	TEXT,
	"code_departement"	TEXT,
	"nom_departement"	TEXT,
	"nom_commune"	TEXT,
	"nom_gestionnaire"	TEXT,
	"is_ehpad"	INTEGER,
	"is_esld"	INTEGER,
	"is_ra"	INTEGER,
	"is_alzheimer"	INTEGER,
	"is_accueil_jour"	INTEGER,
	"is_habilite_aide_sociale"	INTEGER,
	"prix_heb_perm_cs"	REAL,
	"prix_heb_temp_cs"	REAL,
	"tarif_gir_1_2"	REAL,
	"tarif_gir_3_4"	REAL,
	"tarif_gir_5_6"	REAL,
	"date_maj"	TEXT,
	PRIMARY KEY("no_finess")
);
CREATE TABLE IF NOT EXISTS "ODS_GEOGRAPHIE" (
	"code_postal"	TEXT,
	"code_commune_insee"	TEXT,
	"nom_commune"	TEXT,
	"code_departement"	TEXT,
	"nom_departement"	TEXT,
	"code_region"	TEXT,
	"nom_region"	TEXT,
	PRIMARY KEY("code_postal","code_commune_insee")
);
CREATE TABLE IF NOT EXISTS "ODS_GESTIONNAIRE" (
	"nom_gestionnaire"	TEXT,
	"est_grand_groupe"	INTEGER,
	PRIMARY KEY("nom_gestionnaire")
);
CREATE TABLE IF NOT EXISTS "SAS_AGE_INSEE" (
	"INSEE"	TEXT,
	"NOM"	TEXT,
	"EPCI"	TEXT,
	"DEP"	TEXT,
	"REG"	TEXT,
	"F0_2"	TEXT,
	"F3_5"	TEXT,
	"F6_10"	TEXT,
	"F11_17"	TEXT,
	"F18_24"	TEXT,
	"F25_39"	TEXT,
	"F40_54"	TEXT,
	"F55_64"	TEXT,
	"F65_79"	TEXT,
	"F80_PLUS"	TEXT,
	"H0_2"	TEXT,
	"H3_5"	TEXT,
	"H6_10"	TEXT,
	"H11_17"	TEXT,
	"H18_24"	TEXT,
	"H25_39"	TEXT,
	"H40_54"	TEXT,
	"H55_64"	TEXT,
	"H65_79"	TEXT,
	"H80_PLUS"	TEXT
);
CREATE TABLE IF NOT EXISTS "SAS_CORRESPONDANCE_INSEE_POSTAL" (
	"code_commune_insee"	TEXT,
	"nom_commune"	TEXT,
	"code_postal"	TEXT,
	"libelle_acheminement"	TEXT,
	"ligne_5"	TEXT
);
CREATE TABLE IF NOT EXISTS "SAS_DONNEES_COMMUNES" (
	"REG"	TEXT,
	"Region"	TEXT,
	"DEP"	TEXT,
	"CODARR"	TEXT,
	"CODCAN"	TEXT,
	"CODCOM"	TEXT,
	"COM"	TEXT,
	"Commune"	TEXT,
	"PMUN"	TEXT,
	"PCAP"	TEXT,
	"PTOT"	TEXT
);
CREATE TABLE IF NOT EXISTS "SAS_ETABLISSEMENT" (
	"_id"	TEXT,
	"title"	TEXT,
	"updatedAt"	TEXT,
	"noFinesset"	TEXT,
	"capacity"	TEXT,
	"legal_status"	TEXT,
	"isViaTrajectoire"	TEXT,
	"IsEHPAD"	TEXT,
	"IsEHPA"	TEXT,
	"IsESLD"	TEXT,
	"IsRA"	TEXT,
	"IsAJA"	TEXT,
	"IsHCOMPL"	TEXT,
	"IsHTEMPO"	TEXT,
	"IsACC_JOUR"	TEXT,
	"IsACC_NUIT"	TEXT,
	"IsHAB_AIDE_SOC"	TEXT,
	"IsCONV_APL"	TEXT,
	"IsALZH"	TEXT,
	"IsUHR"	TEXT,
	"IsPASA"	TEXT,
	"IsPUV"	TEXT,
	"IsF1"	TEXT,
	"IsF1Bis"	TEXT,
	"IsF2"	TEXT,
	"cerfa"	TEXT,
	"prixMin"	TEXT,
	"coordinates_postcode"	TEXT,
	"coordinates_deptcode"	TEXT,
	"coordinates_deptname"	TEXT,
	"coordinates_city"	TEXT,
	"coordinates_gestionnaire"	TEXT,
	"ehpadPrice_prixHebPermCs"	TEXT,
	"ehpadPrice_prixHebPermCd"	TEXT,
	"ehpadPrice_prixHebTempCs"	TEXT,
	"ehpadPrice_prixHebTempCd"	TEXT,
	"ehpadPrice_tarifGir12"	TEXT,
	"ehpadPrice_tarifGir34"	TEXT,
	"ehpadPrice_tarifGir56"	TEXT,
	"ehpadPrice_autrePrestation"	TEXT,
	"ehpadPrice_autreTarifPrest"	TEXT
);
CREATE TABLE IF NOT EXISTS "SAS_IRCOM_REVENUS" (
	"departement"	TEXT,
	"commune"	TEXT,
	"libelle_commune"	TEXT,
	"nb_foyers_fiscaux"	TEXT,
	"revenu_fiscal_reference_foyers"	TEXT,
	"impot_net_total"	TEXT,
	"nb_foyers_fiscaux_imposes"	TEXT,
	"revenu_fiscal_reference_foyers_imposes"	TEXT,
	"traitements_salaires_nb_foyers"	TEXT,
	"traitements_salaires_montant"	TEXT,
	"retraites_pensions_nb_foyers"	TEXT,
	"retraites_pensions_montant"	TEXT
);
COMMIT;
