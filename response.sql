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
  
INSERT INTO CLI VALUES (2, 'Bob', 'France', 0677225874, 'Toulouse', 'Haute-Garonne', 'Français');
INSERT INTO COM VALUES (2, (SELECT NumCli FROM CLI WHERE NumCli = 2), 501, 2011, 'Carte');
INSERT INTO FOU VALUES (2, 'Intel', 'France', 0722481945);
INSERT INTO PRO VALUES (2, (SELECT NumFou FROM FOU WHERE NumFou = 2), 'Liquid', 'France', 15);
INSERT INTO DET VALUES ((SELECT NumCom FROM Com WHERE NumCom = 2), (SELECT NumPro FROM Pro WHERE NumPro = 2), 12, 25);

-- 5. Vider toutes vos tables. Y a-t-il un ordre à respecter ? Si oui, pourquoi ?
-- Oui, il y a un ordre à respecter afin de ne ma casser les foreign keys.
