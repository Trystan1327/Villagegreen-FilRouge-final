
------------------------------------
-- Allimenter la base tests
------------------------------------


INSERT INTO `clients`(`cli_id`, `cli_ref`, `cli_nom`,`cli_prenom`, `cli_adresse`,`cli_codepostal`, `cli_ville`, `cli_coef`,`cli_password`, `cli_mail`, `cli_type`, 
 `cli_adresse_facturation`,  `cli_adresse_livraison`, `commerciaux_id`)
 VALUES (1,'aze22','café','John','1 rue Poulainville afpa',80000,'Amiens' ,1,'mdp555','visiteur@mail.com','Particulier','10 rue Poulainville','10 rue Poulainville',1),
 		(2,'aze23','michael','jordan','2 rue Poulainville afpa',80000,'Amiens' ,1,'mdp555','visiteur2@mail.com','Particulier','11 rue Poulainville','11 rue Poulainville',2),
        (3,'aze24','konoha','azuma','3 rue Poulainville afpa',80000,'Amiens' ,1,'mdp555','visiteur3@mail.com','Particulier','12 rue Poulainville','12 rue Poulainville',3),
        (4,'aze25','gummn','gally','4 rue Poulainville afpa',80000,'Amiens' ,1,'mdp555','visiteur4@mail.com','Particulier','13 rue Poulainville','13 rue Poulainville',4),
        (5,'aze26','Dave','loper','5 rue Poulainville afpa',80000,'Amiens' ,1,'mdp555','visiteur5@mail.com','Particulier','14 rue Poulainville','14 rue Poulainville',5)
      