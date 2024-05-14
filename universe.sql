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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    galaxy_type character varying(50) NOT NULL,
    distance_from_earth character varying(50),
    number_of_stars character varying(50)
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(100) NOT NULL,
    planet_id integer NOT NULL,
    surface_description text,
    radius integer NOT NULL,
    mass numeric,
    distance_from_planet integer,
    is_in_habitable_zone boolean
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: moon_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon_type (
    moon_type_id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.moon_type OWNER TO freecodecamp;

--
-- Name: moon_type_moon_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_type_moon_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_type_moon_type_id_seq OWNER TO freecodecamp;

--
-- Name: moon_type_moon_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_type_moon_type_id_seq OWNED BY public.moon_type.moon_type_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(100) NOT NULL,
    star_id integer NOT NULL,
    type character varying(50),
    mass numeric NOT NULL,
    radius numeric,
    distance_from_star numeric,
    orbital_period numeric,
    has_life boolean
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(500) NOT NULL,
    spectral_type character varying(30),
    mass numeric NOT NULL,
    radius numeric,
    age numeric,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: moon_type moon_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon_type ALTER COLUMN moon_type_id SET DEFAULT nextval('public.moon_type_moon_type_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', '100000', '100000000000');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', '2537000', '1000000000000');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', '2723000', '40000000000');
INSERT INTO public.galaxy VALUES (4, 'Messier 87', 'Elliptical', '54200000', '200000000000');
INSERT INTO public.galaxy VALUES (5, 'Messier 31', 'Spiral', '2750000', '1000000000000');
INSERT INTO public.galaxy VALUES (7, 'Whirlpool Galaxy', 'Spiral', '23000000', '100000000000');
INSERT INTO public.galaxy VALUES (8, 'Sombrero Galaxy', 'Spiral', '28000000', '80000000000');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 1, 'Rocky surface with craters', 1737, 0.012, 384400, true);
INSERT INTO public.moon VALUES (2, 'Europa', 3, 'Smooth icy surface with cracks', 1560, 0.008, 671034, true);
INSERT INTO public.moon VALUES (3, 'Titan', 2, 'Thick atmosphere with lakes of liquid methane', 2575, 0.022, 1221870, true);
INSERT INTO public.moon VALUES (4, 'Ganymede', 3, 'Mix of ice and rocky terrain', 2634, 0.025, 1070400, false);
INSERT INTO public.moon VALUES (5, 'Io', 3, 'Volcanic surface with sulfuric lava flows', 1821, 0.015, 421700, false);
INSERT INTO public.moon VALUES (6, 'Enceladus', 3, 'Icy surface with geysers', 252, 0.000783, 238042, true);
INSERT INTO public.moon VALUES (7, 'Triton', 5, 'Cold surface with nitrogen geysers', 1353, 0.00358, 354759, false);
INSERT INTO public.moon VALUES (8, 'Phobos', 3, 'Irregular shape with heavily cratered surface', 11, 0.0000000108, 9378, false);
INSERT INTO public.moon VALUES (9, 'Deimos', 3, 'Rocky surface with crater chains', 6, 0.0000000024, 23459, false);
INSERT INTO public.moon VALUES (10, 'Titan II', 2, 'Similar to Titan but with less atmosphere', 2635, 0.02345, 1218700, false);
INSERT INTO public.moon VALUES (11, 'Callisto II', 3, 'Heavily cratered surface with ice patches', 2410, 0.018, 1882700, false);
INSERT INTO public.moon VALUES (12, 'Lapetus II', 2, 'Dark surface with bright patches', 1469, 0.005, 3560820, false);
INSERT INTO public.moon VALUES (13, 'Miranda', 4, 'Tectonically fractured surface', 236, 0.00067, 129390, false);
INSERT INTO public.moon VALUES (14, 'Ganymede II', 3, 'Mix of ice and rocky terrain', 2634, 0.025, 1070400, false);
INSERT INTO public.moon VALUES (15, 'Dione', 3, 'Heavily cratered surface with ice cliffs', 561, 0.000123, 377396, false);
INSERT INTO public.moon VALUES (16, 'Oberon', 5, 'Heavily cratered surface with icy plains', 761, 0.00305, 583520, false);
INSERT INTO public.moon VALUES (17, 'Tethys', 3, 'Smooth icy surface with impact craters', 531, 0.000061, 294619, false);
INSERT INTO public.moon VALUES (18, 'Europa II', 3, 'Smooth icy surface with cracks', 1560, 0.008, 671034, true);
INSERT INTO public.moon VALUES (19, 'Phoebe', 5, 'Irregular shape with heavily cratered surface', 107, 0.00000083, 12947918, false);
INSERT INTO public.moon VALUES (20, 'Charon', 1, 'Smooth icy surface with chasms', 606, 0.000254, 19591, false);


--
-- Data for Name: moon_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon_type VALUES (1, 'Rocky', 'Moons with primarily rocky surfaces, often characterized by craters.');
INSERT INTO public.moon_type VALUES (2, 'Ice', 'Moons with icy surfaces, often exhibiting cracks and frozen landscapes.');
INSERT INTO public.moon_type VALUES (3, 'Volcanic', 'Moons with active volcanoes and volcanic activity on their surfaces.');
INSERT INTO public.moon_type VALUES (4, 'Terrestrial', 'Moons with characteristics similar to terrestrial planets, including atmospheres and geological features.');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 'Terrestrial', 1.0, 1.0, 1, 365.25, true);
INSERT INTO public.planet VALUES (2, 'Jupiter', 1, 'Gas Giant', 317.8, 11.2, 5.2, 4333, false);
INSERT INTO public.planet VALUES (3, 'Mars', 1, 'Terrestrial', 0.11, 0.53, 1.5, 687, false);
INSERT INTO public.planet VALUES (4, 'Kepler-186f', 4, 'Terrestrial', 0.1, 0.5, 0.35, 130, true);
INSERT INTO public.planet VALUES (5, 'Neptune', 5, 'Ice Giant', 17.1, 3.9, 30.1, 60190, false);
INSERT INTO public.planet VALUES (6, 'Venus', 1, 'Terrestrial', 0.815, 0.95, 0.723, 224.7, false);
INSERT INTO public.planet VALUES (7, 'Mercury', 1, 'Terrestrial', 0.055, 0.383, 0.39, 88.0, false);
INSERT INTO public.planet VALUES (8, 'Saturn', 1, 'Gas Giant', 95.2, 9.45, 9.58, 10759, false);
INSERT INTO public.planet VALUES (9, 'Uranus', 1, 'Ice Giant', 14.5, 4.01, 19.22, 30685, false);
INSERT INTO public.planet VALUES (10, 'Pluto', 1, 'Dwarf', 0.0146, 0.186, 39.48, 90560, false);
INSERT INTO public.planet VALUES (12, 'Kepler-62e', 7, 'Terrestrial', 0.17, 1.61, 0.12, 122.4, true);
INSERT INTO public.planet VALUES (34, 'Venus II', 1, 'Terrestrial', 0.815, 0.95, 0.723, 224.7, false);
INSERT INTO public.planet VALUES (35, 'Mercury II', 1, 'Terrestrial', 0.055, 0.383, 0.39, 88.0, false);
INSERT INTO public.planet VALUES (36, 'Saturn II', 1, 'Gas Giant', 95.2, 9.45, 9.58, 10759, false);
INSERT INTO public.planet VALUES (37, 'Uranus II', 1, 'Ice Giant', 14.5, 4.01, 19.22, 30685, false);
INSERT INTO public.planet VALUES (38, 'Pluto II', 1, 'Dwarf', 0.0146, 0.186, 39.48, 90560, false);
INSERT INTO public.planet VALUES (39, 'HD 209458 b II', 7, 'Gas Giant', 0.69, 1.35, 0.0475, 3.5, false);
INSERT INTO public.planet VALUES (40, 'Kepler-62e II', 7, 'Terrestrial', 0.17, 1.61, 0.12, 122.4, true);
INSERT INTO public.planet VALUES (41, 'Gliese 581 c', 8, 'Terrestrial', 0.028, 0.77, 0.146, 12.9, true);
INSERT INTO public.planet VALUES (42, 'Gliese 581 d', 8, 'Terrestrial', 0.027, 1.18, 0.22, 66.8, true);
INSERT INTO public.planet VALUES (43, 'Gliese 581 g', 8, 'Terrestrial', 0.0138, 1.3, 0.146, 37.0, true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'G2V', 1.0, 1.0, 4600000000, 1);
INSERT INTO public.star VALUES (2, 'Betelgeuse', 'M1Ib', 15, 887, 8600000, 1);
INSERT INTO public.star VALUES (3, 'Sirius', 'A1V', 2.1, 1.7, 240000000, 1);
INSERT INTO public.star VALUES (4, 'Proxima Centauri', 'M5.5Ve', 0.123, 0.141, 4020000000, 1);
INSERT INTO public.star VALUES (5, 'Alpha Centauri A', 'G2V', 1.1, 1.2, 6000000000, 1);
INSERT INTO public.star VALUES (7, 'Alpha Centauri C', 'M5.5Ve', 0.123, 0.17, 5610000000, 1);
INSERT INTO public.star VALUES (8, 'Barnard''s Star', 'M4.0V', 0.144, 0.196, 7860000000, 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 8, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: moon_type_moon_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_type_moon_type_id_seq', 4, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 43, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 8, true);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: moon_type moon_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon_type
    ADD CONSTRAINT moon_type_pkey PRIMARY KEY (moon_type_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy unique_galaxy_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_galaxy_name UNIQUE (name);


--
-- Name: moon unique_moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon_name UNIQUE (name);


--
-- Name: moon_type unique_moontype_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon_type
    ADD CONSTRAINT unique_moontype_name UNIQUE (name);


--
-- Name: galaxy unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_name UNIQUE (name);


--
-- Name: planet unique_planet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet_name UNIQUE (name);


--
-- Name: star unique_star_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_name UNIQUE (name);


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

