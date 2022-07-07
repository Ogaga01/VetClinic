/* Populate database with sample data. */

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Agumon', '2020-02-03', 0, '1', 10.23);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Gabumon', '2018-11-15', 2, '1', 8);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Pikachu', '2021-01-07', 1, '0', 15.04);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Devimon', '2017-05-12', 5, '1', 11);

INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES 
('Charmander', '2020-02-08', 0, '0', -11), 
('Plantmon', '2021-11-15', 2, '1', -5.7), 
('Squirtle', '1993-04-02', 3, '0', -12.13), 
('Agemon', '2005-06-12', 1, '1', -45), 
('Boarmon', '2005-06-07', 7, '1', 20.4), 
('Blossom', '1998-10-13', 3, '1', 17), 
('Ditto', '2022-05-14', 4, '1', 22);

INSERT INTO owner (full_name, age) VALUES
('Sam Smith', 34),
('Jennifer Orwell', 19),
('Bob', 45 ),
('Melody Pond', 77),
('Dean Winchester', 14),
('Jodie Whittaker', 38);

INSERT INTO species (name) VALUES
('Pokemon'),
('Digimon');

BEGIN;
UPDATE animals SET species_id = 2 WHERE name LIKE '%mon';
UPDATE animals SET species_id = 1 WHERE name NOT LIKE '%mon';
COMMIT;

BEGIN;
UPDATE animals SET name = 'Angemon' WHERE name = 'Agemon';
UPDATE animals SET owner_id = 5 WHERE name IN ('Angemon', 'Boarmon');
UPDATE animals SET owner_id = 4 WHERE name IN ('Charmander', 'Squirtle', 'Blossom');
UPDATE animals SET owner_id = 3 WHERE name IN ('Devimon', 'Plantmon');
UPDATE animals SET owner_id = 2 WHERE name IN ('Gabumon', 'Pikachu');
UPDATE animals SET owner_id = 1 WHERE name = 'Agumon';
COMMIT;

INSERT INTO vets(name, age, date_of_graduation) VALUES
('William Tatcher', 45, '2000-04-23'),
('Maisy Smith', 26, '2019-01-17'),
('Stephanie Mendez', 64, '1981-05-04'),
('Jack Harkness', 38, '2008-06-08');

INSERT INTO specializations(vet_id, species_id) VALUES
(1, 1),
(3, 2),
(3, 1),
(4, 2);