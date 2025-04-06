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
    name character varying(60) NOT NULL,
    age integer,
    discover_date timestamp without time zone,
    galaxy_id integer NOT NULL,
    galaxy_type_id integer
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
-- Name: galaxy_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_type (
    galaxy_type_id integer NOT NULL,
    name character varying(60) NOT NULL,
    description text
);


ALTER TABLE public.galaxy_type OWNER TO freecodecamp;

--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_type_galaxy_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_type_galaxy_type_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_type_galaxy_type_id_seq OWNED BY public.galaxy_type.galaxy_type_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    description text,
    age integer,
    name character varying(60) NOT NULL,
    planet_id integer
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
    age integer,
    distance_from_earth numeric NOT NULL,
    has_life boolean,
    name character varying(60) NOT NULL,
    moon_id integer,
    star_id integer,
    planet_type_id integer
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
-- Name: planet_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_type (
    planet_type_id integer NOT NULL,
    name character varying(60) NOT NULL,
    description text
);


ALTER TABLE public.planet_type OWNER TO freecodecamp;

--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_type_planet_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_type_planet_type_id_seq OWNER TO freecodecamp;

--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_type_planet_type_id_seq OWNED BY public.planet_type.planet_type_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(60) NOT NULL,
    age integer,
    distance_from_earth numeric NOT NULL,
    is_spherical boolean NOT NULL,
    galaxy_id integer,
    description text
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: start_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.start_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.start_star_id_seq OWNER TO freecodecamp;

--
-- Name: start_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.start_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: galaxy_type galaxy_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type ALTER COLUMN galaxy_type_id SET DEFAULT nextval('public.galaxy_type_galaxy_type_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: planet_type planet_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type ALTER COLUMN planet_type_id SET DEFAULT nextval('public.planet_type_planet_type_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.start_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES ('test', 1, '2025-10-10 00:00:00', 1, 1);
INSERT INTO public.galaxy VALUES ('Andrómeda', 10000, '0964-07-15 00:00:00', 2, 2);
INSERT INTO public.galaxy VALUES ('Messier 87', 13000, '1781-03-18 00:00:00', 3, 3);
INSERT INTO public.galaxy VALUES ('NGC 1427A', 11000, '1895-09-22 00:00:00', 4, 4);
INSERT INTO public.galaxy VALUES ('NGC 2787', 9000, '1950-04-12 00:00:00', 5, 5);
INSERT INTO public.galaxy VALUES ('Hoag''s Object', 12000, '1950-08-21 00:00:00', 6, 6);
INSERT INTO public.galaxy VALUES ('Antennae Galaxies', 14000, '1990-02-01 00:00:00', 7, 7);
INSERT INTO public.galaxy VALUES ('Vía Láctea', 13600, '0001-01-01 00:00:00', 8, 2);
INSERT INTO public.galaxy VALUES ('Triángulo', 12000, '1764-11-14 00:00:00', 9, 2);
INSERT INTO public.galaxy VALUES ('Cartwheel', 10000, '1941-06-09 00:00:00', 10, 6);
INSERT INTO public.galaxy VALUES ('NGC 520', 9500, '1825-12-05 00:00:00', 11, 7);
INSERT INTO public.galaxy VALUES ('NGC 6822', 10500, '1884-08-17 00:00:00', 12, 4);
INSERT INTO public.galaxy VALUES ('Sombrero', 13000, '1912-03-03 00:00:00', 13, 5);


--
-- Data for Name: galaxy_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_type VALUES (1, 'test', 'test');
INSERT INTO public.galaxy_type VALUES (2, 'Espiral', 'Galaxia con brazos curvos que giran alrededor de un núcleo central brillante.');
INSERT INTO public.galaxy_type VALUES (3, 'Elíptica', 'Galaxia con forma ovalada, compuesta principalmente por estrellas viejas.');
INSERT INTO public.galaxy_type VALUES (4, 'Irregular', 'Galaxia sin forma definida ni estructura clara.');
INSERT INTO public.galaxy_type VALUES (5, 'Lenticulares', 'Intermedio entre espiral y elíptica, con un disco pero sin brazos visibles.');
INSERT INTO public.galaxy_type VALUES (6, 'Anular', 'Galaxia con una región central vacía, rodeada por un anillo de estrellas.');
INSERT INTO public.galaxy_type VALUES (7, 'Interactiva', 'Galaxias en proceso de colisión o interacción gravitacional.');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (23, '1', 1, 'TEST', 18);
INSERT INTO public.moon VALUES (24, 'Luna de prueba', 1000, 'Selene', 18);
INSERT INTO public.moon VALUES (25, 'Pequeña luna rocosa', 500, 'Phobos', 19);
INSERT INTO public.moon VALUES (26, 'Luna de forma irregular', 500, 'Deimos', 19);
INSERT INTO public.moon VALUES (27, 'Gran luna helada', 300, 'Europa', 20);
INSERT INTO public.moon VALUES (28, 'Luna volcánica activa', 350, 'Ío', 20);
INSERT INTO public.moon VALUES (29, 'Luna gigante gaseosa', 400, 'Titán', 21);
INSERT INTO public.moon VALUES (30, 'Luna con océanos subterráneos', 450, 'Encélado', 21);
INSERT INTO public.moon VALUES (31, 'Luna misteriosa', 600, 'Miranda', 22);
INSERT INTO public.moon VALUES (32, 'Luna azulada', 650, 'Ariel', 22);
INSERT INTO public.moon VALUES (33, 'Luna ventosa', 700, 'Tritón', 23);
INSERT INTO public.moon VALUES (34, 'Luna retrógrada', 800, 'Nereida', 23);
INSERT INTO public.moon VALUES (35, 'Luna pequeña', 300, 'Caronte', 24);
INSERT INTO public.moon VALUES (36, 'Luna rocosa', 150, 'Kepler-22b I', 25);
INSERT INTO public.moon VALUES (37, 'Luna gaseosa', 120, 'Gliese 581g I', 26);
INSERT INTO public.moon VALUES (38, 'Luna caliente', 180, 'HD 209458 b I', 27);
INSERT INTO public.moon VALUES (39, 'Luna cercana a la estrella', 220, 'WASP-12b I', 28);
INSERT INTO public.moon VALUES (40, 'Luna potencialmente habitable', 190, 'Kepler-442b I', 29);
INSERT INTO public.moon VALUES (41, 'Luna de hielo y roca', 210, 'TRAPPIST-1e I', 30);
INSERT INTO public.moon VALUES (45, 'Luna con atmósfera tenue', 160, 'Dione', 31);
INSERT INTO public.moon VALUES (46, 'Luna con cráteres gigantes', 170, 'Rhea', 32);
INSERT INTO public.moon VALUES (47, 'Luna cubierta de metano congelado', 140, 'Oberón', 32);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (18, 4500, 0, true, 'Tierra', NULL, 1, 2);
INSERT INTO public.planet VALUES (19, 4600, 57.9, false, 'Mercurio', NULL, 1, 1);
INSERT INTO public.planet VALUES (20, 4500, 108.2, false, 'Venus', NULL, 1, 1);
INSERT INTO public.planet VALUES (21, 4500, 227.9, false, 'Marte', NULL, 1, 1);
INSERT INTO public.planet VALUES (22, 4500, 778.5, false, 'Júpiter', NULL, 1, 3);
INSERT INTO public.planet VALUES (23, 4500, 1433.5, false, 'Saturno', NULL, 1, 3);
INSERT INTO public.planet VALUES (24, 4500, 2872.5, false, 'Urano', NULL, 1, 3);
INSERT INTO public.planet VALUES (25, 4500, 4495.1, false, 'Neptuno', NULL, 1, 3);
INSERT INTO public.planet VALUES (26, 4600, 5906.4, false, 'Plutón', NULL, 1, 4);
INSERT INTO public.planet VALUES (27, 3000, 12.4, true, 'Exoplaneta Kepler-22b', NULL, 2, 2);
INSERT INTO public.planet VALUES (28, 2000, 490, false, 'Gliese 581g', NULL, 3, 2);
INSERT INTO public.planet VALUES (29, 1000, 40, false, 'HD 209458 b', NULL, 4, 5);
INSERT INTO public.planet VALUES (30, 1500, 600, false, 'WASP-12b', NULL, 5, 5);
INSERT INTO public.planet VALUES (31, 2500, 1400, false, 'Kepler-442b', NULL, 6, 2);
INSERT INTO public.planet VALUES (32, 3500, 200, false, 'TRAPPIST-1e', NULL, 7, 2);


--
-- Data for Name: planet_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_type VALUES (1, 'test', 'test');
INSERT INTO public.planet_type VALUES (2, 'Terrestre', 'Planeta rocoso con superficie sólida, similar a la Tierra.');
INSERT INTO public.planet_type VALUES (3, 'Gaseoso', 'Planeta compuesto principalmente por gases como hidrógeno y helio.');
INSERT INTO public.planet_type VALUES (4, 'Helado', 'Planeta con temperaturas extremadamente bajas y superficie congelada.');
INSERT INTO public.planet_type VALUES (5, 'Océanico', 'Planeta cubierto casi por completo de océanos líquidos.');
INSERT INTO public.planet_type VALUES (6, 'Desértico', 'Planeta árido con escasa o nula presencia de agua.');
INSERT INTO public.planet_type VALUES (7, 'Anillado', 'Planeta que posee sistemas de anillos compuestos por hielo, roca y polvo.');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'test', 1, 1, true, 1, 'test');
INSERT INTO public.star VALUES (2, 'Sol', 4600, 0, true, 7, 'Estrella del sistema solar, esencial para la vida en la Tierra.');
INSERT INTO public.star VALUES (3, 'Proxima Centauri', 4800, 4.24, true, 2, 'La estrella más cercana al Sol.');
INSERT INTO public.star VALUES (4, 'Sirius', 242, 8.6, true, 2, 'Estrella brillante en la constelación Canis Major.');
INSERT INTO public.star VALUES (5, 'Betelgeuse', 10000, 642.5, false, 2, 'Gigante roja en Orión, próxima a explotar como supernova.');
INSERT INTO public.star VALUES (6, 'Rigel', 8000, 860, true, 2, 'Estrella azul brillante también en Orión.');
INSERT INTO public.star VALUES (7, 'Vega', 455, 25, true, 3, 'Estrella principal en la constelación Lyra.');
INSERT INTO public.star VALUES (8, 'Altair', 1000, 16.7, true, 4, 'Rápidamente giratoria en la constelación del Águila.');
INSERT INTO public.star VALUES (9, 'Deneb', 10000, 2600, true, 5, 'Una de las estrellas más luminosas conocidas.');
INSERT INTO public.star VALUES (10, 'Antares', 12000, 550, false, 6, 'Supergigante roja en Escorpio.');
INSERT INTO public.star VALUES (11, 'Alpha Centauri A', 5000, 4.37, true, 2, 'Parte del sistema Alpha Centauri, cercano a la Tierra.');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 13, true);


--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_type_galaxy_type_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 49, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 33, true);


--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_type_planet_type_id_seq', 7, true);


--
-- Name: start_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.start_star_id_seq', 11, true);


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
-- Name: galaxy_type galaxy_type_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_type_name_key UNIQUE (name);


--
-- Name: galaxy_type galaxy_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_type_pkey PRIMARY KEY (galaxy_type_id);


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
-- Name: planet_type planet_type_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_type_name_key UNIQUE (name);


--
-- Name: planet_type planet_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_type_pkey PRIMARY KEY (planet_type_id);


--
-- Name: star start_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT start_name_key UNIQUE (name);


--
-- Name: star start_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT start_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy fk_galaxy_type; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT fk_galaxy_type FOREIGN KEY (galaxy_type_id) REFERENCES public.galaxy_type(galaxy_type_id);


--
-- Name: moon fk_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_moon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_moon_id_fkey FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


--
-- Name: planet planet_planet_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_type_id_fkey FOREIGN KEY (planet_type_id) REFERENCES public.planet_type(planet_type_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star start_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT start_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

