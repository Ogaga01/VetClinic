/* Populate database with sample data. */

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Agumon', '2020-02-03', 0, '1', 10.23);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Gabumon', '2018-11-15', 2, '1', 8);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Pikachu', '2021-01-07', 1, '0', 15.04);
 INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Devimon', '2017-05-12', 5, '1', 11);
 ALTER TABLE animals ADD species VARCHAR(25);
 INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES 
 ('Charmander', '2020-02-08', 0, '0', -11), 
 ('Plantmon', '2021-11-15', 2, '1', -5.7), 
 ('Squirtle', '1993-04-02', 3, '0', -12.13), 
 ('Agemon', '2005-06-12', 1, '1', -45), 
 ('Boarmon', '2005-06-07', 7, '1', 20.4), 
 ('Blossom', '1998-10-13', 3, '1', 17), 
 ('Ditto', '2022-05-14', 4, '1', 22);

 BEGIN;
 UPDATE animals SET species = 'unspecified';
 COMMIT;

 BEGIN;
 UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
 UPDATE animals SET species = 'pokemon' WHERE species = 'unspecified';
 COMMIT;

 BEGIN;
 DROP TABLE;
 ROLLBACK;

 BEGIN;
 DELETE FROM animals WHERE date_of_birth > '2022-01-01';
 SAVEPOINT SAVE1;
 UPDATE animals SET weight_kg = weight_kg * -1;
 ROLLBACK TO SAVE1;
 UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
 COMMIT;

 SELECT COUNT(*) FROM animals;

 SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;

SELECT AVG(weight_kg) FROM animals;

SELECT COUNT(escape_attempts) FROM animals GROUP BY neutered;