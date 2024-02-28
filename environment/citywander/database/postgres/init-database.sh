#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    create database citywander;
    create user citywander with encrypted password 'citywander';
    grant all privileges on database citywander to citywander;
EOSQL

cd /init_sql

psql -U citywander < /init_sql/citywander_init.sql

psql -U citywander < /init_sql/001_INSERT.sql