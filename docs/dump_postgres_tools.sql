--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Drop databases (except postgres and template1)
--

DROP DATABASE tools;




--
-- Drop roles
--

DROP ROLE clebsonpy;


--
-- Roles
--

CREATE ROLE clebsonpy;
ALTER ROLE clebsonpy WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'md50208591f47850ea49d739d3c5ba97233';






--
-- Databases
--

--
-- Database "template1" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 12.6
-- Dumped by pg_dump version 12.6

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

UPDATE pg_catalog.pg_database SET datistemplate = false WHERE datname = 'template1';
DROP DATABASE template1;
--
-- Name: template1; Type: DATABASE; Schema: -; Owner: clebsonpy
--

CREATE DATABASE template1 WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.utf8' LC_CTYPE = 'en_US.utf8';


ALTER DATABASE template1 OWNER TO clebsonpy;

\connect template1

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

--
-- Name: DATABASE template1; Type: COMMENT; Schema: -; Owner: clebsonpy
--

COMMENT ON DATABASE template1 IS 'default template for new databases';


--
-- Name: template1; Type: DATABASE PROPERTIES; Schema: -; Owner: clebsonpy
--

ALTER DATABASE template1 IS_TEMPLATE = true;


\connect template1

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

--
-- Name: DATABASE template1; Type: ACL; Schema: -; Owner: clebsonpy
--

REVOKE CONNECT,TEMPORARY ON DATABASE template1 FROM PUBLIC;
GRANT CONNECT ON DATABASE template1 TO PUBLIC;


--
-- PostgreSQL database dump complete
--

--
-- Database "postgres" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 12.6
-- Dumped by pg_dump version 12.6

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

DROP DATABASE postgres;
--
-- Name: postgres; Type: DATABASE; Schema: -; Owner: clebsonpy
--

CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.utf8' LC_CTYPE = 'en_US.utf8';


ALTER DATABASE postgres OWNER TO clebsonpy;

\connect postgres

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

--
-- Name: DATABASE postgres; Type: COMMENT; Schema: -; Owner: clebsonpy
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


--
-- PostgreSQL database dump complete
--

--
-- Database "tools" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 12.6
-- Dumped by pg_dump version 12.6

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

--
-- Name: tools; Type: DATABASE; Schema: -; Owner: clebsonpy
--

CREATE DATABASE tools WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.utf8' LC_CTYPE = 'en_US.utf8';


ALTER DATABASE tools OWNER TO clebsonpy;

\connect tools

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
-- Name: api_client; Type: TABLE; Schema: public; Owner: clebsonpy
--

CREATE TABLE public.api_client (
    id_cli integer NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.api_client OWNER TO clebsonpy;

--
-- Name: api_industry; Type: TABLE; Schema: public; Owner: clebsonpy
--

CREATE TABLE public.api_industry (
    id_ind integer NOT NULL,
    name character varying(100) NOT NULL,
    latitude double precision NOT NULL,
    longitude double precision NOT NULL,
    client_id integer NOT NULL
);


ALTER TABLE public.api_industry OWNER TO clebsonpy;

--
-- Name: api_instruments; Type: TABLE; Schema: public; Owner: clebsonpy
--

CREATE TABLE public.api_instruments (
    id_ins integer NOT NULL,
    name character varying(100) NOT NULL,
    type_instruments integer NOT NULL,
    install_height double precision NOT NULL,
    equation double precision NOT NULL,
    attention_value double precision NOT NULL,
    id_ind_id integer NOT NULL
);


ALTER TABLE public.api_instruments OWNER TO clebsonpy;

--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: clebsonpy
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO clebsonpy;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: clebsonpy
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO clebsonpy;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: clebsonpy
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: clebsonpy
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Data for Name: api_client; Type: TABLE DATA; Schema: public; Owner: clebsonpy
--

COPY public.api_client (id_cli, name) FROM stdin;
1	Clebson Farias
2	Franciely Lino
3	Vera Lucia
4	José Barbosa
\.


--
-- Data for Name: api_industry; Type: TABLE DATA; Schema: public; Owner: clebsonpy
--

COPY public.api_industry (id_ind, name, latitude, longitude, client_id) FROM stdin;
1	Usina	-9.672176	-37.328853	4
2	Metal	-9.745858	-37.433344	1
3	Sorvete	-9.548157	-37.378797	3
4	Cloro	-9.668107	-37.127313	2
\.


--
-- Data for Name: api_instruments; Type: TABLE DATA; Schema: public; Owner: clebsonpy
--

COPY public.api_instruments (id_ins, name, type_instruments, install_height, equation, attention_value, id_ind_id) FROM stdin;
1	Gaveta	1	1.25	2	3.25	1
2	Esfera	1	2.12	2	4.12	3
3	Globo	1	0.75	3	3.75	2
4	Retenção	1	1.54	2	3.54	4
5	Elétrico de Corda Vibrante	2	0.98	2	2.98	1
6	Coluna vertical	2	2.84	3	5.84	3
7	Coluna inclinada	2	1.78	3	4.78	2
8	Manômetro	2	1.23	2	3.23	4
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: clebsonpy
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2021-03-18 13:57:22.091563+00
2	auth	0001_initial	2021-03-18 13:57:22.101961+00
3	admin	0001_initial	2021-03-18 13:57:22.110467+00
4	admin	0002_logentry_remove_auto_add	2021-03-18 13:57:22.118287+00
5	admin	0003_logentry_add_action_flag_choices	2021-03-18 13:57:22.126933+00
6	api	0001_initial	2021-03-18 13:57:22.144187+00
7	contenttypes	0002_remove_content_type_name	2021-03-18 13:57:22.160055+00
8	auth	0002_alter_permission_name_max_length	2021-03-18 13:57:22.167069+00
9	auth	0003_alter_user_email_max_length	2021-03-18 13:57:22.173963+00
10	auth	0004_alter_user_username_opts	2021-03-18 13:57:22.180939+00
11	auth	0005_alter_user_last_login_null	2021-03-18 13:57:22.192831+00
12	auth	0006_require_contenttypes_0002	2021-03-18 13:57:22.195872+00
13	auth	0007_alter_validators_add_error_messages	2021-03-18 13:57:22.202876+00
14	auth	0008_alter_user_username_max_length	2021-03-18 13:57:22.210244+00
15	auth	0009_alter_user_last_name_max_length	2021-03-18 13:57:22.217365+00
16	auth	0010_alter_group_name_max_length	2021-03-18 13:57:22.223973+00
17	auth	0011_update_proxy_permissions	2021-03-18 13:57:22.22743+00
18	auth	0012_alter_user_first_name_max_length	2021-03-18 13:57:22.234148+00
19	sessions	0001_initial	2021-03-18 13:57:22.237854+00
\.


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clebsonpy
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 19, true);


--
-- Name: api_client api_client_pkey; Type: CONSTRAINT; Schema: public; Owner: clebsonpy
--

ALTER TABLE ONLY public.api_client
    ADD CONSTRAINT api_client_pkey PRIMARY KEY (id_cli);


--
-- Name: api_industry api_industry_pkey; Type: CONSTRAINT; Schema: public; Owner: clebsonpy
--

ALTER TABLE ONLY public.api_industry
    ADD CONSTRAINT api_industry_pkey PRIMARY KEY (id_ind);


--
-- Name: api_instruments api_instruments_pkey; Type: CONSTRAINT; Schema: public; Owner: clebsonpy
--

ALTER TABLE ONLY public.api_instruments
    ADD CONSTRAINT api_instruments_pkey PRIMARY KEY (id_ins);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: clebsonpy
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: api_industry_client_id_d702564e; Type: INDEX; Schema: public; Owner: clebsonpy
--

CREATE INDEX api_industry_client_id_d702564e ON public.api_industry USING btree (client_id);


--
-- Name: api_instruments_id_ind_id_8980bc25; Type: INDEX; Schema: public; Owner: clebsonpy
--

CREATE INDEX api_instruments_id_ind_id_8980bc25 ON public.api_instruments USING btree (id_ind_id);


--
-- Name: api_industry api_industry_client_id_d702564e_fk_api_client_id_cli; Type: FK CONSTRAINT; Schema: public; Owner: clebsonpy
--

ALTER TABLE ONLY public.api_industry
    ADD CONSTRAINT api_industry_client_id_d702564e_fk_api_client_id_cli FOREIGN KEY (client_id) REFERENCES public.api_client(id_cli) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_instruments api_instruments_id_ind_id_8980bc25_fk_api_industry_id_ind; Type: FK CONSTRAINT; Schema: public; Owner: clebsonpy
--

ALTER TABLE ONLY public.api_instruments
    ADD CONSTRAINT api_instruments_id_ind_id_8980bc25_fk_api_industry_id_ind FOREIGN KEY (id_ind_id) REFERENCES public.api_industry(id_ind) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--

