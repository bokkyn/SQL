
BEGIN;


CREATE TABLE IF NOT EXISTS public."Knjiga"
(
    "ID_knjige" integer NOT NULL,
    "Naslov" text COLLATE pg_catalog."default" NOT NULL,
    "Autor" text COLLATE pg_catalog."default" NOT NULL,
    "Odjel" text COLLATE pg_catalog."default" NOT NULL,
    "Godina_izdavanja" integer NOT NULL,
    "Izdavac" text COLLATE pg_catalog."default" NOT NULL,
    "Dostupnost" boolean NOT NULL,
    CONSTRAINT "Knjiga_pkey" PRIMARY KEY ("ID_knjige")
);

CREATE TABLE IF NOT EXISTS public."Korisnik"
(
    "Ime" text NOT NULL,
    "Prezime" text NOT NULL,
    "OIB" integer NOT NULL,
    "Broj_mobitela" text NOT NULL,
    "Maloljetan" boolean NOT NULL,
    "Student" boolean NOT NULL,
    "60plus_klub" boolean NOT NULL,
    "Datum_uclanjenja" date NOT NULL,
    CONSTRAINT "Korisnik_pkey" PRIMARY KEY ("OIB")
);

CREATE TABLE IF NOT EXISTS public."Posudba"
(
    "ID_posudbe" integer NOT NULL,
    "Pocetak_posudbe" date NOT NULL,
    "Kraj_posudbe" date NOT NULL,
    "Količina" integer NOT NULL,
    "OIB_korisnika" integer NOT NULL,
    "ID_zaposlenika" integer NOT NULL,
    "ID_knjiga" integer NOT NULL,
    CONSTRAINT "Posudba_pkey" PRIMARY KEY ("ID_posudbe")
);

CREATE TABLE IF NOT EXISTS public."Zaposlenik"
(
    "ID_zaposlenika" integer NOT NULL,
    "Ime" text NOT NULL,
    "Prezime" text NOT NULL,
    "Upravitelj" boolean NOT NULL,
    "Datum_zaposlenja" date NOT NULL,
    "Broj_mobitela" text NOT NULL,
    "OIB" integer NOT NULL,
    "Adresa" text NOT NULL,
    CONSTRAINT "Zaposlenik_pkey" PRIMARY KEY ("ID_zaposlenika")
);

ALTER TABLE IF EXISTS public."Posudba"
    ADD CONSTRAINT "ID_knjiga" FOREIGN KEY ("ID_knjiga")
    REFERENCES public."Knjiga" ("ID_knjige") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;
CREATE INDEX IF NOT EXISTS "fki_D"
    ON public."Posudba"("ID_knjiga");


ALTER TABLE IF EXISTS public."Posudba"
    ADD CONSTRAINT "ID_zaposlenika" FOREIGN KEY ("ID_zaposlenika")
    REFERENCES public."Zaposlenik" ("ID_zaposlenika") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;
CREATE INDEX IF NOT EXISTS "fki_ID_zaposlenika"
    ON public."Posudba"("ID_zaposlenika");


ALTER TABLE IF EXISTS public."Posudba"
    ADD CONSTRAINT "OIB_korisnika" FOREIGN KEY ("OIB_korisnika")
    REFERENCES public."Korisnik" ("OIB") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;
CREATE INDEX IF NOT EXISTS "fki_OIB_korisnika"
    ON public."Posudba"("OIB_korisnika");

END;