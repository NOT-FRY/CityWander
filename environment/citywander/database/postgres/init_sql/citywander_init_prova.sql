SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;


-- Tabella di sequence per gli id
CREATE SEQUENCE public.sq_prova_sequence
    START 1
    INCREMENT 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

-- Creazione della tabella
CREATE TABLE public.t_prova(
    n_id BIGINT,
    t_example_code VARCHAR(255),
    d_data DATE,
    b_validate VARCHAR(1)
);

ALTER TABLE public.sq_prova_sequence OWNER TO citywander;
ALTER TABLE public.t_prova OWNER TO citywander;
