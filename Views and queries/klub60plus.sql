CREATE VIEW Stariji_od_60 AS
SELECT *
FROM public."Korisnik"
WHERE "60plus_klub" = true;