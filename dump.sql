--
-- PostgreSQL database dump
--

-- Dumped from database version 12.14
-- Dumped by pg_dump version 14.8 (Ubuntu 14.8-0ubuntu0.22.04.1)

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

ALTER TABLE IF EXISTS ONLY public.shares DROP CONSTRAINT IF EXISTS "shares_userId_fkey";
ALTER TABLE IF EXISTS ONLY public.shares DROP CONSTRAINT IF EXISTS "shares_postId_fkey";
ALTER TABLE IF EXISTS ONLY public.following DROP CONSTRAINT IF EXISTS "following_followingId_fkey";
ALTER TABLE IF EXISTS ONLY public.following DROP CONSTRAINT IF EXISTS "following_followerId_fkey";
ALTER TABLE IF EXISTS ONLY public.followers DROP CONSTRAINT IF EXISTS "followers_followingId_fkey";
ALTER TABLE IF EXISTS ONLY public.followers DROP CONSTRAINT IF EXISTS "followers_followerId_fkey";
ALTER TABLE IF EXISTS ONLY public.comments DROP CONSTRAINT IF EXISTS "comments_userId_fkey";
ALTER TABLE IF EXISTS ONLY public.comments DROP CONSTRAINT IF EXISTS "comments_postId_fkey";
ALTER TABLE IF EXISTS ONLY public.users DROP CONSTRAINT IF EXISTS users_pkey;
ALTER TABLE IF EXISTS ONLY public.shares DROP CONSTRAINT IF EXISTS shares_pkey;
ALTER TABLE IF EXISTS ONLY public.sessions DROP CONSTRAINT IF EXISTS sessions_pkey;
ALTER TABLE IF EXISTS ONLY public.posts DROP CONSTRAINT IF EXISTS posts_pkey;
ALTER TABLE IF EXISTS ONLY public.metadata DROP CONSTRAINT IF EXISTS metadata_pkey;
ALTER TABLE IF EXISTS ONLY public.likes DROP CONSTRAINT IF EXISTS likes_pkey;
ALTER TABLE IF EXISTS ONLY public.hashtags DROP CONSTRAINT IF EXISTS hashtags_pkey;
ALTER TABLE IF EXISTS ONLY public.following DROP CONSTRAINT IF EXISTS following_pkey;
ALTER TABLE IF EXISTS ONLY public.followers DROP CONSTRAINT IF EXISTS followers_pkey;
ALTER TABLE IF EXISTS ONLY public.comments DROP CONSTRAINT IF EXISTS comments_pkey;
ALTER TABLE IF EXISTS public.users ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.shares ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.sessions ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.posts ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.metadata ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.likes ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.hashtags ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.following ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.followers ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.comments ALTER COLUMN id DROP DEFAULT;
DROP SEQUENCE IF EXISTS public.users_id_seq;
DROP TABLE IF EXISTS public.users;
DROP SEQUENCE IF EXISTS public.shares_id_seq;
DROP TABLE IF EXISTS public.shares;
DROP SEQUENCE IF EXISTS public.sessions_id_seq;
DROP TABLE IF EXISTS public.sessions;
DROP SEQUENCE IF EXISTS public.posts_id_seq;
DROP TABLE IF EXISTS public.posts;
DROP SEQUENCE IF EXISTS public.metadata_id_seq;
DROP TABLE IF EXISTS public.metadata;
DROP SEQUENCE IF EXISTS public.likes_id_seq;
DROP TABLE IF EXISTS public.likes;
DROP SEQUENCE IF EXISTS public.hashtags_id_seq;
DROP TABLE IF EXISTS public.hashtags;
DROP SEQUENCE IF EXISTS public.following_id_seq;
DROP TABLE IF EXISTS public.following;
DROP SEQUENCE IF EXISTS public.followers_id_seq;
DROP TABLE IF EXISTS public.followers;
DROP SEQUENCE IF EXISTS public.comments_id_seq;
DROP TABLE IF EXISTS public.comments;
DROP SCHEMA IF EXISTS public;
--
-- Name: public; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA public;


--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: comments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.comments (
    id integer NOT NULL,
    "postId" integer,
    "userId" integer,
    comment text
);


--
-- Name: comments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.comments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.comments_id_seq OWNED BY public.comments.id;


--
-- Name: followers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.followers (
    id integer NOT NULL,
    "followerId" integer,
    "followingId" integer
);


--
-- Name: followers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.followers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: followers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.followers_id_seq OWNED BY public.followers.id;


--
-- Name: following; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.following (
    id integer NOT NULL,
    "followerId" integer,
    "followingId" integer
);


--
-- Name: following_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.following_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: following_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.following_id_seq OWNED BY public.following.id;


--
-- Name: hashtags; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.hashtags (
    id integer NOT NULL,
    hashtag text,
    "postId" integer NOT NULL
);


--
-- Name: hashtags_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.hashtags_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: hashtags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.hashtags_id_seq OWNED BY public.hashtags.id;


--
-- Name: likes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.likes (
    id integer NOT NULL,
    "userId" integer NOT NULL,
    "postId" integer NOT NULL
);


--
-- Name: likes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.likes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: likes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.likes_id_seq OWNED BY public.likes.id;


--
-- Name: metadata; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.metadata (
    id integer NOT NULL,
    title text NOT NULL,
    image text NOT NULL,
    description text NOT NULL,
    "postId" integer NOT NULL
);


--
-- Name: metadata_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.metadata_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: metadata_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.metadata_id_seq OWNED BY public.metadata.id;


--
-- Name: posts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.posts (
    id integer NOT NULL,
    "userId" integer NOT NULL,
    description text NOT NULL,
    link text NOT NULL,
    "createdAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    likes integer DEFAULT 0,
    shares integer DEFAULT 0
);


--
-- Name: posts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.posts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: posts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.posts_id_seq OWNED BY public.posts.id;


--
-- Name: sessions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sessions (
    id integer NOT NULL,
    "userId" integer NOT NULL,
    token text NOT NULL
);


--
-- Name: sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sessions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sessions_id_seq OWNED BY public.sessions.id;


--
-- Name: shares; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.shares (
    id integer NOT NULL,
    "postId" integer,
    "userId" integer
);


--
-- Name: shares_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.shares_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: shares_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.shares_id_seq OWNED BY public.shares.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name text NOT NULL,
    email text NOT NULL,
    password text NOT NULL,
    "profileImage" text NOT NULL
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: comments id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.comments ALTER COLUMN id SET DEFAULT nextval('public.comments_id_seq'::regclass);


--
-- Name: followers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.followers ALTER COLUMN id SET DEFAULT nextval('public.followers_id_seq'::regclass);


--
-- Name: following id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.following ALTER COLUMN id SET DEFAULT nextval('public.following_id_seq'::regclass);


--
-- Name: hashtags id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.hashtags ALTER COLUMN id SET DEFAULT nextval('public.hashtags_id_seq'::regclass);


--
-- Name: likes id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.likes ALTER COLUMN id SET DEFAULT nextval('public.likes_id_seq'::regclass);


--
-- Name: metadata id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.metadata ALTER COLUMN id SET DEFAULT nextval('public.metadata_id_seq'::regclass);


--
-- Name: posts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.posts ALTER COLUMN id SET DEFAULT nextval('public.posts_id_seq'::regclass);


--
-- Name: sessions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions ALTER COLUMN id SET DEFAULT nextval('public.sessions_id_seq'::regclass);


--
-- Name: shares id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.shares ALTER COLUMN id SET DEFAULT nextval('public.shares_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: comments; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: followers; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: following; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: hashtags; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.hashtags VALUES (1, 'programarÉbom', 1);
INSERT INTO public.hashtags VALUES (2, 'programarÉvida', 1);
INSERT INTO public.hashtags VALUES (3, 'caféÉvida', 1);
INSERT INTO public.hashtags VALUES (4, 'nãoAguentoMaisCódigo', 1);
INSERT INTO public.hashtags VALUES (5, 'MeuDeusEuNãoAguentoMais', 10);
INSERT INTO public.hashtags VALUES (6, 'MeuDeusEuNãoAguentoMais', 11);
INSERT INTO public.hashtags VALUES (7, 'MeuDeusEuNãoAguentoMais', 9);
INSERT INTO public.hashtags VALUES (8, 'caféÉvida', 9);
INSERT INTO public.hashtags VALUES (10, 'python', 16);


--
-- Data for Name: likes; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: metadata; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.metadata VALUES (4, 'Introdução – React', 'https://legacy.reactjs.org/logo-og.png', 'A JavaScript library for building user interfaces', 9);
INSERT INTO public.metadata VALUES (5, 'Django', 'https://static.djangoproject.com/img/logos/django-logo-negative.1d528e2cb5fb.png', 'The web framework for perfectionists with deadlines.', 10);
INSERT INTO public.metadata VALUES (6, 'Welcome to Python.org', 'https://www.python.org/static/opengraph-icon-200x200.png', 'The official home of the Python Programming Language', 11);
INSERT INTO public.metadata VALUES (9, 'Welcome to Python.org', 'https://www.python.org/static/opengraph-icon-200x200.png', 'The official home of the Python Programming Language', 15);
INSERT INTO public.metadata VALUES (10, 'Welcome to Python.org', 'https://www.python.org/static/opengraph-icon-200x200.png', 'The official home of the Python Programming Language', 16);
INSERT INTO public.metadata VALUES (11, 'Google', '/images/branding/googleg/1x/googleg_standard_color_128dp.png', '', 17);
INSERT INTO public.metadata VALUES (12, 'Netflix Brasil - assistir a s&#xE9;ries online, assistir a filmes online', '', 'Assista a séries e filmes online diretamente na sua Smart TV, PC ou Mac, videogame, tablet, smartphone e mais.', 18);
INSERT INTO public.metadata VALUES (13, 'Netflix Brasil - assistir a s&#xE9;ries online, assistir a filmes online', '', 'Assista a séries e filmes online diretamente na sua Smart TV, PC ou Mac, videogame, tablet, smartphone e mais.', 21);
INSERT INTO public.metadata VALUES (14, 'Watch The Simpsons | Star+', 'https://prod-ripcut-delivery.disney-plus.net/v1/variant/star/183F57465C62CE9EFCD0476D2E9CF29C3E3962B2EAA81A5E022D867C87B52AC9/scale?width=1200&aspectRatio=1.78&format=jpeg', 'The world’s favorite nuclear family, in the award-winning, history-making series.', 22);
INSERT INTO public.metadata VALUES (15, 'Video Player | Star+', 'https://static-assets.bamgrid.com/product/starplus/images/share-default.d72cf588f6d06cba22171f5ae44289d3.png', 'Star+ is the ultimate streaming experience with animated comedies, hit movies, originals, the best of ESPN, and much more. Whenever you want, wherever you want.', 25);
INSERT INTO public.metadata VALUES (16, 'Video Player | Star+', 'https://static-assets.bamgrid.com/product/starplus/images/share-default.d72cf588f6d06cba22171f5ae44289d3.png', 'Star+ is the ultimate streaming experience with animated comedies, hit movies, originals, the best of ESPN, and much more. Whenever you want, wherever you want.', 26);
INSERT INTO public.metadata VALUES (17, 'Video Player | Star+', 'https://static-assets.bamgrid.com/product/starplus/images/share-default.d72cf588f6d06cba22171f5ae44289d3.png', 'Star+ is the ultimate streaming experience with animated comedies, hit movies, originals, the best of ESPN, and much more. Whenever you want, wherever you want.', 27);
INSERT INTO public.metadata VALUES (18, 'Video Player | Star+', 'https://static-assets.bamgrid.com/product/starplus/images/share-default.d72cf588f6d06cba22171f5ae44289d3.png', 'Star+ is the ultimate streaming experience with animated comedies, hit movies, originals, the best of ESPN, and much more. Whenever you want, wherever you want.', 28);
INSERT INTO public.metadata VALUES (19, 'Netflix Brasil - assistir a s&#xE9;ries online, assistir a filmes online', '', 'Assista a séries e filmes online diretamente na sua Smart TV, PC ou Mac, videogame, tablet, smartphone e mais.', 29);
INSERT INTO public.metadata VALUES (20, 'Google', '/images/branding/googleg/1x/googleg_standard_color_128dp.png', '', 30);
INSERT INTO public.metadata VALUES (21, 'Netflix Brasil - assistir a s&#xE9;ries online, assistir a filmes online', '', 'Assista a séries e filmes online diretamente na sua Smart TV, PC ou Mac, videogame, tablet, smartphone e mais.', 31);
INSERT INTO public.metadata VALUES (22, 'Google', '/images/branding/googleg/1x/googleg_standard_color_128dp.png', '', 32);
INSERT INTO public.metadata VALUES (23, 'Netflix Brasil - assistir a s&#xE9;ries online, assistir a filmes online', '', 'Assista a séries e filmes online diretamente na sua Smart TV, PC ou Mac, videogame, tablet, smartphone e mais.', 33);
INSERT INTO public.metadata VALUES (24, 'Figma', 'https://www.figma.com/file/IsxlMkRqXlEFSnGwZU1Fxm/thumbnail?ver=thumbnails/2e817727-b46a-4d53-b928-7ff4941d8461', 'Created with Figma', 34);
INSERT INTO public.metadata VALUES (25, 'Welcome to Python.org', 'https://www.python.org/static/opengraph-icon-200x200.png', 'The official home of the Python Programming Language', 35);
INSERT INTO public.metadata VALUES (26, 'Driven: Curso de Programação Full Stack Completo', '', 'O Curso de Programação Driven te leva do zero ao full stack em 9 meses. Pague só depois de formado e quando estiver trabalhando - 100% dos nossos alunos estão.', 36);
INSERT INTO public.metadata VALUES (27, 'Watch The Simpsons | Star+', 'https://prod-ripcut-delivery.disney-plus.net/v1/variant/star/183F57465C62CE9EFCD0476D2E9CF29C3E3962B2EAA81A5E022D867C87B52AC9/scale?width=1200&aspectRatio=1.78&format=jpeg', 'The world’s favorite nuclear family, in the award-winning, history-making series.', 37);


--
-- Data for Name: posts; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.posts VALUES (10, 5, 'django documentation', 'https://docs.djangoproject.com/pt-br/4.2/', '2023-06-03 18:25:12.148126+00', 0, 0);
INSERT INTO public.posts VALUES (11, 5, 'python documentation', 'https://www.python.org/doc/', '2023-06-03 18:32:56.466603+00', 0, 0);
INSERT INTO public.posts VALUES (12, 5, 'linkedin wesite', 'https://www.linkedin.com/', '2023-06-04 04:12:51.451905+00', 0, 0);
INSERT INTO public.posts VALUES (16, 5, 'python documentation #python', 'https://www.python.org/doc/', '2023-06-04 22:00:40.0963+00', 0, 0);
INSERT INTO public.posts VALUES (19, 9, 'testando com julia', 'https://hub.driven.com.br/avaliador/8462', '2023-06-06 21:33:09.838725+00', 0, 0);
INSERT INTO public.posts VALUES (20, 9, 'testando julia', 'https://hub.driven.com.br/avaliador/8462', '2023-06-06 21:34:08.311569+00', 0, 0);
INSERT INTO public.posts VALUES (37, 10, 'simpsons é muito legal #simpsons #homer', 'https://www.starplus.com/series/the-simpsons/3ZoBZ52QHb4x', '2023-06-07 20:39:31.198536+00', 0, 1);
INSERT INTO public.posts VALUES (29, 3, 'Testando a netflix', 'https://www.netflix.com/br/', '2023-06-07 19:01:57.250763+00', 0, 0);
INSERT INTO public.posts VALUES (30, 3, 'sasas', 'https://www.google.com/', '2023-06-07 19:02:41.639305+00', 0, 0);
INSERT INTO public.posts VALUES (18, 3, 'Testando a netflix', 'https://www.netflix.com/br/', '2023-06-06 19:22:14.752711+00', 0, 1);
INSERT INTO public.posts VALUES (31, 3, 'testando ', 'https://www.netflix.com/br/', '2023-06-07 19:08:12.184241+00', 0, 0);
INSERT INTO public.posts VALUES (32, 3, 'sasas', 'https://www.google.com/', '2023-06-07 19:09:36.902065+00', 0, 0);
INSERT INTO public.posts VALUES (33, 3, 'sdsdsd', 'https://www.netflix.com/br/', '2023-06-07 19:12:00.469406+00', 0, 0);
INSERT INTO public.posts VALUES (9, 5, 'react documentarion ', 'https://pt-br.legacy.reactjs.org/docs/getting-started.html', '2023-06-03 18:23:10.607808+00', 0, 18);
INSERT INTO public.posts VALUES (34, 3, 'teste', 'https://www.figma.com/file/IsxlMkRqXlEFSnGwZU1Fxm/T6-%7C-Projet%C3%A3o%3A-Linkr---Rede-Social-de-Links-(Sprint-2)?type=design&node-id=0-1&t=K1otgFKxvKAMHjTw-0', '2023-06-07 19:49:51.856028+00', 0, 0);
INSERT INTO public.posts VALUES (35, 3, 'teste', 'https://www.python.org/', '2023-06-07 19:50:41.28005+00', 0, 0);
INSERT INTO public.posts VALUES (36, 3, 'teste', 'https://www.driven.com.br/', '2023-06-07 19:52:30.587932+00', 0, 0);


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.sessions VALUES (1, 2, '5b15bf99-645a-4550-abf8-4454a282d57c');
INSERT INTO public.sessions VALUES (2, 2, '17496662-3220-44c3-a6f9-782776eb6b1a');
INSERT INTO public.sessions VALUES (3, 3, '4bda4f8d-a5ad-496d-82a9-c7da8a38b903');
INSERT INTO public.sessions VALUES (4, 3, 'd49db298-3985-462b-a67a-d86db798902f');
INSERT INTO public.sessions VALUES (5, 5, 'f19b9b2c-262a-476c-8916-90ba99b432e1');
INSERT INTO public.sessions VALUES (6, 5, 'e0ca4f04-8982-43a6-bc59-b48d1a40fee2');
INSERT INTO public.sessions VALUES (7, 3, '61c4d99d-a8e6-41cf-84df-5799c42c943e');
INSERT INTO public.sessions VALUES (8, 5, '272c9ede-4845-41c1-b192-57062ce3eacd');
INSERT INTO public.sessions VALUES (9, 5, 'eb9429a1-bfe5-4e63-8e3b-e7cee2c18fc5');
INSERT INTO public.sessions VALUES (10, 5, '0641217b-fed5-4723-a937-b91da1369ed5');
INSERT INTO public.sessions VALUES (11, 3, 'fc5be762-2339-47c7-b382-ba152033dc44');
INSERT INTO public.sessions VALUES (12, 6, '158e4fd2-8af2-464c-b3e6-de9cd7c62c09');
INSERT INTO public.sessions VALUES (13, 5, '7c18bd3e-283b-482e-aa7d-88c7f6c1d240');
INSERT INTO public.sessions VALUES (14, 5, 'a8c08da5-b9d8-4898-8300-90212bce56f0');
INSERT INTO public.sessions VALUES (15, 5, '6aebde5d-dc96-467f-a0ec-a4de29d4ea92');
INSERT INTO public.sessions VALUES (16, 5, '391e9717-d53d-4140-b964-ada02958de7b');
INSERT INTO public.sessions VALUES (17, 5, '9be4244a-2a1d-4612-8e54-881db8812f74');
INSERT INTO public.sessions VALUES (18, 5, '39ad7b0f-1ed4-4927-8d4a-bd90e530d814');
INSERT INTO public.sessions VALUES (19, 5, '85504d0e-8c4f-476c-b29e-905c8828af28');
INSERT INTO public.sessions VALUES (20, 5, '10cfb149-2f1c-452f-94fe-8bebc2cfe33a');
INSERT INTO public.sessions VALUES (21, 5, '8635fabf-8ed3-41b6-90e4-ea753e160e7c');
INSERT INTO public.sessions VALUES (22, 5, '4fdd33a4-6672-4385-89ef-831880241a36');
INSERT INTO public.sessions VALUES (23, 5, 'dd815e76-dc37-4c17-9445-dfcd9d41714d');
INSERT INTO public.sessions VALUES (24, 5, '6a260cd5-fecc-43c5-8ddb-2cb53e47b59e');
INSERT INTO public.sessions VALUES (25, 7, '870865af-a758-4781-a054-ce56aafdc67f');
INSERT INTO public.sessions VALUES (26, 7, '3ddeb1cd-2999-4b70-8b70-5b0c0ddd20bb');
INSERT INTO public.sessions VALUES (27, 7, '55c4c8a1-3adb-4cda-bc71-7fc83c4d2f13');
INSERT INTO public.sessions VALUES (28, 7, '4ff7b8d1-0b5f-405f-bb80-e7bb123e33f2');
INSERT INTO public.sessions VALUES (29, 7, 'c5afe692-a86f-4b6f-96c8-42cd2cce8be5');
INSERT INTO public.sessions VALUES (30, 7, '7dd4f568-9115-4ffe-978c-b325e4526d67');
INSERT INTO public.sessions VALUES (31, 7, '2b2e0a99-3e51-4fb8-a656-457dce448e2b');
INSERT INTO public.sessions VALUES (32, 7, '4fc5726d-68f5-4542-98f0-3f76477e2941');
INSERT INTO public.sessions VALUES (33, 7, '89e28740-0d03-44f7-b30d-00e0aa0f1594');
INSERT INTO public.sessions VALUES (34, 7, 'c5a25a54-a4b2-4b5a-95ad-a009e0047623');
INSERT INTO public.sessions VALUES (35, 7, '8e66e451-ec92-4d9c-906d-bfc8bd691c33');
INSERT INTO public.sessions VALUES (36, 7, '5521a99f-b356-4407-91aa-3fb2aa5f0c61');
INSERT INTO public.sessions VALUES (37, 7, '664bbf99-850b-4d74-b91d-be26c10a595f');
INSERT INTO public.sessions VALUES (38, 7, '8e9db804-6570-47d4-8f03-9bf70112c16d');
INSERT INTO public.sessions VALUES (39, 7, 'd121e4dc-59ed-4d53-8246-3bb3c6c6d3cf');
INSERT INTO public.sessions VALUES (40, 7, '34eb9a2a-5004-4e20-996a-10acaff4ac65');
INSERT INTO public.sessions VALUES (41, 7, 'f99985a9-d0a1-4c0b-a4de-af746a4e9ff0');
INSERT INTO public.sessions VALUES (42, 7, '41618f90-440c-44c5-ab14-2ffdb09f617c');
INSERT INTO public.sessions VALUES (43, 7, '38c67476-8f71-433c-a943-417f8d2f5cc5');
INSERT INTO public.sessions VALUES (44, 7, '0bd18fd6-3b8e-4128-98f5-130b08c7ae41');
INSERT INTO public.sessions VALUES (45, 7, '5d1fbe3f-9994-410d-99b0-e22b975b4c3c');
INSERT INTO public.sessions VALUES (46, 7, '6080d65b-a542-4fba-b0ac-4a106526f608');
INSERT INTO public.sessions VALUES (47, 5, '8ff5d425-31f1-4c71-b2ab-533c09e8ecff');
INSERT INTO public.sessions VALUES (48, 5, '818a961a-bb0f-420b-9679-d57ee52369f9');
INSERT INTO public.sessions VALUES (49, 7, 'd77fa017-cf99-42a9-9b83-c9aee1616926');
INSERT INTO public.sessions VALUES (50, 7, '868347ab-50f5-45f0-8c10-29044e98c2b4');
INSERT INTO public.sessions VALUES (51, 5, 'bae63500-c777-403c-a647-1ac617400ebc');
INSERT INTO public.sessions VALUES (52, 5, '5995196a-939b-4e95-907b-e09103f5821e');
INSERT INTO public.sessions VALUES (53, 5, 'a83bd1f1-0b5c-471b-9326-520bfe02ac21');
INSERT INTO public.sessions VALUES (54, 7, 'f7b04a80-c3f7-40e5-9bbb-35050cf7b29a');
INSERT INTO public.sessions VALUES (55, 7, 'ad5f7ee3-54e6-4b0e-920a-6e1bbede848e');
INSERT INTO public.sessions VALUES (56, 7, 'efecaa93-e865-4642-a9e5-357ab27a3f19');
INSERT INTO public.sessions VALUES (57, 7, '3607ae4c-61ae-4e9a-b7c2-8c741d535665');
INSERT INTO public.sessions VALUES (58, 7, 'a8ecbccf-a44c-451c-a0a7-de32e1cf85a8');
INSERT INTO public.sessions VALUES (59, 7, 'c3c6ecf4-61e1-463e-8e5a-3a6dbaf6f853');
INSERT INTO public.sessions VALUES (60, 7, 'acb3c198-d67c-400c-8f08-1fb828ff6a00');
INSERT INTO public.sessions VALUES (61, 7, 'c93621e6-710f-4d62-be2d-f0f7e72bd2cd');
INSERT INTO public.sessions VALUES (62, 5, '6a888dbd-10f1-4fb9-8ac3-0f9bcdb24373');
INSERT INTO public.sessions VALUES (63, 5, '5f8a37ed-4d6f-4496-b48c-b8183c8c91bf');
INSERT INTO public.sessions VALUES (64, 5, '6d76f7cb-cb82-4600-b311-05fae0ec13fc');
INSERT INTO public.sessions VALUES (65, 5, '43720425-c894-4868-b45f-845985615335');
INSERT INTO public.sessions VALUES (66, 5, '070c5552-4a26-493e-905a-e4c3a25ab230');
INSERT INTO public.sessions VALUES (67, 5, 'ab01b1ea-f8e3-4efc-8b0a-075ca3b7ee7b');
INSERT INTO public.sessions VALUES (68, 3, '27971c36-a5d5-4de1-a121-49d0d1d92c78');
INSERT INTO public.sessions VALUES (69, 8, '6175dfeb-4cd7-4919-82a8-ecd89ab9bb80');
INSERT INTO public.sessions VALUES (70, 3, '502e5894-91c2-4533-93e7-738309023a34');
INSERT INTO public.sessions VALUES (71, 3, '10903a65-ba89-492f-ba8f-d21b7d8b4c7c');
INSERT INTO public.sessions VALUES (72, 3, '3942a99b-8b29-4fd2-bc4e-0266001ffd9f');
INSERT INTO public.sessions VALUES (73, 3, '3dcf604f-60ae-433c-bcaf-c73506c65898');
INSERT INTO public.sessions VALUES (74, 7, '860c32f0-17d4-4498-855b-93724c938992');
INSERT INTO public.sessions VALUES (75, 3, '6564b3ee-fa72-4314-a3a7-5c754ab91837');
INSERT INTO public.sessions VALUES (76, 7, 'f047e8df-0fcf-49bf-b9e5-4bb511e1c807');
INSERT INTO public.sessions VALUES (77, 3, '14fe45ae-ea37-45f9-b73d-aeec13c70db7');
INSERT INTO public.sessions VALUES (78, 3, '2274713b-39ab-4e45-86c7-6d89a8a9de95');
INSERT INTO public.sessions VALUES (79, 5, 'c44300e7-aaba-4abe-ab5b-2fe1dd40d21b');
INSERT INTO public.sessions VALUES (80, 7, '037e296c-ad5f-45d9-aba2-78b970f23127');
INSERT INTO public.sessions VALUES (81, 5, '01caed28-9864-4206-93d4-361ee6307b15');
INSERT INTO public.sessions VALUES (82, 3, '5157ef09-3a88-49f4-91be-dba6e1cf7c5b');
INSERT INTO public.sessions VALUES (83, 9, '79d75843-3156-4743-81a8-68ecfd88b206');
INSERT INTO public.sessions VALUES (84, 9, '6c8eab43-204c-4d0d-9bf1-da8236c8ea12');
INSERT INTO public.sessions VALUES (85, 10, '41c65590-dac7-4686-98a0-eaf6fed8b44c');
INSERT INTO public.sessions VALUES (86, 10, 'd389a109-7e90-4068-b392-55123209b7a5');
INSERT INTO public.sessions VALUES (87, 10, 'ed30cec0-ea4f-438a-9791-74bc74b34cb8');
INSERT INTO public.sessions VALUES (88, 10, 'b99bd9af-8afb-4cdb-9cdf-6700460fd67d');
INSERT INTO public.sessions VALUES (89, 10, '8d36f01f-6ae9-4509-95c0-dc3e7a4b1ef2');
INSERT INTO public.sessions VALUES (90, 10, '8495a539-a888-4680-8c30-1bdf4c517838');
INSERT INTO public.sessions VALUES (91, 5, '46d6f40f-be42-4b2b-82da-ace6c46113be');
INSERT INTO public.sessions VALUES (92, 5, '8a18f3a5-f65f-4877-8cb0-694f7279e3b9');
INSERT INTO public.sessions VALUES (93, 5, '78afe033-206b-46f5-b2de-758075a41b84');
INSERT INTO public.sessions VALUES (94, 5, '982643e3-d7e3-41cb-a176-de40b130aab7');
INSERT INTO public.sessions VALUES (95, 5, 'cf58b2f5-93be-46b0-bb24-d16cf6fddb4a');
INSERT INTO public.sessions VALUES (96, 5, 'b40bdc7b-031a-4f06-9896-af8777f20254');
INSERT INTO public.sessions VALUES (97, 5, 'adbf1ac9-e4d2-4363-8e71-a1c86aa27a57');
INSERT INTO public.sessions VALUES (98, 5, '29d3eb91-ffbb-487e-9ceb-ab806a36a253');
INSERT INTO public.sessions VALUES (99, 5, '47655a4d-645b-46c0-94c7-0b4bedcd4e0f');
INSERT INTO public.sessions VALUES (100, 5, '73f1d497-7950-401b-a6b1-9300ac5367a4');
INSERT INTO public.sessions VALUES (101, 7, '19f7849f-9a1e-4779-a6ae-f83c084dbe6b');
INSERT INTO public.sessions VALUES (102, 7, 'b10aee18-ebd7-43f1-ad0f-44aec459a4a2');
INSERT INTO public.sessions VALUES (103, 7, '69bdc00c-725b-44b6-bcbc-dec79a5460f8');
INSERT INTO public.sessions VALUES (104, 3, '05bbf037-c929-4d8b-a803-185472e974f4');
INSERT INTO public.sessions VALUES (105, 3, 'f2dbb8ea-3abd-4719-97c2-bbcbcb735fd3');
INSERT INTO public.sessions VALUES (106, 3, '899d4e76-6fb8-48df-be05-40e2810e1561');
INSERT INTO public.sessions VALUES (107, 3, 'dd2fef96-8a22-4426-ac7e-5dff9cb36241');
INSERT INTO public.sessions VALUES (108, 3, '119ee492-ae37-48f0-bfba-2d563920ab28');
INSERT INTO public.sessions VALUES (109, 3, 'a3f5a433-6065-4fdc-9d51-a346dc96ee9e');
INSERT INTO public.sessions VALUES (110, 7, '1d172211-adc2-42c6-946a-1ac0a596a892');
INSERT INTO public.sessions VALUES (111, 5, '99c4e636-ade5-450a-8178-539f7d0fa67c');
INSERT INTO public.sessions VALUES (112, 3, '64b7702a-5451-4ab2-bbed-d412f50d8bb0');
INSERT INTO public.sessions VALUES (113, 3, '739200c1-dba7-4e99-99ce-7a597130c113');
INSERT INTO public.sessions VALUES (114, 7, '93e69017-eeb6-45f2-b310-ad93952bf74d');
INSERT INTO public.sessions VALUES (115, 7, 'a08282c7-2a78-4719-b1f9-fe9cf230b285');
INSERT INTO public.sessions VALUES (116, 10, '043f2d72-8b4b-40da-8958-ed0cb86d2469');
INSERT INTO public.sessions VALUES (117, 3, '6a009c54-11eb-4db7-8f87-fd77c772bf0d');
INSERT INTO public.sessions VALUES (118, 7, 'bfa86f1a-b7ed-4faa-a1e8-35df8ee695cd');
INSERT INTO public.sessions VALUES (119, 3, 'efbdbed4-fb48-4e43-bf60-f00a48f81388');
INSERT INTO public.sessions VALUES (120, 10, '14aee420-50a2-43b6-8459-aa784725b2e4');
INSERT INTO public.sessions VALUES (121, 3, '8e4930c1-7970-46d9-9f3f-6903e20c1c73');
INSERT INTO public.sessions VALUES (122, 10, '6ee7b619-1934-42a1-b21f-5ecf9ae77abb');
INSERT INTO public.sessions VALUES (123, 10, 'e966774d-841e-467f-b168-d2fc7b1be7f7');
INSERT INTO public.sessions VALUES (124, 10, 'ba7a13b6-7c99-4a37-87e2-5ecd110ebd86');
INSERT INTO public.sessions VALUES (125, 7, 'f665b659-752c-42ac-8f52-1cc9818a7342');
INSERT INTO public.sessions VALUES (126, 7, '95b2aa2f-e535-47d2-a42f-fb6da4ff5f81');
INSERT INTO public.sessions VALUES (127, 10, '7e259c7e-126d-4e9e-bb87-8e6fa0610077');
INSERT INTO public.sessions VALUES (128, 7, 'd8f2ceee-c066-4139-9d2f-06dac90c9aa7');
INSERT INTO public.sessions VALUES (129, 10, 'be7d32d6-b06b-461e-bb0f-cfca4e40881f');
INSERT INTO public.sessions VALUES (130, 7, '10000876-f647-4145-9bcc-ad3746f26a05');
INSERT INTO public.sessions VALUES (131, 7, '17de4021-4a3c-4506-81a4-f3b526b1a93e');
INSERT INTO public.sessions VALUES (132, 7, '5a568139-74b1-49c5-ae16-f3b783092f5a');
INSERT INTO public.sessions VALUES (133, 7, 'a3d0803c-f11b-49fa-8141-aef4b6e6d46b');
INSERT INTO public.sessions VALUES (134, 7, '2d444843-053d-46fc-906a-2b737df07dc8');
INSERT INTO public.sessions VALUES (135, 7, '0169361f-db2f-485a-9b4e-9900ab031138');
INSERT INTO public.sessions VALUES (136, 7, 'a189bd0f-ad4b-4f0d-b4d2-1a0a2cb61db3');
INSERT INTO public.sessions VALUES (137, 7, 'ca26a9be-50d2-486b-94e1-a85069348d84');
INSERT INTO public.sessions VALUES (138, 7, '82a40091-ea5c-40df-b648-a5536c79704d');
INSERT INTO public.sessions VALUES (139, 7, 'c2ba93e3-48a3-4710-a093-4b1159c9b1cb');
INSERT INTO public.sessions VALUES (140, 10, '967467b4-e2c6-485c-a4c2-6396da8f1ffa');
INSERT INTO public.sessions VALUES (141, 7, 'c4d0bffd-aebf-4098-a78e-dd7d2c3c584f');
INSERT INTO public.sessions VALUES (142, 7, '585c1cc0-9726-4b38-9885-5b071975a527');
INSERT INTO public.sessions VALUES (143, 7, 'ece89db5-6d42-4b01-85d7-48a535546dad');
INSERT INTO public.sessions VALUES (144, 7, '2b1151e4-cc25-442d-bb30-bc086837ac58');
INSERT INTO public.sessions VALUES (145, 7, '6c324b95-8ba7-4bb7-8564-3b5dce31af97');
INSERT INTO public.sessions VALUES (146, 7, '81ccd673-3ee5-4b52-8cc6-cceab2689bcd');
INSERT INTO public.sessions VALUES (147, 7, 'b427e425-1f92-4d9d-b2e7-28e4798fe676');
INSERT INTO public.sessions VALUES (148, 7, 'e8a4b930-cb74-4d8b-8120-5ed31dba0332');
INSERT INTO public.sessions VALUES (149, 7, 'e1764bfd-a7b2-4b07-b798-a349c05fff4b');
INSERT INTO public.sessions VALUES (150, 7, '47bc4570-7e0f-4036-b363-0f3253f25c63');
INSERT INTO public.sessions VALUES (151, 7, 'f5fd572d-25f1-4cca-879b-b0a32d6beb9c');
INSERT INTO public.sessions VALUES (152, 7, '38cca271-a049-4034-8196-a61e2fe1dd88');
INSERT INTO public.sessions VALUES (153, 7, '88849c02-9777-451c-8f38-282b141817af');
INSERT INTO public.sessions VALUES (154, 7, 'e5c773fd-5630-4e34-9b15-400344c380df');


--
-- Data for Name: shares; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.shares VALUES (1, 9, 7);
INSERT INTO public.shares VALUES (2, 9, 7);
INSERT INTO public.shares VALUES (3, 9, 7);
INSERT INTO public.shares VALUES (4, 9, 7);
INSERT INTO public.shares VALUES (5, 9, 7);
INSERT INTO public.shares VALUES (6, 9, 7);
INSERT INTO public.shares VALUES (7, 9, 7);
INSERT INTO public.shares VALUES (8, 9, 7);
INSERT INTO public.shares VALUES (9, 9, 7);
INSERT INTO public.shares VALUES (10, 9, 7);
INSERT INTO public.shares VALUES (11, 9, 7);
INSERT INTO public.shares VALUES (12, 9, 7);
INSERT INTO public.shares VALUES (13, 9, 7);
INSERT INTO public.shares VALUES (14, 9, 7);
INSERT INTO public.shares VALUES (15, 18, 7);
INSERT INTO public.shares VALUES (16, 9, 7);
INSERT INTO public.shares VALUES (17, 9, 7);
INSERT INTO public.shares VALUES (18, 9, 7);
INSERT INTO public.shares VALUES (19, 9, 7);
INSERT INTO public.shares VALUES (20, 9, 7);
INSERT INTO public.shares VALUES (21, 9, 7);
INSERT INTO public.shares VALUES (22, 37, 10);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.users VALUES (1, 'Thiana', 'thiana@hotmail.com', '$2b$10$G9V2e/83o7igR.Sdu0pOX.LZ7k.4LctkoAMrqNJTtqAZouQya4BXa', 'https://png.pngtree.com/thumb_back/fw800/background/20220523/pngtree-trendy-woman-portrait-female-profile-image_1388449.jpg');
INSERT INTO public.users VALUES (2, 'Maria', 'maria@hotmail.com', '$2b$10$AH3NH9Nlen5/uLKAs/LKquKUXoKmMq76hQ/6bqz5zLSrPWL5wdsS6', 'https://png.pngtree.com/thumb_back/fw800/background/20220523/pngtree-trendy-woman-portrait-female-profile-image_1388449.jpg');
INSERT INTO public.users VALUES (3, 'Joao', 'joao@hotmail.com', '$2b$10$JNjA9CdIjaT0VHqLahfGIeTASWLdjCeGRRAEWJ4oD5H21k.P315AO', 'https://img.freepik.com/vetores-premium/desenho-de-clipart-de-perfil-de-personagem-de-desenho-animado-de-homem_51194-284.jpg?w=2000');
INSERT INTO public.users VALUES (4, 'mel', 'mel@hotmail.com', '$2b$10$6vWuOBTYMk6EB0ZTM6ty/On1XoMb5ADt0se9/nRxuDLA8tILOOJ.K', 'https://img.freepik.com/vetores-premium/desenho-de-clipart-de-perfil-de-personagem-de-desenho-animado-de-homem_51194-284.jpg?w=2000');
INSERT INTO public.users VALUES (5, 'jorge', 'jorge@jorge.com', '$2b$10$4iVAlrFSf5vXrYjYrb5qbuBCqj1apo112D9YVUu8W1R/L/FseXho6', 'https://www.portaldodog.com.br/cachorros/wp-content/uploads/2019/12/cao-rottweiler-de-raca-pura_100493-830.jpg');
INSERT INTO public.users VALUES (6, 'bruno', 'bruno@hotmail.com', '$2b$10$m5F7fofufy26YeZKJrWaeek9VFvcTw18GpkeZu../gqbJ7Wnp3EMO', 'https://img.freepik.com/vetores-premium/desenho-de-clipart-de-perfil-de-personagem-de-desenho-animado-de-homem_51194-284.jpg?w=2000');
INSERT INTO public.users VALUES (7, 'teste', 'teste@teste.com', '$2b$10$ASMMKoQtruk.Uc0YNS8oy.wPxMv9eMnkw2oyojvxzxqO0fH8em6AO', 'data:image/jpeg;base64,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');
INSERT INTO public.users VALUES (8, 'bil', 'bil@hotmail.com', '$2b$10$Wg2p.A1bP7IdvkAtt8Ak7OXIZMacWpRR.jK8LEMnTnNERPxYExi2i', 'https://img.freepik.com/vetores-premium/desenho-de-clipart-de-perfil-de-personagem-de-desenho-animado-de-homem_51194-284.jpg?w=2000');
INSERT INTO public.users VALUES (9, 'julia', 'julia@hotmail.com', '$2b$10$sa6O4ck2rJla/YAXoeFrP.T6l/I/pOY2aywzvhr3l3F4AL9vyyd/.', 'https://img.freepik.com/vetores-premium/desenho-de-clipart-de-perfil-de-personagem-de-desenho-animado-de-homem_51194-284.jpg?w=2000');
INSERT INTO public.users VALUES (10, 'fulaninha', 'ana-beatriz-martas@tuamaeaquelaursa.com', '$2b$10$dwMOfWjvTo9E2U4ziVp7P.obUB5yCDU2sbvMmrEcAS7nEjtNubdp2', 'https://media.gazetadopovo.com.br/2017/08/18112026/casainha-cachorro-aquecida-bigstock-960x540.jpg');


--
-- Name: comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.comments_id_seq', 1, false);


--
-- Name: followers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.followers_id_seq', 1, false);


--
-- Name: following_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.following_id_seq', 1, false);


--
-- Name: hashtags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.hashtags_id_seq', 10, true);


--
-- Name: likes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.likes_id_seq', 1, false);


--
-- Name: metadata_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.metadata_id_seq', 27, true);


--
-- Name: posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.posts_id_seq', 37, true);


--
-- Name: sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sessions_id_seq', 154, true);


--
-- Name: shares_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.shares_id_seq', 22, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 10, true);


--
-- Name: comments comments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);


--
-- Name: followers followers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.followers
    ADD CONSTRAINT followers_pkey PRIMARY KEY (id);


--
-- Name: following following_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.following
    ADD CONSTRAINT following_pkey PRIMARY KEY (id);


--
-- Name: hashtags hashtags_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.hashtags
    ADD CONSTRAINT hashtags_pkey PRIMARY KEY (id);


--
-- Name: likes likes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.likes
    ADD CONSTRAINT likes_pkey PRIMARY KEY (id);


--
-- Name: metadata metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.metadata
    ADD CONSTRAINT metadata_pkey PRIMARY KEY (id);


--
-- Name: posts posts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_pkey PRIMARY KEY (id);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: shares shares_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.shares
    ADD CONSTRAINT shares_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: comments comments_postId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT "comments_postId_fkey" FOREIGN KEY ("postId") REFERENCES public.posts(id);


--
-- Name: comments comments_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT "comments_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- Name: followers followers_followerId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.followers
    ADD CONSTRAINT "followers_followerId_fkey" FOREIGN KEY ("followerId") REFERENCES public.users(id);


--
-- Name: followers followers_followingId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.followers
    ADD CONSTRAINT "followers_followingId_fkey" FOREIGN KEY ("followingId") REFERENCES public.users(id);


--
-- Name: following following_followerId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.following
    ADD CONSTRAINT "following_followerId_fkey" FOREIGN KEY ("followerId") REFERENCES public.users(id);


--
-- Name: following following_followingId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.following
    ADD CONSTRAINT "following_followingId_fkey" FOREIGN KEY ("followingId") REFERENCES public.users(id);


--
-- Name: shares shares_postId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.shares
    ADD CONSTRAINT "shares_postId_fkey" FOREIGN KEY ("postId") REFERENCES public.posts(id);


--
-- Name: shares shares_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.shares
    ADD CONSTRAINT "shares_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

