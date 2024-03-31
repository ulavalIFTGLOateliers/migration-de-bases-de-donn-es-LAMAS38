USE atelier_bd;

-- Rollback des mises à jour sur les données de musician
UPDATE musician
SET role = NULL,
    bandName = NULL;

-- Suppression des nouvelles colonnes ajoutées à musician
ALTER TABLE musician
DROP COLUMN role,
DROP COLUMN bandName;

-- Rollback du renommage de la table musician en singer
RENAME TABLE musician TO singer;

-- Rollback des changements de nom de colonne dans la table singer
ALTER TABLE singer RENAME COLUMN musicianName TO singerName;

-- Suppression de la nouvelle table band
DROP TABLE band;

-- Rollback des changements sur les contraintes de clé étrangère de la table album
ALTER TABLE album
DROP FOREIGN KEY FK_A_musicianName;

ALTER TABLE album
ADD CONSTRAINT FK_A_singerName
FOREIGN KEY (singerName) REFERENCES singer(singerName);
