/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon';
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT name FROM animals WHERE neutered = '1' AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name LIKE 'Agumon' OR name LIKE 'Pikachu';
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = '1';
SELECT * FROM animals WHERE name NOT LIKE 'Gabumon';
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

BEGIN;
UPDATE animals SET species = 'unspecified';
COMMIT;

BEGIN;
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
UPDATE animals SET species = 'pokemon' WHERE species = 'unspecified';
COMMIT;

BEGIN;
DROP TABLE animals;
ROLLBACK;

BEGIN;
DELETE FROM animals WHERE date_of_birth >= '2022-01-01';
SAVEPOINT SAVE1;
UPDATE animals SET weight_kg = weight_kg * -1;
ROLLBACK TO SAVE1;
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
COMMIT;

SELECT COUNT(*) FROM animals;

SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;

SELECT AVG(weight_kg) FROM animals;

SELECT COUNT(escape_attempts) FROM animals GROUP BY neutered;

SELECT MAX(weight_kg) FROM animals GROUP BY species;

SELECT MIN(weight_kg) FROM animals GROUP BY species;

SELECT AVG(escape_attempts) FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31' GROUP BY species;

SELECT name, owner_id, full_name
FROM animals
FULL JOIN owner
ON animals.owner_id = owner.id
WHERE full_name = 'Melody Pond';

SELECT animals.name, species.name
FROM animals
FULL JOIN species
ON animals.species_id = species.id
WHERE species.id = 1;

SELECT name, full_name
FROM animals
FULL JOIN owner
ON animals.owner_id = owner.id;

SELECT COUNT(species_id), species.name
FROM animals
FULL JOIN species
ON animals.species_id = species.id
GROUP BY species.name;

SELECT name, owner.id, full_name
FROM animals
FULL JOIN owner
ON animals.owner_id = owner.id
WHERE full_name = 'Jennifer Orwell';

SELECT name, owner.id, full_name
FROM animals
FULL JOIN owner
ON animals.owner_id = owner.id
WHERE owner.id = 5 AND escape_attempts = 0;

SELECT COUNT(name), full_name
FROM animals
FULL JOIN owner
ON animals.owner_id = owner.id
GROUP BY full_name;

SELECT animals.name, vet_id, vets.name, date_of_visit
FROM visits 
FULL JOIN animals
ON animals.id = visits.animals_id
FULL JOIN vets
ON vets.id = visits.vet_id
WHERE  vets.name = 'William Tatcher'
ORDER BY date_of_visit DESC
LIMIT 1;

SELECT COUNT(animals.name), vets.name
FROM visits
FULL JOIN animals
ON animals.id = visits.animals_id
FULL JOIN vets
ON vets.id = visits.vet_id
WHERE vets.name = 'Stephanie Mendez'
GROUP BY vets.name;

SELECT vets.name, species.name, species_id
FROM specializations
FULL JOIN vets
ON specializations.vet_id = vets.id
FULL JOIN species
ON specializations.species_id = species.id;

SELECT animals.name, vets.name, date_of_visit
FROM visits
FULL JOIN animals
ON animals.id = visits.animals_id
FULL JOIN vets
ON vets.id = visits.vet_id
WHERE vets.name = 'Stephanie Mendez'
AND date_of_visit BETWEEN '2020-04-01' AND '2020-08-30';

SELECT COUNT(animals_id), animals.name
FROM visits
FULL JOIN animals
ON animals.id = visits.animals_id
FULL JOIN vets
ON vets.id = visits.vet_id
GROUP BY animals.name;

SELECT animals.id, animals.name AS Animal, vet_id, vets.name AS Vet, species_id, date_of_visit
FROM visits 
FULL JOIN animals
ON animals.id = visits.animals_id
FULL JOIN vets
ON vets.id = visits.vet_id
ORDER BY date_of_visit DESC
LIMIT 1;

SELECT vets.name AS "Vet Name", species.name AS "Specialties" FROM vets
LEFT JOIN specializations
ON vets.id = specializations.vet_id
LEFT JOIN species
ON specializations.species_id = species.id;

SELECT vets.name, COUNT(visits.date_of_visit) FROM vets
JOIN visits
ON vets.id = visits.vet_id
WHERE vets.name = 'Maisy Smith'
GROUP BY vets.name;

SELECT animals.id, animals.name AS Animal, vet_id, vets.name AS Vet, species_id, date_of_visit
FROM visits
FULL JOIN animals
ON animals.id = visits.animals_id
FULL JOIN vets
ON vets.id = visits.vet_id
WHERE vets.name = 'Maisy Smith';

SELECT COUNT(*) FROM visits where animal_id = 4;

SELECT * FROM visits where vet_id = 2;




