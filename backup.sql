--
-- PostgreSQL database dump
--

\restrict MWKprk9cmal0qMG6smUFonfl3P0n4EJKsEibA1P2v1a1jdatBXKdLSCOChrEXBV

-- Dumped from database version 18.3
-- Dumped by pg_dump version 18.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- Name: actividades; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.actividades (
    id integer NOT NULL,
    lugar_id integer,
    nombre character varying(150) NOT NULL,
    descripcion text,
    duracion character varying(50),
    dificultad character varying(50),
    categoria_id integer,
    imagen_url text,
    region_id integer
);


ALTER TABLE public.actividades OWNER TO postgres;

--
-- Name: actividades_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.actividades_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.actividades_id_seq OWNER TO postgres;

--
-- Name: actividades_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.actividades_id_seq OWNED BY public.actividades.id;


--
-- Name: categorias; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categorias (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    tipo character varying(20) NOT NULL,
    icono character varying(50),
    CONSTRAINT categorias_tipo_check CHECK (((tipo)::text = ANY ((ARRAY['lugar'::character varying, 'actividad'::character varying, 'ambos'::character varying])::text[])))
);


ALTER TABLE public.categorias OWNER TO postgres;

--
-- Name: categorias_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categorias_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.categorias_id_seq OWNER TO postgres;

--
-- Name: categorias_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categorias_id_seq OWNED BY public.categorias.id;


--
-- Name: codigos_conducta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.codigos_conducta (
    id integer NOT NULL,
    lugar_id integer,
    regla text NOT NULL
);


ALTER TABLE public.codigos_conducta OWNER TO postgres;

--
-- Name: codigos_conducta_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.codigos_conducta_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.codigos_conducta_id_seq OWNER TO postgres;

--
-- Name: codigos_conducta_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.codigos_conducta_id_seq OWNED BY public.codigos_conducta.id;


--
-- Name: destinos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.destinos (
    id integer NOT NULL,
    region_id integer,
    nombre character varying(150) NOT NULL,
    descripcion text,
    tipo character varying(50),
    latitud numeric(9,6),
    longitud numeric(9,6),
    imagen_url text,
    creado_en timestamp without time zone DEFAULT now(),
    actualizado_en timestamp without time zone DEFAULT now()
);


ALTER TABLE public.destinos OWNER TO postgres;

--
-- Name: destinos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.destinos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.destinos_id_seq OWNER TO postgres;

--
-- Name: destinos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.destinos_id_seq OWNED BY public.destinos.id;


--
-- Name: fotos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fotos (
    id integer NOT NULL,
    lugar_id integer,
    url text NOT NULL,
    descripcion text
);


ALTER TABLE public.fotos OWNER TO postgres;

--
-- Name: fotos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.fotos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.fotos_id_seq OWNER TO postgres;

--
-- Name: fotos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.fotos_id_seq OWNED BY public.fotos.id;


--
-- Name: locales_comida; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.locales_comida (
    id integer NOT NULL,
    lugar_id integer,
    nombre character varying(150) NOT NULL,
    tipo_cocina character varying(100),
    direccion text,
    telefono character varying(20),
    precio_promedio character varying(50)
);


ALTER TABLE public.locales_comida OWNER TO postgres;

--
-- Name: locales_comida_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.locales_comida_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.locales_comida_id_seq OWNER TO postgres;

--
-- Name: locales_comida_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.locales_comida_id_seq OWNED BY public.locales_comida.id;


--
-- Name: lugares; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lugares (
    id integer NOT NULL,
    region_id integer,
    nombre character varying(150) NOT NULL,
    descripcion text,
    latitud numeric(9,6),
    longitud numeric(9,6),
    creado_en timestamp without time zone DEFAULT now(),
    categoria_id integer,
    imagen_url text
);


ALTER TABLE public.lugares OWNER TO postgres;

--
-- Name: lugares_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.lugares_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.lugares_id_seq OWNER TO postgres;

--
-- Name: lugares_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.lugares_id_seq OWNED BY public.lugares.id;


--
-- Name: nodos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.nodos (
    id integer NOT NULL,
    nombre character varying(50),
    ip character varying(20) NOT NULL,
    puerto integer DEFAULT 3001,
    es_primario boolean DEFAULT false,
    activo boolean DEFAULT true,
    ultimo_contacto timestamp without time zone DEFAULT now()
);


ALTER TABLE public.nodos OWNER TO postgres;

--
-- Name: nodos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.nodos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.nodos_id_seq OWNER TO postgres;

--
-- Name: nodos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.nodos_id_seq OWNED BY public.nodos.id;


--
-- Name: prestadores; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.prestadores (
    id integer NOT NULL,
    region_id integer,
    nombre character varying(150) NOT NULL,
    tipo_servicio character varying(100),
    contacto character varying(200),
    descripcion text
);


ALTER TABLE public.prestadores OWNER TO postgres;

--
-- Name: prestadores_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.prestadores_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.prestadores_id_seq OWNER TO postgres;

--
-- Name: prestadores_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.prestadores_id_seq OWNED BY public.prestadores.id;


--
-- Name: recomendaciones; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.recomendaciones (
    id integer NOT NULL,
    lugar_id integer,
    recomendacion text NOT NULL
);


ALTER TABLE public.recomendaciones OWNER TO postgres;

--
-- Name: recomendaciones_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.recomendaciones_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.recomendaciones_id_seq OWNER TO postgres;

--
-- Name: recomendaciones_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.recomendaciones_id_seq OWNED BY public.recomendaciones.id;


--
-- Name: regiones; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.regiones (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    descripcion text,
    descripcion_municipio text,
    poblacion integer,
    superficie_km2 numeric(10,2),
    clima character varying(100)
);


ALTER TABLE public.regiones OWNER TO postgres;

--
-- Name: regiones_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.regiones_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.regiones_id_seq OWNER TO postgres;

--
-- Name: regiones_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.regiones_id_seq OWNED BY public.regiones.id;


--
-- Name: resenas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.resenas (
    id integer NOT NULL,
    lugar_id integer,
    usuario character varying(100) NOT NULL,
    comentario text,
    estrellas integer,
    creado_en timestamp without time zone DEFAULT now(),
    CONSTRAINT resenas_estrellas_check CHECK (((estrellas >= 1) AND (estrellas <= 5)))
);


ALTER TABLE public.resenas OWNER TO postgres;

--
-- Name: resenas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.resenas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.resenas_id_seq OWNER TO postgres;

--
-- Name: resenas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.resenas_id_seq OWNED BY public.resenas.id;


--
-- Name: tips_ecologia; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tips_ecologia (
    id integer NOT NULL,
    lugar_id integer,
    tip text NOT NULL
);


ALTER TABLE public.tips_ecologia OWNER TO postgres;

--
-- Name: tips_ecologia_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tips_ecologia_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tips_ecologia_id_seq OWNER TO postgres;

--
-- Name: tips_ecologia_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tips_ecologia_id_seq OWNED BY public.tips_ecologia.id;


--
-- Name: actividades id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actividades ALTER COLUMN id SET DEFAULT nextval('public.actividades_id_seq'::regclass);


--
-- Name: categorias id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categorias ALTER COLUMN id SET DEFAULT nextval('public.categorias_id_seq'::regclass);


--
-- Name: codigos_conducta id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.codigos_conducta ALTER COLUMN id SET DEFAULT nextval('public.codigos_conducta_id_seq'::regclass);


--
-- Name: destinos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.destinos ALTER COLUMN id SET DEFAULT nextval('public.destinos_id_seq'::regclass);


--
-- Name: fotos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fotos ALTER COLUMN id SET DEFAULT nextval('public.fotos_id_seq'::regclass);


--
-- Name: locales_comida id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.locales_comida ALTER COLUMN id SET DEFAULT nextval('public.locales_comida_id_seq'::regclass);


--
-- Name: lugares id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lugares ALTER COLUMN id SET DEFAULT nextval('public.lugares_id_seq'::regclass);


--
-- Name: nodos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nodos ALTER COLUMN id SET DEFAULT nextval('public.nodos_id_seq'::regclass);


--
-- Name: prestadores id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prestadores ALTER COLUMN id SET DEFAULT nextval('public.prestadores_id_seq'::regclass);


--
-- Name: recomendaciones id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recomendaciones ALTER COLUMN id SET DEFAULT nextval('public.recomendaciones_id_seq'::regclass);


--
-- Name: regiones id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.regiones ALTER COLUMN id SET DEFAULT nextval('public.regiones_id_seq'::regclass);


--
-- Name: resenas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resenas ALTER COLUMN id SET DEFAULT nextval('public.resenas_id_seq'::regclass);


--
-- Name: tips_ecologia id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tips_ecologia ALTER COLUMN id SET DEFAULT nextval('public.tips_ecologia_id_seq'::regclass);


--
-- Data for Name: actividades; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.actividades (id, lugar_id, nombre, descripcion, duracion, dificultad, categoria_id, imagen_url, region_id) FROM stdin;
25	26	Snorkel con lobos marinos	Nada junto a lobos marinos en su habitat natural en Isla Espiritu Santo. Una experiencia unica e inolvidable.	4 horas	Baja	1	\N	1
26	25	Kayak en Balandra	Recorre las tranquilas aguas turquesas de Balandra en kayak, explorando sus cuevas y manglares.	2 horas	Baja	2	\N	1
27	\N	Avistamiento de ballenas grises	De enero a abril puedes observar ballenas grises en la costa del Pacifico cerca de Puerto Chale.	6 horas	Baja	3	\N	1
28	\N	Nado con tiburon ballena	Nada junto al pez mas grande del mundo en las aguas del Mar de Cortes. Temporada de octubre a febrero.	5 horas	Media	7	\N	1
29	\N	Pesca deportiva en el Mar de Cortes	El Mar de Cortes es paraiso de la pesca deportiva con especies como dorado, marlín y atun.	8 horas	Baja	4	\N	1
30	\N	Kitesurf en La Ventana	La Ventana y El Sargento son considerados de los mejores spots de kitesurf del mundo.	3 horas	Alta	6	\N	1
31	30	Tour en kayak al Arco	Rema desde la playa hasta El Arco pasando por la Playa de los Amantes. Incluye equipo de snorkel.	3 horas	Baja	2	\N	2
32	32	Pesca deportiva desde la Marina	Embarca desde la Marina de Cabo San Lucas en busca de marlín, dorado y wahoo.	8 horas	Baja	4	\N	2
33	34	Buceo en Cabo Pulmo	Bucea en el unico arrecife de coral vivo del Pacifico Norte y observa mantas, tiburones y tortugas.	4 horas	Media	1	\N	2
34	\N	Surf en Todos Santos	Las playas del Pacifico en Todos Santos ofrecen excelentes olas para surfistas de todos los niveles.	3 horas	Media	6	\N	2
35	37	Snorkel en Isla Coronado	Explora los arrecifes de coral y nada con leones marinos en las aguas cristalinas de Isla Coronado.	5 horas	Baja	1	\N	3
36	\N	Kayak en Bahia de Loreto	Recorre en kayak las islas del Parque Nacional con aguas de color azul turquesa.	4 horas	Baja	2	\N	3
37	\N	Avistamiento de ballenas azules	Loreto es uno de los pocos lugares del mundo donde se pueden observar ballenas azules de cerca.	6 horas	Baja	3	\N	3
38	\N	Senderismo en Sierra de la Giganta	Rutas de senderismo entre el desierto y el mar con vistas panoramicas y flora endemica.	5 horas	Media	5	\N	3
39	39	Kayak en Bahia Concepcion	Explora las pequenas islas y formaciones rocosas de la Bahia Concepcion en kayak.	3 horas	Baja	2	\N	4
40	41	Visita a pinturas rupestres	Tour guiado a las cuevas con pinturas de mas de 10,000 anos declaradas Patrimonio de la Humanidad.	8 horas	Alta	8	\N	4
41	42	Sandboarding en Dunas del Gallito	Deslizate por las impresionantes dunas de arena con vistas al Golfo de California.	2 horas	Media	7	\N	4
42	43	Avistamiento de ballenas en El Vizcaino	El Vizcaino es considerado el mejor lugar del mundo para ver ballenas grises de cerca.	6 horas	Baja	3	\N	4
43	\N	Cuatrimotos en el desierto	Recorre el desierto y las dunas en cuatrimoto con guia local. Adrenalina pura en paisajes unicos.	3 horas	Media	8	\N	4
44	45	Pesca deportiva en Puerto San Carlos	Embarca desde Puerto San Carlos en busca de pez vela, marlín y atun en el Pacifico.	8 horas	Baja	4	\N	5
45	46	Avistamiento de ballenas en Lopez Mateos	Puerto Lopez Mateos es considerado uno de los mejores puntos del mundo para ver ballenas grises.	4 horas	Baja	3	\N	5
46	47	Surf en San Juanico	San Juanico alberga una de las olas mas largas del mundo durante ciertas semanas del ano.	4 horas	Alta	6	\N	5
47	48	Kayak en La Purisima	Rema en las tranquilas aguas del oasis de La Purisima rodeado de palmeras y con el volcan El Pilon de fondo.	2 horas	Baja	2	\N	5
48	\N	Campismo en el oasis	Acampa en el oasis de Comondu rodeado de palmeras, arroyos y cielos estrellados.	1 noche	Baja	5	\N	5
\.


--
-- Data for Name: categorias; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categorias (id, nombre, tipo, icono) FROM stdin;
1	Playa	lugar	playa
2	Isla	lugar	isla
3	Mision historica	lugar	mision
4	Museo	lugar	museo
5	Pueblo Magico	lugar	pueblo
6	Reserva natural	lugar	reserva
7	Marina	lugar	marina
8	Snorkel y Buceo	actividad	buceo
9	Kayak	actividad	kayak
10	Avistamiento de ballenas	actividad	ballenas
11	Pesca deportiva	actividad	pesca
12	Senderismo	actividad	senderismo
13	Surf	actividad	surf
14	Nado con tiburon ballena	actividad	tiburon
15	Sandboarding	actividad	sandboarding
16	Cuatrimotos	actividad	cuatrimotos
17	Paddleboard	actividad	paddleboard
18	Pinturas rupestres	ambos	rupestres
\.


--
-- Data for Name: codigos_conducta; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.codigos_conducta (id, lugar_id, regla) FROM stdin;
\.


--
-- Data for Name: destinos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.destinos (id, region_id, nombre, descripcion, tipo, latitud, longitud, imagen_url, creado_en, actualizado_en) FROM stdin;
\.


--
-- Data for Name: fotos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fotos (id, lugar_id, url, descripcion) FROM stdin;
\.


--
-- Data for Name: locales_comida; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.locales_comida (id, lugar_id, nombre, tipo_cocina, direccion, telefono, precio_promedio) FROM stdin;
\.


--
-- Data for Name: lugares; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.lugares (id, region_id, nombre, descripcion, latitud, longitud, creado_en, categoria_id, imagen_url) FROM stdin;
25	1	Playa Balandra	Una de las playas mas hermosas de Mexico, con aguas turquesas poco profundas y arena blanca. Protegida por la UNESCO como area natural.	24.316700	-110.283300	2026-05-03 21:18:41.848019	1	https://upload.wikimedia.org/wikipedia/commons/thumb/8/8e/Balandra.jpg/1280px-Balandra.jpg
26	1	Isla Espiritu Santo	Isla virgen declarada Patrimonio de la Humanidad. Ideal para snorkel, kayak y avistamiento de lobos marinos y delfines.	24.433300	-110.350000	2026-05-03 21:18:41.848019	2	\N
27	1	Malecon de La Paz	Paseo costero de mas de 5 km frente al Mar de Cortes. Centro de vida social y cultural de la ciudad.	24.142600	-110.312800	2026-05-03 21:18:41.848019	7	\N
28	1	Todos Santos	Pueblo Magico en la costa del Pacifico, famoso por sus galerias de arte, arquitectura colonial y playas surferas.	23.450000	-110.216700	2026-05-03 21:18:41.848019	5	\N
29	1	Museo de Antropologia e Historia de BCS	Recinto que exhibe la historia y cultura de Baja California Sur.	24.144400	-110.308900	2026-05-03 21:18:41.848019	4	\N
30	2	El Arco de Cabo San Lucas	Formacion rocosa emblematica donde se unen el Oceano Pacifico y el Mar de Cortes.	22.878900	-109.914700	2026-05-03 21:18:41.848019	6	\N
31	2	Playa del Amor	Playa ubicada junto a El Arco, accesible solo por mar.	22.877500	-109.915800	2026-05-03 21:18:41.848019	1	\N
32	2	Marina Cabo San Lucas	Una de las marinas mas modernas de Mexico con capacidad para 390 embarcaciones.	22.889700	-109.903600	2026-05-03 21:18:41.848019	7	\N
33	2	San Jose del Cabo Centro	Pueblo historico con arquitectura colonial, calles empedradas y galerias de arte.	23.059700	-109.690300	2026-05-03 21:18:41.848019	5	\N
34	2	Cabo Pulmo	Parque Nacional marino con el unico arrecife de coral vivo en el Pacifico Norte.	23.450000	-109.416700	2026-05-03 21:18:41.848019	6	\N
35	3	Mision de Nuestra Senora de Loreto	Primera mision de California fundada en 1697.	26.011200	-111.347400	2026-05-03 21:18:41.848019	3	\N
36	3	Parque Nacional Bahia de Loreto	Area natural protegida con islas paradisiacas.	25.850000	-111.150000	2026-05-03 21:18:41.848019	6	\N
37	3	Isla Coronado	Isla habitada por cientos de leones marinos con playas de arena blanca.	26.083300	-111.283300	2026-05-03 21:18:41.848019	2	\N
38	3	Mision San Francisco Javier	Una de las misiones mejor conservadas de BCS, construida en 1744.	25.866700	-111.533300	2026-05-03 21:18:41.848019	3	\N
39	4	Bahia Concepcion	Una de las bahias mas bellas de Mexico con aguas turquesas ideales para kayak y snorkel.	26.666700	-111.883300	2026-05-03 21:18:41.848019	1	\N
40	4	Mision de Mulege	Antigua mision jesuita del siglo XVIII ubicada sobre una colina.	26.887200	-111.981100	2026-05-03 21:18:41.848019	3	\N
41	4	Pinturas Rupestres Sierra de San Francisco	Patrimonio de la Humanidad por la UNESCO. Pinturas prehistoricas de mas de 10,000 anos.	27.350000	-112.500000	2026-05-03 21:18:41.848019	6	\N
42	4	Dunas del Gallito	Impresionantes dunas de arena a 3 km de Mulege, ideales para cuatrimotos y sandboarding.	26.900000	-111.950000	2026-05-03 21:18:41.848019	6	\N
43	4	Santuario de Ballenas El Vizcaino	Reserva de la Biosfera y Patrimonio de la Humanidad. El mejor lugar para observar ballenas grises.	27.500000	-113.500000	2026-05-03 21:18:41.848019	6	\N
44	5	San Jose y San Miguel de Comondu	Dos pintorescos pueblos oasis en el corazon de la Sierra de la Giganta.	26.083300	-111.816700	2026-05-03 21:18:41.848019	5	\N
45	5	Puerto San Carlos	Puerto pesquero famoso por la pesca deportiva de marlín, pez vela y atun.	24.783300	-112.116700	2026-05-03 21:18:41.848019	7	\N
46	5	Puerto Adolfo Lopez Mateos	Considerado uno de los mejores puntos del mundo para observar a la ballena gris.	25.183300	-112.100000	2026-05-03 21:18:41.848019	6	\N
47	5	San Juanico	Comunidad pesquera famosa por tener una de las olas mas largas del mundo.	26.233300	-112.450000	2026-05-03 21:18:41.848019	1	\N
48	5	La Purisima	Oasis en el desierto con aguas cristalinas de rio, palmeras y el volcan El Pilon como fondo.	26.183300	-112.066700	2026-05-03 21:18:41.848019	6	\N
\.


--
-- Data for Name: nodos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.nodos (id, nombre, ip, puerto, es_primario, activo, ultimo_contacto) FROM stdin;
1	Nodo Brayan	192.168.1.10	3001	f	t	2026-05-03 15:44:08.939366
3	Nodo Guadalupe	192.168.1.12	3001	t	t	2026-05-03 15:44:08.939366
4	Nodo Jose Adan	192.168.1.13	3001	f	t	2026-05-03 15:44:08.939366
5	Nodo Sebastian	192.168.1.14	3001	f	t	2026-05-03 15:44:08.939366
2	Nodo Juan	192.168.1.67	3001	f	t	2026-05-03 15:44:08.939366
\.


--
-- Data for Name: prestadores; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.prestadores (id, region_id, nombre, tipo_servicio, contacto, descripcion) FROM stdin;
\.


--
-- Data for Name: recomendaciones; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.recomendaciones (id, lugar_id, recomendacion) FROM stdin;
\.


--
-- Data for Name: regiones; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.regiones (id, nombre, descripcion, descripcion_municipio, poblacion, superficie_km2, clima) FROM stdin;
1	La Paz	Capital del estado	\N	\N	\N	\N
2	Los Cabos	Zona turística principal	\N	\N	\N	\N
3	Loreto	Ciudad histórica	\N	\N	\N	\N
4	Mulegé	Oasis y misiones	\N	\N	\N	\N
5	Comondú	Municipio de Comondú	\N	\N	\N	\N
\.


--
-- Data for Name: resenas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.resenas (id, lugar_id, usuario, comentario, estrellas, creado_en) FROM stdin;
\.


--
-- Data for Name: tips_ecologia; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tips_ecologia (id, lugar_id, tip) FROM stdin;
\.


--
-- Name: actividades_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.actividades_id_seq', 48, true);


--
-- Name: categorias_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categorias_id_seq', 18, true);


--
-- Name: codigos_conducta_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.codigos_conducta_id_seq', 1, false);


--
-- Name: destinos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.destinos_id_seq', 1, false);


--
-- Name: fotos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.fotos_id_seq', 1, false);


--
-- Name: locales_comida_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.locales_comida_id_seq', 1, false);


--
-- Name: lugares_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.lugares_id_seq', 48, true);


--
-- Name: nodos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.nodos_id_seq', 5, true);


--
-- Name: prestadores_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.prestadores_id_seq', 1, false);


--
-- Name: recomendaciones_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.recomendaciones_id_seq', 1, false);


--
-- Name: regiones_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.regiones_id_seq', 5, true);


--
-- Name: resenas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.resenas_id_seq', 1, true);


--
-- Name: tips_ecologia_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tips_ecologia_id_seq', 1, false);


--
-- Name: actividades actividades_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actividades
    ADD CONSTRAINT actividades_pkey PRIMARY KEY (id);


--
-- Name: categorias categorias_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categorias
    ADD CONSTRAINT categorias_pkey PRIMARY KEY (id);


--
-- Name: codigos_conducta codigos_conducta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.codigos_conducta
    ADD CONSTRAINT codigos_conducta_pkey PRIMARY KEY (id);


--
-- Name: destinos destinos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.destinos
    ADD CONSTRAINT destinos_pkey PRIMARY KEY (id);


--
-- Name: fotos fotos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fotos
    ADD CONSTRAINT fotos_pkey PRIMARY KEY (id);


--
-- Name: locales_comida locales_comida_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.locales_comida
    ADD CONSTRAINT locales_comida_pkey PRIMARY KEY (id);


--
-- Name: lugares lugares_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lugares
    ADD CONSTRAINT lugares_pkey PRIMARY KEY (id);


--
-- Name: nodos nodos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nodos
    ADD CONSTRAINT nodos_pkey PRIMARY KEY (id);


--
-- Name: prestadores prestadores_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prestadores
    ADD CONSTRAINT prestadores_pkey PRIMARY KEY (id);


--
-- Name: recomendaciones recomendaciones_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recomendaciones
    ADD CONSTRAINT recomendaciones_pkey PRIMARY KEY (id);


--
-- Name: regiones regiones_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.regiones
    ADD CONSTRAINT regiones_pkey PRIMARY KEY (id);


--
-- Name: resenas resenas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resenas
    ADD CONSTRAINT resenas_pkey PRIMARY KEY (id);


--
-- Name: tips_ecologia tips_ecologia_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tips_ecologia
    ADD CONSTRAINT tips_ecologia_pkey PRIMARY KEY (id);


--
-- Name: actividades actividades_categoria_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actividades
    ADD CONSTRAINT actividades_categoria_id_fkey FOREIGN KEY (categoria_id) REFERENCES public.categorias(id);


--
-- Name: actividades actividades_lugar_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actividades
    ADD CONSTRAINT actividades_lugar_id_fkey FOREIGN KEY (lugar_id) REFERENCES public.lugares(id);


--
-- Name: actividades actividades_region_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actividades
    ADD CONSTRAINT actividades_region_id_fkey FOREIGN KEY (region_id) REFERENCES public.regiones(id);


--
-- Name: codigos_conducta codigos_conducta_lugar_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.codigos_conducta
    ADD CONSTRAINT codigos_conducta_lugar_id_fkey FOREIGN KEY (lugar_id) REFERENCES public.lugares(id);


--
-- Name: destinos destinos_region_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.destinos
    ADD CONSTRAINT destinos_region_id_fkey FOREIGN KEY (region_id) REFERENCES public.regiones(id);


--
-- Name: fotos fotos_lugar_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fotos
    ADD CONSTRAINT fotos_lugar_id_fkey FOREIGN KEY (lugar_id) REFERENCES public.lugares(id);


--
-- Name: locales_comida locales_comida_lugar_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.locales_comida
    ADD CONSTRAINT locales_comida_lugar_id_fkey FOREIGN KEY (lugar_id) REFERENCES public.lugares(id);


--
-- Name: lugares lugares_categoria_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lugares
    ADD CONSTRAINT lugares_categoria_id_fkey FOREIGN KEY (categoria_id) REFERENCES public.categorias(id);


--
-- Name: lugares lugares_region_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lugares
    ADD CONSTRAINT lugares_region_id_fkey FOREIGN KEY (region_id) REFERENCES public.regiones(id);


--
-- Name: prestadores prestadores_region_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prestadores
    ADD CONSTRAINT prestadores_region_id_fkey FOREIGN KEY (region_id) REFERENCES public.regiones(id);


--
-- Name: recomendaciones recomendaciones_lugar_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recomendaciones
    ADD CONSTRAINT recomendaciones_lugar_id_fkey FOREIGN KEY (lugar_id) REFERENCES public.lugares(id);


--
-- Name: resenas resenas_lugar_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resenas
    ADD CONSTRAINT resenas_lugar_id_fkey FOREIGN KEY (lugar_id) REFERENCES public.lugares(id);


--
-- Name: tips_ecologia tips_ecologia_lugar_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tips_ecologia
    ADD CONSTRAINT tips_ecologia_lugar_id_fkey FOREIGN KEY (lugar_id) REFERENCES public.lugares(id);


--
-- PostgreSQL database dump complete
--

\unrestrict MWKprk9cmal0qMG6smUFonfl3P0n4EJKsEibA1P2v1a1jdatBXKdLSCOChrEXBV

