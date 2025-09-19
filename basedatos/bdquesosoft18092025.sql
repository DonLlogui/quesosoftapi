--
-- PostgreSQL database dump
--

-- Dumped from database version 17.5
-- Dumped by pg_dump version 17.5

-- Started on 2025-09-18 18:57:19

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
-- TOC entry 218 (class 1259 OID 16430)
-- Name: usuarios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuarios (
    idusuario integer NOT NULL,
    documento character varying(10) NOT NULL,
    nombres character varying(10) NOT NULL,
    telefono character varying(10) NOT NULL,
    correo character varying(200) NOT NULL,
    constrasena character varying(255) NOT NULL,
    rol character varying(20) DEFAULT 'Cliente'::character varying,
    estado character varying(20) DEFAULT 'Activo'::character varying,
    fechacreacion character varying(30),
    intentofallidos integer DEFAULT 0
);


ALTER TABLE public.usuarios OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16429)
-- Name: usuarios_idusuario_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.usuarios_idusuario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.usuarios_idusuario_seq OWNER TO postgres;

--
-- TOC entry 4906 (class 0 OID 0)
-- Dependencies: 217
-- Name: usuarios_idusuario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usuarios_idusuario_seq OWNED BY public.usuarios.idusuario;


--
-- TOC entry 4742 (class 2604 OID 16433)
-- Name: usuarios idusuario; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios ALTER COLUMN idusuario SET DEFAULT nextval('public.usuarios_idusuario_seq'::regclass);


--
-- TOC entry 4900 (class 0 OID 16430)
-- Dependencies: 218
-- Data for Name: usuarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usuarios (idusuario, documento, nombres, telefono, correo, constrasena, rol, estado, fechacreacion, intentofallidos) FROM stdin;
\.


--
-- TOC entry 4907 (class 0 OID 0)
-- Dependencies: 217
-- Name: usuarios_idusuario_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuarios_idusuario_seq', 1, false);


--
-- TOC entry 4747 (class 2606 OID 16446)
-- Name: usuarios usuarios_correo_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_correo_key UNIQUE (correo);


--
-- TOC entry 4749 (class 2606 OID 16442)
-- Name: usuarios usuarios_documento_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_documento_key UNIQUE (documento);


--
-- TOC entry 4751 (class 2606 OID 16440)
-- Name: usuarios usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (idusuario);


--
-- TOC entry 4753 (class 2606 OID 16444)
-- Name: usuarios usuarios_telefono_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_telefono_key UNIQUE (telefono);


-- Completed on 2025-09-18 18:57:20

--
-- PostgreSQL database dump complete
--

