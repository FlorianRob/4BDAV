--2. Créer les relations de la base ci-dessus (avec toutes les clés primaires et étrangères).



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
