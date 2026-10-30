-- `meu-projeto-engdados`.gold.dim_date definition

-- Drop table

-- DROP TABLE `meu-projeto-engdados`.gold.dim_date;

CREATE TABLE `meu-projeto-engdados`.gold.dim_date (
	US_RELEASE_DATE DATETIME,
	`YEAR` INT64,
	`MONTH` INT64,
	QUARTER INT64,
	ID_DATE INT64,
	CONSTRAINT DIM_DATE_PK PRIMARY KEY (ID_DATE)
);


-- `meu-projeto-engdados`.gold.dim_film definition

-- Drop table

-- DROP TABLE `meu-projeto-engdados`.gold.dim_film;

CREATE TABLE `meu-projeto-engdados`.gold.dim_film (
	FILM STRING(65535),
	GENRE STRING(65535),
	RATING_MPA STRING(65535),
	`LANGUAGE` STRING(65535),
	BREAK_EVEN STRING(65535),
	MCU BOOLEAN,
	MALE_FEMALE_LED STRING(65535),
	PHASE FLOAT64,
	ID_FILM INT64,
	CONSTRAINT DIM_FILM_PK PRIMARY KEY (ID_FILM)
);


-- `meu-projeto-engdados`.gold.dim_franchise definition

-- Drop table

-- DROP TABLE `meu-projeto-engdados`.gold.dim_franchise;

CREATE TABLE `meu-projeto-engdados`.gold.dim_franchise (
	FRANCHISE STRING(65535),
	CHARACTER_FAMILY STRING(65535),
	ID_FRANCHISE INT64,
	CONSTRAINT DIM_FRANCHISE_PK PRIMARY KEY (ID_FRANCHISE)
);


-- `meu-projeto-engdados`.gold.dim_production definition

-- Drop table

-- DROP TABLE `meu-projeto-engdados`.gold.dim_production;

CREATE TABLE `meu-projeto-engdados`.gold.dim_production (
	PRODUCTION_COMPANY STRING(65535),
	DISTRIBUTOR STRING(65535),
	COUNTRY_ORIGIN STRING(65535),
	FILMING_LOCATION STRING(65535),
	ID_PRODUCTION INT64,
	CONSTRAINT DIM_PRODUCTION_PK PRIMARY KEY (ID_PRODUCTION)
);


-- `meu-projeto-engdados`.gold.dim_staff definition

-- Drop table

-- DROP TABLE `meu-projeto-engdados`.gold.dim_staff;

CREATE TABLE `meu-projeto-engdados`.gold.dim_staff (
	DIRECTOR STRING(65535),
	WRITER STRING(65535),
	STAR STRING(65535),
	ID_STAFF INT64,
	CONSTRAINT DIM_STAFF_PK PRIMARY KEY (ID_STAFF)
);


-- `meu-projeto-engdados`.gold.fact_movies definition

-- Drop table

-- DROP TABLE `meu-projeto-engdados`.gold.fact_movies;

CREATE TABLE `meu-projeto-engdados`.gold.fact_movies (
	ID_FILM INT64,
	ID_STAFF INT64,
	ID_PRODUCTION INT64,
	ID_DATE INT64,
	BUDGET_x FLOAT64,
	INFLATION_ADJUSTED_BUDGET FLOAT64,
	GROSS_WORLD_WIDE FLOAT64,
	INFLATION_ADJUSTED_WORLDWIDE_GROSS FLOAT64,
	GROSS_US_CANADA FLOAT64,
	DOMESTIC FLOAT64,
	BOX_OFFICE_GROSS_OTHER_TERRITORIES FLOAT64,
	GROSS_OPENING_WEEKEND FLOAT64,
	GROSS_TO_BUDGET FLOAT64,
	RATING_IMDB FLOAT64,
	ROTTEN_TOMATOES_CRITIC_SCORE INT64,
	VOTE INT64,
	OSCAR INT64,
	NOMINATION INT64,
	WIN INT64,
	MINUTES FLOAT64,
	CONSTRAINT fk_date FOREIGN KEY (ID_DATE) REFERENCES `meu-projeto-engdados`.gold.dim_date(ID_DATE) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT fk_film FOREIGN KEY (ID_FILM) REFERENCES `meu-projeto-engdados`.gold.dim_film(ID_FILM) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT fk_production FOREIGN KEY (ID_PRODUCTION) REFERENCES `meu-projeto-engdados`.gold.dim_production(ID_PRODUCTION) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT fk_staff FOREIGN KEY (ID_STAFF) REFERENCES `meu-projeto-engdados`.gold.dim_staff(ID_STAFF) ON DELETE CASCADE ON UPDATE CASCADE
);