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

create table public.utente (
                               username varchar(16) primary key NOT NULL,
                               nome varchar(50) NOT NULL,
                               cognome varchar(50) NOT NULL,
                               password varchar(80) NOT NULL,
                               email varchar(255) NOT NULL UNIQUE,
                               lingua varchar(2) CHECK (lingua IN ('IT', 'EN')) NOT null,
                               ruolo varchar(15) NOT NULL,
                               numeroGiorni integer,
                               mezzoTrasporto varchar(15) CHECK (mezzoTrasporto IN ('Automobile', 'Autobus', 'Treno', 'Piedi')),
                               punti integer,
                               dataNascita date,
                               genere varchar(10),
                               telefono varchar(15),
                               partitaIva char(11) unique,
                               viaAlloggio varchar(50),
                               coordinateAlloggio varchar(50)
);

create table public.ristorante (
                                   id_ristorante SERIAL primary key NOT NULL,
                                   fk_esercente varchar(16) NOT NULL,
                                   nome varchar(50) NOT NULL,
                                   indirizzo varchar(100) NOT NULL,
                                   descrizione varchar(500) NOT NULL,
                                   punteggio integer NOT NULL,
                                   menu varchar(200),
                                   foto varchar(200),
                                   coordinate varchar(30),
                                   FOREIGN KEY (fk_esercente) REFERENCES public.utente(username)
                                       ON UPDATE CASCADE
                                       ON DELETE CASCADE
);

create table public.tour (
                             id SERIAL primary key NOT NULL,
                             stato varchar(15) NOT NULL,
                             username varchar(16) NOT NULL,
                             numeroGiorni integer NOT NULL,
                             dataGenerazione date NOT NULL,
                             FOREIGN KEY (username) REFERENCES public.utente(username)
                                 ON UPDATE CASCADE
                                 ON DELETE CASCADE
);

create table public.tappa(
                             id SERIAL primary key NOT NULL,
                             descrizione varchar(5000) NOT NULL,
                             nome varchar(50) NOT NULL UNIQUE,
                             coordinate varchar(50) NOT NULL,
                             foto varchar(200)
);

create table public.tappaTour (
                                  idTour integer NOT NULL,
                                  idTappa integer NOT NULL,
                                  isCompletata bool NOT NULL,
                                  PRIMARY KEY (idTour,idTappa),
                                  FOREIGN KEY (idTour) REFERENCES public.tour(id)
                                      ON UPDATE CASCADE
                                      ON DELETE CASCADE,
                                  FOREIGN KEY (idTappa) REFERENCES public.tappa(id)
                                      ON UPDATE CASCADE
                                      ON DELETE CASCADE
);

--sezione della tappa
create table public.sezione(
                               id SERIAL primary key NOT NULL,
                               descrizione varchar(1000) NOT NULL,
                               foto varchar(200),
                               idTappa integer NOT NULL,
                               titolo varchar(50) NOT NULL,
                               numero integer NOT NULL,
                               FOREIGN KEY (idTappa) REFERENCES public.tappa(id)
                                   ON UPDATE CASCADE
                                   ON DELETE CASCADE
);

ALTER TABLE public.utente OWNER TO citywander;
ALTER TABLE public.ristorante OWNER TO citywander;
ALTER TABLE public.tour OWNER TO citywander;
ALTER TABLE public.tappa OWNER TO citywander;
ALTER TABLE public.tappaTour OWNER TO citywander;
ALTER TABLE public.sezione OWNER TO citywander;