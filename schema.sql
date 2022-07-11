/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id       INT GENERATED ALWAYS AS IDENTITY,
    name     VARCHAR(20),
    date_of_birth     DATE,
    escape_attempts     INT,
    neutered     BOOLEAN,
    weight_kg     DECIMAL,
    PRIMARY KEY(id)
);

 ALTER TABLE animals ADD species VARCHAR(25);

 ALTER TABLE animals DROP COLUMN species;

CREATE TABLE owner(
id INT GENERATED ALWAYS AS IDENTITY,
full_name VARCHAR(30),
age INT,
PRIMARY KEY(id)
);

CREATE TABLE species(
id INT GENERATED ALWAYS AS IDENTITY,
name VARCHAR(25),
PRIMARY KEY(id)
);

ALTER TABLE animals ADD species_id INT;
ALTER TABLE animals ADD FOREIGN KEY (species_id) REFERENCES species(id) ON DELETE CASCADE;

ALTER TABLE animals ADD owner_id INT;
ALTER TABLE animals ADD FOREIGN KEY (owner_id) REFERENCES owner(id) ON DELETE CASCADE;

CREATE TABLE vets(
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(25),
    age INT,
    date_of_graduation DATE,
    PRIMARY KEY(id)
);

CREATE TABLE specializations(
    id INT GENERATED ALWAYS AS IDENTITY,
    vet_id INT,
    species_id INT,
    PRIMARY KEY(id)
);

ALTER TABLE specializations ADD FOREIGN KEY (vet_id) REFERENCES vets(id) ON DELETE CASCADE;
ALTER TABLE specializations ADD FOREIGN KEY (species_id) REFERENCES species(id) ON DELETE CASCADE;

CREATE TABLE visits(
    id INT GENERATED ALWAYS AS IDENTITY,
    animals_id INT,
    vet_id INT,
    date_of_visit DATE,
    PRIMARY KEY(id)
);

ALTER TABLE visits ADD FOREIGN KEY (animals_id) REFERENCES animals(id) ON DELETE CASCADE;
ALTER TABLE visits ADD FOREIGN KEY (vet_id) REFERENCES vets(id) ON DELETE CASCADE;

ALTER TABLE owners ADD COLUMN email VARCHAR(120);