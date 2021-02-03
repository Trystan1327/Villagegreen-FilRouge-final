


DROP DATABASE villagegreen;

CREATE DATABASE villagegreen;

CREATE TABLE FOURNISSEUR(
   id_fou INT,
   fou_type VARCHAR(50),
   fou_produits VARCHAR(50),
   fou_nom VARCHAR(50),
   fou_adresse VARCHAR(50),
   fou_codepostal INT,
   fou_tel INT,
   fou_mail VARCHAR(50),
   PRIMARY KEY(id_fou)
);

CREATE TABLE categorie(
   cat_id DECIMAL(15,2),
   cat_nom VARCHAR(50),
   description VARCHAR(50),
   PRIMARY KEY(cat_id)
);

CREATE TABLE livraison(
   livraison_id VARCHAR(50),
   livraison_date DATE,
   livraison_qte INT,
   PRIMARY KEY(livraison_id)
);

CREATE TABLE commerciaux(
   commerciaux_id VARCHAR(50),
   commerciaux_nom VARCHAR(50),
   commerciaux_prenom VARCHAR(50),
   comerciaux_type VARCHAR(50),
   PRIMARY KEY(commerciaux_id)
);

CREATE TABLE Service(
   service_id INT,
   service_type VARCHAR(50),
   service_tel VARCHAR(50),
   service_prenom VARCHAR(50),
   PRIMARY KEY(service_id)
);

CREATE TABLE PRODUIT(
   pro_id INT,
   pro_libellé VARCHAR(50),
   pro_prix_ht DECIMAL(15,2),
   pro_photo VARCHAR(50),
   pro_description VARCHAR(50),
   pro_stock INT,
   pro_date_ajout DATE,
   pro_date_modif DATE,
   cat_id DECIMAL(15,2) NOT NULL,
   PRIMARY KEY(pro_id),
   FOREIGN KEY(cat_id) REFERENCES categorie(cat_id)
);

CREATE TABLE Clients(
   cli_id INT,
   cli_adresse VARCHAR(256),
   cli_codepostal VARCHAR(5),
   cli_ville VARCHAR(50),
   cli_password VARCHAR(50),
   cli_mail VARCHAR(50),
   cli_type VARCHAR(50),
   cli_nom VARCHAR(50),
   cli_adresse_facturation VARCHAR(50),
   cli_ref VARCHAR(50),
   cli_adresse_livraison VARCHAR(50),
   cli_coef DECIMAL(4,2),
   cli_prenom VARCHAR(50),
   commerciaux_id VARCHAR(50) NOT NULL,
   PRIMARY KEY(cli_id),
   FOREIGN KEY(commerciaux_id) REFERENCES commerciaux(commerciaux_id)
);

CREATE TABLE COMMANDE(
   id_cmde INT,
   cmde_date DATE,
   cmde_date_payements DATE,
   cmde_prix_ttc DECIMAL(15,2),
   cmde_adress_livraison VARCHAR(50),
   cmde_adress_facturation VARCHAR(50),
   cmde_type_payements DECIMAL(15,2),
   cli_id INT NOT NULL,
   PRIMARY KEY(id_cmde),
   FOREIGN KEY(cli_id) REFERENCES Clients(cli_id)
);

CREATE TABLE ligne_commande(
   ligne_commande_id INT,
   ligne_qte INT,
   ligne_total_commande DECIMAL(8,2),
   id_cmde INT NOT NULL,
   pro_id INT NOT NULL,
   PRIMARY KEY(ligne_commande_id),
   FOREIGN KEY(id_cmde) REFERENCES COMMANDE(id_cmde),
   FOREIGN KEY(pro_id) REFERENCES PRODUIT(pro_id)
);

CREATE TABLE approvisioner(
   id_fou INT,
   pro_id INT,
   quantité_produits INT,
   date_livraison DATE,
   date_commande DATE,
   PRIMARY KEY(id_fou, pro_id),
   FOREIGN KEY(id_fou) REFERENCES FOURNISSEUR(id_fou),
   FOREIGN KEY(pro_id) REFERENCES PRODUIT(pro_id)
);

CREATE TABLE sous_categories(
   cat_id DECIMAL(15,2),
   cat_id_1 DECIMAL(15,2),
   PRIMARY KEY(cat_id, cat_id_1),
   FOREIGN KEY(cat_id) REFERENCES categorie(cat_id),
   FOREIGN KEY(cat_id_1) REFERENCES categorie(cat_id)
);

CREATE TABLE gerer(
   id_cmde INT,
   commerciaux_id VARCHAR(50),
   PRIMARY KEY(id_cmde, commerciaux_id),
   FOREIGN KEY(id_cmde) REFERENCES COMMANDE(id_cmde),
   FOREIGN KEY(commerciaux_id) REFERENCES commerciaux(commerciaux_id)
);

CREATE TABLE accorder(
   cli_id INT,
   service_id INT,
   PRIMARY KEY(cli_id, service_id),
   FOREIGN KEY(cli_id) REFERENCES Clients(cli_id),
   FOREIGN KEY(service_id) REFERENCES Service(service_id)
);

CREATE TABLE suivre(
   livraison_id VARCHAR(50),
   ligne_commande_id INT,
   PRIMARY KEY(livraison_id, ligne_commande_id),
   FOREIGN KEY(livraison_id) REFERENCES livraison(livraison_id),
   FOREIGN KEY(ligne_commande_id) REFERENCES ligne_commande(ligne_commande_id)
);
