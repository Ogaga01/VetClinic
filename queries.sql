/*Queries that provide answers to the questions from all projects.*/

vet_clinic=# SELECT * FROM animals WHERE name LIKE '%mon';
vet_clinic=# SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
vet_clinic=# SELECT name FROM animals WHERE neutered = '1' AND escape_attempts < 3;
