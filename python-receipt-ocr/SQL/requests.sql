-- Install the TimescaleDB extension if not already installed

CREATE EXTENSION IF NOT EXISTS timescaledb;

-- Create the nase table "receipts"
DROP table if exists receipts;

CREATE TABLE receipts (
  	time TIMESTAMPTZ NOT NULL,
	description TEXT NOT NULL,
	amount DOUBLE PRECISION NULL,
	flag TEXT NULL,
	merchant_name TEXT NOT NULL,
	merchant_address TEXT NOT NULL,
	country TEXT NOT NULL
);

-- Create the hypertable based on the "time" column
SELECT create_hypertable('receipts', 'time');

-- Insert all_product.csv initally
COPY receipts FROM 'export_all_product.csv' DELIMITER ';' CSV HEADER;


