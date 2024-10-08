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
-- Name: astronaut; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.astronaut (
    astronaut_id integer NOT NULL,
    planet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    age integer NOT NULL,
    country character varying(50) NOT NULL
);


ALTER TABLE public.astronaut OWNER TO freecodecamp;

--
-- Name: astronaut_astronaut_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.astronaut_astronaut_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.astronaut_astronaut_id_seq OWNER TO freecodecamp;

--
-- Name: astronaut_astronaut_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.astronaut_astronaut_id_seq OWNED BY public.astronaut.astronaut_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    number_of_stars integer NOT NULL,
    age_in_billion_of_years numeric NOT NULL,
    CONSTRAINT galaxy_number_of_stars_check CHECK ((number_of_stars > 0))
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
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    phase character varying(20) NOT NULL,
    is_spherical boolean NOT NULL,
    distance_from_earth numeric NOT NULL
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
    planet_id integer NOT NULL,
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    has_life boolean NOT NULL,
    planet_types character varying(30) NOT NULL,
    distance_from_earth numeric NOT NULL,
    age_in_million_of_years integer NOT NULL
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
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    distance_from_earth numeric NOT NULL,
    age_in_million_of_years integer NOT NULL
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
-- Name: astronaut astronaut_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.astronaut ALTER COLUMN astronaut_id SET DEFAULT nextval('public.astronaut_astronaut_id_seq'::regclass);


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
-- Data for Name: astronaut; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.astronaut VALUES (1, 1, 'Neil Armstrong', 39, 'USA');
INSERT INTO public.astronaut VALUES (2, 1, 'Buzz Aldrin', 41, 'USA');
INSERT INTO public.astronaut VALUES (3, 1, 'Yuri Gagarin', 27, 'Russia');
INSERT INTO public.astronaut VALUES (4, 2, 'Sally Ride', 32, 'USA');
INSERT INTO public.astronaut VALUES (5, 2, 'Valentina Tereshkova', 26, 'Russia');
INSERT INTO public.astronaut VALUES (6, 3, 'Chris Hadfield', 42, 'Canada');
INSERT INTO public.astronaut VALUES (7, 4, 'John Glenn', 40, 'USA');
INSERT INTO public.astronaut VALUES (8, 5, 'Mae Jemison', 35, 'USA');
INSERT INTO public.astronaut VALUES (9, 6, 'Alan Shepard', 38, 'USA');
INSERT INTO public.astronaut VALUES (10, 7, 'Laika', 3, 'Russia');
INSERT INTO public.astronaut VALUES (11, 8, 'Scott Kelly', 50, 'USA');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our galaxy', 100000, 13.6);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Neighboring galaxy', 1000000, 10.1);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'A smaller nearby galaxy', 40000, 5.5);
INSERT INTO public.galaxy VALUES (4, 'Large Magellanic Cloud', 'Satellite galaxy of the Milky Way', 30000, 4.1);
INSERT INTO public.galaxy VALUES (5, 'Small Magellanic Cloud', 'Another satellite galaxy', 3000, 4.0);
INSERT INTO public.galaxy VALUES (6, 'Messier 81', 'Spiral galaxy', 200000, 12.0);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 1, 'Moon', 'Full', true, 0.0000158);
INSERT INTO public.moon VALUES (2, 2, 'Phobos', 'New', false, 0.0000158);
INSERT INTO public.moon VALUES (3, 2, 'Deimos', 'Crescent', false, 0.0000158);
INSERT INTO public.moon VALUES (4, 3, 'Galatea', 'Gibbous', false, 0.0000158);
INSERT INTO public.moon VALUES (5, 4, 'Proxima b Moon 1', 'Full', true, 4.24);
INSERT INTO public.moon VALUES (6, 5, 'Alpha Centauri Bb Moon 1', 'New', true, 4.37);
INSERT INTO public.moon VALUES (7, 6, 'Kepler-452b Moon 1', 'Quarter', true, 1400);
INSERT INTO public.moon VALUES (8, 7, 'Kepler-22b Moon 1', 'Gibbous', false, 587);
INSERT INTO public.moon VALUES (9, 8, 'Gliese 581g Moon 1', 'Full', true, 20.4);
INSERT INTO public.moon VALUES (10, 9, 'Kepler-186f Moon 1', 'New', true, 490);
INSERT INTO public.moon VALUES (11, 10, 'TOI-700d Moon 1', 'Crescent', true, 101.4);
INSERT INTO public.moon VALUES (12, 11, 'Barnards Star b Moon 1', 'Full', true, 6);
INSERT INTO public.moon VALUES (13, 12, 'Ross 128 b Moon 1', 'Gibbous', false, 11);
INSERT INTO public.moon VALUES (14, 1, 'Callisto', 'New', true, 0.0000158);
INSERT INTO public.moon VALUES (15, 2, 'Europa', 'Full', true, 0.0000158);
INSERT INTO public.moon VALUES (16, 3, 'Titan', 'Quarter', true, 0.0000158);
INSERT INTO public.moon VALUES (17, 4, 'Enceladus', 'Crescent', false, 4.24);
INSERT INTO public.moon VALUES (18, 5, 'Ganymede', 'Gibbous', true, 4.37);
INSERT INTO public.moon VALUES (19, 6, 'Miranda', 'Full', true, 1400);
INSERT INTO public.moon VALUES (20, 10, 'TOI-700d Moon 2', 'Waning Crescent', true, 1020000);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 1, 'Earth', true, 'Terrestrial', 0.0000158, 5000);
INSERT INTO public.planet VALUES (2, 1, 'Mars', false, 'Terrestrial', 0.0000158, 4500);
INSERT INTO public.planet VALUES (3, 1, 'Venus', false, 'Terrestrial', 0.0000158, 4000);
INSERT INTO public.planet VALUES (4, 2, 'Proxima b', false, 'Terrestrial', 4.24, 3000);
INSERT INTO public.planet VALUES (5, 2, 'Alpha Centauri Bb', false, 'Gas Giant', 4.37, 3500);
INSERT INTO public.planet VALUES (6, 3, 'Kepler-452b', false, 'Terrestrial', 1400, 6000);
INSERT INTO public.planet VALUES (7, 3, 'Kepler-22b', false, 'Gas Giant', 587, 3000);
INSERT INTO public.planet VALUES (8, 4, 'Gliese 581g', false, 'Terrestrial', 20.4, 7000);
INSERT INTO public.planet VALUES (9, 4, 'Kepler-186f', false, 'Terrestrial', 490, 4000);
INSERT INTO public.planet VALUES (10, 5, 'TOI-700d', false, 'Terrestrial', 101.4, 5000);
INSERT INTO public.planet VALUES (11, 6, 'Barnards Star b', false, 'Terrestrial', 6, 8000);
INSERT INTO public.planet VALUES (12, 6, 'Ross 128 b', false, 'Terrestrial', 11, 5000);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 1, 'Sun', 0.0000158, 4600);
INSERT INTO public.star VALUES (2, 1, 'Proxima Centauri', 4.24, 4500);
INSERT INTO public.star VALUES (3, 1, 'Alpha Centauri A', 4.37, 5500);
INSERT INTO public.star VALUES (4, 2, 'Sirius', 8.6, 3000);
INSERT INTO public.star VALUES (5, 2, 'Betelgeuse', 642.5, 8000);
INSERT INTO public.star VALUES (6, 3, 'Vega', 25.04, 455);
INSERT INTO public.star VALUES (7, 3, 'Altair', 16.73, 1000);


--
-- Name: astronaut_astronaut_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.astronaut_astronaut_id_seq', 11, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


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

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: astronaut astronaut_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.astronaut
    ADD CONSTRAINT astronaut_name_unique UNIQUE (name);


--
-- Name: astronaut astronaut_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.astronaut
    ADD CONSTRAINT astronaut_pkey PRIMARY KEY (astronaut_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_unique UNIQUE (name);


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
-- Name: moon moon_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_unique UNIQUE (name);


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
-- Name: planet planet_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_unique UNIQUE (name);


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
-- Name: star star_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_unique UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: astronaut fk_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.astronaut
    ADD CONSTRAINT fk_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--
