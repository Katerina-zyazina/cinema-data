--
-- PostgreSQL database dump
--

\restrict nFhTgTRUHXnA0CdZMKqLvOF1HG4UtTOjnRWU8hBlUULwpWJ7XE0wcYzfqtgMKb0

-- Dumped from database version 18.6
-- Dumped by pg_dump version 18.6

-- Started on 2026-11-09 16:25:15

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
-- TOC entry 226 (class 1259 OID 61979)
-- Name: cinema_types; Type: TABLE; Schema: cinema_data; Owner: postgres
--

CREATE TABLE cinema_data.cinema_types (
    type_id bigint NOT NULL,
    type_name character varying(100) NOT NULL,
    created_at timestamp with time zone DEFAULT now()
);


ALTER TABLE cinema_data.cinema_types OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 61978)
-- Name: cinema_types_type_id_seq; Type: SEQUENCE; Schema: cinema_data; Owner: postgres
--

CREATE SEQUENCE cinema_data.cinema_types_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE cinema_data.cinema_types_type_id_seq OWNER TO postgres;

--
-- TOC entry 5953 (class 0 OID 0)
-- Dependencies: 225
-- Name: cinema_types_type_id_seq; Type: SEQUENCE OWNED BY; Schema: cinema_data; Owner: postgres
--

ALTER SEQUENCE cinema_data.cinema_types_type_id_seq OWNED BY cinema_data.cinema_types.type_id;


--
-- TOC entry 228 (class 1259 OID 61999)
-- Name: cinemas_final; Type: TABLE; Schema: cinema_data; Owner: postgres
--

CREATE TABLE cinema_data.cinemas_final (
    id bigint NOT NULL,
    name text NOT NULL,
    address text NOT NULL,
    geodata text,
    geom cinema_data.geometry(Point,4326)
);


ALTER TABLE cinema_data.cinemas_final OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 61990)
-- Name: cinemas_raw; Type: TABLE; Schema: cinema_data; Owner: postgres
--

CREATE TABLE cinema_data.cinemas_raw (
    id bigint NOT NULL,
    name text NOT NULL,
    address text,
    geodata text,
    tags text
);


ALTER TABLE cinema_data.cinemas_raw OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 62009)
-- Name: m2m_cinemas_types; Type: TABLE; Schema: cinema_data; Owner: postgres
--

CREATE TABLE cinema_data.m2m_cinemas_types (
    cinema_id bigint NOT NULL,
    type_id bigint NOT NULL
);


ALTER TABLE cinema_data.m2m_cinemas_types OWNER TO postgres;

--
-- TOC entry 5776 (class 2604 OID 61982)
-- Name: cinema_types type_id; Type: DEFAULT; Schema: cinema_data; Owner: postgres
--

ALTER TABLE ONLY cinema_data.cinema_types ALTER COLUMN type_id SET DEFAULT nextval('cinema_data.cinema_types_type_id_seq'::regclass);


--
-- TOC entry 5944 (class 0 OID 61979)
-- Dependencies: 226
-- Data for Name: cinema_types; Type: TABLE DATA; Schema: cinema_data; Owner: postgres
--

INSERT INTO cinema_data.cinema_types VALUES (1, 'Арт-хаус', '2026-11-09 16:04:41.517925+03');
INSERT INTO cinema_data.cinema_types VALUES (2, '4DX', '2026-11-09 16:04:41.517925+03');
INSERT INTO cinema_data.cinema_types VALUES (3, 'Исторический', '2026-11-09 16:04:41.517925+03');
INSERT INTO cinema_data.cinema_types VALUES (4, 'IMAX', '2026-11-09 16:04:41.517925+03');
INSERT INTO cinema_data.cinema_types VALUES (5, 'Кинотеатр', '2026-11-09 16:04:41.517925+03');


--
-- TOC entry 5946 (class 0 OID 61999)
-- Dependencies: 228
-- Data for Name: cinemas_final; Type: TABLE DATA; Schema: cinema_data; Owner: postgres
--

INSERT INTO cinema_data.cinemas_final VALUES (1, 'Каро 11 Октябрь', 'Новый Арбат, 24', '{Geometry}{type=Point, coordinates=[37.5833, 55.7614]}', '0101000020E6100000DFE00B93A9CA42405396218E75E14B40');
INSERT INTO cinema_data.cinemas_final VALUES (2, 'Художественный', 'Арбатская пл., 14', '{Geometry}{type=Point, coordinates=[37.5986, 55.7522]}', '0101000020E61000005BB1BFEC9ECC42408E06F01648E04B40');
INSERT INTO cinema_data.cinemas_final VALUES (3, 'Иллюзион', 'Котельническая наб., 1/15', '{Geometry}{type=Point, coordinates=[37.6264, 55.7465]}', '0101000020E6100000711B0DE02DD04240643BDF4F8DDF4B40');
INSERT INTO cinema_data.cinemas_final VALUES (4, 'Пионер', 'Кутузовский просп., 21', '{Geometry}{type=Point, coordinates=[37.5125, 55.7333]}', '0101000020E61000009A99999999C1424012143FC6DCDD4B40');
INSERT INTO cinema_data.cinemas_final VALUES (5, 'Формула Кино Горизонт', 'ул. Павла Корчагина, 2А', '{Geometry}{type=Point, coordinates=[37.6389, 55.8186]}', '0101000020E61000000BB5A679C7D14240B84082E2C7E84B40');
INSERT INTO cinema_data.cinemas_final VALUES (6, 'Синема Парк Мосфильм', 'Мосфильмовская ул., 1', '{Geometry}{type=Point, coordinates=[37.5417, 55.7194]}', '0101000020E6100000211FF46C56C54240075F984C15DC4B40');
INSERT INTO cinema_data.cinemas_final VALUES (7, 'Люксор в Вегасе', 'ул. Архитектора Власова, 55', '{Geometry}{type=Point, coordinates=[37.4833, 55.6333]}', '0101000020E610000012143FC6DCBD4240454772F90FD14B40');
INSERT INTO cinema_data.cinemas_final VALUES (8, 'Киностан', 'Ленинградский просп., 80', '{Geometry}{type=Point, coordinates=[37.5167, 55.8000]}', '0101000020E6100000EEEBC03923C242406666666666E64B40');
INSERT INTO cinema_data.cinemas_final VALUES (9, 'Салют', 'ул. Вавилова, 15', '{Geometry}{type=Point, coordinates=[37.5833, 55.7000]}', '0101000020E6100000DFE00B93A9CA42409A99999999D94B40');
INSERT INTO cinema_data.cinemas_final VALUES (10, 'Звезда', 'ул. Талалихина, 41', '{Geometry}{type=Point, coordinates=[37.6667, 55.7333]}', '0101000020E6100000211FF46C56D5424012143FC6DCDD4B40');
INSERT INTO cinema_data.cinemas_final VALUES (11, 'Факел', 'Зубовский бул., 15', '{Geometry}{type=Point, coordinates=[37.5917, 55.7417]}', '0101000020E610000088855AD3BCCB4240BBB88D06F0DE4B40');
INSERT INTO cinema_data.cinemas_final VALUES (12, 'Молодёжный', 'ул. Молодёжная, 21', '{Geometry}{type=Point, coordinates=[37.3833, 55.7167]}', '0101000020E6100000454772F90FB1424088855AD3BCDB4B40');
INSERT INTO cinema_data.cinemas_final VALUES (13, 'Тула', 'ул. Тульская, 1', '{Geometry}{type=Point, coordinates=[37.6333, 55.7167]}', '0101000020E6100000454772F90FD1424088855AD3BCDB4B40');
INSERT INTO cinema_data.cinemas_final VALUES (14, 'Ереван', 'ул. Арбат, 10', '{Geometry}{type=Point, coordinates=[37.5950, 55.7530]}', '0101000020E61000005C8FC2F528CC4240AAF1D24D62E04B40');
INSERT INTO cinema_data.cinemas_final VALUES (15, 'Дом Кино', 'ул. Васильевская, 13', '{Geometry}{type=Point, coordinates=[37.6000, 55.7500]}', '0101000020E6100000CDCCCCCCCCCC42400000000000E04B40');


--
-- TOC entry 5945 (class 0 OID 61990)
-- Dependencies: 227
-- Data for Name: cinemas_raw; Type: TABLE DATA; Schema: cinema_data; Owner: postgres
--

INSERT INTO cinema_data.cinemas_raw VALUES (1, 'Каро 11 Октябрь', 'Новый Арбат, 24', '{Geometry}{type=Point, coordinates=[37.5833, 55.7614]}', '[Кинотеатр, IMAX]');
INSERT INTO cinema_data.cinemas_raw VALUES (2, 'Художественный', 'Арбатская пл., 14', '{Geometry}{type=Point, coordinates=[37.5986, 55.7522]}', '[Кинотеатр, Исторический]');
INSERT INTO cinema_data.cinemas_raw VALUES (3, 'Иллюзион', 'Котельническая наб., 1/15', '{Geometry}{type=Point, coordinates=[37.6264, 55.7465]}', '[Кинотеатр, Арт-хаус]');
INSERT INTO cinema_data.cinemas_raw VALUES (4, 'Пионер', 'Кутузовский просп., 21', '{Geometry}{type=Point, coordinates=[37.5125, 55.7333]}', '[Кинотеатр, Арт-хаус]');
INSERT INTO cinema_data.cinemas_raw VALUES (5, 'Формула Кино Горизонт', 'ул. Павла Корчагина, 2А', '{Geometry}{type=Point, coordinates=[37.6389, 55.8186]}', '[Кинотеатр, IMAX, 4DX]');
INSERT INTO cinema_data.cinemas_raw VALUES (6, 'Синема Парк Мосфильм', 'Мосфильмовская ул., 1', '{Geometry}{type=Point, coordinates=[37.5417, 55.7194]}', '[Кинотеатр, IMAX]');
INSERT INTO cinema_data.cinemas_raw VALUES (7, 'Люксор в Вегасе', 'ул. Архитектора Власова, 55', '{Geometry}{type=Point, coordinates=[37.4833, 55.6333]}', '[Кинотеатр]');
INSERT INTO cinema_data.cinemas_raw VALUES (8, 'Киностан', 'Ленинградский просп., 80', '{Geometry}{type=Point, coordinates=[37.5167, 55.8000]}', '[Кинотеатр, Исторический]');
INSERT INTO cinema_data.cinemas_raw VALUES (9, 'Салют', 'ул. Вавилова, 15', '{Geometry}{type=Point, coordinates=[37.5833, 55.7000]}', '[Кинотеатр, Исторический]');
INSERT INTO cinema_data.cinemas_raw VALUES (10, 'Звезда', 'ул. Талалихина, 41', '{Geometry}{type=Point, coordinates=[37.6667, 55.7333]}', '[Кинотеатр, Исторический]');
INSERT INTO cinema_data.cinemas_raw VALUES (11, 'Факел', 'Зубовский бул., 15', '{Geometry}{type=Point, coordinates=[37.5917, 55.7417]}', '[Кинотеатр, Исторический]');
INSERT INTO cinema_data.cinemas_raw VALUES (12, 'Молодёжный', 'ул. Молодёжная, 21', '{Geometry}{type=Point, coordinates=[37.3833, 55.7167]}', '[Кинотеатр]');
INSERT INTO cinema_data.cinemas_raw VALUES (13, 'Тула', 'ул. Тульская, 1', '{Geometry}{type=Point, coordinates=[37.6333, 55.7167]}', '[Кинотеатр]');
INSERT INTO cinema_data.cinemas_raw VALUES (14, 'Ереван', 'ул. Арбат, 10', '{Geometry}{type=Point, coordinates=[37.5950, 55.7530]}', '[Кинотеатр, Арт-хаус]');
INSERT INTO cinema_data.cinemas_raw VALUES (15, 'Дом Кино', 'ул. Васильевская, 13', '{Geometry}{type=Point, coordinates=[37.6000, 55.7500]}', '[Кинотеатр, Арт-хаус, Исторический]');


--
-- TOC entry 5947 (class 0 OID 62009)
-- Dependencies: 229
-- Data for Name: m2m_cinemas_types; Type: TABLE DATA; Schema: cinema_data; Owner: postgres
--

INSERT INTO cinema_data.m2m_cinemas_types VALUES (1, 5);
INSERT INTO cinema_data.m2m_cinemas_types VALUES (1, 4);
INSERT INTO cinema_data.m2m_cinemas_types VALUES (2, 5);
INSERT INTO cinema_data.m2m_cinemas_types VALUES (2, 3);
INSERT INTO cinema_data.m2m_cinemas_types VALUES (3, 5);
INSERT INTO cinema_data.m2m_cinemas_types VALUES (3, 1);
INSERT INTO cinema_data.m2m_cinemas_types VALUES (4, 5);
INSERT INTO cinema_data.m2m_cinemas_types VALUES (4, 1);
INSERT INTO cinema_data.m2m_cinemas_types VALUES (5, 5);
INSERT INTO cinema_data.m2m_cinemas_types VALUES (5, 4);
INSERT INTO cinema_data.m2m_cinemas_types VALUES (5, 2);
INSERT INTO cinema_data.m2m_cinemas_types VALUES (6, 5);
INSERT INTO cinema_data.m2m_cinemas_types VALUES (6, 4);
INSERT INTO cinema_data.m2m_cinemas_types VALUES (7, 5);
INSERT INTO cinema_data.m2m_cinemas_types VALUES (8, 5);
INSERT INTO cinema_data.m2m_cinemas_types VALUES (8, 3);
INSERT INTO cinema_data.m2m_cinemas_types VALUES (9, 5);
INSERT INTO cinema_data.m2m_cinemas_types VALUES (9, 3);
INSERT INTO cinema_data.m2m_cinemas_types VALUES (10, 5);
INSERT INTO cinema_data.m2m_cinemas_types VALUES (10, 3);
INSERT INTO cinema_data.m2m_cinemas_types VALUES (11, 5);
INSERT INTO cinema_data.m2m_cinemas_types VALUES (11, 3);
INSERT INTO cinema_data.m2m_cinemas_types VALUES (12, 5);
INSERT INTO cinema_data.m2m_cinemas_types VALUES (13, 5);
INSERT INTO cinema_data.m2m_cinemas_types VALUES (14, 5);
INSERT INTO cinema_data.m2m_cinemas_types VALUES (14, 1);
INSERT INTO cinema_data.m2m_cinemas_types VALUES (15, 5);
INSERT INTO cinema_data.m2m_cinemas_types VALUES (15, 1);
INSERT INTO cinema_data.m2m_cinemas_types VALUES (15, 3);


--
-- TOC entry 5954 (class 0 OID 0)
-- Dependencies: 225
-- Name: cinema_types_type_id_seq; Type: SEQUENCE SET; Schema: cinema_data; Owner: postgres
--

SELECT pg_catalog.setval('cinema_data.cinema_types_type_id_seq', 5, true);


--
-- TOC entry 5779 (class 2606 OID 61987)
-- Name: cinema_types cinema_types_pkey; Type: CONSTRAINT; Schema: cinema_data; Owner: postgres
--

ALTER TABLE ONLY cinema_data.cinema_types
    ADD CONSTRAINT cinema_types_pkey PRIMARY KEY (type_id);


--
-- TOC entry 5781 (class 2606 OID 61989)
-- Name: cinema_types cinema_types_type_name_key; Type: CONSTRAINT; Schema: cinema_data; Owner: postgres
--

ALTER TABLE ONLY cinema_data.cinema_types
    ADD CONSTRAINT cinema_types_type_name_key UNIQUE (type_name);


--
-- TOC entry 5785 (class 2606 OID 62008)
-- Name: cinemas_final cinemas_final_pkey; Type: CONSTRAINT; Schema: cinema_data; Owner: postgres
--

ALTER TABLE ONLY cinema_data.cinemas_final
    ADD CONSTRAINT cinemas_final_pkey PRIMARY KEY (id);


--
-- TOC entry 5783 (class 2606 OID 61998)
-- Name: cinemas_raw cinemas_raw_pkey; Type: CONSTRAINT; Schema: cinema_data; Owner: postgres
--

ALTER TABLE ONLY cinema_data.cinemas_raw
    ADD CONSTRAINT cinemas_raw_pkey PRIMARY KEY (id);


--
-- TOC entry 5788 (class 2606 OID 62015)
-- Name: m2m_cinemas_types m2m_cinemas_types_pkey; Type: CONSTRAINT; Schema: cinema_data; Owner: postgres
--

ALTER TABLE ONLY cinema_data.m2m_cinemas_types
    ADD CONSTRAINT m2m_cinemas_types_pkey PRIMARY KEY (cinema_id, type_id);


--
-- TOC entry 5786 (class 1259 OID 62026)
-- Name: idx_m2m_type_id; Type: INDEX; Schema: cinema_data; Owner: postgres
--

CREATE INDEX idx_m2m_type_id ON cinema_data.m2m_cinemas_types USING btree (type_id);


--
-- TOC entry 5789 (class 2606 OID 62016)
-- Name: m2m_cinemas_types fk_m2m_cinema; Type: FK CONSTRAINT; Schema: cinema_data; Owner: postgres
--

ALTER TABLE ONLY cinema_data.m2m_cinemas_types
    ADD CONSTRAINT fk_m2m_cinema FOREIGN KEY (cinema_id) REFERENCES cinema_data.cinemas_final(id) ON DELETE CASCADE;


--
-- TOC entry 5790 (class 2606 OID 62021)
-- Name: m2m_cinemas_types fk_m2m_type; Type: FK CONSTRAINT; Schema: cinema_data; Owner: postgres
--

ALTER TABLE ONLY cinema_data.m2m_cinemas_types
    ADD CONSTRAINT fk_m2m_type FOREIGN KEY (type_id) REFERENCES cinema_data.cinema_types(type_id) ON DELETE CASCADE;


-- Completed on 2026-11-09 16:25:16

--
-- PostgreSQL database dump complete
--

\unrestrict nFhTgTRUHXnA0CdZMKqLvOF1HG4UtTOjnRWU8hBlUULwpWJ7XE0wcYzfqtgMKb0

