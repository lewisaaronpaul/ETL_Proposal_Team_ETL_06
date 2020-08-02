-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/ixYSyD
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.
DROP TABLE IF EXISTS county_voters;
DROP TABLE IF EXISTS county_unemployment;
DROP TABLE IF EXISTS covid_county;
DROP TABLE IF EXISTS census_data_county;
DROP TABLE IF EXISTS state_county;
DROP TABLE IF EXISTS state_unemployment;
DROP TABLE IF EXISTS covid_state;
DROP TABLE IF EXISTS census_data_state;
DROP TABLE IF EXISTS ethnicity_covid;
DROP TABLE IF EXISTS state;

CREATE TABLE "state" (
    "fips" varchar(255) ,
    "state" varchar(255) ,
    "abbr" varchar(255) ,
    "latitude" varchar(255) ,
    "longitude" varchar(255) ,
    CONSTRAINT "pk_state" PRIMARY KEY (
        "fips"
     )
);

CREATE TABLE "state_county" (
    "fips" varchar(255) ,
    "abbr" varchar(255) ,
    "county" varchar(255) ,
    "latitude" varchar(255) ,
    "longitude" varchar(255) ,
    CONSTRAINT "pk_state_county" PRIMARY KEY (
        "fips"
     )
);

CREATE TABLE "census_data_state" (
    "fips" varchar(255) ,
    "land_area" varchar(255) ,
    "median_household_income" varchar(255) ,
    "pct_no_health_insurance" varchar(255) ,
    "pct_households_no_internet" varchar(255) ,
    CONSTRAINT "pk_census_data_state" PRIMARY KEY (
        "fips"
     )
);

CREATE TABLE "census_data_county" (
    "fips" varchar(255) ,
    "land_area" varchar(255) ,
    "median_household_income" varchar(255) ,
    "pct_no_health_insurance" varchar(255) ,
    "pct_households_no_internet" varchar(255) ,
    CONSTRAINT "pk_census_data_county" PRIMARY KEY (
        "fips"
     )
);

CREATE TABLE "covid_state" (
    "fips" varchar(255) ,
    "state" varchar(255) ,
    "confirmed" varchar(255) ,
	"deaths" varchar(255) , 
    "as_of_date" varchar(255) ,
    CONSTRAINT "pk_covid_state" PRIMARY KEY (
        "fips"
     )
);

CREATE TABLE "covid_county" (
    "fips" varchar(255) ,
    "confirmed" varchar(255) ,
    "deaths" varchar(255) ,
    "date" varchar(255) ,
    CONSTRAINT "pk_covid_county" PRIMARY KEY (
        "fips"
     )
);

CREATE TABLE "ethnicity_covid" (
    "fips" varchar(255) ,
    "cases_white" varchar(255) ,
    "deaths_white" varchar(255) ,
    "cases_black" varchar(255) ,
    "deaths_black" varchar(255) ,
    "cases_latinX" varchar(255) ,
    "deaths_latinX" varchar(255) ,
    "cases_asian" varchar(255) ,
    "deaths_asian" varchar(255) ,
    "cases_total" varchar(255) ,
    "deaths_total" varchar(255) ,
    CONSTRAINT "pk_ethnicity_covid" PRIMARY KEY (
        "fips"
     )
);

CREATE TABLE "county_unemployment" (
    "fips" varchar(255) ,
    "unemployment_rate_2019" varchar(255) ,
    "median_household_income_2018" varchar(255) ,
    "percent_of_median_household_income" varchar(255) ,
    CONSTRAINT "pk_county_unemployment" PRIMARY KEY (
        "fips"
     )
);

CREATE TABLE "state_unemployment" (
    "fips" varchar(255) ,
    "unemployment_rate_2019" varchar(255) ,
    "median_household_income_2018" varchar(255) ,
    "percent_of_median_household_income" varchar(255) ,
    CONSTRAINT "pk_state_unemployment" PRIMARY KEY (
        "fips"
     )
);

CREATE TABLE "county_voters" (
    "fips" varchar(255) ,
    "office" varchar(255) ,
    "democrat_votes" varchar(255) ,
    "republican_votes" varchar(255) ,
    "other_votes" varchar(255) ,
    CONSTRAINT "pk_county_voters" PRIMARY KEY (
        "fips"
     )
);

ALTER TABLE "census_data_state" ADD CONSTRAINT "fk_census_data_state_fips" FOREIGN KEY("fips")
REFERENCES "state" ("fips");

ALTER TABLE "census_data_county" ADD CONSTRAINT "fk_census_data_county_fips" FOREIGN KEY("fips")
REFERENCES "state_county" ("fips");

ALTER TABLE "covid_state" ADD CONSTRAINT "fk_covid_state_fips" FOREIGN KEY("fips")
REFERENCES "state" ("fips");

ALTER TABLE "covid_county" ADD CONSTRAINT "fk_covid_county_fips" FOREIGN KEY("fips")
REFERENCES "state_county" ("fips");

ALTER TABLE "ethnicity_covid" ADD CONSTRAINT "fk_ethnicity_covid_fips" FOREIGN KEY("fips")
REFERENCES "state" ("fips");

ALTER TABLE "county_unemployment" ADD CONSTRAINT "fk_county_unemployment_fips" FOREIGN KEY("fips")
REFERENCES "state_county" ("fips");

ALTER TABLE "state_unemployment" ADD CONSTRAINT "fk_state_unemployment_fips" FOREIGN KEY("fips")
REFERENCES "state" ("fips");

ALTER TABLE "county_voters" ADD CONSTRAINT "fk_county_voters_fips" FOREIGN KEY("fips")
REFERENCES "state_county" ("fips");

select * from county_voters;