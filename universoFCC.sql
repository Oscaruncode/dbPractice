psql --username=freecodecamp --dbname=postgres

CREATE DATABASE universe;
\c universe

CREATE TABLE galaxy (
    id_galaxy SERIAL PRIMARY KEY,
    name varchar(30) NOT NULL UNIQUE,
	size_on_ly INT NOT NULL,
num_of_stars_millions INT NOT NULL,
type varchar(10),
belong_to_local_group BOOLEAN NOT NULL;

);

CREATE TABLE star (
    id_star SERIAL PRIMARY KEY,
    name varchar(30) NOT NULL UNIQUE
);

CREATE TABLE planet (
    id_planet SERIAL PRIMARY KEY,
    name varchar(30) NOT NULL UNIQUE
);

CREATE TABLE moon (
    id_moon SERIAL PRIMARY KEY,
    name varchar(30) NOT NULL UNIQUE
);



-- Tabla star
ALTER TABLE star ADD COLUMN mass_on_M🜨 NUMERIC(5,2) NOT NULL;
ALTER TABLE star ADD COLUMN luminosity_on_L🜨 NUMERIC(5,2) NOT NULL;
ALTER TABLE star ADD COLUMN temperature_on_K INT NOT NULL;
ALTER TABLE star ADD COLUMN is_binary BOOLEAN NOT NULL;

-- Tabla planet
ALTER TABLE planet ADD COLUMN radius_on_R🜨 NUMERIC NOT NULL;
ALTER TABLE planet ADD COLUMN distance_from_star_on_yl NUMERIC NOT NULL;
ALTER TABLE planet ADD COLUMN is_habitable BOOLEAN ;
ALTER TABLE planet ADD COLUMN nearly_star TEXT NOT NULL;

-- Tabla moon
ALTER TABLE moon ADD COLUMN orbit_radius_on_d INT NOT NULL;
ALTER TABLE moon ADD COLUMN surface_material TEXT NOT NULL;
ALTER TABLE moon ADD COLUMN satellite_of TEXT NOT NULL;
ALTER TABLE moon ADD COLUMN is_synchronous_rotation_period BOOLEAN NOT NULL;


-- Foreign keys
ALTER TABLE star ADD COLUMN galaxy_id INT REFERENCES galaxy(id_galaxy);
ALTER TABLE planet ADD COLUMN star_id INT REFERENCES star(id_star);
ALTER TABLE moon ADD COLUMN planet_id INT REFERENCES planet(id_planet);

INSERT INTO galaxy (name, size_on_ly, num_of_stars_millions , type, belong_to_local_group)
VALUES
('Vía Láctea', 105700, 200000, 'sb' , true),
('Andrómeda', 220000, 1000000) 'sa', true),
('Nube de Magallanes',60000,40000, 'sb',true ),
('Galaxia del Triángulo',25000,30000,'sa',true),
('Whirlpool',38000,100000,'sa',true );


INSERT INTO planet (name, radius_on_R🜨, distance_from_star_on_yl,is_habitable, nearly_star)
VALUES
('Earth', 1, 0.000016, true, 'Sun'),
('Neptuno', 3.88, 30.05, false, 'Sol'),
('Urano', 4.0, 19.22, false, 'Sol'),
('Saturno', 9.45, 9.58, false, 'Sol'),
('Júpiter', 11.2, 5.2, false, 'Sol'),
('Marte', 0.53, 1.52, false, 'Sol'),
('Venus', 0.95, 0.72, false, 'Sol'),
('Kepler-22b', 2.4, 600, NULL, 'Kepler-22'),
('TRAPPIST-1e', 0.92, 39, true, 'TRAPPIST-1'),
('Proxima Centauri b', 1.17, 4.24, true, 'Proxima Centauri'),
('HD 189733 b', 1.13, 63, false, 'HD 189733');



INSERT INTO moon (name, orbit_radius_on_d, satellite_of, surface_material, is_synchronous_rotation_period)
VALUES
('Luna', 384400, 'Earth', 'Rocky', true),
('Fobos', 9378, 'Mars', 'Rocky', false),
('Europa', 670900, 'Jupiter', 'Icy', true),
('Titán', 1221870, 'Saturn', 'Icy and Rocky', true),
('Ganímedes', 1070412, 'Jupiter', 'Icy and Rocky', true),
('Encélado', 238037, 'Saturn', 'Icy and Watery', true),
('Io', 421700, 'Jupiter', 'Rocky and Sulfurous', true);



INSERT INTO star (name, mass_on_M🜨, luminosity_on_L🜨, temperature_on_K, is_binary)
VALUES
('Sun', 1.00, 1.00, 5778, false),
('Sirio', 2.02, 25.4, 9940, true),
('Betelgeuse', 11.6, 126000, 3600, false),
('Rigel', 23.2, 120000, 11000, false),
('Antares', 12.4, 10000, 3500, false),
('Aldebarán', 1.7, 518, 3910, false),
('Vega', 2.1, 37, 9600, false),
('Polaris', 5.4, 2500, 6000, false),
('Alfa Centauri A', 1.1, 1.5, 5800, true),
('Betelgeuse', 20, 140000, 3600, false);

