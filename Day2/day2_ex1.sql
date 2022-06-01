-- EXERCICE 1

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

