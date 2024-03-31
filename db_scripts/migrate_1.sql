USE atelier_bd;
ALTER TABLE singer RENAME COLUMN singerName TO musicianName;
ALTER TABLE singer ADD role VARCHAR(50);
ALTER TABLE singer ADD bandName VARCHAR(50);

ALTER TABLE singer RENAME TO musician;
--RENAME TABLE ancien_nom_table TO nouveau_nom_table;

CREATE TABLE band (
    bandName VARCHAR(50) PRIMARY KEY,
    creation YEAR,
    genre VARCHAR(50)
);

-- D'abord, supprimer la contrainte de clé étrangère existante
ALTER TABLE album
DROP FOREIGN KEY FK_A_singerName;

-- Ensuite, ajouter une nouvelle contrainte avec le nouveau nom de la clé primaire
ALTER TABLE album
ADD CONSTRAINT FK_A_musicianName
FOREIGN KEY (singerName) REFERENCES musician(musicianName);


-- Insérer des données dans la table `band`
INSERT INTO band (bandName, creation, genre) VALUES
('Crazy Duo', '2015', 'rock'),
('Luna', '2009', 'classical'),
('Mysterio', '2019', 'pop');
-- Note: Remplacer les valeurs avec les informations réelles.

-- Mettre à jour les informations dans la table `musician`
UPDATE musician SET
role = CASE musicianName
    WHEN 'Alina' THEN 'vocals'
    WHEN 'Mysterio' THEN 'guitar'
    WHEN 'Rainbow' THEN 'percussion'
    WHEN 'Luna' THEN 'piano'
    -- Plus de cas pour d'autres musiciens
END,
bandName = CASE musicianName
    WHEN 'Alina' THEN 'Crazy Duo'
    WHEN 'Mysterio' THEN 'Mysterio'
    WHEN 'Rainbow' THEN 'Crazy Duo'
    WHEN 'Luna' THEN 'Luna'
    -- Plus de cas pour d'autres musiciens
END;
