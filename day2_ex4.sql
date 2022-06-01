-- EXERCICE 4

DECLARE
 CURSOR curseur1 IS SELECT salaire FROM pilote
 WHERE (Age >= 45 AND Age <=55);
 salairePilote Pilote.Salaire%TYPE;
 sommeSalaires NUMBER(11,2) := 0;
 moyenneSalaires NUMBER(11,2);
BEGIN
OPEN curseur1;
LOOP
FETCH curseur1 INTO salairePilote;
EXIT WHEN (curseur1%NOTFOUND OR curseur1%NOTFOUND IS NULL);
sommeSalaires := sommeSalaires + salairePilote;
END LOOP;
moyenneSalaires := sommeSalaires / curseur1%ROWCOUNT;
CLOSE curseur1;
DBMS_OUTPUT.PUT_LINE('Moyenne salaires (pilotes de 45 à 55 ans) : ' || moyenneSalaires);
END;
/