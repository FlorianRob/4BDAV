-- EXERCICE 2

desc user_objects;
DECLARE
    
    obj_name user_objects.object_name%type;
    obj_type user_objects.object_type%type;
    
BEGIN

    SELECT object_name, object_type INTO obj_name, obj_type FROM user_objects WHERE object_type LIKE 'TABLE' OR object_type LIKE 'VIEW';
    DBMS_OUTPUT.PUT_LINE('L''objet '||obj_name||' est de type '||obj_type);
END;


SELECT object_name, object_type FROM user_objects WHERE object_type LIKE 'TABLE' OR object_type LIKE 'VIEW';