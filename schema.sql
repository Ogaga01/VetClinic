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