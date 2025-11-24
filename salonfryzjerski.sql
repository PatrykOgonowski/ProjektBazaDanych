--
-- PostgreSQL database dump
--

\restrict nJpijMdjeqpph9NRRRiBMlRBkJilcxQ91vbNtWML54x1J35Ukr3wxekcTb1cB0f

-- Dumped from database version 18.1
-- Dumped by pg_dump version 18.1

-- Started on 2025-11-23 18:58:19

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

--
-- TOC entry 871 (class 1247 OID 16389)
-- Name: rola_enum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.rola_enum AS ENUM (
    'klient',
    'admin',
    'pracownik'
);


ALTER TYPE public.rola_enum OWNER TO postgres;

--
-- TOC entry 874 (class 1247 OID 16396)
-- Name: status_enum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.status_enum AS ENUM (
    'zaplanowana',
    'w toku',
    'zakończona',
    'odwołana'
);


ALTER TYPE public.status_enum OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 220 (class 1259 OID 16406)
-- Name: klienci; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.klienci (
    id_klienta integer NOT NULL,
    imie character varying NOT NULL,
    nazwisko character varying NOT NULL,
    email character varying NOT NULL,
    haslo character varying NOT NULL,
    rola public.rola_enum DEFAULT 'klient'::public.rola_enum NOT NULL
);


ALTER TABLE public.klienci OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16405)
-- Name: klienci_id_klienta_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.klienci_id_klienta_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.klienci_id_klienta_seq OWNER TO postgres;

--
-- TOC entry 5146 (class 0 OID 0)
-- Dependencies: 219
-- Name: klienci_id_klienta_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.klienci_id_klienta_seq OWNED BY public.klienci.id_klienta;


--
-- TOC entry 232 (class 1259 OID 16500)
-- Name: klienci_opinie; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.klienci_opinie (
    id_opinii integer NOT NULL,
    id_klienta integer NOT NULL
);


ALTER TABLE public.klienci_opinie OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 16483)
-- Name: klienci_wizyty; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.klienci_wizyty (
    id_klienta integer NOT NULL,
    id_wizyty integer NOT NULL
);


ALTER TABLE public.klienci_wizyty OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16424)
-- Name: opinie; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.opinie (
    id_opinii integer NOT NULL,
    ocena integer NOT NULL,
    komentarz text,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    CONSTRAINT opinie_ocena_check CHECK (((ocena >= 1) AND (ocena <= 5)))
);


ALTER TABLE public.opinie OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16423)
-- Name: opinie_id_opinii_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.opinie_id_opinii_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.opinie_id_opinii_seq OWNER TO postgres;

--
-- TOC entry 5147 (class 0 OID 0)
-- Dependencies: 221
-- Name: opinie_id_opinii_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.opinie_id_opinii_seq OWNED BY public.opinie.id_opinii;


--
-- TOC entry 228 (class 1259 OID 16461)
-- Name: pracownicy; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pracownicy (
    id_pracownika integer NOT NULL,
    imie character varying NOT NULL,
    nazwisko character varying NOT NULL
);


ALTER TABLE public.pracownicy OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16460)
-- Name: pracownicy_id_pracownika_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pracownicy_id_pracownika_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.pracownicy_id_pracownika_seq OWNER TO postgres;

--
-- TOC entry 5148 (class 0 OID 0)
-- Dependencies: 227
-- Name: pracownicy_id_pracownika_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pracownicy_id_pracownika_seq OWNED BY public.pracownicy.id_pracownika;


--
-- TOC entry 236 (class 1259 OID 16568)
-- Name: pracownicy_specjalizacje; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pracownicy_specjalizacje (
    id_pracownika integer NOT NULL,
    id_specjalizacji integer NOT NULL
);


ALTER TABLE public.pracownicy_specjalizacje OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 16585)
-- Name: pracownicy_uslugi; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pracownicy_uslugi (
    id_pracownika integer NOT NULL,
    id_uslugi integer NOT NULL
);


ALTER TABLE public.pracownicy_uslugi OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 16551)
-- Name: pracownicy_wizyty; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pracownicy_wizyty (
    id_pracownika integer NOT NULL,
    id_wizyty integer NOT NULL
);


ALTER TABLE public.pracownicy_wizyty OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 16473)
-- Name: specjalizacje; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.specjalizacje (
    id_specjalizacji integer NOT NULL,
    nazwa character varying NOT NULL
);


ALTER TABLE public.specjalizacje OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 16472)
-- Name: specjalizacje_id_specjalizacji_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.specjalizacje_id_specjalizacji_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.specjalizacje_id_specjalizacji_seq OWNER TO postgres;

--
-- TOC entry 5149 (class 0 OID 0)
-- Dependencies: 229
-- Name: specjalizacje_id_specjalizacji_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.specjalizacje_id_specjalizacji_seq OWNED BY public.specjalizacje.id_specjalizacji;


--
-- TOC entry 226 (class 1259 OID 16448)
-- Name: uslugi; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.uslugi (
    id_uslugi integer NOT NULL,
    nazwa character varying NOT NULL,
    czas_trwania integer NOT NULL,
    cena numeric(10,2) NOT NULL
);


ALTER TABLE public.uslugi OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16447)
-- Name: uslugi_id_uslugi_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.uslugi_id_uslugi_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.uslugi_id_uslugi_seq OWNER TO postgres;

--
-- TOC entry 5150 (class 0 OID 0)
-- Dependencies: 225
-- Name: uslugi_id_uslugi_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.uslugi_id_uslugi_seq OWNED BY public.uslugi.id_uslugi;


--
-- TOC entry 238 (class 1259 OID 16602)
-- Name: uslugi_specjalizacje; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.uslugi_specjalizacje (
    id_uslugi integer NOT NULL,
    id_specjalizacji integer NOT NULL
);


ALTER TABLE public.uslugi_specjalizacje OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16438)
-- Name: wizyty; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.wizyty (
    id_wizyty integer NOT NULL,
    data_wizyty timestamp without time zone NOT NULL,
    status public.status_enum NOT NULL
);


ALTER TABLE public.wizyty OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16437)
-- Name: wizyty_id_wizyty_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.wizyty_id_wizyty_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.wizyty_id_wizyty_seq OWNER TO postgres;

--
-- TOC entry 5151 (class 0 OID 0)
-- Dependencies: 223
-- Name: wizyty_id_wizyty_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.wizyty_id_wizyty_seq OWNED BY public.wizyty.id_wizyty;


--
-- TOC entry 233 (class 1259 OID 16517)
-- Name: wizyty_opinie; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.wizyty_opinie (
    id_wizyty integer NOT NULL,
    id_opinii integer NOT NULL
);


ALTER TABLE public.wizyty_opinie OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 16534)
-- Name: wizyty_uslugi; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.wizyty_uslugi (
    id_wizyty integer NOT NULL,
    id_uslugi integer NOT NULL
);


ALTER TABLE public.wizyty_uslugi OWNER TO postgres;

--
-- TOC entry 4919 (class 2604 OID 16409)
-- Name: klienci id_klienta; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.klienci ALTER COLUMN id_klienta SET DEFAULT nextval('public.klienci_id_klienta_seq'::regclass);


--
-- TOC entry 4921 (class 2604 OID 16427)
-- Name: opinie id_opinii; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.opinie ALTER COLUMN id_opinii SET DEFAULT nextval('public.opinie_id_opinii_seq'::regclass);


--
-- TOC entry 4925 (class 2604 OID 16464)
-- Name: pracownicy id_pracownika; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pracownicy ALTER COLUMN id_pracownika SET DEFAULT nextval('public.pracownicy_id_pracownika_seq'::regclass);


--
-- TOC entry 4926 (class 2604 OID 16476)
-- Name: specjalizacje id_specjalizacji; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.specjalizacje ALTER COLUMN id_specjalizacji SET DEFAULT nextval('public.specjalizacje_id_specjalizacji_seq'::regclass);


--
-- TOC entry 4924 (class 2604 OID 16451)
-- Name: uslugi id_uslugi; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.uslugi ALTER COLUMN id_uslugi SET DEFAULT nextval('public.uslugi_id_uslugi_seq'::regclass);


--
-- TOC entry 4923 (class 2604 OID 16441)
-- Name: wizyty id_wizyty; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wizyty ALTER COLUMN id_wizyty SET DEFAULT nextval('public.wizyty_id_wizyty_seq'::regclass);


--
-- TOC entry 5122 (class 0 OID 16406)
-- Dependencies: 220
-- Data for Name: klienci; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.klienci (id_klienta, imie, nazwisko, email, haslo, rola) FROM stdin;
1	Jan	Kowalski	jan.k@gmail.com	test123	klient
2	Anna	Nowak	anna.n@interia.pl	test123	klient
3	Piotr	Zieliński	piotr.z@wp.pl	test123	klient
4	Maria	Wiśniewska	maria.w@wp.pl	test123	klient
5	Tomasz	Lewandowski	t.lew@gmail.com	test123	klient
6	Katarzyna	Wójcik	kasia.w@gmail.com	test123	klient
7	Michał	Kaczmarek	m.kacz@wp.pl	test123	klient
8	Aleksandra	Pawlak	ola.p@wp.pl	test123	klient
9	Karolina	Zając	k.zajac@interia.pl	test123	klient
10	Robert	Górski	robert.g@gmail.com	test123	klient
\.


--
-- TOC entry 5134 (class 0 OID 16500)
-- Dependencies: 232
-- Data for Name: klienci_opinie; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.klienci_opinie (id_opinii, id_klienta) FROM stdin;
4	1
7	2
1	3
6	4
5	5
10	6
2	7
9	8
3	9
8	10
\.


--
-- TOC entry 5133 (class 0 OID 16483)
-- Dependencies: 231
-- Data for Name: klienci_wizyty; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.klienci_wizyty (id_klienta, id_wizyty) FROM stdin;
\.


--
-- TOC entry 5124 (class 0 OID 16424)
-- Dependencies: 222
-- Data for Name: opinie; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.opinie (id_opinii, ocena, komentarz, created_at) FROM stdin;
1	5	Super obsługa	2025-11-23 18:41:15.570501
2	4	Polecam	2025-11-23 18:41:15.570501
3	3	Może być	2025-11-23 18:41:15.570501
4	5	Profesjonalnie	2025-11-23 18:41:15.570501
5	4	W porządku	2025-11-23 18:41:15.570501
6	5	Świetnie!	2025-11-23 18:41:15.570501
7	1	Nie polecam	2025-11-23 18:41:15.570501
8	4	Miła atmosfera	2025-11-23 18:41:15.570501
9	5	Najlepsza wizyta!	2025-11-23 18:41:15.570501
10	5	Najlepsza wizyta!	2025-11-23 18:41:15.570501
\.


--
-- TOC entry 5130 (class 0 OID 16461)
-- Dependencies: 228
-- Data for Name: pracownicy; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pracownicy (id_pracownika, imie, nazwisko) FROM stdin;
\.


--
-- TOC entry 5138 (class 0 OID 16568)
-- Dependencies: 236
-- Data for Name: pracownicy_specjalizacje; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pracownicy_specjalizacje (id_pracownika, id_specjalizacji) FROM stdin;
\.


--
-- TOC entry 5139 (class 0 OID 16585)
-- Dependencies: 237
-- Data for Name: pracownicy_uslugi; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pracownicy_uslugi (id_pracownika, id_uslugi) FROM stdin;
\.


--
-- TOC entry 5137 (class 0 OID 16551)
-- Dependencies: 235
-- Data for Name: pracownicy_wizyty; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pracownicy_wizyty (id_pracownika, id_wizyty) FROM stdin;
\.


--
-- TOC entry 5132 (class 0 OID 16473)
-- Dependencies: 230
-- Data for Name: specjalizacje; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.specjalizacje (id_specjalizacji, nazwa) FROM stdin;
\.


--
-- TOC entry 5128 (class 0 OID 16448)
-- Dependencies: 226
-- Data for Name: uslugi; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.uslugi (id_uslugi, nazwa, czas_trwania, cena) FROM stdin;
\.


--
-- TOC entry 5140 (class 0 OID 16602)
-- Dependencies: 238
-- Data for Name: uslugi_specjalizacje; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.uslugi_specjalizacje (id_uslugi, id_specjalizacji) FROM stdin;
\.


--
-- TOC entry 5126 (class 0 OID 16438)
-- Dependencies: 224
-- Data for Name: wizyty; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.wizyty (id_wizyty, data_wizyty, status) FROM stdin;
\.


--
-- TOC entry 5135 (class 0 OID 16517)
-- Dependencies: 233
-- Data for Name: wizyty_opinie; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.wizyty_opinie (id_wizyty, id_opinii) FROM stdin;
\.


--
-- TOC entry 5136 (class 0 OID 16534)
-- Dependencies: 234
-- Data for Name: wizyty_uslugi; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.wizyty_uslugi (id_wizyty, id_uslugi) FROM stdin;
\.


--
-- TOC entry 5152 (class 0 OID 0)
-- Dependencies: 219
-- Name: klienci_id_klienta_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.klienci_id_klienta_seq', 1, false);


--
-- TOC entry 5153 (class 0 OID 0)
-- Dependencies: 221
-- Name: opinie_id_opinii_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.opinie_id_opinii_seq', 1, false);


--
-- TOC entry 5154 (class 0 OID 0)
-- Dependencies: 227
-- Name: pracownicy_id_pracownika_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pracownicy_id_pracownika_seq', 1, false);


--
-- TOC entry 5155 (class 0 OID 0)
-- Dependencies: 229
-- Name: specjalizacje_id_specjalizacji_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.specjalizacje_id_specjalizacji_seq', 1, false);


--
-- TOC entry 5156 (class 0 OID 0)
-- Dependencies: 225
-- Name: uslugi_id_uslugi_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.uslugi_id_uslugi_seq', 1, false);


--
-- TOC entry 5157 (class 0 OID 0)
-- Dependencies: 223
-- Name: wizyty_id_wizyty_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.wizyty_id_wizyty_seq', 1, false);


--
-- TOC entry 4929 (class 2606 OID 16422)
-- Name: klienci klienci_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.klienci
    ADD CONSTRAINT klienci_email_key UNIQUE (email);


--
-- TOC entry 4945 (class 2606 OID 16506)
-- Name: klienci_opinie klienci_opinie_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.klienci_opinie
    ADD CONSTRAINT klienci_opinie_pkey PRIMARY KEY (id_opinii, id_klienta);


--
-- TOC entry 4931 (class 2606 OID 16420)
-- Name: klienci klienci_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.klienci
    ADD CONSTRAINT klienci_pkey PRIMARY KEY (id_klienta);


--
-- TOC entry 4943 (class 2606 OID 16489)
-- Name: klienci_wizyty klienci_wizyty_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.klienci_wizyty
    ADD CONSTRAINT klienci_wizyty_pkey PRIMARY KEY (id_klienta, id_wizyty);


--
-- TOC entry 4933 (class 2606 OID 16436)
-- Name: opinie opinie_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.opinie
    ADD CONSTRAINT opinie_pkey PRIMARY KEY (id_opinii);


--
-- TOC entry 4939 (class 2606 OID 16471)
-- Name: pracownicy pracownicy_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pracownicy
    ADD CONSTRAINT pracownicy_pkey PRIMARY KEY (id_pracownika);


--
-- TOC entry 4953 (class 2606 OID 16574)
-- Name: pracownicy_specjalizacje pracownicy_specjalizacje_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pracownicy_specjalizacje
    ADD CONSTRAINT pracownicy_specjalizacje_pkey PRIMARY KEY (id_pracownika, id_specjalizacji);


--
-- TOC entry 4955 (class 2606 OID 16591)
-- Name: pracownicy_uslugi pracownicy_uslugi_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pracownicy_uslugi
    ADD CONSTRAINT pracownicy_uslugi_pkey PRIMARY KEY (id_pracownika, id_uslugi);


--
-- TOC entry 4951 (class 2606 OID 16557)
-- Name: pracownicy_wizyty pracownicy_wizyty_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pracownicy_wizyty
    ADD CONSTRAINT pracownicy_wizyty_pkey PRIMARY KEY (id_pracownika, id_wizyty);


--
-- TOC entry 4941 (class 2606 OID 16482)
-- Name: specjalizacje specjalizacje_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.specjalizacje
    ADD CONSTRAINT specjalizacje_pkey PRIMARY KEY (id_specjalizacji);


--
-- TOC entry 4937 (class 2606 OID 16459)
-- Name: uslugi uslugi_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.uslugi
    ADD CONSTRAINT uslugi_pkey PRIMARY KEY (id_uslugi);


--
-- TOC entry 4957 (class 2606 OID 16608)
-- Name: uslugi_specjalizacje uslugi_specjalizacje_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.uslugi_specjalizacje
    ADD CONSTRAINT uslugi_specjalizacje_pkey PRIMARY KEY (id_uslugi, id_specjalizacji);


--
-- TOC entry 4947 (class 2606 OID 16523)
-- Name: wizyty_opinie wizyty_opinie_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wizyty_opinie
    ADD CONSTRAINT wizyty_opinie_pkey PRIMARY KEY (id_wizyty, id_opinii);


--
-- TOC entry 4935 (class 2606 OID 16446)
-- Name: wizyty wizyty_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wizyty
    ADD CONSTRAINT wizyty_pkey PRIMARY KEY (id_wizyty);


--
-- TOC entry 4949 (class 2606 OID 16540)
-- Name: wizyty_uslugi wizyty_uslugi_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wizyty_uslugi
    ADD CONSTRAINT wizyty_uslugi_pkey PRIMARY KEY (id_wizyty, id_uslugi);


--
-- TOC entry 4960 (class 2606 OID 16512)
-- Name: klienci_opinie klienci_opinie_id_klienta_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.klienci_opinie
    ADD CONSTRAINT klienci_opinie_id_klienta_fkey FOREIGN KEY (id_klienta) REFERENCES public.klienci(id_klienta) ON DELETE CASCADE;


--
-- TOC entry 4961 (class 2606 OID 16507)
-- Name: klienci_opinie klienci_opinie_id_opinii_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.klienci_opinie
    ADD CONSTRAINT klienci_opinie_id_opinii_fkey FOREIGN KEY (id_opinii) REFERENCES public.opinie(id_opinii) ON DELETE CASCADE;


--
-- TOC entry 4958 (class 2606 OID 16490)
-- Name: klienci_wizyty klienci_wizyty_id_klienta_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.klienci_wizyty
    ADD CONSTRAINT klienci_wizyty_id_klienta_fkey FOREIGN KEY (id_klienta) REFERENCES public.klienci(id_klienta) ON DELETE CASCADE;


--
-- TOC entry 4959 (class 2606 OID 16495)
-- Name: klienci_wizyty klienci_wizyty_id_wizyty_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.klienci_wizyty
    ADD CONSTRAINT klienci_wizyty_id_wizyty_fkey FOREIGN KEY (id_wizyty) REFERENCES public.wizyty(id_wizyty) ON DELETE CASCADE;


--
-- TOC entry 4968 (class 2606 OID 16575)
-- Name: pracownicy_specjalizacje pracownicy_specjalizacje_id_pracownika_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pracownicy_specjalizacje
    ADD CONSTRAINT pracownicy_specjalizacje_id_pracownika_fkey FOREIGN KEY (id_pracownika) REFERENCES public.pracownicy(id_pracownika) ON DELETE CASCADE;


--
-- TOC entry 4969 (class 2606 OID 16580)
-- Name: pracownicy_specjalizacje pracownicy_specjalizacje_id_specjalizacji_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pracownicy_specjalizacje
    ADD CONSTRAINT pracownicy_specjalizacje_id_specjalizacji_fkey FOREIGN KEY (id_specjalizacji) REFERENCES public.specjalizacje(id_specjalizacji) ON DELETE CASCADE;


--
-- TOC entry 4970 (class 2606 OID 16592)
-- Name: pracownicy_uslugi pracownicy_uslugi_id_pracownika_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pracownicy_uslugi
    ADD CONSTRAINT pracownicy_uslugi_id_pracownika_fkey FOREIGN KEY (id_pracownika) REFERENCES public.pracownicy(id_pracownika) ON DELETE CASCADE;


--
-- TOC entry 4971 (class 2606 OID 16597)
-- Name: pracownicy_uslugi pracownicy_uslugi_id_uslugi_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pracownicy_uslugi
    ADD CONSTRAINT pracownicy_uslugi_id_uslugi_fkey FOREIGN KEY (id_uslugi) REFERENCES public.uslugi(id_uslugi) ON DELETE CASCADE;


--
-- TOC entry 4966 (class 2606 OID 16558)
-- Name: pracownicy_wizyty pracownicy_wizyty_id_pracownika_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pracownicy_wizyty
    ADD CONSTRAINT pracownicy_wizyty_id_pracownika_fkey FOREIGN KEY (id_pracownika) REFERENCES public.pracownicy(id_pracownika) ON DELETE CASCADE;


--
-- TOC entry 4967 (class 2606 OID 16563)
-- Name: pracownicy_wizyty pracownicy_wizyty_id_wizyty_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pracownicy_wizyty
    ADD CONSTRAINT pracownicy_wizyty_id_wizyty_fkey FOREIGN KEY (id_wizyty) REFERENCES public.wizyty(id_wizyty) ON DELETE CASCADE;


--
-- TOC entry 4972 (class 2606 OID 16614)
-- Name: uslugi_specjalizacje uslugi_specjalizacje_id_specjalizacji_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.uslugi_specjalizacje
    ADD CONSTRAINT uslugi_specjalizacje_id_specjalizacji_fkey FOREIGN KEY (id_specjalizacji) REFERENCES public.specjalizacje(id_specjalizacji) ON DELETE CASCADE;


--
-- TOC entry 4973 (class 2606 OID 16609)
-- Name: uslugi_specjalizacje uslugi_specjalizacje_id_uslugi_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.uslugi_specjalizacje
    ADD CONSTRAINT uslugi_specjalizacje_id_uslugi_fkey FOREIGN KEY (id_uslugi) REFERENCES public.uslugi(id_uslugi) ON DELETE CASCADE;


--
-- TOC entry 4962 (class 2606 OID 16529)
-- Name: wizyty_opinie wizyty_opinie_id_opinii_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wizyty_opinie
    ADD CONSTRAINT wizyty_opinie_id_opinii_fkey FOREIGN KEY (id_opinii) REFERENCES public.opinie(id_opinii) ON DELETE CASCADE;


--
-- TOC entry 4963 (class 2606 OID 16524)
-- Name: wizyty_opinie wizyty_opinie_id_wizyty_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wizyty_opinie
    ADD CONSTRAINT wizyty_opinie_id_wizyty_fkey FOREIGN KEY (id_wizyty) REFERENCES public.wizyty(id_wizyty) ON DELETE CASCADE;


--
-- TOC entry 4964 (class 2606 OID 16546)
-- Name: wizyty_uslugi wizyty_uslugi_id_uslugi_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wizyty_uslugi
    ADD CONSTRAINT wizyty_uslugi_id_uslugi_fkey FOREIGN KEY (id_uslugi) REFERENCES public.uslugi(id_uslugi) ON DELETE CASCADE;


--
-- TOC entry 4965 (class 2606 OID 16541)
-- Name: wizyty_uslugi wizyty_uslugi_id_wizyty_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wizyty_uslugi
    ADD CONSTRAINT wizyty_uslugi_id_wizyty_fkey FOREIGN KEY (id_wizyty) REFERENCES public.wizyty(id_wizyty) ON DELETE CASCADE;


-- Completed on 2025-11-23 18:58:20

--
-- PostgreSQL database dump complete
--

\unrestrict nJpijMdjeqpph9NRRRiBMlRBkJilcxQ91vbNtWML54x1J35Ukr3wxekcTb1cB0f

