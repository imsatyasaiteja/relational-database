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

SELECT pg_catalog.set_config ('search_path', '', false);

SET check_function_bodies = false;

SET xmloption = content;

SET client_min_messages = warning;

SET row_security = off;

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe
WITH
    TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';

ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe 

SET statement_timeout = 0;

SET lock_timeout = 0;

SET idle_in_transaction_session_timeout = 0;

SET client_encoding = 'UTF8';

SET standard_conforming_strings = on;

SELECT pg_catalog.set_config ('search_path', '', false);

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
    name character varying(10) NOT NULL,
    age_in_millions_of_years numeric(5, 1),
    description text,
    priority integer
);

ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq AS integer START
WITH
    1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;

ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;

--
-- Name: galaxy_planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_planet (
    planet_id integer,
    galaxy_id integer,
    name character varying(10) NOT NULL,
    galaxy_planet_id integer NOT NULL
);

ALTER TABLE public.galaxy_planet OWNER TO freecodecamp;

--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(10) NOT NULL,
    is_spherical boolean,
    age_in_millions_of_years numeric(4, 1),
    planet_id integer
);

ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq AS integer START
WITH
    1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;

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
    name character varying(10) NOT NULL,
    is_spherical boolean,
    has_life boolean,
    distance_from_earth numeric(4, 1),
    age_in_millions_of_years numeric(4, 1),
    star_id integer
);

ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_moon_planet_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_moon_planet_moon_id_seq AS integer START
WITH
    1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;

ALTER TABLE public.planet_moon_planet_moon_id_seq OWNER TO freecodecamp;

--
-- Name: planet_moon_planet_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_moon_planet_moon_id_seq OWNED BY public.galaxy_planet.galaxy_planet_id;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq AS integer START
WITH
    1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;

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
    name character varying(10) NOT NULL,
    description text,
    distance_from_earth numeric(4, 1),
    age_in_millions_of_years numeric(4, 1),
    galaxy_id integer,
    priority integer
);

ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq AS integer START
WITH
    1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;

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
-- Name: galaxy_planet galaxy_planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_planet ALTER COLUMN galaxy_planet_id SET DEFAULT nextval('public.planet_moon_planet_moon_id_seq'::regclass);

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
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'milkyway', 1.1, 'milk', 1);

INSERT INTO public.galaxy VALUES ( 2, 'coffeeway', 1.2, 'coffee', 2 );

INSERT INTO public.galaxy VALUES (3, 'teaway', 1.3, 'tea', 3);

INSERT INTO public.galaxy VALUES ( 4, 'chocoway', 1.4, 'choco', 4 );

INSERT INTO public.galaxy VALUES ( 5, 'butterway', 1.5, 'butter', 5 );

INSERT INTO public.galaxy VALUES (6, 'iceway', 1.6, 'ice', 6);

--
-- Data for Name: galaxy_planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_planet VALUES (5, 1, 'jupy_milk', 1);

INSERT INTO public.galaxy_planet VALUES (3, 2, 'eart_cof', 2);

INSERT INTO public.galaxy_planet VALUES (1, 4, 'merc_choc', 3);

--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'one', true, 1.1, 5);

INSERT INTO public.moon VALUES (2, 'two', true, 1.2, 5);

INSERT INTO public.moon VALUES (3, 'three', false, 1.3, 1);

INSERT INTO public.moon VALUES (4, 'four', false, 1.4, 4);

INSERT INTO public.moon VALUES (5, 'five', true, 1.5, 5);

INSERT INTO public.moon VALUES (6, 'six', false, 1.6, 6);

INSERT INTO public.moon VALUES (7, 'seven', true, 1.7, 7);

INSERT INTO public.moon VALUES (8, 'eight', false, 1.8, 8);

INSERT INTO public.moon VALUES (9, 'nine', true, 1.9, 9);

INSERT INTO public.moon VALUES (10, 'ten', false, 1.0, 10);

INSERT INTO public.moon VALUES (11, 'eleven', true, 1.1, 11);

INSERT INTO public.moon VALUES (12, 'twelve', true, 1.2, 12);

INSERT INTO public.moon VALUES (13, 'thirteen', false, 1.3, 1);

INSERT INTO public.moon VALUES (14, 'fourteen', false, 1.4, 4);

INSERT INTO public.moon VALUES (15, 'fifteen', true, 1.5, 5);

INSERT INTO public.moon VALUES (16, 'sixteen', false, 1.6, 6);

INSERT INTO public.moon VALUES (17, 'seventeen', true, 1.7, 7);

INSERT INTO public.moon VALUES (18, 'eighteen', false, 1.8, 8);

INSERT INTO public.moon VALUES (19, 'nineteen', true, 1.9, 9);

INSERT INTO public.moon VALUES (20, 'twenty', false, 1.0, 10);

--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO
    public.planet
VALUES (
        1,
        'mercury',
        true,
        true,
        1.1,
        2.1,
        1
    );

INSERT INTO
    public.planet
VALUES (
        2,
        'venus',
        false,
        false,
        1.2,
        2.2,
        1
    );

INSERT INTO
    public.planet
VALUES (
        3,
        'earth',
        true,
        true,
        1.3,
        2.3,
        1
    );

INSERT INTO
    public.planet
VALUES (
        4,
        'mars',
        false,
        false,
        1.4,
        2.4,
        1
    );

INSERT INTO
    public.planet
VALUES (
        5,
        'jupyter',
        true,
        true,
        1.5,
        2.5,
        2
    );

INSERT INTO
    public.planet
VALUES (
        6,
        'saturn',
        false,
        false,
        1.6,
        2.6,
        2
    );

INSERT INTO
    public.planet
VALUES (
        7,
        'uranus',
        true,
        true,
        1.7,
        2.7,
        3
    );

INSERT INTO
    public.planet
VALUES (
        8,
        'neptune',
        false,
        false,
        1.8,
        2.8,
        3
    );

INSERT INTO
    public.planet
VALUES (
        9,
        'pluto',
        true,
        true,
        1.9,
        2.9,
        5
    );

INSERT INTO
    public.planet
VALUES (
        10,
        'finetune',
        false,
        false,
        1.0,
        2.0,
        5
    );

INSERT INTO
    public.planet
VALUES (
        11,
        'fluto',
        true,
        true,
        1.1,
        2.1,
        4
    );

INSERT INTO
    public.planet
VALUES (
        12,
        'fars',
        false,
        false,
        1.2,
        2.2,
        4
    );

--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO
    public.star
VALUES (
        1,
        'megastar',
        'mega',
        1.1,
        2.1,
        1,
        1
    );

INSERT INTO
    public.star
VALUES (
        2,
        'rebelstar',
        'rebel',
        1.2,
        2.2,
        1,
        2
    );

INSERT INTO
    public.star
VALUES (
        3,
        'superstar',
        'super',
        1.3,
        2.3,
        1,
        3
    );

INSERT INTO
    public.star
VALUES (
        4,
        'risestar',
        'rise',
        1.4,
        2.4,
        2,
        4
    );

INSERT INTO
    public.star
VALUES (
        5,
        'burnstar',
        'burn',
        1.5,
        2.5,
        4,
        5
    );

INSERT INTO public.star VALUES ( 6, 'flystar', 'fly', 1.6, 2.6, 6, 6 );

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval ( 'public.galaxy_galaxy_id_seq', 1, false );

--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval ( 'public.moon_moon_id_seq', 1, false );

--
-- Name: planet_moon_planet_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval (
        'public.planet_moon_planet_moon_id_seq', 1, false
    );

--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval ( 'public.planet_planet_id_seq', 1, false );

--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval ( 'public.star_star_id_seq', 1, false );

--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);

--
-- Name: galaxy_planet galaxy_planet_id_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_planet
ADD CONSTRAINT galaxy_planet_id_unique UNIQUE (galaxy_planet_id);

--
-- Name: galaxy_planet galaxy_planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_planet
ADD CONSTRAINT galaxy_planet_pkey PRIMARY KEY (galaxy_planet_id);

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
-- Name: galaxy unique_galaxy_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
ADD CONSTRAINT unique_galaxy_id UNIQUE (galaxy_id);

--
-- Name: moon unique_moon_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
ADD CONSTRAINT unique_moon_id UNIQUE (moon_id);

--
-- Name: planet unique_planet_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
ADD CONSTRAINT unique_planet_id UNIQUE (planet_id);

--
-- Name: star unique_star_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
ADD CONSTRAINT unique_star_id UNIQUE (star_id);

--
-- Name: galaxy_planet galaxy_planet_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_planet
ADD CONSTRAINT galaxy_planet_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy (galaxy_id);

--
-- Name: galaxy_planet galaxy_planet_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_planet
ADD CONSTRAINT galaxy_planet_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet (planet_id);

--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet (planet_id);

--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star (star_id);

--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy (galaxy_id);

--
-- PostgreSQL database dump complete
--