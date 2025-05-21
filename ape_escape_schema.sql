
-- Création de la base de données
CREATE DATABASE ApeEscape;
USE ApeEscape;

-- Table des personnages
CREATE TABLE Personnages (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(50),
    role VARCHAR(50)
);

-- Table des niveaux
CREATE TABLE Niveaux (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(50),
    environnement VARCHAR(50)
);

-- Table des singes
CREATE TABLE Singes (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(50),
    couleurChapeau VARCHAR(20),
    niveauDanger INT,
    capturé BOOLEAN,
    niveau_id INT,
    FOREIGN KEY (niveau_id) REFERENCES Niveaux(id)
);

-- Table des gadgets
CREATE TABLE Gadgets (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(50),
    description TEXT
);

-- Table de liaison entre personnages et gadgets
CREATE TABLE PersonnageGadget (
    personnage_id INT,
    gadget_id INT,
    PRIMARY KEY (personnage_id, gadget_id),
    FOREIGN KEY (personnage_id) REFERENCES Personnages(id),
    FOREIGN KEY (gadget_id) REFERENCES Gadgets(id)
);

-- Insertion des personnages
INSERT INTO Personnages (nom, role) VALUES
('Spike', 'Héros'),
('Specter', 'Antagoniste'),
('Natalie', 'Support technique');

-- Insertion des niveaux
INSERT INTO Niveaux (nom, environnement) VALUES
('Plage Préhistorique', 'Jungle'),
('Ville du Futur', 'Urbain'),
('Château de Specter', 'Forteresse');

-- Insertion des singes
INSERT INTO Singes (nom, couleurChapeau, niveauDanger, capturé, niveau_id) VALUES
('Monkey Red', 'Rouge', 5, FALSE, 1),
('Sneaky Blue', 'Bleu', 2, TRUE, 1),
('Agent Black', 'Noir', 4, FALSE, 2),
('Professor Yellow', 'Jaune', 3, FALSE, 3);

-- Insertion des gadgets
INSERT INTO Gadgets (nom, description) VALUES
('Filet à singes', 'Permet d’attraper les singes.'),
('Radar à singes', 'Indique la position des singes.'),
('Hoola Hoop', 'Augmente la vitesse de déplacement.'),
('Fronde laser', 'Permet d’attaquer à distance.');

-- Liaison entre personnages et gadgets
INSERT INTO PersonnageGadget (personnage_id, gadget_id) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(2, 4);
