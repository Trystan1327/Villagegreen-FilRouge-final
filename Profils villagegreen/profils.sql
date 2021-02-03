-------------------------------
-- Création du Rôle visiteur 
-------------------------------

CREATE ROLE IF NOT EXISTS  'villagegreen_visiteur'@'localhost';

-------------------------------------------------------------------------------
--  Ajouter le privilège de lecture sur la table produit au rôle  visiteur
------------------------------------------------------------------------------

GRANT SELECT
ON villagegreen.produit
TO 'villagegreen_visiteur'@'localhost';

----------------------------------------------------
--  Attribuer le rôle aux profils visiteur 
----------------------------------------------------

GRANT villagegreen_visiteur
TO 'profil_visiteur'@'localhost' 

------------------------------------------------------------------------
--  Profil visiteur donner le privilège de lecture sur la table produit
------------------------------------------------------------------------

CREATE USER 'profil_visiteur'@'%' IDENTIFIED BY 'mdp555'

GRANT SELECT
ON villagegreen.produit
TO profil_visiteur
IDENTIFIED BY 'mdp555'

-----------------------------------------------------------------------------------------------
-- Profil client : lecture sur toute la base (insertion et mise à jour dans commande et client)  
-----------------------------------------------------------------------------------------------
CREATE USER 'profil_client'@'%' IDENTIFIED BY 'mdp888'


--**** Droit de lecture sur toute la base ****--

GRANT SELECT
ON *
TO profil_client
IDENTIFIED BY 'mdp888'

--**** Droit d'insertion et mise à jour des tables commandes et  client ****--

GRANT INSERT, UPDATE             -- Table Commande --
ON villagegreen.commandes
TO profil_client
IDENTIFIED BY 'mdp888'

GRANT INSERT, UPDATE              -- Table Clients
ON villagegreen.client
TO profil_client
IDENTIFIED BY 'mdp888'

-------------------------------------------------
-- Profil gestion : lecture/écriture dans la base 
-------------------------------------------------

CREATE USER 'profil_gestion'@'%' IDENTIFIED BY 'mdp999'

GRANT SELECT,INSERT,UPDATE
ON *
TO profil_gestion
IDENTIFIED BY 'mdp999';


-------------------------------------------------------------------------------------------
-- Profil administrateur (ou développeur) : comme gestion + création et suppression d'objet 
-------------------------------------------------------------------------------------------

CREATE USER 'profil_admin'@'%' IDENTIFIED BY 'mdp777'

REVOKE INSERT, UPDATE, DELETE 
ON afpa_gescom.suppliers
TO profil_admin
IDENTIFIED BY 'mdp777'