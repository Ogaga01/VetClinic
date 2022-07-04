/*Queries that provide answers to the questions from all projects.*/

vet_clinic=# SELECT * FROM animals WHERE name LIKE '%mon';
vet_clinic=# SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
vet_clinic=# SELECT name FROM animals WHERE neutered = '1' AND escape_attempts < 3;
vet_clinic=# SELECT date_of_birth FROM animals WHERE name LIKE 'Agumon' OR name LIKE 'Pikachu';
vet_clinic=# SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
vet_clinic=# SELECT * FROM animals WHERE neutered = '1';
vet_clinic=#  SELECT * FROM animals WHERE name NOT LIKE 'Gabumon';