ALTER TABLE geodata.`_countries` MODIFY COLUMN country_id INT auto_increment NOT null primary key;
ALTER TABLE geodata.`_countries` CHANGE country_id id INT auto_increment NOT null;
ALTER TABLE geodata.`_countries` DROP COLUMN title_ua,
	DROP COLUMN title_be,
	DROP COLUMN title_en,
	DROP COLUMN title_es,
	DROP COLUMN title_pt,
	DROP COLUMN title_de,
	DROP COLUMN title_fr,
	DROP COLUMN title_it,
	DROP COLUMN title_pl,
	DROP COLUMN title_ja,
	DROP COLUMN title_lt,
	DROP COLUMN title_lv,
	DROP COLUMN title_cz;
ALTER TABLE geodata.`_countries` CHANGE title_ru title varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL;
ALTER TABLE geodata.`_countries` MODIFY COLUMN title varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL;

ALTER TABLE geodata.`_regions` CHANGE region_id id INT auto_increment NOT null primary key;
ALTER TABLE geodata.`_regions` MODIFY COLUMN id INT auto_increment NOT null;
ALTER TABLE geodata.`_regions` MODIFY COLUMN country_id INT NOT null;
CREATE INDEX `regions_country_id_idx` USING BTREE ON geodata.`_regions` (country_id);
ALTER TABLE geodata.`_regions` CHANGE title_ru title varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL;
ALTER TABLE geodata.`_regions` MODIFY COLUMN title varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL;
ALTER TABLE geodata.`_regions` DROP COLUMN title_ua,
	DROP COLUMN title_be,
	DROP COLUMN title_en,
	DROP COLUMN title_es,
	DROP COLUMN title_pt,
	DROP COLUMN title_de,
	DROP COLUMN title_fr,
	DROP COLUMN title_it,
	DROP COLUMN title_pl,
	DROP COLUMN title_ja,
	DROP COLUMN title_lt,
	DROP COLUMN title_lv,
	DROP COLUMN title_cz;
ALTER TABLE geodata.`_regions` ADD CONSTRAINT `fk_regions_countries` FOREIGN KEY (country_id) REFERENCES geodata.`_countries`(id);

ALTER TABLE geodata.`_cities` CHANGE city_id id INT auto_increment NOT null primary key;
ALTER TABLE geodata.`_cities` MODIFY COLUMN id INT auto_increment NOT NULL;
ALTER TABLE geodata.`_cities` MODIFY COLUMN country_id INT NOT NULL;
ALTER TABLE geodata.`_cities` MODIFY COLUMN region_id INT NULL;
ALTER TABLE geodata.`_cities` CHANGE title_ru title varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL;
ALTER TABLE geodata.`_cities` MODIFY COLUMN title varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL;
CREATE INDEX `cities_title_idx` USING BTREE ON geodata.`_cities` (title);
ALTER TABLE geodata.`_cities` 
	DROP COLUMN area_ru,
	DROP COLUMN region_ru,
	DROP COLUMN title_ua,
	DROP COLUMN area_ua,
	DROP COLUMN region_ua,
	DROP COLUMN title_be,
	DROP COLUMN area_be,
	DROP COLUMN region_be,
	DROP COLUMN title_en,
	DROP COLUMN area_en,
	DROP COLUMN region_en,
	DROP COLUMN title_es,
	DROP COLUMN area_es,
	DROP COLUMN region_es,
	DROP COLUMN title_pt,
	DROP COLUMN area_pt,
	DROP COLUMN region_pt,
	DROP COLUMN title_de,
	DROP COLUMN area_de,
	DROP COLUMN region_de,
	DROP COLUMN title_fr,
	DROP COLUMN area_fr,
	DROP COLUMN region_fr,
	DROP COLUMN title_it,
	DROP COLUMN area_it,
	DROP COLUMN region_it,
	DROP COLUMN title_pl,
	DROP COLUMN area_pl,
	DROP COLUMN region_pl,
	DROP COLUMN title_ja,
	DROP COLUMN area_ja,
	DROP COLUMN region_ja,
	DROP COLUMN title_lt,
	DROP COLUMN area_lt,
	DROP COLUMN region_lt,
	DROP COLUMN title_lv,
	DROP COLUMN area_lv,
	DROP COLUMN region_lv,
	DROP COLUMN title_cz,
	DROP COLUMN area_cz,
	DROP COLUMN region_cz;
ALTER TABLE geodata.`_cities` ADD CONSTRAINT `fk_cities_countries` FOREIGN KEY (country_id) REFERENCES geodata.`_countries`(id);
ALTER TABLE geodata.`_cities` ADD CONSTRAINT `fk_cities_regions` FOREIGN KEY (region_id) REFERENCES geodata.`_regions`(id);