--
-- PostgreSQL database dump
--

\restrict dNT4xzQxiqpFQBjlkRmfLh7xOsiifh4THhyjPrTlyDEyuvgevBdMCX8eKQfD74m

-- Dumped from database version 17.6
-- Dumped by pg_dump version 17.6

-- Started on 2025-10-30 13:19:42

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
-- TOC entry 223 (class 1259 OID 18800)
-- Name: Categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Categories" (
    id integer NOT NULL,
    name text
);


ALTER TABLE public."Categories" OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 18774)
-- Name: clients; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.clients (
    id integer NOT NULL,
    username text,
    password text,
    "firstName" text,
    "lastName" text,
    patronymic text,
    company_name text,
    inn integer,
    phone character(11)
);


ALTER TABLE public.clients OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 18773)
-- Name: clients_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.clients_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.clients_id_seq OWNER TO postgres;

--
-- TOC entry 5015 (class 0 OID 0)
-- Dependencies: 217
-- Name: clients_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.clients_id_seq OWNED BY public.clients.id;


--
-- TOC entry 233 (class 1259 OID 18851)
-- Name: employee_inventory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employee_inventory (
    id integer NOT NULL,
    id_employee integer,
    id_inventory integer
);


ALTER TABLE public.employee_inventory OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 18850)
-- Name: employee_inventory_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.employee_inventory_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.employee_inventory_id_seq OWNER TO postgres;

--
-- TOC entry 5016 (class 0 OID 0)
-- Dependencies: 232
-- Name: employee_inventory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.employee_inventory_id_seq OWNED BY public.employee_inventory.id;


--
-- TOC entry 227 (class 1259 OID 18815)
-- Name: employess; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employess (
    id integer NOT NULL,
    username text,
    password text,
    id_role integer,
    "firstName" text,
    "lastName" text,
    patronymic text,
    phone character(11),
    passport_seriya integer,
    passport_number integer
);


ALTER TABLE public.employess OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 18814)
-- Name: employess_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.employess_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.employess_id_seq OWNER TO postgres;

--
-- TOC entry 5017 (class 0 OID 0)
-- Dependencies: 226
-- Name: employess_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.employess_id_seq OWNED BY public.employess.id;


--
-- TOC entry 222 (class 1259 OID 18792)
-- Name: inventories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.inventories (
    id integer NOT NULL,
    name text,
    id_category integer,
    id_sostoyanie integer,
    base_price numeric(10,2),
    image text,
    description text,
    id_status integer,
    id_sklad integer
);


ALTER TABLE public.inventories OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 18791)
-- Name: inventories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.inventories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.inventories_id_seq OWNER TO postgres;

--
-- TOC entry 5018 (class 0 OID 0)
-- Dependencies: 221
-- Name: inventories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.inventories_id_seq OWNED BY public.inventories.id;


--
-- TOC entry 237 (class 1259 OID 18865)
-- Name: proverka; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.proverka (
    id integer NOT NULL,
    name text
);


ALTER TABLE public.proverka OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 18864)
-- Name: proverka_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.proverka_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.proverka_id_seq OWNER TO postgres;

--
-- TOC entry 5019 (class 0 OID 0)
-- Dependencies: 236
-- Name: proverka_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.proverka_id_seq OWNED BY public.proverka.id;


--
-- TOC entry 235 (class 1259 OID 18858)
-- Name: rental_statuses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rental_statuses (
    id integer NOT NULL
);


ALTER TABLE public.rental_statuses OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 18857)
-- Name: rental_statuses_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.rental_statuses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.rental_statuses_id_seq OWNER TO postgres;

--
-- TOC entry 5020 (class 0 OID 0)
-- Dependencies: 234
-- Name: rental_statuses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.rental_statuses_id_seq OWNED BY public.rental_statuses.id;


--
-- TOC entry 225 (class 1259 OID 18808)
-- Name: rentals; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rentals (
    id integer NOT NULL,
    id_user integer,
    id_inventory integer,
    start_date date,
    end_date date,
    final_price numeric(10,2),
    id_rental_status integer,
    id_proverka integer
);


ALTER TABLE public.rentals OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 18807)
-- Name: rentals_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.rentals_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.rentals_id_seq OWNER TO postgres;

--
-- TOC entry 5021 (class 0 OID 0)
-- Dependencies: 224
-- Name: rentals_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.rentals_id_seq OWNED BY public.rentals.id;


--
-- TOC entry 220 (class 1259 OID 18783)
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roles (
    id integer NOT NULL,
    name text
);


ALTER TABLE public.roles OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 18782)
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.roles_id_seq OWNER TO postgres;

--
-- TOC entry 5022 (class 0 OID 0)
-- Dependencies: 219
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;


--
-- TOC entry 239 (class 1259 OID 18930)
-- Name: sklad; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sklad (
    id integer NOT NULL,
    name text
);


ALTER TABLE public.sklad OWNER TO postgres;

--
-- TOC entry 238 (class 1259 OID 18929)
-- Name: sklad_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sklad_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.sklad_id_seq OWNER TO postgres;

--
-- TOC entry 5023 (class 0 OID 0)
-- Dependencies: 238
-- Name: sklad_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sklad_id_seq OWNED BY public.sklad.id;


--
-- TOC entry 229 (class 1259 OID 18833)
-- Name: sostoyanie; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sostoyanie (
    id integer NOT NULL,
    name text
);


ALTER TABLE public.sostoyanie OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 18832)
-- Name: sostoyanie_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sostoyanie_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.sostoyanie_id_seq OWNER TO postgres;

--
-- TOC entry 5024 (class 0 OID 0)
-- Dependencies: 228
-- Name: sostoyanie_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sostoyanie_id_seq OWNED BY public.sostoyanie.id;


--
-- TOC entry 231 (class 1259 OID 18842)
-- Name: statuses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.statuses (
    id integer NOT NULL,
    name text
);


ALTER TABLE public.statuses OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 18841)
-- Name: statuses_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.statuses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.statuses_id_seq OWNER TO postgres;

--
-- TOC entry 5025 (class 0 OID 0)
-- Dependencies: 230
-- Name: statuses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.statuses_id_seq OWNED BY public.statuses.id;


--
-- TOC entry 4796 (class 2604 OID 18777)
-- Name: clients id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clients ALTER COLUMN id SET DEFAULT nextval('public.clients_id_seq'::regclass);


--
-- TOC entry 4803 (class 2604 OID 18854)
-- Name: employee_inventory id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_inventory ALTER COLUMN id SET DEFAULT nextval('public.employee_inventory_id_seq'::regclass);


--
-- TOC entry 4800 (class 2604 OID 18818)
-- Name: employess id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employess ALTER COLUMN id SET DEFAULT nextval('public.employess_id_seq'::regclass);


--
-- TOC entry 4798 (class 2604 OID 18795)
-- Name: inventories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventories ALTER COLUMN id SET DEFAULT nextval('public.inventories_id_seq'::regclass);


--
-- TOC entry 4805 (class 2604 OID 18868)
-- Name: proverka id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.proverka ALTER COLUMN id SET DEFAULT nextval('public.proverka_id_seq'::regclass);


--
-- TOC entry 4804 (class 2604 OID 18861)
-- Name: rental_statuses id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rental_statuses ALTER COLUMN id SET DEFAULT nextval('public.rental_statuses_id_seq'::regclass);


--
-- TOC entry 4799 (class 2604 OID 18811)
-- Name: rentals id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rentals ALTER COLUMN id SET DEFAULT nextval('public.rentals_id_seq'::regclass);


--
-- TOC entry 4797 (class 2604 OID 18786)
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);


--
-- TOC entry 4806 (class 2604 OID 18933)
-- Name: sklad id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sklad ALTER COLUMN id SET DEFAULT nextval('public.sklad_id_seq'::regclass);


--
-- TOC entry 4801 (class 2604 OID 18836)
-- Name: sostoyanie id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sostoyanie ALTER COLUMN id SET DEFAULT nextval('public.sostoyanie_id_seq'::regclass);


--
-- TOC entry 4802 (class 2604 OID 18845)
-- Name: statuses id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.statuses ALTER COLUMN id SET DEFAULT nextval('public.statuses_id_seq'::regclass);


--
-- TOC entry 4993 (class 0 OID 18800)
-- Dependencies: 223
-- Data for Name: Categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Categories" (id, name) FROM stdin;
1	зимние виды спорта
2	велосипеды
3	водный спорт
\.


--
-- TOC entry 4988 (class 0 OID 18774)
-- Dependencies: 218
-- Data for Name: clients; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.clients (id, username, password, "firstName", "lastName", patronymic, company_name, inn, phone) FROM stdin;
\.


--
-- TOC entry 5003 (class 0 OID 18851)
-- Dependencies: 233
-- Data for Name: employee_inventory; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.employee_inventory (id, id_employee, id_inventory) FROM stdin;
\.


--
-- TOC entry 4997 (class 0 OID 18815)
-- Dependencies: 227
-- Data for Name: employess; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.employess (id, username, password, id_role, "firstName", "lastName", patronymic, phone, passport_seriya, passport_number) FROM stdin;
\.


--
-- TOC entry 4992 (class 0 OID 18792)
-- Dependencies: 222
-- Data for Name: inventories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.inventories (id, name, id_category, id_sostoyanie, base_price, image, description, id_status, id_sklad) FROM stdin;
1	лыжи	1	1	1000.00	\N	лыжи для гонок	1	1
2	ласты	3	2	500.00	\N	супер крутые ласты 38 размера	2	2
3	скоростной велосипед	2	2	2500.00	\N	велосипед с возможностью изменять скорость	1	1
4	горный велосипед	2	1	4000.00	\N	для гор и не только	2	2
5	fvvdf	1	1	1000.00	\N	dfsvfvvs	1	1
6	455434	2	1	200.00	\N	fvvfd	1	2
7	смамав	1	1	12121.00	\N	всвсв	1	\N
\.


--
-- TOC entry 5007 (class 0 OID 18865)
-- Dependencies: 237
-- Data for Name: proverka; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.proverka (id, name) FROM stdin;
\.


--
-- TOC entry 5005 (class 0 OID 18858)
-- Dependencies: 235
-- Data for Name: rental_statuses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rental_statuses (id) FROM stdin;
\.


--
-- TOC entry 4995 (class 0 OID 18808)
-- Dependencies: 225
-- Data for Name: rentals; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rentals (id, id_user, id_inventory, start_date, end_date, final_price, id_rental_status, id_proverka) FROM stdin;
\.


--
-- TOC entry 4990 (class 0 OID 18783)
-- Dependencies: 220
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.roles (id, name) FROM stdin;
\.


--
-- TOC entry 5009 (class 0 OID 18930)
-- Dependencies: 239
-- Data for Name: sklad; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sklad (id, name) FROM stdin;
1	склад А1
2	склад Б1
\.


--
-- TOC entry 4999 (class 0 OID 18833)
-- Dependencies: 229
-- Data for Name: sostoyanie; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sostoyanie (id, name) FROM stdin;
1	новый
2	б/у
\.


--
-- TOC entry 5001 (class 0 OID 18842)
-- Dependencies: 231
-- Data for Name: statuses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.statuses (id, name) FROM stdin;
1	доступен
2	в аренде
3	на ремонте
\.


--
-- TOC entry 5026 (class 0 OID 0)
-- Dependencies: 217
-- Name: clients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.clients_id_seq', 1, false);


--
-- TOC entry 5027 (class 0 OID 0)
-- Dependencies: 232
-- Name: employee_inventory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.employee_inventory_id_seq', 1, false);


--
-- TOC entry 5028 (class 0 OID 0)
-- Dependencies: 226
-- Name: employess_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.employess_id_seq', 1, false);


--
-- TOC entry 5029 (class 0 OID 0)
-- Dependencies: 221
-- Name: inventories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.inventories_id_seq', 7, true);


--
-- TOC entry 5030 (class 0 OID 0)
-- Dependencies: 236
-- Name: proverka_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.proverka_id_seq', 1, false);


--
-- TOC entry 5031 (class 0 OID 0)
-- Dependencies: 234
-- Name: rental_statuses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.rental_statuses_id_seq', 1, false);


--
-- TOC entry 5032 (class 0 OID 0)
-- Dependencies: 224
-- Name: rentals_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.rentals_id_seq', 1, false);


--
-- TOC entry 5033 (class 0 OID 0)
-- Dependencies: 219
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.roles_id_seq', 1, false);


--
-- TOC entry 5034 (class 0 OID 0)
-- Dependencies: 238
-- Name: sklad_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sklad_id_seq', 2, true);


--
-- TOC entry 5035 (class 0 OID 0)
-- Dependencies: 228
-- Name: sostoyanie_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sostoyanie_id_seq', 2, true);


--
-- TOC entry 5036 (class 0 OID 0)
-- Dependencies: 230
-- Name: statuses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.statuses_id_seq', 3, true);


--
-- TOC entry 4814 (class 2606 OID 18806)
-- Name: Categories Categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Categories"
    ADD CONSTRAINT "Categories_pkey" PRIMARY KEY (id);


--
-- TOC entry 4808 (class 2606 OID 18781)
-- Name: clients clients_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clients
    ADD CONSTRAINT clients_pkey PRIMARY KEY (id);


--
-- TOC entry 4824 (class 2606 OID 18856)
-- Name: employee_inventory employee_inventory_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_inventory
    ADD CONSTRAINT employee_inventory_pkey PRIMARY KEY (id);


--
-- TOC entry 4818 (class 2606 OID 18822)
-- Name: employess employess_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employess
    ADD CONSTRAINT employess_pkey PRIMARY KEY (id);


--
-- TOC entry 4812 (class 2606 OID 18799)
-- Name: inventories inventories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventories
    ADD CONSTRAINT inventories_pkey PRIMARY KEY (id);


--
-- TOC entry 4828 (class 2606 OID 18872)
-- Name: proverka proverka_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.proverka
    ADD CONSTRAINT proverka_pkey PRIMARY KEY (id);


--
-- TOC entry 4826 (class 2606 OID 18863)
-- Name: rental_statuses rental_statuses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rental_statuses
    ADD CONSTRAINT rental_statuses_pkey PRIMARY KEY (id);


--
-- TOC entry 4816 (class 2606 OID 18813)
-- Name: rentals rentals_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rentals
    ADD CONSTRAINT rentals_pkey PRIMARY KEY (id);


--
-- TOC entry 4810 (class 2606 OID 18790)
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- TOC entry 4830 (class 2606 OID 18937)
-- Name: sklad sklad_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sklad
    ADD CONSTRAINT sklad_pkey PRIMARY KEY (id);


--
-- TOC entry 4820 (class 2606 OID 18840)
-- Name: sostoyanie sostoyanie_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sostoyanie
    ADD CONSTRAINT sostoyanie_pkey PRIMARY KEY (id);


--
-- TOC entry 4822 (class 2606 OID 18849)
-- Name: statuses statuses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.statuses
    ADD CONSTRAINT statuses_pkey PRIMARY KEY (id);


--
-- TOC entry 4840 (class 2606 OID 18918)
-- Name: employee_inventory employee_inventory_id_employee_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_inventory
    ADD CONSTRAINT employee_inventory_id_employee_fkey FOREIGN KEY (id_employee) REFERENCES public.employess(id) NOT VALID;


--
-- TOC entry 4841 (class 2606 OID 18923)
-- Name: employee_inventory employee_inventory_id_inventory_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_inventory
    ADD CONSTRAINT employee_inventory_id_inventory_fkey FOREIGN KEY (id_inventory) REFERENCES public.inventories(id) NOT VALID;


--
-- TOC entry 4839 (class 2606 OID 18913)
-- Name: employess employess_id_role_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employess
    ADD CONSTRAINT employess_id_role_fkey FOREIGN KEY (id_role) REFERENCES public.roles(id) NOT VALID;


--
-- TOC entry 4831 (class 2606 OID 18873)
-- Name: inventories inventories_id_category_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventories
    ADD CONSTRAINT inventories_id_category_fkey FOREIGN KEY (id_category) REFERENCES public."Categories"(id) NOT VALID;


--
-- TOC entry 4832 (class 2606 OID 18938)
-- Name: inventories inventories_id_sklad_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventories
    ADD CONSTRAINT inventories_id_sklad_fkey FOREIGN KEY (id_sklad) REFERENCES public.sklad(id) NOT VALID;


--
-- TOC entry 4833 (class 2606 OID 18883)
-- Name: inventories inventories_id_sostoyanie_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventories
    ADD CONSTRAINT inventories_id_sostoyanie_fkey FOREIGN KEY (id_sostoyanie) REFERENCES public.sostoyanie(id) NOT VALID;


--
-- TOC entry 4834 (class 2606 OID 18888)
-- Name: inventories inventories_id_status_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventories
    ADD CONSTRAINT inventories_id_status_fkey FOREIGN KEY (id_status) REFERENCES public.statuses(id) NOT VALID;


--
-- TOC entry 4835 (class 2606 OID 18898)
-- Name: rentals rentals_id_inventory_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rentals
    ADD CONSTRAINT rentals_id_inventory_fkey FOREIGN KEY (id_inventory) REFERENCES public.inventories(id) NOT VALID;


--
-- TOC entry 4836 (class 2606 OID 18908)
-- Name: rentals rentals_id_proverka_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rentals
    ADD CONSTRAINT rentals_id_proverka_fkey FOREIGN KEY (id_proverka) REFERENCES public.proverka(id) NOT VALID;


--
-- TOC entry 4837 (class 2606 OID 18903)
-- Name: rentals rentals_id_rental_status_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rentals
    ADD CONSTRAINT rentals_id_rental_status_fkey FOREIGN KEY (id_rental_status) REFERENCES public.rental_statuses(id) NOT VALID;


--
-- TOC entry 4838 (class 2606 OID 18893)
-- Name: rentals rentals_id_user_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rentals
    ADD CONSTRAINT rentals_id_user_fkey FOREIGN KEY (id_user) REFERENCES public.clients(id) NOT VALID;


-- Completed on 2025-10-30 13:19:42

--
-- PostgreSQL database dump complete
--

\unrestrict dNT4xzQxiqpFQBjlkRmfLh7xOsiifh4THhyjPrTlyDEyuvgevBdMCX8eKQfD74m

