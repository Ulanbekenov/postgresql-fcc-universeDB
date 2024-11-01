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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    name character varying(30) NOT NULL,
    asteroid_id integer NOT NULL,
    orbit_radius numeric,
    is_hazardous boolean,
    description text
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    name character varying(30) NOT NULL,
    galaxy_id integer NOT NULL,
    type_of_galaxy character varying(30) NOT NULL,
    radius_of_the_galaxy bigint,
    mass_of_the_galaxy numeric
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
    name character varying(30) NOT NULL,
    moon_id integer NOT NULL,
    planet_id integer,
    description text,
    has_moon boolean
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
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    name character varying(30) NOT NULL,
    planet_id integer NOT NULL,
    star_id integer,
    number_of_moons integer,
    mean_radius numeric,
    has_rings boolean
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
    name character varying(30) NOT NULL,
    star_id integer NOT NULL,
    galaxy_id integer,
    spectral_class character varying(2),
    age integer
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
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES ('Ceres', 1, 413.7, false, 'Dwarf planet and largest asteroid.');
INSERT INTO public.asteroid VALUES ('Vesta', 2, 353.5, false, 'One of the largest asteroids in the asteroid belt.');
INSERT INTO public.asteroid VALUES ('Eros', 3, 1.8, true, 'Near-Earth asteroid.');
INSERT INTO public.asteroid VALUES ('Bennu', 4, 1.1, true, 'Potentially hazardous asteroid.');
INSERT INTO public.asteroid VALUES ('Itokawa', 5, 0.3, false, 'A small near-Earth asteroid.');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES ('Milky Way', 1, 'Barred Spiral Galaxy', 19000, 1150000000000);
INSERT INTO public.galaxy VALUES ('Andromeda', 2, 'Spiral Galaxy', 22000, 1230000000000);
INSERT INTO public.galaxy VALUES ('Triangulum', 3, 'Spiral Galaxy', 6000, 150000000000);
INSERT INTO public.galaxy VALUES ('Sombrero Galaxy', 4, 'Spiral Galaxy', 50000, 800000000000);
INSERT INTO public.galaxy VALUES ('Whirlpool Galaxy', 5, 'Spiral Galaxy', 60000, 1100000000000);
INSERT INTO public.galaxy VALUES ('Pinwheel Galaxy', 6, 'Spiral Galaxy', 26000, 2000000000000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES ('Moon', 1, 1, 'The only natural satellite of Earth.', true);
INSERT INTO public.moon VALUES ('Phobos', 2, 2, 'One of the two moons of Mars.', true);
INSERT INTO public.moon VALUES ('Deimos', 3, 2, 'The second moon of Mars.', true);
INSERT INTO public.moon VALUES ('Europa', 4, 4, 'One of Jupiter’s largest moons, known for its ice-covered ocean.', true);
INSERT INTO public.moon VALUES ('Ganymede', 5, 4, 'The largest moon in the solar system, also orbits Jupiter.', true);
INSERT INTO public.moon VALUES ('Callisto', 6, 4, 'The second-largest moon of Jupiter.', true);
INSERT INTO public.moon VALUES ('Io', 7, 4, 'A volcanic moon of Jupiter, known for its active geology.', true);
INSERT INTO public.moon VALUES ('Titan', 8, 5, 'The largest moon of Saturn, known for its dense atmosphere.', true);
INSERT INTO public.moon VALUES ('Rhea', 9, 5, 'The second-largest moon of Saturn.', true);
INSERT INTO public.moon VALUES ('Iapetus', 10, 5, 'Known for its two-tone coloration and unique ridge.', true);
INSERT INTO public.moon VALUES ('Oberon', 11, 6, 'The largest moon of Uranus.', true);
INSERT INTO public.moon VALUES ('Titania', 12, 6, 'The second-largest moon of Uranus.', true);
INSERT INTO public.moon VALUES ('Miranda', 13, 6, 'Known for its extreme geological features.', true);
INSERT INTO public.moon VALUES ('Triton', 14, 7, 'The largest moon of Neptune, known for its retrograde orbit.', true);
INSERT INTO public.moon VALUES ('Nereid', 15, 7, 'Known for its eccentric orbit.', true);
INSERT INTO public.moon VALUES ('Enceladus', 16, 5, 'A small moon of Saturn, known for its geysers.', true);
INSERT INTO public.moon VALUES ('Mimas', 17, 5, 'Known for its resemblance to the Death Star from Star Wars.', true);
INSERT INTO public.moon VALUES ('Hyperion', 18, 5, 'An irregularly shaped moon of Saturn.', true);
INSERT INTO public.moon VALUES ('Charon', 19, 9, 'The largest moon of Pluto, significantly large relative to its planet.', true);
INSERT INTO public.moon VALUES ('Dione', 20, 5, 'A moon of Saturn known for its bright surface.', true);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES ('Earth', 1, 1, 1, 6371, false);
INSERT INTO public.planet VALUES ('Mars', 2, 1, 2, 3389.5, false);
INSERT INTO public.planet VALUES ('Venus', 3, 1, 0, 6051.8, false);
INSERT INTO public.planet VALUES ('Jupiter', 4, 2, 79, 69911, true);
INSERT INTO public.planet VALUES ('Saturn', 5, 2, 83, 58232, true);
INSERT INTO public.planet VALUES ('Uranus', 6, 3, 27, 25362, true);
INSERT INTO public.planet VALUES ('Neptune', 7, 3, 14, 24622, false);
INSERT INTO public.planet VALUES ('Mercury', 8, 1, 0, 2439.7, false);
INSERT INTO public.planet VALUES ('Proxima b', 9, 4, 0, 11200, false);
INSERT INTO public.planet VALUES ('Gliese 581d', 10, 4, 0, 15800, false);
INSERT INTO public.planet VALUES ('Kepler-186f', 11, 4, 0, 10900, false);
INSERT INTO public.planet VALUES ('TRAPPIST-1e', 12, 4, 0, 8900, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES ('Sirius', 1, 1, 'A1', 2000000000);
INSERT INTO public.star VALUES ('Betelgeuse', 2, 1, 'M2', 1000000000);
INSERT INTO public.star VALUES ('Polaris', 3, 3, 'F7', 50000000);
INSERT INTO public.star VALUES ('Rigel', 4, 4, 'B8', 80000000);
INSERT INTO public.star VALUES ('Vega', 5, 5, 'A0', 450000000);
INSERT INTO public.star VALUES ('M51', 6, 6, 'B3', 30000000);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 5, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


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
-- Name: planet unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_name UNIQUE (name);


--
-- Name: asteroid unique_name_ast; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT unique_name_ast UNIQUE (name);


--
-- Name: moon unique_name_moon; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_name_moon UNIQUE (name);


--
-- Name: star unique_star_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_name UNIQUE (name);


--
-- Name: star fk_galaxy_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy_id FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon fk_planet_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet_id FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_star_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star_id FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

