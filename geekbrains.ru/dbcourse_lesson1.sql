drop schema if exists world_points_db;
create schema if not exists world_points_db default character set utf8mb4 default collate utf8mb4_bin;

create table if not exists world_points_db.countries_tbl(
country_id smallint unsigned not null auto_increment primary key,
country_name varchar(100) not null,
country_code varchar(4) not null unique key
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table if not exists world_points_db.areas_tbl(
area_id smallint unsigned not null auto_increment primary key,
area_name varchar(100) not null,
area_code varchar(10) not null unique key,
country_id smallint unsigned not null,
constraint fk_areascountries_tbl foreign key (country_id) references world_points_db.countries_tbl (country_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table if not exists world_points_db.districts_tbl(
district_id smallint unsigned not null auto_increment primary key,
district_name varchar(100) not null,
area_id smallint unsigned not null,
constraint fk_districstareas_tbl foreign key (area_id) references world_points_db.areas_tbl (area_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table if not exists world_points_db.cities_tbl(
city_id smallint unsigned not null auto_increment primary key,
city_name varchar(100) not null,
city_code varchar(10) not null unique key,
area_id smallint unsigned not null,
district_id smallint unsigned not null,
constraint fk_citiesareas_tbl foreign key (area_id) references world_points_db.areas_tbl (area_id),
constraint fk_citiesdistricts_tbl foreign key (district_id) references world_points_db.districts_tbl (district_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;