-- Day 1

--2. Créer les relations de la base ci-dessus (avec toutes les clés primaires et étrangères).
-- Création de la base de donnée

CREATE TABLE CLI (
    NumCli integer PRIMARY KEY,
    NomCli varchar(30),
    Pays varchar(30),
    Tel integer,
    Ville varchar(30),
    Dept varchar(30),
    Nat varchar(30)
);

CREATE TABLE COM (
    NumCom integer PRIMARY KEY,
    NumCli integer,
    FOREIGN KEY (NumCli) REFERENCES CLI(NumCli),
    FraisPort integer,
    AnCom number(4),
    Payement varchar(30)
);

CREATE TABLE FOU (
    NumFou integer PRIMARY KEY,
    NomFou varchar(30),
    Pays varchar(30),
    Tel integer
);

CREATE TABLE PRO (
    NumPro integer PRIMARY KEY,
    NumFou integer,
    FOREIGN KEY (NumFou) REFERENCES FOU(NumFou),
    NomPro varchar(30),
    TypePro varchar(30),
    PrixUnit integer
);

CREATE TABLE DET (
    NumCom integer,
    FOREIGN KEY (NumCom) REFERENCES COM(NumCom),
    NumPro integer,
    FOREIGN KEY (NumPro) REFERENCES PRO(NumPro),
    Qte integer,
    Remise integer
);


-- 3. Y a-t-il un ordre à respecter lors de la création de ces tables, si oui lequel ? Pourquoi ? 

  -- Si on créer les tables une à une avec CREATE TABLE, il y a un ordre à respecter oui. On met toujours la clé primaire en premier. D’abord on créer les tables
  -- sans clés étrangères pour ensuite créer les tables qui font références à d’autres tables avec les clés étrangères. 

  -- Parce qu'il faut que la clé primaire soit dans la première colonne de chaque table pour bien les repérer.
  -- Et pour les clés étrangères, on ne peut pas créer une table qui fait référence à une autre si cette dernière n’existe pas encore. 

  

-- 4. Vérifier vos créations. Sous SQL*plus, utiliser la commande desc <nomtable>. Insérer un jeu de données cohérent dans vos relations (un ou deux tuples par relation). 

  
  desc CLI 

  desc COM 

  desc DET 

  desc PRO 

  desc FOU 
 
INSERT INTO CLI VALUES (1, 'BIGGY','Monaco',0781474747,'Monaco','Monaco','Monegasque'); 
INSERT INTO CLI VALUES (2, 'Bob', 'France', 0677225874, 'Toulouse', 'Haute-Garonne', 'Français');
INSERT INTO COM VALUES (1, (SELECT NumCli FROM CLI WHERE NumCli = 1), 3, 2019, 'Cheque-55euro');
INSERT INTO COM VALUES (2, (SELECT NumCli FROM CLI WHERE NumCli = 2), 501, 2011, 'Carte');
INSERT INTO FOU VALUES (1, 'ZIPETTE', 'Italie', 0606060606);
INSERT INTO FOU VALUES (2, 'Intel', 'France', 0722481945);
INSERT INTO PRO VALUES (1, (SELECT NumFou FROM FOU WHERE NumFou = 1), 'Hydrogen', 'Gaz', 250);
INSERT INTO PRO VALUES (2, (SELECT NumFou FROM FOU WHERE NumFou = 2), 'Liquid', 'Gaz', 15);
INSERT INTO DET VALUES ((SELECT NumCom FROM Com WHERE NumCom = 1), (SELECT NumPro FROM Pro WHERE NumPro = 1), 10, 11);
INSERT INTO DET VALUES ((SELECT NumCom FROM Com WHERE NumCom = 2), (SELECT NumPro FROM Pro WHERE NumPro = 2), 12, 25);

-- 5. Vider toutes vos tables. Y a-t-il un ordre à respecter ? Si oui, pourquoi ?
-- Oui, il y a un ordre à respecter afin de ne pas casser les foreign keys.

DROP TABLE CLI
DROP TABLE COM
DROP TABLE FOU
DROP TABLE PRO
DROP TABLE DET


-- Exercice 2 


-- 5. On retrouve 7 Tables : Countries, Departments, Employees, Job_History, Jobs, Locations, Regions

-- Exercice 3


-- 1.
Select FIRST_NAME, LAST_NAME, COMMISSION_PCT, DEPARTMENT_ID, HIRE_DATE, SALARY from employees 
where commission_pct is not null and salary between '10000' and '15000' and hire_date <= '05/06/2005';
-- 2. 
Select department_id, AVG(salary), MEDIAN(salary), MIN(salary), MAX(salary) from employees group by department_id;
-- 3. 
Select job_title, AVG(min_salary + max_salary)/2, MEDIAN(min_salary + max_salary)from jobs group by job_title;
-- 4. 
Select * from employees where job_id like 'IT%' and salary >= '6461';
-- 5. 
Select FIRST_NAME, LAST_NAME, HIRE_DATE from employees;


-- Day 2

-- Exercice 1

DECLARE
    nb_countries int; -- nombre de pays
    nb_departments int; -- nombre de departements
    nb_employees int; -- nombre d'employees
    nb_jobhitory int; -- nombre de job history
    nb_jobs int; -- nombre de jobs
    nb_locations int; -- nombre d'adresse
    nb_regions int; -- nombre de regions
    
    nb_manager int; -- nombre de manager
    propman int; -- Proportion de managers

BEGIN
    SELECT count(*) INTO nb_countries FROM countries;
    DBMS_OUTPUT.PUT_LINE('nombre de pays : '||nb_countries);
    SELECT count(*) INTO nb_departments FROM departments;
    DBMS_OUTPUT.PUT_LINE('nombre de departements : '||nb_departments);
    SELECT count(*) INTO nb_employees FROM employees;
    DBMS_OUTPUT.PUT_LINE('nombre d''employees : '||nb_employees);
    SELECT count(*) INTO nb_jobhitory FROM job_history;
    DBMS_OUTPUT.PUT_LINE('nombre de job history : '||nb_jobhitory);
    SELECT count(*) INTO nb_jobs FROM jobs;
    DBMS_OUTPUT.PUT_LINE('nombre de jobs : '||nb_jobs);
    SELECT count(*) INTO nb_locations FROM locations;
    DBMS_OUTPUT.PUT_LINE('nombre d''adresse : '||nb_locations);
    SELECT count(*) INTO nb_regions FROM regions;
    DBMS_OUTPUT.PUT_LINE('nombre de regions : '||nb_regions);
    
   SELECT COUNT(*) INTO nb_manager FROM employees
   WHERE employees.job_id LIKE '%MGR' OR employees.job_id LIKE '%MAN';
   DBMS_OUTPUT.PUT_LINE('nb manager : '||nb_manager);
   
   propman := 100 * nb_manager / nb_employees;
    DBMS_OUTPUT.PUT_LINE('pourcentage de manager : '||propman||'%');

END;
/

-- Exercice 2 

SELECT table_name,num_rows FROM all_tables WHERE owner = 'HR';


-- Exercice 3 

-- Création table VOL

CREATE TABLE VOL (
    Idvol varchar(20) PRIMARY KEY,
    Date_heure_depart datetime,
    Date_heure_arrivee datetime,
    Ville_depart varchar(30),
    Ville_arrivee varchar(30)
);

-- Écrire un programme qui permet d'insérer le vol BA270 partant de Rome à 10h15 et arrivant
-- à Paris à 12h15


DECLARE
v vol%ROWTYPE;
BEGIN
v.Idvol := 'BA270';
v.Date_heure_depart := to_date('01/06/2022 10:15', 'DD/MM/YYYY hh24:mi');
v.Date_heure_arrivee := to_date('01/06/2022 12:15', 'DD/MM/YYYY hh24:mi');
v.Ville_depart := 'Rome';
v.Ville_arrivee := 'Paris';
INSERT INTO vol VALUES v;
END;
/

-- Exercice 4

-- Création table

CREATE TABLE PILOTE (
    Matricule integer PRIMARY KEY,
    Nom varchar(30),
    Ville varchar(30),
    Age int,
    Salaire int
);


--1. Écrire un programme permettant de calculer la moyenne des salaires des pilotes dont l’âge est entre 45 et 55 ans

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
DBMS_OUTPUT.PUT_LINE('Moyenne salaires (pilotes de 45 <E0> 55 ans) : ' || moyenneSalaires);
END;
/
