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

DROP DATABASE users;
--
-- Name: users; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE users WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE users OWNER TO freecodecamp;

\connect users

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
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    username character varying(22) NOT NULL,
    games_played integer DEFAULT 0,
    best_game integer DEFAULT 2147483647
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES ('user_1712357340972', 0, 2147483647);
INSERT INTO public.users VALUES ('user_1712357340971', 0, 2147483647);
INSERT INTO public.users VALUES ('user_1712357392838', 0, 2147483647);
INSERT INTO public.users VALUES ('user_1712357392837', 0, 2147483647);
INSERT INTO public.users VALUES ('user_1712359688816', 0, 2147483647);
INSERT INTO public.users VALUES ('user_1712359688815', 0, 2147483647);
INSERT INTO public.users VALUES ('tom', 2, 3);
INSERT INTO public.users VALUES ('user_1712360407361', 2, 3);
INSERT INTO public.users VALUES ('user_1712360407362', 5, 5);
INSERT INTO public.users VALUES ('user_1712360441546', 2, 2);
INSERT INTO public.users VALUES ('user_1712360441547', 5, 3);
INSERT INTO public.users VALUES ('user_1712360476346', 2, 10);
INSERT INTO public.users VALUES ('user_1712360476347', 5, 2);
INSERT INTO public.users VALUES ('user_1712360497036', 2, 5);
INSERT INTO public.users VALUES ('user_1712360497037', 5, 6);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (username);


--
-- PostgreSQL database dump complete
--

