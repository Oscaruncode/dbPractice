--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: fake_space_station; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.fake_space_station (
    fake_space_station_id integer NOT NULL,
    name character varying(30) NOT NULL,
    size_on_ly integer NOT NULL,
    ships integer NOT NULL
);


ALTER TABLE public.fake_space_station OWNER TO freecodecamp;

--
-- Name: fake_space_station_fake_space_station_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.fake_space_station_fake_space_station_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fake_space_station_fake_space_station_id_seq OWNER TO freecodecamp;

--
-- Name: fake_space_station_fake_space_station_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.fake_space_station_fake_space_station_id_seq OWNED BY public.fake_space_station.fake_space_station_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    size_on_ly integer NOT NULL,
    num_of_stars_millions integer NOT NULL,
    type character varying(10),
    belong_to_local_group boolean NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_galaxy_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_galaxy_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_galaxy_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_galaxy_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_galaxy_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    orbit_radius_on_d integer NOT NULL,
    surface_material text NOT NULL,
    satellite_of text NOT NULL,
    is_synchronous_rotation_period boolean NOT NULL,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_id_moon_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_id_moon_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_id_moon_seq OWNER TO freecodecamp;

--
-- Name: moon_id_moon_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_id_moon_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    "radius_on_r🜨" numeric NOT NULL,
    distance_from_star_on_yl numeric NOT NULL,
    is_habitable boolean,
    nearly_star text NOT NULL,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_id_planet_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_id_planet_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_id_planet_seq OWNER TO freecodecamp;

--
-- Name: planet_id_planet_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_id_planet_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    "mass_on_m🜨" numeric(5,2) NOT NULL,
    "luminosity_on_l🜨" numeric(5,2) NOT NULL,
    temperature_on_k integer NOT NULL,
    is_binary boolean NOT NULL,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_id_star_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_id_star_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_id_star_seq OWNER TO freecodecamp;

--
-- Name: star_id_star_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_id_star_seq OWNED BY public.star.star_id;


--
-- Name: fake_space_station fake_space_station_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.fake_space_station ALTER COLUMN fake_space_station_id SET DEFAULT nextval('public.fake_space_station_fake_space_station_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_galaxy_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_id_moon_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_id_planet_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_star_seq'::regclass);


--
-- Data for Name: fake_space_station; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.fake_space_station VALUES (1, 'beck', 1, 50000);
INSERT INTO public.fake_space_station VALUES (2, 'hungsetr', 2, 100000);
INSERT INTO public.fake_space_station VALUES (3, 'stradi', 10, 4031000);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Vía Láctea', 105700, 200000, 'sb', true);
INSERT INTO public.galaxy VALUES (2, 'Andrómeda', 220000, 1000000, 'sa', true);
INSERT INTO public.galaxy VALUES (3, 'Nube de Magallanes', 60000, 40000, 'sb', true);
INSERT INTO public.galaxy VALUES (4, 'Galaxia del Triángulo', 25000, 30000, 'sa', true);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 38000, 100000, 'sa', true);
INSERT INTO public.galaxy VALUES (6, 'Unlisted', 0, 0, 'NN', false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 384400, 'Rocky', 'Earth', true, 1);
INSERT INTO public.moon VALUES (2, 'Fobos', 9378, 'Rocky', 'Mars', false, 6);
INSERT INTO public.moon VALUES (3, 'Europa', 670900, 'Icy', 'Jupiter', true, 5);
INSERT INTO public.moon VALUES (4, 'Titán', 1221870, 'Icy and Rocky', 'Saturn', true, 4);
INSERT INTO public.moon VALUES (5, 'Ganímedes', 1070412, 'Icy and Rocky', 'Jupiter', true, 5);
INSERT INTO public.moon VALUES (6, 'Encélado', 238037, 'Icy and Watery', 'Saturn', true, 4);
INSERT INTO public.moon VALUES (7, 'Io', 421700, 'Rocky and Sulfurous', 'Jupiter', true, 5);
INSERT INTO public.moon VALUES (8, 'unknown1', 0, 'unknown', 'unknown', false, 12);
INSERT INTO public.moon VALUES (9, 'unknown2', 0, 'unknown', 'unknown', false, 12);
INSERT INTO public.moon VALUES (10, 'unknown3', 0, 'unknown', 'unknown', false, 12);
INSERT INTO public.moon VALUES (11, 'unknown4', 0, 'unknown', 'unknown', false, 12);
INSERT INTO public.moon VALUES (12, 'unknown5', 0, 'unknown', 'unknown', false, 12);
INSERT INTO public.moon VALUES (13, 'unknown6', 0, 'unknown', 'unknown', false, 12);
INSERT INTO public.moon VALUES (14, 'unknown7', 0, 'unknown', 'unknown', false, 12);
INSERT INTO public.moon VALUES (15, 'unknown8', 0, 'unknown', 'unknown', false, 12);
INSERT INTO public.moon VALUES (16, 'unknown9', 0, 'unknown', 'unknown', false, 12);
INSERT INTO public.moon VALUES (17, 'unknown10', 0, 'unknown', 'unknown', false, 12);
INSERT INTO public.moon VALUES (18, 'unknown11', 0, 'unknown', 'unknown', false, 12);
INSERT INTO public.moon VALUES (19, 'unknown12', 0, 'unknown', 'unknown', false, 12);
INSERT INTO public.moon VALUES (20, 'unknown13', 0, 'unknown', 'unknown', false, 12);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 0, true, 'Sun', 1);
INSERT INTO public.planet VALUES (2, 'Neptuno', 3.88, 30.05, false, 'Sol', 1);
INSERT INTO public.planet VALUES (3, 'Urano', 4.0, 19.22, false, 'Sol', 1);
INSERT INTO public.planet VALUES (4, 'Saturno', 9.45, 9.58, false, 'Sol', 1);
INSERT INTO public.planet VALUES (5, 'Júpiter', 11.2, 5.2, false, 'Sol', 1);
INSERT INTO public.planet VALUES (6, 'Marte', 0.53, 1.52, false, 'Sol', 1);
INSERT INTO public.planet VALUES (7, 'Venus', 0.95, 0.72, false, 'Sol', 1);
INSERT INTO public.planet VALUES (8, 'Kepler-22b', 2.4, 600, NULL, 'Kepler-22', 10);
INSERT INTO public.planet VALUES (9, 'TRAPPIST-1e', 0.92, 39, true, 'TRAPPIST-1', 10);
INSERT INTO public.planet VALUES (10, 'Proxima Centauri b', 1.17, 4.24, true, 'Proxima Centauri', 10);
INSERT INTO public.planet VALUES (11, 'HD 189733 b', 1.13, 63, false, 'HD 189733', 10);
INSERT INTO public.planet VALUES (12, 'UNKNOWN', 0, 0, true, 'Unlisted', 10);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1.00, 1.00, 5778, false, 1);
INSERT INTO public.star VALUES (2, 'Sirio', 2.02, 25.40, 9940, true, 1);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 11.60, 12.60, 3600, false, 2);
INSERT INTO public.star VALUES (4, 'Rigel', 23.20, 12.00, 11000, false, 2);
INSERT INTO public.star VALUES (6, 'Aldebarán', 1.70, 518.00, 3910, false, 1);
INSERT INTO public.star VALUES (7, 'Vega', 2.10, 37.00, 96, false, 1);
INSERT INTO public.star VALUES (8, 'Polaris', 5.40, 25.00, 6000, false, 1);
INSERT INTO public.star VALUES (9, 'Alfa Centauri A', 1.10, 1.50, 5800, true, 1);
INSERT INTO public.star VALUES (5, 'Antares', 12.40, 10.00, 3500, false, 6);
INSERT INTO public.star VALUES (10, 'Unlisted', 0.00, 0.00, 0, false, 6);


--
-- Name: fake_space_station_fake_space_station_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.fake_space_station_fake_space_station_id_seq', 3, true);


--
-- Name: galaxy_id_galaxy_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_galaxy_seq', 6, true);


--
-- Name: moon_id_moon_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_moon_seq', 20, true);


--
-- Name: planet_id_planet_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_planet_seq', 12, true);


--
-- Name: star_id_star_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_star_seq', 10, true);


--
-- Name: fake_space_station fake_space_station_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.fake_space_station
    ADD CONSTRAINT fake_space_station_name_key UNIQUE (name);


--
-- Name: fake_space_station fake_space_station_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.fake_space_station
    ADD CONSTRAINT fake_space_station_pkey PRIMARY KEY (fake_space_station_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

