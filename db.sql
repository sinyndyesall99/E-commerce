-- Supprimer une base
 DROP TO DATABASE IF EXISTS `E-commerce`;
-- Creer une base
CREATE DATABASE IF NOT EXISTS `E-commerce`;
-- Charger une base
USE `E-commerce`;

----------- User-------------------

CREATE TABLE `User`(
    `id` int PRIMARY KEY AUTO_INCREMENT,
    `nom` VARCHAR(100),
    `prenom` VARCHAR(100),
    `adresse` VARCHAR(50),
    `tel` VARCHAR(20) UNIQUE,
    `email` VARCHAR(50),
    `pwd` VARCHAR(100),
    `profile` ENUM("ADMIN", "BOUTIQUIER","CLIENT")
);

INSERT INTO `User` VALUE(
    null,
    "MBAYE", 
    "Babacar",
    "Noto",
    "772721994",
    "mbaye@gmail.com",
    "passer91",
    "CLIENT"
); 
INSERT INTO `User` VALUE(
    null,
    "SALL",
    "Siny",
    "Scat urbam",
    "771919444",
    "sall@gmail.com",
    "passer99",
    "BOUTIQUIER"

);
INSERT INTO `User` VALUE(
    null,
    "FALL",
    "Awa",
    "Scat urbam",
    "776838947",
    "fall@gmail.com",
    "passer99",
    "ADMIN"

);
-----------------Produit----------------------
CREATE TABLE`Produit`(
    `id`int PRIMARY KEY AUTO_INCREMENT,
  `nom` VARCHAR(100),
    `description` TEXT,
    `prixU` float,
    `image` VARCHAR(100),
    `id_boutiquier` int,
    CONSTRAINT FOREIGN KEY (`id_boutiquier`) REFERENCES `User` (`id`)
    );


INSERT INTO `Produit` VALUE(
    null,
    "vitalait",
    "lait poudre",
    "4200",
    " ",
    1
);
INSERT INTO `Produit` VALUE(
    null,
    "riz",
    "riz parfumée",
    "500",
    " ",
    2
);
INSERT INTO `Produit` VALUE(
    null,
    "chocolat",
    "alimentaire",
    "456",
    " ",
    3
);
--------------------  panier -----------------------------
    CREATE TABLE`Panier`(
    `id`int PRIMARY KEY AUTO_INCREMENT,
    `montantTOT` float,
    `id_client` int REFERENCES `User`(`id`) 
    );

INSERT INTO Panier VALUE(
    null,
    "7000",
    1
);
INSERT INTO Panier VALUE(
    null,
   "3000",
    2
);
INSERT INTO Panier VALUE(
    null,
    "2000",
    3
);
---------------------- Commande-----------------------
    CREATE TABLE `Commande`(
   `id`int PRIMARY KEY AUTO_INCREMENT,
   `date` date,
   `montanTot` float,
   `etat` ENUM("EN COURS", "VALIDER","REJETER");
   `id_client` int FOREIGN KEY REFERENCES `USER` (id)    
    );
-- CRUD FOR COMMANDE

INSERT INTO `Commande` VALUE(
    null,
    "2022-02-25",
    "8000",
    "EN COURS",
    1

);
INSERT INTO `Commande` VALUE(
    null,
    "2022-02-25",
    "8000",
    "VALIDER",
    2

);
INSERT INTO `Commande` VALUE(
    null,
    "2022-02-25",
    "8000",
    "REJETER",
    3

);

    ------------ ProduitCommande--------------
    CREATE TABLE `ProduitCommande`(
      `id`int PRIMARY KEY AUTO_INCREMENT,
      `id_commande` int,
      `id_produit` int,
      `nbr` int,
      `montantTOT` float,
      CONSTRAINT FOREIGN KEY (`id_produit`) REFERENCES `Produit`(`id`), 
      CONSTRAINT FOREIGN KEY (`id_commande`) REFERENCES `Commande` (`id`)   
    );
    --  CRUD FOR ProduitCommande
    -- AJOUTER 2 PRODUIT DANS COMMANDE ID=2 (DETAILCOMMANDE)
    INSERT INTO `ProduitCommande` Value(
        null,
        2,
        2,
        6,
        (2*8000)

    );
        INSERT INTO `ProduitCommande` Value(
        null,
        1,
        3,
        6,
        (3*8000)

    );


    -------------------------- ProduitPanier------------------
    CREATE TABLE `ProduitPanier`(
      `id`int PRIMARY KEY AUTO_INCREMENT,
      `id_panier` int,
      `id_produit` int,
      `nbr` int,
      `montantTOT` float,
      CONSTRAINT FOREIGN KEY (`id_panier`) REFERENCES `Panier`(`id`),
      CONSTRAINT FOREIGN KEY (`id_produit`) REFERENCES `Produit`(`id`)
    );
-- CRUD FOR ProduitPanier
-- AJOUTER 2 PRODUIT DANS PANIER ID=1 (DETAILPANIER)
INSERT INTO `ProduitPanier` VALUE(
    null,
    1,
    2,
    5,
    (5*500)
    ); 
INSERT INTO `ProduitPanier` VALUE(
    null,
    2,
    1,
    3,
     (3*456)
    );
    


-- SELECT AVOIRE LE BOUTIQUIER ET SES PRODUITS
SELECT * FROM "User" JOIN " Produit" ON User_id_Produit_id_Produit