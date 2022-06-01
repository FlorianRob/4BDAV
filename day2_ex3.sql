-- EXERCICE 3

DECLARE
v vol%ROWTYPE;
BEGIN
v.idvol := 'BA270';
v.date_heure_depart := to_date('01/06/2022 10:15', 'DD/MM/YYYY hh24:mi');
v.date_heure_arrivee := to_date('01/06/2022 12:15', 'DD/MM/YYYY hh24:mi');
v.dille_depart := 'Rome';
v.dille_arrivee := 'Paris';
INSERT INTO vol VALUES v;
END;
/