--
-- PostgreSQL database dump
--

-- Dumped from database version 14.18 (Ubuntu 14.18-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.18 (Ubuntu 14.18-0ubuntu0.22.04.1)

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
-- Name: allproducts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.allproducts (
    name character varying,
    code character varying NOT NULL,
    id integer NOT NULL
);


ALTER TABLE public.allproducts OWNER TO postgres;

--
-- Name: allproducts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.allproducts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.allproducts_id_seq OWNER TO postgres;

--
-- Name: allproducts_id_seq1; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.allproducts_id_seq1
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.allproducts_id_seq1 OWNER TO postgres;

--
-- Name: allproducts_id_seq1; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.allproducts_id_seq1 OWNED BY public.allproducts.id;


--
-- Name: id_siq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.id_siq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.id_siq OWNER TO postgres;

--
-- Name: fittingproduct; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fittingproduct (
    id integer DEFAULT nextval('public.id_siq'::regclass) NOT NULL,
    name character varying,
    code character varying NOT NULL,
    unit character varying,
    number_box integer,
    number_pallet integer,
    entity character varying,
    color character varying,
    usage character varying,
    model character varying,
    export boolean,
    quality character varying,
    size integer,
    tickness numeric,
    weight character varying(10),
    image character varying,
    active boolean
);


ALTER TABLE public.fittingproduct OWNER TO postgres;

--
-- Name: id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.id_seq OWNER TO postgres;

--
-- Name: id_sss; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.id_sss
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.id_sss OWNER TO postgres;

--
-- Name: machines; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.machines (
    id integer NOT NULL,
    machine character varying,
    category text
);


ALTER TABLE public.machines OWNER TO postgres;

--
-- Name: machines_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.machines_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.machines_id_seq OWNER TO postgres;

--
-- Name: machines_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.machines_id_seq OWNED BY public.machines.id;


--
-- Name: materials; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.materials (
    id integer NOT NULL,
    material character varying
);


ALTER TABLE public.materials OWNER TO postgres;

--
-- Name: materials_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.materials_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.materials_id_seq OWNER TO postgres;

--
-- Name: materials_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.materials_id_seq OWNED BY public.materials.id;


--
-- Name: mixentries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mixentries (
    id integer NOT NULL,
    operator_id integer,
    shift integer,
    line_id integer,
    product_id character varying,
    description character varying,
    recipe_code integer,
    date character varying(15),
    category text,
    amount integer,
    stop_id integer,
    stop_time integer,
    "time" integer,
    mainstat boolean
);


ALTER TABLE public.mixentries OWNER TO postgres;

--
-- Name: mixentries_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.mixentries_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mixentries_id_seq OWNER TO postgres;

--
-- Name: mixentries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.mixentries_id_seq OWNED BY public.mixentries.id;


--
-- Name: operators; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.operators (
    id integer NOT NULL,
    name character varying,
    father character varying,
    sex character varying(5),
    personal_id character varying,
    marriage boolean,
    education character varying,
    major character varying,
    part character varying,
    type character varying(10)
);


ALTER TABLE public.operators OWNER TO postgres;

--
-- Name: operators_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.operators_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.operators_id_seq OWNER TO postgres;

--
-- Name: operators_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.operators_id_seq OWNED BY public.operators.id;


--
-- Name: pipeproduct; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pipeproduct (
    id integer DEFAULT nextval('public.id_seq'::regclass) NOT NULL,
    name character varying,
    code character varying NOT NULL,
    unit character varying,
    usage character varying,
    export boolean,
    size integer,
    tickness numeric,
    quality character varying,
    length integer,
    weight character varying,
    color character varying,
    image character varying,
    active boolean
);


ALTER TABLE public.pipeproduct OWNER TO postgres;

--
-- Name: rawmaterials; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rawmaterials (
    id integer NOT NULL,
    rawmaterial character varying,
    company character varying,
    price integer,
    confirm boolean
);


ALTER TABLE public.rawmaterials OWNER TO postgres;

--
-- Name: rawmaterials_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.rawmaterials_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rawmaterials_id_seq OWNER TO postgres;

--
-- Name: rawmaterials_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.rawmaterials_id_seq OWNED BY public.rawmaterials.id;


--
-- Name: recipes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.recipes (
    id integer NOT NULL,
    weight double precision,
    material_id integer,
    rawmaterial_id integer,
    mixentries_id integer
);


ALTER TABLE public.recipes OWNER TO postgres;

--
-- Name: recipes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.recipes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.recipes_id_seq OWNER TO postgres;

--
-- Name: recipes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.recipes_id_seq OWNED BY public.recipes.id;


--
-- Name: stops; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.stops (
    id integer NOT NULL,
    stop_reason text
);


ALTER TABLE public.stops OWNER TO postgres;

--
-- Name: stops_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.stops_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.stops_id_seq OWNER TO postgres;

--
-- Name: stops_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.stops_id_seq OWNED BY public.stops.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    username character varying,
    hashed_pass character varying,
    role character varying
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: allproducts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.allproducts ALTER COLUMN id SET DEFAULT nextval('public.allproducts_id_seq1'::regclass);


--
-- Name: machines id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.machines ALTER COLUMN id SET DEFAULT nextval('public.machines_id_seq'::regclass);


--
-- Name: materials id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materials ALTER COLUMN id SET DEFAULT nextval('public.materials_id_seq'::regclass);


--
-- Name: mixentries id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mixentries ALTER COLUMN id SET DEFAULT nextval('public.mixentries_id_seq'::regclass);


--
-- Name: operators id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.operators ALTER COLUMN id SET DEFAULT nextval('public.operators_id_seq'::regclass);


--
-- Name: rawmaterials id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rawmaterials ALTER COLUMN id SET DEFAULT nextval('public.rawmaterials_id_seq'::regclass);


--
-- Name: recipes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recipes ALTER COLUMN id SET DEFAULT nextval('public.recipes_id_seq'::regclass);


--
-- Name: stops id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stops ALTER COLUMN id SET DEFAULT nextval('public.stops_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: allproducts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.allproducts (name, code, id) FROM stdin;
لوله استخری مشکی 1/9 * 20   800 گرم	128002019166	917
لوله استخری مشکی 2/3 * 25   1200 گرم	128002523167	918
لوله استخری 2/9 * 32   1900 گرم	128003229159	919
لوله استخری مشکی 3 * 40   3200 گرم	128000403158	920
لوله استخری مشکی 50 * 3/7	128005037001	921
لوله استخری مشکی 63 * 4/7  وزن 6300	128006347002	922
لوله استخری مشکی 75 *5/6 وزن 8800	128007556034	923
لوله استخری مشکی 6/7 * 90	123109067037	924
لوله استخری مشکی 6/6 * 110	128011066165	925
لوله 2/7 - 110 آبرسانی	103111027005	926
لوله 2/8 - 90 آبرسانی	103109028004	927
لوله 2/5 - 63 آبرسانی	103106325003	928
لوله 2/4 - 50 آبرسانی	103105024002	929
لوله 2/4 - 40 آبرسانی	103104024001	930
لوله برقی 1/5 * 20 درجه 3   750 گرم	114102015210	931
لوله برقی 1/5 * 20 درجه2  750 گرم	114102015204	932
لوله برقی 2 * 32 درجه2  1600 گرم	114103202203	933
لوله برقی 2 * 25 درجه2  1200 گرم	114102015202	934
لوله برقی 2 * 20 درجه 2   950 گرم	114100202201	935
لوله برقی 1/5 * 20 درجه 3   700 گرم	114102015185	936
لوله برقی خم سرد 1/5 - 32 (B21) رنگی	134103215173	937
لوله برقی خم سرد 1/5 - 20 (B21) رنگی	134102015172	938
لوله برقی خم سرد 1/5 - 25 (B21) رنگی	134102515171	939
لوله برقی خم سرد نشکن 1/5 - 25 (A21) رنگی	134102515169	940
لوله برقی  خم سرد نشکن 1/5 * 20  (A21 ) رنگی	134102015168	941
لوله برقی 1/5 * 20 درجه 3   850 گرم	114102015155	942
لوله برقی 1/5 * 20 درجه 1 850 گرم	114102015127	943
لوله برقی 1/8 * 40 درجه 3   1900 گرم	114104018107	944
لوله برقی 1/3 * 20 درجه 2 730 گرم	114102017103	945
لوله برقی 1/5 * 32 درجه 3  1300 گرم	114103215083	946
لوله برقی 1/8 * 32 درجه 3 1500 گرم	114103218072	947
لوله برقی 1/5 * 20 درجه 3   830 گرم	114102015071	948
لوله برقی 2 * 20 درجه 3  1000 گرم	114100202069	949
لوله برقی 2 * 25 درجه 3   1200 گرم	114100252064	950
لوله برقی 1.5*32 درجه 2 1300 گرم	114103215062	951
لوله برقی خم سرد  1/5 * 32    1500 گرم	114103215054	952
لوله برقی 1/8 * 20 درجه 3   900 گرم	134102018047	953
لوله برقی 1/5 * 25 درجه 1  1000 گرم	114102515046	954
لوله برقی 1/5 * 32 درجه 1 1300 گرم	114103215045	955
لوله برقی 1/5 * 25 درجه 3    1000 گرم	114102515040	956
لوله برقی خم سرد 1/5 * 25  1000 گرم	114102515010	957
لوله برقی 1/5 * 20 درجه 3     880 گرم	104102015007	958
لوله برقی 1/5 * 20 درجه 1   800 گرم	104102015006	959
لوله برقی خم سرد 1/5 * 20    800 گرم	104102015004	960
لوله برقی 1.8*32 درجه 3  1500 گرم	104103218002	961
لوله برقی 1.5*20 درجه 3 800گرم	104120153001	962
لوله برقی با قابلیت خم سرد 1/5 - 32 (B21)	104203215006	963
لوله برقی با قابلیت خم سرد 1/5 - 25 (B21)	104202515005	964
لوله برقی با قابلیت خم سرد 1/5 - 20 (B21)	104202015004	965
لوله برقی خم سرد نشکن 1/5 - 32 (A21) پلاس	104103215003	966
لوله برقی خم سرد نشکن 1/5 - 25 (A21) پلاس	104102515002	967
لوله برقی خم سرد نشکن 1/5 - 20 (A21) پلاس	104102015001	968
لوله 3/4 * 110  سه لایه  فاضلابی	111111034164	969
لوله 3/2 * 63 سه لایه  فاضلابی	111106332163	970
لوله 3/2 * 90 سه لایه  فاضلابی	111109032162	971
لوله 3/4 * 125 سه لایه  فاضلابی	111112534161	972
لوله 4/9 * 250 فاضلابی	101125049154	973
لوله 4/7 * 110 فاضلابی	101111047126	974
لوله 4/7 * 125 فاضلابی	101112547125	975
لوله 3/8 * 160	101116038120	976
لوله 4 - 200 فاضلابی	101120040010	977
لوله 4 - 160 فاضلابی	101116040009	978
لوله 3/2 - 125 فاضلابی	101112532008	979
لوله 3/2 - 110 فاضلابی	101111032007	980
لوله 3 - 90 فاضلابی	101109030006	981
لوله 3 - 75 فاضلابی	101107530005	982
لوله 3 - 63 فاضلابی	101106330004	983
لوله 3 - 50 فاضلابی	101105030003	984
لوله 3 - 40 فاضلابی	101104030002	985
لوله 3 - 32 فاضلابی	101103230001	986
لوله 1/5 * 75 هواکشی 3 متری	102107515141	987
لوله 1/5 * 75 هواکشی 9 متری	102107515139	988
لوله 1/5 * 75 (شوکت) 3 متری	102107515030	989
لوله 1/8 - 75	102107518022	990
لوله  3/2 - 160 هواکشی	102116032007	991
لوله  2/5 - 125هواکشی	102112525006	992
لوله  2/2 - 110 هواکشی	102111022005	993
لوله  1/8 - 90 هواکشی	102109018004	994
لوله  1/9 - 63 هواکشی	102106319003	995
لوله  1/8 - 40 هواکشی	102104018002	996
لوله 1/5 - 40 هواکشی	102104015001	997
PIPE 25 Golsar pvc 0/580	118675580216	998
PIPE 25*1/8 Neega  0/580	117902518178	999
PIPE DELUXE 25  /58	116102501007	1000
PIPE 32 cm 2/800	118232280226	1001
PIPE 32*1/8 Neega  0/720	117903218179	1002
PIPE 32 DELUXE 2/8	116103228128	1003
PIPE 32 DELUXE 1/700	116132170113	1004
PIPE 32 DELUXE 1/750	116132175079	1005
PIPE 32 DELUXE 1/7	116103217032	1006
PIPE 50 ALMadeneh 4/5	118505045215	1007
PIPE 50 Lave plast 4	118300504197	1008
PIPE 50 CM  3/5	118205035196	1009
صنع خصیصا للمحلات زمرد 4   PIPE 50	118100504193	1010
PIPE 50 Smart Albadr 4	118000504184	1011
PIPE 50 Mirnaw (3m) 2/5	117805025177	1012
PIPE 50 RUSNAY 5	116200050150	1013
PIPE 50 SADEH 2/9 M   1/450K	117750290147	1014
PIPE 50 BURKAN 4/5	116305045146	1015
2/5(PIPE 50 BURKAN (3m	117505025134	1016
PIPE 50 Aseef 2/5	117405024119	1017
PIPE 50 Aseef 3/6	117405036118	1018
PIPE 50 GOLDEN MAX 4/5	116405045110	1019
PIPE 50 cm 4	111100504061	1020
PIPE 50 ALSEEF 5	111100505044	1021
PIPE 50 RUSNAY 4	116205006050	1022
PIPE 75 cm Three Layers 8	118200758229	1023
PIPE 75  GOLDEN MAX Three Layers 6/5	116407565224	1024
PIPE 75 AL Madeneh THREE LAYERS 6	118500756212	1025
PIPE 75 MASTORD Two Layer 7	118400757209	1026
PIPE 75 MASTORD Three Layer 7	118400757207	1027
PIPE 75 Lave plast 6	118300756200	1028
صنع خصیصا للمحلات زمرد 7 PIPE 75 three Layers	118100757192	1029
صنع خصیصا للمحلات زمرد 10 PIPE 75 three Layers	118107510191	1030
صنع خصیصا للمحلات زمرد5 P16IPE 75 three Layers	118100755188	1031
PIPE 75 Smart Albadr Three layers 7	118000757183	1032
PIPE 75 BURKAN 5/5	116307555145	1033
PIPE 75 AL AHRAM THREE LAYERS 7	117600075142	1034
PIPE 75 ALSEYF THREE LAYERS 7K	117107507137	1035
PIPE 75 rusnay three layers 6k	116207506136	1036
3/5(PIPE 75 BURKAN( 3m	117507535133	1037
PIPE 75 BURKAN 7	117500757121	1038
PIPE 75 Aseef 4	117400754117	1039
PIPE 75 Aseef 6	117400756116	1040
PIPE 75 GOLDEN MAX THREE LAYERS 5/5	116407555098	1041
PIPE 75 GOLDEN MAX THREE LAYERS 6	116400756091	1042
PIPE 75 DELUXE THREE LAYERS 6	116100006082	1043
PIPE 75 DELUXE THREE LAYERS 5	116100755078	1044
PIPE 75 cmtwo Layers 6	111100075060	1045
PIPE 75 CM three Layers 6	111100075059	1046
PIPE 75 ALSEEF 6 three Layers	111100756043	1047
PIPE 75 DELUXE THREE LAYERS 5/5	116107555031	1048
PIPE 75 Burkan6	116307506056	1049
PIPE 75 RUSNAY 6	116207506049	1050
PIPE 90 BURKAN 7	116300907160	1051
PIPE 110 cm Three Layers 17	118211017228	1052
PIPE 110 AL Madeneh 14	118511014225	1053
PIPE 110 Golsar Pvc Three Layers 12	118611012221	1054
PIPE 110 cm two Layers 15	118211015220	1055
PIPE 110 BURKAN Tow Layers 12	116311012218	1056
PIPE 110 BURKAN Tow Layers 15	116311015217	1057
PIPE 110 AL Madeneh THREE LAYERS 10	118511010214	1058
PIPE 110 AL Madeneh THREE LAYERS 13	118511013213	1059
PIPE 110 AL Madeneh THREE LAYERS 15	118511015211	1060
PIPE 110 MASTORD Two Layer15	118411015208	1061
PIPE 110 MASTORD Three Layer14	118411014206	1062
PIPE 110 Lave plast 11	118311011198	1063
PIPE 110 CM three Layers 15	118211015195	1064
صنع خصیصا للمحلات زمرد 12 PIPE 110 three Layers	118111012190	1065
صنع خصیصا للمحلات زمرد 17 PIPE 110 three Layers	118111017189	1066
صنع خصیصا للمحلات زمرد 15 PIPE 110 three Layers	118111015187	1067
14 PIPE 110 Smart Albadr Three Layer	118011014182	1068
PIPE 110 Aseef 12	117411012181	1069
PIPE 110 Sadeh 14	117711014180	1070
PIPE 110 Mirnaw (3m) 6	117801106176	1071
PIPE 110 ALSeeF ECO TREE LAYERS 12	117111012153	1072
PIPE 110  ALSeef ECO TREE LAYERS 14	117111014152	1073
6(PIPE 110 BURKAN( 3m	117501106132	1074
PIPE 110 AL AHRAM THREE LAYERS 12	117611012129	1075
PIPE 110 BURKAN 15	117511015124	1076
PIPE 110 BURKAN 12	117511012123	1077
PIPE 110 Aseef 10	117411010115	1078
PIPE 110 Aseef 14	117411014114	1079
PIPE 110 GOLDEN MAX THREE LAYERS 14	116411014090	1080
PIPE 110 DELUXE THREE LAYERS 10/200	116111010077	1081
PIPE 110 cmtwo Layers 10	111111010058	1082
PIPE 110 cm three Layers 14	111111014056	1083
PIPE 110 ALSEEF 12 three Layers	111111012042	1084
PIPE 110 DELUXE THREE LAYERS12	116111012015	1085
PIPE 110 RUSNAY 10	116211010060	1086
PIPE 110 BURKAN 10	116311010053	1087
PIPE 110 RUSNAY 12	116211012048	1088
PIPE 110 RUSNAY 15	116211015047	1089
PIPE 160 Lave plast 19	118316019199	1090
PIPE 160 CM three Layers 21	118216021194	1091
صنع خصیصا للمحلات زمرد 17 PIPE 160 three Layers	118116017186	1092
PIPE 160 Mirnaw (3m) 10	117816010175	1093
PIPE 160 GOLDEN MAX 30	116416030157	1094
PIPE 160 BURKAN 17	117516017144	1095
PIPE 160 GOLDENMAX 18/8	106416018138	1096
PIPE 160 GOLDENMAX 21	106416021135	1097
11(PIPE 160 BURKAN( 3m	117516011131	1098
PIPE 160 GOLDEN MAX THREE LAYERS 20	116416020093	1099
PIPE 160 RUSNAY 21	116216021065	1100
PIPE 160 RUSNAY 17	116216017059	1101
PIPE 160 RUSNAY 15	116216015046	1102
PIPE 200  RUSNAY 25	116220025231	1103
PIPE 200 BURKAN 25	116320025227	1104
PIPE 200 RUSNAY 20	116220020223	1105
PIPE 200 CM 27	118220027219	1106
PIPE 200 Lave plast 23	118320023205	1107
PIPE 200 Mirnaw (3m) 14	117820014174	1108
PIPE 200  RUSNAY 24	116220024143	1109
15(PIPE 200 BURKAN (3m	117520015130	1110
PIPE 200 RUSNAY 27	116220027095	1111
PIPE 200 RUSNAY 22	116220022009	1112
PIPE 90 BURKAN 8	116300908235	1113
    PIPE 63 BURKAN 7	116300636236	1114
لوله برقی درجه 2.5 پلاس1.5*20	114102015233	4005
pipe 75 SDO three layers 3 (3m)	118700075250	4007
pipe 160 SDO three layers 5/5 (2m)	118700050245	4012
pipe 200 SDO three layers 12 (3m)	000000000001	4017
PIPE 160 BURKAN 15	116316015254	4019
PIPE 110 Salam 6 (3m)	118800110253	4020
PIPE 160 Salam 9 (3m)	118800160252	4021
PIPE 75 AL Madeneh  1.5	118503215238	4023
PIPE 110 TARGET Three Layers 15	110000000000	4026
PIPE 25*1/8 CM 0/580	111110000000	4029
لوله 75 آبرسانی 12 متری (10 کیلو)	123107512261	4035
لوله برقی 2 * 20 درجه 2 1000 گرم	114102002011	4036
لوله برقی پلاس1.5*25	114102515241	4006
pipe 110 SDO three layers 7/5 (3m)	118700110249	4008
pipe 75 SDO three layers 6	118700075244	4013
pipe 110 SDO three layers 15	118700110243	4014
pipe 160 SDO three layers 17	118700160242	4015
زانو 45 * 63 NEW دو سر کوپل سفید	211206345085	4018
PIPE 200 Salam 12 (3m)	118800200251	4022
PIPE 110 TARGET Three Layers 14	118911014256	4024
لوله 6.2 - 315 فاضلابی	111000000000	4027
PIPE 75 Salam 3.5 (3m)	111111000000	4030
لوله 7.9 - 400 آبرسانی	111111110000	4037
سه راهی خم دریچه بازدید 87/5 * 110 	200511087073	3800
pipe 160 SDO three layers 8/5 (3m)	118700160248	4009
pipe 75 SDO three layers 2 (2m)	118700075247	4010
لوله برقی 1/5 * 20 درجه2 800 گرم	1341020151755	4016
خط زن	1000000000	4025
PIPE 160 TARGET Three Layers 22	111100000000	4028
لوله برقی 1.5*40 	114104015260	4031
رابط انبساطی 110	201500110078	3762
سه راهی 45 * 40 دو سر کوپل طوسی	200304045077	3763
سه راهی 45 * 40 سه سر کوپل طوسی	201304045075	3764
بوشن 25 برقی	202002501072	3765
زانو 32 برقی درجه 1	200103201071	3766
زانو 25 برقی عصایی	200102501070	3767
زانو 20 برقی عصایی	200102001069	3768
زانو 45 * 63 NEW دو سر کوپل طوسی	201206345068	3769
سه راهی خم دریچه بازدید 87/5 * 63 NEW طوسی	200506390066	3770
سوکت ترمزدار 40 طوسی	200700040064	3771
سوکت تعمیری 110	200700110060	3772
سه راهی 45 * 50 درجه سه سر کوپل طوسی	201305045054	3773
سه راهی 45 * 50 درجه طوسی	200305045052	3774
سیفون پایه دار 90 درجه NEW طوسی	201700090050	3775
سه راهی دو سر کوپل 90 * 50 درجه طوسی	200305090047	3776
سوکت 50 ترمزدار طوسی	200700050045	3777
سه راهی سه سر کوپل  90 * 50 درجه طوسی	201305090043	3778
زانو 90 * 110 دوسر کوپل طوسی	201211090041	3779
زانو 45 * 50 دو سر کوپل طوسی	201205045039	3780
سه راهی 90 * 63 درجه NEW طوسی	200306390035	3781
زانو 90 * 40 دو سرکوپل طوسی	201204090033	3782
سه راهی 90 * 40 درجه سه سر کوپل طوسی	201304090031	3783
سه راهی 90 * 40 درجه طوسی	200304090029	3784
زانو 45 * 50 درجه طوسی	200105045027	3785
زانو 90 * 40 درجه طوسی	200109040025	3786
زانو 90 * 50 درجه دو سر کوپل طوسی	201205045019	3787
زانو 90 * 50 درجه طوسی	200105045017	3788
زانو 45 * 40 درجه NEW دو سر کوپل طوسی	201204045015	3789
زانو 45 * 40 درجه NEW طوسی	200104045013	3790
زانو 90*90 NEW 	200109090229	3791
تبدیل 63*75 	200807563081	3792
سوکت 110 بدون ترمز NEW 	200711000227	3793
رابط دریچه بازدید 63 	200606300080	3794
رابط دریچه بازدید 90 	200609000079	3795
سه راهی دریچه بازدید 90 * 110 	200511090077	3796
چهار راهی 45 * 110 	201611045076	3797
کلاهک سه کاره 	201112590075	3798
سه راهی خم 87.5 * 110 	200511087074	3799
رابط دریچه بازدید 110 	200611000072	3801
سه راهی  90 * 63  سه سر کوپل 	201306390071	3802
سه راهی 90 * 125 	200312590070	3803
سه راهی 90 * 110  NEW 	200311090225	3804
سه راهی 90 * 110 	200311090069	3805
سه راهی  90 * 90 	200309090068	3806
سه راهی 90 * 75 درجه طوسی	200307590067	3807
سه راهی 90 * 63 	200306390066	3808
سه راهی تبدیل 90 * 90 * 110 طوسی	200411090065	3809
سه راهی تبدیل 90 * 63 * 110 طوسی	200411090064	3810
سه راهی تبدیل 90 * 63 * 90 طوسی	200409090063	3811
سه راهی 45 * 110 سه سر کوپل 	201311045062	3812
سه راهی  45 * 63 سه سر کوپل 	201306345061	3813
سه راهی 45 * 160	200316045060	3814
سه راهی 45 * 125 	200312545059	3815
سه راهی 45 * 110  NEW 	200311045224	3816
سه راهی 45 * 110 	200311045058	3817
سه راهی 45 * 90 	200309045057	3818
سه راهی  45 * 75 درجه طوسی	200307545056	3819
سه راهی 45 * 63  NEW 	200306345223	3820
سه راهی 45 * 63 	200306345055	3821
سه راهی تبدیل سه سر کوپل 45 * 63 * 110	201311045054	3822
سه راهی تبدیل 45 * 125 * 160 	200416045053	3823
سه راهی تبدیل 45 * 110 * 160 	200416045052	3824
سه راهی تبدیل 45 * 110 * 125 	200412545051	3825
سه راهی تبدیل 45  * 90 * 110 	200411045050	3826
سه راهی تبدیل 45 * 63 * 110 NEW 	200411045222	3827
سه راهی تبدیل 45 * 63 * 110 	200411045049	3828
سه راهی تبدیل 45 * 63 * 90 	200409045048	3829
درپوش (گپ) دو کاره کوپله و لوله 160 	200916000047	3830
درپوش (گپ) دو کاره کوپله و لوله 125 	200912500046	3831
درپوش (گپ) دو کاره کوپله و لوله 110 	200911000045	3832
درپوش (گپ) دو کاره کوپله و لوله 90 	200900900044	3833
درپوش (گپ) دو کاره کوپله و لوله 63 	200906300043	3834
سوکت بدون ترمز 90 	200709000041	3835
سوکت بدون ترمز 63 	200706300040	3836
سوکت ترمزدار 160 	200716000039	3837
سوکت ترمزدار 125 	200712500038	3838
سوکت ترمزدار 110 NEW 	200711000221	3839
سوکت ترمزدار 110 	200711000037	3840
سوکت ترمزدار 90 	200709000036	3841
سوکت ترمزدار 75 	200707500035	3842
سوکت ترمزدار 63 NEW 	200706300220	3843
سوکت ترمزدار 63 	200706300034	3844
تبدیل 125 * 160 طوسی	200816025033	3845
تبدیل 110 * 160 طوسی	200816010032	3846
تبدیل 110 * 125 طوسی	200812511031	3847
تبدیل 90 * 110 طوسی	200811090030	3848
تبدیل 63 * 110 طوسی	200811063029	3849
تبدیل 63 * 90 طوسی	200809063028	3850
رابط نر و ماده ( موفه ) 110 طوسی	201511000027	3851
رابط نر و ماده ( موفه ) 90  طوسی	201509000026	3852
رابط نر و ماده ( موفه ) 63 طوسی	201506300025	3853
سیفون پایه دار 110 * 125 NEW طوسی	201712535219	3854
سیفون پایه دار 110 * 125 طوسی	201712535024	3855
سیفون پایه دار 110 * 110 طوسی	201711035023	3856
سیفون  پایه دار 90 طوسی	201709035022	3857
سیفون  پایه دار 75 طوسی	201707535021	3858
سیفون  پایه دار 63 NEW طوسی	201706335218	3859
سیفون  پایه دار 63 طوسی	201706335020	3860
زانو 90 * 90درجه دوسر کوپله طوسی	201209090019	3861
زانو 90 * 63 درجه دوسر کوپله طوسی	201206390018	3862
زانو خم 87.5 * 110 طوسی	201411087017	3863
زانو خم 87.5 * 63 طوسی	201406387016	3864
زانو 90 * 160 درجه  طوسی	200116090015	3865
زانو 90 * 125 درجه  طوسی	200112590014	3866
زانو 90 * 110 درجه NEW طوسی	200111090217	3867
زانو 90 * 110 درجه  طوسی	200111090013	3868
زانو  90 * 90 درجه طوسی	200109090012	3869
زانو 90 * 75 درجه طوسی	200107590011	3870
زانو 90 * 63 درجه NEW طوسی	200106390216	3871
زانو 90 * 63 درجه طوسی	200106390010	3872
زانو 45 * 110 درجه دو سر کوپله طوسی	201411045009	3873
زانو 45 * 90 درجه دو سر کوپله طوسی	201409045008	3874
زانو 45 * 63 درجه دو سر کوپله طوسی	201406345007	3875
زانو  45 * 160 درجه طوسی	200116045006	3876
زانو 45 * 125 درجه طوسی	200112545005	3877
زانو 45 * 110 درجه NEW طوسی	200111045215	3878
زانو 45 * 110 درجه طوسی	200111045004	3879
زانو 45 * 90 درجه NEW طوسی	200109045214	3880
زانو 45 * 90 درجه طوسی	200109045003	3881
زانو 45 * 75 درجه طوسی	200107545002	3882
زانو 45 * 63 درجه NEW طوسی	200106345213	3883
زانو 45 * 63 درجه طوسی	200106345001	3884
سه راهی 45 * 40 دو سر کوپل سفید	210304045076	3885
سه راهی 45 * 40 سه سر کوپل سفید	211304045074	3886
سوکت ترمزدار 40 سفید	210700040065	3887
سه راهی 45 * 50 درجه سه سر کوپل سفید	211305045055	3888
سه راهی 45 * 50 درجه سفید	210305045053	3889
سیفون پایه دار 90 درجه NEW سفید	211700090051	3890
سه راهی دو سر کوپل 90 * 50 درجه سفید	210305090048	3891
سوکت 50 ترمزدار سفید	210700050046	3892
سه راهی سه سر کوپل 90 * 50 درجه سفید	211305090044	3893
زانو 45 * 50 دو سر کوپل سفید	211205045038	3894
FOUR Ways **	210600004037	3895
سه راهی 90 * 63 درجه NEW سفید	210306390036	3896
زانو 90 * 40 دو سر کوپل سفید	211204090034	3897
سه راهی 90 * 40 درجه سه سر کوپل سفید	211304090032	3898
سه راهی 90 * 40 درجه سفید	210304090030	3899
زانو 45* 50 درجه سفید	210105045028	3900
زانو 90 * 40 درجه سفید	210104090026	3901
FOUR Ways =	210600004024	3902
FOUR Ways +	210600004023	3903
SOCKET 25	210300025021	3904
زانو 90 * 50 درجه دو سر کوپل سفید	211205045020	3905
زانو 90 * 50 درجه سفید	210105045018	3906
زانو 45 * 40 درجه  NEW دو سر کوپل سفید	211204045016	3907
زانو 45 * 40 درجه NEW سفید	210104045014	3908
tee 110 * 45	210311045012	3909
Knee 110 * 90	210111090011	3910
tee 110 * 90	210411090010	3911
 SiPhon 110 alseef	210200110009	3912
Knee 110 * 45	210111045008	3913
tee 75*90	210407590006	3914
tee 75*45	210407545005	3915
Socket 75	210300075004	3916
Siphon 75	210200075003	3917
Knee 75 * 45	210107545002	3918
Knee 75* 90	210107590001	3919
زانو 90*90 NEW سفید	210109090228	3920
سوکت برقی سفید 32 ترمز دار	210703200175	3921
سوکت برقی سفید 25 ترمز دار	210702500174	3922
سوکت برقی سفید 20 ترمز دار	210702000173	3923
زانو 90*75 دوسر کوبل سفید	210107590172	3924
سوکت 110 بدون ترمز NEW سفید	210711000226	3925
سه راهی دریچه بازدید 90 * 110 سفید	210511090168	3926
کلاهک سه کاره 125.110.90سفید	211112590166	3927
سه راهی خم 87.5 * 110 سفید	210511087165	3928
سه راهی خم دریچه بازدید 87/5 * 110 سفید	210511087164	3929
سه راهی  90 * 63 درجه 3 سر کوپل سفید	211306390163	3930
سه راهی 90 * 125 درجه  سفید	210312590162	3931
سه راهی 90 * 110 درجه NEW سفید	210311090212	3932
سه راهی  90 * 90 درجه سفید	210309090160	3933
سه راهی 90 * 63 درجه سفید	210306390158	3934
زانو 90 * 63 درجه NEW سفید	210106390204	3935
سه راهی تبدیل 90 * 63 * 110 سفید	210411063156	3936
سه راهی تبدیل 90 * 63 * 90 سفید	210409090155	3937
سه راهی 45 * 110 درجه سه سر کوپل سفید	211311045154	3938
سه راهی  45 * 63درجه سه سر کوپل سفید	211306345153	3939
سه راهی 45 * 125 درجه سفید	210312545151	3940
سه راهی 45 * 110 درجه NEW سفید	210311045211	3941
سه راهی 45 * 110 درجه سفید	210311045150	3942
سه راهی 45 * 90 درجه سفید	210309045149	3943
سه راهی 45 * 63 درجه NEW سفید	210306345210	3944
سه راهی 45 * 63 درجه سفید	210306345147	3945
سه راهی تبدیل 45 درجه سه سر کوپل 45 * 63 * 110 سفید	211311045146	3946
سه راهی تبدیل 45 * 110 * 125 سفید	210412545143	3947
سه راهی تبدیل 45  * 90 * 110 سفید	210411045142	3948
سه راهی تبدیل 45 * 63 * 110 NEW سفید	210411045209	3949
سه راهی تبدیل 45 * 63 * 110 سفید	210411045141	3950
سه راهی تبدیل 45 * 63 * 90 سفید	210409045140	3951
درپوش (گپ) دو کاره کوپله و لوله 125 سفید	210912500138	3952
درپوش (گپ) دو کاره کوپله و لوله 110 سفید	210911000137	3953
درپوش (گپ) دو کاره کوپله و لوله 90 سفید	210909000136	3954
درپوش (گپ) دو کاره کوپله و لوله 63 سفید	210906300135	3955
سوکت بدون ترمز 90 سفید	210709000133	3956
سوکت بدون ترمز 63 سفید	210706300132	3957
سوکت ترمزدار 125 سفید	210712500130	3958
سوکت ترمزدار 110 NEW سفید	210711000208	3959
سوکت ترمزدار 110 سفید	210711000129	3960
سوکت ترمزدار 90 سفید	210709000128	3961
سوکت ترمزدار 63 NEW سفید	210706300207	3962
تبدیل 110 * 125 سفید	210812510123	3963
تبدیل 90 * 110 سفید	210811090122	3964
تبدیل 63 * 110 سفید	210811063121	3965
تبدیل 63 * 90 سفید	210809063120	3966
رابط نر و ماده ( موفه ) 110 سفید	211511000119	3967
رابط نر و ماده ( موفه ) 63 سفید	211506300117	3968
سیفون پایه دار 110 * 125 NEWسفید	211712510206	3969
سیفون پایه دار 110 * 110 سفید	211711035115	3970
سیفون  پایه دار 90 سفید	211709035114	3971
سیفون  پایه دار 63 NEW سفید	2118063135	3972
زانو 90 * 63 درجه دوسر کوپله سفید	211206390181	3973
زانو خم 87.5 * 110 سفید	211411087180	3974
زانو 90 * 160 درجه سفید	210116090111	3975
زانو 90 * 125 درجه سفید	210112590110	3976
زانو 90 * 110 درجه NEW سفید	210111090205	3977
زانو 90 * 75 درجه سفید	210107590107	3978
زانو 90 * 63 درجه سفید	210106390106	3979
زانو 45 * 110 درجه دو سر کوپله سفید	211211045178	3980
زانو 45 * 90 درجه دو سر کوپله سفید	211209045177	3981
زانو 45 * 63 درجه دو سر کوپله سفید	211206345176	3982
زانو  45 * 160 درجه سفید	210116045105	3983
زانو 45 * 125 درجه سفید	210112545104	3984
زانو 45 * 110 درجه NEW سفید	210111045203	3985
زانو 45 * 90 درجه NEW سفید	210109045201	3986
زانو 45 * 63 درجه NEW سفید	210106345200	3987
cap 110	210500110040	3988
cap  25	210500025022	3989
Knee 50 * 90	210105090058	3990
Knee 50 * 45	210105045057	3991
REDUCER 110 * 75	210811075061	3992
Reducing Tee 110 * 75 * 90	210411075063	3993
Reducing Tee 110 * 75 * 45	210411075062	3994
SOCKET 50	210300050056	3995
Socket 110	210300110007	3996
Tee 50 * 90	210405090073	3997
tee 50 * 45	210405045059	3998
سه راهی سه سرکوپل 90*32 طوسی	201303290079	3999
سه راهی سه سر کوپل 45*32 طوسی	201303245081	4000
سه راهی سه سرکوپل 90*32 سفید	211303290080	4001
سه راهی سه سر کوپل 45*32 سفید	211303245082	4002
سوکت تعمیری 63 همراه با بست	200700063084	4003
SOCKET 25  THREA DED /012	110300012049	4004
pipe 110 SDO three layers 5 (2m)	118700110246	4011
درب دریچه بازدید 110	211000000000	4034
\.


--
-- Data for Name: fittingproduct; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fittingproduct (id, name, code, unit, number_box, number_pallet, entity, color, usage, model, export, quality, size, tickness, weight, image, active) FROM stdin;
259	رابط انبساطی 110	201500110078	عدد	36	15	رابط	طوسی	فاضلابی	قدیم	f	درجه 1	110	3.2	398	\N	t
260	سه راهی 45 * 40 دو سر کوپل طوسی	200304045077	عدد	170	25	سه راهی	طوسی	فاضلابی	قدیم	f	درجه 1	40	3.0	90	\N	t
261	سه راهی 45 * 40 سه سر کوپل طوسی	201304045075	عدد	170	25	سه راهی	طوسی	فاضلابی	قدیم	f	درجه 1	40	3.0	90	\N	t
262	بوشن 25 برقی	202002501072	عدد	1500	15	بوشن	طوسی	برقی	قدیم	f	درجه 1	25	1.5	12	\N	t
263	زانو 32 برقی درجه 1	200103201071	عدد	0	0	زانو	طوسی	برقی	قدیم	f	درجه 1	32	3.0	0	\N	f
264	زانو 25 برقی عصایی	200102501070	عدد	0	0	زانو	طوسی	برقی	قدیم	f	درجه 1	25	1.5	0	\N	f
265	زانو 20 برقی عصایی	200102001069	عدد	0	0	زانو	طوسی	برقی	قدیم	f	درجه 1	20	1.5	0	\N	f
266	زانو 45 * 63 NEW دو سر کوپل طوسی	201206345068	عدد	100	25	زانو	طوسی	فاضلابی	جدید	f	درجه 1	63	3.0	120	\N	t
267	سه راهی خم دریچه بازدید 87/5 * 63 NEW طوسی	200506390066	عدد	50	25	سه راهی	طوسی	فاضلابی	جدید	f	درجه 1	63	3.0	240	\N	t
268	سوکت ترمزدار 40 طوسی	200700040064	عدد	500	25	سوکت	طوسی	فاضلابی	قدیم	f	درجه 1	40	3.0	122	\N	t
269	سوکت تعمیری 110	200700110060	عدد	75	15	سوکت	طوسی	فاضلابی	قدیم	f	درجه 1	110	3.2	250	\N	t
270	سه راهی 45 * 50 درجه سه سر کوپل طوسی	201305045054	عدد	100	25	سه راهی	طوسی	فاضلابی	قدیم	f	درجه 1	50	3.0	125	\N	t
271	سه راهی 45 * 50 درجه طوسی	200305045052	عدد	\N	25	سه راهی	طوسی	فاضلابی	قدیم	f	درجه 1	50	3.0	123	\N	f
272	سیفون پایه دار 90 درجه NEW طوسی	201700090050	عدد	40	15	سیفون	طوسی	فاضلابی	جدید	f	درجه 1	90	3.0	354	\N	t
273	سه راهی دو سر کوپل 90 * 50 درجه طوسی	200305090047	عدد	150	25	سه راهی	طوسی	فاضلابی	قدیم	f	درجه 1	50	3.0	93	\N	f
274	سوکت 50 ترمزدار طوسی	200700050045	عدد	270	25	سوکت	طوسی	فاضلابی	قدیم	f	درجه 1	50	3.0	66	\N	t
275	سه راهی سه سر کوپل  90 * 50 درجه طوسی	201305090043	عدد	130	25	سه راهی	طوسی	فاضلابی	قدیم	f	درجه 1	50	3.0	95	\N	t
276	زانو 90 * 110 دوسر کوپل طوسی	201211090041	عدد	35	15	زانو	طوسی	فاضلابی	قدیم	f	درجه 1	110	3.2	422	\N	t
277	زانو 45 * 50 دو سر کوپل طوسی	201205045039	عدد	230	25	زانو	طوسی	فاضلابی	قدیم	f	درجه 1	50	3.0	56	\N	t
278	سه راهی 90 * 63 درجه NEW طوسی	200306390035	عدد	65	25	سه راهی	طوسی	فاضلابی	جدید	f	درجه 1	63	3.0	165	\N	t
279	زانو 90 * 40 دو سرکوپل طوسی	201204090033	عدد	350	25	زانو	طوسی	فاضلابی	قدیم	f	درجه 1	63	3.0	55	\N	t
280	سه راهی 90 * 40 درجه سه سر کوپل طوسی	201304090031	عدد	200	25	سه راهی	طوسی	فاضلابی	قدیم	f	درجه 1	40	3.0	70	\N	t
281	سه راهی 90 * 40 درجه طوسی	200304090029	عدد	230	25	سه راهی	طوسی	فاضلابی	قدیم	f	درجه 1	40	3.0	70	\N	t
282	زانو 45 * 50 درجه طوسی	200105045027	عدد	250	25	زانو	طوسی	فاضلابی	قدیم	f	درجه 1	50	3.0	56	\N	f
283	زانو 90 * 40 درجه طوسی	200109040025	عدد	400	25	زانو	طوسی	فاضلابی	قدیم	f	درجه 1	50	3.0	46	\N	t
284	زانو 90 * 50 درجه دو سر کوپل طوسی	201205045019	عدد	200	25	زانو	طوسی	فاضلابی	قدیم	f	درجه 1	40	3.0	69	\N	t
285	زانو 90 * 50 درجه طوسی	200105045017	عدد	200	25	زانو	طوسی	فاضلابی	قدیم	f	درجه 1	50	3.0	68	\N	f
286	زانو 45 * 40 درجه NEW دو سر کوپل طوسی	201204045015	عدد	400	25	زانو	طوسی	فاضلابی	جدید	f	درجه 1	40	3.0	43	\N	t
287	زانو 45 * 40 درجه NEW طوسی	200104045013	عدد	400	25	زانو	طوسی	فاضلابی	جدید	f	درجه 1	40	3.0	41	\N	t
288	زانو 90*90 NEW 	200109090229	عدد	40	25	زانو	طوسی	فاضلابی	جدید	f	درجه 1	90	3.0	224	\N	t
289	تبدیل 63*75 	200807563081	عدد	\N	25	زانو	طوسی	فاضلابی	قدیم	f	درجه 1	75	3.0	79	\N	f
290	سوکت 110 بدون ترمز NEW 	200711000227	عدد	70	15	تبدیل	طوسی	فاضلابی	جدید	f	درجه 1	110	3.2	195	\N	t
291	رابط دریچه بازدید 63 	200606300080	عدد	175	25	رابط	طوسی	فاضلابی	قدیم	f	درجه 1	63	3.0	56	\N	t
292	رابط دریچه بازدید 90 	200609000079	عدد	96	25	رابط	طوسی	فاضلابی	قدیم	f	درجه 1	90	3.0	87	\N	t
293	سه راهی دریچه بازدید 90 * 110 	200511090077	عدد	25	25	سه راهی	طوسی	فاضلابی	قدیم	f	درجه 1	110	3.2	500	\N	t
294	چهار راهی 45 * 110 	201611045076	عدد	10	15	چهارراهی	طوسی	فاضلابی	قدیم	f	درجه 1	110	3.2	902	\N	t
295	کلاهک سه کاره 	201112590075	عدد	36	25	کلاهک	طوسی	فاضلابی	قدیم	f	درجه 1	\N	3.2	340	\N	t
296	سه راهی خم 87.5 * 110 	200511087074	عدد	25	15	سه راهی	طوسی	فاضلابی	قدیم	f	درجه 1	110	3.2	545	\N	t
297	سه راهی خم دریچه بازدید 87/5 * 110 	200511087073	عدد	20	15	سه راهی	طوسی	فاضلابی	قدیم	f	درجه 1	110	3.2	634	\N	t
298	رابط دریچه بازدید 110 	200611000072	عدد	56	15	رابط	طوسی	فاضلابی	قدیم	f	درجه 1	110	3.2	112	\N	t
299	سه راهی  90 * 63  سه سر کوپل 	201306390071	عدد	50	25	سه راهی	طوسی	فاضلابی	قدیم	f	درجه 1	63	3.0	210	\N	t
300	سه راهی 90 * 125 	200312590070	عدد	18	15	سه راهی	طوسی	فاضلابی	قدیم	f	درجه 1	125	3.2	708	\N	t
301	سه راهی 90 * 110  NEW 	200311090225	عدد	25	15	سه راهی	طوسی	فاضلابی	جدید	f	درجه 1	110	3.2	442	\N	t
302	سه راهی 90 * 110 	200311090069	عدد	25	15	سه راهی	طوسی	فاضلابی	قدیم	f	درجه 1	110	3.2	496	\N	t
303	سه راهی  90 * 90 	200309090068	عدد	45	15	سه راهی	طوسی	فاضلابی	قدیم	f	درجه 1	90	3.0	360	\N	t
304	سه راهی 90 * 75 درجه طوسی	200307590067	عدد	42	25	سه راهی	طوسی	فاضلابی	قدیم	f	درجه 1	75	3.0	291	\N	t
305	سه راهی 90 * 63 	200306390066	عدد	65	25	سه راهی	طوسی	فاضلابی	قدیم	f	درجه 1	63	3.0	201	\N	t
306	سه راهی تبدیل 90 * 90 * 110 طوسی	200411090065	عدد	36	15	سه راهی	طوسی	فاضلابی	قدیم	f	درجه 1	110	3.2	392	\N	t
307	سه راهی تبدیل 90 * 63 * 110 طوسی	200411090064	عدد	46	15	سه راهی	طوسی	فاضلابی	قدیم	f	درجه 1	110	3.2	365	\N	t
308	سه راهی تبدیل 90 * 63 * 90 طوسی	200409090063	عدد	64	15	سه راهی	طوسی	فاضلابی	قدیم	f	درجه 1	90	3.0	295	\N	t
309	سه راهی 45 * 110 سه سر کوپل 	201311045062	عدد	19	15	سه راهی	طوسی	فاضلابی	قدیم	f	درجه 1	110	3.2	708	\N	t
310	سه راهی  45 * 63 سه سر کوپل 	201306345061	عدد	46	25	سه راهی	طوسی	فاضلابی	قدیم	f	درجه 1	63	3.0	252	\N	t
311	سه راهی 45 * 160	200316045060	عدد	7	15	سه راهی	طوسی	فاضلابی	قدیم	f	درجه 1	160	4.0	1122	\N	t
312	سه راهی 45 * 125 	200312545059	عدد	16	15	سه راهی	طوسی	فاضلابی	قدیم	f	درجه 1	125	3.2	880	\N	t
313	سه راهی 45 * 110  NEW 	200311045224	عدد	20	15	سه راهی	طوسی	فاضلابی	جدید	f	درجه 1	110	3.2	660	\N	t
314	سه راهی 45 * 110 	200311045058	عدد	20	15	سه راهی	طوسی	فاضلابی	قدیم	f	درجه 1	110	3.2	678	\N	t
315	سه راهی 45 * 90 	200309045057	عدد	37	15	سه راهی	طوسی	فاضلابی	قدیم	f	درجه 1	90	3.0	440	\N	t
316	سه راهی  45 * 75 درجه طوسی	200307545056	عدد	38	25	سه راهی	طوسی	فاضلابی	قدیم	f	درجه 1	75	3.0	370	\N	t
317	سه راهی 45 * 63  NEW 	200306345223	عدد	60	25	سه راهی	طوسی	فاضلابی	جدید	f	درجه 1	63	3.0	200	\N	t
318	سه راهی 45 * 63 	200306345055	عدد	50	25	سه راهی	طوسی	فاضلابی	قدیم	f	درجه 1	63	3.0	245	\N	t
319	سه راهی تبدیل سه سر کوپل 45 * 63 * 110	201311045054	عدد	34	15	سه راهی	طوسی	فاضلابی	قدیم	f	درجه 1	110	3.2	480	\N	t
320	سه راهی تبدیل 45 * 125 * 160 	200416045053	عدد	9	15	سه راهی	طوسی	فاضلابی	قدیم	f	درجه 1	160	4.0	1180	\N	t
321	سه راهی تبدیل 45 * 110 * 160 	200416045052	عدد	10	15	سه راهی	طوسی	فاضلابی	قدیم	f	درجه 1	160	4.0	840	\N	t
322	سه راهی تبدیل 45 * 110 * 125 	200412545051	عدد	16	15	سه راهی	طوسی	فاضلابی	قدیم	f	درجه 1	125	3.2	775	\N	t
323	سه راهی تبدیل 45  * 90 * 110 	200411045050	عدد	25	15	سه راهی	طوسی	فاضلابی	قدیم	f	درجه 1	110	3.2	566	\N	t
324	سه راهی تبدیل 45 * 63 * 110 NEW 	200411045222	عدد	42	15	سه راهی	طوسی	فاضلابی	جدید	f	درجه 1	110	3.2	402	\N	t
325	سه راهی تبدیل 45 * 63 * 110 	200411045049	عدد	42	15	سه راهی	طوسی	فاضلابی	قدیم	f	درجه 1	110	3.2	463	\N	t
326	سه راهی تبدیل 45 * 63 * 90 	200409045048	عدد	55	15	سه راهی	طوسی	فاضلابی	قدیم	f	درجه 1	90	3.0	349	\N	t
327	درپوش (گپ) دو کاره کوپله و لوله 160 	200916000047	عدد	57	15	درپوش	طوسی	فاضلابی	قدیم	f	درجه 1	160	4.0	345	\N	t
328	درپوش (گپ) دو کاره کوپله و لوله 125 	200912500046	عدد	90	25	درپوش	طوسی	فاضلابی	قدیم	f	درجه 1	160	4.0	190	\N	t
329	درپوش (گپ) دو کاره کوپله و لوله 110 	200911000045	عدد	120	25	درپوش	طوسی	فاضلابی	قدیم	f	درجه 1	125	3.2	106	\N	t
330	درپوش (گپ) دو کاره کوپله و لوله 90 	200900900044	عدد	180	25	درپوش	طوسی	فاضلابی	قدیم	f	درجه 1	90	3.0	83	\N	t
331	درپوش (گپ) دو کاره کوپله و لوله 63 	200906300043	عدد	380	25	درپوش	طوسی	فاضلابی	قدیم	f	درجه 1	63	3.0	45	\N	t
332	سوکت بدون ترمز 90 	200709000041	عدد	60	25	سوکت	طوسی	فاضلابی	قدیم	f	درجه 1	90	3.0	155	\N	t
333	سوکت بدون ترمز 63 	200706300040	عدد	150	25	سوکت	طوسی	فاضلابی	قدیم	f	درجه 1	63	3.0	85	\N	t
334	سوکت ترمزدار 160 	200716000039	عدد	32	15	سوکت	طوسی	فاضلابی	قدیم	f	درجه 1	160	4.0	345	\N	t
335	سوکت ترمزدار 125 	200712500038	عدد	48	15	سوکت	طوسی	فاضلابی	قدیم	f	درجه 1	125	3.2	263	\N	t
336	سوکت ترمزدار 110 NEW 	200711000221	عدد	70	15	سوکت	طوسی	فاضلابی	جدید	f	درجه 1	110	3.2	200	\N	t
337	سوکت ترمزدار 110 	200711000037	عدد	70	15	سوکت	طوسی	فاضلابی	قدیم	f	درجه 1	110	3.2	236	\N	t
338	سوکت ترمزدار 90 	200709000036	عدد	60	25	سوکت	طوسی	فاضلابی	قدیم	f	درجه 1	90	3.0	158	\N	t
339	سوکت ترمزدار 75 	200707500035	عدد	120	25	سوکت	طوسی	فاضلابی	قدیم	f	درجه 1	75	3.0	78	\N	t
340	سوکت ترمزدار 63 NEW 	200706300220	عدد	150	25	سوکت	طوسی	فاضلابی	جدید	f	درجه 1	63	3.0	75	\N	t
341	سوکت ترمزدار 63 	200706300034	عدد	150	25	سوکت	طوسی	فاضلابی	قدیم	f	درجه 1	63	3.0	96	\N	t
342	تبدیل 125 * 160 طوسی	200816025033	عدد	40	15	تبدیل	طوسی	فاضلابی	قدیم	f	درجه 1	160	4.0	480	\N	t
343	تبدیل 110 * 160 طوسی	200816010032	عدد	40	15	تبدیل	طوسی	فاضلابی	قدیم	f	درجه 1	160	4.0	467	\N	t
344	تبدیل 110 * 125 طوسی	200812511031	عدد	60	15	تبدیل	طوسی	فاضلابی	قدیم	f	درجه 1	125	3.2	250	\N	t
345	تبدیل 90 * 110 طوسی	200811090030	عدد	60	25	تبدیل	طوسی	فاضلابی	قدیم	f	درجه 1	110	3.2	234	\N	t
346	تبدیل 63 * 110 طوسی	200811063029	عدد	60	25	تبدیل	طوسی	فاضلابی	قدیم	f	درجه 1	110	3.2	216	\N	t
347	تبدیل 63 * 90 طوسی	200809063028	عدد	96	25	تبدیل	طوسی	فاضلابی	قدیم	f	درجه 1	90	3.0	159	\N	t
348	رابط نر و ماده ( موفه ) 110 طوسی	201511000027	عدد	63	25	رابط	طوسی	فاضلابی	قدیم	f	درجه 1	110	3.2	198	\N	t
349	رابط نر و ماده ( موفه ) 90  طوسی	201509000026	عدد	90	25	رابط	طوسی	فاضلابی	قدیم	f	درجه 1	90	3.0	144	\N	t
350	رابط نر و ماده ( موفه ) 63 طوسی	201506300025	عدد	150	25	رابط	طوسی	فاضلابی	قدیم	f	درجه 1	63	3.0	92	\N	t
351	سیفون پایه دار 110 * 125 NEW طوسی	201712535219	عدد	27	15	سیفون	طوسی	فاضلابی	جدید	f	درجه 1	125	3.2	576	\N	t
352	سیفون پایه دار 110 * 125 طوسی	201712535024	عدد	23	15	سیفون	طوسی	فاضلابی	قدیم	f	درجه 1	125	3.2	658	\N	t
353	سیفون پایه دار 110 * 110 طوسی	201711035023	عدد	25	15	سیفون	طوسی	فاضلابی	قدیم	f	درجه 1	110	3.2	590	\N	t
354	سیفون  پایه دار 90 طوسی	201709035022	عدد	40	15	سیفون	طوسی	فاضلابی	قدیم	f	درجه 1	90	3.0	420	\N	t
355	سیفون  پایه دار 75 طوسی	201707535021	عدد	45	25	سیفون	طوسی	فاضلابی	قدیم	f	درجه 1	75	3.0	221	\N	t
356	سیفون  پایه دار 63 NEW طوسی	201706335218	عدد	75	25	سیفون	طوسی	فاضلابی	جدید	f	درجه 1	63	3.0	163	\N	t
357	سیفون  پایه دار 63 طوسی	201706335020	عدد	65	25	سیفون	طوسی	فاضلابی	قدیم	f	درجه 1	63	3.0	184	\N	t
358	زانو 90 * 90درجه دوسر کوپله طوسی	201209090019	عدد	30	25	زانو	طوسی	فاضلابی	قدیم	f	درجه 1	90	3.0	270	\N	t
359	زانو 90 * 63 درجه دوسر کوپله طوسی	201206390018	عدد	80	25	زانو	طوسی	فاضلابی	قدیم	f	درجه 1	63	3.0	150	\N	t
360	زانو خم 87.5 * 110 طوسی	201411087017	عدد	36	15	زانو	طوسی	فاضلابی	قدیم	f	درجه 1	110	3.2	398	\N	t
361	زانو خم 87.5 * 63 طوسی	201406387016	عدد	100	25	زانو	طوسی	فاضلابی	قدیم	f	درجه 1	63	3.0	140	\N	t
362	زانو 90 * 160 درجه  طوسی	200116090015	عدد	16	15	زانو	طوسی	فاضلابی	قدیم	f	درجه 1	160	4.0	620	\N	t
363	زانو 90 * 125 درجه  طوسی	200112590014	عدد	32	15	زانو	طوسی	فاضلابی	قدیم	f	درجه 1	125	3.2	479	\N	t
364	زانو 90 * 110 درجه NEW طوسی	200111090217	عدد	40	15	زانو	طوسی	فاضلابی	جدید	f	درجه 1	110	3.2	347	\N	t
365	زانو 90 * 110 درجه  طوسی	200111090013	عدد	40	15	زانو	طوسی	فاضلابی	قدیم	f	درجه 1	110	3.2	385	\N	t
366	زانو  90 * 90 درجه طوسی	200109090012	عدد	40	25	زانو	طوسی	فاضلابی	قدیم	f	درجه 1	90	3.0	274	\N	t
367	زانو 90 * 75 درجه طوسی	200107590011	عدد	70	25	زانو	طوسی	فاضلابی	قدیم	f	درجه 1	75	3.0	184	\N	t
368	زانو 90 * 63 درجه NEW طوسی	200106390216	عدد	110	25	زانو	طوسی	فاضلابی	جدید	f	درجه 1	63	3.0	125	\N	t
369	زانو 90 * 63 درجه طوسی	200106390010	عدد	110	25	زانو	طوسی	فاضلابی	قدیم	f	درجه 1	63	3.0	144	\N	t
370	زانو 45 * 110 درجه دو سر کوپله طوسی	201411045009	عدد	45	15	زانو	طوسی	فاضلابی	قدیم	f	درجه 1	110	3.2	330	\N	t
371	زانو 45 * 90 درجه دو سر کوپله طوسی	201409045008	عدد	36	25	زانو	طوسی	فاضلابی	قدیم	f	درجه 1	90	3.0	225	\N	t
372	زانو 45 * 63 درجه دو سر کوپله طوسی	201406345007	عدد	90	25	زانو	طوسی	فاضلابی	قدیم	f	درجه 1	63	3.0	155	\N	t
373	زانو  45 * 160 درجه طوسی	200116045006	عدد	18	15	زانو	طوسی	فاضلابی	قدیم	f	درجه 1	160	4.0	713	\N	t
374	زانو 45 * 125 درجه طوسی	200112545005	عدد	44	15	زانو	طوسی	فاضلابی	قدیم	f	درجه 1	125	3.2	391	\N	t
375	زانو 45 * 110 درجه NEW طوسی	200111045215	عدد	60	15	زانو	طوسی	فاضلابی	جدید	f	درجه 1	110	3.2	260	\N	t
376	زانو 45 * 110 درجه طوسی	200111045004	عدد	50	15	زانو	طوسی	فاضلابی	قدیم	f	درجه 1	110	3.2	350	\N	t
377	زانو 45 * 90 درجه NEW طوسی	200109045214	عدد	60	25	زانو	طوسی	فاضلابی	جدید	f	درجه 1	90	3.0	172	\N	t
378	زانو 45 * 90 درجه طوسی	200109045003	عدد	60	25	زانو	طوسی	فاضلابی	قدیم	f	درجه 1	90	3.0	201	\N	t
379	زانو 45 * 75 درجه طوسی	200107545002	عدد	102	25	زانو	طوسی	فاضلابی	قدیم	f	درجه 1	75	3.0	150	\N	t
380	زانو 45 * 63 درجه NEW طوسی	200106345213	عدد	175	25	زانو	طوسی	فاضلابی	جدید	f	درجه 1	63	3.0	100	\N	t
381	زانو 45 * 63 درجه طوسی	200106345001	عدد	120	25	زانو	طوسی	فاضلابی	قدیم	f	درجه 1	63	3.0	120	\N	t
382	سه راهی 45 * 40 دو سر کوپل سفید	210304045076	عدد	170	25	سه راهی	سفید	فاضلابی	قدیم	f	درجه 1	40	3.0	90	\N	t
383	سه راهی 45 * 40 سه سر کوپل سفید	211304045074	عدد	170	25	سه راهی	سفید	فاضلابی	قدیم	f	درجه 1	40	3.0	90	\N	t
384	سوکت ترمزدار 40 سفید	210700040065	عدد	500	25	سوکت	سفید	فاضلابی	قدیم	f	درجه 1	40	3.0	39	\N	t
385	سه راهی 45 * 50 درجه سه سر کوپل سفید	211305045055	عدد	100	25	سه راهی	سفید	فاضلابی	قدیم	f	درجه 1	50	3.0	160	\N	t
386	سه راهی 45 * 50 درجه سفید	210305045053	عدد	\N	25	سه راهی	سفید	فاضلابی	قدیم	f	درجه 1	50	3.0	150	\N	f
387	سیفون پایه دار 90 درجه NEW سفید	211700090051	عدد	40	15	سیفون	سفید	فاضلابی	جدید	f	درجه 1	90	3.0	354	\N	t
389	سه راهی دو سر کوپل 90 * 50 درجه سفید	210305090048	عدد	150	25	سه راهی	سفید	فاضلابی	قدیم	f	درجه 1	50	3.0	930	\N	f
390	سوکت 50 ترمزدار سفید	210700050046	عدد	270	25	سوکت	سفید	فاضلابی	قدیم	f	درجه 1	50	3.0	66	\N	t
391	سه راهی سه سر کوپل 90 * 50 درجه سفید	211305090044	عدد	130	25	سه راهی	سفید	فاضلابی	\N	f	درجه 1	50	3.0	95	\N	t
392	زانو 45 * 50 دو سر کوپل سفید	211205045038	عدد	230	25	زانو	سفید	فاضلابی	قدیم	f	درجه 1	50	3.0	56	\N	t
393	FOUR Ways **	210600004037	number	4	25	چهارراهی	سفید	برقی	قدیم	t	درجه 1	25	4.7	1530	\N	t
394	سه راهی 90 * 63 درجه NEW سفید	210306390036	عدد	65	25	سه راهی	سفید	فاضلابی	جدید	f	درجه 1	63	3.0	165	\N	t
395	زانو 90 * 40 دو سر کوپل سفید	211204090034	عدد	350	25	زانو	سفید	فاضلابی	قدیم	f	درجه 1	40	3.0	55	\N	t
396	سه راهی 90 * 40 درجه سه سر کوپل سفید	211304090032	عدد	200	25	سه راهی	سفید	فاضلابی	قدیم	f	درجه 1	40	3.0	70	\N	t
397	سه راهی 90 * 40 درجه سفید	210304090030	عدد	230	25	سه راهی	سفید	فاضلابی	قدیم	f	درجه 1	40	3.0	68	\N	t
398	زانو 45* 50 درجه سفید	210105045028	عدد	250	25	زانو	سفید	فاضلابی	قدیم	f	درجه 1	50	3.0	56	\N	f
399	زانو 90 * 40 درجه سفید	210104090026	عدد	400	25	زانو	سفید	فاضلابی	قدیم	f	درجه 1	40	3.0	53	\N	t
400	FOUR Ways =	210600004024	number	240	25	چهارراهی	سفید	برقی	قدیم	t	درجه 1	25	1.5	58	\N	t
401	FOUR Ways +	210600004023	number	176	25	چهارراهی	سفید	برقی	قدیم	t	درجه 1	25	1.5	58	\N	t
403	SOCKET 25	210300025021	number	1200	25	سوکت	سفید	برقی	قدیم	t	درجه 1	25	1.5	11	\N	t
404	زانو 90 * 50 درجه دو سر کوپل سفید	211205045020	عدد	200	25	زانو	سفید	فاضلابی	قدیم	f	درجه 1	50	3.0	69	\N	t
405	زانو 90 * 50 درجه سفید	210105045018	عدد	200	25	زانو	سفید	فاضلابی	قدیم	f	درجه 1	50	3.0	67	\N	f
406	زانو 45 * 40 درجه  NEW دو سر کوپل سفید	211204045016	عدد	400	25	زانو	سفید	فاضلابی	جدید	f	درجه 1	40	3.0	43	\N	t
407	زانو 45 * 40 درجه NEW سفید	210104045014	عدد	400	25	زانو	سفید	فاضلابی	جدید	f	درجه 1	40	3.0	41	\N	t
408	tee 110 * 45	210311045012	number	20	15	سه راهی	سفید	فاضلابی	قدیم	t	درجه 1	110	3.2	825	\N	t
409	Knee 110 * 90	210111090011	number	40	15	زانو	سفید	فاضلابی	قدیم	t	درجه 1	110	3.2	493	\N	t
410	tee 110 * 90	210411090010	number	17	15	سه راهی	سفید	فاضلابی	قدیم	t	درجه 1	110	3.2	598	\N	t
411	 SiPhon 110 alseef	210200110009	number	20	15	سیفون	سفید	فاضلابی	قدیم	t	درجه 1	110	3.2	560	\N	t
414	Knee 110 * 45	210111045008	number	56	15	زانو	سفید	فاضلابی	قدیم	t	درجه 1	110	3.2	384	\N	t
415	tee 75*90	210407590006	number	42	25	سه راهی	سفید	فاضلابی	قدیم	t	درجه 1	75	3.0	290	\N	t
416	tee 75*45	210407545005	number	34	25	سه راهی	سفید	فاضلابی	قدیم	t	درجه 1	75	3.0	365	\N	t
417	Socket 75	210300075004	number	110	25	سوکت	سفید	فاضلابی	قدیم	t	درجه 1	75	3.0	127	\N	t
418	Siphon 75	210200075003	number	36	25	سوکت	سفید	فاضلابی	قدیم	t	درجه 1	75	3.0	430	\N	t
419	Knee 75 * 45	210107545002	number	80	25	زانو	سفید	فاضلابی	قدیم	t	درجه 1	75	3.0	165	\N	t
420	Knee 75* 90	210107590001	number	60	25	زانو	سفید	فاضلابی	قدیم	t	درجه 1	90	3.0	206	\N	t
421	زانو 90*90 NEW سفید	210109090228	عدد	40	25	زانو	سفید	فاضلابی	جدید	f	درجه 1	32	3.0	224	\N	t
422	سوکت برقی سفید 32 ترمز دار	210703200175	عدد	900	25	سوکت	سفید	برقی	قدیم	f	درجه 1	32	3.0	10	\N	t
423	سوکت برقی سفید 25 ترمز دار	210702500174	عدد	1500	25	سوکت	سفید	برقی	قدیم	f	درجه 1	25	1.5	10	\N	t
424	سوکت برقی سفید 20 ترمز دار	210702000173	عدد	2500	25	سوکت	سفید	برقی	قدیم	f	درجه 1	20	1.5	8	\N	t
425	زانو 90*75 دوسر کوبل سفید	210107590172	عدد	55	25	زانو	سفید	فاضلابی	قدیم	f	درجه 1	75	3.0	190	\N	t
426	سوکت 110 بدون ترمز NEW سفید	210711000226	عدد	70	15	سوکت	سفید	فاضلابی	جدید	f	درجه 1	110	3.2	195	\N	t
428	سه راهی دریچه بازدید 90 * 110 سفید	210511090168	عدد	25	15	سه راهی	سفید	فاضلابی	قدیم	f	درجه 1	110	3.2	355	\N	t
429	کلاهک سه کاره 125.110.90سفید	211112590166	عدد	36	25	کلاهک	سفید	فاضلابی	قدیم	f	درجه 1	125	3.2	340	\N	t
430	سه راهی خم 87.5 * 110 سفید	210511087165	عدد	20	15	سه راهی	سفید	فاضلابی	قدیم	f	درجه 1	110	3.2	545	\N	t
431	سه راهی خم دریچه بازدید 87/5 * 110 سفید	210511087164	عدد	25	15	سه راهی	سفید	فاضلابی	قدیم	f	درجه 1	110	3.2	634	\N	t
432	سه راهی  90 * 63 درجه 3 سر کوپل سفید	211306390163	عدد	50	25	سه راهی	سفید	فاضلابی	قدیم	f	درجه 1	63	3.0	205	\N	t
433	سه راهی 90 * 125 درجه  سفید	210312590162	عدد	18	15	سه راهی	سفید	فاضلابی	قدیم	f	درجه 1	125	3.2	708	\N	t
434	سه راهی 90 * 110 درجه NEW سفید	210311090212	عدد	25	15	سه راهی	سفید	فاضلابی	جدید	f	درجه 1	110	3.2	442	\N	t
435	سه راهی  90 * 90 درجه سفید	210309090160	عدد	45	15	سه راهی	سفید	فاضلابی	قدیم	f	درجه 1	90	3.0	346	\N	t
436	سه راهی 90 * 63 درجه سفید	210306390158	عدد	65	25	سه راهی	سفید	فاضلابی	قدیم	f	درجه 1	63	3.0	201	\N	t
427	زانو 90 * 63 درجه NEW سفید	210106390204	عدد	110	25	زانو	سفید	فاضلابی	جدید	f	درجه 1	63	3	125	\N	t
437	سه راهی تبدیل 90 * 63 * 110 سفید	210411063156	عدد	46	15	سه راهی	سفید	فاضلابی	قدیم	f	درجه 1	110	3.2	365	\N	t
438	سه راهی تبدیل 90 * 63 * 90 سفید	210409090155	عدد	65	15	سه راهی	سفید	فاضلابی	قدیم	f	درجه 1	90	3.0	295	\N	t
439	سه راهی 45 * 110 درجه سه سر کوپل سفید	211311045154	عدد	19	15	سه راهی	سفید	فاضلابی	قدیم	f	درجه 1	110	3.2	708	\N	t
440	سه راهی  45 * 63درجه سه سر کوپل سفید	211306345153	عدد	46	25	سه راهی	سفید	فاضلابی	قدیم	f	درجه 1	63	3.0	252	\N	t
441	سه راهی 45 * 125 درجه سفید	210312545151	عدد	16	15	سه راهی	سفید	فاضلابی	قدیم	f	درجه 1	125	3.2	880	\N	t
442	سه راهی 45 * 110 درجه NEW سفید	210311045211	عدد	20	15	سه راهی	سفید	فاضلابی	جدید	f	درجه 1	110	3.2	666	\N	t
443	سه راهی 45 * 110 درجه سفید	210311045150	عدد	20	15	سه راهی	سفید	فاضلابی	قدیم	f	درجه 1	110	3.2	682	\N	t
444	سه راهی 45 * 90 درجه سفید	210309045149	عدد	27	15	سه راهی	سفید	فاضلابی	قدیم	f	درجه 1	90	3.0	440	\N	t
445	سه راهی 45 * 63 درجه NEW سفید	210306345210	عدد	60	25	سه راهی	سفید	فاضلابی	جدید	f	درجه 1	63	3.0	200	\N	t
446	سه راهی 45 * 63 درجه سفید	210306345147	عدد	50	25	سه راهی	سفید	فاضلابی	قدیم	f	درجه 1	63	3.0	245	\N	t
447	سه راهی تبدیل 45 درجه سه سر کوپل 45 * 63 * 110 سفید	211311045146	عدد	34	15	سه راهی	سفید	فاضلابی	قدیم	f	درجه 1	110	3.2	473	\N	t
448	سه راهی تبدیل 45 * 110 * 125 سفید	210412545143	عدد	16	15	سه راهی	سفید	فاضلابی	قدیم	f	درجه 1	125	3.2	775	\N	t
449	سه راهی تبدیل 45  * 90 * 110 سفید	210411045142	عدد	25	25	سه راهی	سفید	فاضلابی	قدیم	f	درجه 1	110	3.2	560	\N	t
450	سه راهی تبدیل 45 * 63 * 110 NEW سفید	210411045209	عدد	42	15	سه راهی	سفید	فاضلابی	جدید	f	درجه 1	110	3.2	405	\N	t
451	سه راهی تبدیل 45 * 63 * 110 سفید	210411045141	عدد	42	15	سه راهی	سفید	فاضلابی	قدیم	f	درجه 1	110	3.2	463	\N	t
452	سه راهی تبدیل 45 * 63 * 90 سفید	210409045140	عدد	55	15	سه راهی	سفید	فاضلابی	قدیم	f	درجه 1	90	3.0	349	\N	t
453	درپوش (گپ) دو کاره کوپله و لوله 125 سفید	210912500138	عدد	90	25	درپوش	سفید	فاضلابی	قدیم	f	درجه 1	125	3.2	183	\N	t
454	درپوش (گپ) دو کاره کوپله و لوله 110 سفید	210911000137	عدد	150	25	درپوش	سفید	فاضلابی	قدیم	f	درجه 1	110	3.2	106	\N	t
455	درپوش (گپ) دو کاره کوپله و لوله 90 سفید	210909000136	عدد	180	25	درپوش	سفید	فاضلابی	قدیم	f	درجه 1	90	3.0	83	\N	t
456	درپوش (گپ) دو کاره کوپله و لوله 63 سفید	210906300135	عدد	300	25	درپوش	سفید	فاضلابی	قدیم	f	درجه 1	63	3.0	45	\N	t
457	سوکت بدون ترمز 90 سفید	210709000133	عدد	60	25	سوکت	سفید	فاضلابی	قدیم	f	درجه 1	90	3.0	155	\N	t
458	سوکت بدون ترمز 63 سفید	210706300132	عدد	150	25	سوکت	سفید	فاضلابی	قدیم	f	درجه 1	63	3.0	75	\N	t
459	سوکت ترمزدار 125 سفید	210712500130	عدد	48	15	سوکت	سفید	فاضلابی	قدیم	f	درجه 1	125	3.2	271	\N	t
460	سوکت ترمزدار 110 NEW سفید	210711000208	عدد	70	15	سوکت	سفید	فاضلابی	جدید	f	درجه 1	110	3.2	200	\N	t
461	سوکت ترمزدار 110 سفید	210711000129	عدد	70	15	سوکت	سفید	فاضلابی	قدیم	f	درجه 1	110	3.2	240	\N	t
462	سوکت ترمزدار 90 سفید	210709000128	عدد	60	25	سوکت	سفید	فاضلابی	قدیم	f	درجه 1	90	3.0	158	\N	t
463	سوکت ترمزدار 63 NEW سفید	210706300207	عدد	150	25	سوکت	سفید	فاضلابی	جدید	f	درجه 1	63	3.0	75	\N	t
464	تبدیل 110 * 125 سفید	210812510123	عدد	60	15	تبدیل	سفید	فاضلابی	قدیم	f	درجه 1	125	3.2	250	\N	t
465	تبدیل 90 * 110 سفید	210811090122	عدد	60	25	تبدیل	سفید	فاضلابی	قدیم	f	درجه 1	110	3.2	234	\N	t
466	تبدیل 63 * 110 سفید	210811063121	عدد	60	25	تبدیل	سفید	فاضلابی	قدیم	f	درجه 1	110	3.2	202	\N	t
467	تبدیل 63 * 90 سفید	210809063120	عدد	96	25	تبدیل	سفید	فاضلابی	قدیم	f	درجه 1	90	3.0	159	\N	t
468	رابط نر و ماده ( موفه ) 110 سفید	211511000119	عدد	63	25	رابط	سفید	فاضلابی	قدیم	f	درجه 1	110	3.2	198	\N	t
469	رابط نر و ماده ( موفه ) 63 سفید	211506300117	عدد	150	25	رابط	سفید	فاضلابی	قدیم	f	درجه 1	63	3.0	89	\N	t
470	سیفون پایه دار 110 * 125 NEWسفید	211712510206	عدد	27	15	سیفون	سفید	فاضلابی	جدید	f	درجه 1	125	3.2	576	\N	t
471	سیفون پایه دار 110 * 110 سفید	211711035115	عدد	25	15	سیفون	سفید	فاضلابی	قدیم	f	درجه 1	110	3.2	577	\N	t
472	سیفون  پایه دار 90 سفید	211709035114	عدد	40	15	سیفون	سفید	فاضلابی	قدیم	f	درجه 1	90	3.0	420	\N	t
473	سیفون  پایه دار 63 NEW سفید	2118063135	عدد	75	25	سیفون	سفید	فاضلابی	جدید	f	درجه 1	63	3.0	165	\N	t
474	زانو 90 * 63 درجه دوسر کوپله سفید	211206390181	عدد	80	25	زانو	سفید	فاضلابی	قدیم	f	درجه 1	63	3.0	144	\N	t
475	زانو خم 87.5 * 110 سفید	211411087180	عدد	36	15	زانو	سفید	فاضلابی	قدیم	f	درجه 1	110	3.2	398	\N	t
476	زانو 90 * 160 درجه سفید	210116090111	عدد	16	15	زانو	سفید	فاضلابی	قدیم	f	درجه 1	160	4.0	620	\N	t
477	زانو 90 * 125 درجه سفید	210112590110	عدد	32	15	زانو	سفید	فاضلابی	قدیم	f	درجه 1	125	3.2	479	\N	t
478	زانو 90 * 110 درجه NEW سفید	210111090205	عدد	40	15	زانو	سفید	فاضلابی	جدید	f	درجه 1	110	3.2	347	\N	t
479	زانو 90 * 75 درجه سفید	210107590107	عدد	70	25	زانو	سفید	فاضلابی	قدیم	f	درجه 1	75	3.0	184	\N	t
481	زانو 90 * 63 درجه سفید	210106390106	عدد	110	25	زانو	سفید	فاضلابی	قدیم	f	درجه 1	63	3.0	144	\N	t
482	زانو 45 * 110 درجه دو سر کوپله سفید	211211045178	عدد	45	15	زانو	سفید	فاضلابی	قدیم	f	درجه 1	110	3.2	330	\N	t
483	زانو 45 * 90 درجه دو سر کوپله سفید	211209045177	عدد	36	25	زانو	سفید	فاضلابی	قدیم	f	درجه 1	90	3.0	220	\N	t
484	زانو 45 * 63 درجه دو سر کوپله سفید	211206345176	عدد	90	25	زانو	سفید	فاضلابی	قدیم	f	درجه 1	63	3.0	120	\N	t
485	زانو  45 * 160 درجه سفید	210116045105	عدد	18	15	زانو	سفید	فاضلابی	قدیم	f	درجه 1	160	4.0	713	\N	t
486	زانو 45 * 125 درجه سفید	210112545104	عدد	44	15	زانو	سفید	فاضلابی	قدیم	f	درجه 1	125	3.2	391	\N	t
487	زانو 45 * 110 درجه NEW سفید	210111045203	عدد	60	15	زانو	سفید	فاضلابی	جدید	f	درجه 1	110	3.2	350	\N	t
488	زانو 45 * 90 درجه NEW سفید	210109045201	عدد	60	25	زانو	سفید	فاضلابی	جدید	f	درجه 1	90	3.0	173	\N	t
489	زانو 45 * 63 درجه NEW سفید	210106345200	عدد	175	25	زانو	سفید	فاضلابی	جدید	f	درجه 1	63	3.0	100	\N	t
490	cap 110	210500110040	عدد	120	25	درپوش	سفید	فاضلابی	قدیم	t	درجه 1	110	\N	135	\N	t
491	cap  25	210500025022	عدد	2400	25	درپوش	سفید	برقی	قدیم	t	درجه 1	25	1.5	5	\N	t
494	Knee 50 * 90	210105090058	number	200	25	زانو	سفید	فاضلابی	قدیم	t	درجه 1	50	3.0	68	\N	t
495	Knee 50 * 45	210105045057	number	230	25	زانو	سفید	فاضلابی	قدیم	t	درجه 1	50	3.0	56	\N	t
498	REDUCER 110 * 75	210811075061	number	90	25	تبدیل	سفید	فاضلابی	قدیم	t	درجه 1	110	4.7	202	\N	t
499	Reducing Tee 110 * 75 * 90	210411075063	number	37	25	تبدیل	سفید	فاضلابی	قدیم	t	درجه 1	110	4.7	439	\N	t
500	Reducing Tee 110 * 75 * 45	210411075062	number	32	25	تبدیل	سفید	فاضلابی	قدیم	t	درجه 1	110	4.7	535	\N	t
502	SOCKET 50	210300050056	number	270	25	سوکت	سفید	فاضلابی	قدیم	t	درجه 1	50	3.8	66	\N	t
505	Socket 110	210300110007	number	75	15	سوکت	سفید	فاضلابی	قدیم	t	درجه 1	75	4.7	275	\N	t
506	Tee 50 * 90	210405090073	number	130	25	سه راهی	سفید	فاضلابی	قدیم	t	درجه 1	50	3.0	102	\N	t
507	tee 50 * 45	210405045059	number	100	25	سه راهی	سفید	فاضلابی	قدیم	t	درجه 1	110	3.0	123	\N	t
510	سه راهی سه سرکوپل 90*32 طوسی	201303290079	عدد	180	\N	سه راهی	طوسی	فاضلابی_برقی	جدید	f	درجه 1	32	3.0	58	\N	t
511	سه راهی سه سر کوپل 45*32 طوسی	201303245081	عدد	140	\N	سه راهی	طوسی	فاضلابی_برقی	جدید	f	درجه 1	32	3.0	69	\N	t
512	سه راهی سه سرکوپل 90*32 سفید	211303290080	عدد	180	\N	سه راهی	سفید	فاضلابی_برقی	جدید	f	درجه 1	32	3.0	58	\N	t
513	سه راهی سه سر کوپل 45*32 سفید	211303245082	عدد	140	\N	سه راهی	سفید	فاضلابی_برقی	جدید	f	درجه 1	32	3.0	69	\N	t
515	سوکت تعمیری 63 همراه با بست	200700063084	عدد	140	25	سوکت	طوسی	فاضلابی	قدیم	f	درجه 1	63	3.0	138	\N	t
388	SOCKET 25  THREA DED /012	110300012049	number	1400	25	سوکت	سفید	برقی	\N	t	درجه 1	25	1.5	12	\N	t
516	زانو 45 * 63 NEW دو سر کوپل سفید	211206345085	عدد	100	25	زانو	سفید	فاضلابی	جدید	f	درجه یک	63	3	0.12		f
519	درب دریچه بازدید 110	211000000000	عدد	0	0	درب	طوسی	فاضلابی	قدیم	f	درجه یک	110	3.2			t
\.


--
-- Data for Name: machines; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.machines (id, machine, category) FROM stdin;
2	Line2cm65	لوله
3	Line3cm65	لوله
4	Line4cm65	لوله
5	Line5cm55	لوله
8	Line8cm65/55	لوله
9	Artak 220	اتصالات
10	Parsian 220	اتصالات
11	NBM 268	اتصالات
12	Artak 280	اتصالات
13	NBM 260	اتصالات
14	Parsian 320	اتصالات
15	Artak 320	اتصالات
16	Bi 320	اتصالات
17	Bi 200	اتصالات
18	BS 260-1	اتصالات
19	BS 260-2	اتصالات
20	NBM 368	اتصالات
21	SE 330	اتصالات
22	NBM 308	اتصالات
23	NBM 168	اتصالات
6	Line6cm55	لوله
7	Line7cm55	لوله
1	Line1cm85	لوله
\.


--
-- Data for Name: materials; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.materials (id, material) FROM stdin;
523	استاندارد
524	لوله برقی درجه 2/5
525	لوله برقی عراقی درجه یک
526	لوله برقی عراقی درجه دو
527	خط زن
1	درجه یک فاضلابی داخلی
2	درجه یک فاضلابی عراقی 
3	درجه دو فاضلابی عراقی
4	آبرسانی
5	هواکشی
6	استخری
7	لوله برقی درجه یک
8	لوله برقی درجه دو
9	لوله برقی درجه سه
10	دو لایه درجه یک
11	دولایه درجه دو
12	سه لایه درجه یک
13	سه لایه درجه دو عراقی
14	اتصالات فاضلابی داخلی
15	اتصالات برقی داخلی
16	\N
521	لوله برقی درجه یک عراق
522	لوله برقی درجه دو عراق
\.


--
-- Data for Name: mixentries; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mixentries (id, operator_id, shift, line_id, product_id, description, recipe_code, date, category, amount, stop_id, stop_time, "time", mainstat) FROM stdin;
1265	39	1	12	200311045058		1	1404/01/16	اتصالات	12	1	0	13	t
1266	39	1	15	200111045004		1	1404/01/16	اتصالات	5	1	0	13	t
1268	36	1	4	106416021135		3	1404/01/17	لوله	16	11	240	13	t
1269	42	3	15	200711000227		1	1404/01/16	اتصالات	14	1	0	13	t
1267	36	1	4	106416021135		3	1404/01/16	لوله	14	13	210	13	t
1351	36	1	6	104102015006	not ok	7	1403/12/02	لوله	1	1	0	13	f
1272	45	2	4	106416021135		3	1404/01/17	لوله	18	1	0	13	t
1273	40	3	4	106416021135		3	1404/01/17	لوله	11	1	0	13	t
1275	45	2	4	106416021135		3	1404/01/18	لوله	8	1	0	13	t
1276	40	3	4	106416021135		3	1404/01/18	لوله	5	1	0	13	t
1277	36	1	4	106416021135		3	1404/01/19	لوله	15	14	1	13	t
1278	42	3	12	200311045058		1	1404/01/16	اتصالات	14	1	0	13	t
1281	39	1	20	200316045060		1	1404/01/17	اتصالات	13	1	0	13	t
1282	42	3	22	210111045203		1	1404/01/20	اتصالات	15	1	0	13	t
1284	39	1	20	200716000039		1	1404/01/20	اتصالات	17	1	0	13	t
1286	39	1	12	200311045058		1	1404/01/21	اتصالات	14	1	0	13	t
1287	42	3	15	200311045058		1	1404/01/21	اتصالات	16	1	0	13	t
1288	39	1	22	210111045203		1	1404/01/17	اتصالات	13	1	0	13	t
1290	39	1	17	211303290080		1	1404/01/17	اتصالات	3	1	0	13	t
1291	42	3	15	200111045004		1	1404/01/17	اتصالات	14	1	0	13	t
1293	42	3	12	200311045058		1	1404/01/17	اتصالات	13	1	0	13	t
1306	42	1	13	200106390010		1	1404/01/26	اتصالات	16	1	0	13	t
1274	36	1	4	106416021135		3	1404/01/18	لوله	24	14	60	13	t
1280	42	3	22	200111045215		1	1404/01/16	اتصالات	4	1	0	13	t
1298	40	1	4	106416021135		3	1404/02/08	لوله	10	1	0	13	t
1307	36	1	5	104120153001		9	1404/01/23	لوله	13	1	0	13	t
1296	36	1	5	104120153001		9	1404/01/24	لوله	14	1	0	13	t
1297	42	1	19	200511090077		1	1404/01/23	اتصالات	6	1	0	13	t
1299	39	3	12	200311045058		1	1404/01/23	اتصالات	8	1	0	13	t
1300	39	3	16	200711000227		1	1404/01/23	اتصالات	12	1	0	13	t
1301	42	1	16	200711000227		1	1404/01/24	اتصالات	17	1	0	13	t
1302	39	3	18	200311090069		1	1404/01/24	اتصالات	13	1	0	13	t
1303	39	3	15	200311045224		1	1404/01/24	اتصالات	14	1	0	13	t
1305	39	3	20	200116090015		1	1404/01/25	اتصالات	14	1	0	13	t
1309	36	1	7	104120153001		9	1404/01/23	لوله	4	1	0	13	t
1310	42	1	16	200711000227		1	1404/01/26	اتصالات	10	1	0	13	t
1314	39	3	20	200116090015		1	1404/01/26	اتصالات	4	1	0	13	t
1315	39	1	18	200311090069		1	1404/01/18	اتصالات	14	1	0	13	t
1317	39	1	12	200311045058		1	1404/01/18	اتصالات	14	1	0	13	t
1320	42	3	13	200306390066		1	1404/01/18	اتصالات	16	1	0	13	t
1321	42	1	10	210702000173		15	1404/01/27	اتصالات	1	1	0	13	t
1324	39	3	10	210702000173		15	1404/01/27	اتصالات	3	1	0	13	t
1325	42	3	20	200111045215		1	1404/01/19	اتصالات	15	1	0	13	t
1327	39	3	21	201206345068		1	1404/01/28	اتصالات	10	1	0	13	t
1328	42	3	12	200311045058		1	1404/01/19	اتصالات	15	1	0	13	t
1304	42	1	15	200311045058		1	1404/01/25	اتصالات	1	1	0	13	t
1326	39	3	11	200706300034		1	1404/01/27	اتصالات	14	1	0	13	t
1322	39	1	22	200111045215		1	1404/01/19	اتصالات	13	1	0	13	t
1319	42	3	15	200111045004		1	1404/01/18	اتصالات	14	1	0	13	t
1279	42	3	20	210600004037		2	1404/01/20	اتصالات	15	1	0	13	t
1316	39	3	16	210300110007		2	1404/01/26	اتصالات	15	1	0	13	t
1318	42	1	22	210411090010		2	1404/01/27	اتصالات	16	1	0	13	t
1283	36	1	6	114102515241		524	1404/01/19	لوله	4	1	0	13	t
1295	36	1	7	104120153001		9	1404/01/24	لوله	14	1	0	13	t
1285	36	1	4	106416021135		3	1404/01/21	لوله	22	15	90	13	t
1334	36	1	5	104120153001		9	1404/01/25	لوله	14	1	0	13	t
1308	36	1	7	104120153001		9	1404/01/23	لوله	6	1	0	0	t
1340	36	1	7	104102015006	ok	9	1403/11/27	لوله	1	1	0	13	f
1345	36	1	7	104102015006	not ok	7	1403/11/29	لوله	1	1	0	13	f
1349	36	1	5	104120153001	not ok	9	1403/11/30	لوله	1	1	0	13	f
1353	36	1	6	104102015006	not ok	7	1403/12/02	لوله	1	1	0	0	t
1354	36	1	6	114102515046	ok	7	1403/12/03	لوله	1	1	0	0	f
1356	40	1	2	103111027005	ok	4	1404/01/31	لوله	2	1	0	17	f
1357	44	1	7	104102015004	not ok	8	1404/01/16	لوله	1	1	0	17	f
1358	44	1	3	101109030006	ok	1	1404/01/17	لوله	1	1	0	17	f
1366	42	1	13	201206390018		1	1404/01/28	اتصالات	1	1	0	13	t
1335	36	1	7	104120153001		9	1404/01/25	لوله	14	1	0	13	t
1361	45	1	2	101109030006	not ok	523	1404/01/25	لوله	1	1	0	17	f
1338	36	1	7	104120153001		9	1404/01/27	لوله	12	1	0	13	t
1263	39	1	13	200306390066		1	1404/01/16	اتصالات	10	1	0	13	t
1348	36	1	5	104120153001	not ok	9	1403/11/30	لوله	1	1	0	0	f
1341	36	1	6	114103215045	ok	7	1403/11/27	لوله	1	1	0	13	f
1343	36	1	5	104102015004	not ok	8	1403/11/28	لوله	1	1	0	13	f
1344	36	1	5	104102015004	ok	8	1403/11/28	لوله	2	1	0	13	f
1346	36	1	7	104102015006	not ok	7	1403/11/29	لوله	1	1	0	13	f
1347	36	1	7	104102015006	ok	7	1403/11/29	لوله	1	1	0	13	f
1350	36	1	6	104120153001	not ok	9	1403/12/02	لوله	1	1	0	13	f
1352	36	1	6	104102015006	not ok	7	1403/12/02	لوله	1	1	0	13	f
1359	44	1	3	116211010060	not ok	3	1404/01/18	لوله	3	1	0	0	f
1360	45	1	2	101111032007		1	1404/01/25	لوله	1	1	0	17	f
1362	44	2	3	101109030006	not ok	523	1404/01/30	لوله	3	1	0	17	f
1364	44	2	3	101109030006	ok	523	1404/01/30	لوله	4	1	0	17	f
1365	44	2	2	101111032007		1	1404/01/30	لوله	6	1	0	17	t
1367	39	3	18	201706335218		1	1404/01/28	اتصالات	14	1	0	13	t
1339	36	1	7	104120153001		9	1404/01/27	لوله	12	1	0	13	t
1336	36	1	7	104120153001		9	1404/01/26	لوله	12	1	0	13	t
1337	36	1	5	104120153001		9	1404/01/26	لوله	12	1	0	13	t
1342	36	1	5	104102015004	not ok	8	1403/11/28	لوله	1	1	0	13	f
1355	40	1	2	103111027005	not ok	4	1404/01/31	لوله	1	1	0	17	f
1363	44	2	3	101109030006	not ok	523	1404/01/30	لوله	3	1	0	17	f
1368	39	1	21	201206345068		1	1404/01/30	اتصالات	7	1	0	13	t
1369	44	2	4	118311011198		3	1404/01/30	لوله	4	1	0	17	t
1370	45	3	2	101111032007		1	1404/01/31	لوله	5	1	0	17	t
1371	45	3	3	101109030006		1	1404/01/31	لوله	4	1	0	17	t
1372	39	1	14	200111090013		1	1404/01/30	اتصالات	2	1	0	13	f
1373	42	3	18	201706335218		1	1404/01/30	اتصالات	3	1	0	13	t
1374	42	3	11	200706300034		1	1404/01/30	اتصالات	15	1	0	13	t
1375	39	1	14	200111090013		1	1404/01/31	اتصالات	14	1	0	13	t
1376	39	1	14	200111090013		1	1404/01/31	اتصالات	10	1	0	13	t
1377	39	1	15	200311045058		1	1404/01/31	اتصالات	2	1	0	13	f
1378	42	3	15	200311045058		1	1404/01/31	اتصالات	7	1	0	13	t
1379	45	3	4	117516017144		3	1404/01/31	لوله	5	1	0	17	t
1380	44	2	4	106416021135		3	1404/02/03	لوله	3	1	0	17	t
1381	36	1	7	104120153001		9	1404/01/28	لوله	12	1	0	13	t
1382	36	1	7	104120153001		9	1404/01/30	لوله	12	1	0	13	t
1383	36	1	7	104120153001		9	1404/01/30	لوله	12	1	0	13	t
1384	36	1	7	104120153001		9	1404/01/31	لوله	12	1	0	13	t
1385	42	3	13	201206390018		1	1404/01/31	اتصالات	7	1	0	13	t
1393	36	1	4	106416021135	ok	3	1404/01/16	لوله	2	1	0	13	f
1395	45	2	4	106416021135		3	1404/01/16	لوله	10	1	0	13	t
1396	36	1	5	104120153001	ok	9	1404/01/23	لوله	2	1	0	13	f
1397	36	1	7	104120153001	not ok	9	1404/01/23	لوله	2	1	0	13	f
1398	36	1	7	104120153001	not ok	9	1404/01/23	لوله	2	1	0	13	f
1400	36	1	7	104102015004	ok	8	1404/02/06	لوله	2	1	0	13	f
1401	36	1	7	104102015004	کمک فرایند PA120 - جواب داده	8	1404/02/07	لوله	2	1	0	13	f
1402	36	1	7	104102015004	ok	8	1404/02/08	لوله	2	1	0	13	f
1403	39	1	15	200311045058		1	1404/02/01	اتصالات	14	1	0	13	t
1404	36	1	6	104120153001	ok	9	1404/02/08	لوله	2	1	0	13	f
1405	39	1	19	201706335218		1	1404/02/02	اتصالات	14	1	0	13	t
1406	36	1	7	104102015006	ok	7	1404/02/09	لوله	2	1	0	13	f
1407	36	1	5	104120153001	ok	9	1404/02/13	لوله	2	1	0	13	f
1408	42	3	13	200706300034		1	1404/02/02	اتصالات	15	1	0	13	t
1413	40	1	4	117516017144		3	1404/01/31	لوله	7	1	0	17	t
1414	40	1	2	101111032007		1	1404/01/31	لوله	3	1	0	17	t
1412	40	1	3	116307506056		3	1404/01/31	لوله	6	1	0	17	t
1415	44	2	2	101111032007		1	1404/01/31	لوله	6	1	0	17	t
1416	45	3	2	101111032007		1	1404/02/01	لوله	7	1	0	17	t
1417	40	1	6	101104030002		1	1404/02/01	لوله	1	1	0	17	t
1418	40	1	7	1341020151755		8	1404/02/01	لوله	1	1	0	17	t
1420	40	1	3	128006347002		6	1404/02/01	لوله	11	1	0	17	t
1422	44	2	7	1341020151755		8	1404/02/01	لوله	8	1	0	17	t
1425	42	1	15	200106390010		1	1404/02/06	اتصالات	15	1	0	13	t
1426	40	1	7	1341020151755		8	1404/02/02	لوله	9	1	0	17	t
1427	40	1	6	101104030002		1	1404/02/02	لوله	3	1	0	17	t
1429	44	2	4	106416021135		3	1404/02/02	لوله	10	1	0	17	t
1430	36	1	7	1341020151755		8	1404/02/03	لوله	5	1	0	17	t
1432	42	1	18	201306345061		1	1404/02/06	اتصالات	14	1	0	13	t
1433	39	3	12	201311045062		1	1404/02/06	اتصالات	14	1	0	13	t
1434	39	3	19	201706335218		1	1404/02/06	اتصالات	12	1	0	13	t
1411	39	1	15	210311045012		2	1404/02/03	اتصالات	10	1	0	13	t
1409	39	1	16	210711000226		1	1404/02/03	اتصالات	14	1	0	13	t
1392	42	3	17	211303290080		1	1404/01/31	اتصالات	15	1	0	13	f
1421	44	2	6	101104030002		1	1404/02/01	لوله	3	1	0	17	t
1391	45	3	8	118700110243		12	1404/02/03	لوله	3	1	0	17	t
1388	45	3	8	118700110243		12	1404/02/03	لوله	15	1	0	17	t
1389	36	1	8	118700110249		12	1404/02/03	لوله	8	1	0	17	t
1390	44	2	8	118700110246		12	1404/02/03	لوله	11	1	0	17	t
1431	36	1	8	118700110243		12	1404/02/03	لوله	6	1	0	17	t
1386	36	1	8	118700110243		12	1404/02/01	لوله	18	1	0	17	t
1399	36	1	8	118700110243	ok	12	1404/02/01	لوله	5	1	0	13	f
1419	40	1	8	118700110243		12	1404/02/01	لوله	2	1	0	13	t
1423	44	2	8	118700110243		12	1404/02/01	لوله	3	1	0	17	t
1424	45	3	8	118700110243		12	1404/02/01	لوله	2	1	0	17	t
1387	45	3	8	118700110243		12	1404/02/02	لوله	24	1	0	17	t
1428	40	1	8	118700110243		12	1404/02/02	لوله	4	1	0	17	t
1435	42	1	15	210311045012		2	1404/02/07	اتصالات	2	1	0	13	f
1440	39	3	20	200116090015		1	1404/02/07	اتصالات	12	1	0	13	t
1441	39	3	12	201311045062		1	1404/02/07	اتصالات	14	1	0	13	t
1442	42	1	11	200706300220		1	1404/02/08	اتصالات	16	1	0	13	t
1443	42	1	9	200106390010		1	1404/02/08	اتصالات	16	1	0	13	t
1444	39	3	18	201306345061		1	1404/02/08	اتصالات	15	1	0	13	t
1445	39	3	20	200116090015		1	1404/02/08	اتصالات	10	1	0	13	t
1446	42	1	9	200106390010		1	1404/02/09	اتصالات	1	1	0	13	t
1447	42	1	16	210300110007		2	1404/02/09	اتصالات	2	1	0	13	t
1448	39	3	15	210311045012		2	1404/02/09	اتصالات	10	1	0	13	t
1449	39	3	22	210411090010		2	1404/02/09	اتصالات	12	1	0	13	t
1450	39	1	20	210600004037		2	1404/02/12	اتصالات	15	1	0	13	t
1451	39	1	16	210300110007		2	1404/02/12	اتصالات	4	1	0	13	f
1452	42	3	15	210311045012		2	1404/02/12	اتصالات	1	1	0	13	f
1453	42	3	20	210600004037		2	1404/02/12	اتصالات	17	1	0	13	t
1323	39	1	20	210600004037		2	1404/01/19	اتصالات	14	1	0	13	t
1394	39	1	16	210300110007		2	1404/02/01	اتصالات	15	1	0	13	t
1436	42	1	16	210300110007		2	1404/02/07	اتصالات	16	1	0	13	t
1454	39	1	15	210311045012	تست افزایش کربن در فرمول	2	1404/02/07	اتصالات	1	1	0	13	f
1490	36	1	7	104102015004		8	1404/02/13	لوله	10	1	0	13	t
1439	44	2	4	118316019199		3	1404/01/31	لوله	4	1	0	17	t
1456	39	1	20	210600004037		1	1404/02/13	اتصالات	16	1	0	13	t
1457	39	3	16	210300110007		2	1404/02/14	اتصالات	15	1	0	13	t
1458	39	3	15	210111090011		2	1404/02/14	اتصالات	16	1	0	13	t
1459	39	3	18	201411087017		1	1404/02/14	اتصالات	1	1	0	13	f
1460	42	1	15	210111090011		2	1404/02/16	اتصالات	1	1	0	13	f
1461	42	1	16	210300110007		2	1404/02/16	اتصالات	7	1	0	13	t
1462	42	1	20	210600004037		2	1404/02/16	اتصالات	16	1	0	13	t
1463	39	3	15	210111090011		2	1404/02/17	اتصالات	15	1	0	13	t
1464	39	3	20	210600004037		2	1404/02/17	اتصالات	15	1	0	13	t
1465	34	1	21	200106345213		1	1404/02/18	اتصالات	11	1	0	13	t
1466	34	1	11	200706300034		1	1404/02/18	اتصالات	10	1	0	13	t
1467	39	3	21	200106345213		1	1404/02/18	اتصالات	15	1	0	13	t
1468	39	3	17	201706335020		1	1404/02/18	اتصالات	15	1	0	13	t
1469	39	1	21	200106345213		1	1404/02/19	اتصالات	15	1	0	13	t
1470	39	1	9	200106390010		1	1404/02/19	اتصالات	16	1	0	13	f
1471	34	3	12	200711000037		1	1404/02/19	اتصالات	6	1	0	13	f
1472	34	3	22	210411090010		2	1404/02/19	اتصالات	10	1	0	13	t
1473	34	3	16	210300110007		2	1404/02/19	اتصالات	10	1	0	13	t
1474	39	1	20	210600004037		2	1404/02/20	اتصالات	15	1	0	13	f
1475	39	1	15	210111090011		2	1404/02/20	اتصالات	15	1	0	13	t
1476	34	3	12	200711000037		1	1404/02/20	اتصالات	2	1	0	13	t
1478	36	1	7	1341020151755		8	1404/02/06	لوله	3	1	0	13	t
1479	40	2	7	1341020151755		8	1404/02/06	لوله	6	1	0	13	t
1480	36	1	7	1341020151755		8	1404/02/07	لوله	11	1	0	13	t
1482	36	1	6	104120153001		9	1404/02/08	لوله	10	1	0	13	t
1483	36	1	6	104120153001		9	1404/02/09	لوله	6	1	0	13	t
1485	36	1	7	104102015004		7	1404/02/12	لوله	24	1	0	13	t
1486	40	2	5	104120153001		9	1404/02/13	لوله	5	1	0	13	t
1487	40	2	6	114102515040		9	1404/02/13	لوله	5	1	0	13	t
1488	44	3	5	104120153001		9	1404/02/13	لوله	5	1	0	13	t
1489	44	3	6	114102515040		9	1404/02/13	لوله	4	1	0	13	t
1491	45	1	4	118311011198		3	1404/02/13	لوله	7	1	0	17	t
1492	45	1	3	102106319003		5	1404/02/13	لوله	3	1	0	17	t
1493	40	2	3	102106319003		5	1404/02/13	لوله	5	1	0	17	t
1494	40	2	4	118311011198		3	1404/02/13	لوله	5	1	0	17	t
1495	44	3	4	118311011198		3	1404/02/13	لوله	5	1	0	17	t
1496	44	3	3	102106319003		5	1404/02/13	لوله	5	1	0	17	t
1497	45	1	4	118311011198		3	1404/02/14	لوله	7	1	0	17	t
1498	40	2	3	102106319003		5	1404/02/14	لوله	2	1	0	17	t
1499	40	2	4	118311011198		3	1404/02/14	لوله	3	1	0	17	t
1500	40	2	8	118511013213		12	1404/02/14	لوله	3	1	0	17	t
1437	39	3	21	211206345085		1	1404/02/07	اتصالات	4	1	0	13	t
1438	44	2	3	118300756200		3	1404/01/31	لوله	4	1	0	17	t
1477	36	1	8	118700075244		12	1404/02/06	لوله	9	1	0	13	t
1481	45	2	8	118700160248		12	1404/02/07	لوله	3	1	0	13	t
1501	44	3	3	102106319003		5	1404/02/14	لوله	4	1	0	17	t
1510	40	2	6	118505045215		2	1404/02/15	لوله	3	1	0	17	t
1502	44	3	4	116216017059		3	1404/02/14	لوله	5	1	0	17	t
1503	44	3	8	118511013213		12	1404/02/14	لوله	1	1	0	17	t
1504	45	1	4	102111022005		5	1404/02/15	لوله	6	1	0	17	t
1505	45	1	8	118511013213		12	1404/02/15	لوله	3	1	0	17	t
1509	40	2	4	102111022005		5	1404/02/15	لوله	4	1	0	17	t
1511	40	2	8	118511015211		12	1404/02/15	لوله	3	1	0	17	t
1506	45	1	1	000000000001		12	1404/02/15	لوله	2	1	0	17	t
1507	45	1	6	118505045215		2	1404/02/15	لوله	3	1	0	17	t
1455	39	1	21	211206345085		1	1404/02/13	اتصالات	15	1	0	13	t
1562	45	3	5	1341020151755		8	1404/02/19	لوله	3	1	0	13	t
1563	36	1	6	114103215062		8	1404/02/20	لوله	8	1	0	13	t
1521	36	1	5	104120153001		9	1404/02/22	لوله	10	13	2	13	t
1522	36	1	7	104120153001		9	1404/02/22	لوله	12	1	0	13	t
1523	42	2	7	104120153001		9	1404/02/22	لوله	16	13	1	13	t
1508	40	2	1	000000000001		12	1404/02/15	لوله	11	1	0	17	t
1484	36	1	7	104102015004		8	1404/02/09	لوله	9	1	0	13	t
1520	44	2	4	106416021135		3	1404/02/02	لوله	10	1	0	17	t
1524	34	3	22	210411090010	تستی	2	1404/02/20	اتصالات	13	1	0	13	t
1525	39	1	12	200711000037		1	1404/02/21	اتصالات	10	1	0	13	t
1526	39	1	20	210600004037	تستی	2	1404/02/21	اتصالات	4	1	0	13	t
1527	39	1	15	210411090010		2	1404/02/21	اتصالات	13	1	0	13	t
1528	34	3	21	200106345213		1	1404/02/21	اتصالات	7	1	0	13	t
1529	34	3	20	210600004037		2	1404/02/21	اتصالات	11	1	0	13	t
1530	34	3	22	210411090010		2	1404/02/21	اتصالات	11	1	0	13	t
1531	39	1	21	200106345213		1	1404/02/22	اتصالات	15	1	0	13	t
1532	39	1	12	200711000037		1	1404/02/22	اتصالات	14	1	0	13	t
1534	39	1	19	200411045049		1	1404/02/23	اتصالات	15	1	0	13	t
1535	39	1	11	200706300040		1	1404/02/23	اتصالات	15	1	0	13	t
1537	34	3	15	210111090011		2	1404/02/23	اتصالات	12	1	0	13	t
1536	34	3	20	210600004037		2	1404/02/23	اتصالات	12	1	0	13	f
1538	39	1	22	210411090010		2	1404/02/26	اتصالات	14	1	0	13	t
1539	39	1	20	210600004037		2	1404/02/26	اتصالات	14	1	0	13	t
1540	39	1	15	210111090011		2	1404/02/26	اتصالات	14	1	0	13	t
1541	39	1	22	210411090010		2	1404/02/26	اتصالات	13	1	0	13	t
1564	36	1	5	1341020151755		8	1404/02/20	لوله	11	1	0	13	t
1544	34	3	21	200106345213		1	1404/02/27	اتصالات	14	1	0	13	t
1545	45	3	2	101111032007		1	1404/02/19	لوله	9	1	0	17	t
1546	45	3	8	118500756212		2	1404/02/19	لوله	2	1	0	17	t
1548	36	1	7	104102015006		7	1404/02/14	لوله	8	1	0	13	t
1549	36	1	7	1341020151755		8	1404/02/15	لوله	12	1	0	13	t
1551	36	1	8	118511015211		2	1404/02/16	لوله	30	1	0	13	t
1552	36	1	8	118511014225		2	1404/02/16	لوله	5	1	0	13	t
1553	40	3	8	118511014225		2	1404/02/16	لوله	2	1	0	13	t
1554	45	3	8	118511014225		1	1404/02/18	لوله	7	1	0	13	t
1555	36	1	8	118500756212		2	1404/02/18	لوله	15	1	0	13	t
1556	36	1	7	1341020151755		8	1404/02/18	لوله	13	1	0	13	t
1557	36	1	5	1341020151755		8	1404/02/18	لوله	8	1	0	13	t
1558	36	1	5	1341020151755		8	1404/02/19	لوله	10	1	0	13	t
1559	36	1	6	114103215062		8	1404/02/19	لوله	10	1	0	0	t
1560	36	1	7	1341020151755		1	1404/02/19	لوله	12	1	0	13	t
1561	42	2	7	1341020151755		8	1404/02/19	لوله	3	1	0	13	t
1565	45	3	6	114103215062		8	1404/02/20	لوله	6	1	0	13	t
1567	36	1	6	114102515040		9	1404/02/21	لوله	3	1	0	13	t
1572	44	2	3	104120153001		9	1404/02/21	لوله	7	1	0	17	t
1547	36	1	6	114102515040		9	1404/02/14	لوله	10	1	0	13	t
1573	44	2	4	117511015124		3	1404/02/21	لوله	4	1	0	17	t
1550	36	1	8	118511015211	نتیجه نا معلوم و تعداد میکس بالاتر از حد نرمال	2	1404/02/15	لوله	19	1	0	13	f
1566	36	1	7	104120153001	نتیجه نا معلوم و تعداد میکس بالاتر از حد نرمال	9	1404/02/21	لوله	15	1	0	13	f
1568	40	1	3	101109030006		1	1404/02/21	لوله	1	1	0	17	t
1569	40	1	3	116307506056		3	1404/02/21	لوله	2	1	0	17	t
1570	40	1	4	117511015124		3	1404/02/21	لوله	2	1	0	17	t
1571	40	1	8	118211015195		3	1404/02/21	لوله	2	1	0	17	t
1574	44	2	8	118211015195		3	1404/02/21	لوله	2	1	0	17	t
1575	45	3	3	116207506049		3	1404/02/21	لوله	1	1	0	17	t
1576	44	1	1	101120040010	not ok	1	1404/02/09	لوله	2	1	0	17	f
1579	40	1	3	116207506049		3	1404/02/22	لوله	3	1	0	17	t
1578	45	3	8	118211015195		3	1404/02/21	لوله	3	1	0	17	t
1577	45	3	4	117511015124		3	1404/02/21	لوله	9	1	0	17	t
1580	40	1	4	118211015195		3	1404/02/22	لوله	8	1	0	17	t
1581	40	1	6	116205006050		3	1404/02/22	لوله	1	1	0	17	t
1582	44	1	1	101120040010	ok	1	1404/02/09	لوله	2	1	0	17	f
1583	40	1	1	116316015254		3	1404/02/22	لوله	1	1	0	17	t
1543	39	3	20	210600004037		2	1404/02/27	اتصالات	11	1	0	13	t
1584	44	2	3	101106330004		1	1404/02/22	لوله	6	1	0	17	t
1590	36	1	7	104102015006		7	1404/02/15	لوله	1	1	0	13	f
1593	36	1	7	104120153001		9	1404/02/21	لوله	2	1	0	13	f
1585	42	2	8	118511014225	Test ?	2	1404/02/18	لوله	2	1	0	17	f
1586	36	1	6	118505045215		2	1404/02/14	لوله	2	1	0	13	f
1594	42	2	7	104120153001		9	1404/02/21	لوله	10	1	0	13	t
1587	40	2	6	118505045215		2	1404/02/14	لوله	3	1	0	13	f
1592	36	1	7	1341020151755		8	1404/02/15	لوله	2	1	0	13	f
1588	40	2	6	118505045215		2	1404/02/14	لوله	2	1	0	13	f
1589	44	3	6	118505045215		2	1404/02/14	لوله	7	1	0	13	f
1595	42	2	6	114102515040		9	1404/02/21	لوله	9	1	0	13	t
1591	36	1	8	118511013213		2	1404/02/15	لوله	4	1	0	13	f
1657	40	3	2	101111032007		1	1404/02/16	لوله	7	1	0	17	t
1596	42	2	5	104120153001		9	1404/02/21	لوله	5	1	0	13	t
1597	40	1	3	101109030006		1	1404/02/21	لوله	1	1	0	17	t
1598	40	1	3	116307506056		3	1404/02/21	لوله	2	1	0	17	t
1599	40	1	4	117511015124		3	1404/02/21	لوله	2	1	0	17	t
1600	40	1	8	118211015195		13	1404/02/21	لوله	2	1	0	17	t
1601	44	2	3	104120153001		9	1404/02/21	لوله	7	1	0	17	t
1602	44	2	4	117511015124		3	1404/02/21	لوله	4	1	0	17	t
1603	44	2	8	118211015195		13	1404/02/21	لوله	2	1	0	17	t
1604	45	3	3	116207506049		3	1404/02/21	لوله	1	1	0	17	t
1605	45	3	4	117511015124		3	1404/02/21	لوله	9	1	0	17	t
1606	45	3	8	118211015195		13	1404/02/21	لوله	3	1	0	17	t
1607	40	1	1	116316015254		3	1404/02/22	لوله	1	1	0	17	t
1608	40	1	3	116207506049		3	1404/02/22	لوله	3	1	0	17	t
1609	40	1	4	117511015124		3	1404/02/22	لوله	8	1	0	17	t
1610	40	1	6	116205006050		3	1404/02/22	لوله	1	1	0	17	t
1611	44	2	3	101106330004		1	1404/02/22	لوله	6	1	0	17	t
1612	44	2	4	117511015124		3	1404/02/22	لوله	1	1	0	17	t
1613	44	2	6	116205006050		3	1404/02/22	لوله	1	1	0	17	t
1614	44	2	8	118211015195		13	1404/02/22	لوله	1	1	0	17	t
1615	45	3	2	101111032007		1	1404/02/19	لوله	9	1	0	17	t
1616	45	3	8	118500756212		12	1404/02/19	لوله	2	1	0	17	t
1617	40	1	1	118800160252		3	1404/02/19	لوله	7	1	0	17	t
1618	40	1	2	101111032007		1	1404/02/19	لوله	7	1	0	17	t
1619	40	1	3	101106330004		1	1404/02/19	لوله	1	1	0	0	t
1620	42	2	1	118800160252		3	1404/02/19	لوله	4	1	0	17	t
1621	42	2	8	101111032007		2	1404/02/19	لوله	8	1	0	17	t
1622	42	2	3	101106330004		1	1404/02/19	لوله	8	1	0	17	t
1623	45	3	1	118800160252		3	1404/02/19	لوله	6	1	0	17	t
1624	45	3	2	101111032007		1	1404/02/19	لوله	3	1	0	17	t
1625	45	3	3	101106330004		1	1404/02/19	لوله	2	1	0	17	t
1626	40	1	2	103111027005		4	1404/02/20	لوله	7	1	0	17	t
1627	40	1	3	103109028004		4	1404/02/20	لوله	4	1	0	17	t
1628	40	1	4	118800110253		3	1404/02/20	لوله	7	1	0	17	t
1629	44	2	2	101111032007		1	1404/02/20	لوله	8	1	0	17	t
1630	44	2	3	103109028004		4	1404/02/20	لوله	7	1	0	17	t
1631	44	2	4	118800110253		3	1404/02/20	لوله	4	1	0	17	t
1632	44	2	4	117511015124		3	1404/02/20	لوله	1	1	0	0	t
1633	42	3	4	117511015124		3	1404/02/20	لوله	10	1	0	17	t
1634	42	3	2	101111032007		1	1404/02/20	لوله	9	1	0	17	t
1635	36	1	5	104120153001		9	1404/02/22	لوله	10	13	2	13	t
1636	36	1	7	104120153001		9	1404/02/22	لوله	12	1	0	13	t
1637	42	2	7	104120153001		9	1404/02/22	لوله	16	1	0	13	t
1638	44	2	8	118200758229		13	1404/02/23	لوله	3	1	0	13	t
1639	45	3	8	118200758229		13	1404/02/24	لوله	23	1	0	13	t
1640	45	3	3	101106330004		1	1404/02/24	لوله	8	1	0	0	t
1641	36	1	3	101106330004		1	1404/02/23	لوله	30	1	0	13	t
1642	42	2	3	101106330004		1	1404/02/23	لوله	9	1	0	13	t
1643	42	2	7	104120153001		9	1404/02/23	لوله	4	1	0	13	t
1644	42	2	5	104120153001		9	1404/02/23	لوله	4	1	0	13	t
1645	42	2	3	101106330004		1	1404/02/23	لوله	6	1	0	13	t
1646	45	3	3	101106330004		1	1404/02/23	لوله	15	1	0	13	t
1647	44	3	3	101106330004		1	1404/02/25	لوله	16	1	0	13	t
1648	44	3	2	101111032007		1	1404/02/25	لوله	4	1	0	13	t
1649	40	3	2	101111032007		1	1404/02/25	لوله	25	1	0	13	t
1650	44	3	1	000000000001		3	1404/02/15	لوله	8	1	0	17	t
1651	44	3	4	102111022005		5	1404/02/15	لوله	4	1	0	17	t
1652	44	3	7	118505045215		2	1404/02/15	لوله	2	1	0	17	t
1653	45	1	1	000000000001		3	1404/02/16	لوله	6	1	0	17	t
1654	45	1	5	1341020151755		8	1404/02/16	لوله	6	1	0	17	t
1655	45	1	7	1341020151755		8	1404/02/16	لوله	3	1	0	17	t
1656	45	1	8	118511015211		12	1404/02/16	لوله	6	1	0	17	t
1658	40	3	7	1341020151755		8	1404/02/16	لوله	1	1	0	17	t
1659	40	3	8	118511015211		12	1404/02/16	لوله	4	1	0	17	t
1660	45	3	2	1341020151755		8	1404/02/18	لوله	5	1	0	17	t
1661	45	3	8	118500756212		12	1404/02/18	لوله	2	1	0	17	t
1662	40	1	2	101111032007		1	1404/02/18	لوله	3	1	0	17	t
1663	40	1	2	101111032007		1	1404/02/18	لوله	4	1	0	17	t
1664	40	1	3	101106330004		1	1404/02/18	لوله	1	1	0	17	t
1665	40	1	4	102111022005		5	1404/02/18	لوله	1	1	0	17	t
1666	40	1	5	1341020151755		8	1404/02/18	لوله	2	1	0	17	t
1667	40	1	8	118511014225		12	1404/02/18	لوله	2	1	0	17	t
1668	42	2	2	101111032007		1	1404/02/18	لوله	6	1	0	17	t
1669	42	2	4	102111022005		5	1404/02/18	لوله	9	1	0	17	t
1713	45	1	2	101111032007		1	1404/03/04	لوله	9	1	0	17	t
1670	36	1	2	101111032007		1	1404/02/26	لوله	28	1	0	13	t
1684	42	2	7	1341020151755		8	1404/02/30	لوله	22	1	0	13	t
1683	42	2	7	1341020151755		8	1404/02/30	لوله	5	13	1	13	t
1682	36	1	1	1000000000		527	1404/02/30	لوله	3	16	1	13	t
1681	36	1	8	118511010214		12	1404/02/30	لوله	14	1	0	13	t
1680	36	1	5	114100202069		9	1404/02/28	لوله	6	1	0	13	t
1679	36	1	6	118503215238		2	1404/02/28	لوله	8	1	0	13	t
1678	36	1	8	111111010058		11	1404/02/27	لوله	4	1	0	13	t
1677	36	1	6	118232280226		3	1404/02/27	لوله	12	1	0	13	t
1676	36	1	3	101106330004		1	1404/02/27	لوله	12	1	0	13	t
1675	40	3	2	101111032007		1	1404/02/26	لوله	14	1	0	13	t
1674	44	3	3	101106330004		1	1404/02/26	لوله	16	1	0	13	t
1673	45	2	3	101106330004		1	1404/02/26	لوله	8	1	0	13	t
1672	45	2	8	111111010058		11	1404/02/26	لوله	12	3	1	13	t
1671	42	2	2	101111032007		1	1404/02/26	لوله	14	1	0	13	t
1685	42	1	5	1341020151755		8	1404/03/02	لوله	10	1	0	13	t
1686	42	1	5	1341020151755		8	1404/03/02	لوله	7	1	0	13	t
1687	42	1	5	1341020151755		8	1404/03/03	لوله	12	13	1	13	t
1688	42	1	7	114102015233		8	1404/03/03	لوله	7	1	0	13	t
1542	39	1	15	210111090011		2	1404/02/27	اتصالات	13	1	0	13	t
1689	34	3	15	210411090010	تستی	2	1404/02/27	اتصالات	14	1	0	13	t
1690	39	1	19	200411045049		1	1404/02/28	اتصالات	14	1	0	13	t
1691	39	1	18	200309045057	تستی	1	1404/02/28	اتصالات	12	1	0	13	t
1692	34	3	16	200111045215		1	1404/02/28	اتصالات	12	1	0	13	t
1693	34	3	16	200111045215		1	1404/02/28	اتصالات	12	1	0	13	t
1694	34	3	23	201506300025		1	1404/02/28	اتصالات	12	1	0	13	t
1695	39	1	16	200111045215	تستی	1	1404/02/29	اتصالات	12	1	0	13	t
1696	39	1	17	201706335020		1	1404/02/29	اتصالات	12	1	0	13	t
1697	34	3	21	200106345213		1	1404/02/29	اتصالات	14	1	0	13	t
1698	34	3	12	200711000037		1	1404/02/29	اتصالات	11	1	0	13	t
1699	39	1	13	201511000027		1	1404/02/30	اتصالات	12	1	0	13	t
1700	39	1	15	210411090010		2	1404/02/30	اتصالات	13	1	0	13	t
1701	34	3	15	200306345223		1	1404/02/30	اتصالات	13	1	0	13	t
1703	34	1	9	201112590075		1	1404/03/02	اتصالات	12	1	0	13	t
1704	34	1	13	201511000027		1	1404/03/02	اتصالات	12	1	0	13	t
1702	34	3	20	210600004037	تستی	2	1404/02/30	اتصالات	11	1	0	13	t
1705	39	3	12	200711000037		1	1404/03/02	اتصالات	12	1	0	13	t
1706	39	3	16	200111045215		1	1404/03/02	اتصالات	12	1	0	13	t
1707	34	1	18	200309045057	تستی	1	1404/03/03	اتصالات	13	1	0	13	t
1708	34	1	19	200411045222		1	1404/03/03	اتصالات	13	1	0	13	t
1709	39	3	15	200306345223		1	1404/03/03	اتصالات	14	1	0	13	t
1710	39	3	22	200811063029		1	1404/03/03	اتصالات	13	1	0	13	t
1712	34	1	23	201506300025		1	1404/03/04	اتصالات	10	1	0	13	t
1714	34	1	12	200711000037		1	1404/03/04	اتصالات	10	1	0	13	t
1716	39	3	12	200711000037		1	1404/03/04	اتصالات	8	1	0	13	t
1717	40	2	2	101111032007		1	1404/03/04	لوله	6	1	0	17	t
1718	39	3	15	200306345223		1	1404/03/04	اتصالات	11	1	0	13	t
1719	40	2	3	101106330004		1	1404/03/04	لوله	3	1	0	17	t
1715	34	1	15	200306345223		1	1404/03/04	اتصالات	7	1	0	13	t
1720	40	2	3	101106330004		1	1404/03/04	لوله	1	1	0	17	t
1721	39	3	15	200306345223	تستی	1	1404/03/04	اتصالات	3	1	0	13	t
1722	44	3	2	101111032007		1	1404/03/04	لوله	5	1	0	17	t
1723	44	3	3	101106330004		1	1404/03/04	لوله	5	1	0	17	t
1724	44	3	4	102111022005		5	1404/03/04	لوله	4	1	0	17	t
1725	45	1	2	101111032007		1	1404/03/05	لوله	1	1	0	17	t
1726	45	1	1	110000000000		3	1404/03/04	لوله	3	1	0	17	t
1727	45	1	1	111000000000		4	1404/03/04	لوله	10	1	0	17	t
1729	40	2	1	111000000000		4	1404/03/04	لوله	5	1	0	17	t
1730	45	1	3	101106330004		1	1404/03/05	لوله	5	1	0	17	t
1731	34	1	23	201506300025	تستی	1	1404/03/05	اتصالات	11	1	0	0	t
1728	34	1	11	201406387016		1	1404/03/05	اتصالات	11	1	0	13	t
1732	45	1	4	102111022005		5	1404/03/05	لوله	7	1	0	17	t
1733	39	3	10	201204045015	تستی\n	1	1404/03/05	اتصالات	12	1	0	13	t
1734	40	2	3	101106330004		1	1404/03/05	لوله	4	1	0	17	t
1735	39	3	22	200811063029		1	1404/03/05	اتصالات	12	1	0	13	t
1736	40	2	4	102111022005		5	1404/03/05	لوله	2	1	0	17	t
1737	34	1	20	210600004037		1	1404/03/06	اتصالات	11	1	0	13	t
1738	44	3	3	101106330004		1	1404/03/05	لوله	6	1	0	17	t
1741	39	3	20	210600004037		1	1404/03/06	اتصالات	13	1	0	13	t
1742	45	1	4	102111022005		5	1404/03/06	لوله	5	1	0	17	t
1745	40	2	4	102111022005		5	1404/03/06	لوله	4	1	0	17	t
1739	34	1	13	201511000027		1	1404/03/06	اتصالات	11	1	0	13	t
1746	44	3	4	102111022005		5	1404/03/06	لوله	2	1	0	17	t
1740	45	1	3	101106330004		1	1404/03/06	لوله	3	1	0	17	t
1743	45	1	8	111111012042		2	1404/03/06	لوله	3	1	0	17	t
1744	39	3	16	200111045215		1	1404/03/06	اتصالات	13	1	0	13	t
1747	45	1	8	111100000000		3	1404/03/05	لوله	1	1	0	17	t
1748	36	1	8	118511013213		2	1404/02/29	لوله	28	1	0	13	t
1749	36	1	7	1341020151755		8	1404/02/30	لوله	6	1	0	13	t
1750	36	1	5	1341020151755		8	1404/02/30	لوله	14	1	0	13	t
1751	36	2	5	1341020151755		8	1404/03/02	لوله	12	1	0	13	t
1752	36	2	7	1341020151755		8	1404/03/02	لوله	8	1	0	13	t
1753	36	2	5	1341020151755		8	1404/03/03	لوله	12	1	0	13	t
1754	36	2	6	114102515010		8	1404/03/03	لوله	6	1	0	13	t
1755	42	1	6	114102515010		8	1404/03/04	لوله	10	1	0	13	t
1757	36	2	7	114102015233		9	1404/03/04	لوله	12	1	0	13	t
1756	42	1	7	114102015233		9	1404/03/04	لوله	10	1	0	13	t
1758	36	2	6	114102515010		8	1404/03/04	لوله	12	1	0	13	t
1759	42	2	5	114100202069		9	1404/02/27	لوله	7	1	0	13	t
1760	42	2	5	114100202069		9	1404/02/27	لوله	10	1	0	13	t
1761	42	2	5	114100202069		9	1404/02/27	لوله	10	1	0	13	t
1762	42	2	8	118511015211		2	1404/02/28	لوله	9	1	0	0	t
1763	42	2	8	118511015211		2	1404/02/28	لوله	9	1	0	13	t
1764	42	2	8	118511013213		2	1404/02/28	لوله	10	1	0	13	t
1765	42	2	8	118511013213		2	1404/02/29	لوله	9	1	0	13	t
1766	42	2	8	118511010214		2	1404/02/29	لوله	9	1	0	13	t
1767	42	2	8	118511010214		2	1404/02/29	لوله	10	1	0	13	t
1768	42	1	6	114102515010		8	1404/03/05	لوله	10	1	0	13	t
1769	42	1	6	114102515010		8	1404/03/05	لوله	10	1	0	13	t
1770	36	2	7	114102015233		9	1404/03/05	لوله	10	1	0	13	t
1771	36	2	5	1341020151755		8	1404/03/05	لوله	10	1	0	13	t
1772	42	1	5	1341020151755		8	1404/03/06	لوله	10	1	0	13	t
1773	36	2	7	1341020151755		8	1404/03/06	لوله	10	1	0	13	t
1774	36	2	6	1341020151755		1	1404/03/06	لوله	10	1	0	13	t
1775	45	2	2	101111032007		1	1404/02/27	لوله	10	1	0	17	t
1776	45	2	3	101106330004		1	1404/02/27	لوله	10	1	0	17	t
1777	40	3	2	101111032007		1	1404/02/27	لوله	15	1	0	17	t
1778	40	3	3	101106330004		1	1404/02/27	لوله	5	1	0	17	t
1779	40	3	4	116211012048		3	1404/02/27	لوله	8	1	0	17	t
1780	44	1	1	116316015254		3	1404/02/28	لوله	6	1	0	17	t
1781	45	2	8	118511015211		2	1404/02/28	لوله	3	1	0	17	t
1782	45	2	3	101106330004		1	1404/02/28	لوله	6	1	0	17	t
1783	45	2	4	116211012048		3	1404/02/28	لوله	6	1	0	17	t
1784	45	2	1	116316015254		3	1404/02/28	لوله	5	1	0	17	t
1785	40	3	2	101111032007		1	1404/02/28	لوله	8	1	0	17	t
1786	40	3	1	116216017059		3	1404/02/28	لوله	3	1	0	17	t
1787	40	3	4	116211010060		1	1404/02/28	لوله	6	1	0	17	t
1788	40	3	3	101106330004		1	1404/02/28	لوله	4	1	0	17	t
1789	40	3	8	118511013213		2	1404/02/28	لوله	3	1	0	17	t
1790	44	1	3	101106330004		1	1404/02/29	لوله	4	1	0	17	t
1791	44	1	4	116211010060		1	1404/02/29	لوله	6	1	0	17	t
1792	44	1	6	118505045215		2	1404/02/29	لوله	3	1	0	0	t
1793	44	1	8	118511013213		2	1404/02/29	لوله	3	1	0	17	t
1794	44	1	4	117511015124		3	1404/02/28	لوله	5	1	0	17	t
1795	44	1	8	118511015211		12	1404/02/28	لوله	3	1	0	17	t
1796	40	3	2	101111032007		1	1404/02/31	لوله	7	1	0	17	t
1797	40	3	4	102116032007		5	1404/02/31	لوله	2	1	0	17	t
1798	40	3	8	118500756212		12	1404/02/31	لوله	2	1	0	17	t
1799	45	1	2	101111032007		1	1404/03/02	لوله	9	1	0	17	t
1800	45	1	4	101116040009		1	1404/03/02	لوله	9	1	0	17	t
1801	45	1	8	118911014256		12	1404/03/02	لوله	3	1	0	0	t
1802	40	2	2	101111032007		1	1404/03/02	لوله	5	1	0	17	t
1803	40	2	4	101116040009		1	1404/03/02	لوله	5	1	0	17	t
1804	40	2	8	118911014256		12	1404/03/02	لوله	3	1	0	17	t
1805	44	3	2	101111032007		1	1404/03/02	لوله	6	1	0	17	t
1806	44	3	4	101116040009		1	1404/03/02	لوله	4	1	0	17	t
1807	44	3	8	118911014256		12	1404/03/02	لوله	2	1	0	17	t
1808	45	1	2	101111032007		1	1404/03/03	لوله	6	1	0	17	t
1809	45	1	4	101116040009		1	1404/03/03	لوله	6	1	0	17	t
1810	40	2	2	101111032007		1	1404/03/03	لوله	7	1	0	17	t
1811	40	2	4	101116040009		1	1404/03/03	لوله	5	1	0	17	t
1812	40	2	8	110000000000		13	1404/03/03	لوله	4	1	0	17	t
1814	44	3	2	101111032007		1	1404/03/03	لوله	5	1	0	17	t
1815	44	3	4	101116040009		1	1404/03/03	لوله	3	1	0	17	t
1816	44	3	8	110000000000		3	1404/03/03	لوله	3	1	0	17	t
1817	45	2	4	116211010060		3	1404/02/29	لوله	2	1	0	17	t
1820	45	2	3	101106330004		1	1404/02/29	لوله	7	1	0	17	t
1823	40	3	1	116320025227		3	1404/02/29	لوله	4	1	0	17	t
1818	45	2	1	116320025227		3	1404/02/29	لوله	8	1	0	17	t
1827	40	3	6	118505045215		2	1404/02/29	لوله	1	1	0	17	t
1819	45	2	5	104120153001		9	1404/02/29	لوله	2	1	0	17	t
1825	40	3	4	102116032007		5	1404/02/29	لوله	6	1	0	17	t
1828	40	3	8	118511010214		12	1404/02/29	لوله	2	1	0	17	t
1821	45	2	8	118511010214		12	1404/02/29	لوله	4	1	0	17	t
1830	44	1	3	101106330004		1	1404/02/30	لوله	5	1	0	17	t
1831	44	1	4	102116032007		5	1404/02/30	لوله	6	1	0	17	t
1822	45	2	4	102116032007		5	1404/02/29	لوله	2	1	0	17	t
1829	44	1	2	101111032007		1	1404/02/30	لوله	7	1	0	17	t
1833	44	1	8	118511010214	لایه اصلی	12	1404/02/30	لوله	1	1	0	17	t
1824	40	3	3	101106330004		1	1404/02/29	لوله	4	1	0	17	t
1826	40	3	5	104120153001		9	1404/02/29	لوله	1	1	0	17	t
1832	44	1	5	104120153001		9	1404/02/30	لوله	2	1	0	17	t
1834	44	1	8	118511010214	لایه میانی	12	1404/02/30	لوله	1	1	0	17	t
1835	45	2	3	101106330004		1	1404/02/30	لوله	2	1	0	17	t
1836	45	2	2	101111032007		1	1404/02/30	لوله	7	1	0	17	t
1837	45	2	4	102116032007		5	1404/02/30	لوله	7	1	0	17	t
1838	42	2	8	118200758229		13	1404/02/26	لوله	2	1	0	13	f
1839	34	3	11	200709000036		1	1404/03/09	اتصالات	11	1	0	13	t
1840	36	1	6	114103215083		9	1404/02/27	لوله	4	1	0	13	f
1841	36	1	8	118511015211	لایه میانی نارنجی - ok	12	1404/02/28	لوله	3	1	0	13	f
1843	42	1	5	1341020151755	ok	8	1404/03/02	لوله	3	1	0	13	f
1842	36	1	7	114102015233	ok	8	1404/02/30	لوله	2	1	0	13	f
1844	36	2	6	114102515010	ok	8	1404/03/03	لوله	4	1	0	13	f
1846	42	2	7	114100202069	? TEST 	9	1404/03/04	لوله	2	1	0	13	f
1850	36	2	6	1341020151755	ok	8	1404/03/06	لوله	2	1	0	13	f
1847	42	1	8	111111012042	not ok - تست بی کربنات سدیم SACHL	12	1404/03/06	لوله	2	1	0	13	f
1848	42	1	8	111111012042	 not ok - تست بی کربنات سدیم SACHL	13	1404/03/06	لوله	1	1	0	13	f
1849	42	1	8	111111012042	not ok - تست بی کربنات سدیم SACHL	12	1404/03/06	لوله	1	1	0	13	f
1845	42	2	7	111110000000	? TEST 	522	1404/02/27	لوله	2	1	0	13	f
1851	44	2	3	116211015047		3	1404/03/13	لوله	4	1	0	17	t
1852	45	3	3	116211015047		3	1404/03/13	لوله	6	1	0	17	t
1853	40	1	3	116211015047		3	1404/03/16	لوله	5	1	0	17	t
1854	45	2	3	116211015047		3	1404/03/16	لوله	5	1	0	17	t
1855	44	3	3	116211015047		3	1404/03/16	لوله	5	1	0	17	t
1859	44	3	3	116211010060		3	1404/03/17	لوله	5	1	0	17	t
1856	40	1	3	117511015124		3	1404/03/17	لوله	5	1	0	17	t
1857	45	2	3	117511015124		3	1404/03/17	لوله	5	1	0	17	t
1858	45	2	4	117511015124		1	1404/03/17	لوله	6	1	0	17	t
1861	44	3	4	101109030006		1	1404/03/17	لوله	5	1	0	17	t
1862	40	1	4	101109030006		1	1404/03/18	لوله	6	1	0	17	t
1863	45	2	4	101109030006		1	1404/03/18	لوله	6	1	0	17	t
1864	45	2	2	101111032007		1	1404/03/18	لوله	1	1	0	17	t
1865	44	3	4	101109030006		1	1404/03/18	لوله	2	1	0	17	t
1866	45	2	4	117511015124	TEST ?	3	1404/02/27	لوله	2	1	0	17	f
1867	44	1	1	116320025227	TEST ?	3	1404/02/28	لوله	1	1	0	17	f
1868	44	1	1	116320025227	TEST ?	3	1404/02/29	لوله	2	1	0	17	f
1869	44	1	1	116220020223	TEST ?	3	1404/02/29	لوله	2	1	0	17	f
1870	44	3	4	102111022005	TEST ?	5	1404/03/05	لوله	2	1	0	17	f
1871	44	1	4	118800110253	TEST ?	2	1404/03/09	لوله	2	1	0	17	f
1872	44	1	3	111111000000	TEST ?	3	1404/03/10	لوله	1	1	0	17	f
1873	40	1	4	101109030006	TEST ?	1	1404/03/17	لوله	2	1	0	17	f
1874	44	3	2	101111032007	TEST ?	1	1404/03/18	لوله	4	1	0	17	f
1875	44	3	4	101109030006	TEST ?	1	1404/03/18	لوله	1	1	0	17	f
1876	42	1	7	114102015233		8	1404/03/16	لوله	7	1	0	13	t
1877	42	1	5	114102015233		8	1404/03/16	لوله	7	1	0	13	t
1878	42	1	7	114102015233		8	1404/03/16	لوله	7	1	0	13	t
1879	42	1	6	114102515010		8	1404/03/16	لوله	3	1	0	13	t
1880	42	1	6	114102515010		8	1404/03/17	لوله	7	1	0	13	t
1881	42	1	6	114102515010		8	1404/03/17	لوله	8	1	0	13	t
1882	42	1	7	114102015233		8	1404/03/17	لوله	7	1	0	13	t
1883	36	2	5	114102015233		8	1404/03/16	لوله	6	1	0	13	t
1884	36	2	6	114102515010		8	1404/03/16	لوله	10	13	1	13	t
1885	36	2	7	114102015233		8	1404/03/16	لوله	8	1	0	13	t
1886	36	2	7	114102015233		8	1404/03/16	لوله	8	1	0	0	t
1887	36	2	5	114102015233		8	1404/03/16	لوله	10	1	0	13	t
1888	36	2	7	114102015233		8	1404/03/17	لوله	12	1	0	13	t
1889	42	1	5	114102015233		8	1404/03/18	لوله	8	1	0	13	t
1890	42	1	6	102104015001		8	1404/03/18	لوله	8	1	0	13	t
1891	36	2	5	114102015233		8	1404/03/18	لوله	6	1	0	13	t
1892	36	2	6	102104015001		8	1404/03/18	لوله	8	1	0	13	t
1893	36	2	7	114102015233		8	1404/03/18	لوله	10	13	2	13	t
1894	44	3	7	114102015233		8	1404/03/18	لوله	3	1	0	13	t
1895	42	1	7	114102015233		8	1404/03/19	لوله	10	1	0	13	t
1896	36	1	7	1341020151755		8	1404/03/10	لوله	10	1	0	13	t
1897	36	1	5	1341020151755		8	1404/03/10	لوله	10	1	0	13	t
1898	36	1	6	114102515046		8	1404/03/10	لوله	5	17	1	13	t
1899	42	2	7	1341020151755		8	1404/03/10	لوله	10	1	0	13	t
1900	42	2	5	1341020151755		8	1404/03/10	لوله	10	1	0	13	t
1901	42	2	6	114102515010		8	1404/03/10	لوله	4	1	0	13	t
1906	42	2	6	114102515010		8	1404/03/11	لوله	8	1	0	13	t
1908	42	2	5	114102015233		8	1404/03/11	لوله	9	1	0	13	t
1902	36	1	7	1341020151755		8	1404/03/11	لوله	12	1	0	13	t
1903	36	1	6	114102515010		8	1404/03/11	لوله	8	1	0	13	t
1904	36	1	5	1341020151755		8	1404/03/11	لوله	8	1	0	13	t
1907	42	2	7	114102015233		8	1404/03/11	لوله	4	1	0	13	t
1909	36	1	5	114102015233		8	1404/03/12	لوله	8	1	0	13	t
1911	36	1	7	114102015233		8	1404/03/12	لوله	11	1	0	13	t
1910	36	1	6	114102515241	ok	8	1404/03/12	لوله	3	1	0	13	f
1912	42	3	6	114102515241		8	1404/03/12	لوله	7	1	0	13	t
1914	36	1	5	114102015233		8	1404/03/13	لوله	8	1	0	13	t
1913	42	3	7	114102015233		8	1404/03/12	لوله	3	1	0	13	t
1915	36	1	6	114102515241		8	1404/03/13	لوله	8	1	0	13	t
1916	36	1	6	114102015233		8	1404/03/13	لوله	8	1	0	13	t
1917	42	2	5	114102015233		8	1404/03/13	لوله	7	1	0	13	t
1918	42	2	5	114102015233		8	1404/03/13	لوله	7	1	0	13	t
1919	42	2	6	114102515241		8	1404/03/13	لوله	5	1	0	13	t
1920	44	1	2	101111032007		1	1404/03/09	لوله	8	1	0	17	t
1921	44	1	4	118800110253		3	1404/03/09	لوله	4	1	0	17	t
1922	40	2	2	101111032007		1	1404/03/09	لوله	11	1	0	17	t
1923	40	2	4	118800110253		3	1404/03/09	لوله	7	1	0	17	t
1924	45	3	4	118800110253		3	1404/03/09	لوله	7	1	0	17	t
1925	45	3	2	101111032007		1	1404/03/09	لوله	10	1	0	17	t
1926	44	1	1	118800200251		3	1404/03/10	لوله	6	1	0	17	t
1927	44	1	4	118800110253		3	1404/03/10	لوله	3	1	0	17	t
1928	40	2	1	118800200251		3	1404/03/10	لوله	7	1	0	17	t
1929	45	3	2	101111032007		1	1404/03/10	لوله	7	1	0	17	t
1930	44	1	1	118800160252		3	1404/03/11	لوله	6	1	0	17	t
1931	44	1	2	101111032007		1	1404/03/11	لوله	7	1	0	17	t
1932	40	2	1	117516017144		3	1404/03/11	لوله	4	1	0	17	t
1933	40	2	3	111111000000		3	1404/03/11	لوله	1	1	0	17	t
1934	40	2	3	117500757121		3	1404/03/11	لوله	3	1	0	0	t
1935	45	3	1	117516017144		3	1404/03/11	لوله	5	1	0	17	t
1936	40	1	1	117516017144		3	1404/03/12	لوله	1	1	0	13	t
1937	40	1	3	118800110253		3	1404/03/12	لوله	6	1	0	17	t
1938	44	2	3	118800110253		3	1404/03/12	لوله	2	1	0	17	t
1939	44	2	3	117511012123		3	1404/03/12	لوله	3	1	0	17	t
1940	45	3	3	116211015047		3	1404/03/12	لوله	6	1	0	17	t
1941	39	1	18	200309045057	تستی	1	1404/03/09	اتصالات	13	1	0	13	t
1942	40	1	3	117511015124		3	1404/03/13	لوله	6	1	0	17	t
1943	39	1	9	201112590075	تستی	1	1404/03/09	اتصالات	13	1	0	13	t
1944	34	3	11	200709000036		1	1404/03/09	اتصالات	11	1	0	13	t
1945	34	3	19	200411045222		1	1404/03/09	اتصالات	12	1	0	13	t
1946	39	1	18	200309045057	تستی	1	1404/03/10	اتصالات	13	1	0	13	t
1947	39	1	16	200111045215		1	1404/03/10	اتصالات	13	1	0	13	t
1948	34	3	15	200306345223		1	1404/03/10	اتصالات	12	1	0	13	t
1949	34	3	12	200711000221		1	1404/03/10	اتصالات	13	1	0	13	t
1950	39	1	22	200112545005		1	1404/03/11	اتصالات	13	1	0	13	t
1952	39	1	16	200111045215	جایگزین دانا	1	1404/03/12	اتصالات	12	1	0	13	t
1951	39	1	11	200709000036		1	1404/03/11	اتصالات	11	1	0	13	t
1953	39	1	21	200106345213		1	1404/03/12	اتصالات	10	1	0	13	t
1954	39	1	15	200306345223		1	1404/03/12	اتصالات	2	1	0	13	t
1955	39	1	12	200711000221		1	1404/03/12	اتصالات	6	1	0	13	t
1956	39	1	23	201506300025		1	1404/03/12	اتصالات	4	1	0	13	t
1957	39	1	22	200112545005		1	1404/03/12	اتصالات	6	1	0	13	t
1958	39	1	15	200306345055		1	1404/03/13	اتصالات	5	1	0	13	t
1959	39	1	12	200711000221		1	1404/03/13	اتصالات	10	1	0	13	t
1960	39	1	21	200106345213		1	1404/03/13	اتصالات	10	1	0	13	t
1961	39	1	20	210600004037		2	1404/03/13	اتصالات	11	1	0	13	t
1963	44	3	2	101111032007	white	1	1404/03/26	لوله	7	1	0	17	t
1964	44	3	3	101106330004		1	1404/03/26	لوله	5	1	0	17	t
1965	45	1	2	101111032007		1	1404/03/27	لوله	8	1	0	17	t
1966	45	1	3	101106330004		1	1404/03/27	لوله	8	1	0	17	t
1967	45	1	4	102111022005		5	1404/03/27	لوله	3	1	0	17	t
1968	40	2	2	101111032007		1	1404/03/27	لوله	8	1	0	17	t
1969	40	2	3	101106330004		1	1404/03/27	لوله	3	16	2	17	t
1970	40	2	4	117511015124		3	1404/03/27	لوله	5	14	1	17	t
1971	44	3	4	117511015124		3	1404/03/27	لوله	2	1	0	17	t
1972	44	3	2	101111032007		1	1404/03/27	لوله	1	1	0	17	t
1973	44	3	3	101106330004		1	1404/03/27	لوله	4	1	0	17	t
1974	42	1	7	1341020151755	not ok	8	1404/03/18	لوله	2	1	0	13	f
1976	42	1	7	114102015233	ok	9	1404/03/19	لوله	2	1	0	13	f
1977	42	1	6	114104015260	ok	7	1404/03/20	لوله	2	1	0	13	f
1978	42	1	6	101104030002	ok	1	1404/03/21	لوله	2	1	0	13	f
1979	42	1	6	1341020151755	ok	8	1404/03/22	لوله	2	1	0	13	f
1980	36	1	7	116102501007	ok	521	1404/03/24	لوله	2	1	0	13	f
1975	42	1	6	102104015001	test pvc - ok	5	1404/03/18	لوله	2	1	0	13	f
1981	36	1	6	116102501007	ok	521	1404/03/25	لوله	2	1	0	13	f
1982	36	1	5	114102015233	ok	9	1404/03/27	لوله	1	1	0	13	f
1997	44	3	3	102106319003		5	1404/03/19	لوله	3	1	0	17	t
1998	44	3	4	101109030006		1	1404/03/19	لوله	6	1	0	17	t
2004	45	2	4	101109030006		1	1404/03/20	لوله	7	1	0	17	t
2009	44	3	4	117500757121		3	1404/03/24	لوله	5	1	0	17	t
2011	40	2	3	101106330004		1	1404/03/24	لوله	3	16	2	17	t
2017	36	2	5	114102015233		9	1404/03/19	لوله	14	1	0	13	t
2019	42	1	5	1341020151755		9	1404/03/20	لوله	10	1	0	13	t
2014	36	2	6	102104015001		4	1404/03/21	لوله	4	1	0	13	t
1983	36	1	7	114102515040	not ok	9	1404/03/27	لوله	2	1	0	13	f
1988	40	1	2	101111032007		1	1404/03/19	لوله	1	1	0	17	t
2005	45	2	3	101106330004		1	1404/03/20	لوله	7	1	0	17	t
2013	40	2	4	117500757121		3	1404/03/24	لوله	3	16	1	17	t
2018	42	1	7	114102015233		9	1404/03/20	لوله	10	1	0	13	t
1984	42	2	7	114102515046	not ok	9	1404/03/27	لوله	2	1	0	13	f
2012	40	2	4	101107530005		1	1404/03/24	لوله	1	16	1	17	t
2020	36	2	5	114102015233		9	1404/03/20	لوله	6	1	0	13	t
1985	42	2	7	114102515040	not ok	9	1404/03/27	لوله	2	1	0	13	f
1989	40	1	3	102106319003		5	1404/03/19	لوله	3	16	1	17	t
1990	40	1	3	102106319003		5	1404/03/19	لوله	1	1	0	17	t
1991	40	1	4	101109030006		1	1404/03/19	لوله	5	16	2	17	t
1999	40	1	2	101111032007		1	1404/03/20	لوله	12	1	0	17	t
2008	44	3	3	101106330004		1	1404/03/24	لوله	5	1	0	17	t
2016	36	2	7	114102015233		9	1404/03/19	لوله	14	1	0	13	t
1986	42	2	7	114102515046	not ok	9	1404/03/27	لوله	2	1	0	13	f
1995	45	2	7	101109030006		1	1404/03/19	لوله	4	1	0	17	t
2000	40	1	3	102106319003		5	1404/03/20	لوله	6	1	0	17	t
2001	40	1	4	101109030006		1	1404/03/20	لوله	9	1	0	17	t
2006	45	2	4	101107530005		1	1404/03/20	لوله	4	1	0	17	t
1987	40	1	2	101111032007		1	1404/03/19	لوله	4	16	1	17	t
1996	44	3	2	101111032007		1	1404/03/19	لوله	7	1	0	17	t
2003	45	2	3	102106319003		5	1404/03/20	لوله	3	1	0	17	t
2007	44	3	2	101111032007		1	1404/03/20	لوله	5	1	0	17	t
1992	40	1	4	101109030006		1	1404/03/19	لوله	1	1	0	17	t
1994	45	2	3	102106319003		5	1404/03/19	لوله	4	1	0	17	t
1993	45	2	4	101111032007		1	1404/03/19	لوله	1	1	0	17	t
2015	42	1	5	114102015233		9	1404/03/19	لوله	10	1	0	13	t
2002	45	2	2	101111032007		1	1404/03/20	لوله	19	1	0	17	t
2010	44	3	4	101111032007		1	1404/03/24	لوله	5	1	0	0	t
2021	36	2	6	102104015001		5	1404/03/20	لوله	3	1	0	13	t
2022	36	2	7	114102015233		9	1404/03/20	لوله	10	1	0	13	t
2023	42	1	6	102104015001		4	1404/03/21	لوله	10	1	0	13	t
2024	42	1	6	102104015001		4	1404/03/21	لوله	10	1	0	13	t
2025	44	3	5	114102015233		9	1404/03/21	لوله	10	1	0	13	t
2026	44	3	5	114102015233		9	1404/03/21	لوله	30	1	0	13	t
2027	42	1	7	114102015233		9	1404/03/22	لوله	10	1	0	13	t
2028	42	1	7	114102015233		9	1404/03/22	لوله	4	1	0	13	t
2029	45	2	7	114102015233		9	1404/03/22	لوله	4	1	0	13	t
2030	36	1	7	116102501007		521	1404/03/24	لوله	18	1	0	13	t
2031	36	1	5	114102015233		9	1404/03/24	لوله	7	1	0	13	t
2032	36	1	7	116102501007		525	1404/03/24	لوله	5	1	0	13	t
2033	45	1	2	101111032007	white	1	1404/03/25	لوله	8	1	0	17	t
2034	45	1	3	101106330004	white	1	1404/03/25	لوله	5	1	0	17	t
2035	45	1	4	117500757121		3	1404/03/25	لوله	3	1	0	17	t
2036	42	2	7	116102501007		525	1404/03/25	لوله	7	1	0	13	t
2037	42	2	6	116102501007		525	1404/03/25	لوله	8	1	0	13	t
2038	42	2	7	116102501007		525	1404/03/25	لوله	5	1	0	13	t
2039	42	2	5	114102015233		9	1404/03/25	لوله	3	1	0	13	t
2041	39	1	10	201204045015		1	1404/03/16	اتصالات	13	1	0	13	t
2042	39	1	22	200112545005		1	1404/03/17	اتصالات	12	1	0	13	t
1962	39	1	20	210600004037		2	1404/03/16	اتصالات	12	1	0	13	t
2040	39	1	20	210600004037		2	1404/03/16	اتصالات	13	1	0	13	t
2043	39	1	15	210111045008		2	1404/03/17	اتصالات	6	1	0	13	t
2044	39	1	15	210111045008		2	1404/03/17	اتصالات	12	1	0	13	t
2045	39	1	18	201709035022		1	1404/03/18	اتصالات	13	1	0	13	t
2046	39	1	12	200711000221		1	1404/03/18	اتصالات	12	1	0	13	t
2047	39	1	15	210111045008		2	1404/03/18	اتصالات	2	1	0	13	t
2048	39	1	23	211000000000		1	1404/03/19	اتصالات	4	1	0	13	t
2049	39	1	19	200306390035		1	1404/03/19	اتصالات	15	1	0	13	t
2050	45	1	4	101109030006		1	1404/03/25	لوله	4	1	0	17	t
2051	40	2	2	101111032007		1	1404/03/25	لوله	8	1	0	17	t
2052	40	2	3	101106330004		1	1404/03/25	لوله	6	14	1	17	t
2053	40	2	4	101109030006	white	1	1404/03/25	لوله	6	16	1	17	t
2054	40	2	2	101111032007		1	1404/03/25	لوله	8	1	0	17	t
2055	40	2	3	101106330004		1	1404/03/25	لوله	6	14	1	17	t
2059	45	1	4	101111032007	white	1	1404/03/26	لوله	5	1	0	0	t
2060	45	1	4	101112532008		1	1404/03/26	لوله	5	1	0	0	t
2061	40	2	2	101111032007	white	1	1404/03/26	لوله	3	1	0	17	t
2056	40	2	3	101109030006	white	1	1404/03/25	لوله	6	16	1	0	t
2057	45	1	3	101106330004	white	1	1404/03/26	لوله	6	1	0	17	t
2058	45	1	4	101112532008	white	1	1404/03/26	لوله	5	1	0	17	t
2062	40	2	2	101111032007		1	1404/03/26	لوله	2	1	0	17	t
2063	40	2	3	101106330004		1	1404/03/26	لوله	5	16	2	17	t
2064	40	2	4	101112532008		1	1404/03/26	لوله	7	16	1	17	t
2065	39	1	17	201204090033		14	1404/03/19	اتصالات	13	1	0	13	t
2066	39	1	15	210111045008		2	1404/03/19	اتصالات	12	1	0	13	t
2067	39	1	18	201700090050		1	1404/03/20	اتصالات	13	1	0	13	t
2068	44	3	2	101111032007		1	1404/03/26	لوله	7	1	0	17	t
2069	44	3	3	101106330004		1	1404/03/26	لوله	5	1	0	17	t
2070	44	3	4	101112532008		1	1404/03/26	لوله	5	1	0	17	t
2072	39	1	12	200711000221		1	1404/03/20	اتصالات	12	1	0	13	t
2073	39	1	22	200112545005		1	1404/03/21	اتصالات	12	1	0	13	t
2074	39	1	21	200106345213		1	1404/03/21	اتصالات	1	1	0	13	t
2075	39	1	12	200711000221		1	1404/03/22	اتصالات	10	1	0	13	t
2076	39	1	15	210111045008		2	1404/03/22	اتصالات	10	1	0	13	t
2077	39	1	19	200306390035		1	1404/03/22	اتصالات	13	1	0	13	t
2078	36	1	7	116102501007		521	1404/03/25	لوله	8	1	0	13	t
2079	36	1	6	116102501007		521	1404/03/25	لوله	8	1	0	13	t
2080	36	1	5	114102015233		9	1404/03/25	لوله	7	1	0	13	t
2081	42	2	7	116102501007		521	1404/03/26	لوله	7	1	0	13	t
2082	42	2	7	116102501007		521	1404/03/26	لوله	7	1	0	13	t
2083	42	2	6	116102501007		521	1404/03/26	لوله	7	1	0	13	t
2084	42	2	5	114102015233		9	1404/03/26	لوله	8	1	0	13	t
2085	36	1	7	116102501007		521	1404/03/26	لوله	10	1	0	13	t
2086	36	1	6	116102501007		521	1404/03/26	لوله	13	1	0	13	t
2088	36	1	5	1341020151755	black	8	1404/03/27	لوله	10	1	0	13	t
2087	36	1	5	114102015233		9	1404/03/26	لوله	5	1	0	13	t
2089	36	1	5	114102015233		9	1404/03/27	لوله	2	1	0	13	t
2090	42	2	5	114102015233		9	1404/03/27	لوله	5	1	0	13	t
2071	39	1	11	210809063120		1	1404/03/20	اتصالات	10	1	0	13	t
2091	42	2	6	116102501007		521	1404/03/27	لوله	9	1	0	13	t
2097	40	2	6	116102501007		521	1404/03/28	لوله	3	1	0	13	t
2092	42	2	7	114102515040		9	1404/03/27	لوله	7	1	0	13	t
2093	36	1	7	114102515040		9	1404/03/28	لوله	8	1	0	13	t
2094	42	2	1	1000000000		1	1404/03/27	لوله	1	1	0	13	t
2095	36	1	6	116102501007		521	1404/03/28	لوله	10	1	0	13	t
2096	36	1	5	114102015233		9	1404/03/28	لوله	10	1	0	13	t
2098	40	2	7	114102515040		9	1404/03/28	لوله	6	1	0	13	t
2101	39	3	13	200309090068		1	1404/03/24	اتصالات	12	1	0	13	t
2102	39	3	20	200311045058		1	1404/03/24	اتصالات	12	1	0	13	t
2103	34	1	12	200711000221		1	1404/03/25	اتصالات	12	1	0	13	t
2104	34	1	18	200306390035	تستی	1	1404/03/25	اتصالات	9	1	0	13	t
2105	39	3	14	201211090041		1	1404/03/25	اتصالات	12	1	0	13	t
2106	39	3	20	200311045058		1	1404/03/25	اتصالات	11	1	0	13	t
2107	39	3	12	200711000221		1	1404/03/25	اتصالات	5	1	0	13	t
2109	34	1	16	210111045203		1	1404/03/26	اتصالات	12	1	0	13	t
2111	39	3	11	210809063120		1	1404/03/26	اتصالات	13	1	0	13	t
2112	34	1	9	200106390216		1	1404/03/27	اتصالات	12	1	0	13	t
2108	34	1	15	210111045008	تستی	2	1404/03/26	اتصالات	13	1	0	13	t
2110	39	3	15	210111045008		2	1404/03/26	اتصالات	11	1	0	13	t
2113	34	1	18	200306390035		1	1404/03/27	اتصالات	9	1	0	13	t
2114	39	3	19	211700090051		1	1404/03/27	اتصالات	12	1	0	13	t
2115	39	3	15	210111045008		2	1404/03/27	اتصالات	11	1	0	13	t
2116	39	3	14	200111090013		1	1404/03/27	اتصالات	4	1	0	13	t
2117	39	3	22	210200110009		2	1404/03/28	اتصالات	13	1	0	13	t
2118	39	1	11	210809063120		1	1404/03/30	اتصالات	11	1	0	13	t
2119	39	1	15	210111045008		2	1404/03/30	اتصالات	11	1	0	13	t
2120	34	3	20	200311045058	تستی	1	1404/03/30	اتصالات	10	1	0	13	t
2099	34	1	16	210111045203		1	1404/03/24	اتصالات	12	1	0	13	t
2121	34	3	13	200309090068		1	1404/03/30	اتصالات	10	1	0	13	t
2122	39	1	20	200311045224		1	1404/03/31	اتصالات	10	1	0	13	t
2123	39	1	20	200311045224		1	1404/03/31	اتصالات	10	1	0	13	t
2124	39	1	12	200511087074		1	1404/03/31	اتصالات	9	1	0	13	t
2125	39	1	23	201509000026		1	1404/03/31	اتصالات	3	1	0	13	t
2126	34	3	21	200106345213		1	1404/03/31	اتصالات	12	1	0	13	t
2127	34	3	13	200309090068		1	1404/03/31	اتصالات	10	1	0	13	t
2129	39	1	15	210111045008		2	1404/04/01	اتصالات	11	1	0	13	t
2128	34	3	22	210200110009		2	1404/03/31	اتصالات	5	1	0	13	t
2130	39	1	16	210311045012		2	1404/04/01	اتصالات	12	1	0	13	t
2131	34	3	12	200511087074		1	1404/04/01	اتصالات	10	1	0	13	t
2132	34	3	9	200106390216		1	1404/04/01	اتصالات	10	1	0	13	t
2133	39	1	18	200411045050		1	1404/04/02	اتصالات	10	1	0	13	t
2134	42	1	6	114103215045		7	1404/04/16	لوله	11	1	0	13	t
2135	36	2	7	104102015006		7	1404/04/16	لوله	9	1	0	13	t
2136	36	2	5	1341020151755		8	1404/04/16	لوله	12	1	0	13	t
2137	36	2	6	114103215045		7	1404/04/16	لوله	2	1	0	13	t
2138	42	1	5	104102015006		7	1404/04/17	لوله	10	1	0	13	t
2139	42	1	7	104102015006		7	1404/04/17	لوله	18	1	0	13	t
2140	36	3	7	104102015006		7	1404/04/17	لوله	9	1	0	13	t
2141	36	3	5	1341020151755		8	1404/04/17	لوله	20	1	0	13	t
2142	42	3	6	116102501007		521	1404/03/28	لوله	5	1	0	13	t
2143	42	3	5	114102015233		9	1404/03/29	لوله	3	1	0	13	t
2144	42	1	7	114102515241		9	1404/03/30	لوله	2	1	0	13	t
2145	42	1	6	116102501007		521	1404/03/30	لوله	8	1	0	13	t
2146	42	1	5	114102015233		9	1404/04/30	لوله	7	1	0	13	t
2147	42	1	7	116102501007		521	1404/04/30	لوله	7	1	0	13	t
2148	36	2	5	114102015233		9	1404/04/30	لوله	10	1	0	13	t
2149	36	2	6	114102515241		9	1404/04/30	لوله	5	1	0	13	t
2150	36	2	7	116102501007		521	1404/04/30	لوله	10	1	0	13	t
2151	36	2	5	114102015233		9	1404/03/30	لوله	10	1	0	13	t
2152	36	2	6	114102515241		9	1404/03/30	لوله	5	1	0	13	t
2153	36	2	7	116102501007		521	1404/03/30	لوله	10	1	0	13	t
2154	36	2	6	116102501007		521	1404/03/30	لوله	3	1	0	13	t
2155	42	1	5	114102015233		9	1404/03/31	لوله	8	1	0	13	t
2156	42	1	7	116102501007		521	1404/03/31	لوله	9	1	0	13	t
2157	42	1	6	116102501007		521	1404/03/31	لوله	4	1	0	13	t
2158	36	2	5	114102015233		9	1404/03/31	لوله	7	1	0	13	t
2159	36	2	6	116102501007		521	1404/03/31	لوله	8	1	0	13	t
2160	36	2	7	116102501007		521	1404/03/31	لوله	7	1	0	13	t
2161	45	3	7	116102501007		521	1404/03/31	لوله	1	1	0	13	t
2162	45	3	6	116102501007		521	1404/03/31	لوله	2	1	0	13	t
2164	42	1	5	1341020151755		8	1404/04/01	لوله	3	1	0	13	t
2163	42	1	6	114102515040		9	1404/04/01	لوله	12	1	0	13	t
2165	36	2	5	1341020151755		8	1404/04/01	لوله	13	1	0	13	t
2166	36	2	6	114102515040		9	1404/04/01	لوله	6	1	0	13	t
2167	42	1	5	1341020151755		8	1404/04/01	لوله	7	7	1	13	t
2173	42	1	6	104102015006	 ok - تست استاب و cpe جواب داد	7	1404/04/16	لوله	2	1	0	13	f
2168	36	2	4	123107512261	ok	4	1404/04/07	لوله	2	1	0	13	f
2169	36	1	5	114102015233	TEST ?	9	1404/04/07	لوله	1	16	1	13	f
2172	36	1	7	104102015006	ok 	7	1404/04/11	لوله	1	1	0	13	f
2222	40	3	4	101111032007		523	1404/04/08	لوله	1	1	0	17	t
2171	42	2	5	114102015233	ok - رنگ لوله قرمز	9	1404/04/10	لوله	2	1	0	13	f
2170	42	2	7	104102015006	not ok - رنگی شدن لوله	7	1404/04/10	لوله	2	1	0	13	f
2174	39	1	20	200311045224		1	1404/04/02	اتصالات	10	1	0	13	t
2175	39	1	23	201509000026		1	1404/04/02	اتصالات	5	1	0	13	t
2176	34	3	21	200106345213		1	1404/04/02	اتصالات	12	1	0	13	t
2177	34	3	12	200511087074		1	1404/04/02	اتصالات	10	1	0	13	t
2178	39	1	22	211711035115		1	1404/04/03	اتصالات	11	1	0	13	t
2179	39	1	16	210311045012		2	1404/04/03	اتصالات	10	1	0	13	t
2180	39	1	15	210111045008		2	1404/04/03	اتصالات	8	1	0	13	t
2181	34	3	21	200106345213		1	1404/04/03	اتصالات	12	1	0	13	t
2182	34	3	9	200106390216		1	1404/04/03	اتصالات	10	1	0	13	t
2183	34	1	18	200409045048	تستی	1	1404/04/07	اتصالات	12	1	0	13	t
2184	39	3	11	200809063028		1	1404/04/07	اتصالات	10	1	0	13	t
2185	39	3	20	200109090229		1	1404/04/07	اتصالات	10	1	0	13	t
2186	34	1	14	201211090041		1	1404/04/08	اتصالات	11	1	0	13	t
2187	34	1	12	200411090064		1	1404/04/08	اتصالات	10	1	0	13	t
2188	34	1	21	200106345213		1	1404/04/08	اتصالات	6	1	0	13	t
2189	39	3	15	210111045008		2	1404/04/08	اتصالات	11	1	0	13	t
2190	39	3	22	210200110009		2	1404/04/08	اتصالات	12	1	0	13	t
2191	34	1	16	210311045012		2	1404/04/09	اتصالات	12	1	0	13	t
2192	34	1	18	200411045050		1	1404/04/09	اتصالات	12	1	0	13	t
2193	39	3	16	210311045012		2	1404/04/09	اتصالات	11	1	0	13	t
2194	39	3	9	200106390216		1	1404/04/09	اتصالات	6	1	0	13	t
2195	42	1	6	114102515040		9	1404/04/02	لوله	7	1	0	13	t
2196	36	2	6	1341020151755		8	1404/04/02	لوله	8	1	0	13	t
2197	36	2	7	114103215062		8	1404/04/02	لوله	11	16	2	13	t
2198	42	1	5	1341020151755		8	1404/04/03	لوله	10	1	0	13	t
2199	42	1	7	114103215062		8	1404/04/03	لوله	9	1	0	13	t
2200	42	1	7	114103215062		9	1404/04/03	لوله	11	1	0	13	t
2201	42	1	6	114100252064		9	1404/04/03	لوله	2	1	0	13	t
2202	36	2	5	1341020151755		8	1404/04/03	لوله	10	1	0	13	t
2203	36	2	5	1341020151755		8	1404/04/03	لوله	10	1	0	13	t
2204	36	2	7	114102515010		8	1404/04/03	لوله	10	1	0	13	t
2205	36	1	4	123107512261		4	1404/04/07	لوله	10	15	1	13	t
2206	42	2	5	114102015233		9	1404/04/07	لوله	11	1	0	13	t
2207	42	2	5	114102015233		9	1404/04/07	لوله	6	1	0	13	t
2208	36	1	5	114102015233	رنگ لوله قرمز	9	1404/04/08	لوله	22	1	0	13	t
2209	42	2	5	114102015233	رنگ لوله قرمز	1	1404/04/08	لوله	21	1	0	13	t
2210	36	1	2	1000000000		527	1404/04/09	لوله	13	1	0	13	t
2211	36	1	5	114102015233	رنگ لوله قرمز	9	1404/04/09	لوله	10	14	1	13	t
2219	40	2	4	116211015047		3	1404/04/17	لوله	8	11	3	17	t
2212	42	2	7	104120153001		9	1404/04/09	لوله	14	1	0	13	t
2213	36	1	7	104120153001		9	1404/04/10	لوله	9	13	3	13	t
2214	36	1	7	104102015006		7	1404/04/11	لوله	12	16	3	13	t
2215	42	1	7	104102015006		7	1404/04/16	لوله	11	1	0	13	t
2216	45	1	4	116211015047		3	1404/04/17	لوله	6	1	0	17	t
2217	45	1	3	101109030006		1	1404/04/17	لوله	7	1	0	17	t
2218	40	2	3	101109030006		1	1404/04/17	لوله	7	1	0	17	t
2220	44	3	4	116211015047		3	1404/04/17	لوله	14	1	0	17	t
2221	40	3	3	101106330004		1	1404/04/08	لوله	3	1	0	17	t
2223	40	3	4	101111032007		1	1404/04/08	لوله	6	16	2	17	t
2224	44	1	3	101106330004		1	1404/04/09	لوله	1	1	0	17	t
2225	44	1	4	101111032007	not ok	1	1404/04/09	لوله	2	1	0	17	f
2226	44	1	4	101111032007	not ok	1	1404/04/09	لوله	2	1	0	17	f
2227	44	1	4	101111032007		1	1404/04/09	لوله	8	1	0	17	t
2228	44	1	7	104120153001		9	1404/04/09	لوله	6	1	0	17	t
2229	44	1	7	104120153001	TEST?	9	1404/04/09	لوله	1	1	0	17	f
2230	44	1	3	123109067037	TEST?	6	1404/04/09	لوله	1	1	0	17	f
2233	34	1	21	200106345213		1	1404/04/10	اتصالات	14	1	0	13	t
2231	45	2	3	123109067037		6	1404/04/09	لوله	11	1	0	17	t
2232	45	2	4	101111032007		1	1404/04/09	لوله	6	1	0	17	t
2234	40	3	3	123109067037		6	1404/04/09	لوله	15	16	2	17	f
2235	40	3	4	101111032007		1	1404/04/09	لوله	4	14	1	17	t
2236	44	1	3	128007556034		6	1404/04/09	لوله	10	1	0	17	t
2237	44	1	4	101111032007	TEST?\n(بدون پی وکس)	1	1404/04/10	لوله	3	1	0	17	f
2238	45	2	4	101111032007		1	1404/04/10	لوله	7	1	0	17	t
2239	40	2	4	101111032007		1	1404/04/10	لوله	4	1	0	17	t
2240	45	1	4	101111032007	TEST?	1	1404/04/16	لوله	2	1	0	17	f
2262	44	1	7	114102015233		9	1404/04/08	لوله	1	1	0	17	t
2264	44	1	4	103111027005		523	1404/04/08	لوله	1	1	0	17	t
2270	40	1	3	101106330004		1	1404/03/30	لوله	9	1	0	17	t
2273	45	2	3	101106330004		1	1404/03/30	لوله	3	1	0	17	t
2283	40	1	1	111111110000		4	1404/04/01	لوله	4	16	2	17	t
2284	40	1	3	101106330004		1	1404/04/01	لوله	3	14	2	17	t
2295	36	1	6	114102515046	ok	7	1404/04/23	لوله	3	1	0	13	f
2241	45	1	8	118211015195	\n	13	1404/04/16	لوله	4	1	0	17	t
2242	44	3	4	117511015124		3	1404/04/16	لوله	3	1	0	17	t
2247	34	1	12	200411090064		1	1404/04/10	اتصالات	10	1	0	13	t
2249	39	3	15	210111045008		2	1404/04/10	اتصالات	7	1	0	13	t
2254	45	3	4	116216017059		3	1404/04/03	لوله	10	1	0	17	t
2268	45	2	7	114102002011		8	1404/04/07	لوله	4	1	0	17	t
2271	40	1	4	117511015124		3	1404/03/30	لوله	10	1	0	17	t
2275	44	1	2	101111032007		1	1404/03/31	لوله	5	1	0	17	t
2277	44	1	4	117511015124		3	1404/03/31	لوله	4	1	0	17	t
2243	34	1	12	200411090064		1	1404/04/10	اتصالات	10	1	0	13	t
2257	40	3	3	101106330004		1	1404/04/07	لوله	7	14	2	17	t
2266	45	2	3	101106330004		1	1404/04/08	لوله	2	1	0	17	t
2280	40	2	4	117516017144		3	1404/03/31	لوله	4	16	2	17	t
2286	45	3	3	101106330004		1	1404/04/01	لوله	7	1	0	17	t
2292	36	1	8	1341020151755	not ok - رنگ کم بود - لاجورد شامل 20g نارنجی و 50g زرد	7	1404/04/22	لوله	2	1	0	13	f
2244	45	3	3	101106330004		1	1404/04/02	لوله	8	1	0	17	t
2269	40	1	2	101111032007		1	1404/03/30	لوله	12	1	0	17	t
2279	40	2	3	101106330004		1	1404/03/31	لوله	5	1	0	17	t
2245	45	3	4	116216017059		3	1404/04/02	لوله	4	1	0	17	t
2246	44	1	3	101106330004		1	1404/04/03	لوله	5	1	0	17	t
2289	44	2	1	111111110000	not ok	4	1404/04/02	لوله	1	1	0	17	f
2248	39	3	20	200111090217		1	1404/04/10	اتصالات	9	1	0	13	t
2253	45	3	3	101106330004		1	1404/04/03	لوله	5	1	0	17	t
2256	45	2	3	101106330004		1	1404/04/07	لوله	8	1	0	17	t
2259	44	1	3	101106330004	White	1	1404/04/08	لوله	3	1	0	17	t
2261	44	1	4	103111027005		523	1404/04/08	لوله	3	1	0	17	t
2278	40	2	2	101111032007		1	1404/03/31	لوله	8	1	0	17	t
2282	45	3	3	101106330004		1	1404/03/31	لوله	8	1	0	17	t
2285	44	2	3	101106330004		1	1404/04/01	لوله	7	13	1	17	t
2291	36	1	7	104102015006	ok - cpe 3595	7	1404/04/21	لوله	2	1	0	13	f
2250	44	1	4	116216017059		3	1404/04/03	لوله	6	1	0	17	t
2251	40	2	3	101106330004		1	1404/04/03	لوله	4	1	0	17	t
2252	40	2	4	116216017059		3	1404/04/03	لوله	10	1	0	17	t
2258	44	1	3	101106330004		1	1404/04/08	لوله	2	1	0	17	t
2260	44	1	4	101111032007		1	1404/04/08	لوله	2	1	0	17	t
2263	44	1	7	104120153001		9	1404/04/08	لوله	1	1	0	17	t
2265	45	2	4	101111032007		523	1404/04/08	لوله	8	1	0	17	t
2267	44	1	7	114102002011		8	1404/04/07	لوله	4	1	0	17	t
2276	44	1	3	101106330004		1	1404/03/31	لوله	4	1	0	17	t
2281	45	3	2	101111032007		1	1404/03/31	لوله	7	1	0	17	t
2287	40	1	1	111111110000		4	1404/04/02	لوله	6	16	3	17	t
2288	40	1	3	101106330004		1	1404/04/02	لوله	3	14	1	17	t
2290	44	2	3	101106330004		1	1404/04/02	لوله	6	1	0	17	t
2255	44	1	3	101106330004		1	1404/04/07	لوله	3	1	0	17	t
2272	45	2	2	101111032007		1	1404/03/30	لوله	3	1	0	17	t
2274	45	2	3	117511012123		3	1404/03/30	لوله	3	1	0	0	t
2296	36	1	6	114103215083	TEST?	9	1404/04/24	لوله	3	1	0	13	f
2297	36	1	7	1341020151755	ok - 	8	1404/04/22	لوله	2	1	0	13	t
2298	36	2	5	1341020151755	ok -	8	1404/04/18	لوله	17	1	0	13	t
2299	36	2	7	104102015006	ok -	7	1404/04/18	لوله	12	1	0	13	t
2301	36	1	7	1341020151755	رنگ لوله زرد	8	1404/04/22	لوله	12	1	0	13	t
2302	36	1	7	1341020151755	رنگ لوله آبی	8	1404/04/21	لوله	20	1	0	13	t
2303	42	2	5	104102015006	رنگ لوله سفید	7	1404/04/21	لوله	1	1	0	13	t
2304	42	2	7	1341020151755	رنگ لوله زرد	8	1404/04/22	لوله	7	1	0	13	t
2305	42	2	8	118511014225	رنگ لایه میانی لوله نارنجی	2	1404/04/22	لوله	3	1	0	13	t
2306	42	2	8	118511014225	رنگ لایه میانی لوله نارنجی	2	1404/04/22	لوله	11	1	0	13	t
2307	42	2	6	114102515046		7	1404/04/23	لوله	5	1	0	13	t
2309	40	1	3	101109030006		1	1404/04/21	لوله	4	1	0	17	t
2308	40	1	2	101111032007		1	1404/04/21	لوله	6	16	2	17	t
2310	40	1	4	101112532008		1	1404/04/21	لوله	2	16	1	17	t
2311	44	2	2	101111032007		1	1404/04/21	لوله	6	11	4	17	t
2312	44	2	3	101109030006		1	1404/04/21	لوله	7	1	0	17	t
2313	44	2	4	101112532008		1	1404/04/21	لوله	6	1	0	17	t
2314	44	2	4	101112532008	TEST?	1	1404/04/21	لوله	1	1	0	17	f
2315	45	3	2	101111032007		1	1404/04/21	لوله	7	1	0	17	t
2316	45	3	3	101109030006		1	1404/04/21	لوله	7	1	0	17	t
2317	45	3	4	101112532008		1	1404/04/21	لوله	7	1	0	17	t
2318	44	1	2	101111032007		1	1404/04/22	لوله	7	1	0	17	t
2319	44	1	3	101109030006		1	1404/04/22	لوله	7	1	0	17	t
2320	44	1	4	101112532008		1	1404/04/22	لوله	7	1	0	17	t
2321	40	2	2	101111032007		1	1404/04/22	لوله	8	1	0	17	t
2322	40	2	3	101109030006		1	1404/04/22	لوله	3	1	0	17	t
2323	40	2	4	101112532008		1	1404/04/22	لوله	6	1	0	17	t
2324	45	3	3	101109030006		1	1404/04/22	لوله	2	1	0	17	t
2325	45	3	2	101111032007		1	1404/04/22	لوله	12	1	0	17	t
2326	45	3	3	101109030006		1	1404/04/22	لوله	4	1	0	17	t
2327	44	1	2	103111027005	White	4	1404/04/23	لوله	4	1	0	17	t
2328	44	1	2	103111027005	White	4	1404/04/23	لوله	8	1	0	17	t
2331	40	1	3	102111022005		5	1404/04/24	لوله	9	1	0	17	t
2330	40	1	2	101111032007		1	1404/04/24	لوله	12	1	0	17	t
2329	45	2	2	101111032007		1	1404/04/23	لوله	6	1	0	17	t
2332	45	2	2	101111032007		1	1404/04/24	لوله	7	1	0	17	t
2333	45	2	3	102111022005		5	1404/04/24	لوله	4	1	0	17	t
2334	45	3	8	118511013213		12	1404/04/22	لوله	1	1	0	17	t
2335	44	1	3	103109028004		4	1404/04/23	لوله	4	1	0	17	t
2336	44	1	8	118500756212		12	1404/04/23	لوله	3	1	0	17	t
2337	44	1	3	117511012123		3	1404/04/23	لوله	4	1	0	0	t
2338	44	1	3	117511012123		3	1404/04/23	لوله	4	1	0	0	t
2339	40	1	4	116316015254		3	1404/04/24	لوله	7	1	0	17	t
2340	40	1	8	118511013213		12	1404/04/24	لوله	2	1	0	17	t
2341	45	2	4	118316019199		3	1404/04/24	لوله	6	1	0	17	t
2342	44	3	4	117511015124		3	1404/04/18	لوله	15	1	0	17	t
2343	45	3	4	117511015124		3	1404/04/19	لوله	15	1	0	17	t
2344	44	1	8	118511014225		12	1404/04/22	لوله	4	1	0	17	t
2345	44	1	8	118511013213		1	1404/04/22	لوله	2	1	0	17	t
2346	40	2	8	118500756212		12	1404/04/22	لوله	2	11	3	17	t
2347	45	2	8	118511013213	رنگ لایه میانی آبی	12	1404/04/24	لوله	2	1	0	17	t
\.


--
-- Data for Name: operators; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.operators (id, name, father, sex, personal_id, marriage, education, major, part, type) FROM stdin;
2	علیرضا مجیدی	محمد مهدی	مرد	1210159511	f	دیپلم	سایر	میکس	اتصالات
3	مجید مخلصی	عباس	مرد	1219936911	f	سیکل	سایر	تولید	اتصالات
4	سید مهدی بهرامی	سید علی اکبر	مرد	65767896	f	دیپلم	انسانی	تولید	اتصالات
5	سید نصر اله  ساجد	سید عزیز اله	مرد	1220038555	f	سیکل	سایر	تولید	اتصالات
6	محمد علی بهمنی	سهراب	مرد	1210135442	f	سیکل	سایر	تولید	اتصالات
7	حسین زین الدینی	علی	مرد	1210160951	f	دیپلم	ساختمان	تولید	اتصالات
8	امید خوشنویسان	محمدرضا	مرد	1210158949	f	دیپلم	گرافیک کامپیوتر	میکس	اتصالات
9	امیرحسین حسنی	مهدی	مرد	1210147688	f	دیپلم	الکترونیک	تولید	اتصالات
37	محمدی		مرد		f				لوله
10	فرزاد پور محمدی	ولی اله	مرد	1210079798	f	لیسانس	سایر	تولید	اتصالات
11	امین مولایی	محمد	مرد	1210150476	f	لیسانس	مکانیک	تولید	اتصالات
12	علیرضا متقی	علی اکبر	مرد	1210171724	f	دیپلم	سایر	تولید	اتصالات
13	رضا حاجی وند	خلیل	مرد	1210166291	f	دیپلم	متالوژی	تولید	اتصالات
14	محمد شیبانی	قدرت اله	مرد	1210066602	f	لیسانس	تربیت بدنی	تولید	اتصالات
15	مجتبی بقایی	محمدرضا	مرد	1210148838	f	دیپلم	تجربی	کنترل کیفی	اتصالات
16	سید مهدی موسوی	سید محمد	مرد	1219462845	f	دیپلم	نقشه کشی	تولید	اتصالات
17	حمیدرضا مسلمی	محمد	مرد	1210018691	f	لیسانس	مکانیک	تولید	اتصالات
18	حسین سامانی	عباس	مرد	1219868231	f	سیکل	سایر	تولید	لوله
19	حسین سیاوشی	رضا	مرد	1210045575	f	دیپلم	سایر	میکس	لوله
20	محمد سروری	فرهاد	مرد	1210134373	f	دیپلم	سایر	تولید	لوله
21	ابوطالب زهری	هاشم	مرد	1219956945	f	سیکل	سایر	تولید	لوله
22	حسن ریاضت	حسین	مرد	1219878510	f	سیکل	سایر	تولید	لوله
23	محمود اکرمی	مرتضی	مرد	1219748684	f	سیکل	سایر	تولید	لوله
24	محمدرضا شهابی	حسینعلی	مرد	1219975222	f	دیپلم	سایر	تولید	لوله
25	سعید هوشمند	حسن	مرد	1219789712	f	سیکل	سایر	تولید	لوله
26	بهرام نوبخت	غلامرضا	مرد	1219100129	f	لیسانس	سایر	کنترل کیفی	لوله
28	ایمان فردوسی	علیرضا	مرد	1219939544	f	دیپلم	سایر	تولید	لوله
34	دانا		مرد		f				میکسر
40	هادی جمالی		مرد		f		سایر	میکس	میکسر
35	شفاعت		مرد		f				میکسر
36	مجیدی		مرد		f				میکسر
39	رضایی		مرد		f				میکسر
1	محمدحسین  بشار	محمدعلی	مرد	1219437328	f	دیپلم	سایر	تولید	اتصالات
44	جواد جمالی		مرد		f		سایر	لوله	میکسر
45	نکونام		مرد		f		سایر	لوله	میکسر
42	گوشه ای		مرد		f	دیپلم	سایر	میکسر	میکسر
41	منصور ساسانی		مرد		f		سایر	میکس	لوله
38	خوشنویسان		مرد		f				لوله
\.


--
-- Data for Name: pipeproduct; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pipeproduct (id, name, code, unit, usage, export, size, tickness, quality, length, weight, color, image, active) FROM stdin;
294	لوله استخری مشکی 1/9 * 20   800 گرم	128002019166	branch	استخری	f	20	1.9	درجه 1	5	0.8	مشکی	\N	t
295	لوله استخری مشکی 2/3 * 25   1200 گرم	128002523167	branch	استخری	f	25	2.3	درجه 1	5	1.2	مشکی	\N	t
296	لوله استخری 2/9 * 32   1900 گرم	128003229159	branch	استخری	f	32	2.9	درجه 1	5	1.9	مشکی	\N	t
297	لوله استخری مشکی 3 * 40   3200 گرم	128000403158	branch	استخری	f	40	3.0	درجه 1	5	3.2	مشکی	\N	t
298	لوله استخری مشکی 50 * 3/7	128005037001	branch	استخری	f	50	3.7	درجه 1	5	4.0	مشکی	\N	t
299	لوله استخری مشکی 63 * 4/7  وزن 6300	128006347002	branch	استخری	f	63	4.7	درجه 1	5	6.3	مشکی	\N	t
300	لوله استخری مشکی 75 *5/6 وزن 8800	128007556034	branch	استخری	f	75	5.6	درجه 1	5	8.8	مشکی	\N	t
301	لوله استخری مشکی 6/7 * 90	123109067037	branch	استخری	f	90	6.7	درجه 1	5	12.7	مشکی	\N	t
302	لوله استخری مشکی 6/6 * 110	128011066165	branch	استخری	f	110	6.6	درجه 1	5	15.5	مشکی	\N	t
303	لوله 2/7 - 110 آبرسانی	103111027005	branch	آبرسانی	f	110	2.7	درجه 1	6	8.2	طوسی	\N	t
304	لوله 2/8 - 90 آبرسانی	103109028004	branch	آبرسانی	f	90	2.8	درجه 1	6	6.85	طوسی	\N	t
305	لوله 2/5 - 63 آبرسانی	103106325003	branch	آبرسانی	f	63	2.5	درجه 1	6	4.3	طوسی	\N	t
306	لوله 2/4 - 50 آبرسانی	103105024002	branch	آبرسانی	f	50	2.4	درجه 1	6	3.25	طوسی	\N	t
307	لوله 2/4 - 40 آبرسانی	103104024001	branch	آبرسانی	f	40	2.4	درجه 1	6	2.6	طوسی	\N	t
310	لوله برقی 2 * 32 درجه2  1600 گرم	114103202203	branch	برقی	f	32	2.0	درجه 2	6	1.6	سفید	\N	t
311	لوله برقی 2 * 25 درجه2  1200 گرم	114102015202	branch	برقی	f	20	2.0	درجه 2	6	1.2	سفید	\N	t
314	لوله برقی خم سرد 1/5 - 32 (B21) رنگی	134103215173	branch	برقی	f	32	1.5	درجه 2	6	1.3	رنگی	\N	t
323	لوله برقی 1/5 * 32 درجه 3  1300 گرم	114103215083	branch	برقی	f	32	1.5	درجه 3	6	1.3	سفید	\N	t
324	لوله برقی 1/8 * 32 درجه 3 1500 گرم	114103218072	branch	برقی	f	32	1.8	درجه 3	6	1.5	سفید	\N	t
326	لوله برقی 2 * 20 درجه 3  1000 گرم	114100202069	branch	برقی	f	20	2.0	درجه 3	6	1.0	سفید	\N	t
327	لوله برقی 2 * 25 درجه 3   1200 گرم	114100252064	branch	برقی	f	25	2.0	درجه 3	6	1.2	سفید	\N	t
328	لوله برقی 1.5*32 درجه 2 1300 گرم	114103215062	branch	برقی	f	32	1.5	درجه 2	6	1.3	سفید	\N	t
329	لوله برقی خم سرد  1/5 * 32    1500 گرم	114103215054	branch	برقی	f	32	1.5	درجه 2	6	1.5	سفید	\N	t
330	لوله برقی 1/8 * 20 درجه 3   900 گرم	134102018047	branch	برقی	f	20	1.8	درجه 3	6	0.9	سفید	\N	t
331	لوله برقی 1/5 * 25 درجه 1  1000 گرم	114102515046	branch	برقی	f	25	1.5	درجه 1	6	1.0	سفید	\N	t
332	لوله برقی 1/5 * 32 درجه 1 1300 گرم	114103215045	branch	برقی	f	32	1.5	درجه 1	6	1.3	سفید	\N	t
333	لوله برقی 1/5 * 25 درجه 3    1000 گرم	114102515040	branch	برقی	f	25	1.5	درجه 3	6	1.0	سفید	\N	t
335	لوله برقی 1/5 * 20 درجه 3     880 گرم	104102015007	branch	برقی	f	20	1.5	درجه 3	6	0.88	سفید	\N	t
336	لوله برقی 1/5 * 20 درجه 1   800 گرم	104102015006	branch	برقی	f	20	1.5	درجه 1	6	0.8	سفید	\N	t
337	لوله برقی خم سرد 1/5 * 20    800 گرم	104102015004	branch	برقی	f	20	1.5	درجه 2	6	0.8	سفید	\N	t
309	لوله برقی 1/5 * 20 درجه2  750 گرم	114102015204	branch	برقی	f	20	1.5	درجه 2	6	0.75	سفید	\N	f
312	لوله برقی 2 * 20 درجه 2   950 گرم	114100202201	branch	برقی	f	2	2	درجه 2	6	0.95	سفید	\N	f
313	لوله برقی 1/5 * 20 درجه 3   700 گرم	114102015185	branch	برقی	f	20	1.5	درجه 3	6	0.7	سفید	\N	f
315	لوله برقی خم سرد 1/5 - 20 (B21) رنگی	134102015172	branch	برقی	f	32	1.5	درجه 2	6	0.8	رنگی	\N	f
316	لوله برقی خم سرد 1/5 - 25 (B21) رنگی	134102515171	branch	برقی	f	25	1.5	درجه 2	6	1.0	رنگی	\N	f
317	لوله برقی خم سرد نشکن 1/5 - 25 (A21) رنگی	134102515169	branch	برقی	f	25	1.5	درجه 1	6	1.0	رنگی	\N	f
318	لوله برقی  خم سرد نشکن 1/5 * 20  (A21 ) رنگی	134102015168	branch	برقی	f	20	1.5	درجه 1	6	0.8	رنگی	\N	f
319	لوله برقی 1/5 * 20 درجه 3   850 گرم	114102015155	branch	برقی	f	20	1.5	درجه 3	6	0.85	سفید	\N	f
320	لوله برقی 1/5 * 20 درجه 1 850 گرم	114102015127	branch	برقی	f	20	1.5	درجه 1	6	0.85	سفید	\N	f
321	لوله برقی 1/8 * 40 درجه 3   1900 گرم	114104018107	branch	برقی	f	40	1.8	درجه 3	6	1.9	سفید	\N	f
322	لوله برقی 1/3 * 20 درجه 2 730 گرم	114102017103	branch	برقی	f	20	1.7	درجه 2	6	0.73	سفید	\N	f
325	لوله برقی 1/5 * 20 درجه 3   830 گرم	114102015071	branch	برقی	f	20	1.5	درجه 3	6	0.83	سفید	\N	f
334	لوله برقی 1/5 * 25 درجه 2 1000 گرم	114102515010	branch	برقی	f	25	1.5	درجه 2	6	1.0	سفید	\N	t
340	لوله برقی با قابلیت خم سرد 1/5 - 32 (B21)	104203215006	branch	برقی	f	32	1.5	درجه 2	6	1.3	سفید	\N	f
341	لوله برقی با قابلیت خم سرد 1/5 - 25 (B21)	104202515005	branch	برقی	f	25	1.5	درجه 2	6	1.0	سفید	\N	f
338	لوله برقی 1.8*32 درجه 3  1500 گرم	104103218002	branch	برقی	f	32	1.8	درجه 3	6	1.5	سفید	\N	f
339	لوله برقی 1.5*20 درجه 3 800گرم	104120153001	branch	برقی	f	20	1.5	درجه 3	6	0.8	سفید	\N	t
346	لوله 3/4 * 110  سه لایه  فاضلابی	111111034164	branch	فاضلابی	f	110	3.4	درجه 1	6	10.5	طوسی	\N	t
347	لوله 3/2 * 63 سه لایه  فاضلابی	111106332163	branch	فاضلابی	f	63	3.2	درجه 1	6	5.4	طوسی	\N	t
348	لوله 3/2 * 90 سه لایه  فاضلابی	111109032162	branch	فاضلابی	f	90	3.2	درجه 1	6	7.8	طوسی	\N	t
349	لوله 3/4 * 125 سه لایه  فاضلابی	111112534161	branch	فاضلابی	f	125	3.4	درجه 1	6	11.7	طوسی	\N	t
350	لوله 4/9 * 250 فاضلابی	101125049154	branch	فاضلابی	f	250	4.0	درجه 1	6	34.0	طوسی	\N	t
351	لوله 4/7 * 110 فاضلابی	101111047126	branch	فاضلابی	f	110	4.0	درجه 1	6	14.0	طوسی	\N	t
352	لوله 4/7 * 125 فاضلابی	101112547125	branch	فاضلابی	f	125	4.0	درجه 1	6	16.0	طوسی	\N	t
353	لوله 3/8 * 160	101116038120	branch	فاضلابی	f	160	3.8	درجه 1	6	18.8	طوسی	\N	t
354	لوله 4 - 200 فاضلابی	101120040010	branch	فاضلابی	f	200	4.0	درجه 1	6	23.4	طوسی	\N	t
355	لوله 4 - 160 فاضلابی	101116040009	branch	فاضلابی	f	160	4.0	درجه 1	6	18.8	طوسی	\N	t
356	لوله 3/2 - 125 فاضلابی	101112532008	branch	فاضلابی	f	125	3.2	درجه 1	6	11.2	طوسی	\N	t
357	لوله 3/2 - 110 فاضلابی	101111032007	branch	فاضلابی	f	110	3.2	درجه 1	6	9.8	طوسی	\N	t
358	لوله 3 - 90 فاضلابی	101109030006	branch	فاضلابی	f	90	3.0	درجه 1	6	7.5	طوسی	\N	t
359	لوله 3 - 75 فاضلابی	101107530005	branch	فاضلابی	f	75	3.0	درجه 1	6	6.1	طوسی	\N	t
360	لوله 3 - 63 فاضلابی	101106330004	branch	فاضلابی	f	63	3.0	درجه 1	6	5.2	طوسی	\N	t
361	لوله 3 - 50 فاضلابی	101105030003	branch	فاضلابی	f	50	3.0	درجه 1	6	4.0	طوسی	\N	t
362	لوله 3 - 40 فاضلابی	101104030002	branch	فاضلابی	f	40	3.0	درجه 1	6	3.2	طوسی	\N	t
363	لوله 3 - 32 فاضلابی	101103230001	branch	فاضلابی	f	32	3.0	درجه 1	6	2.4	طوسی	\N	t
364	لوله 1/5 * 75 هواکشی 3 متری	102107515141	branch	هواکشی	f	75	1.5	درجه 1	3	1.55	طوسی	\N	t
365	لوله 1/5 * 75 هواکشی 9 متری	102107515139	branch	هواکشی	f	75	1.5	درجه 1	9	4.65	طوسی	\N	t
366	لوله 1/5 * 75 (شوکت) 3 متری	102107515030	branch	هواکشی	f	75	1.5	درجه 1	3	1.55	سفید	\N	t
367	لوله 1/8 - 75	102107518022	branch	هواکشی	f	75	1.8	درجه 1	6	3.7	طوسی	\N	t
368	لوله  3/2 - 160 هواکشی	102116032007	branch	هواکشی	f	160	3.2	درجه 1	6	15.0	طوسی	\N	t
369	لوله  2/5 - 125هواکشی	102112525006	branch	هواکشی	f	125	2.5	درجه 1	6	8.65	طوسی	\N	t
370	لوله  2/2 - 110 هواکشی	102111022005	branch	هواکشی	f	110	2.2	درجه 1	6	6.65	طوسی	\N	t
371	لوله  1/8 - 90 هواکشی	102109018004	branch	هواکشی	f	90	1.8	درجه 1	6	4.45	طوسی	\N	t
372	لوله  1/9 - 63 هواکشی	102106319003	branch	هواکشی	f	63	1.9	درجه 1	6	3.2	طوسی	\N	t
373	لوله  1/8 - 40 هواکشی	102104018002	branch	هواکشی	f	40	1.8	درجه 1	6	1.9	طوسی	\N	t
375	PIPE 25 Golsar pvc 0/580	118675580216	branch	برقی	t	25	\N	درجه 1	3	0.58	سفید	\N	t
376	PIPE 25*1/8 Neega  0/580	117902518178	branch	برقی	t	25	\N	درجه 1	3	0.58	سفید	\N	t
377	PIPE DELUXE 25  /58	116102501007	branch	برقی	t	25	\N	درجه 1	3	0.58	سفید	\N	t
378	PIPE 32 cm 2/800	118232280226	branch	برقی	t	32	\N	درجه 2	6	2.8	سفید	\N	t
379	PIPE 32*1/8 Neega  0/720	117903218179	branch	برقی	t	32	\N	درجه 1	3	0.72	سفید	\N	t
380	PIPE 32 DELUXE 2/8	116103228128	branch	برقی	t	32	\N	درجه 1	6	2.8	سفید	\N	t
381	PIPE 32 DELUXE 1/700	116132170113	branch	برقی	t	32	\N	درجه 1	6	1.7	سفید	\N	t
382	PIPE 32 DELUXE 1/750	116132175079	branch	برقی	t	32	\N	درجه 1	6	1.75	سفید	\N	t
383	PIPE 32 DELUXE 1/7	116103217032	branch	برقی	t	32	\N	درجه 1	6	1.7	سفید	\N	t
384	PIPE 50 ALMadeneh 4/5	118505045215	branch	فاضلابی	t	50	\N	درجه 1	6	4.5	سفید	\N	t
385	PIPE 50 Lave plast 4	118300504197	branch	فاضلابی	t	50	\N	درجه 2	6	4.0	سفید	\N	t
386	PIPE 50 CM  3/5	118205035196	branch	فاضلابی	t	50	\N	درجه 2	6	3.5	سفید	\N	t
387	صنع خصیصا للمحلات زمرد 4   PIPE 50	118100504193	branch	فاضلابی	t	50	\N	درجه 1	6	4.0	سفید	\N	t
388	PIPE 50 Smart Albadr 4	118000504184	branch	فاضلابی	t	50	\N	درجه 1	6	4.0	سفید	\N	t
389	PIPE 50 Mirnaw (3m) 2/5	117805025177	branch	فاضلابی	t	50	\N	درجه 2	3	2.5	سفید	\N	t
390	PIPE 50 RUSNAY 5	116200050150	branch	فاضلابی	t	50	\N	درجه 2	6	5.0	سفید	\N	t
391	PIPE 50 SADEH 2/9 M   1/450K	117750290147	branch	فاضلابی	t	50	\N	درجه 1	6	1.45	سفید	\N	t
392	PIPE 50 BURKAN 4/5	116305045146	branch	فاضلابی	t	50	\N	درجه 2	6	4.5	سفید	\N	t
393	2/5(PIPE 50 BURKAN (3m	117505025134	branch	فاضلابی	t	50	\N	درجه 2	6	2.5	سفید	\N	t
394	PIPE 50 Aseef 2/5	117405024119	branch	فاضلابی	t	50	\N	درجه 2	6	2.5	سفید	\N	t
395	PIPE 50 Aseef 3/6	117405036118	branch	فاضلابی	t	50	\N	درجه 2	6	3.6	سفید	\N	t
342	لوله برقی با قابلیت خم سرد 1/5 - 20 (B21)	104202015004	branch	برقی	f	20	1.5	درجه 2	6	0.8	سفید	\N	f
343	لوله برقی خم سرد نشکن 1/5 - 32 (A21) پلاس	104103215003	branch	برقی	f	32	1.5	درجه 1	6	1.3	سفید	\N	f
344	لوله برقی خم سرد نشکن 1/5 - 25 (A21) پلاس	104102515002	branch	برقی	f	25	1.5	درجه 1	6	1.0	سفید	\N	f
374	لوله 1/5 - 40 	102104015001	branch	هواکشی	f	40	1.5	درجه 1	6	1.6	طوسی	\N	t
396	PIPE 50 GOLDEN MAX 4/5	116405045110	branch	فاضلابی	t	50	\N	درجه 2	6	4.5	سفید	\N	t
397	PIPE 50 cm 4	111100504061	branch	فاضلابی	t	50	\N	درجه 2	6	4.0	سفید	\N	t
398	PIPE 50 ALSEEF 5	111100505044	branch	فاضلابی	t	50	\N	درجه 1	6	5.0	سفید	\N	t
399	PIPE 50 RUSNAY 4	116205006050	branch	فاضلابی	t	50	\N	درجه 2	6	4.0	سفید	\N	t
400	PIPE 75 cm Three Layers 8	118200758229	branch	فاضلابی	t	75	\N	درجه 2	6	8.0	سفید	\N	t
401	PIPE 75  GOLDEN MAX Three Layers 6/5	116407565224	branch	فاضلابی	t	75	\N	درجه 2	6	6.5	سفید	\N	t
402	PIPE 75 AL Madeneh THREE LAYERS 6	118500756212	branch	فاضلابی	t	75	\N	درجه 1	6	6.0	سفید	\N	t
403	PIPE 75 MASTORD Two Layer 7	118400757209	branch	فاضلابی	t	75	\N	درجه 2	6	7.0	سفید	\N	t
404	PIPE 75 MASTORD Three Layer 7	118400757207	branch	فاضلابی	t	75	\N	درجه 2	6	7.0	سفید	\N	t
405	PIPE 75 Lave plast 6	118300756200	branch	فاضلابی	t	75	\N	درجه 2	6	6.0	سفید	\N	t
406	صنع خصیصا للمحلات زمرد 7 PIPE 75 three Layers	118100757192	branch	فاضلابی	t	75	\N	درجه 1	6	7.0	سفید	\N	t
407	صنع خصیصا للمحلات زمرد 10 PIPE 75 three Layers	118107510191	branch	فاضلابی	t	75	\N	درجه 1	6	10.0	سفید	\N	t
408	صنع خصیصا للمحلات زمرد5 P16IPE 75 three Layers	118100755188	branch	فاضلابی	t	75	\N	درجه 1	6	5.0	سفید	\N	t
409	PIPE 75 Smart Albadr Three layers 7	118000757183	branch	فاضلابی	t	75	\N	درجه 1	6	7.0	سفید	\N	t
410	PIPE 75 BURKAN 5/5	116307555145	branch	فاضلابی	t	75	\N	درجه 2	6	5.5	سفید	\N	t
411	PIPE 75 AL AHRAM THREE LAYERS 7	117600075142	branch	فاضلابی	t	75	\N	درجه 1	6	7.0	سفید	\N	t
412	PIPE 75 ALSEYF THREE LAYERS 7K	117107507137	branch	فاضلابی	t	75	\N	درجه 1	6	7.0	سفید	\N	t
413	PIPE 75 rusnay three layers 6k	116207506136	branch	فاضلابی	t	75	\N	درجه 2	6	6.0	سفید	\N	t
414	3/5(PIPE 75 BURKAN( 3m	117507535133	branch	فاضلابی	t	75	\N	درجه 2	6	3.5	سفید	\N	t
415	PIPE 75 BURKAN 7	117500757121	branch	فاضلابی	t	75	\N	درجه 2	6	7.0	سفید	\N	t
416	PIPE 75 Aseef 4	117400754117	branch	فاضلابی	t	75	\N	درجه 2	6	4.0	سفید	\N	t
417	PIPE 75 Aseef 6	117400756116	branch	فاضلابی	t	75	\N	درجه 2	6	6.0	سفید	\N	t
418	PIPE 75 GOLDEN MAX THREE LAYERS 5/5	116407555098	branch	فاضلابی	t	75	\N	درجه 2	6	5.5	سفید	\N	t
419	PIPE 75 GOLDEN MAX THREE LAYERS 6	116400756091	branch	فاضلابی	t	75	\N	درجه 2	6	6.0	سفید	\N	t
420	PIPE 75 DELUXE THREE LAYERS 6	116100006082	branch	فاضلابی	t	75	\N	درجه 1	6	6.0	سفید	\N	t
421	PIPE 75 DELUXE THREE LAYERS 5	116100755078	branch	فاضلابی	t	75	\N	درجه 1	6	5.0	سفید	\N	t
422	PIPE 75 cmtwo Layers 6	111100075060	branch	فاضلابی	t	75	\N	درجه 2	6	6.0	سفید	\N	t
423	PIPE 75 CM three Layers 6	111100075059	branch	فاضلابی	t	75	\N	درجه 2	6	6.0	سفید	\N	t
424	PIPE 75 ALSEEF 6 three Layers	111100756043	branch	فاضلابی	t	75	\N	درجه 1	6	6.0	سفید	\N	t
425	PIPE 75 DELUXE THREE LAYERS 5/5	116107555031	branch	فاضلابی	t	75	\N	درجه 1	6	5.5	سفید	\N	t
426	PIPE 75 Burkan6	116307506056	branch	فاضلابی	t	75	\N	درجه 2	6	6.0	سفید	\N	t
427	PIPE 75 RUSNAY 6	116207506049	branch	فاضلابی	t	75	\N	درجه 2	6	6.0	سفید	\N	t
428	PIPE 90 BURKAN 7	116300907160	branch	فاضلابی	t	90	\N	درجه 2	6	7.0	سفید	\N	t
429	PIPE 110 cm Three Layers 17	118211017228	branch	فاضلابی	t	110	\N	درجه 2	6	17.0	سفید	\N	t
431	PIPE 110 Golsar Pvc Three Layers 12	118611012221	branch	فاضلابی	t	110	\N	درجه 1	6	12.0	سفید	\N	t
432	PIPE 110 cm two Layers 15	118211015220	branch	فاضلابی	t	110	\N	درجه 2	6	15.0	سفید	\N	t
433	PIPE 110 BURKAN Tow Layers 12	116311012218	branch	فاضلابی	t	110	\N	درجه 2	6	12.0	سفید	\N	t
434	PIPE 110 BURKAN Tow Layers 15	116311015217	branch	فاضلابی	t	110	\N	درجه 2	6	15.0	سفید	\N	t
435	PIPE 110 AL Madeneh THREE LAYERS 10	118511010214	branch	فاضلابی	t	110	\N	درجه 1	6	10.0	سفید	\N	t
436	PIPE 110 AL Madeneh THREE LAYERS 13	118511013213	branch	فاضلابی	t	110	\N	درجه 1	6	13.0	سفید	\N	t
437	PIPE 110 AL Madeneh THREE LAYERS 15	118511015211	branch	فاضلابی	t	110	\N	درجه 1	6	15.0	سفید	\N	t
438	PIPE 110 MASTORD Two Layer15	118411015208	branch	فاضلابی	t	110	\N	درجه 2	6	15.0	سفید	\N	t
439	PIPE 110 MASTORD Three Layer14	118411014206	branch	فاضلابی	t	110	\N	درجه 2	6	14.0	سفید	\N	t
440	PIPE 110 Lave plast 11	118311011198	branch	فاضلابی	t	110	\N	درجه 2	6	11.0	سفید	\N	t
441	PIPE 110 CM three Layers 15	118211015195	branch	فاضلابی	t	110	\N	درجه 2	6	15.0	سفید	\N	t
442	صنع خصیصا للمحلات زمرد 12 PIPE 110 three Layers	118111012190	branch	فاضلابی	t	110	\N	درجه 1	6	12.0	سفید	\N	t
443	صنع خصیصا للمحلات زمرد 17 PIPE 110 three Layers	118111017189	branch	فاضلابی	t	110	\N	درجه 1	6	17.0	سفید	\N	t
444	صنع خصیصا للمحلات زمرد 15 PIPE 110 three Layers	118111015187	branch	فاضلابی	t	110	\N	درجه 1	6	15.0	سفید	\N	t
445	14 PIPE 110 Smart Albadr Three Layer	118011014182	branch	فاضلابی	t	110	\N	درجه 1	6	14.0	سفید	\N	t
446	PIPE 110 Aseef 12	117411012181	branch	فاضلابی	t	110	\N	درجه 2	6	12.0	سفید	\N	t
447	PIPE 110 Sadeh 14	117711014180	branch	فاضلابی	t	110	\N	درجه 1	6	14.0	سفید	\N	t
448	PIPE 110 Mirnaw (3m) 6	117801106176	branch	فاضلابی	t	110	\N	درجه 2	3	6.0	سفید	\N	t
449	PIPE 110 ALSeeF ECO TREE LAYERS 12	117111012153	branch	فاضلابی	t	110	\N	درجه 2	6	12.0	سفید	\N	t
450	PIPE 110  ALSeef ECO TREE LAYERS 14	117111014152	branch	فاضلابی	t	110	\N	درجه 2	6	14.0	سفید	\N	t
451	6(PIPE 110 BURKAN( 3m	117501106132	branch	فاضلابی	t	110	\N	درجه 2	6	6.0	سفید	\N	t
452	PIPE 110 AL AHRAM THREE LAYERS 12	117611012129	branch	فاضلابی	t	110	\N	درجه 1	6	12.0	سفید	\N	t
453	PIPE 110 BURKAN 15	117511015124	branch	فاضلابی	t	110	\N	درجه 2	6	15.0	سفید	\N	t
454	PIPE 110 BURKAN 12	117511012123	branch	فاضلابی	t	110	\N	درجه 2	6	12.0	سفید	\N	t
455	PIPE 110 Aseef 10	117411010115	branch	فاضلابی	t	110	\N	درجه 2	6	10.0	سفید	\N	t
456	PIPE 110 Aseef 14	117411014114	branch	فاضلابی	t	110	\N	درجه 2	6	14.0	سفید	\N	t
457	PIPE 110 GOLDEN MAX THREE LAYERS 14	116411014090	branch	فاضلابی	t	110	\N	درجه 2	6	14.0	سفید	\N	t
458	PIPE 110 DELUXE THREE LAYERS 10/200	116111010077	branch	فاضلابی	t	110	\N	درجه 1	6	10.2	سفید	\N	t
459	PIPE 110 cmtwo Layers 10	111111010058	branch	فاضلابی	t	110	\N	درجه 2	6	10.0	سفید	\N	t
460	PIPE 110 cm three Layers 14	111111014056	branch	فاضلابی	t	110	\N	درجه 2	6	14.0	سفید	\N	t
461	PIPE 110 ALSEEF 12 three Layers	111111012042	branch	فاضلابی	t	110	\N	درجه 1	6	12.0	سفید	\N	t
462	PIPE 110 DELUXE THREE LAYERS12	116111012015	branch	فاضلابی	t	110	\N	درجه 1	6	12.0	سفید	\N	t
463	PIPE 110 RUSNAY 10	116211010060	branch	فاضلابی	t	110	\N	درجه 2	6	10.0	سفید	\N	t
464	PIPE 110 BURKAN 10	116311010053	branch	فاضلابی	t	110	\N	درجه 2	6	10.0	سفید	\N	t
465	PIPE 110 RUSNAY 12	116211012048	branch	فاضلابی	t	110	\N	درجه 2	6	12.0	سفید	\N	t
466	PIPE 110 RUSNAY 15	116211015047	branch	فاضلابی	t	110	\N	درجه 2	6	15.0	سفید	\N	t
467	PIPE 160 Lave plast 19	118316019199	branch	فاضلابی	t	160	\N	درجه 2	6	19.0	سفید	\N	t
468	PIPE 160 CM three Layers 21	118216021194	branch	فاضلابی	t	160	\N	درجه 2	6	21.0	سفید	\N	t
469	صنع خصیصا للمحلات زمرد 17 PIPE 160 three Layers	118116017186	branch	فاضلابی	t	160	\N	درجه 1	6	17.0	سفید	\N	t
470	PIPE 160 Mirnaw (3m) 10	117816010175	branch	فاضلابی	t	160	\N	درجه 2	3	10.0	سفید	\N	t
471	PIPE 160 GOLDEN MAX 30	116416030157	branch	فاضلابی	t	160	\N	درجه 2	6	30.0	سفید	\N	t
472	PIPE 160 BURKAN 17	117516017144	branch	فاضلابی	t	160	\N	درجه 2	6	17.0	سفید	\N	t
473	PIPE 160 GOLDENMAX 18/8	106416018138	branch	فاضلابی	t	160	\N	درجه 2	6	18.8	سفید	\N	t
475	11(PIPE 160 BURKAN( 3m	117516011131	branch	فاضلابی	t	160	\N	درجه 2	6	11.0	سفید	\N	t
476	PIPE 160 GOLDEN MAX THREE LAYERS 20	116416020093	branch	فاضلابی	t	160	\N	درجه 2	6	20.0	سفید	\N	t
477	PIPE 160 RUSNAY 21	116216021065	branch	فاضلابی	t	160	\N	درجه 2	6	21.0	سفید	\N	t
478	PIPE 160 RUSNAY 17	116216017059	branch	فاضلابی	t	160	\N	درجه 2	6	17.0	سفید	\N	t
479	PIPE 160 RUSNAY 15	116216015046	branch	فاضلابی	t	160	\N	درجه 2	6	15.0	سفید	\N	t
480	PIPE 200  RUSNAY 25	116220025231	branch	فاضلابی	t	200	\N	درجه 2	6	25.0	سفید	\N	t
481	PIPE 200 BURKAN 25	116320025227	branch	فاضلابی	t	200	\N	درجه 2	6	25.0	سفید	\N	t
482	PIPE 200 RUSNAY 20	116220020223	branch	فاضلابی	t	200	\N	درجه 2	6	20.0	سفید	\N	t
483	PIPE 200 CM 27	118220027219	branch	فاضلابی	t	200	\N	درجه 2	6	27.0	سفید	\N	t
484	PIPE 200 Lave plast 23	118320023205	branch	فاضلابی	t	200	\N	درجه 2	6	23.0	سفید	\N	t
485	PIPE 200 Mirnaw (3m) 14	117820014174	branch	فاضلابی	t	200	\N	درجه 2	3	14.0	سفید	\N	t
486	PIPE 200  RUSNAY 24	116220024143	branch	فاضلابی	t	200	\N	درجه 2	6	24.0	سفید	\N	t
487	15(PIPE 200 BURKAN (3m	117520015130	branch	فاضلابی	t	200	\N	درجه 2	6	15.0	سفید	\N	t
488	PIPE 200 RUSNAY 27	116220027095	branch	فاضلابی	t	200	\N	درجه 2	6	27.0	سفید	\N	t
489	PIPE 200 RUSNAY 22	116220022009	branch	فاضلابی	t	200	\N	درجه 2	6	22.0	سفید	\N	t
490	PIPE 90 BURKAN 8	116300908235	branch	فاضلابی	t	90	\N	درجه 2	6	8.0	سفید	\N	t
491	    PIPE 63 BURKAN 7	116300636236	branch	فاضلابی	t	63	\N	درجه 2	6	6.0	سفید	\N	t
474	PIPE 160 GOLDENMAX 21	106416021135	branch	فاضلابی	t	160	\N	درجه 2	6	21.0	مشکی	\N	t
493	لوله برقی پلاس1.5*25	114102515241	لوله	برقی	f	25	1.5	درجه 2	6	1	سفید		t
492	لوله برقی درجه 2.5 پلاس1.5*20	114102015233	لوله	برقی	f	20	1.5	درجه 3	6	0.8	سفید		t
308	لوله برقی 1/5 * 20 درجه 3   750 گرم	114102015210	branch	برقی	f	20	1.5	درجه 3	6	0.75	سفید	\N	f
345	لوله برقی خم سرد نشکن 1/5 - 20 (A21) پلاس	104102015001	branch	برقی	f	20	1.5	درجه 1	6	0.8	سفید	\N	f
495	pipe 110 SDO three layers 7/5 (3m)	118700110249	branch	فاضلابی	t	110	1	درجه 2	3	7.5	سفید		t
498	pipe 110 SDO three layers 5 (2m)	118700110246	branch	فاضلابی	t	110	1	درجه 2	2	5	سفید		t
502	pipe 160 SDO three layers 17	118700160242	branch	فاضلابی	t	160	1	درجه 2	6	17	سفید		t
496	pipe 160 SDO three layers 8/5 (3m)	118700160248	branch	فاضلابی	t	160	1	درجه 2	3	8.5	سفید		t
497	pipe 75 SDO three layers 2 (2m)	118700075247	branch	فاضلابی	t	75	1	درجه 2	2	2	سفید		t
499	pipe 160 SDO three layers 5/5 (2m)	118700050245	branch	فاضلابی	t	160	1	درجه 2	2	5.5	سفید		t
500	pipe 75 SDO three layers 6	118700075244	branch	فاضلابی	t	75	1	درجه 2	6	6	سفید		t
501	pipe 110 SDO three layers 15	118700110243	branch	فاضلابی	t	110	1	درجه 2	6	15	سفید		t
494	pipe 75 SDO three layers 3 (3m)	118700075250	branch	فاضلابی	t	75	1	درجه 2	3	3	سفید		t
503	لوله برقی 1/5 * 20 درجه 2 800 گرم	1341020151755	branch	برقی	f	20	1.5	درجه 2\t	6	0.8	سفید		t
504	pipe 200 SDO 12 (3m)	000000000001	branch	فاضلابی	t	200	1	درجه 2	3	12	سفید		t
430	PIPE 110 AL Madeneh THREE LAYERS 14	118511014225	branch	فاضلابی	t	110	\N	درجه 1	6	14.0	سفید	\N	t
506	PIPE 110 Salam 6 (3m)	118800110253	branch	فاضلابی	t	110	1	درجه 2	3	6	سفید		t
507	PIPE 160 Salam 9 (3m)	118800160252	branch	فاضلابی	t	160	1	درجه 2	3	9	سفید		t
508	PIPE 200 Salam 12 (3m)	118800200251	branch	فاضلابی	t	200	1	درجه 2	3	12	سفید		t
505	PIPE 160 BURKAN 15	116316015254	branch	فاضلابی	t	160	1	درجه 2	6	15	سفید		t
509	PIPE 32 AL Madeneh  1.5	118503215238	branch	برقی	t	32	1	درجه 1	6	1.5	سفید		t
511	خط زن	1000000000	branch\t		f	1	1	1	1	1	1		t
512	PIPE 110 TARGET Three Layers 15	110000000000	branch	فاضلابی	t	110	1	درجه 2	6	15	سفید		t
510	PIPE 110 TARGET Three Layers 14	118911014256	branch	فاضلابی	t	110	1	درجه 1	6	14	سفید		t
514	PIPE 160 TARGET Three Layers 22	111100000000	branch	فاضلابی	t	160	1	درجه 2	6	22	سفید		t
513	لوله 6.2 - 315 فاضلابی	111000000000	branch	آبرسانی	f	315	6.2	درجه 1	6	5.2	طوسی		t
516	PIPE 25*1/8 CM 0/580	111110000000	branch	برقی	t	25	1.8	درجه 1	3	0.58	سفید		t
517	PIPE 75 Salam 3.5 (3m)	111111000000	branch	فاضلابی	t	75	1	درجه 2	3	3.5	سفید		t
518	لوله 1.5*40 برقی 	114104015260	لوله	لوله	f	40	1.5	درجه 1	6	1.6	سفید		t
519	لوله 75 آبرسانی 12 متری (10 کیلو)	123107512261	لوله	استخری	f	75	1	درجه 2	12	10	مشکی		t
520	لوله برقی 2 * 20 درجه 2 1000 گرم	114102002011	لوله	برقی	f	20	2	درجه 2	6	1	سفید		t
521	لوله 7.9 - 400 آبرسانی	111111110000	لوله	آبرسانی	f	400	7.9	درجه 1	6	88	طوسی		t
\.


--
-- Data for Name: rawmaterials; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rawmaterials (id, rawmaterial, company, price, confirm) FROM stdin;
119	PVC	اروند جامبو S6532	0	t
121	PVC	بندر امام جامبو S6532	0	t
122	PVC	بندر امام کیسه S6532	0	t
123	PVC	غدیر جامبو S6532	0	t
157	دوده	مختاری	0	t
161	Impact 2	نانو 2325 - آریا پلیمر پیشگام	0	f
162	ضایعات آسیابی	خرد شده	0	t
163	ضایعات آسیابی	پودر شده	0	t
138	Stub	اتصالات GH142 - کیمیاران	0	t
159	Impact 3	HG60 - پلیمر پیشرفته دانا	0	t
146	Titan	A1 - آروین صنعت سرمد	0	t
153	paraffin	-------	0	f
125	PVC	آبادان کیسه S6532	0	f
164	Stub	ROSHA - P220	0	t
127	PVC	بندر امام کیسه S60	0	f
128	PVC	آبادان S57	0	f
129	PVC	کامپاند	0	t
130	PVC	اروند آف 1 (HO SPEC)	0	t
131	PVC	بندر آف 1 (HO SPEC)	0	f
133	PVC	آف 2 (HO SPEC)	0	f
136	کربنات کلسیم	IMC99 - شرکت آرمان پودر لرستان	0	t
137	Stub	 لوله GH151 - کیمیاران	0	t
142	Stub	4617 - همپار با سرب (لوله)	0	f
143	Stub	PCZS720  - پاک شیمی (لوله)	0	f
145	Stub	FPI/7 4900 - همپار بدون سرب (لوله)	0	f
151	CPE	CPE RIKE - cpe-s (لوله)	0	f
152	PE WAX	A100 - رستا پلیمر نقش جهان	0	t
154	Acid	1842 - آروین صنعت سرمد(Zanyu china)	0	t
155	White	R406 - کیمیاران	0	t
120	PVC	اروند کیسه S6532	0	t
126	PVC	اروند کیسه S60	0	f
132	PVC	غدیر آف 1 (HO SPEC)	0	f
134	کربنات کلسیم	IMC-66 - شرکت آرمان پودر لرستان	0	t
135	کربنات کلسیم	APL12 - شرکت آرمان پودر لرستان	0	t
149	CPE	sundow - IM888 - آروین صنعت سرمد	0	t
124	PVC	غدیر کیسه S6532	0	t
140	Stub	PFI/1 1828 - همپار بدون سرب (اتصالات)	0	f
141	Stub	1831 - همپار بدون سرب (اتصالات)	0	f
160	Impact 1	HL530 - پلیمر پیشرفته دانا	0	t
158	Impact 1	HL90 - پلیمر پیشرفته دانا	0	t
139	Stub	اتصالات FL100 - روشا پلیمر 	0	t
147	Titan	R996 - بازرگانی دریا(Billions)	0	t
144	Stub	FTP/10  5191 - همپار با سرب (لوله)	0	f
148	Titan	کرونوس - آروین صنعت سرمد	0	f
150	CPE	sundow - IM888 - چوب پلاست هنر و صنعت راش	0	f
156	White	R406 - رستا پلیمر	0	f
\.


--
-- Data for Name: recipes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.recipes (id, weight, material_id, rawmaterial_id, mixentries_id) FROM stdin;
8762	0	16	119	\N
8763	0	16	121	\N
8764	0	16	122	\N
8765	0	16	123	\N
8766	0	16	157	\N
8767	0	16	161	\N
8768	0	16	162	\N
8769	0	16	163	\N
8770	0	16	138	\N
8771	0	16	159	\N
8772	0	16	125	\N
8773	0	16	127	\N
8774	0	16	128	\N
8775	0	16	129	\N
8776	0	16	130	\N
8777	0	16	131	\N
8778	0	16	133	\N
8779	0	16	136	\N
8780	0	16	137	\N
8781	0	16	142	\N
8782	0	16	143	\N
8783	0	16	145	\N
8784	0	16	146	\N
8785	0	16	151	\N
8786	0	16	152	\N
8787	0	16	153	\N
8788	0	16	154	\N
8789	0	16	155	\N
8790	0	16	120	\N
8791	0	16	126	\N
8792	0	16	132	\N
8793	0	16	134	\N
8794	0	16	135	\N
8795	0	16	149	\N
8796	0	16	124	\N
8797	0	16	140	\N
8798	0	16	141	\N
8799	0	16	160	\N
8800	0	16	158	\N
8801	0	16	139	\N
8802	0	16	144	\N
8803	0	16	147	\N
8804	0	16	148	\N
8805	0	16	150	\N
8806	0	16	156	\N
8808	8	1	136	1263
8809	3.5	1	139	1263
8811	0.1	1	155	1263
8812	0.004	1	157	1263
8813	1.8	1	158	1263
8814	0.5	1	159	1263
8815	15	1	162	1263
8816	75	1	119	1265
8817	8	1	136	1265
8818	3.2	1	139	1265
8820	0.1	1	155	1265
8821	0.004	1	157	1265
8822	1.8	1	158	1265
8823	0.5	1	159	1265
8824	15	1	162	1265
8825	75	1	119	1266
8826	8	1	136	1266
8827	3.5	1	139	1266
8829	0.1	1	155	1266
8830	0.004	1	157	1266
8831	1.8	1	158	1266
8832	0.5	1	159	1266
8833	15	1	162	1266
8834	40	3	119	1267
8835	60	3	135	1267
8836	1.8	3	137	1267
8838	1.5	3	149	1267
8839	0.3	3	152	1267
8840	0.3	3	154	1267
8841	0.08	3	157	1267
8842	25	3	162	1267
8843	40	3	119	1268
8844	60	3	135	1268
8845	1.8	3	137	1268
8847	1.5	3	149	1268
8848	0.3	3	152	1268
8849	0.3	3	154	1268
8850	0.08	3	157	1268
8851	15	3	162	1268
8852	75	1	119	1269
8853	8	1	136	1269
8854	3.5	1	139	1269
8856	0.1	1	155	1269
8857	0.004	1	157	1269
8858	1.8	1	158	1269
8859	0.5	1	159	1269
8860	15	1	162	1269
8863	40	3	119	1272
8864	60	3	135	1272
8865	1.3	3	137	1272
8867	1.5	3	149	1272
8868	0.3	3	152	1272
8869	0.3	3	154	1272
8870	0.08	3	157	1272
8871	15	3	162	1272
8872	40	3	119	1273
8873	60	3	135	1273
8874	1.3	3	137	1273
8876	1.5	3	149	1273
8877	0.3	3	152	1273
8878	0.3	3	154	1273
8879	0.08	3	157	1273
8880	15	3	162	1273
8881	40	3	119	1274
8882	60	3	134	1274
8883	1.3	3	137	1274
8884	0.1	3	146	1274
8885	1.5	3	149	1274
8886	0.3	3	152	1274
8887	0.3	3	154	1274
8888	0.08	3	157	1274
8889	15	3	162	1274
8890	40	3	119	1275
8891	60	3	135	1275
8892	1.8	3	137	1275
8894	1.5	3	149	1275
8895	0.3	3	152	1275
8896	0.3	3	154	1275
8897	0.08	3	157	1275
8898	30	3	162	1275
8899	40	3	119	1276
8900	60	3	135	1276
8901	1.8	3	137	1276
8903	1.5	3	149	1276
8904	0.3	3	152	1276
8905	0.3	3	154	1276
8837	0.1	3	146	1267
8846	1.5	3	146	1268
8866	0.1	3	146	1272
8875	0.1	3	146	1273
8893	0.1	3	146	1275
8902	0.1	3	146	1276
8855	0.22	1	146	1269
8819	0.22	1	146	1265
8810	0.22	1	146	1263
8906	0.08	3	157	1276
8908	40	3	119	1277
8910	1.3	3	137	1277
8912	1.5	3	149	1277
8914	0.3	3	154	1277
8916	15	3	162	1277
14746	60	9	119	2020
14748	2.2	9	137	2020
14750	3	9	149	2020
14752	0.05	9	155	2020
14863	90	525	119	2037
14865	2.4	525	137	2037
14867	2	525	149	2037
14869	90	525	119	2038
14871	2.4	525	137	2038
14873	2	525	149	2038
14891	10	1	136	2041
14893	0.22	1	146	2041
14895	0.5	1	159	2041
14897	15	1	162	2041
14994	55	1	134	2054
14996	0.5	1	146	2054
14998	0.25	1	155	2054
15000	55	1	134	2055
15002	0.5	1	146	2055
15004	0.12	1	155	2055
15081	75	1	119	2067
15083	3.5	1	139	2067
15085	0.1	1	155	2067
15087	0.3	1	159	2067
15089	20	1	162	2067
8907	30	3	162	1276
8909	60	3	135	1277
14747	40	9	134	2020
8913	0.3	3	152	1277
8915	0.08	3	157	1277
8917	75	1	119	1278
8918	8	1	136	1278
8919	3.2	1	139	1278
14749	0.7	9	146	2020
8921	0.1	1	155	1278
8922	0.004	1	157	1278
8923	1.8	1	158	1278
8924	0.5	1	159	1278
8925	15	1	162	1278
8926	75	1	119	1279
8927	8	1	136	1279
8928	3.5	1	139	1279
14751	0.2	9	152	2020
8930	0.4	1	155	1279
8931	1.8	1	158	1279
8932	0.5	1	159	1279
8933	30	1	162	1279
8911	0.1	3	146	1277
8920	0.22	1	146	1278
8929	1.2	1	147	1279
14864	15	525	134	2037
14866	1	525	146	2037
14868	0.07	525	152	2037
14870	15	525	134	2038
14872	1	525	146	2038
14874	0.07	525	155	2038
14890	75	1	119	2041
14892	3.5	1	138	2041
14894	0.1	1	155	2041
14896	1.8	1	160	2041
14993	245	1	119	2054
14995	3.8	1	137	2054
14997	0.5	1	152	2054
14999	245	1	119	2055
15001	5.4	1	137	2055
15003	0.6	1	152	2055
15005	0.008	1	157	2055
15082	10	1	136	2067
15084	0.22	1	146	2067
15086	0.004	1	157	2067
15088	1.3	1	160	2067
8934	75	1	119	1280
8935	8	1	136	1280
8936	3.5	1	139	1280
14753	75	5	119	2021
8938	0.1	1	155	1280
8939	0.004	1	157	1280
8940	1.8	1	158	1280
8941	0.5	1	159	1280
8942	15	1	162	1280
8943	75	1	119	1281
8944	8	1	136	1281
8945	3.5	1	139	1281
14756	0.7	5	146	2021
8947	0.1	1	155	1281
8948	0.004	1	157	1281
8949	1.8	1	158	1281
8950	0.5	1	159	1281
8951	20	1	162	1281
8952	75	1	119	1282
8953	8	1	136	1282
8954	3.5	1	139	1282
14759	0.05	5	155	2021
8956	0.4	1	155	1282
8958	0.5	1	159	1282
8959	30	1	162	1282
8960	120	8	119	1283
8961	80	8	135	1283
8962	4.6	8	137	1283
14795	60	9	119	2027
8964	4	8	149	1283
8965	0.5	8	154	1283
8966	0.1	8	155	1283
8967	75	1	119	1284
8968	8	1	136	1284
8969	3.2	1	139	1284
14798	0.7	9	146	2027
8971	0.1	1	155	1284
8972	0.004	1	157	1284
8973	1.8	1	158	1284
8974	0.5	1	159	1284
8975	30	1	162	1284
8976	40	3	119	1285
8977	60	3	135	1285
8978	1.3	3	137	1285
14801	0.05	9	155	2027
8980	1.5	3	149	1285
8981	0.3	3	152	1285
8982	0.3	3	154	1285
8983	0.08	3	157	1285
8984	15	3	162	1285
8985	75	1	119	1286
8986	8	1	136	1286
8987	3.5	1	139	1286
14810	40	9	134	2029
8989	0.1	1	155	1286
8990	0.004	1	157	1286
14813	3	9	149	2029
8992	0.5	1	159	1286
8993	30	1	162	1286
8994	75	1	119	1287
8995	8	1	136	1287
14816	90	521	119	2030
14819	1	521	146	2030
8998	0.1	1	155	1287
8999	0.004	1	157	1287
14829	90	525	119	2032
9001	0.5	1	159	1287
9002	75	1	119	1288
9003	8	1	136	1288
9004	3.5	1	139	1288
14832	1	525	146	2032
9006	0.4	1	155	1288
9007	1.8	1	158	1288
9008	0.5	1	159	1288
14850	5.5	3	137	2035
14853	1	3	152	2035
14856	40	3	162	2035
14898	75	1	119	2042
14901	0.22	1	146	2042
14904	0.3	1	159	2042
14974	245	1	119	2051
14977	0.5	1	146	2051
9017	75	1	119	1290
9018	1	1	136	1290
9019	3	1	139	1290
14980	245	1	119	2052
9021	0.4	1	155	1290
9022	1.8	1	158	1290
9023	0.5	1	159	1290
9024	8	1	136	1291
9025	3.5	1	139	1291
14983	0.5	1	146	2052
9027	0.1	1	155	1291
9028	0.004	1	157	1291
9029	1.8	1	158	1291
9030	0.5	1	159	1291
14986	0.008	1	157	2052
15030	225	1	119	2060
15033	0.5	1	146	2060
9039	75	1	119	1293
9040	8	1	136	1293
9041	3.2	1	139	1293
9043	0.1	1	155	1293
9044	0.004	1	157	1293
9045	1.8	1	158	1293
9046	0.5	1	159	1293
9055	50	9	119	1295
9056	50	9	135	1295
9057	2.2	9	137	1295
9059	2	9	149	1295
9060	0.1	9	152	1295
9061	0.3	9	154	1295
9062	0.05	9	155	1295
9063	50	9	119	1296
9064	50	9	135	1296
9065	2.4	9	137	1296
9067	2	9	149	1296
9068	0.1	9	152	1296
9069	0.3	9	154	1296
8963	1.4	8	146	1283
9058	0.7	9	146	1295
9066	0.7	9	146	1296
8937	0.22	1	146	1280
8946	0.22	1	146	1281
8955	1.2	1	147	1282
8970	0.22	1	146	1284
8988	0.22	1	146	1286
8997	0.22	1	146	1287
9005	1.2	1	147	1288
9020	1.2	1	147	1290
9026	0.22	1	146	1291
8957	1.8	1	158	1282
8991	1.8	1	160	1286
9000	1.8	1	160	1287
9070	0.05	9	155	1296
9071	75	1	119	1297
9073	3.5	1	139	1297
9075	0.1	1	155	1297
9077	1.8	1	158	1297
14754	25	5	134	2021
9084	4	1	137	1298
9087	0.7	1	152	1298
14757	1.5	5	149	2021
14796	40	9	134	2027
14799	3	9	149	2027
14811	2.2	9	137	2029
14814	0.2	9	152	2029
14817	15	521	134	2030
14820	2	521	149	2030
14830	15	525	134	2032
14833	2	525	149	2032
14848	120	3	119	2035
14851	2.5	3	146	2035
14854	1	3	154	2035
14900	3.5	1	139	2042
14906	15	1	162	2042
14976	3.8	1	137	2051
14979	0.25	1	155	2051
14982	5.4	1	137	2052
14985	0.12	1	155	2052
15032	4.5	1	137	2060
15035	0.12	1	155	2060
15045	3.8	1	137	2062
15048	0.12	1	155	2062
15051	55	1	134	2063
15054	0.6	1	152	2063
15065	10	14	136	2065
15068	0.1	14	155	2065
15071	1.3	14	160	2065
15106	3.8	1	137	2070
15109	0.12	1	155	2070
15112	10	1	136	2071
15115	0.4	1	155	2071
15118	20	1	162	2071
14903	0.004	1	157	2042
9072	8	1	136	1297
14755	2.4	5	137	2021
9076	0.004	1	157	1297
14758	0.2	5	152	2021
14797	2.2	9	137	2027
14800	0.2	9	152	2027
14809	60	9	119	2029
14812	0.7	9	146	2029
14815	0.05	9	155	2029
14818	2.4	521	137	2030
14821	0.07	521	155	2030
14831	2.4	525	137	2032
14834	0.07	525	155	2032
14849	180	3	135	2035
8807	75	1	119	1263
9078	0.5	1	159	1297
9082	240	1	119	1298
9085	0.5	1	146	1298
9074	0.22	1	146	1297
14852	4.5	3	149	2035
14855	0.25	3	155	2035
14899	10	1	136	2042
14902	0.1	1	155	2042
14905	1.3	1	160	2042
14907	0.004	1	157	2041
14975	55	1	134	2051
14978	0.5	1	152	2051
14981	55	1	134	2052
14984	0.6	1	152	2052
15031	75	1	134	2060
15034	0.6	1	152	2060
15044	55	1	134	2062
15047	0.5	1	152	2062
15050	245	1	119	2063
15053	0.5	1	146	2063
15056	0.008	1	157	2063
15064	75	14	119	2065
15067	0.22	14	146	2065
15070	0.3	14	159	2065
15105	75	1	134	2070
15108	0.6	1	152	2070
15111	75	1	119	2071
15114	1.2	1	147	2071
15117	1.8	1	160	2071
14760	60	9	119	2022
9083	60	1	134	1298
9086	6	1	149	1298
9088	75	1	119	1299
9089	8	1	136	1299
9090	3.5	1	139	1299
14763	0.7	9	146	2022
9092	0.1	1	155	1299
9093	0.004	1	157	1299
9094	1.8	1	158	1299
9095	0.5	1	159	1299
9096	75	1	119	1300
9097	3	1	136	1300
9098	3.5	1	139	1300
14766	0.05	9	155	2022
9100	0.1	1	155	1300
9101	0.004	1	157	1300
9102	2	1	158	1300
9103	0.7	1	159	1300
9104	75	1	119	1301
9105	3	1	136	1301
9106	3.5	1	139	1301
14768	20	4	134	2023
9108	0.1	1	155	1301
9109	0.004	1	157	1301
9110	2	1	158	1301
9111	0.7	1	159	1301
9112	75	1	119	1302
9113	8	1	136	1302
14771	0.2	4	152	2023
14776	2.2	4	137	2024
9116	0.004	1	157	1302
9117	1.8	1	158	1302
9118	0.5	1	159	1302
9119	75	1	119	1303
9120	8	1	136	1303
9121	3.5	1	139	1303
14779	0.04	4	155	2024
9123	0.1	1	155	1303
9124	0.004	1	157	1303
9125	1.8	1	158	1303
9126	0.5	1	159	1303
9127	75	1	119	1304
9128	1	1	136	1304
9129	3.5	1	139	1304
14782	40	9	134	2025
9131	0.1	1	155	1304
9132	2	1	158	1304
9133	0.7	1	159	1304
9134	75	1	119	1305
9135	3	1	136	1305
9136	3.5	1	139	1305
14785	3	9	149	2025
9138	0.1	1	155	1305
9139	0.004	1	157	1305
9140	2	1	158	1305
9141	0.7	1	159	1305
9142	75	1	119	1306
9143	8	1	136	1306
9144	3.2	1	139	1306
14789	40	9	134	2026
9146	0.1	1	155	1306
9147	0.004	1	157	1306
9148	1.8	1	158	1306
9149	0.5	1	159	1306
9150	30	1	162	1306
9151	50	9	119	1307
9152	50	9	135	1307
9153	2.4	9	137	1307
14792	3	9	149	2026
9155	2	9	149	1307
9156	0.1	9	152	1307
9157	0.3	9	154	1307
9158	0.05	9	155	1307
9159	50	9	119	1308
9160	50	9	135	1308
9161	2.2	9	137	1308
14823	40	9	134	2031
9163	2	9	149	1308
9164	0.1	9	152	1308
9165	0.3	9	154	1308
9166	0.05	9	155	1308
9167	50	9	119	1309
9168	50	9	135	1309
9169	2.4	9	137	1309
14826	3	9	149	2031
9171	2	9	149	1309
9172	0.1	9	152	1309
9173	0.3	9	154	1309
9174	0.05	9	155	1309
9175	75	1	119	1310
9176	3	1	136	1310
14835	245	1	119	2033
14838	0.5	1	146	2033
9179	0.1	1	155	1310
9180	0.004	1	157	1310
9181	2	1	158	1310
9182	0.7	1	159	1310
9183	40	1	162	1310
14859	2.4	525	137	2036
14862	0.07	525	155	2036
14875	60	9	119	2039
14878	0.7	9	146	2039
14881	0.05	9	155	2039
14882	75	1	119	2040
14885	1.2	1	147	2040
14888	1.8	1	160	2040
14908	75	2	119	2043
14914	1.8	2	160	2043
9208	75	1	119	1314
9209	3	1	136	1314
9212	0.1	1	155	1314
9213	0.004	1	157	1314
9214	2	1	158	1314
9215	0.7	1	159	1314
9216	40	1	162	1314
9217	75	1	119	1315
9218	8	1	136	1315
9219	3.5	1	139	1315
9221	0.1	1	155	1315
9210	3.5	1	138	1314
9154	0.7	9	146	1307
9162	0.7	9	146	1308
9170	0.7	9	146	1309
9091	0.22	1	146	1299
9099	0.22	1	146	1300
9107	0.22	1	146	1301
9122	0.22	1	146	1303
9130	0.22	1	146	1304
9137	0.22	1	146	1305
9145	0.22	1	146	1306
9178	0.22	1	146	1310
9211	0.22	1	146	1314
9220	0.22	1	146	1315
9222	0.004	1	157	1315
9224	0.5	1	159	1315
9227	8	1	136	1316
14761	40	9	134	2022
9231	1.8	1	158	1316
9233	45	1	162	1316
9229	1.2	1	147	1316
14764	3	9	149	2022
14769	2.2	4	137	2023
14772	0.04	4	155	2023
14775	20	4	134	2024
14778	0.2	4	152	2024
14781	60	9	119	2025
14784	0.7	9	146	2025
14787	0.05	9	155	2025
14788	60	9	119	2026
14791	0.7	9	146	2026
14794	0.05	9	155	2026
14822	60	9	119	2031
14825	0.7	9	146	2031
14828	0.05	9	155	2031
14837	3.8	1	137	2033
14840	0.25	1	155	2033
14858	15	525	134	2036
14861	2	525	149	2036
14877	2.2	9	137	2039
14880	0.2	9	152	2039
14887	0.5	1	159	2040
14909	6	2	136	2043
14912	0.4	2	155	2043
14915	15	2	162	2043
14917	6	2	136	2044
14920	0.4	2	155	2044
14923	15	2	162	2044
14926	3.5	1	139	2045
14929	0.004	1	157	2045
14932	15	1	162	2045
14944	3.5	2	138	2047
14947	0.5	2	159	2047
14960	10	1	136	2049
14963	0.1	1	155	2049
14966	1.3	1	160	2049
15007	55	1	134	2056
15010	0.6	1	152	2056
15014	5.5	1	137	2057
15017	0.25	1	155	2057
15020	4.5	1	137	2058
15023	0.25	1	155	2058
15037	245	1	119	2061
15040	2.5	1	146	2061
15058	75	1	134	2064
15061	0.6	1	152	2064
15075	3.5	2	138	2066
15078	0.5	2	159	2066
15090	245	1	119	2068
15093	0.5	1	146	2068
15096	0.008	1	157	2068
15099	5.2	1	137	2069
15102	0.12	1	155	2069
15119	75	1	119	2072
15122	0.22	1	146	2072
15125	0.5	1	159	2072
14884	3.5	1	138	2040
9223	1.8	1	158	1315
9225	35	1	162	1315
9226	75	1	119	1316
9228	3.5	1	139	1316
9230	0.4	1	155	1316
9232	0.5	1	159	1316
9234	75	1	119	1317
9235	8	1	136	1317
9236	3.2	1	139	1317
14762	2.2	9	137	2022
9238	0.1	1	155	1317
9239	0.004	1	157	1317
9240	1.8	1	158	1317
9241	0.5	1	159	1317
9242	35	1	162	1317
9260	75	1	119	1320
9261	8	1	136	1320
9262	3.2	1	139	1320
14765	0.2	9	152	2022
9264	0.004	1	157	1320
9265	1.8	1	158	1320
9266	0.5	1	159	1320
9267	30	1	162	1320
9237	0.22	1	146	1317
9263	0.22	1	146	1320
14767	80	4	119	2023
14770	0.2	4	146	2023
14773	0.003	4	157	2023
14774	80	4	119	2024
14777	0.2	4	146	2024
14780	0.003	4	157	2024
14783	2.2	9	137	2025
14786	0.2	9	152	2025
14790	2.2	9	137	2026
14793	0.2	9	152	2026
14824	2.2	9	137	2031
14827	0.2	9	152	2031
14836	55	1	134	2033
14839	0.5	1	152	2033
14857	90	525	119	2036
14860	1	525	146	2036
14876	40	9	134	2039
14879	3	9	149	2039
14883	10	1	136	2040
14886	0.4	1	155	2040
14889	15	1	162	2040
14910	3.5	2	138	2043
14913	0.5	2	159	2043
14918	3.5	2	138	2044
14921	0.5	2	159	2044
14924	75	1	119	2045
14927	0.22	1	146	2045
14930	0.3	1	159	2045
14942	75	2	119	2047
14945	1.2	2	147	2047
14948	1.8	2	160	2047
14959	75	1	119	2049
14962	0.22	1	146	2049
14965	0.3	1	159	2049
15006	245	1	119	2056
15009	2.5	1	146	2056
15013	55	1	134	2057
15016	0.6	1	152	2057
15019	75	1	134	2058
15022	0.6	1	152	2058
15039	3.8	1	137	2061
15042	0.25	1	155	2061
15059	4	1	137	2064
15062	0.12	1	155	2064
15073	75	2	119	2066
15076	1.2	2	147	2066
15079	1.8	2	160	2066
15091	55	1	134	2068
15094	0.5	1	152	2068
15097	245	1	119	2069
15100	0.5	1	146	2069
15103	0.008	1	157	2069
15120	10	1	136	2072
15123	0.1	1	155	2072
15126	1.8	1	160	2072
9243	75	1	119	1318
14802	60	9	119	2028
9249	0.5	1	159	1318
9251	75	1	119	1319
14804	2.2	9	137	2028
9257	1.8	1	158	1319
9270	3.2	15	139	1321
9273	1.8	15	158	1321
9246	1.2	1	147	1318
9254	0.22	1	146	1319
14806	3	9	149	2028
14808	0.05	9	155	2028
14841	245	1	119	2034
14843	5.4	1	137	2034
14845	0.6	1	152	2034
14847	0.008	1	157	2034
14934	10	1	136	2046
14936	0.22	1	146	2046
14938	0.004	1	157	2046
14940	1.8	1	160	2046
14950	75	1	119	2048
14952	3.2	1	138	2048
14954	0.1	1	155	2048
14956	0.5	1	159	2048
14958	15	1	162	2048
14968	245	1	119	2050
14970	4.7	1	137	2050
14972	0.5	1	152	2050
14987	245	1	119	2053
14989	4.5	1	137	2053
14991	0.6	1	152	2053
15025	55	1	134	2059
15027	2.5	1	146	2059
15029	0.25	1	155	2059
9244	8	1	136	1318
9247	0.4	1	155	1318
9250	45	1	162	1318
9252	8	1	136	1319
9255	0.1	1	155	1319
9258	0.5	1	159	1319
9268	75	15	119	1321
14803	40	9	134	2028
9274	0.5	15	159	1321
9271	0.22	15	146	1321
14805	0.7	9	146	2028
14807	0.2	9	152	2028
14842	55	1	134	2034
14844	0.5	1	146	2034
14846	0.12	1	155	2034
14933	75	1	119	2046
14935	3.5	1	138	2046
14937	0.1	1	155	2046
14939	0.5	1	159	2046
14941	20	1	162	2046
14951	10	1	136	2048
14953	0.22	1	146	2048
14955	0.004	1	157	2048
14957	1.8	1	160	2048
14969	55	1	134	2050
14971	2.5	1	146	2050
14973	0.25	1	155	2050
14988	55	1	134	2053
14990	2.5	1	146	2053
14992	0.25	1	155	2053
15024	245	1	119	2059
15026	3.8	1	137	2059
15028	0.5	1	152	2059
9245	3.5	1	139	1318
9248	1.8	1	158	1318
9253	3.5	1	139	1319
9256	0.004	1	157	1319
9259	30	1	162	1319
9269	8	15	136	1321
9275	30	15	162	1321
9276	75	1	119	1322
9277	8	1	136	1322
9278	3.5	1	139	1322
14916	75	2	119	2044
9281	1.8	1	158	1322
9282	0.5	1	159	1322
9283	15	1	162	1322
9284	75	1	119	1323
9285	8	1	136	1323
9286	3.5	1	139	1323
9288	0.4	1	155	1323
9289	1.8	1	158	1323
9290	0.5	1	159	1323
9291	15	1	162	1323
9292	75	15	119	1324
9293	8	15	136	1324
9294	3.2	15	139	1324
14922	1.8	2	160	2044
14925	10	1	136	2045
9297	1.8	15	158	1324
9298	0.5	15	159	1324
9299	30	15	162	1324
9300	75	1	119	1325
9301	8	1	136	1325
9302	3.5	1	139	1325
14928	0.1	1	155	2045
9305	1.8	1	158	1325
9306	0.5	1	159	1325
9307	75	1	119	1326
9308	8	1	136	1326
9309	3.5	1	139	1326
14931	1.3	1	160	2045
9311	0.1	1	155	1326
9312	0.004	1	157	1326
9313	1.8	1	158	1326
9314	0.5	1	159	1326
9315	40	1	162	1326
9316	75	1	119	1327
9317	8	1	136	1327
9318	3.5	1	139	1327
14943	6	2	136	2047
9320	0.1	1	155	1327
9321	0.004	1	157	1327
9322	1.8	1	158	1327
9323	0.5	1	159	1327
9324	40	1	162	1327
9325	75	1	119	1328
9326	8	1	136	1328
9327	3.5	1	139	1328
14946	0.4	2	155	2047
9329	0.1	1	155	1328
9330	0.004	1	157	1328
9331	1.8	1	158	1328
9332	0.5	1	159	1328
9333	35	1	162	1328
9177	3.5	1	138	1310
9334	75	1	119	1291
8996	3.5	1	139	1287
14949	15	2	162	2047
9335	0.1	1	155	1320
9336	3.5	1	139	1302
14961	3.5	1	139	2049
9272	0	15	155	1321
9337	0.1	15	157	1321
9296	0.1	15	157	1324
14964	0.004	1	157	2049
9338	0.1	1	155	1302
14967	20	1	162	2049
15008	4.5	1	137	2056
15011	0.25	1	155	2056
15012	245	1	119	2057
15015	2.5	1	146	2057
15018	225	1	119	2058
15021	2.5	1	146	2058
15038	55	1	134	2061
15041	0.5	1	152	2061
15057	225	1	119	2064
15060	0.5	1	146	2064
15063	0.008	1	157	2064
15074	6	2	136	2066
15077	0.4	2	155	2066
15080	20	2	162	2066
15092	3.8	1	137	2068
15095	0.12	1	155	2068
15098	55	1	134	2069
15101	0.6	1	152	2069
15124	0.004	1	157	2072
15127	20	1	162	2072
15121	3.5	1	138	2072
14919	1.2	2	147	2044
9379	50	9	119	1334
9380	50	9	135	1334
9381	2.4	9	137	1334
9383	2	9	149	1334
9384	0.1	9	152	1334
9385	0.3	9	154	1334
9386	0.05	9	155	1334
9387	50	9	119	1335
9388	50	9	135	1335
9389	2.2	9	137	1335
9391	2	9	149	1335
9392	0.1	9	152	1335
9393	0.3	9	154	1335
9394	0.05	9	155	1335
9395	50	9	119	1336
9396	50	9	135	1336
9397	2.2	9	137	1336
9382	0.7	9	146	1334
9390	0.7	9	146	1335
9398	0.7	9	146	1336
9115	0.22	1	146	1302
9287	1.2	1	147	1323
9295	0.22	15	146	1324
9310	0.22	1	146	1326
9319	0.22	1	146	1327
9279	0.22	1	146	1322
9303	0.22	1	146	1325
9280	0.1	1	155	1322
9304	0.1	1	155	1325
9399	2	9	149	1336
9401	0.3	9	154	1336
9412	50	1	135	1338
15036	0.008	1	157	2060
9416	0.1	1	152	1338
9418	0.05	1	155	1338
9428	15	9	134	1340
9430	1	9	146	1340
9432	0.07	9	155	1340
9440	65	9	119	1342
9442	1.8	9	137	1342
9444	3	9	149	1342
9446	0.05	9	155	1342
9462	15	7	134	1345
9464	0.1	7	146	1345
9466	0.07	7	155	1345
9414	0.7	1	146	1338
15043	245	1	119	2062
15046	0.5	1	146	2062
15049	0.008	1	157	2062
15052	5.2	1	137	2063
15055	0.12	1	155	2063
15066	3.5	14	139	2065
15069	0.004	14	157	2065
15072	20	14	162	2065
15104	225	1	119	2070
15107	0.5	1	146	2070
15110	0.008	1	157	2070
15113	3.5	1	138	2071
15116	0.5	1	159	2071
9400	0.1	9	152	1336
9402	0.05	9	155	1336
9403	50	9	119	1337
9404	50	9	135	1337
9405	2.4	9	137	1337
15128	75	1	119	2073
9407	2	9	149	1337
9408	0.1	9	152	1337
9409	0.3	9	154	1337
9410	0.05	9	155	1337
9411	50	1	119	1338
9413	2.2	1	137	1338
9415	2	1	149	1338
9417	0.3	1	154	1338
9419	50	9	119	1339
9420	50	9	135	1339
9421	2.4	9	137	1339
15131	0.22	1	146	2073
9423	2	9	149	1339
9424	0.1	9	152	1339
9425	0.3	9	154	1339
9426	0.05	9	155	1339
9427	85	9	119	1340
9429	2.2	9	137	1340
9431	6	9	149	1340
9433	80	7	119	1341
9434	20	7	134	1341
9435	2.4	7	137	1341
9436	0.8	7	146	1341
9437	3	7	149	1341
9438	0.2	7	152	1341
9439	0.07	7	155	1341
9441	35	9	134	1342
9443	0.7	9	146	1342
9445	0.1	9	152	1342
9447	65	8	119	1343
9448	35	8	134	1343
9449	2	8	137	1343
9450	0.7	8	146	1343
9451	3	8	149	1343
9452	0.1	8	152	1343
9453	0.05	8	155	1343
9461	85	7	119	1345
9463	2.2	7	137	1345
9465	6	7	149	1345
9467	85	7	119	1346
9468	15	7	134	1346
9469	2.2	7	137	1346
9470	0.1	7	146	1346
9471	6	7	149	1346
9472	0.15	7	155	1346
9473	85	7	119	1347
9474	15	7	134	1347
9475	2.2	7	137	1347
9476	0.1	7	146	1347
9477	6	7	149	1347
9478	0.2	7	155	1347
9406	0.7	9	146	1337
9422	0.7	9	146	1339
15134	0.3	1	159	2073
15223	2.4	521	137	2086
15226	0.07	521	155	2086
15290	0.7	9	146	2096
15293	0.05	9	155	2096
15301	50	9	119	2098
15304	2	9	149	2098
15307	0.05	9	155	2098
9454	65	8	119	1344
9456	2.1	8	137	1344
9458	3	8	149	1344
9460	0.05	8	155	1344
15129	10	1	136	2073
15132	0.1	1	155	2073
15135	1.3	1	160	2073
15221	90	521	119	2086
15224	1	521	146	2086
15288	60	9	119	2096
15291	3	9	149	2096
15294	2.2	9	164	2096
15303	0.7	9	146	2098
15306	0.02	9	154	2098
9455	35	8	134	1344
9457	0.7	8	146	1344
9459	0.1	8	152	1344
9479	55	9	119	1348
9480	45	9	135	1348
9481	2.2	9	137	1348
15130	3.5	1	139	2073
9483	2	9	149	1348
9484	0.1	9	152	1348
9485	0.3	9	154	1348
9486	0.05	9	155	1348
9487	55	9	119	1349
9488	45	9	135	1349
9489	2.5	9	137	1349
9491	2	9	149	1349
9492	0.1	9	152	1349
9493	0.3	9	154	1349
9494	0.05	9	155	1349
9495	85	9	119	1350
9496	15	9	134	1350
9497	2.4	9	137	1350
9499	6	9	149	1350
9500	0.2	9	155	1350
9501	85	7	119	1351
9502	15	7	134	1351
9503	2.6	7	137	1351
9505	6	7	149	1351
9506	0.2	7	155	1351
9507	85	7	119	1352
9508	15	7	134	1352
9509	2.8	7	137	1352
9511	6	7	149	1352
9512	0.2	7	155	1352
9513	85	7	119	1353
9514	15	7	134	1353
9515	2.4	7	137	1353
9517	6	7	149	1353
9518	0.3	7	152	1353
9519	0.2	7	155	1353
9520	90	7	119	1354
9521	15	7	134	1354
9522	2.4	7	137	1354
9524	4	7	149	1354
9525	0.07	7	155	1354
9526	240	4	119	1355
9527	60	4	134	1355
9528	4.5	4	137	1355
9529	0.5	4	146	1355
9530	0.6	4	152	1355
9531	0.12	4	155	1355
9532	0.008	4	157	1355
9533	240	4	119	1356
9534	60	4	134	1356
9535	4	4	137	1356
9536	0.5	4	146	1356
9537	0.6	4	152	1356
9538	0.12	4	155	1356
9539	0.008	4	157	1356
9540	130	8	119	1357
9541	70	8	135	1357
9542	4.6	8	137	1357
9544	4	8	149	1357
9545	0.5	8	154	1357
9546	0.1	8	155	1357
9547	240	1	119	1358
9548	60	1	134	1358
9549	4.8	1	137	1358
9551	0.6	1	152	1358
9552	0.12	1	155	1358
9553	0.008	1	157	1358
9554	120	3	119	1359
9555	180	3	135	1359
9556	6	3	137	1359
9558	4	3	149	1359
9559	1	3	152	1359
9560	1	3	154	1359
9561	0.25	3	155	1359
9562	20	3	162	1359
9563	240	1	119	1360
9564	60	1	134	1360
9565	4.7	1	137	1360
9566	0.5	1	146	1360
9567	0.6	1	152	1360
9568	0.12	1	155	1360
9569	0.008	1	157	1360
9570	150	523	119	1361
9571	25	523	134	1361
9572	3	523	137	1361
9573	0.4	523	146	1361
9574	0.1	523	152	1361
9575	0.08	523	155	1361
9576	0.004	523	157	1361
9577	150	523	119	1362
9578	25	523	134	1362
9579	3	523	137	1362
9580	0.2	523	146	1362
9581	0.2	523	152	1362
9582	0.08	523	155	1362
9583	0.004	523	157	1362
9584	150	523	119	1363
9585	25	523	134	1363
9586	2.8	523	137	1363
9587	0.2	523	146	1363
9588	0.2	523	152	1363
9589	0.08	523	155	1363
9590	0.003	523	157	1363
9591	150	523	119	1364
9592	25	523	134	1364
9593	2.6	523	137	1364
9594	0.2	523	146	1364
9595	0.2	523	152	1364
9596	0.08	523	155	1364
9597	0.003	523	157	1364
9598	240	1	119	1365
9599	60	1	134	1365
9600	4.1	1	137	1365
9601	0.6	1	146	1365
9602	0.6	1	152	1365
9603	0.12	1	155	1365
9604	0.008	1	157	1365
9605	75	1	119	1366
9606	8	1	136	1366
9607	3.5	1	139	1366
9609	0.1	1	155	1366
9610	0.004	1	157	1366
9611	1.8	1	158	1366
9490	0.7	9	146	1349
9498	0.1	9	146	1350
9510	0.1	7	146	1352
9516	0.1	7	146	1353
9523	0.8	7	146	1354
9543	1.4	8	146	1357
9557	2.5	3	146	1359
9608	0.22	1	146	1366
9550	0.5	1	146	1358
9612	0.5	1	159	1366
9613	75	1	119	1367
9615	3.5	1	139	1367
9617	0.1	1	155	1367
9619	1.8	1	158	1367
9621	40	1	162	1367
9623	8	1	136	1368
15133	0.004	1	157	2073
9627	0.004	1	157	1368
9629	0.5	1	159	1368
9640	240	1	119	1370
9642	4.1	1	137	1370
9644	0.6	1	152	1370
9646	0.008	1	157	1370
9655	1	1	136	1372
15136	15	1	162	2073
9659	0.004	1	157	1372
9661	0.7	1	159	1372
9662	75	1	119	1373
9664	3.5	1	139	1373
9666	0.1	1	155	1373
9668	1.8	1	158	1373
9670	40	1	162	1373
9680	75	1	119	1375
9682	3.5	1	139	1375
9684	0.1	1	155	1375
9686	1.8	1	158	1375
9723	120	3	119	1380
9725	5	3	137	1380
9727	4.5	3	149	1380
9729	0.9	3	154	1380
9731	30	3	162	1380
9625	0.22	1	146	1368
9657	0.22	1	146	1372
15222	15	521	134	2086
15225	2	521	149	2086
14306	3.5	2	138	1962
15289	40	9	134	2096
15292	0.2	9	152	2096
15302	50	9	135	2098
15305	0.2	9	152	2098
15308	1.9	9	164	2098
9614	8	1	136	1367
15137	75	1	119	2074
9618	0.004	1	157	1367
9620	0.5	1	159	1367
9622	75	1	119	1368
9624	3.5	1	139	1368
9626	0.1	1	155	1368
9628	1.8	1	158	1368
9630	40	1	162	1368
9641	60	1	134	1370
9643	0.5	1	146	1370
9645	0.12	1	155	1370
9654	75	1	119	1372
9656	3.5	1	139	1372
9658	0.1	1	155	1372
9660	2	1	158	1372
9663	8	1	136	1373
15140	0.22	1	146	2074
9667	0.004	1	157	1373
9669	0.5	1	159	1373
9681	1	1	136	1375
15143	0.5	1	159	2074
9687	0.5	1	159	1375
9724	180	3	135	1380
15145	75	1	119	2075
9728	0.9	3	152	1380
9730	0.3	3	157	1380
9685	0.004	1	157	1375
9726	0.3	3	146	1380
9616	0.22	1	146	1367
9665	0.22	1	146	1373
9683	0.22	1	146	1375
15148	0.22	1	146	2075
15151	0.5	1	159	2075
15154	75	2	119	2076
15157	1.2	2	147	2076
15160	1.8	2	160	2076
15162	75	1	119	2077
15165	0.22	1	146	2077
15168	0.3	1	159	2077
15178	15	521	134	2079
15181	2	521	149	2079
15192	2.4	521	137	2081
15195	0.07	521	155	2081
15203	15	521	134	2083
15206	2	521	149	2083
15229	2.2	9	137	2087
15232	0.2	9	152	2087
15234	0	16	164	\N
15236	35	8	134	2088
15239	0.2	8	152	2088
15244	0.7	9	146	2089
15247	0.05	9	155	2089
15251	2.2	9	137	2090
15254	0.2	9	152	2090
15278	100	1	119	2094
15281	3.6	1	164	2094
15282	90	521	119	2095
15285	2	521	149	2095
9631	120	3	119	1369
9633	5	3	137	1369
9635	4	3	149	1369
9637	1	3	154	1369
9639	25	3	162	1369
9648	60	1	134	1371
9650	0.5	1	146	1371
9652	0.12	1	155	1371
9697	10	1	136	1377
15138	1	1	136	2074
9701	0.004	1	157	1377
9703	0.3	1	159	1377
9714	120	3	119	1379
9716	5	3	137	1379
9718	4	3	149	1379
9720	1	3	154	1379
9722	25	3	162	1379
9699	0.22	1	146	1377
15141	0.1	1	155	2074
15144	1.8	1	160	2074
15146	10	1	136	2075
15149	0.1	1	155	2075
15152	1.8	1	160	2075
15155	10	2	136	2076
15158	0.4	2	155	2076
15161	15	2	162	2076
15163	10	1	136	2077
15166	0.1	1	155	2077
15169	1.3	1	160	2077
15179	2.4	521	137	2079
15182	0.07	521	155	2079
15190	90	521	119	2081
15193	1	521	146	2081
15204	2.4	521	137	2083
15207	0.07	521	155	2083
15227	60	9	119	2087
15230	0.7	9	146	2087
15233	0.05	9	155	2087
14911	1.2	2	147	2043
15237	0.1	8	146	2088
15240	0.05	8	157	2088
15243	40	9	134	2089
15246	0.2	9	152	2089
15249	60	9	119	2090
15252	0.7	9	146	2090
15255	0.05	9	155	2090
15279	0.5	1	146	2094
15283	15	521	134	2095
15286	0.07	521	155	2095
9632	180	3	135	1369
15139	3.5	1	138	2074
9636	1	3	152	1369
9638	0.25	3	155	1369
9647	240	1	119	1371
9649	4.8	1	137	1371
9651	0.6	1	152	1371
9653	0.008	1	157	1371
9671	75	1	119	1374
9672	8	1	136	1374
9673	3.2	1	139	1374
9675	0.1	1	155	1374
9676	0.004	1	157	1374
9677	1.8	1	158	1374
9678	0.5	1	159	1374
9679	40	1	162	1374
9688	75	1	119	1376
9689	1	1	136	1376
9690	3.5	1	139	1376
9692	0.1	1	155	1376
9693	0.004	1	157	1376
9694	1.8	1	158	1376
9695	0.5	1	159	1376
9696	75	1	119	1377
9698	3.5	1	139	1377
9700	0.1	1	155	1377
9702	1.3	1	158	1377
9704	25	1	162	1377
9705	75	1	119	1378
9706	10	1	136	1378
9707	3.5	1	139	1378
9709	0.1	1	155	1378
9710	0.004	1	157	1378
9711	1.3	1	158	1378
9712	0.3	1	159	1378
9713	25	1	162	1378
9715	180	3	135	1379
9719	1	3	152	1379
9721	0.25	3	155	1379
9732	50	9	119	1381
9733	50	9	135	1381
9734	2.2	9	137	1381
9736	2	9	149	1381
9737	0.1	9	152	1381
9738	0.3	9	154	1381
9739	0.05	9	155	1381
9740	50	9	119	1382
9741	50	9	135	1382
9742	2.2	9	137	1382
9744	2	9	149	1382
9745	0.1	9	152	1382
9746	0.3	9	154	1382
9747	0.05	9	155	1382
9748	50	9	119	1383
9749	50	9	135	1383
9750	2.4	9	137	1383
9752	2	9	149	1383
9753	0.1	9	152	1383
9754	0.3	9	154	1383
9755	0.05	9	155	1383
9756	50	9	119	1384
9757	50	9	135	1384
9758	2.2	9	137	1384
9760	2	9	149	1384
9761	0.1	9	152	1384
9762	0.3	9	154	1384
9763	0.05	9	155	1384
9764	75	1	119	1385
9765	10	1	136	1385
9766	3.5	1	139	1385
9768	0.1	1	155	1385
9769	0.004	1	157	1385
9770	1.3	1	158	1385
9771	0.3	1	159	1385
9772	25	1	162	1385
9773	80	2	119	1386
9774	20	2	134	1386
9775	1.9	2	137	1386
9776	0.2	2	146	1386
9777	2	2	149	1386
9778	0.2	2	152	1386
9779	0.05	2	155	1386
9780	80	2	119	1387
9781	20	2	134	1387
9782	1.9	2	137	1387
9783	0.2	2	146	1387
9784	2	2	149	1387
9785	0.2	2	152	1387
9786	0.05	2	155	1387
9787	80	2	119	1388
9788	20	2	134	1388
9789	1.9	2	137	1388
9790	0.2	2	146	1388
9791	2	2	149	1388
9792	0.2	2	152	1388
9793	0.05	2	155	1388
9794	80	2	119	1389
9795	20	2	134	1389
9796	1.9	2	137	1389
9797	0.2	2	146	1389
9798	2	2	149	1389
9799	0.2	2	152	1389
9800	0.05	2	155	1389
9801	80	2	119	1390
9802	20	2	134	1390
9803	1.9	2	137	1390
9804	0.2	2	146	1390
9805	2	2	149	1390
9806	0.2	2	152	1390
9807	0.05	2	155	1390
9808	80	2	119	1391
9809	20	2	134	1391
9810	1.9	2	137	1391
9811	0.2	2	146	1391
9812	2	2	149	1391
9813	0.2	2	152	1391
9814	0.05	2	155	1391
9815	75	1	119	1392
9816	8	1	136	1392
9817	3.5	1	139	1392
9819	0.4	1	155	1392
9820	1.8	1	158	1392
9821	0.5	1	159	1392
9822	45	1	162	1392
9823	40	3	119	1393
9824	60	3	135	1393
9717	2.5	3	146	1379
9735	0.7	9	146	1381
9751	0.7	9	146	1383
9759	0.7	9	146	1384
9674	0.22	1	146	1374
9708	0.22	1	146	1378
9767	0.22	1	146	1385
9691	0.22	1	146	1376
9818	1.2	1	147	1392
9825	1.3	3	137	1393
9827	1.5	3	149	1393
9829	0.3	3	154	1393
9832	8	1	136	1394
15142	0.004	1	157	2074
9836	1.8	1	158	1394
9838	40	1	162	1394
9847	50	9	119	1396
9849	2.4	9	137	1396
9851	2	9	149	1396
9853	0.3	9	154	1396
9871	20	2	134	1399
9873	0.2	2	146	1399
9875	0.2	2	152	1399
15147	3.5	1	138	2075
9834	1.2	1	147	1394
15150	0.004	1	157	2075
15153	15	1	162	2075
15156	3.5	2	138	2076
15159	0.5	2	159	2076
15164	3.5	1	139	2077
15167	0.004	1	157	2077
15170	15	1	162	2077
15177	90	521	119	2079
15180	1	521	146	2079
15191	15	521	134	2081
15194	2	521	149	2081
15202	90	521	119	2083
15205	1	521	146	2083
15228	40	9	134	2087
15231	3	9	149	2087
15235	65	8	119	2088
15238	2	8	149	2088
15241	2.3	8	164	2088
15242	60	9	119	2089
15245	3	9	149	2089
15248	2.2	9	164	2089
15250	40	9	134	2090
15253	3	9	149	2090
15280	0.1	1	152	2094
15284	1	521	146	2095
15287	2.4	521	164	2095
15171	90	521	119	2078
9828	0.3	3	152	1393
9830	0.08	3	157	1393
9831	75	1	119	1394
9833	3.5	1	139	1394
9835	0.4	1	155	1394
9837	0.5	1	159	1394
9839	40	3	119	1395
9840	60	3	135	1395
9841	1.3	3	137	1395
15173	2.4	521	137	2078
9843	1.5	3	149	1395
9844	0.3	3	152	1395
9845	0.3	3	154	1395
9846	0.08	3	157	1395
9848	50	9	135	1396
15175	2	521	149	2078
9852	0.1	9	152	1396
9854	0.05	9	155	1396
9870	80	2	119	1399
9872	1.9	2	137	1399
9874	2	2	149	1399
9876	0.05	2	155	1399
9826	0.1	3	146	1393
9842	0.1	3	146	1395
9850	0.7	9	146	1396
15209	40	9	134	2084
15211	0.7	9	146	2084
15213	0.2	9	152	2084
15256	90	521	119	2091
15258	1	521	146	2091
15260	0.07	521	155	2091
15263	50	9	135	2092
15265	2	9	149	2092
15267	0.2	9	154	2092
15269	1.9	9	164	2092
15271	50	9	135	2093
15273	2	9	149	2093
15275	0.2	9	154	2093
15277	1.9	9	164	2093
15295	90	521	119	2097
15297	1	521	146	2097
15299	0.07	521	155	2097
9855	50	9	119	1397
9857	2.4	9	137	1397
9859	2	9	149	1397
9861	0.3	9	154	1397
9864	20	9	135	1398
15172	15	521	134	2078
9868	0.1	9	152	1398
9866	0.3	9	146	1398
15174	1	521	146	2078
15176	0.07	521	155	2078
15208	60	9	119	2084
15210	2.2	9	137	2084
15212	3	9	149	2084
15214	0.05	9	155	2084
15257	15	521	134	2091
15259	2	521	149	2091
15261	2.4	521	164	2091
15262	50	9	119	2092
15264	0.7	9	146	2092
15266	0.2	9	152	2092
15268	0.05	9	155	2092
15270	50	9	119	2093
15272	0.7	9	146	2093
15274	0.2	9	152	2093
15276	0.05	9	155	2093
15296	15	521	134	2097
15298	2	521	149	2097
15300	2.4	521	164	2097
9856	50	9	135	1397
15183	60	9	119	2080
9860	0.1	9	152	1397
9862	0.05	9	155	1397
9863	80	9	119	1398
9865	2.4	9	137	1398
9867	2	9	149	1398
9869	0.05	9	155	1398
9877	65	8	119	1400
9878	35	8	134	1400
9879	2.2	8	137	1400
9880	0.7	8	146	1400
9881	3	8	149	1400
9882	0.2	8	152	1400
9883	0.05	8	155	1400
9884	65	8	119	1401
9885	35	8	134	1401
9886	2.2	8	137	1401
9887	0.7	8	146	1401
9888	3	8	149	1401
9889	0.2	8	152	1401
9890	0.05	8	155	1401
9891	65	8	119	1402
9892	35	8	134	1402
9893	2.2	8	137	1402
9894	0.7	8	146	1402
9895	3	8	149	1402
9896	0.2	8	152	1402
9897	0.05	8	155	1402
9898	75	1	119	1403
9899	10	1	136	1403
9900	3.5	1	139	1403
9902	0.1	1	155	1403
9903	1.3	1	158	1403
9904	0.3	1	159	1403
9905	30	1	162	1403
9906	50	9	119	1404
9907	50	9	135	1404
9908	2.2	9	137	1404
9910	3	9	149	1404
9911	0.2	9	152	1404
9912	0.3	9	154	1404
9913	0.05	9	155	1404
9914	75	1	119	1405
9915	10	1	136	1405
9916	3.5	1	139	1405
9918	0.1	1	155	1405
9919	0.004	1	157	1405
9920	1.3	1	158	1405
9921	0.3	1	159	1405
9922	30	1	162	1405
9923	80	7	119	1406
9924	20	7	134	1406
9925	2.5	7	137	1406
9926	0.8	7	146	1406
9927	6	7	149	1406
9928	0.07	7	155	1406
9929	50	9	119	1407
9930	50	9	135	1407
9931	2.2	9	137	1407
9933	2	9	149	1407
9934	0.2	9	152	1407
9935	0.3	9	154	1407
9936	0.05	9	155	1407
9937	75	1	119	1408
9938	10	1	136	1408
9939	3.5	1	139	1408
9941	0.1	1	155	1408
9942	0.004	1	157	1408
9943	1.3	1	158	1408
9944	0.3	1	159	1408
9945	30	1	162	1408
9946	75	1	119	1409
9947	8	1	136	1409
9948	3.5	1	139	1409
9950	0.4	1	155	1409
9951	1.8	1	158	1409
9952	0.5	1	159	1409
9953	25	1	162	1409
9957	75	1	119	1411
9959	3.5	1	139	1411
9961	1.8	1	158	1411
9962	0.5	1	159	1411
9963	25	1	162	1411
9964	120	3	119	1412
9965	180	3	135	1412
9966	6	3	137	1412
9967	2.5	3	146	1412
9968	4	3	149	1412
9969	1	3	153	1412
9970	1	3	154	1412
9971	0.25	3	155	1412
9972	25	3	162	1412
9973	120	3	119	1413
9974	180	3	135	1413
9975	5	3	137	1413
9976	2.5	3	146	1413
9977	4	3	149	1413
9978	1	3	153	1413
9979	1	3	154	1413
9980	0.25	3	155	1413
9981	30	3	162	1413
9982	240	1	119	1414
9983	60	1	134	1414
9984	4.1	1	137	1414
9985	0.5	1	146	1414
9986	0.6	1	152	1414
9987	0.12	1	155	1414
9989	240	1	119	1415
9990	60	1	134	1415
9991	4.1	1	137	1415
9992	0.5	1	146	1415
9993	0.6	1	152	1415
9994	0.12	1	155	1415
9995	0.008	1	157	1415
9988	0.008	1	157	1414
9996	240	1	119	1416
9997	60	1	134	1416
9998	4	1	137	1416
9999	0.5	1	146	1416
10000	0.6	1	152	1416
10001	0.12	1	155	1416
10002	0.008	1	157	1416
10003	240	1	119	1417
10004	60	1	134	1417
10005	5.5	1	137	1417
10006	0.5	1	146	1417
9858	0.7	9	146	1397
9909	0.7	9	146	1404
9932	0.7	9	146	1407
9901	0.22	1	146	1403
9917	0.22	1	146	1405
9940	0.22	1	146	1408
9949	1.2	1	147	1409
9960	1.2	1	147	1411
10007	0.6	1	152	1417
10009	0.008	1	157	1417
10012	70	8	134	1418
10014	1.4	8	146	1418
10016	0.2	8	152	1418
10026	270	6	119	1420
10028	5.3	6	137	1420
10030	0.3	6	152	1420
15184	40	9	134	2080
15186	0.7	9	146	2080
15188	0.2	9	152	2080
15197	15	521	134	2082
15199	1	521	146	2082
15201	0.07	521	155	2082
15216	15	521	134	2085
15218	1	521	146	2085
15220	0.07	521	155	2085
10008	0.12	1	155	1417
10010	30	1	162	1417
10011	130	8	119	1418
10013	4.4	8	137	1418
10015	4	8	149	1418
10017	0.1	8	155	1418
10027	30	6	134	1420
10029	0.5	6	146	1420
10031	0.3	6	157	1420
15185	2.2	9	137	2080
15187	3	9	149	2080
15189	0.05	9	155	2080
15196	90	521	119	2082
15198	2.4	521	137	2082
15200	2	521	149	2082
15215	90	521	119	2085
15217	2.4	521	137	2085
15219	2	521	149	2085
10018	50	2	119	1419
10020	5.5	2	137	1419
10022	4	2	149	1419
10024	4.5	2	153	1419
15309	75	1	119	2099
15311	3.5	1	138	2099
15313	0.4	1	155	2099
15315	1.8	1	160	2099
15361	1	1	136	2105
15363	0.22	1	146	2105
15365	0.004	1	157	2105
15367	1.8	1	160	2105
10019	50	2	134	1419
10021	2.5	2	146	1419
10023	0.5	2	152	1419
10025	0.25	2	155	1419
10032	240	1	119	1421
10033	60	1	134	1421
10034	5.5	1	137	1421
10035	0.5	1	146	1421
10036	0.6	1	152	1421
10037	0.12	1	155	1421
10038	0.008	1	157	1421
10039	10	1	162	1421
10040	130	8	119	1422
10041	70	8	134	1422
10042	4.6	8	137	1422
10043	1.4	8	146	1422
10044	4	8	149	1422
10045	0.2	8	152	1422
10046	0.1	8	155	1422
10047	250	2	119	1423
10048	50	2	134	1423
10049	5.5	2	137	1423
10050	2.5	2	146	1423
10051	4.5	2	149	1423
10052	0.5	2	152	1423
10053	0.25	2	155	1423
10054	250	2	119	1424
10055	50	2	134	1424
10056	5.5	2	137	1424
10057	2.5	2	146	1424
10058	4.5	2	149	1424
10059	0.5	2	152	1424
10060	0.25	2	155	1424
10061	75	1	119	1425
10062	10	1	136	1425
10063	3.5	1	139	1425
15310	10	1	136	2099
10065	0.1	1	155	1425
10066	0.004	1	157	1425
10067	1.3	1	158	1425
10068	0.3	1	159	1425
10069	50	1	162	1425
10070	130	8	119	1426
10071	70	8	134	1426
10072	4.4	8	137	1426
10073	1.4	8	146	1426
10074	4	8	149	1426
10075	0.4	8	152	1426
10076	0.1	8	155	1426
10077	240	1	119	1427
10078	60	1	134	1427
10079	5.5	1	137	1427
10080	0.5	1	146	1427
10081	0.6	1	152	1427
10082	0.12	1	155	1427
10084	25	1	162	1427
10085	250	2	119	1428
10086	50	2	134	1428
10087	5.5	2	137	1428
10088	2.5	2	146	1428
10089	4.5	2	149	1428
10090	0.5	2	152	1428
10091	0.25	2	155	1428
10092	120	3	119	1429
10093	180	3	135	1429
10094	5.4	3	137	1429
10095	0.3	3	146	1429
10096	4.5	3	149	1429
10097	0.9	3	152	1429
10098	0.9	3	154	1429
10099	0.25	3	157	1429
10100	30	3	162	1429
10101	130	8	119	1430
10102	70	8	134	1430
10103	4.4	8	137	1430
10104	1.4	8	146	1430
10105	4	8	149	1430
10106	0.4	8	152	1430
10107	0.1	8	155	1430
10108	250	2	119	1431
10109	50	2	134	1431
10110	5.5	2	137	1431
10111	2.5	2	146	1431
10112	4.5	2	149	1431
10113	0.5	2	152	1431
10114	0.25	2	155	1431
10115	75	1	119	1432
10116	10	1	136	1432
10117	3.5	1	139	1432
10119	0.004	1	157	1432
10120	1.3	1	158	1432
10121	0.3	1	159	1432
10122	50	1	162	1432
10123	75	1	119	1433
10124	3	1	136	1433
10127	0.1	1	155	1433
10128	0.004	1	157	1433
10129	2	1	158	1433
10130	0.7	1	159	1433
10131	35	1	162	1433
10132	75	1	119	1434
10133	10	1	136	1434
10134	3.5	1	139	1434
10136	0.1	1	155	1434
10137	0.004	1	157	1434
10138	1.3	1	158	1434
10139	0.3	1	159	1434
10140	40	1	162	1434
10141	75	1	119	1435
10142	10	1	136	1435
10143	3.5	1	139	1435
10145	0.4	1	155	1435
10146	1.8	1	158	1435
10147	0.5	1	159	1435
10148	59	1	162	1435
10149	75	1	119	1436
10150	10	1	136	1436
10151	3.5	1	139	1436
10153	0.4	1	155	1436
10154	1.8	1	158	1436
10155	0.5	1	159	1436
10156	59	1	162	1436
10157	75	1	119	1437
10158	10	1	136	1437
10159	3.5	1	139	1437
10161	0.4	1	155	1437
10162	1.8	1	158	1437
10163	0.5	1	159	1437
10064	0.22	1	146	1425
10118	0.22	1	146	1432
10135	0.22	1	146	1434
10144	1.2	1	147	1435
10152	1.2	1	147	1436
10160	1.2	1	147	1437
10083	0.008	1	157	1427
10164	40	1	162	1437
10165	120	3	119	1438
10166	180	3	135	1438
10167	5.8	3	137	1438
15312	1.2	1	147	2099
10169	4	3	149	1438
10170	1	3	153	1438
10171	1	3	154	1438
10172	0.25	3	155	1438
10173	15	3	162	1438
10174	120	3	119	1439
10175	180	3	135	1439
10176	4.8	3	137	1439
10178	4	3	149	1439
10179	1	3	153	1439
10180	1	3	154	1439
10181	0.25	3	155	1439
10182	75	1	119	1440
10183	3	1	136	1440
10184	3.5	1	138	1440
10186	0.1	1	155	1440
10187	0.004	1	157	1440
10188	2	1	158	1440
10189	0.7	1	159	1440
10190	60	1	162	1440
10191	75	1	119	1441
10192	3	1	136	1441
10193	3.5	1	138	1441
10195	0.1	1	155	1441
10196	0.004	1	157	1441
10197	2	1	158	1441
10198	0.7	1	159	1441
10199	40	1	162	1441
10200	75	1	119	1442
10201	10	1	136	1442
10202	3.5	1	139	1442
10204	0.1	1	155	1442
10205	0.004	1	157	1442
10206	1.3	1	158	1442
10208	50	1	162	1442
10209	75	1	119	1443
10210	10	1	136	1443
10211	3.5	1	139	1443
10213	0.1	1	155	1443
10214	0.004	1	157	1443
10216	0.3	1	159	1443
10217	50	1	162	1443
10218	75	1	119	1444
10219	10	1	136	1444
10220	3.5	1	139	1444
10222	0.1	1	155	1444
10223	0.004	1	157	1444
10224	1.3	1	158	1444
10225	0.3	1	159	1444
10226	50	1	162	1444
10227	75	1	119	1445
10228	3	1	136	1445
10229	3.5	1	138	1445
10231	0.1	1	155	1445
10232	0.004	1	157	1445
10233	2	1	158	1445
10234	0.7	1	159	1445
10235	40	1	162	1445
10236	75	1	119	1446
10237	10	1	136	1446
10238	3.5	1	139	1446
10240	0.1	1	155	1446
10241	0.004	1	157	1446
10242	1.3	1	158	1446
10243	0.3	1	159	1446
10244	50	1	162	1446
10245	75	2	119	1447
10246	10	2	136	1447
10247	3.5	2	139	1447
10249	0.4	2	155	1447
10250	1.8	2	158	1447
10251	0.5	2	159	1447
10252	50	2	162	1447
10253	75	2	119	1448
10255	3.5	2	139	1448
10257	0.4	2	155	1448
10258	1.8	2	158	1448
10259	0.5	2	159	1448
10260	30	2	162	1448
10261	75	2	119	1449
10262	10	2	136	1449
10263	3.5	2	139	1449
10265	0.4	2	155	1449
10266	1.8	2	158	1449
10267	0.5	2	159	1449
10268	30	2	162	1449
10254	10	2	136	1448
10269	75	2	119	1450
10270	10	2	136	1450
10271	3.5	2	139	1450
10273	0.4	2	155	1450
10274	1.8	2	158	1450
10275	0.5	2	159	1450
10276	15	2	162	1450
10277	75	2	119	1451
10278	10	2	136	1451
10279	3.5	2	139	1451
10281	0.4	2	155	1451
10282	1.8	2	158	1451
10283	0.5	2	159	1451
10284	15	2	162	1451
10285	75	2	119	1452
10286	10	2	136	1452
10287	3.5	2	139	1452
10289	0.4	2	155	1452
10290	1.8	2	158	1452
10291	0.5	2	159	1452
10292	15	2	162	1452
10293	75	2	119	1453
10294	10	2	136	1453
10295	3.5	2	139	1453
10297	0.4	2	155	1453
10298	1.8	2	158	1453
10299	0.5	2	159	1453
10301	75	2	119	1454
10185	0.22	1	146	1440
10194	0.22	1	146	1441
10203	0.22	1	146	1442
10212	0.22	1	146	1443
10221	0.22	1	146	1444
10230	0.22	1	146	1445
10239	0.22	1	146	1446
10248	1.2	2	147	1447
10256	1.2	2	147	1448
10264	1.2	2	147	1449
10272	1.2	2	147	1450
10280	1.2	2	147	1451
10288	1.2	2	147	1452
10296	1.2	2	147	1453
10300	15	2	162	1453
10303	3.5	2	139	1454
10306	0.5	2	159	1454
15314	0.5	1	159	2099
15316	15	1	162	2099
15360	75	1	119	2105
15362	3.5	1	138	2105
15364	0.1	1	155	2105
15366	0.5	1	159	2105
15368	15	1	162	2105
10125	3.5	1	139	1433
10207	0.3	1	159	1442
10302	10	2	136	1454
10305	0.4	2	155	1454
10308	40	2	162	1454
9958	8	1	136	1411
15334	75	1	119	2102
15335	10	1	136	2102
15336	3.5	1	139	2102
15337	0.22	1	146	2102
15338	0.1	1	155	2102
15339	0.3	1	159	2102
15340	1.3	1	160	2102
15341	15	1	162	2102
15351	75	1	119	2104
15352	10	1	136	2104
15353	3.5	1	139	2104
15354	0.22	1	146	2104
15355	0.1	1	155	2104
15356	0.004	1	157	2104
15357	0.3	1	159	2104
15358	1.3	1	160	2104
15359	15	1	162	2104
15369	75	1	119	2106
15370	10	1	136	2106
15371	3.5	1	139	2106
15372	0.22	1	146	2106
15373	0.1	1	155	2106
15374	0.004	1	157	2106
15375	0.3	1	159	2106
15376	1.3	1	160	2106
15377	15	1	162	2106
15325	75	1	119	2101
10307	1.8	2	160	1454
15326	10	1	136	2101
10304	1.2	2	147	1454
15327	3.5	1	139	2101
15328	0.22	1	146	2101
15329	0.1	1	155	2101
15330	0.004	1	157	2101
15331	0.3	1	159	2101
15332	1.3	1	160	2101
15333	15	1	162	2101
15342	75	1	119	2103
8979	0.1	3	146	1285
9482	0.7	9	146	1348
9504	0.1	7	146	1351
9634	2.5	3	146	1369
9743	0.7	9	146	1382
10168	2.5	3	146	1438
10177	2.5	3	146	1439
9042	0.22	1	146	1293
10309	75	1	120	1455
10310	10	1	136	1455
10311	3.5	1	139	1455
10312	1.2	1	147	1455
10313	0.4	1	155	1455
10314	1.8	1	158	1455
10315	0.5	1	159	1455
10316	10	1	162	1455
10317	75	1	120	1456
10318	10	1	136	1456
10319	3.5	1	139	1456
10320	1.2	1	147	1456
10321	0.4	1	155	1456
10322	1.8	1	158	1456
10323	0.5	1	159	1456
10324	10	1	162	1456
9328	0.22	1	146	1328
10126	0.22	1	146	1433
10325	75	2	119	1457
10326	10	2	136	1457
10327	3.5	2	139	1457
10328	1.2	2	147	1457
10329	0.4	2	155	1457
10330	1.8	2	158	1457
10331	0.5	2	159	1457
10332	15	2	162	1457
10333	75	2	119	1458
10334	10	2	136	1458
10335	3.5	2	139	1458
10336	1.2	2	147	1458
10337	0.4	2	155	1458
10338	1.8	2	158	1458
10339	0.5	2	159	1458
10340	15	2	162	1458
10341	75	1	119	1459
10342	10	1	136	1459
10343	3.5	1	139	1459
10344	0.22	1	146	1459
10345	0.1	1	155	1459
10346	0.004	1	157	1459
10347	1.3	1	158	1459
10348	0.3	1	159	1459
10349	20	1	162	1459
10350	75	2	119	1460
10351	10	2	136	1460
10352	3.5	2	139	1460
10353	1.2	2	147	1460
10354	0.4	2	155	1460
10355	1.8	2	158	1460
10356	0.5	2	159	1460
10357	75	2	119	1461
10358	8	2	136	1461
10359	3.5	2	138	1461
10360	1.2	2	147	1461
10361	0.4	2	155	1461
10362	1.8	2	158	1461
10363	0.5	2	159	1461
10364	15	2	162	1461
10365	75	2	119	1462
10366	8	2	136	1462
10367	3.5	2	138	1462
10368	1.2	2	147	1462
10369	0.4	2	155	1462
10370	1.8	2	158	1462
10371	0.5	2	159	1462
10372	15	2	162	1462
10373	75	2	119	1463
10374	8	2	136	1463
10375	3.5	2	138	1463
10376	1.2	2	147	1463
10377	0.4	2	155	1463
10378	1.8	2	158	1463
10379	0.5	2	159	1463
10380	15	2	162	1463
10381	75	2	119	1464
10382	8	2	136	1464
10383	3.5	2	138	1464
10384	1.2	2	147	1464
10385	0.4	2	155	1464
10386	1.8	2	158	1464
10387	0.5	2	159	1464
10388	15	2	162	1464
10389	75	1	119	1465
10390	1	1	136	1465
10391	3.5	1	138	1465
10392	0.22	1	146	1465
10393	0.1	1	155	1465
10394	0.004	1	157	1465
10395	0.5	1	159	1465
10396	1.8	1	160	1465
10397	14	1	162	1465
10398	75	1	119	1466
10399	10	1	136	1466
10400	3.5	1	139	1466
10401	0.22	1	146	1466
10402	0.1	1	155	1466
10403	0.004	1	157	1466
10404	0.3	1	159	1466
10405	1.3	1	160	1466
10406	25	1	162	1466
10407	75	1	119	1467
10408	1	1	136	1467
10409	3.5	1	138	1467
10410	0.22	1	146	1467
10411	0.1	1	155	1467
10412	0.004	1	157	1467
10415	75	1	119	1468
10416	10	1	136	1468
10417	3.5	1	139	1468
10418	0.22	1	146	1468
10419	0.1	1	155	1468
10420	0.004	1	157	1468
10421	1.3	1	158	1468
10422	0.3	1	159	1468
10423	25	1	162	1468
10424	75	1	119	1469
10425	1	1	136	1469
10426	3.5	1	138	1469
10427	0.22	1	146	1469
10428	0.1	1	155	1469
10429	0.004	1	157	1469
10430	1.8	1	158	1469
10431	0.5	1	159	1469
10432	75	1	119	1470
10433	10	1	136	1470
10414	0.5	1	159	1467
10434	3.5	1	139	1470
10437	0.004	1	157	1470
10440	40	1	162	1470
10460	3.5	2	138	1473
10463	0.5	2	159	1473
10468	3.5	2	138	1474
10471	1.8	2	158	1474
15343	10	1	136	2103
10479	1.8	2	158	1475
10482	75	1	119	1476
10485	0.22	1	146	1476
10488	0.5	1	159	1476
10476	3.5	2	138	1475
10499	35	8	134	1478
10502	3	8	149	1478
10513	35	8	134	1480
10516	3	8	149	1480
10521	1.9	2	137	1481
10524	0.2	2	152	1481
10542	80	7	119	1484
10545	0.8	7	146	1484
10555	50	9	135	1486
10561	50	9	119	1487
10564	0.7	9	146	1487
10567	0.3	9	154	1487
10558	2	9	149	1486
15344	3.5	1	138	2103
15345	0.22	1	146	2103
15346	0.1	1	155	2103
15347	0.004	1	157	2103
15348	0.5	1	159	2103
15349	1.8	1	160	2103
15350	15	1	162	2103
10435	0.22	1	146	1470
10438	1.3	1	158	1470
10458	75	2	119	1473
10461	1.2	2	147	1473
10464	1.8	2	160	1473
10466	75	2	119	1474
10469	1.2	2	147	1474
10472	0.5	2	159	1474
10474	75	2	119	1475
10477	1.2	2	147	1475
10480	0.5	2	159	1475
10483	6	1	136	1476
10486	0.1	1	155	1476
10489	1.8	1	160	1476
10498	65	8	119	1478
10501	0.7	8	146	1478
10504	0.05	8	155	1478
10512	65	8	119	1480
10515	0.7	8	146	1480
10518	0.05	8	155	1480
10520	20	2	134	1481
10523	2	2	149	1481
10544	2.5	7	137	1484
10547	0.07	7	155	1484
10554	50	9	119	1486
10557	0.7	9	146	1486
10560	0.05	9	155	1486
10563	2.2	9	137	1487
10566	0.2	9	152	1487
15378	75	1	119	2107
15379	10	1	136	2107
15380	3.5	1	139	2107
15381	0.22	1	146	2107
15382	0.1	1	155	2107
15383	0.004	1	157	2107
15384	0.5	1	159	2107
15385	1.8	1	160	2107
15386	15	1	162	2107
15411	75	1	119	2111
15412	10	1	136	2111
15413	3.5	1	138	2111
15414	1.2	1	147	2111
15415	0.4	1	155	2111
15416	0.5	1	159	2111
15417	1.8	1	160	2111
15418	15	1	162	2111
15437	75	1	119	2114
15438	6	1	136	2114
15439	3.5	1	138	2114
15440	1.2	1	147	2114
15441	0.4	1	155	2114
15442	0.5	1	159	2114
15443	1.8	1	160	2114
15444	15	1	162	2114
15461	75	2	119	2117
15462	10	2	136	2117
15463	3.5	2	138	2117
15464	1.2	2	147	2117
15465	0.4	2	155	2117
15466	0.5	2	159	2117
15467	1.8	2	160	2117
15468	15	2	162	2117
15503	75	1	119	2122
15505	3.5	1	139	2122
15507	0.1	1	155	2122
15509	0.3	1	159	2122
15511	15	1	162	2122
15548	10	1	136	2127
15550	0.22	1	146	2127
15552	0.004	1	157	2127
15554	1.8	1	159	2127
15557	10	2	136	2128
15559	1.2	2	147	2128
15561	0.5	2	159	2128
15563	15	2	162	2128
15613	80	7	130	2135
15615	2.4	7	137	2135
15617	4	7	149	2135
15626	80	7	130	2137
15628	2.5	7	137	2137
15630	3	7	149	2137
15679	90	521	119	2145
15681	2.3	521	137	2145
15683	2	521	149	2145
15685	60	9	119	2146
15687	2.2	9	137	2146
15689	3	9	149	2146
15691	0.05	9	155	2146
15719	60	9	119	2151
15721	2.2	9	137	2151
15723	3	9	149	2151
15725	0.05	9	155	2151
15735	15	521	134	2153
15737	1	521	146	2153
15739	0.07	521	155	2153
15753	90	521	119	2156
15755	2.3	521	137	2156
15757	2	521	149	2156
15772	90	521	119	2159
15774	2.3	521	137	2159
15776	2	521	149	2159
15819	50	9	135	2166
15821	0.7	9	146	2166
15823	0.2	9	152	2166
15825	0.05	9	155	2166
15874	75	1	119	2174
15875	10	1	136	2174
15876	3	1	139	2174
15877	0.22	1	146	2174
15878	0.1	1	155	2174
15879	0.004	1	157	2174
15880	0.3	1	159	2174
15881	1.3	1	160	2174
15882	15	1	162	2174
15883	75	1	119	2175
15884	10	1	136	2175
15885	3	1	138	2175
15886	0.22	1	146	2175
15887	0.1	1	155	2175
15888	0.004	1	157	2175
15889	0.5	1	159	2175
15890	1.8	1	160	2175
15891	20	1	162	2175
15892	75	1	119	2176
15893	1	1	136	2176
15894	3.5	1	138	2176
15895	0.22	1	146	2176
15896	0.1	1	155	2176
15897	0.004	1	157	2176
15898	0.5	1	159	2176
15899	1.8	1	160	2176
15925	75	2	119	2180
15926	6	2	136	2180
15927	3.5	2	138	2180
15928	1.2	2	147	2180
15929	0.4	2	155	2180
10436	0.1	1	155	1470
10439	0.3	1	159	1470
10459	8	2	136	1473
10462	0.4	2	155	1473
10465	25	2	162	1473
10467	8	2	136	1474
10470	0.4	2	155	1474
10473	15	2	162	1474
10475	8	2	136	1475
10478	0.4	2	155	1475
10481	15	2	162	1475
10484	3.5	1	138	1476
10487	0.004	1	157	1476
10490	30	1	162	1476
10500	2.2	8	137	1478
10503	0.2	8	152	1478
10514	2.2	8	137	1480
10517	0.2	8	152	1480
10519	80	2	119	1481
10522	0.2	2	146	1481
10525	0.05	2	155	1481
10543	20	7	134	1484
10546	6	7	149	1484
10556	2.2	9	137	1486
10559	0.3	9	154	1486
10562	50	9	135	1487
10565	2	9	149	1487
10568	0.05	9	155	1487
15387	75	1	119	2108
15388	6	1	136	2108
15389	3.5	1	138	2108
15390	1.2	1	147	2108
15391	0.4	1	155	2108
15392	0.5	1	159	2108
15393	1.8	1	160	2108
15394	15	1	162	2108
15395	75	1	119	2109
15397	3.5	1	138	2109
15399	0.4	1	155	2109
15401	1.8	1	160	2109
15403	75	1	119	2110
15405	3.5	1	138	2110
15407	0.4	1	155	2110
15409	1.8	1	160	2110
15419	75	1	119	2112
15421	3.5	1	138	2112
15423	0.1	1	155	2112
15425	0.5	1	159	2112
15427	15	1	162	2112
15486	10	1	136	2120
15488	0.22	1	146	2120
15490	0.004	1	157	2120
15492	1.3	1	160	2120
15495	10	1	136	2121
15497	0.22	1	146	2121
15499	0.004	1	157	2121
15501	1.3	1	160	2121
15521	75	1	119	2124
15523	3.5	1	138	2124
15525	0.1	1	155	2124
15527	0.5	1	159	2124
15529	15	1	162	2124
15531	10	1	136	2125
15533	0.22	1	146	2125
15535	0.004	1	157	2125
15537	1.8	1	160	2125
15564	75	2	119	2129
15566	3.5	2	138	2129
15568	0.4	2	155	2129
15570	1.8	2	160	2129
15572	75	2	119	2130
15574	3.5	2	138	2130
15576	0.4	2	155	2130
15578	1.8	2	160	2130
15589	75	1	119	2132
15591	3.5	1	138	2132
15593	0.1	1	155	2132
15595	0.5	1	159	2132
15597	15	1	162	2132
15598	75	1	119	2133
15600	3.5	1	139	2133
15602	0.1	1	155	2133
15604	0.3	1	159	2133
15606	15	1	162	2133
15607	80	7	130	2134
15609	2.5	7	137	2134
15611	3	7	149	2134
15632	65	7	130	2138
15634	2.2	7	137	2138
15636	3	7	149	2138
15638	0.05	7	155	2138
15640	20	7	134	2139
15642	1	7	146	2139
15644	0.07	7	155	2139
15652	35	8	134	2141
15654	0.7	8	146	2141
15656	0.2	8	152	2141
15658	90	521	119	2142
15660	2.4	521	137	2142
15662	2	521	149	2142
15665	40	9	134	2143
15667	0.7	9	146	2143
15669	0.2	9	152	2143
15671	50	9	119	2144
15673	1.9	9	137	2144
15675	2	9	149	2144
15677	0.2	9	154	2144
15747	40	9	134	2155
15749	0.7	9	146	2155
15751	0.2	9	152	2155
15759	90	521	119	2157
15761	2.3	521	137	2157
15763	2	521	149	2157
15779	15	521	134	2160
15781	1	521	146	2160
15783	0.07	521	155	2160
15796	50	9	119	2163
15798	1.9	9	137	2163
15800	2	9	149	2163
15802	0.2	9	154	2163
15804	65	8	119	2164
15806	2.2	8	137	2164
15808	3	8	149	2164
15810	0.05	8	155	2164
15827	35	8	134	2167
15829	0.7	8	146	2167
15831	0.2	8	152	2167
15869	20	7	134	2173
15871	1	7	146	2173
15873	0.07	7	155	2173
15900	75	1	119	2177
15901	10	1	136	2177
15902	3.5	1	138	2177
15903	0.22	1	146	2177
15904	0.1	1	155	2177
15905	0.004	1	157	2177
10441	75	1	119	1471
10443	3.5	1	138	1471
10445	0.1	1	155	1471
10447	0.5	1	159	1471
10449	30	1	162	1471
10548	80	7	119	1485
10550	2.5	7	137	1485
10552	6	7	149	1485
10569	50	9	119	1488
10571	2.2	9	137	1488
10573	2	9	149	1488
10575	0.3	9	154	1488
10617	180	3	135	1494
10619	2.5	3	146	1494
10621	1	3	152	1494
10623	0.25	3	155	1494
15396	10	1	136	2109
15398	1.2	1	147	2109
15400	0.5	1	159	2109
15402	15	1	162	2109
15404	6	1	136	2110
15406	1.2	1	147	2110
15408	0.5	1	159	2110
15410	15	1	162	2110
15420	10	1	136	2112
15422	0.22	1	146	2112
15424	0.004	1	157	2112
15426	1.8	1	160	2112
15485	75	1	119	2120
15487	3.5	1	139	2120
15489	0.1	1	155	2120
15491	0.3	1	159	2120
15493	15	1	162	2120
15494	75	1	119	2121
15496	3.5	1	139	2121
15498	0.1	1	155	2121
15500	0.3	1	159	2121
15502	15	1	162	2121
15522	10	1	136	2124
15524	0.22	1	146	2124
15526	0.004	1	157	2124
15528	1.8	1	160	2124
15530	75	1	119	2125
15532	3	1	138	2125
15534	0.1	1	155	2125
15536	0.5	1	159	2125
15538	15	1	162	2125
15565	10	2	136	2129
15567	1.2	2	147	2129
15569	0.5	2	159	2129
15571	15	2	162	2129
15573	10	2	136	2130
15575	1.2	2	147	2130
15577	0.5	2	159	2130
15579	15	2	162	2130
15590	10	1	136	2132
15592	0.22	1	146	2132
15594	0.004	1	157	2132
15596	1.8	1	160	2132
15599	10	1	136	2133
15601	0.22	1	146	2133
15603	0.004	1	157	2133
15605	1.3	1	160	2133
15608	20	7	134	2134
15610	1	7	146	2134
15612	0.07	7	155	2134
15633	35	7	134	2138
15635	0.7	7	146	2138
15637	0.2	7	152	2138
15639	80	7	130	2139
15641	2.4	7	137	2139
15643	4	7	149	2139
15651	65	8	130	2141
15653	2.2	8	137	2141
15655	3	8	149	2141
15657	0.05	8	155	2141
15659	15	521	134	2142
15661	1	521	146	2142
15663	0.07	521	155	2142
15664	60	9	119	2143
15666	2.2	9	137	2143
15668	3	9	149	2143
15670	0.05	9	155	2143
15672	50	9	135	2144
15674	0.7	9	146	2144
15676	0.2	9	152	2144
15678	0.05	9	155	2144
15746	60	9	119	2155
15748	2.2	9	137	2155
15750	3	9	149	2155
15752	0.05	9	155	2155
15760	15	521	134	2157
15762	1	521	146	2157
15764	0.07	521	155	2157
15778	90	521	119	2160
15780	2.3	521	137	2160
15782	2	521	149	2160
15797	50	9	135	2163
15799	0.7	9	146	2163
15801	0.2	9	152	2163
15803	0.05	9	155	2163
15805	35	8	134	2164
15807	0.7	8	146	2164
15809	0.2	8	152	2164
15826	65	8	119	2167
15828	2.2	8	137	2167
15830	3	8	149	2167
15832	0.05	8	155	2167
15868	80	7	130	2173
15870	2.5	7	137	2173
15872	3	7	149	2173
15906	0.5	1	159	2177
15907	1.8	1	160	2177
15908	15	1	162	2177
15933	75	1	119	2181
15934	1	1	136	2181
15935	3.5	1	138	2181
15936	0.22	1	146	2181
15937	0.1	1	155	2181
15938	0.004	1	157	2181
15939	0.5	1	159	2181
15940	1.8	1	160	2181
15959	75	1	119	2184
15960	10	1	136	2184
15961	3.5	1	139	2184
15962	0.22	1	146	2184
15963	0.1	1	155	2184
15964	0.004	1	157	2184
15965	0.3	1	159	2184
15966	1.3	1	160	2184
15967	15	1	162	2184
15986	75	1	119	2187
15987	10	1	136	2187
15988	3.5	1	138	2187
15989	0.22	1	146	2187
15990	0.1	1	155	2187
10442	6	1	136	1471
10444	0.22	1	146	1471
10446	0.004	1	157	1471
10448	1.8	1	160	1471
10450	75	2	119	1472
10451	10	2	136	1472
10452	3.5	2	138	1472
10453	1.2	2	147	1472
10454	0.4	2	155	1472
10455	0.5	2	159	1472
10456	1.8	2	160	1472
10457	25	2	162	1472
10526	50	9	119	1482
10527	50	9	135	1482
10528	2.2	9	137	1482
10529	0.7	9	146	1482
10530	2	9	149	1482
10531	0.2	9	152	1482
10532	0.3	9	154	1482
10533	0.05	9	155	1482
10534	50	9	119	1483
10535	50	9	135	1483
10536	2.2	9	137	1483
10537	0.7	9	146	1483
10538	2	9	149	1483
10539	0.2	9	152	1483
10540	0.3	9	154	1483
10541	0.05	9	155	1483
10549	20	7	134	1485
10551	0.8	7	146	1485
10553	0.07	7	155	1485
10570	50	9	135	1488
10572	0.7	9	146	1488
10574	0.2	9	152	1488
10576	0.05	9	155	1488
10577	50	9	119	1489
10578	50	9	135	1489
10579	2.2	9	137	1489
10580	0.7	9	146	1489
10581	2	9	149	1489
10582	0.2	9	152	1489
10583	0.3	9	154	1489
10584	0.05	9	155	1489
10585	80	1	119	1490
10586	20	1	134	1490
10587	2.5	1	137	1490
10588	0.8	1	146	1490
10589	6	1	149	1490
10590	0.07	1	155	1490
10616	120	3	119	1494
10618	5	3	137	1494
10620	4	3	149	1494
10622	1	3	154	1494
10624	15	3	162	1494
15428	75	1	119	2113
15430	3.5	1	139	2113
15432	0.1	1	155	2113
15434	0.3	1	159	2113
15436	15	1	162	2113
15446	6	2	136	2115
15448	1.2	2	147	2115
15450	0.5	2	159	2115
15452	15	2	162	2115
15478	6	2	136	2119
15480	1.2	2	147	2119
15482	0.5	2	159	2119
15484	15	2	162	2119
15513	10	1	136	2123
15515	0.22	1	146	2123
15517	0.004	1	157	2123
15519	1.3	1	160	2123
15539	75	1	119	2126
15541	3.5	1	138	2126
15543	0.1	1	155	2126
15545	0.5	1	159	2126
15580	75	1	119	2131
15582	3.5	1	138	2131
15584	0.1	1	155	2131
15586	0.5	1	159	2131
15588	15	1	162	2131
15646	20	7	134	2140
15648	1	7	146	2140
15650	0.07	7	155	2140
15693	15	521	134	2147
15695	1	521	146	2147
15697	0.07	521	155	2147
15698	60	9	119	2148
15700	2.2	9	137	2148
15702	3	9	149	2148
15704	0.05	9	155	2148
15705	50	9	119	2149
15707	2	9	137	2149
15709	2	9	149	2149
15711	0.3	9	154	2149
15727	50	9	135	2152
15729	0.7	9	146	2152
15731	0.2	9	152	2152
15733	0.05	9	155	2152
15842	60	9	130	2169
15844	2.2	9	137	2169
15846	3	9	149	2169
15848	0.05	9	155	2169
15862	80	7	130	2172
15865	1	7	146	2172
15909	75	1	119	2178
15910	10	1	136	2178
15911	3.5	1	138	2178
15912	1.2	1	147	2178
15913	0.4	1	155	2178
15914	0.5	1	159	2178
15915	1.8	1	160	2178
15916	15	1	162	2178
15917	75	2	119	2179
15918	10	2	136	2179
15919	3.5	2	138	2179
15920	1.2	2	146	2179
15921	0.4	2	155	2179
15922	0.5	2	159	2179
15923	1.8	2	160	2179
15924	15	2	162	2179
15941	75	1	119	2182
15942	10	1	136	2182
15943	3.5	1	138	2182
15944	0.22	1	146	2182
15945	0.1	1	155	2182
15946	0.004	1	157	2182
15947	0.5	1	159	2182
15948	1.8	1	160	2182
15949	15	1	162	2182
15950	75	1	119	2183
15951	10	1	136	2183
15952	3.5	1	139	2183
15953	0.22	1	146	2183
15954	0.1	1	155	2183
15955	0.004	1	157	2183
15956	0.3	1	159	2183
10491	80	2	119	1477
10493	1.9	2	137	1477
10495	2	2	149	1477
10497	0.05	2	155	1477
10505	65	8	119	1479
10507	2.2	8	137	1479
10509	3	8	149	1479
10511	0.05	8	155	1479
10591	120	3	119	1491
10593	5	3	137	1491
10595	4	3	149	1491
10597	1	3	154	1491
10599	20	3	162	1491
10601	75	5	134	1492
10603	0.5	5	146	1492
10605	0.6	5	152	1492
10607	0.008	5	157	1492
10608	225	5	119	1493
10610	4.5	5	137	1493
10612	4.5	5	149	1493
10614	0.12	5	155	1493
15429	10	1	136	2113
15431	0.22	1	146	2113
15433	0.004	1	157	2113
15435	1.3	1	160	2113
15445	75	2	119	2115
15447	3.5	2	138	2115
15449	0.4	2	155	2115
15451	1.8	2	160	2115
15477	75	2	119	2119
15479	3.5	2	138	2119
15481	0.4	2	155	2119
15483	1.8	2	160	2119
15512	75	1	119	2123
15514	3.5	1	139	2123
15516	0.1	1	155	2123
15518	0.3	1	159	2123
15520	15	1	162	2123
15540	1	1	136	2126
15542	0.22	1	146	2126
15544	0.004	1	157	2126
15546	1.8	1	160	2126
15581	10	1	136	2131
15583	0.22	1	146	2131
15585	0.004	1	157	2131
15587	1.8	1	160	2131
15645	80	7	130	2140
15647	2.4	7	137	2140
15649	4	7	149	2140
15692	90	521	119	2147
15694	2.3	521	137	2147
15696	2	521	149	2147
15699	40	9	134	2148
15701	0.7	9	146	2148
15703	0.2	9	152	2148
15706	50	9	134	2149
15708	0.7	9	146	2149
15710	0.2	9	152	2149
15712	0.05	9	155	2149
15726	50	9	119	2152
15728	2	9	137	2152
15730	2	9	149	2152
15732	0.3	9	154	2152
15843	40	9	134	2169
15845	0.7	9	146	2169
15847	0.2	9	152	2169
15864	2.4	7	137	2172
15867	0.07	7	155	2172
15930	0.5	2	159	2180
15931	1.8	2	160	2180
15932	15	2	162	2180
15969	10	1	136	2185
15971	0.22	1	146	2185
15973	0.004	1	157	2185
15975	1.3	1	160	2185
16011	75	2	119	2190
16013	3.5	2	138	2190
16015	0.4	2	155	2190
16017	1.8	2	160	2190
16036	75	2	119	2193
16038	3.5	2	138	2193
16040	0.4	2	155	2193
16042	1.8	2	160	2193
16045	10	1	136	2194
16047	0.22	1	146	2194
16049	0.004	1	157	2194
16051	1.8	1	160	2194
10492	20	2	134	1477
10494	0.2	2	146	1477
10496	0.2	2	152	1477
10506	35	8	134	1479
10508	0.7	8	146	1479
10510	0.2	8	152	1479
10592	180	3	135	1491
10594	2.5	3	146	1491
10596	1	3	152	1491
10598	0.25	3	155	1491
10600	225	5	119	1492
10602	6.5	5	137	1492
10604	4.5	5	149	1492
10606	0.12	5	155	1492
10609	75	5	134	1493
10611	0.5	5	146	1493
10613	0.6	5	152	1493
10615	0.008	5	157	1493
10625	120	3	119	1495
10626	180	3	135	1495
10627	5	3	137	1495
10628	2.5	3	146	1495
10629	4	3	149	1495
10630	1	3	152	1495
10631	1	3	154	1495
10632	0.25	3	155	1495
10633	15	3	162	1495
10634	225	5	119	1496
10635	75	5	134	1496
10636	6.5	5	137	1496
10637	0.5	5	146	1496
10638	4.5	5	149	1496
10639	0.6	5	152	1496
10640	0.12	5	155	1496
10641	0.008	5	157	1496
10642	120	3	119	1497
10643	180	3	135	1497
10644	5	3	137	1497
10645	2.5	3	146	1497
10646	4	3	149	1497
10647	1	3	152	1497
10648	1	3	154	1497
10649	0.25	3	155	1497
10650	40	3	162	1497
10651	225	5	119	1498
10652	75	5	134	1498
10653	6.5	5	137	1498
10654	0.5	5	146	1498
10655	4.5	5	149	1498
10656	0.6	5	152	1498
10657	0.12	5	155	1498
10658	0.008	5	157	1498
10659	120	3	119	1499
10660	180	3	135	1499
10661	5	3	137	1499
10662	2.5	3	146	1499
10663	4	3	149	1499
10664	1	3	152	1499
10665	40	3	162	1499
10666	250	12	119	1500
10667	50	12	134	1500
10668	6	12	137	1500
10669	3.5	12	146	1500
10670	4.5	12	149	1500
10671	0.5	12	152	1500
10672	0.25	12	155	1500
10673	225	5	119	1501
10674	75	5	134	1501
10675	6.5	5	137	1501
10676	0.5	5	146	1501
10677	4.5	5	149	1501
10678	0.6	5	152	1501
10679	0.12	5	155	1501
10680	0.008	5	157	1501
10681	120	3	119	1502
10682	180	3	135	1502
10683	5	3	137	1502
10684	2.5	3	146	1502
10685	4	3	149	1502
10686	1	3	152	1502
10687	1	3	154	1502
10688	0.25	3	155	1502
10689	50	3	162	1502
10690	250	12	119	1503
10691	50	12	134	1503
10692	6	12	137	1503
10693	3.5	12	146	1503
10694	4.5	12	149	1503
10695	0.5	12	152	1503
10696	0.25	12	155	1503
10697	225	5	119	1504
10698	75	5	134	1504
10699	5.3	5	137	1504
10700	0.5	5	146	1504
10701	4.5	5	149	1504
10702	0.8	5	152	1504
10703	0.12	5	155	1504
10704	0.01	5	157	1504
10705	15	5	162	1504
10706	250	2	119	1505
10707	50	2	134	1505
10708	6	2	137	1505
10709	2.5	2	146	1505
10710	4.5	2	149	1505
10711	0.5	2	152	1505
10712	0.25	2	155	1505
10713	190	2	119	1506
10714	110	2	135	1506
10715	6.3	2	137	1506
10716	2.5	2	146	1506
10717	4.5	2	149	1506
10718	0.8	2	152	1506
10719	1	2	154	1506
10720	0.25	2	155	1506
10721	240	2	119	1507
10722	60	2	134	1507
10723	5.8	2	137	1507
10724	2.5	2	146	1507
10725	4.5	2	149	1507
10726	0.8	2	152	1507
10727	0.25	2	155	1507
10728	190	2	119	1508
10729	110	2	135	1508
10730	6.3	2	137	1508
10731	2.5	2	146	1508
10732	4.5	2	149	1508
10733	0.8	2	152	1508
10734	1	2	154	1508
10735	0.25	2	155	1508
10736	225	5	119	1509
10737	75	5	134	1509
10738	5.3	5	137	1509
10739	0.5	5	146	1509
10740	4.5	5	149	1509
10741	0.8	5	152	1509
10742	0.12	5	155	1509
10743	0.008	5	157	1509
10753	50	12	134	1511
10756	4.5	12	149	1511
15453	75	1	119	2116
15455	3.5	1	138	2116
15457	0.1	1	155	2116
15459	0.5	1	159	2116
15469	75	1	119	2118
15471	3.5	1	138	2118
15473	0.4	1	155	2118
15475	1.8	1	160	2118
15619	65	8	130	2136
15621	2.2	8	137	2136
15623	3	8	149	2136
15625	0.05	8	155	2136
15714	15	521	134	2150
15716	1	521	146	2150
15718	0.07	521	155	2150
15741	15	521	134	2154
15743	1	521	146	2154
15745	0.07	521	155	2154
15766	40	9	134	2158
15768	0.7	9	146	2158
15770	0.2	9	152	2158
15785	15	521	134	2161
15787	1	521	146	2161
15789	0.07	521	155	2161
15791	15	521	134	2162
15793	1	521	146	2162
15795	0.07	521	155	2162
15811	65	8	119	2165
15813	2.2	8	137	2165
15815	3	8	149	2165
15817	0.05	8	155	2165
15833	40	4	130	2168
15835	1.6	4	137	2168
15837	1	4	149	2168
15839	0.3	4	154	2168
15841	20	4	162	2168
15850	20	7	134	2170
15852	1	7	146	2170
15854	0.07	7	155	2170
15856	40	9	134	2171
15858	0.7	9	146	2171
15860	0.2	9	152	2171
15957	1.3	1	160	2183
15958	15	1	162	2183
10744	15	5	162	1509
10754	6	12	137	1511
10757	0.5	12	152	1511
15454	1	1	136	2116
15456	0.22	1	146	2116
15458	0.004	1	157	2116
15460	1.8	1	160	2116
15470	10	1	136	2118
15472	1.2	1	147	2118
15474	0.5	1	159	2118
15476	15	1	162	2118
15620	35	8	134	2136
15622	0.7	8	146	2136
15624	0.2	8	152	2136
15713	90	521	119	2150
15715	2.3	521	137	2150
15717	2	521	149	2150
15740	90	521	119	2154
15742	2.3	521	137	2154
15744	2	521	149	2154
15765	60	9	119	2158
15767	2.2	9	137	2158
15769	3	9	149	2158
15771	0.05	9	155	2158
15784	90	521	119	2161
15786	2.3	521	137	2161
15788	2	521	149	2161
15790	90	521	119	2162
15792	2.3	521	137	2162
15794	2	521	149	2162
15812	35	8	134	2165
15814	0.7	8	146	2165
15816	0.2	8	152	2165
15834	40	4	134	2168
15836	0.2	4	146	2168
15838	0.3	4	152	2168
15840	0.07	4	157	2168
15849	80	7	130	2170
15851	2.3	7	137	2170
15853	4	7	149	2170
15855	60	9	130	2171
15857	2.2	9	137	2171
15859	3	9	149	2171
15861	0.07	9	155	2171
15968	75	1	119	2185
15970	3.5	1	139	2185
15972	0.1	1	155	2185
15974	0.3	1	159	2185
15976	15	1	162	2185
16012	10	2	136	2190
16014	1.2	2	147	2190
16016	0.5	2	159	2190
16018	15	2	162	2190
16037	10	2	136	2193
16039	1.2	2	147	2193
16041	0.5	2	159	2193
16043	15	2	162	2193
16044	75	1	119	2194
16046	3.5	1	138	2194
16048	0.1	1	155	2194
16050	0.5	1	159	2194
16052	15	1	162	2194
10745	240	2	119	1510
10748	2.5	2	146	1510
10751	0.25	2	155	1510
15504	10	1	136	2122
15506	0.22	1	146	2122
15508	0.004	1	157	2122
15510	1.3	1	160	2122
15547	75	1	119	2127
15549	3.5	1	138	2127
15551	0.1	1	155	2127
15553	0.5	1	158	2127
15555	15	1	162	2127
15556	75	2	119	2128
15558	3.5	2	138	2128
15560	0.4	2	155	2128
15562	1.8	2	160	2128
15614	20	7	134	2135
15616	1	7	146	2135
15618	0.07	7	155	2135
15627	20	7	134	2137
15629	1	7	146	2137
15631	0.07	7	155	2137
15680	15	521	134	2145
15682	1	521	146	2145
15684	0.07	521	155	2145
15686	40	9	134	2146
15688	0.7	9	146	2146
15690	0.2	9	152	2146
15720	40	9	134	2151
15722	0.7	9	146	2151
15724	0.2	9	152	2151
15734	90	521	119	2153
15736	2.3	521	137	2153
15738	2	521	149	2153
15754	15	521	134	2156
15756	1	521	146	2156
15758	0.07	521	155	2156
15773	15	521	134	2159
15775	1	521	146	2159
15777	0.07	521	155	2159
15818	50	9	119	2166
15820	1.9	9	137	2166
15822	2	9	149	2166
15824	0.2	9	154	2166
15977	75	1	119	2186
15978	1	1	136	2186
15979	3.5	1	138	2186
15980	0.22	1	146	2186
15981	0.1	1	155	2186
15982	0.004	1	157	2186
15983	0.5	1	159	2186
15984	1.8	1	160	2186
15985	15	1	162	2186
16003	75	2	119	2189
16004	6	2	136	2189
16005	3.5	2	138	2189
16006	1.2	2	147	2189
16007	0.4	2	155	2189
16008	0.5	2	159	2189
16009	1.8	2	160	2189
16010	15	2	162	2189
16019	75	2	119	2191
16020	10	2	136	2191
16021	3.5	2	138	2191
16022	1.2	2	147	2191
16023	0.4	2	155	2191
16024	0.5	2	159	2191
16025	1.8	2	160	2191
16026	15	2	162	2191
16027	75	1	119	2192
16028	10	1	136	2192
16029	3.5	1	139	2192
16030	0.22	1	146	2192
16031	0.1	1	155	2192
16032	0.004	1	157	2192
16033	0.3	1	159	2192
16034	1.3	1	160	2192
16035	15	1	162	2192
10746	60	2	134	1510
10749	4.5	2	149	1510
15863	20	7	134	2172
15866	4	7	149	2172
15991	0.004	1	157	2187
15992	0.5	1	159	2187
15993	1.8	1	160	2187
15994	15	1	162	2187
15995	75	1	119	2188
15996	1	1	136	2188
15997	3.5	1	138	2188
15998	0.22	1	146	2188
15999	0.1	1	155	2188
16000	0.004	1	157	2188
16001	0.5	1	159	2188
16002	1.8	1	160	2188
10747	5.8	2	137	1510
10750	0.8	2	152	1510
16053	50	9	119	2195
16055	1.9	9	137	2195
16057	2	9	149	2195
16059	0.2	9	154	2195
16061	65	8	130	2196
16063	2.2	8	137	2196
16065	3	8	149	2196
16067	0.05	8	155	2196
16069	35	8	134	2197
16071	0.7	8	146	2197
16073	0.2	8	152	2197
16075	65	8	130	2198
16078	0.7	8	146	2198
16081	0.05	8	155	2198
16084	2.2	8	137	2199
16087	0.2	8	152	2199
16105	35	8	134	2202
16108	3	8	149	2202
16113	2.2	8	137	2203
16116	0.2	8	152	2203
16119	35	8	134	2204
16122	3	8	149	2204
16141	60	9	130	2207
16144	0.7	9	146	2207
16147	0.07	9	155	2207
16149	40	9	134	2208
16152	3	9	149	2208
16164	0.7	527	146	2210
16183	2.2	9	137	2213
16186	0.2	9	152	2213
16195	80	7	130	2215
16198	1	7	146	2215
16210	240	1	119	2217
16213	0.5	1	146	2217
16216	0.008	1	157	2217
16234	180	3	135	2220
16237	4.5	3	149	2220
16240	0.25	3	155	2220
16257	55	1	134	2223
16260	0.4	1	152	2223
16264	55	1	134	2224
16267	0.4	1	152	2224
16292	100	9	135	2228
16295	6	9	149	2228
16299	100	9	135	2229
16302	4	9	149	2229
16312	20	6	134	2231
16315	0.1	6	152	2231
16341	4.2	1	137	2235
16344	0.12	1	155	2235
16347	20	6	134	2236
16350	0.1	6	152	2236
16365	245	1	119	2239
16368	0.5	1	146	2239
16371	0.008	1	157	2239
16372	245	1	119	2240
16375	0.5	1	146	2240
16378	0.008	1	157	2240
16440	3.5	1	139	2248
16443	0.004	1	157	2248
16446	15	1	162	2248
16455	120	3	119	2250
16458	2.5	3	146	2250
16461	0.8	3	154	2250
16481	4.7	1	137	2253
16484	0.12	1	155	2253
16504	5.2	1	137	2256
16507	0.12	1	155	2256
16525	5.4	1	137	2259
16528	0.25	1	155	2259
16529	245	1	119	2260
16532	0.5	1	146	2260
16535	0.008	1	157	2260
16538	3.3	523	137	2261
16541	0.08	523	155	2261
16544	80	9	134	2262
16547	6	9	149	2262
16550	100	9	119	2263
16553	0.4	9	146	2263
16556	0.12	9	155	2263
16558	20	523	134	2264
16561	0.1	523	152	2264
16564	180	523	119	2265
16567	0.3	523	146	2265
16570	0.006	523	157	2265
16579	180	8	134	2267
16582	7	8	149	2267
16599	245	1	119	2270
16602	0.5	1	146	2270
16605	0.008	1	157	2270
16622	245	1	119	2273
16625	0.5	1	146	2273
16628	0.008	1	157	2273
16646	55	1	134	2276
16649	0.5	1	152	2276
16663	3.8	1	137	2278
16666	0.12	1	155	2278
16685	55	1	134	2281
16688	0.4	1	152	2281
16693	4.8	1	137	2282
16696	0.12	1	155	2282
16698	200	4	119	2283
16701	0.5	4	146	2283
16704	0.12	4	155	2283
16707	245	1	119	2284
16710	0.5	1	146	2284
16713	0.008	1	157	2284
16717	4.7	1	137	2285
16720	0.12	1	155	2285
10752	250	12	119	1511
10755	2.5	12	146	1511
10758	0.25	12	155	1511
10759	0.4	2	155	1411
8828	0.22	1	146	1266
16054	50	9	135	2195
10812	120	3	119	1520
10813	180	3	135	1520
10814	5	3	137	1520
10815	0.3	3	146	1520
10816	4.5	3	149	1520
10817	0.9	3	152	1520
10818	0.9	3	154	1520
10819	0.35	3	157	1520
10820	30	3	162	1520
10821	50	9	119	1521
10822	50	9	135	1521
10823	2.2	9	137	1521
10824	0.7	9	146	1521
10825	2	9	149	1521
10826	0.2	9	152	1521
10827	0.2	9	154	1521
10828	0.05	9	155	1521
10829	50	9	119	1522
10830	50	9	135	1522
10831	2.2	9	137	1522
10832	0.7	9	146	1522
10833	2	9	149	1522
10834	0.2	9	152	1522
10835	0.2	9	154	1522
10836	0.05	9	155	1522
10837	50	9	119	1523
10838	50	9	135	1523
10839	2.2	9	137	1523
10840	0.7	9	146	1523
10841	2	9	149	1523
10842	0.2	9	152	1523
10843	0.3	9	154	1523
10844	0.05	9	155	1523
10845	75	2	119	1524
10846	10	2	136	1524
10847	3.5	2	138	1524
10848	1.2	2	147	1524
10849	0.4	2	155	1524
10850	1.8	2	158	1524
10851	0.5	2	159	1524
10852	15	2	162	1524
10853	75	1	119	1525
10854	10	1	136	1525
10855	3.5	1	139	1525
10856	0.22	1	146	1525
10857	0.1	1	155	1525
10858	0.004	1	157	1525
10860	0.5	1	159	1525
10861	30	1	162	1525
10862	75	2	119	1526
10863	10	2	136	1526
10864	3.5	2	138	1526
10865	1.2	2	147	1526
10866	0.4	2	155	1526
10868	0.5	2	159	1526
10869	15	2	162	1526
10870	75	2	119	1527
10871	10	2	136	1527
10872	3.5	2	138	1527
10875	0.5	2	159	1527
10876	15	2	162	1527
10877	75	1	119	1528
10878	1	1	136	1528
10879	3.5	1	138	1528
10880	0.22	1	146	1528
10881	0.1	1	155	1528
10882	0.004	1	157	1528
10884	0.5	1	159	1528
10885	75	2	119	1529
10886	10	2	136	1529
10887	3.5	2	138	1529
10888	1.2	2	147	1529
10889	0.4	2	155	1529
10891	0.5	2	159	1529
10892	15	2	162	1529
10893	75	2	119	1530
10894	10	2	136	1530
10895	3.5	2	138	1530
10896	1.2	2	147	1530
10897	0.4	2	155	1530
10898	0.5	2	159	1530
10899	1.8	2	160	1530
10900	15	2	162	1530
10890	1.8	2	160	1529
10883	1.8	1	160	1528
10874	1.8	2	160	1527
10867	1.8	2	160	1526
10859	1.8	1	160	1525
10901	75	1	119	1531
10902	1	1	136	1531
10903	3.5	1	138	1531
10904	0.22	1	146	1531
10905	0.1	1	155	1531
10906	0.5	1	159	1531
10907	1.8	1	160	1531
10908	14	1	162	1531
10909	75	1	119	1532
10910	10	1	136	1532
10911	3.5	1	139	1532
10912	0.22	1	146	1532
10913	0.1	1	155	1532
10915	1.3	1	158	1532
10916	0.3	1	159	1532
10917	45	1	162	1532
10925	75	1	119	1534
10926	10	1	136	1534
10927	3.5	1	139	1534
10928	0.22	1	146	1534
10929	0.1	1	155	1534
10930	0.004	1	157	1534
10931	0.3	1	159	1534
10932	1.3	1	160	1534
10933	40	1	162	1534
10934	75	1	119	1535
10935	10	1	136	1535
10936	3.5	1	139	1535
10937	0.22	1	146	1535
10938	0.1	1	155	1535
10939	0.004	1	157	1535
10940	0.3	1	159	1535
10941	1.3	1	160	1535
10942	40	1	162	1535
10943	75	2	119	1536
10944	10	2	136	1536
10914	0.004	1	157	1532
10945	3.5	2	138	1536
10947	0.4	2	155	1536
10949	1.8	2	160	1536
10967	75	2	119	1539
10969	3.5	2	138	1539
10971	0.4	2	155	1539
10973	1.8	2	160	1539
10976	10	2	136	1540
10978	1.2	2	147	1540
10980	0.5	2	159	1540
10982	15	2	162	1540
16056	0.7	9	146	2195
16058	0.2	9	152	2195
16060	0.05	9	155	2195
16062	35	8	134	2196
16064	0.7	8	146	2196
16066	0.2	8	152	2196
16068	65	8	130	2197
16070	2.2	8	137	2197
16072	3	8	149	2197
16074	0.05	8	155	2197
16077	2.2	8	137	2198
16080	0.2	8	152	2198
16083	35	8	134	2199
16086	3	8	149	2199
16104	65	8	130	2202
16107	0.7	8	146	2202
16110	0.05	8	155	2202
16112	35	8	134	2203
16115	3	8	149	2203
16118	65	8	130	2204
16121	0.7	8	146	2204
16124	0.05	8	155	2204
16142	40	9	134	2207
16145	3	9	149	2207
16150	2.2	9	137	2208
16153	0.2	9	152	2208
16162	100	527	130	2210
16165	0.1	527	152	2210
16181	50	9	130	2213
16184	0.2	9	146	2213
16187	0.2	9	154	2213
16196	20	7	134	2215
16199	4	7	149	2215
16211	55	1	134	2217
16214	0.2	1	152	2217
16235	4.8	3	137	2220
16238	0.8	3	152	2220
16241	30	3	162	2220
16258	4	1	137	2223
16261	0.12	1	155	2223
16265	5.2	1	137	2224
16268	0.12	1	155	2224
16293	4.4	9	137	2228
16296	0.4	9	152	2228
16300	4.4	9	137	2229
16303	0.4	9	152	2229
16313	3	6	137	2231
16316	0.15	6	157	2231
16339	245	1	119	2235
16342	0.5	1	146	2235
16345	0.008	1	157	2235
16348	2.5	6	137	2236
16351	0.2	6	157	2236
16366	55	1	134	2239
16369	0.2	1	152	2239
16373	55	1	134	2240
16376	0.2	1	152	2240
16438	75	1	119	2248
16441	0.22	1	146	2248
16444	0.3	1	159	2248
16457	4.8	3	137	2250
16460	0.8	3	152	2250
16463	50	3	162	2250
16480	55	1	134	2253
16483	0.5	1	152	2253
16503	55	1	134	2256
16506	0.4	1	152	2256
16524	55	1	134	2259
16527	0.6	1	152	2259
16531	4.5	1	137	2260
16534	0.12	1	155	2260
16537	20	523	134	2261
16540	0.1	523	152	2261
16543	120	9	119	2262
16546	0.4	9	146	2262
16549	0.12	9	155	2262
16552	4.4	9	137	2263
16555	0.4	9	152	2263
16557	180	523	119	2264
16560	0.3	523	146	2264
16563	0.004	523	157	2264
16566	2.5	523	137	2265
16569	0.08	523	155	2265
16580	4.4	8	137	2267
16583	0.4	8	152	2267
16600	55	1	134	2270
16603	0.5	1	152	2270
16623	55	1	134	2273
16626	0.5	1	152	2273
16647	4.8	1	137	2276
16650	0.12	1	155	2276
16661	245	1	119	2278
16664	0.5	1	146	2278
16667	0.008	1	157	2278
16686	3.8	1	137	2281
16689	0.12	1	155	2281
16691	245	1	119	2282
16694	0.5	1	146	2282
16697	0.008	1	157	2282
16699	100	4	135	2283
16702	0.8	4	152	2283
16705	10	4	157	2283
16708	55	1	134	2284
16711	0.5	1	152	2284
16714	8	1	162	2284
16715	245	1	119	2285
16718	0.5	1	146	2285
16721	0.008	1	157	2285
10946	1.2	2	147	1536
10948	0.5	2	159	1536
10950	15	2	162	1536
10968	10	2	136	1539
10970	1.2	2	147	1539
10972	0.5	2	159	1539
10974	15	2	162	1539
10975	75	2	119	1540
10977	3.5	2	138	1540
10979	0.4	2	155	1540
10981	1.8	2	160	1540
16076	35	8	134	2198
16079	3	8	149	2198
16082	65	8	130	2199
16085	0.7	8	146	2199
16088	0.05	8	155	2199
16106	2.2	8	137	2202
16109	0.2	8	152	2202
16111	65	8	130	2203
16114	0.7	8	146	2203
16117	0.05	8	155	2203
16120	2.2	8	137	2204
16123	0.2	8	152	2204
16143	2.2	9	137	2207
16146	0.2	9	152	2207
16148	60	9	130	2208
16151	0.7	9	146	2208
16154	0.07	9	155	2208
16163	3.6	527	137	2210
16182	50	9	135	2213
16185	3	9	149	2213
16188	0.06	9	155	2213
16197	2.4	7	137	2215
16200	0.07	7	155	2215
16212	5	1	137	2217
16215	0.12	1	155	2217
16233	120	3	119	2220
16236	2.5	3	146	2220
16239	0.8	3	154	2220
16256	245	1	119	2223
16259	0.5	1	146	2223
16262	0.008	1	157	2223
16263	245	1	119	2224
16266	0.5	1	146	2224
16269	0.008	1	157	2224
16291	100	9	119	2228
16294	0.4	9	146	2228
16297	0.1	9	155	2228
16298	100	9	119	2229
16301	0.4	9	146	2229
16304	0.1	9	155	2229
16311	180	6	119	2231
16314	0.2	6	146	2231
16340	55	1	134	2235
16343	0.2	1	152	2235
16346	180	6	119	2236
16349	0.2	6	146	2236
16367	4.2	1	137	2239
16370	0.12	1	155	2239
16374	4.2	1	137	2240
16377	0.12	1	155	2240
16439	10	1	136	2248
16442	0.1	1	155	2248
16445	1.3	1	160	2248
16456	180	3	135	2250
16459	4.5	3	149	2250
16462	0.25	3	155	2250
16479	245	1	119	2253
16482	0.5	1	146	2253
16485	0.008	1	157	2253
16502	245	1	119	2256
16505	0.5	1	146	2256
16508	0.008	1	157	2256
16523	245	1	119	2259
16526	2.5	1	146	2259
16530	55	1	134	2260
16533	0.4	1	152	2260
16536	180	523	119	2261
16539	0.3	523	146	2261
16542	0.004	523	157	2261
16545	4.4	9	137	2262
16548	0.4	9	152	2262
16551	100	9	135	2263
16554	6	9	149	2263
16559	2.7	523	137	2264
16562	0.08	523	155	2264
16565	120	523	134	2265
16568	0.1	523	152	2265
16578	120	8	119	2267
16581	0.4	8	146	2267
16584	0.1	8	155	2267
16601	4.8	1	137	2270
16604	0.12	1	155	2270
16624	4.8	1	137	2273
16627	0.12	1	155	2273
16645	245	1	119	2276
16648	0.5	1	146	2276
16651	0.008	1	157	2276
16662	55	1	134	2278
16665	0.4	1	152	2278
16684	245	1	119	2281
16687	0.5	1	146	2281
16690	0.008	1	157	2281
16692	55	1	134	2282
16695	0.5	1	152	2282
16700	6.5	4	137	2283
16703	0.8	4	154	2283
16706	10	4	162	2283
16709	4.7	1	137	2284
16712	0.12	1	155	2284
16716	55	1	134	2285
16719	0.5	1	152	2285
16722	8	1	162	2285
16798	40	9	130	2296
16799	60	9	135	2296
16800	2.2	9	137	2296
16801	0.8	9	146	2296
16802	0.3	9	152	2296
16803	0.3	9	154	2296
16804	0.07	9	155	2296
16805	10	9	162	2296
16886	245	1	119	2309
16887	55	1	134	2309
16888	5	1	137	2309
16889	0.5	1	146	2309
16890	0.2	1	152	2309
16891	0.12	1	155	2309
16892	0.008	1	157	2309
16907	245	1	119	2312
16908	55	1	134	2312
16909	5	1	137	2312
16910	0.5	1	146	2312
16911	0.2	1	152	2312
16912	0.12	1	155	2312
16913	0.008	1	157	2312
16993	245	1	119	2324
10951	75	2	119	1537
10953	3.5	2	138	1537
10955	0.4	2	155	1537
10957	1.8	2	160	1537
10984	10	2	136	1541
10986	1.2	2	147	1541
10988	0.5	2	159	1541
10990	15	2	162	1541
10991	75	2	119	1542
10993	3.5	2	138	1542
10995	0.4	2	155	1542
10997	1.8	2	160	1542
16089	65	9	130	2200
16090	35	9	134	2200
16091	2.2	9	137	2200
16092	0.7	9	146	2200
16093	3	9	149	2200
16094	0.2	9	152	2200
16095	0.05	9	155	2200
16125	40	4	130	2205
16126	40	4	134	2205
16127	1.6	4	137	2205
16128	0.2	4	146	2205
16129	1	4	149	2205
16130	0.3	4	152	2205
16131	0.2	4	154	2205
16132	0.07	4	157	2205
16133	20	4	162	2205
16134	60	9	130	2206
16135	40	9	134	2206
16136	2.2	9	137	2206
16137	0.7	9	146	2206
16138	3	9	149	2206
16139	0.2	9	152	2206
16140	0.07	9	155	2206
16155	60	1	130	2209
16156	40	1	134	2209
16157	2.2	1	137	2209
16158	0.7	1	146	2209
16159	3	1	149	2209
16160	0.2	1	152	2209
16161	0.07	1	155	2209
16166	60	9	130	2211
16167	40	9	134	2211
16168	2.2	9	137	2211
16169	0.7	9	146	2211
16170	3	9	149	2211
16171	0.2	9	152	2211
16172	0.07	9	155	2211
16201	120	3	119	2216
16202	180	3	135	2216
16203	4.8	3	137	2216
16204	2.5	3	146	2216
16205	4.5	3	149	2216
16206	0.8	3	152	2216
16207	0.8	3	154	2216
16208	0.25	3	155	2216
16209	30	3	162	2216
16242	245	1	119	2221
16243	55	1	134	2221
16244	5.2	1	137	2221
16245	0.5	1	146	2221
16246	0.4	1	152	2221
16247	0.12	1	155	2221
16248	0.008	1	157	2221
16271	55	1	134	2225
16273	0.5	1	146	2225
16275	0.12	1	155	2225
16284	245	1	119	2227
16286	4.2	1	137	2227
16288	0.2	1	152	2227
16290	0.008	1	157	2227
16317	245	1	119	2232
16319	4.5	1	137	2232
16321	0.2	1	152	2232
16323	0.008	1	157	2232
16352	245	1	119	2237
16354	4.2	1	137	2237
16356	0.12	1	155	2237
16408	4.7	1	137	2244
16412	0.008	1	157	2244
16416	2.5	3	146	2245
16420	0.25	3	155	2245
16425	0.5	1	146	2246
16464	245	1	119	2251
16468	0.5	1	152	2251
16593	55	1	134	2269
16597	0.12	1	155	2269
16669	55	1	134	2279
16673	0.12	1	155	2279
16806	65	8	130	2297
16807	35	8	134	2297
16808	2.2	8	137	2297
16809	0.2	8	146	2297
16810	3	8	149	2297
16811	0.2	8	152	2297
16812	150	8	155	2297
16813	65	8	130	2298
16814	35	8	134	2298
16815	2.2	8	137	2298
16816	0.7	8	146	2298
16817	3	8	149	2298
16818	0.2	8	152	2298
16819	0.05	8	155	2298
16846	65	7	130	2303
16848	2.2	7	137	2303
16850	3	7	149	2303
16852	0.07	7	155	2303
16867	80	2	130	2306
16869	1.8	2	137	2306
16871	0.2	2	152	2306
16879	245	1	119	2308
16881	4.6	1	137	2308
16883	0.2	1	152	2308
16885	0.008	1	157	2308
16894	75	1	134	2310
16896	0.5	1	146	2310
16898	0.12	1	155	2310
16927	245	1	119	2315
16929	4.6	1	137	2315
16931	0.2	1	152	2315
16933	0.008	1	157	2315
16942	75	1	134	2317
16944	0.5	1	146	2317
16946	0.12	1	155	2317
16948	15	1	163	2317
16972	55	1	134	2321
16974	0.5	1	146	2321
16976	0.12	1	155	2321
17000	245	1	119	2325
17002	4.6	1	137	2325
17004	0.3	1	152	2325
17071	55	4	134	2335
17073	2.5	4	146	2335
17075	0.25	4	155	2335
17125	120	3	119	2342
10952	10	2	136	1537
10954	1.2	2	147	1537
10956	0.5	2	159	1537
10958	15	2	162	1537
10983	75	2	119	1541
10985	3.5	2	138	1541
10987	0.4	2	155	1541
10989	1.8	2	160	1541
10992	10	2	136	1542
10994	1.2	2	147	1542
10996	0.5	2	159	1542
10998	15	2	162	1542
16096	50	9	130	2201
16098	1.9	9	137	2201
16100	2	9	149	2201
16102	0.2	9	154	2201
16173	50	9	130	2212
16175	2.2	9	137	2212
16177	3	9	149	2212
16179	0.2	9	154	2212
16189	80	7	130	2214
16191	2.4	7	137	2214
16193	4	7	149	2214
16218	55	1	134	2218
16220	0.5	1	146	2218
16222	0.12	1	155	2218
16277	245	1	119	2226
16279	4.3	1	137	2226
16281	0.2	1	152	2226
16283	0.008	1	157	2226
16305	180	6	119	2230
16307	3	6	137	2230
16309	0.1	6	152	2230
16325	1	1	136	2233
16327	0.22	1	146	2233
16329	0.004	1	157	2233
16331	1.8	1	160	2233
16333	180	6	119	2234
16335	2.5	6	137	2234
16337	0.1	6	152	2234
16358	245	1	119	2238
16360	4.2	1	137	2238
16362	0.2	1	152	2238
16364	0.008	1	157	2238
16380	180	13	135	2241
16382	2.5	13	146	2241
16384	0.8	13	152	2241
16386	0.25	13	155	2241
16389	180	3	135	2242
16391	2.5	3	146	2242
16393	0.8	3	152	2242
16395	0.25	3	155	2242
16397	75	1	119	2243
16399	3.5	1	138	2243
16401	0.1	1	155	2243
16403	0.5	1	159	2243
16405	15	1	162	2243
16430	10	1	136	2247
16432	0.22	1	146	2247
16434	0.004	1	157	2247
16436	1.8	1	160	2247
16448	6	2	136	2249
16450	1.2	2	147	2249
16452	0.5	2	159	2249
16454	15	2	162	2249
16487	180	3	135	2254
16489	2.5	3	146	2254
16491	0.8	3	152	2254
16493	0.25	3	155	2254
16509	245	1	119	2257
16511	5.2	1	137	2257
16513	0.4	1	152	2257
16515	0.008	1	157	2257
16571	245	1	119	2266
16573	5.2	1	137	2266
16575	0.4	1	152	2266
16577	0.008	1	157	2266
16586	80	8	134	2268
16588	0.4	8	146	2268
16590	0.4	8	152	2268
16607	180	3	135	2271
16609	2.5	3	146	2271
16611	1	3	152	2271
16613	0.25	3	155	2271
16639	55	1	134	2275
16641	0.5	1	146	2275
16643	0.12	1	155	2275
16653	180	3	135	2277
16655	2.5	3	146	2277
16657	1	3	152	2277
16659	0.25	3	155	2277
16675	120	3	119	2280
16677	4.7	3	137	2280
16679	1	3	149	2280
16681	1	3	154	2280
16683	30	3	162	2280
16723	245	1	119	2286
16725	4.7	1	137	2286
16727	0.5	1	152	2286
16729	0.008	1	157	2286
16820	80	7	130	2299
16821	20	7	134	2299
16822	2.4	7	137	2299
16823	1	7	146	2299
16824	4	7	149	2299
16825	0.07	7	155	2299
16873	80	7	130	2307
16874	20	7	134	2307
16875	2.5	7	137	2307
16876	1	7	146	2307
16877	3	7	149	2307
16878	0.07	7	155	2307
16957	55	1	134	2319
16959	0.5	1	146	2319
16961	0.12	1	155	2319
16964	75	1	134	2320
16966	0.5	1	146	2320
16968	0.12	1	155	2320
16970	15	1	163	2320
16978	245	1	119	2322
16980	5	1	137	2322
16982	0.2	1	152	2322
16984	0.008	1	157	2322
17025	55	1	134	2329
17027	0.5	1	146	2329
17029	0.12	1	155	2329
17063	240	12	119	2334
17065	6	12	137	2334
17067	4.5	12	149	2334
17069	0.25	12	155	2334
17077	60	12	134	2336
17079	3.5	12	146	2336
17081	0.25	12	155	2336
17117	180	3	135	2341
17119	2.5	3	146	2341
17121	0.8	3	152	2341
10959	75	2	119	1538
10961	3.5	2	138	1538
10963	0.4	2	155	1538
10965	1.5	2	160	1538
16097	50	9	134	2201
16099	0.7	9	146	2201
16101	0.2	9	152	2201
16103	0.05	9	155	2201
16174	50	9	135	2212
16176	0.2	9	146	2212
16178	0.2	9	152	2212
16180	0.06	9	155	2212
16190	20	7	134	2214
16192	1	7	146	2214
16194	0.07	7	155	2214
16217	245	1	119	2218
16219	5	1	137	2218
16221	0.2	1	152	2218
16223	0.008	1	157	2218
16278	555	1	134	2226
16280	0.5	1	146	2226
16282	0.12	1	155	2226
16306	20	6	134	2230
16308	0.2	6	146	2230
16310	0.15	6	157	2230
16324	75	1	119	2233
16326	3.5	1	138	2233
16328	0.1	1	155	2233
16330	0.5	1	159	2233
16332	15	1	162	2233
16334	20	6	134	2234
16336	0.2	6	146	2234
16338	0.2	6	155	2234
16359	55	1	134	2238
16361	0.5	1	146	2238
16363	0.12	1	155	2238
16379	120	13	119	2241
16381	5.8	13	137	2241
16383	4	13	149	2241
16385	0.5	13	154	2241
16387	30	13	162	2241
16388	120	3	119	2242
16390	5.8	3	137	2242
16392	4	3	149	2242
16394	0.5	3	154	2242
16396	30	3	162	2242
16398	10	1	136	2243
16400	0.22	1	146	2243
16402	0.004	1	157	2243
16404	1.8	1	160	2243
16429	75	1	119	2247
16431	3.5	1	138	2247
16433	0.1	1	155	2247
16435	0.5	1	159	2247
16437	15	1	162	2247
16447	75	2	119	2249
16449	3.5	2	138	2249
16451	0.4	2	155	2249
16453	1.8	2	160	2249
16486	120	3	119	2254
16488	4.8	3	137	2254
16490	4.5	3	149	2254
16492	0.8	3	154	2254
16494	50	3	162	2254
16510	55	1	134	2257
16512	0.5	1	146	2257
16514	0.12	1	155	2257
16572	55	1	134	2266
16574	0.5	1	146	2266
16576	0.12	1	155	2266
16585	120	8	119	2268
16587	4.4	8	137	2268
16589	6	8	149	2268
16591	0.1	8	155	2268
16606	120	3	119	2271
16608	5	3	137	2271
16610	1	3	149	2271
16612	1	3	154	2271
16614	50	3	162	2271
16638	245	1	119	2275
16640	3.8	1	137	2275
16642	0.4	1	152	2275
16644	0.008	1	157	2275
16652	120	3	119	2277
16654	5	3	137	2277
16656	1	3	149	2277
16658	1	3	154	2277
16660	30	3	162	2277
16676	180	3	135	2280
16678	2.5	3	146	2280
16680	1	3	152	2280
16682	0.25	3	155	2280
16724	55	1	134	2286
16726	0.5	1	146	2286
16728	0.12	1	155	2286
16730	8	1	162	2286
16834	35	8	134	2301
16836	0.2	8	146	2301
16838	0.2	8	152	2301
16841	35	8	134	2302
16843	0.2	8	146	2302
16845	0.2	8	152	2302
16853	65	8	130	2304
16855	2.2	8	137	2304
16857	3	8	149	2304
16859	0.15	8	155	2304
16861	20	2	134	2305
16863	0.2	2	146	2305
16865	0.2	2	152	2305
16900	245	1	119	2311
16902	4.6	1	137	2311
16904	0.2	1	152	2311
16906	0.008	1	157	2311
16914	225	1	119	2313
16916	4	1	137	2313
16918	0.3	1	152	2313
16920	0.008	1	157	2313
16922	3.8	1	119	2314
16924	0.3	1	146	2314
16926	0.008	1	154	2314
16935	55	1	134	2316
16937	0.5	1	146	2316
16939	0.12	1	155	2316
16950	55	1	134	2318
16952	0.5	1	146	2318
16954	0.12	1	155	2318
16986	75	1	134	2323
16988	0.5	1	146	2323
16990	0.12	1	155	2323
16992	15	1	163	2323
17006	245	1	119	2326
17008	5.3	1	137	2326
17010	0.2	1	152	2326
17012	245	4	119	2327
17014	4.8	4	137	2327
10960	10	2	136	1538
10962	1.2	2	147	1538
10964	0.5	2	159	1538
10966	15	2	162	1538
16224	120	3	119	2219
16225	180	3	135	2219
16226	4.8	3	137	2219
16227	2.5	3	146	2219
16228	4.5	3	149	2219
16229	0.8	3	152	2219
16230	0.8	3	154	2219
16231	0.25	3	155	2219
16232	30	3	162	2219
16249	180	523	119	2222
16250	20	523	134	2222
16251	2.7	523	137	2222
16252	0.3	523	146	2222
16253	0.1	523	152	2222
16254	0.08	523	155	2222
16255	0.006	523	157	2222
16471	120	3	119	2252
16473	4.8	3	137	2252
16475	4.5	3	149	2252
16477	0.8	3	154	2252
16496	55	1	134	2255
16498	0.5	1	146	2255
16500	0.12	1	155	2255
16516	245	1	119	2258
16518	5.2	1	137	2258
16520	0.4	1	152	2258
16522	0.008	1	157	2258
16616	50	1	134	2272
16618	0.5	1	146	2272
16620	0.12	1	155	2272
16630	180	3	135	2274
16632	2.5	3	146	2274
16634	1	3	152	2274
16636	0.25	3	155	2274
16833	65	8	130	2301
16835	2.2	8	137	2301
16837	3	8	149	2301
16839	0.15	8	155	2301
16840	65	8	130	2302
16842	2.2	8	137	2302
16844	3	8	149	2302
16854	35	8	134	2304
16856	0.2	8	146	2304
16858	0.2	8	152	2304
16860	80	2	130	2305
16862	2	2	137	2305
16864	2.5	2	149	2305
16866	0.2	2	155	2305
16901	55	1	134	2311
16903	0.5	1	146	2311
16905	0.12	1	155	2311
16915	75	1	134	2313
16917	0.5	1	146	2313
16919	0.12	1	155	2313
16921	15	1	163	2313
16923	0.5	1	134	2314
16925	0.12	1	152	2314
16934	245	1	119	2316
16936	5	1	137	2316
16938	0.2	1	152	2316
16940	0.008	1	157	2316
16949	245	1	119	2318
16951	4.6	1	137	2318
16953	0.3	1	152	2318
16955	0.008	1	157	2318
16985	225	1	119	2323
16987	3.7	1	137	2323
16989	0.3	1	152	2323
16991	0.008	1	157	2323
17007	55	1	134	2326
17009	2.5	1	146	2326
17011	0.25	1	155	2326
17013	55	4	134	2327
17015	2.5	4	146	2327
17017	0.25	4	155	2327
17019	55	4	134	2328
17021	2.5	4	146	2328
17023	0.25	4	155	2328
17039	75	5	134	2331
17041	0.5	5	146	2331
17043	0.5	5	152	2331
17045	0.01	5	157	2331
17048	55	1	134	2332
17050	0.5	1	146	2332
17052	0.12	1	155	2332
17055	75	5	134	2333
17057	0.5	5	146	2333
17059	0.5	5	152	2333
17061	0.01	5	157	2333
17082	120	3	119	2337
17084	5.7	3	137	2337
17086	4.5	3	149	2337
17088	0.8	3	154	2337
17090	30	3	162	2337
17092	180	3	135	2338
17094	2.5	3	146	2338
17096	0.8	3	152	2338
17098	0.25	3	155	2338
17100	120	3	119	2339
17102	4.8	3	137	2339
17104	4.5	3	149	2339
17106	0.8	3	154	2339
17108	30	3	162	2339
17109	240	12	119	2340
17111	6	12	137	2340
17113	4.5	12	149	2340
17115	0.25	12	155	2340
17135	180	3	135	2343
17137	2.5	3	146	2343
17139	0.8	3	152	2343
17141	0.25	3	155	2343
10999	75	2	119	1543
11001	3.5	2	138	1543
11003	0.4	2	155	1543
11005	1.8	2	160	1543
11008	1	1	136	1544
11010	0.22	1	146	1544
11012	0.004	1	157	1544
11014	1.8	1	160	1544
16270	245	1	119	2225
16272	4	1	137	2225
16274	0.4	1	152	2225
16276	0.008	1	157	2225
16285	55	1	134	2227
16287	0.5	1	146	2227
16289	0.12	1	155	2227
16318	55	1	134	2232
16320	0.5	1	146	2232
16322	0.12	1	155	2232
16353	55	1	134	2237
16355	0.5	1	146	2237
16357	0.008	1	157	2237
16409	0.5	1	146	2244
16413	120	3	119	2245
16417	4.5	3	149	2245
16421	50	3	162	2245
16422	245	1	119	2246
16426	0.5	1	152	2246
16465	55	1	134	2251
16469	0.12	1	155	2251
16595	0.5	1	146	2269
16671	0.5	1	146	2279
16847	35	7	134	2303
16849	0.2	7	146	2303
16851	0.2	7	152	2303
16868	20	2	134	2306
16870	0.2	2	146	2306
16872	0.03	2	155	2306
16880	55	1	134	2308
16882	0.5	1	146	2308
16884	0.12	1	155	2308
16893	225	1	119	2310
16895	4	1	137	2310
16897	0.3	1	152	2310
16899	0.008	1	157	2310
16928	55	1	134	2315
16930	0.5	1	146	2315
16932	0.12	1	155	2315
16941	225	1	119	2317
16943	3.7	1	137	2317
16945	0.3	1	152	2317
16947	0.008	1	157	2317
16971	245	1	119	2321
16973	4.6	1	137	2321
16975	0.3	1	152	2321
16977	0.008	1	157	2321
17001	55	1	134	2325
17003	0.5	1	146	2325
17005	0.12	1	155	2325
17070	245	4	119	2335
17072	5.3	4	137	2335
17074	0.2	4	152	2335
17126	180	3	135	2342
17128	2.5	3	146	2342
17130	0.8	3	152	2342
17132	0.25	3	155	2342
17144	60	12	134	2344
17146	2	12	146	2344
17148	0.4	12	152	2344
17151	60	1	134	2345
17153	3.5	1	146	2345
17155	0.5	1	152	2345
11000	10	2	136	1543
11002	1.2	2	147	1543
11004	0.5	2	159	1543
11006	15	2	162	1543
11007	75	1	119	1544
11009	3.5	1	138	1544
11011	0.1	1	155	1544
11013	0.5	1	159	1544
11015	240	1	119	1545
11016	60	1	134	1545
11017	4.2	1	137	1545
11018	0.5	1	146	1545
11019	0.5	1	152	1545
11020	0.12	1	155	1545
11021	0.008	1	157	1545
11022	250	2	119	1546
11023	50	2	134	1546
11024	6	2	137	1546
11025	2.5	2	146	1546
11026	4.5	2	149	1546
11027	0.5	2	152	1546
11028	0.25	2	155	1546
11029	50	9	119	1547
11030	50	9	135	1547
11031	2.2	9	137	1547
11032	0.7	9	146	1547
11033	2	9	149	1547
11034	0.2	9	152	1547
11035	0.3	9	154	1547
11036	0.05	9	155	1547
11037	80	7	119	1548
11038	20	7	134	1548
11039	2.5	7	137	1548
11040	0.8	7	146	1548
11041	6	7	149	1548
11042	0.07	7	155	1548
11043	65	8	119	1549
11044	35	8	134	1549
11045	2.2	8	137	1549
11046	0.7	8	146	1549
11047	3	8	149	1549
11048	0.2	8	152	1549
11049	0.05	8	155	1549
11050	85	2	119	1550
11051	15	2	134	1550
11052	1.8	2	137	1550
11053	0.1	2	146	1550
11054	1.5	2	149	1550
11055	0.2	2	152	1550
11056	0.03	2	155	1550
11057	5	2	162	1550
11058	85	2	119	1551
11059	15	2	134	1551
11060	1.8	2	137	1551
11061	0.1	2	146	1551
11062	1.5	2	149	1551
11063	0.2	2	152	1551
11064	0.03	2	155	1551
11065	5	2	162	1551
11066	80	2	119	1552
11067	20	2	134	1552
11068	2	2	137	1552
11069	0.2	2	146	1552
11070	1.5	2	149	1552
11071	0.2	2	152	1552
11072	0.2	2	155	1552
11073	80	2	119	1553
11074	20	2	134	1553
11075	2	2	137	1553
11076	0.2	2	146	1553
11077	1.5	2	149	1553
11078	0.2	2	152	1553
11079	0.2	2	155	1553
11080	80	1	119	1554
11081	20	1	134	1554
11082	2	1	137	1554
11083	0.2	1	146	1554
11084	1.5	1	149	1554
11085	0.2	1	152	1554
11086	0.2	1	155	1554
11087	85	2	119	1555
11088	15	2	134	1555
11089	1.8	2	137	1555
11090	0.1	2	146	1555
11091	1.5	2	149	1555
11092	0.2	2	152	1555
11093	0.03	2	155	1555
11094	5	2	162	1555
11095	65	8	119	1556
11096	35	8	134	1556
11097	2.2	8	137	1556
11098	0.7	8	146	1556
11099	3	8	149	1556
11100	0.2	8	152	1556
11101	0.05	8	155	1556
11102	65	8	119	1557
11103	35	8	134	1557
11104	2.3	8	137	1557
11105	0.7	8	146	1557
11106	3	8	149	1557
11107	0.2	8	152	1557
11108	0.05	8	155	1557
11109	65	8	119	1558
11110	35	8	134	1558
11111	2.3	8	137	1558
11112	0.7	8	146	1558
11113	3	8	149	1558
11114	0.2	8	152	1558
11115	0.05	8	155	1558
11116	65	8	119	1559
11117	35	8	134	1559
11118	2.3	8	137	1559
11119	0.7	8	146	1559
11120	3	8	149	1559
11121	0.2	8	152	1559
11122	0.05	8	155	1559
11123	65	1	119	1560
11124	35	1	134	1560
11125	2.2	1	137	1560
11126	0.7	1	146	1560
11127	0.3	1	149	1560
11128	0.2	1	152	1560
11129	0.05	1	155	1560
11130	65	8	119	1561
11131	35	8	134	1561
11132	2.2	8	137	1561
11133	0.7	8	146	1561
11134	3	8	149	1561
11135	0.2	8	152	1561
11136	0.05	8	155	1561
11137	65	8	119	1562
11138	35	8	134	1562
11139	2.3	8	137	1562
11140	0.7	8	146	1562
11141	3	8	149	1562
11142	0.2	8	152	1562
11143	0.05	8	155	1562
11181	240	1	119	1568
11184	3	1	146	1568
11207	6.5	3	137	1571
11210	1	3	152	1571
11213	20	3	162	1571
11234	6.5	3	137	1574
11237	1	3	152	1574
11240	20	3	162	1574
11242	180	3	135	1575
11245	4.5	3	149	1575
11248	0.25	3	155	1575
11260	180	1	135	1577
11263	4.5	1	149	1577
11266	0.25	1	155	1577
16406	245	1	119	2244
16410	0.5	1	152	2244
16414	180	3	135	2245
16418	0.8	3	152	2245
16423	55	1	134	2246
16427	0.12	1	155	2246
16466	4.7	1	137	2251
16470	0.008	1	157	2251
16594	3.8	1	137	2269
16598	0.008	1	157	2269
16670	4.8	1	137	2279
16674	0.008	1	157	2279
16956	245	1	119	2319
16958	5	1	137	2319
16960	0.2	1	152	2319
16962	0.008	1	157	2319
16963	225	1	119	2320
16965	3.7	1	137	2320
16967	0.3	1	152	2320
16969	0.008	1	157	2320
16979	55	1	134	2322
16981	0.5	1	146	2322
16983	0.12	1	155	2322
17024	245	1	119	2329
17026	4.6	1	137	2329
17028	0.3	1	152	2329
17030	0.008	1	157	2329
17064	60	12	134	2334
17066	3.5	12	146	2334
17068	0.5	12	152	2334
17076	240	12	119	2336
17078	6	12	137	2336
17080	0.5	12	152	2336
17116	120	3	119	2341
17118	4.8	3	137	2341
17120	4.5	3	149	2341
17122	0.8	3	154	2341
17124	30	3	157	2341
17157	240	12	119	2346
17159	5.4	12	137	2346
17161	4.5	12	149	2346
17163	0.2	12	155	2346
17165	60	12	134	2347
17167	3.5	12	146	2347
17169	0.5	12	152	2347
11144	65	8	119	1563
11146	2.3	8	137	1563
11148	3	8	149	1563
11150	0.05	8	155	1563
11159	35	8	134	1565
11161	0.7	8	146	1565
11163	0.2	8	152	1565
11187	120	3	119	1569
11190	2.5	3	146	1569
11193	1	3	154	1569
11197	180	3	135	1570
11200	4.5	3	149	1570
11203	0.25	3	155	1570
16407	55	1	134	2244
16411	0.12	1	155	2244
16415	4.8	3	137	2245
16419	0.8	3	154	2245
16424	4.7	1	137	2246
16428	0.008	1	157	2246
16467	0.5	1	146	2251
16592	245	1	119	2269
16596	0.4	1	152	2269
16668	245	1	119	2279
16672	0.5	1	152	2279
16994	55	1	134	2324
16995	5	1	137	2324
16996	0.5	1	146	2324
16997	0.2	1	152	2324
16998	0.12	1	155	2324
16999	0.008	1	157	2324
17031	245	1	119	2330
17032	55	1	134	2330
17033	4.6	1	137	2330
17034	0.5	1	146	2330
17035	0.3	1	152	2330
17036	0.12	1	155	2330
17037	0.008	1	157	2330
11145	35	8	134	1563
11147	0.7	8	146	1563
11149	0.2	8	152	1563
11158	65	8	119	1565
11160	2.3	8	137	1565
11162	3	8	149	1565
11164	0.05	8	155	1565
11188	180	3	135	1569
11191	4.5	3	149	1569
11194	0.25	3	155	1569
11198	4.8	3	137	1570
11201	1	3	152	1570
11204	20	3	162	1570
16472	180	3	135	2252
16474	2.5	3	146	2252
16476	0.8	3	152	2252
16478	0.25	3	155	2252
16495	245	1	119	2255
16497	5.2	1	137	2255
16499	0.4	1	152	2255
16501	0.008	1	157	2255
16517	55	1	134	2258
16519	0.5	1	146	2258
16521	0.12	1	155	2258
16615	245	1	119	2272
16617	3.8	1	137	2272
16619	0.4	1	152	2272
16621	0.008	1	157	2272
16629	120	3	119	2274
16631	5	3	137	2274
16633	1	3	149	2274
16635	1	3	154	2274
16637	50	3	162	2274
17016	0.2	4	152	2327
17018	245	4	119	2328
17020	4.9	4	137	2328
17022	0.2	4	152	2328
17038	225	5	119	2331
17040	5.8	5	137	2331
17042	4.5	5	149	2331
17044	0.12	5	155	2331
17046	15	5	163	2331
17047	245	1	119	2332
17049	4.6	1	137	2332
17051	0.3	1	152	2332
17053	0.008	1	157	2332
17054	225	5	119	2333
17056	5.8	5	137	2333
17058	4.5	5	149	2333
17060	0.12	5	155	2333
17062	15	5	163	2333
17083	180	3	135	2337
17085	2.5	3	146	2337
17087	0.8	3	152	2337
17089	0.25	3	155	2337
17091	120	3	119	2338
17093	5.7	3	137	2338
17095	4.5	3	149	2338
17097	0.8	3	154	2338
17099	30	3	162	2338
17101	180	3	135	2339
17103	2.5	3	146	2339
17105	0.8	3	152	2339
17107	0.25	3	155	2339
17110	60	12	134	2340
17112	3.5	12	146	2340
17114	0.5	12	152	2340
17134	120	3	119	2343
17136	4.8	3	137	2343
17138	4.5	3	149	2343
17140	0.8	3	154	2343
17142	20	3	162	2343
11151	65	8	119	1564
11152	35	8	134	1564
11153	2.3	8	137	1564
11154	0.7	8	146	1564
11155	3	8	149	1564
11156	0.2	8	152	1564
11157	0.05	8	155	1564
11173	50	9	119	1567
11174	50	9	135	1567
11175	2.5	9	137	1567
11176	0.7	9	146	1567
11177	2	9	149	1567
11178	0.2	9	152	1567
11179	0.2	9	154	1567
11180	0.05	9	155	1567
16731	200	4	119	2287
16734	0.5	4	146	2287
16737	0.12	4	155	2287
16740	245	1	119	2288
16743	0.5	1	146	2288
16746	0.008	1	157	2288
16757	245	1	119	2290
16760	0.5	1	146	2290
16763	0.008	1	157	2290
16766	20	7	134	2291
16769	4	7	149	2291
16794	2.5	7	137	2295
16797	0.07	7	155	2295
17123	0.25	3	155	2341
17158	60	12	134	2346
17160	2	12	146	2346
17162	0.4	12	152	2346
17164	240	12	119	2347
17166	6	12	137	2347
17168	4.5	12	149	2347
17170	0.25	12	155	2347
11165	50	9	119	1566
11167	2.3	9	137	1566
11169	2	9	149	1566
11171	0.2	9	154	1566
11215	180	9	135	1572
11217	2.5	9	146	1572
11219	1	9	152	1572
11221	0.25	9	155	1572
11223	120	3	119	1573
11225	4.8	3	137	1573
11227	4.5	3	149	1573
11229	1	3	154	1573
11231	20	3	162	1573
11251	100	1	135	1576
11253	0.5	1	146	1576
11255	1	1	152	1576
11257	0.12	1	155	1576
16732	100	4	135	2287
16735	0.8	4	152	2287
16738	0.01	4	157	2287
16741	55	1	134	2288
16744	0.5	1	152	2288
16747	8	1	162	2288
16758	55	1	134	2290
16761	0.5	1	152	2290
16764	8	1	162	2290
16767	2.4	7	137	2291
16770	0.07	7	155	2291
16793	20	7	134	2295
16796	3	7	149	2295
17127	4.8	3	137	2342
17129	4.5	3	149	2342
17131	0.8	3	154	2342
17133	30	3	162	2342
17143	240	12	119	2344
17145	5.4	12	137	2344
17147	4.5	12	149	2344
17149	0.2	12	155	2344
17150	240	1	119	2345
17152	6	1	137	2345
17154	4.5	1	149	2345
17156	0.25	1	155	2345
16733	7.5	4	137	2287
11168	0.7	9	146	1566
11170	0.2	9	152	1566
11172	0.05	9	155	1566
11166	50	9	135	1566
11182	60	1	134	1568
11185	0.5	1	152	1568
11206	180	3	135	1571
11209	4.5	3	149	1571
11212	0.25	3	155	1571
11214	120	9	119	1572
11216	6	9	137	1572
11218	1	9	149	1572
11220	1	9	154	1572
11222	20	9	162	1572
11224	180	3	135	1573
11226	0.5	3	146	1573
11228	1	3	152	1573
11230	0.25	3	155	1573
11233	180	3	135	1574
11236	4.5	3	149	1574
11239	0.25	3	155	1574
11243	6	3	137	1575
11246	1	3	152	1575
11249	20	3	162	1575
11250	200	1	119	1576
11252	7	1	137	1576
11254	4.5	1	149	1576
11256	1	1	154	1576
11258	0.01	1	157	1576
11261	4.8	1	137	1577
11264	1	1	152	1577
11267	20	1	162	1577
16736	0.8	4	154	2287
16739	15	4	162	2287
16742	4.7	1	137	2288
16745	0.12	1	155	2288
16759	4.7	1	137	2290
16762	0.12	1	155	2290
16765	80	7	130	2291
16768	1	7	146	2291
16792	80	7	130	2295
16795	1	7	146	2295
11183	5	1	137	1568
11186	0.25	1	155	1568
11189	6	3	137	1569
11192	1	3	152	1569
11195	20	3	162	1569
11196	120	3	119	1570
11199	2.5	3	146	1570
11202	1	3	154	1570
11205	120	3	119	1571
11208	2.5	3	146	1571
11211	1	3	154	1571
11232	120	3	119	1574
11235	2.5	3	146	1574
11238	1	3	154	1574
11241	120	3	119	1575
11244	2.6	3	146	1575
11247	1	3	154	1575
11259	120	1	119	1577
11262	2.5	1	146	1577
11265	1	1	154	1577
11268	120	3	119	1578
11269	180	3	135	1578
11270	6.5	3	137	1578
11271	2.5	3	146	1578
11272	4.5	3	149	1578
11273	1	3	152	1578
11274	1	3	154	1578
11275	0.25	3	155	1578
11276	20	3	162	1578
11277	120	3	119	1579
11278	180	3	135	1579
11279	6	3	137	1579
11280	2.5	3	146	1579
11281	4.5	3	149	1579
11282	1	3	152	1579
11283	1	3	154	1579
11284	0.25	3	155	1579
11285	20	3	162	1579
11286	120	3	119	1580
11287	180	3	135	1580
11288	4.8	3	137	1580
11289	2.5	3	146	1580
11290	4.5	3	149	1580
11291	1	3	152	1580
11292	1	3	154	1580
11293	0.25	3	155	1580
11294	20	3	162	1580
11295	120	3	119	1581
11296	180	3	135	1581
11297	6.5	3	137	1581
11298	2.5	3	146	1581
11299	4.5	3	149	1581
11300	1	3	152	1581
11301	1	3	154	1581
11302	0.25	3	155	1581
11303	20	3	162	1581
11304	200	1	119	1582
11305	100	1	135	1582
11306	6.5	1	137	1582
11307	0.5	1	146	1582
11308	4.5	1	149	1582
11309	1	1	152	1582
11310	1	1	154	1582
11311	0.12	1	155	1582
11312	0.01	1	157	1582
11313	120	3	119	1583
11314	180	3	135	1583
11315	7	3	137	1583
11316	2.5	3	146	1583
11317	4.5	3	149	1583
11318	1	3	152	1583
11319	1	3	154	1583
11320	0.25	3	155	1583
11321	20	3	162	1583
11322	250	1	119	1584
11323	50	1	134	1584
11324	5.5	1	137	1584
11325	0.5	1	146	1584
11326	0.5	1	152	1584
11327	0.12	1	155	1584
11328	0.008	1	157	1584
11329	250	2	119	1585
11330	50	2	134	1585
11331	6	2	137	1585
11332	2.5	2	146	1585
11333	4.5	2	149	1585
11334	0.5	2	152	1585
11335	0.25	2	155	1585
11336	85	2	119	1586
11337	15	2	134	1586
11338	2	2	137	1586
11339	0.1	2	146	1586
11340	1.5	2	149	1586
11341	0.2	2	152	1586
11342	0.2	2	155	1586
11343	10	2	162	1586
11344	85	2	119	1587
11345	15	2	134	1587
11346	2	2	137	1587
11347	0.1	2	146	1587
11348	1.5	2	149	1587
11349	0.2	2	152	1587
11350	0.2	2	155	1587
11351	2	2	162	1587
11352	85	2	119	1588
11353	15	2	134	1588
11354	2	2	137	1588
11355	0.1	2	146	1588
11356	1.5	2	149	1588
11357	0.2	2	152	1588
11358	0.2	2	155	1588
11359	85	2	119	1589
11360	15	2	134	1589
11361	2	2	137	1589
11362	0.1	2	146	1589
11363	1.5	2	149	1589
11364	0.2	2	152	1589
11365	0.2	2	155	1589
11366	80	7	119	1590
11367	20	7	134	1590
11368	2.5	7	137	1590
11369	0.8	7	146	1590
11370	4.5	7	149	1590
11371	0.07	7	155	1590
11372	85	2	119	1591
11373	15	2	134	1591
11374	1.8	2	137	1591
11375	0.1	2	146	1591
11376	1.5	2	149	1591
11377	0.2	2	152	1591
11378	0.05	2	155	1591
11379	7	2	162	1591
11380	65	8	119	1592
11381	35	8	134	1592
11382	2.2	8	137	1592
11383	0.7	8	146	1592
11384	3	8	149	1592
11386	0.05	8	155	1592
11388	50	9	135	1593
11390	0.7	9	146	1593
11392	0.2	9	152	1593
11394	0.05	9	155	1593
11395	50	9	119	1594
11397	2.3	9	137	1594
11399	2	9	149	1594
11401	0.3	9	154	1594
16748	200	4	119	2289
16752	0.8	4	152	2289
16756	15	4	162	2289
11385	0.2	8	152	1592
11387	50	9	119	1593
11389	2.3	9	137	1593
11391	2	9	149	1593
11393	0.2	9	154	1593
11396	50	9	135	1594
11398	0.7	9	146	1594
11400	0.2	9	152	1594
11402	0.05	9	155	1594
11403	50	9	119	1595
11404	50	9	135	1595
11405	2.5	9	137	1595
11406	0.7	9	146	1595
11407	2	9	149	1595
11408	0.2	9	152	1595
11409	0.3	9	154	1595
11410	0.05	9	155	1595
11411	50	9	119	1596
11412	50	9	135	1596
11413	2.3	9	137	1596
11414	0.7	9	146	1596
11415	2	9	149	1596
11416	0.2	9	152	1596
11417	0.3	9	154	1596
11418	0.05	9	155	1596
11419	240	1	119	1597
11420	60	1	134	1597
11421	5	1	137	1597
11422	3	1	146	1597
11423	0.5	1	152	1597
11424	0.25	1	155	1597
11425	120	3	119	1598
11426	180	3	135	1598
11427	6	3	137	1598
11428	2.5	3	146	1598
11429	4.5	3	149	1598
11430	1	3	152	1598
11431	1	3	154	1598
11432	0.25	3	155	1598
11433	20	3	162	1598
11434	120	3	119	1599
11435	180	3	135	1599
11436	4.8	3	137	1599
11437	2.5	3	146	1599
11438	4.5	3	149	1599
11439	1	3	152	1599
11440	1	3	154	1599
11441	0.25	3	155	1599
11442	20	3	162	1599
11443	120	13	119	1600
11444	180	13	135	1600
11445	6.5	13	137	1600
11446	2.5	13	146	1600
11447	4.5	13	149	1600
11448	1	13	152	1600
11449	1	13	154	1600
11450	0.25	13	155	1600
11451	20	13	162	1600
11452	120	9	119	1601
11453	180	9	135	1601
11454	6	9	137	1601
11455	2.5	9	146	1601
11456	1	9	149	1601
11457	1	9	152	1601
11458	1	9	154	1601
11459	0.25	9	155	1601
11460	20	9	162	1601
11461	120	3	119	1602
11462	180	3	135	1602
11463	4.8	3	137	1602
11464	0.5	3	146	1602
11465	4.5	3	149	1602
11466	1	3	152	1602
11467	1	3	154	1602
11468	0.25	3	155	1602
11469	20	3	162	1602
11470	120	13	119	1603
11471	180	13	135	1603
11472	6.5	13	137	1603
11473	2.5	13	146	1603
11474	4.5	13	149	1603
11475	1	13	152	1603
11476	1	13	154	1603
11477	0.25	13	155	1603
11478	20	13	162	1603
11479	120	3	119	1604
11480	180	3	135	1604
11481	6	3	137	1604
11482	2.5	3	146	1604
11483	4.5	3	149	1604
11484	1	3	152	1604
11485	1	3	154	1604
11486	0.25	3	155	1604
11487	20	3	162	1604
11488	120	3	119	1605
11489	180	3	135	1605
11490	4.8	3	137	1605
11491	2.5	3	146	1605
11492	4.5	3	149	1605
11493	1	3	152	1605
11494	1	3	154	1605
11495	0.25	3	155	1605
11496	20	3	162	1605
11497	120	13	119	1606
11498	180	13	135	1606
11499	6.5	13	137	1606
11500	2.5	13	146	1606
11501	4.5	13	149	1606
11502	1	13	152	1606
11503	1	13	154	1606
11504	0.25	13	155	1606
11505	20	13	162	1606
11506	120	3	119	1607
11507	180	3	135	1607
11508	7	3	137	1607
11509	2.5	3	146	1607
11510	4.5	3	149	1607
11511	1	3	152	1607
11512	1	3	154	1607
11513	0.25	3	155	1607
11514	20	3	162	1607
11515	120	3	119	1608
11516	180	3	135	1608
11517	6	3	137	1608
11518	2.5	3	146	1608
11519	4.5	3	149	1608
11520	1	3	152	1608
11521	1	3	154	1608
11522	0.25	3	155	1608
11523	20	3	162	1608
11524	120	3	119	1609
11525	180	3	135	1609
11526	4.8	3	137	1609
11527	2.5	3	146	1609
11528	4.5	3	149	1609
11529	1	3	152	1609
11530	1	3	154	1609
11532	20	3	162	1609
11605	55	1	134	1619
11607	2.5	1	146	1619
11609	0.25	1	155	1619
11647	55	1	134	1625
11649	0.5	1	146	1625
11651	0.12	1	155	1625
11661	50	4	134	1627
11663	0.5	4	146	1627
11665	0.12	4	155	1627
11675	240	1	119	1629
11677	4.2	1	137	1629
11679	0.5	1	152	1629
11681	0.008	1	157	1629
16749	100	4	135	2289
16753	0.8	4	154	2289
11531	0.25	3	155	1609
11533	180	3	119	1610
11534	120	3	135	1610
11535	6.5	3	137	1610
11536	2.5	3	146	1610
11537	4.5	3	149	1610
11538	1	3	152	1610
11539	1	3	154	1610
11540	0.25	3	155	1610
11541	20	3	162	1610
11604	245	1	119	1619
11606	5.5	1	137	1619
11608	0.5	1	152	1619
11646	245	1	119	1625
11648	5.5	1	137	1625
11650	0.5	1	152	1625
11652	0.008	1	157	1625
11660	250	4	119	1627
11662	4.8	4	137	1627
11664	0.5	4	152	1627
11666	0.008	4	157	1627
11676	60	1	134	1629
11678	0.5	1	146	1629
11680	0.12	1	155	1629
16750	7.5	4	137	2289
16754	0.12	4	155	2289
11542	250	1	119	1611
11543	50	1	134	1611
11544	5.5	1	137	1611
11545	0.5	1	146	1611
11546	0.5	1	152	1611
11547	0.12	1	155	1611
11548	0.008	1	157	1611
11585	6	12	137	1616
11588	0.5	12	152	1616
11590	190	3	119	1617
11593	2.5	3	146	1617
11596	0.25	3	155	1617
11597	240	1	119	1618
11600	0.5	1	146	1618
11603	0.008	1	157	1618
11620	4.2	2	137	1621
11623	0.12	2	155	1621
11631	190	3	119	1623
11634	2.5	3	146	1623
11637	1	3	154	1623
11639	240	1	119	1624
11642	0.5	1	146	1624
11645	0.008	1	157	1624
11669	4.8	3	137	1628
11672	0.8	3	152	1628
11690	190	3	119	1631
11693	2.5	3	146	1631
11696	1	3	154	1631
11699	180	3	135	1632
11702	4.5	3	149	1632
11705	0.25	3	155	1632
16751	0.5	4	146	2289
16755	0.01	4	157	2289
11549	120	3	119	1612
11551	4.8	3	137	1612
11553	4.5	3	149	1612
11555	1	3	154	1612
11557	20	3	162	1612
11559	180	3	135	1613
11561	2.5	3	146	1613
11563	1	3	152	1613
11565	0.25	3	155	1613
11568	180	13	135	1614
11570	2.5	13	146	1614
11572	1	13	152	1614
11574	0.25	13	155	1614
11576	240	1	119	1615
11578	4.2	1	137	1615
11580	0.5	1	152	1615
11582	0.008	1	157	1615
11610	190	3	119	1620
11612	6.1	3	137	1620
11614	4.5	3	149	1620
11616	1	3	154	1620
11625	55	1	134	1622
11627	0.5	1	146	1622
11629	0.12	1	155	1622
11654	60	4	134	1626
11656	0.5	4	146	1626
11658	0.12	4	155	1626
11683	50	4	134	1630
11685	0.5	4	146	1630
11687	0.12	4	155	1630
11689	20	4	162	1630
16771	65	7	130	2292
16773	2.2	7	137	2292
16775	3	7	149	2292
16777	70	7	155	2292
11550	180	3	135	1612
11552	2.5	3	146	1612
11554	1	3	152	1612
11556	0.25	3	155	1612
11558	120	3	119	1613
11560	6.5	3	137	1613
11562	4.5	3	149	1613
11564	1	3	154	1613
11566	20	3	162	1613
11567	120	13	119	1614
11569	6.5	13	137	1614
11571	4.5	13	149	1614
11573	1	13	154	1614
11575	20	13	162	1614
11577	60	1	134	1615
11579	0.5	1	146	1615
11581	0.12	1	155	1615
11583	250	12	119	1616
11584	50	12	134	1616
11586	2.5	12	146	1616
11587	4.5	12	149	1616
11589	0.25	12	155	1616
11591	110	3	135	1617
11592	6.1	3	137	1617
11594	4.5	3	149	1617
11595	0.8	3	152	1617
11598	60	1	134	1618
11599	4.2	1	137	1618
11601	0.5	1	152	1618
11602	0.12	1	155	1618
11611	110	3	135	1620
11613	2.5	3	146	1620
11615	0.8	3	152	1620
11617	0.25	3	155	1620
11618	240	2	119	1621
11619	60	2	134	1621
11621	0.5	2	146	1621
11622	0.5	2	152	1621
11624	245	1	119	1622
11626	5.5	1	137	1622
11628	0.5	1	152	1622
11630	0.008	1	157	1622
11632	110	3	135	1623
11633	6.1	3	137	1623
11635	4.5	3	149	1623
11636	0.8	3	152	1623
11638	0.25	3	155	1623
11640	60	1	134	1624
11641	4.2	1	137	1624
11643	0.5	1	152	1624
11644	0.12	1	155	1624
11653	240	4	119	1626
11655	4.2	4	137	1626
11657	0.5	4	152	1626
11659	0.008	4	157	1626
11667	190	3	119	1628
11668	110	3	135	1628
11670	2.5	3	146	1628
11671	4.5	3	149	1628
11673	1	3	154	1628
11674	0.25	3	155	1628
11682	250	4	119	1630
11684	4.8	4	137	1630
11686	0.5	4	152	1630
11688	0.008	4	157	1630
11691	110	3	135	1631
11692	4.8	3	137	1631
11694	4.5	3	149	1631
11695	0.8	3	152	1631
11697	0.25	3	155	1631
11698	120	3	119	1632
11700	4.8	3	137	1632
11701	2.5	3	146	1632
11703	1	3	152	1632
11704	1	3	154	1632
11706	20	3	162	1632
11707	120	3	119	1633
11708	180	3	135	1633
11709	4.8	3	137	1633
11710	2.5	3	146	1633
11711	4.5	3	149	1633
11712	1	3	152	1633
11713	1	3	154	1633
11714	0.25	3	155	1633
11715	20	3	162	1633
11716	240	1	119	1634
11717	60	1	134	1634
11718	4.2	1	137	1634
11719	0.5	1	146	1634
11720	0.5	1	152	1634
11721	0.12	1	155	1634
11722	0.008	1	157	1634
11723	50	9	119	1635
11724	50	9	135	1635
11725	2.2	9	137	1635
11726	0.7	9	146	1635
11727	2	9	149	1635
11728	0.2	9	152	1635
11729	0.2	9	154	1635
11730	0.05	9	155	1635
11731	50	9	119	1636
11732	50	9	135	1636
11733	2.2	9	137	1636
11734	0.7	9	146	1636
11735	2	9	149	1636
11736	0.2	9	152	1636
11737	0.2	9	154	1636
11738	0.05	9	155	1636
11739	50	9	119	1637
11740	50	9	135	1637
11741	2.2	9	137	1637
11742	0.7	9	146	1637
11743	2	9	149	1637
11744	0.2	9	152	1637
11745	0.3	9	154	1637
11746	0.05	9	155	1637
11747	40	13	119	1638
11748	60	13	135	1638
11749	2.2	13	137	1638
11750	0.8	13	146	1638
11751	1.5	13	149	1638
11752	0.3	13	152	1638
11753	0.35	13	154	1638
11754	0.08	13	155	1638
11755	10	13	162	1638
11756	40	13	119	1639
11757	60	13	135	1639
11758	2.2	13	137	1639
11759	0.8	13	146	1639
11760	1.5	13	149	1639
11761	0.3	13	152	1639
11762	0.3	13	154	1639
11763	0.08	13	155	1639
11764	10	13	162	1639
11765	83	1	119	1640
11766	16.5	1	134	1640
11767	1.85	1	137	1640
11768	0.17	1	146	1640
11769	0.17	1	152	1640
11770	0.04	1	155	1640
11771	0.003	1	157	1640
11828	85	1	119	1648
11829	15	1	134	1648
11830	1.3	1	137	1648
11831	0.2	1	146	1648
11832	0.2	1	152	1648
11833	0.004	1	155	1648
11834	0.003	1	157	1648
11835	10	1	162	1648
11875	130	8	119	1654
11877	4.1	8	137	1654
11879	6	8	149	1654
11881	0.1	8	155	1654
11905	70	8	134	1658
11907	1.4	8	146	1658
11909	0.4	8	152	1658
11919	70	8	134	1660
11921	1.4	8	146	1660
11923	0.4	8	152	1660
11951	225	5	119	1665
11953	5.3	5	137	1665
11955	4.5	5	149	1665
11957	0.12	5	155	1665
12004	40	11	119	1672
12007	0.8	11	146	1672
12010	0.3	11	154	1672
16772	35	7	134	2292
16774	0.2	7	146	2292
16776	0.2	7	152	2292
11772	85	1	119	1641
11774	1.8	1	137	1641
11776	0.17	1	152	1641
11778	0.003	1	157	1641
11781	15	1	134	1642
11783	0.17	1	146	1642
11785	0.04	1	155	1642
11787	15	1	162	1642
11789	50	9	135	1643
11791	0.7	9	146	1643
11793	0.2	9	152	1643
11795	0.05	9	155	1643
11837	15	1	134	1649
11839	0.2	1	146	1649
11841	0.04	1	155	1649
11843	10	1	162	1649
11925	240	12	119	1661
11927	5.4	12	137	1661
11929	4.5	12	149	1661
11931	0.25	12	155	1661
11939	60	1	134	1663
11941	0.5	1	146	1663
11943	0.12	1	155	1663
11946	55	1	134	1664
11948	2.5	1	146	1664
11950	0.25	1	155	1664
10873	1.2	2	147	1527
11990	15	1	134	1670
11992	0.2	1	146	1670
11994	0.04	1	155	1670
11773	15	1	134	1641
11775	0.17	1	146	1641
11777	0.04	1	155	1641
11779	15	1	162	1641
11780	85	1	119	1642
11784	0.17	1	152	1642
11786	0.003	1	157	1642
11788	50	9	119	1643
11790	2.2	9	137	1643
11792	2	9	149	1643
11794	0.3	9	154	1643
11836	85	1	119	1649
11838	1.3	1	137	1649
11840	0.2	1	152	1649
11842	0.003	1	157	1649
11782	1.8	1	137	1642
11926	60	12	134	1661
11928	2.5	12	146	1661
11930	0.6	12	152	1661
11938	240	1	119	1663
11940	4.2	1	137	1663
11942	0.5	1	152	1663
11944	0.008	1	157	1663
11945	245	1	119	1664
11947	6.5	1	137	1664
11949	0.5	1	152	1664
11989	85	1	119	1670
11991	1.3	1	137	1670
11993	0.2	1	152	1670
11995	0.003	1	157	1670
11796	50	9	119	1644
11798	2.2	9	137	1644
11800	2	9	149	1644
11802	0.3	9	154	1644
11805	15	1	134	1645
11807	0.17	1	146	1645
11809	0.04	1	155	1645
11811	15	1	162	1645
11812	85	1	119	1646
11814	1.8	1	137	1646
11816	0.17	1	152	1646
11818	0.003	1	157	1646
11853	75	5	134	1651
11855	0.5	5	146	1651
11857	0.8	5	152	1651
11859	0.008	5	157	1651
11869	110	3	135	1653
11871	2.5	3	146	1653
11873	0.8	3	152	1653
11896	240	1	119	1657
11898	4.3	1	137	1657
11900	0.5	1	152	1657
11902	0.008	1	157	1657
11974	60	1	134	1668
11976	0.5	1	146	1668
11978	0.12	1	155	1668
12013	85	1	119	1673
12015	1.8	1	137	1673
12017	0.17	1	152	1673
12019	0.003	1	157	1673
12022	15	1	134	1674
12024	0.17	1	146	1674
12026	0.04	1	155	1674
12028	5	1	162	1674
11797	50	9	135	1644
11799	0.7	9	146	1644
11801	0.2	9	152	1644
11803	0.05	9	155	1644
11804	85	1	119	1645
11808	0.17	1	152	1645
11810	0.003	1	157	1645
11813	15	1	134	1646
11815	0.17	1	146	1646
11817	0.04	1	155	1646
11819	15	1	162	1646
11806	1.8	1	137	1645
11852	225	5	119	1651
11854	5.3	5	137	1651
11856	4.5	5	149	1651
11858	0.12	5	155	1651
11860	15	5	162	1651
11868	190	3	119	1653
11870	6.3	3	137	1653
11872	4.5	3	149	1653
11874	0.25	3	155	1653
11897	60	1	134	1657
11899	0.5	1	146	1657
11901	0.12	1	155	1657
11903	5	1	162	1657
11973	240	1	119	1668
11975	4.2	1	137	1668
11977	0.5	1	152	1668
11979	0.008	1	157	1668
12014	15	1	134	1673
12016	0.17	1	146	1673
12018	0.04	1	155	1673
12020	5	1	162	1673
12021	85	1	119	1674
12023	1.8	1	137	1674
12025	0.17	1	152	1674
12027	0.003	1	157	1674
11820	85	1	119	1647
11823	0.17	1	146	1647
11826	0.003	1	157	1647
11845	110	3	135	1650
11848	4.5	3	149	1650
11851	0.25	3	155	1650
11862	60	2	134	1652
11865	4.5	2	149	1652
11883	70	8	134	1655
11886	6	8	149	1655
11889	250	12	119	1656
11892	2.5	12	146	1656
11895	0.25	12	155	1656
11913	5.4	12	137	1659
11916	0.6	12	152	1659
11934	4.4	1	137	1662
11937	0.25	1	155	1662
11961	4.6	8	137	1666
11964	0.4	8	152	1666
11967	60	12	134	1667
11970	4.5	12	149	1667
11981	75	5	134	1669
11984	4.5	5	149	1669
11987	0.01	5	157	1669
11996	85	1	119	1671
11999	0.2	1	146	1671
12002	0.003	1	157	1671
12031	1.3	1	137	1675
12034	0.04	1	155	1675
11821	15	1	134	1647
11824	0.17	1	152	1647
11827	10	1	162	1647
11846	6.3	3	137	1650
11849	0.8	3	152	1650
11863	5.8	2	137	1652
11866	0.8	2	152	1652
11884	4.4	8	137	1655
11887	0.4	8	152	1655
11891	6	12	137	1656
11894	0.5	12	152	1656
11912	60	12	134	1659
11915	4.5	12	149	1659
11933	60	1	134	1662
11936	0.5	1	152	1662
11960	70	8	134	1666
11963	6	8	149	1666
11966	240	12	119	1667
11969	2.5	12	146	1667
11972	0.25	12	155	1667
11982	5.3	5	137	1669
11985	0.8	5	152	1669
11988	15	5	162	1669
11998	1.3	1	137	1671
12001	0.04	1	155	1671
12030	15	1	134	1675
12033	0.2	1	152	1675
12036	5	1	162	1675
11822	1.8	1	137	1647
11825	0.04	1	155	1647
11844	190	3	119	1650
11847	2.5	3	146	1650
11850	1	3	154	1650
11861	240	2	119	1652
11864	2.5	2	146	1652
11867	0.25	2	155	1652
11876	70	8	134	1654
11878	1400	8	146	1654
11880	0.4	8	152	1654
11882	130	8	119	1655
11885	1.4	8	146	1655
11888	0.1	8	155	1655
11890	50	12	134	1656
11893	4.5	12	149	1656
11904	130	8	119	1658
11906	4.4	8	137	1658
11908	4.5	8	149	1658
11910	0.1	8	155	1658
11911	240	12	119	1659
11914	2.5	12	146	1659
11917	0.25	12	155	1659
11918	130	8	119	1660
11920	4.8	8	137	1660
11922	6	8	149	1660
11924	0.1	8	155	1660
11932	240	1	119	1662
11935	2.5	1	146	1662
11952	75	5	134	1665
11954	0.5	5	146	1665
11956	0.8	5	152	1665
11958	0.01	5	157	1665
11959	130	8	119	1666
11962	1.4	8	146	1666
11965	0.1	8	155	1666
11968	5.4	12	137	1667
11971	0.6	12	152	1667
11980	125	5	119	1669
11983	0.5	5	146	1669
11986	0.12	5	155	1669
11997	15	1	134	1671
12000	0.2	1	152	1671
12003	5	1	162	1671
12005	60	11	135	1672
12006	2.2	11	137	1672
12008	1.5	11	149	1672
12009	0.3	11	152	1672
12011	0.08	11	155	1672
12012	10	11	162	1672
12029	85	1	119	1675
12032	0.2	1	146	1675
12035	0.003	1	157	1675
12037	85	1	119	1676
12038	15	1	134	1676
12039	1.8	1	137	1676
12040	0.2	1	146	1676
12041	0.2	1	152	1676
12042	0.04	1	155	1676
12043	0.003	1	157	1676
12044	5	1	162	1676
12045	40	3	119	1677
12046	60	3	135	1677
12047	2.3	3	137	1677
12048	0.7	3	146	1677
12049	1.5	3	149	1677
12050	0.3	3	152	1677
12051	0.3	3	154	1677
12052	0.07	3	155	1677
12053	5	3	162	1677
12054	40	11	119	1678
12055	60	11	135	1678
12056	2.2	11	137	1678
12057	0.8	11	146	1678
12058	1.5	11	149	1678
12059	0.3	11	152	1678
12060	0.3	11	154	1678
12061	0.08	11	155	1678
12062	5	11	162	1678
12063	80	2	119	1679
12064	20	2	134	1679
12065	2.3	2	137	1679
12066	0.8	2	146	1679
12067	1.5	2	149	1679
12068	0.2	2	152	1679
12069	0.07	2	155	1679
12070	50	9	119	1680
12071	50	9	135	1680
12072	2.1	9	137	1680
12073	0.7	9	146	1680
12074	2	9	149	1680
12075	0.2	9	152	1680
12076	0.3	9	154	1680
12077	0.07	9	155	1680
12078	90	12	119	1681
12079	10	12	134	1681
12080	1.7	12	137	1681
12081	0.1	12	146	1681
12082	1.5	12	149	1681
12083	0.2	12	152	1681
12084	0.03	12	155	1681
12085	10	12	162	1681
12086	100	527	119	1682
12087	3.7	527	137	1682
12088	0.5	527	146	1682
12089	0.1	527	152	1682
12090	0.1	527	154	1682
12091	60	8	119	1683
12092	40	8	134	1683
12093	2.2	8	137	1683
12094	0.7	8	146	1683
12095	3	8	149	1683
12096	0.2	8	152	1683
12097	0.05	8	155	1683
12098	60	8	119	1684
12099	40	8	134	1684
12100	2.2	8	137	1684
12101	0.7	8	146	1684
12102	3	8	149	1684
12103	0.2	8	152	1684
12104	0.05	8	155	1684
12105	65	8	119	1685
12106	35	8	134	1685
12107	2.2	8	137	1685
12108	0.7	8	146	1685
12109	3	8	149	1685
12110	0.2	8	152	1685
12111	0.05	8	155	1685
12112	65	8	119	1686
12113	35	8	134	1686
12114	2.2	8	137	1686
12115	0.7	8	146	1686
12116	3	8	149	1686
12117	0.2	8	152	1686
12118	0.05	8	155	1686
12119	65	8	119	1687
12120	35	8	134	1687
12123	3	8	149	1687
12137	0.004	1	157	1322
12168	3.5	1	139	1692
12171	0.004	1	157	1692
12174	15	1	162	1692
12229	10	1	136	1699
12232	0.1	1	155	1699
12235	1.3	1	160	1699
12245	75	1	119	1701
12248	0.22	1	146	1701
12251	0.3	1	159	1701
12299	3.5	1	139	1707
12302	0.004	1	157	1707
12305	15	1	162	1707
12121	2.2	8	137	1687
12124	0.2	8	152	1687
12166	75	1	119	1692
12169	0.22	1	146	1692
12172	0.3	1	159	1692
12230	3.5	1	139	1699
12233	0.004	1	157	1699
12236	20	1	162	1699
12246	10	1	136	1701
12249	0.1	1	155	1701
12252	1.3	1	160	1701
12297	75	1	119	1707
12300	0.22	1	146	1707
12303	0.3	1	159	1707
12122	0.7	8	146	1687
12125	0.05	8	155	1687
12167	10	1	136	1692
12170	0.1	1	155	1692
12173	1.3	1	160	1692
12228	75	1	119	1699
12231	0.22	1	146	1699
12234	0.3	1	159	1699
12247	3.5	1	139	1701
12250	0.004	1	157	1701
12253	20	1	162	1701
12298	10	1	136	1707
12301	0.1	1	155	1707
12304	1.3	1	160	1707
12126	60	8	119	1688
12130	3	8	149	1688
12157	75	1	119	1691
12161	0.1	1	155	1691
12165	15	1	162	1691
12175	75	1	119	1693
12179	0.1	1	155	1693
12183	15	1	162	1693
12202	75	1	119	1696
12206	0.1	1	155	1696
12210	15	1	162	1696
12309	0.22	1	146	1708
12313	1.3	1	160	1708
12323	75	1	119	1710
12327	0.1	1	155	1710
12331	20	1	162	1710
12127	40	8	134	1688
12131	0.2	8	152	1688
12135	0.1	1	155	1432
12138	0.004	1	157	1304
12159	3.5	1	139	1691
12163	0.3	1	159	1691
12177	3.5	1	139	1693
12181	0.3	1	159	1693
12203	10	1	136	1696
12207	0.004	1	157	1696
12306	75	1	119	1708
12310	0.1	1	155	1708
12324	10	1	136	1710
12328	0.004	1	157	1710
12128	2.2	8	137	1688
12132	0.05	8	155	1688
12160	0.22	1	146	1691
12164	1.3	1	160	1691
12178	0.22	1	146	1693
12182	1.3	1	160	1693
12205	0.22	1	146	1696
12209	1.3	1	160	1696
12308	3.5	1	139	1708
12312	0.3	1	159	1708
12326	0.22	1	146	1710
12330	0.3	1	159	1710
12129	0.7	8	146	1688
12158	10	1	136	1691
12162	0.004	1	157	1691
12176	10	1	136	1693
12180	0.004	1	157	1693
12204	3.5	1	139	1696
12208	0.3	1	159	1696
12307	10	1	136	1708
12311	0.004	1	157	1708
12325	3.5	1	139	1710
12329	1.3	1	158	1710
12133	0.4	2	155	1527
12141	10	2	136	1689
12144	0.4	2	155	1689
12147	15	2	162	1689
12150	3.5	1	139	1690
12153	0.004	1	157	1690
12156	35	1	162	1690
12185	10	1	136	1694
12188	0.1	1	155	1694
12191	0.3	1	159	1694
12193	75	1	119	1695
12196	0.22	1	146	1695
12199	0.3	1	159	1695
12213	3.5	1	138	1697
12216	0.004	1	157	1697
12238	10	2	136	1700
12241	0.4	2	155	1700
12244	15	2	162	1700
12255	10	1	136	1702
12258	0.4	1	155	1702
12261	15	1	162	1702
12264	3.5	1	139	1703
12267	0.004	1	157	1703
12270	15	1	162	1703
12273	3.5	1	139	1704
12276	0.004	1	157	1704
12279	15	1	162	1704
12280	75	1	119	1705
12283	0.22	1	146	1705
12286	1.8	1	160	1705
12290	3.5	1	139	1706
12293	0.004	1	157	1706
12296	30	1	162	1706
12314	75	1	119	1709
12317	0.22	1	146	1709
12320	0.3	1	159	1709
12134	0.004	1	157	1531
10413	1.8	1	160	1467
12136	0.004	1	157	1403
12139	0.004	1	157	1325
12142	3.5	2	138	1689
12145	0.5	2	159	1689
12148	75	1	119	1690
12151	0.22	1	146	1690
12154	0.3	1	159	1690
12186	3.5	1	139	1694
12189	0.004	1	157	1694
12192	15	1	162	1694
12194	10	1	136	1695
12197	0.1	1	155	1695
12200	1.3	1	160	1695
12211	75	1	119	1697
12214	0.22	1	146	1697
12217	0.5	1	159	1697
12239	3.5	2	138	1700
12242	0.5	2	159	1700
12256	3.5	1	138	1702
12259	0.5	1	159	1702
12262	75	1	119	1703
12265	0.22	1	146	1703
12268	0.3	1	159	1703
12272	10	1	136	1704
12275	0.1	1	155	1704
12278	1.3	1	160	1704
12281	10	1	136	1705
12284	0.1	1	155	1705
12287	15	1	162	1705
12288	75	1	119	1706
12291	0.22	1	146	1706
12294	0.3	1	159	1706
12316	3.5	1	139	1709
12319	0.004	1	157	1709
12322	20	1	162	1709
12140	75	2	119	1689
12143	1.2	2	147	1689
12146	1.8	2	160	1689
12149	10	1	136	1690
12152	0.1	1	155	1690
12155	1.3	1	160	1690
12184	75	1	119	1694
12187	0.22	1	146	1694
12190	1.3	1	158	1694
12195	3.5	1	139	1695
12198	0.004	1	157	1695
12201	15	1	162	1695
12212	1	1	136	1697
12215	0.1	1	155	1697
12218	1.8	1	160	1697
12237	75	2	119	1700
12240	1.2	2	147	1700
12243	1.8	2	160	1700
12254	75	1	119	1702
12257	1.2	1	147	1702
12260	1.8	1	160	1702
12263	10	1	136	1703
12266	0.1	1	155	1703
12269	1.3	1	160	1703
12271	75	1	119	1704
12274	0.22	1	146	1704
12277	0.3	1	159	1704
12282	3.5	1	138	1705
12285	0.5	1	159	1705
12289	10	1	136	1706
12292	0.1	1	155	1706
12295	1.3	1	160	1706
12315	10	1	136	1709
12318	0.1	1	155	1709
12321	1.3	1	160	1709
12219	75	1	119	1698
12221	3.5	1	138	1698
12223	0.1	1	155	1698
12225	0.5	1	159	1698
12227	15	1	162	1698
12220	10	1	136	1698
12222	0.22	1	146	1698
12224	0.004	1	157	1698
12226	1.8	1	160	1698
12337	75	1	119	1712
12338	10	1	136	1712
12339	3.5	1	139	1712
12340	0.22	1	146	1712
12341	0.1	1	155	1712
12342	0.004	1	157	1712
12343	0.3	1	159	1712
12344	1.3	1	160	1712
12345	15	1	162	1712
12346	240	1	119	1713
12347	60	1	134	1713
12348	4.2	1	137	1713
12349	0.5	1	146	1713
12350	0.5	1	152	1713
12351	0.12	1	155	1713
12352	0.008	1	157	1713
12353	75	1	119	1714
12354	10	1	136	1714
12355	3.5	1	138	1714
12356	0.22	1	146	1714
12357	0.1	1	155	1714
12358	0.004	1	157	1714
12359	0.5	1	159	1714
12360	1.8	1	160	1714
12361	15	1	162	1714
12362	75	1	119	1715
12364	3.5	1	138	1715
12365	0.22	1	146	1715
12366	0.1	1	155	1715
12367	0.004	1	157	1715
12368	0.5	1	159	1715
12369	1.8	1	160	1715
12370	15	1	162	1715
12371	75	1	119	1716
12372	10	1	136	1716
12373	3.5	1	138	1716
12374	0.22	1	146	1716
12375	0.1	1	155	1716
12376	0.004	1	157	1716
12377	0.5	1	159	1716
12378	1.8	1	160	1716
12379	15	1	162	1716
12380	240	1	119	1717
12381	60	1	134	1717
12382	4.2	1	137	1717
12383	0.5	1	146	1717
12384	0.5	1	152	1717
12385	0.12	1	155	1717
12386	0.008	1	157	1717
12387	75	1	119	1718
12388	3	1	136	1718
12389	3.5	1	138	1718
12390	0.22	1	146	1718
12391	0.1	1	155	1718
12392	0.004	1	157	1718
12393	0.5	1	159	1718
12394	1.8	1	160	1718
12395	30	1	162	1718
12396	245	1	119	1719
12397	55	1	134	1719
12398	5.5	1	137	1719
12399	0.5	1	146	1719
12400	0.6	1	152	1719
12401	0.12	1	155	1719
12402	0.008	1	157	1719
12403	245	1	119	1720
12404	55	1	134	1720
12405	5.8	1	137	1720
12406	0.5	1	146	1720
12407	0.6	1	152	1720
12408	0.12	1	155	1720
12409	0.008	1	157	1720
12410	75	1	119	1721
12411	6	1	136	1721
12412	3.5	1	138	1721
12413	0.22	1	146	1721
12414	0.1	1	155	1721
12415	0.004	1	157	1721
12416	0.5	1	159	1721
12417	1.8	1	160	1721
12418	30	1	162	1721
12419	240	1	119	1722
12420	60	1	134	1722
12421	4.2	1	137	1722
12422	0.5	1	146	1722
12423	0.5	1	152	1722
12424	0.12	1	155	1722
12425	0.008	1	157	1722
12426	245	1	119	1723
12427	55	1	134	1723
12428	5.8	1	137	1723
12429	0.5	1	146	1723
12430	0.6	1	152	1723
12431	0.12	1	155	1723
12432	0.008	1	157	1723
12433	225	5	119	1724
12434	75	5	134	1724
12435	6	5	137	1724
12436	0.5	5	146	1724
12437	4.5	5	149	1724
12438	0.6	5	152	1724
12439	0.12	5	155	1724
12440	0.01	5	157	1724
12441	15	5	162	1724
12442	240	1	119	1725
12443	60	1	134	1725
12444	4.2	1	137	1725
12445	0.5	1	146	1725
12446	0.5	1	152	1725
12447	0.12	1	155	1725
12448	0.008	1	157	1725
12449	120	3	119	1726
12450	180	3	135	1726
12451	6.5	3	137	1726
12452	2.5	3	146	1726
12453	4.5	3	149	1726
12454	1	3	152	1726
12455	1	3	154	1726
12456	0.25	3	155	1726
12457	20	3	162	1726
12458	200	4	119	1727
12459	100	4	135	1727
12460	6.5	4	137	1727
12461	0.5	4	146	1727
12462	4.5	4	149	1727
12463	0.8	4	152	1727
12464	1	4	154	1727
12465	0.12	4	155	1727
12466	0.012	4	157	1727
12467	75	1	119	1728
12468	10	1	136	1728
12470	0.22	1	146	1728
12472	0.004	1	157	1728
12474	0.3	1	159	1728
12485	245	1	119	1730
12487	5.8	1	137	1730
12489	0.6	1	152	1730
12491	0.008	1	157	1730
12493	10	1	136	1731
12495	0.22	1	146	1731
12497	0.004	1	157	1731
12499	1.3	1	160	1731
12598	75	1	119	1744
12600	3.5	1	139	1744
12602	0.1	1	155	1744
12604	0.3	1	159	1744
12606	30	1	162	1744
12625	120	3	119	1747
12627	6.5	3	137	1747
12629	4.5	3	149	1747
12631	1	3	154	1747
12469	3.5	1	139	1728
12471	0.1	1	155	1728
12473	1.3	1	158	1728
12475	10	1	162	1728
12486	55	1	134	1730
12488	0.5	1	146	1730
12490	0.12	1	155	1730
12492	75	1	119	1731
12494	3.5	1	139	1731
12496	0.1	1	155	1731
12498	0.3	1	159	1731
12500	10	1	162	1731
12599	10	1	136	1744
12601	0.22	1	146	1744
12603	0.004	1	157	1744
12605	1.3	1	160	1744
12626	180	3	135	1747
12628	2.5	3	146	1747
12630	1	3	152	1747
12632	0.25	3	155	1747
12476	200	4	119	1729
12477	100	4	135	1729
12478	6.5	4	137	1729
12479	0.5	4	146	1729
12480	4.5	4	149	1729
12481	0.8	4	152	1729
12482	1	4	154	1729
12483	0.12	4	155	1729
12484	0.012	4	157	1729
12559	75	1	119	1739
12560	10	1	136	1739
12561	3.5	1	138	1739
12562	1.2	1	146	1739
12563	0.4	1	155	1739
12564	0.5	1	159	1739
12565	1.8	1	160	1739
12566	15	1	162	1739
12616	225	5	119	1746
12617	75	5	134	1746
12618	5.8	5	137	1746
12619	0.5	5	146	1746
12620	4.5	5	149	1746
12621	0.6	5	152	1746
12622	0.12	5	155	1746
12623	0.01	5	157	1746
12624	15	5	162	1746
12501	225	5	119	1732
12503	6	5	137	1732
12505	4.5	5	149	1732
12507	0.12	5	155	1732
12509	20	5	162	1732
12520	55	1	134	1734
12522	0.5	1	146	1734
12524	0.12	1	155	1734
12526	75	1	119	1735
12528	3.5	1	139	1735
12530	0.1	1	155	1735
12532	0.5	1	159	1735
12534	20	1	162	1735
12536	75	5	134	1736
12538	0.5	5	146	1736
12540	0.6	5	152	1736
12542	0.01	5	157	1736
12544	75	1	119	1737
12546	3.5	1	138	1737
12548	0.4	1	155	1737
12550	1.8	1	160	1737
12552	245	1	119	1738
12554	5.8	1	137	1738
12556	0.6	1	152	1738
12558	0.008	1	157	1738
12574	75	1	119	1741
12576	3.5	1	138	1741
12578	0.4	1	155	1741
12580	1.8	1	160	1741
12582	225	5	119	1742
12584	5.8	5	137	1742
12586	4.5	5	149	1742
12588	0.12	5	155	1742
12590	15	5	162	1742
12607	225	5	119	1745
12609	5.8	5	137	1745
12611	4.5	5	149	1745
12613	0.12	5	155	1745
12615	15	5	162	1745
12502	75	5	134	1732
12504	0.5	5	146	1732
12506	0.6	5	152	1732
12508	0.01	5	157	1732
12519	245	1	119	1734
12521	5.8	1	137	1734
12523	0.6	1	152	1734
12525	0.008	1	157	1734
12527	10	1	136	1735
12529	0.22	1	146	1735
12531	0.004	1	157	1735
12533	1.8	1	160	1735
12535	225	5	119	1736
12537	5.8	5	137	1736
12539	4.5	5	149	1736
12541	0.12	5	155	1736
12543	15	5	162	1736
12545	10	1	136	1737
12547	1.2	1	146	1737
12549	0.5	1	159	1737
12551	15	1	162	1737
12553	55	1	134	1738
12555	0.5	1	146	1738
12557	0.12	1	155	1738
12575	10	1	136	1741
12577	1.2	1	146	1741
12579	0.5	1	159	1741
12581	15	1	162	1741
12583	75	5	134	1742
12585	0.5	5	146	1742
12587	0.6	5	152	1742
12589	0.01	5	157	1742
12608	75	5	134	1745
12610	0.5	5	146	1745
12612	0.6	5	152	1745
12614	0.01	5	157	1745
12510	75	1	119	1733
12512	3.5	1	138	1733
12514	0.1	1	155	1733
12516	0.5	1	159	1733
12518	20	1	162	1733
12567	245	1	119	1740
12569	5.8	1	137	1740
12571	0.6	1	152	1740
12573	0.008	1	157	1740
12592	60	2	134	1743
12594	2.5	2	146	1743
12596	0.6	2	152	1743
12511	3	1	136	1733
12513	0.22	1	146	1733
12515	0.004	1	157	1733
12517	1.8	1	160	1733
12568	55	1	134	1740
12570	0.5	1	146	1740
12572	0.12	1	155	1740
12591	240	2	119	1743
12593	0.6	2	137	1743
12595	4.5	2	149	1743
12597	0.25	2	155	1743
12633	90	2	119	1748
12634	10	2	134	1748
12635	1.7	2	137	1748
12636	0.1	2	146	1748
12637	1.5	2	149	1748
12638	0.2	2	152	1748
12639	0.03	2	155	1748
12640	5	2	162	1748
12641	60	8	119	1749
12642	40	8	134	1749
12643	2.2	8	137	1749
12644	0.7	8	146	1749
12645	3	8	149	1749
12646	0.2	8	152	1749
12647	0.05	8	155	1749
12648	65	8	119	1750
12649	35	8	134	1750
12650	2.2	8	137	1750
12651	0.7	8	146	1750
12652	3	8	149	1750
12653	0.2	8	152	1750
12654	0.05	8	155	1750
12655	65	8	119	1751
12656	35	8	134	1751
12657	2.2	8	137	1751
12658	0.7	8	146	1751
12659	3	8	149	1751
12660	0.2	8	152	1751
12661	0.05	8	155	1751
12662	60	8	119	1752
12663	40	8	134	1752
12664	2.2	8	137	1752
12665	0.7	8	146	1752
12666	3	8	149	1752
12667	0.2	8	152	1752
12668	0.05	8	155	1752
12669	65	8	119	1753
12670	35	8	134	1753
12671	2.2	8	137	1753
12672	0.7	8	146	1753
12673	3	8	149	1753
12674	0.2	8	152	1753
12675	0.05	8	155	1753
12676	65	8	119	1754
12677	35	8	134	1754
12678	2.4	8	137	1754
12679	0.7	8	146	1754
12680	3	8	149	1754
12681	0.2	8	152	1754
12682	0.05	8	155	1754
12683	65	8	119	1755
12684	35	8	134	1755
12685	2.4	8	137	1755
12686	0.7	8	146	1755
12687	3	8	149	1755
12688	0.2	8	152	1755
12689	0.05	8	155	1755
12690	55	8	119	1756
12691	45	8	135	1756
12692	2.1	8	137	1756
12693	0.7	8	146	1756
12694	2	8	149	1756
12695	0.2	8	152	1756
12696	0.3	8	154	1756
12697	0.05	8	155	1756
12698	55	9	119	1757
12699	45	9	135	1757
12700	2.1	9	137	1757
12701	0.7	9	146	1757
12702	2	9	149	1757
12703	0.2	9	152	1757
12704	0.3	9	154	1757
12705	0.05	9	155	1757
12706	65	8	119	1758
12707	35	8	134	1758
12708	2.4	8	137	1758
12709	0.7	8	146	1758
12710	3	8	149	1758
12711	0.2	8	152	1758
12712	0.05	8	155	1758
12713	50	9	119	1759
12714	50	9	135	1759
12715	2.2	9	137	1759
12716	0.7	9	146	1759
12717	2	9	149	1759
12718	0.2	9	152	1759
12719	0.3	9	154	1759
12720	0.05	9	155	1759
12721	50	9	119	1760
12722	50	9	135	1760
12723	2.1	9	137	1760
12724	0.7	9	146	1760
12725	2	9	149	1760
12726	0.2	9	152	1760
12727	0.3	9	154	1760
12728	0.05	9	155	1760
12729	50	9	119	1761
12730	50	9	135	1761
12731	2.1	9	137	1761
12732	0.7	9	146	1761
12733	2	9	149	1761
12734	0.2	9	152	1761
12735	0.3	9	154	1761
12736	0.05	9	155	1761
12737	90	2	119	1762
12738	10	2	134	1762
12739	1.7	2	137	1762
12740	0.1	2	146	1762
12741	1.5	2	149	1762
12742	0.2	2	152	1762
12743	0.03	2	155	1762
12744	10	2	162	1762
12745	90	2	119	1763
12746	10	2	134	1763
12747	1.7	2	137	1763
12748	0.1	2	146	1763
12749	1.5	2	149	1763
12750	0.2	2	152	1763
12751	0.03	2	155	1763
12752	10	2	162	1763
12753	90	2	119	1764
12754	10	2	134	1764
12755	1.7	2	137	1764
12756	0.1	2	146	1764
12757	1.5	2	149	1764
12758	0.2	2	152	1764
12762	20	2	134	1765
12765	1.5	2	149	1765
12768	80	2	119	1766
12771	0.2	2	146	1766
12774	0.15	2	155	1766
12776	10	2	134	1767
12779	1.5	2	149	1767
12782	10	2	162	1767
12784	35	8	134	1768
12787	3	8	149	1768
12792	2.4	8	137	1769
12795	0.2	8	152	1769
12798	40	9	134	1770
12801	3	9	149	1770
12827	2.4	1	137	1774
12830	0.2	1	152	1774
12841	50	1	134	1776
12844	0.5	1	152	1776
12847	5	1	162	1776
12848	240	1	119	1777
12851	0.5	1	146	1777
12854	0.008	1	157	1777
12875	6.5	3	137	1780
12878	1	3	152	1780
12881	15	3	162	1780
12882	250	2	119	1781
12885	3.5	2	146	1781
12888	0.25	2	155	1781
12890	50	1	134	1782
12893	0.5	1	152	1782
12896	5	1	162	1782
12897	120	3	119	1783
12900	2.5	3	146	1783
12903	1	3	154	1783
12906	120	3	119	1784
12909	2.5	3	146	1784
12912	1	3	154	1784
12956	5	1	134	1790
12959	0.5	1	152	1790
12994	50	12	134	1795
12997	4.5	12	149	1795
12759	0.03	2	155	1764
12763	2	2	137	1765
12766	0.2	2	152	1765
12769	20	2	134	1766
12772	1.5	2	149	1766
12777	1.7	2	137	1767
12780	0.2	2	152	1767
12785	2.4	8	137	1768
12788	0.2	8	152	1768
12791	35	8	134	1769
12794	3	8	149	1769
12797	60	9	119	1770
12800	0.7	9	146	1770
12803	0.05	9	155	1770
12826	35	1	134	1774
12829	3	1	149	1774
12842	5.5	1	137	1776
12845	0.12	1	155	1776
12849	60	1	134	1777
12852	0.5	1	152	1777
12855	5	1	162	1777
12874	180	3	135	1780
12877	4.5	3	149	1780
12880	0.25	3	155	1780
12884	6	2	137	1781
12887	0.5	2	152	1781
12889	250	1	119	1782
12892	0.5	1	146	1782
12895	0.008	1	157	1782
12899	5	3	137	1783
12902	1	3	152	1783
12905	15	3	162	1783
12908	6.5	3	137	1784
12911	1	3	152	1784
12914	25	3	162	1784
12955	250	1	119	1790
12958	0.5	1	146	1790
12961	0.008	1	157	1790
12995	6	12	137	1795
12998	0.5	12	152	1795
12760	10	2	162	1764
12761	80	2	119	1765
12764	0.2	2	146	1765
12767	0.15	2	155	1765
12770	2	2	137	1766
12773	0.2	2	152	1766
12775	90	2	119	1767
12778	0.1	2	146	1767
12781	0.03	2	155	1767
12783	65	8	119	1768
12786	0.7	8	146	1768
12789	0.05	8	155	1768
12790	65	8	119	1769
12793	0.7	8	146	1769
12796	0.05	8	155	1769
12799	2.2	9	137	1770
12802	0.2	9	152	1770
12804	65	8	119	1771
12806	2.2	8	137	1771
12808	3	8	149	1771
12810	0.05	8	155	1771
12811	65	8	119	1772
12813	2.2	8	137	1772
12815	3	8	149	1772
12817	0.05	8	155	1772
12825	65	1	119	1774
12828	0.7	1	146	1774
12831	0.05	1	155	1774
12833	60	1	134	1775
12835	0.5	1	146	1775
12837	0.12	1	155	1775
12839	5	1	162	1775
12840	250	1	119	1776
12843	0.5	1	146	1776
12846	0.008	1	157	1776
12850	4.2	1	137	1777
12853	0.12	1	155	1777
12873	120	3	119	1780
12876	2.5	3	146	1780
12879	1	3	154	1780
12883	50	2	134	1781
12886	4.5	2	149	1781
12891	5.5	1	137	1782
12894	0.12	1	155	1782
12898	180	3	135	1783
12901	4.5	3	149	1783
12904	0.25	3	155	1783
12907	180	3	135	1784
12910	4.5	3	149	1784
12913	0.25	3	155	1784
12923	120	3	119	1786
12925	6	3	137	1786
12927	4.5	3	149	1786
12929	1	3	154	1786
12931	15	3	162	1786
12933	180	1	135	1787
12935	2.5	1	146	1787
12937	1	1	152	1787
12939	0.25	1	155	1787
12957	5.5	1	137	1790
12960	0.12	1	155	1790
12993	250	12	119	1795
12996	3.5	12	146	1795
12999	0.25	12	155	1795
12805	35	8	134	1771
12807	0.7	8	146	1771
12809	0.2	8	152	1771
12812	35	8	134	1772
12814	0.7	8	146	1772
12816	0.2	8	152	1772
12832	240	1	119	1775
12834	4.2	1	137	1775
12836	0.5	1	152	1775
12838	0.008	1	157	1775
12924	180	3	135	1786
12926	2.5	3	146	1786
12928	1	3	152	1786
12930	0.25	3	155	1786
12932	120	1	119	1787
12934	5	1	137	1787
12936	4.5	1	149	1787
12938	1	1	154	1787
12940	15	1	162	1787
12818	65	8	119	1773
12820	2.2	8	137	1773
12822	3	8	149	1773
12824	0.05	8	155	1773
12857	50	1	134	1778
12859	0.5	1	146	1778
12861	0.12	1	155	1778
12863	5	1	162	1778
12865	180	3	135	1779
12867	2.5	3	146	1779
12869	1	3	152	1779
12871	0.25	3	155	1779
12916	60	1	134	1785
12918	0.5	1	146	1785
12920	0.12	1	155	1785
12922	5	1	162	1785
12941	250	1	119	1788
12943	5.5	1	137	1788
12945	0.5	1	152	1788
12947	0.008	1	157	1788
12949	50	2	134	1789
12951	3.5	2	146	1789
12953	0.5	2	152	1789
12971	250	2	119	1792
12973	6	2	137	1792
12975	4.5	2	149	1792
12977	0.25	2	155	1792
12979	50	2	135	1793
12981	3.5	2	146	1793
12983	0.5	2	152	1793
12819	35	8	134	1773
12821	0.7	8	146	1773
12823	0.2	8	152	1773
12856	250	1	119	1778
12858	5.5	1	137	1778
12860	0.5	1	152	1778
12862	0.008	1	157	1778
12864	120	3	119	1779
12866	5	3	137	1779
12868	4.5	3	149	1779
12870	1	3	154	1779
12872	15	3	162	1779
12915	240	1	119	1785
12917	4.2	1	137	1785
12919	0.5	1	152	1785
12921	0.008	1	157	1785
12942	50	1	134	1788
12944	0.5	1	146	1788
12946	0.12	1	155	1788
12948	250	2	119	1789
12950	6	2	137	1789
12952	4.5	2	149	1789
12954	0.25	2	155	1789
12972	50	2	135	1792
12974	3.5	2	146	1792
12976	0.5	2	152	1792
12978	250	2	119	1793
12980	6	2	137	1793
12982	4.5	2	149	1793
12984	0.25	2	155	1793
12962	120	1	119	1791
12963	180	1	135	1791
12964	5	1	137	1791
12965	2.5	1	146	1791
12966	4.5	1	149	1791
12967	1	1	152	1791
12968	1	1	154	1791
12969	0.25	1	155	1791
12970	15	1	162	1791
12985	120	3	119	1794
12986	180	3	135	1794
12987	5	3	137	1794
12988	2.5	3	146	1794
12989	4.5	3	149	1794
12990	1	3	152	1794
12991	0.25	3	155	1794
12992	15	3	162	1794
13000	240	1	119	1796
13001	60	1	134	1796
13002	4.2	1	137	1796
13003	0.5	1	146	1796
13004	0.5	1	152	1796
13005	0.12	1	155	1796
13006	0.008	1	157	1796
13007	200	5	119	1797
13008	100	5	135	1797
13009	4	5	137	1797
13010	0.5	5	146	1797
13011	4.5	5	149	1797
13012	0.8	5	152	1797
13013	1	5	154	1797
13014	0.12	5	155	1797
13015	0.01	5	157	1797
13016	30	5	162	1797
13017	250	12	119	1798
13018	50	12	134	1798
13019	5.5	12	137	1798
13020	2	12	146	1798
13021	4.5	12	149	1798
13022	0.6	12	152	1798
13023	0.2	12	155	1798
13024	240	1	119	1799
13025	60	1	134	1799
13026	4.2	1	137	1799
13027	0.5	1	146	1799
13028	0.5	1	152	1799
13029	0.12	1	155	1799
13030	0.008	1	157	1799
13031	200	1	119	1800
13032	100	1	135	1800
13033	4	1	137	1800
13034	0.5	1	146	1800
13035	4.5	1	149	1800
13036	0.8	1	152	1800
13037	1	1	154	1800
13038	0.12	1	155	1800
13039	0.01	1	157	1800
13040	30	1	162	1800
13041	250	12	119	1801
13042	50	12	134	1801
13043	6	12	137	1801
13044	2.5	12	146	1801
13045	4.5	12	149	1801
13046	0.5	12	152	1801
13047	0.25	12	155	1801
13048	240	1	119	1802
13049	60	1	134	1802
13050	4.2	1	137	1802
13051	0.5	1	146	1802
13052	0.5	1	152	1802
13053	0.12	1	155	1802
13054	0.008	1	157	1802
13055	200	1	119	1803
13056	100	1	135	1803
13057	4	1	137	1803
13058	0.5	1	146	1803
13059	4.5	1	149	1803
13060	0.8	1	152	1803
13061	1	1	154	1803
13062	0.12	1	155	1803
13063	0.01	1	157	1803
13064	30	1	162	1803
13065	250	12	119	1804
13066	50	12	134	1804
13067	6	12	137	1804
13068	3.5	12	146	1804
13069	4.5	12	149	1804
13070	0.8	12	152	1804
13071	0.25	12	155	1804
13072	240	1	119	1805
13073	60	1	134	1805
13074	4.2	1	137	1805
13075	0.5	1	146	1805
13076	0.5	1	152	1805
13077	0.12	1	155	1805
13078	0.008	1	157	1805
13079	200	1	119	1806
13080	100	1	135	1806
13081	4	1	137	1806
13082	0.5	1	146	1806
13083	4.5	1	149	1806
13084	0.8	1	152	1806
13085	1	1	154	1806
13086	0.12	1	155	1806
13087	0.01	1	157	1806
13088	30	1	162	1806
13089	250	12	119	1807
13090	50	12	134	1807
13091	6	12	137	1807
13092	3.5	12	146	1807
13093	4.5	12	149	1807
13094	0.8	12	152	1807
13095	0.25	12	155	1807
13096	240	1	119	1808
13097	60	1	134	1808
13098	4.2	1	137	1808
13099	0.5	1	146	1808
13100	0.5	1	152	1808
13101	0.12	1	155	1808
13102	0.008	1	157	1808
13103	200	1	119	1809
13104	100	1	135	1809
13105	4	1	137	1809
13106	0.5	1	146	1809
13107	4.5	1	149	1809
13108	0.8	1	152	1809
13109	1	1	154	1809
13110	0.12	1	155	1809
13111	0.01	1	157	1809
13112	30	1	162	1809
13113	240	1	119	1810
13114	60	1	134	1810
13115	4.2	1	137	1810
13116	0.5	1	146	1810
13117	0.5	1	152	1810
13118	0.12	1	155	1810
13119	0.008	1	157	1810
13121	100	1	135	1811
13124	4.5	1	149	1811
13127	0.12	1	155	1811
13131	180	13	135	1812
13134	4.5	13	149	1812
13137	0.25	13	155	1812
12363	10	1	136	1715
13193	100	9	135	1819
13196	4	9	149	1819
13199	0.1	9	155	1819
13207	250	12	119	1821
13210	3.5	12	146	1821
13213	0.25	12	155	1821
13235	5.5	1	137	1824
13238	0.12	1	155	1824
13241	100	5	135	1825
13244	4.5	5	149	1825
13247	0.12	5	155	1825
13252	4.2	9	137	1826
13255	0.4	9	152	1826
13266	50	12	134	1828
13269	4.5	12	149	1828
13282	0.5	1	146	1830
13285	0.008	1	157	1830
13286	200	5	119	1831
13289	0.5	5	146	1831
13292	1	5	154	1831
13295	30	5	162	1831
13312	50	12	134	1834
13315	4.5	12	149	1834
13321	0.5	1	146	1835
13324	0.008	1	157	1835
13332	200	5	119	1837
13335	0.5	5	146	1837
13338	1	5	154	1837
13341	30	5	162	1837
13342	40	13	119	1838
13345	0.1	13	146	1838
13348	0.3	13	154	1838
13352	3.5	1	139	1839
13355	0.004	1	157	1839
13358	15	1	162	1839
13359	40	9	119	1840
13362	0.7	9	146	1840
13365	0.3	9	154	1840
13279	245	1	119	1830
13318	245	1	119	1835
13368	10	12	134	1841
13371	1.5	12	149	1841
13374	10	12	162	1841
13390	65	8	119	1844
13393	0.7	8	146	1844
13396	0.05	8	155	1844
13413	80	12	119	1847
13416	0.2	12	146	1847
13419	80	13	119	1848
13422	0.2	13	146	1848
13120	200	1	119	1811
13123	0.5	1	146	1811
13126	1	1	154	1811
13129	30	1	162	1811
13130	120	13	119	1812
13133	2.5	13	146	1812
13136	1	13	154	1812
13192	100	9	119	1819
13195	1.4	9	146	1819
13198	0.6	9	154	1819
13209	6	12	137	1821
13212	0.5	12	152	1821
13237	0.5	1	152	1824
13240	200	5	119	1825
13243	0.5	5	146	1825
13246	1	5	154	1825
13249	30	5	162	1825
13251	100	9	135	1826
13254	4	9	149	1826
13257	0.1	9	155	1826
13265	250	12	119	1828
13268	3.5	12	146	1828
13271	0.25	12	155	1828
13281	5.5	1	137	1830
13284	0.12	1	155	1830
13288	4	5	137	1831
13291	0.8	5	152	1831
13294	0.01	5	157	1831
13311	250	12	119	1834
13314	2	12	146	1834
13317	0.25	12	155	1834
13320	5.5	1	137	1835
13323	0.12	1	155	1835
13333	100	5	135	1837
13336	4.5	5	149	1837
13339	0.12	5	155	1837
13343	60	13	135	1838
13346	1.5	13	149	1838
13349	0.07	13	155	1838
13350	75	1	119	1839
13353	0.22	1	146	1839
13356	0.3	1	159	1839
13360	60	9	135	1840
13363	1.5	9	149	1840
13366	0.07	9	155	1840
13234	45	1	134	1824
13369	1.7	12	137	1841
13372	0.2	12	152	1841
13391	35	8	134	1844
13394	3	8	149	1844
13414	20	12	134	1847
13417	1.5	12	149	1847
13420	20	13	134	1848
13423	1.5	13	149	1848
13122	4	1	137	1811
13125	0.8	1	152	1811
13128	0.01	1	157	1811
13132	6.5	13	137	1812
13135	1	13	152	1812
13138	30	13	162	1812
13194	4.2	9	137	1819
13197	0.4	9	152	1819
13208	50	12	134	1821
13211	4.5	12	149	1821
13236	0.5	1	146	1824
13239	0.008	1	157	1824
13242	4.2	5	137	1825
13245	0.8	5	152	1825
13248	0.01	5	157	1825
13250	100	9	119	1826
13253	1.4	9	146	1826
13256	0.6	9	154	1826
13267	6	12	137	1828
13270	0.5	12	152	1828
13283	0.5	1	152	1830
13287	100	5	135	1831
13290	4.5	5	149	1831
13293	0.12	5	155	1831
13313	5.5	12	137	1834
13316	0.6	12	152	1834
13322	0.5	1	152	1835
13334	4	5	137	1837
13337	0.8	5	152	1837
13340	0.008	5	157	1837
13344	2.2	13	137	1838
13347	0.3	13	152	1838
13351	10	1	136	1839
13354	0.1	1	155	1839
13357	1.3	1	160	1839
13361	2.3	9	137	1840
13364	0.3	9	152	1840
13233	245	1	119	1824
13280	45	1	134	1830
13319	55	1	134	1835
13367	90	12	119	1841
13370	0.1	12	146	1841
13373	0.03	12	155	1841
13392	2.4	8	137	1844
13395	0.2	8	152	1844
13415	2	12	137	1847
13418	0.3	12	152	1847
13421	2	13	137	1848
13424	0.3	13	152	1848
13156	100	1	135	1815
13158	0.5	1	146	1815
13160	0.8	1	152	1815
13162	0.12	1	155	1815
13164	30	1	162	1815
13166	180	3	135	1816
13168	2.5	3	146	1816
13170	1	3	152	1816
13172	0.25	3	155	1816
13174	120	3	119	1817
13176	5	3	137	1817
13178	4.5	3	149	1817
13180	1	3	154	1817
13182	15	3	162	1817
13202	5.5	1	137	1820
13204	0.5	1	152	1820
13206	0.008	1	157	1820
13226	5.5	3	137	1823
13228	4.5	3	149	1823
13230	1	3	154	1823
13232	0.015	3	157	1823
13224	150	3	119	1823
13200	245	1	119	1820
13383	35	8	134	1843
13385	0.7	8	146	1843
13387	0.2	8	152	1843
13389	14	8	162	1843
13404	55	9	119	1846
13406	2.1	9	137	1846
13408	2	9	149	1846
13410	0.3	9	154	1846
13412	10	9	162	1846
13425	80	12	119	1849
13427	2	12	137	1849
13429	1.5	12	149	1849
10215	1.3	1	158	1443
13155	200	1	119	1815
13157	4	1	137	1815
13159	4.5	1	149	1815
13161	1	1	154	1815
13163	0.01	1	157	1815
13165	120	3	119	1816
13167	6.5	3	137	1816
13169	4.5	3	149	1816
13171	1	3	154	1816
13173	20	3	162	1816
13175	180	3	135	1817
13177	2.5	3	146	1817
13179	1	3	152	1817
13181	0.25	3	155	1817
13203	0.5	1	146	1820
13205	0.12	1	155	1820
13227	2.5	3	146	1823
13229	1	3	152	1823
13231	0.25	3	155	1823
13225	150	3	135	1823
13201	55	1	134	1820
13382	65	8	119	1843
13384	2.2	8	137	1843
13386	3	8	149	1843
13388	0.05	8	155	1843
13405	45	9	135	1846
13407	0.7	9	146	1846
13409	0.2	9	152	1846
13411	0.05	9	155	1846
13426	20	12	134	1849
13428	0.2	12	146	1849
13430	0.3	12	152	1849
13148	240	1	119	1814
13150	4.2	1	137	1814
13152	0.5	1	152	1814
13154	0.008	1	157	1814
13185	5.5	3	137	1818
13187	4.5	3	149	1818
13189	1	3	154	1818
13191	15	3	162	1818
13215	100	5	135	1822
13217	0.5	5	146	1822
13219	0.8	5	152	1822
13221	0.12	5	155	1822
13223	20	5	162	1822
13258	250	2	119	1827
13260	6	2	137	1827
13262	4.5	2	149	1827
13264	0.25	2	155	1827
13273	60	1	134	1829
13275	0.5	1	146	1829
13277	0.12	1	155	1829
13305	50	12	134	1833
13307	3.5	12	146	1833
13309	0.6	12	152	1833
13183	150	3	119	1818
13149	60	1	134	1814
13151	0.5	1	146	1814
13153	0.12	1	155	1814
13186	2.5	3	146	1818
13188	1	3	152	1818
13190	0.25	3	155	1818
13214	200	5	119	1822
13216	3.7	5	137	1822
13218	4.5	5	149	1822
13220	1	5	154	1822
13222	0.01	5	157	1822
13259	50	2	134	1827
13261	3.5	2	146	1827
13263	0.5	2	152	1827
13272	240	1	119	1829
13274	4.2	1	137	1829
13276	0.5	1	152	1829
13278	0.008	1	157	1829
13304	250	12	119	1833
13306	6	12	137	1833
13308	4.5	12	149	1833
13310	0.25	12	155	1833
13184	150	3	135	1818
13296	100	9	119	1832
13298	4.2	9	137	1832
13300	4	9	149	1832
13302	0.6	9	154	1832
13326	60	1	134	1836
13328	0.5	1	146	1836
13330	0.12	1	155	1836
13376	40	8	134	1842
13378	0.7	8	146	1842
13380	0.2	8	152	1842
13398	30	522	134	1845
13400	0.7	522	146	1845
13402	0.2	522	152	1845
13297	100	9	135	1832
13299	1.4	9	146	1832
13301	0.4	9	152	1832
13303	0.1	9	155	1832
13325	240	1	119	1836
13327	4.2	1	137	1836
13329	0.5	1	152	1836
13331	0.008	1	157	1836
13375	60	8	119	1842
13377	2.2	8	137	1842
13379	3	8	149	1842
13381	0.05	8	155	1842
13397	70	522	119	1845
13399	2.2	522	137	1845
13401	3	522	149	1845
13403	0.07	522	155	1845
13431	65	8	119	1850
13432	35	8	134	1850
13433	2.4	8	137	1850
13434	0.7	8	146	1850
13435	3	8	149	1850
13436	0.2	8	152	1850
13437	0.05	8	155	1850
13438	120	3	119	1851
13439	180	3	135	1851
13440	6	3	137	1851
13441	2.5	3	146	1851
13442	4.5	3	149	1851
13443	0.8	3	152	1851
13444	1	3	154	1851
13445	0.25	3	155	1851
13446	30	3	162	1851
13447	120	3	119	1852
13448	180	3	135	1852
13449	6	3	137	1852
13450	2.5	3	146	1852
13451	4.5	3	149	1852
13452	0.8	3	152	1852
13453	1	3	154	1852
13454	0.25	3	155	1852
13455	0.25	3	157	1852
13456	30	3	162	1852
13457	120	3	119	1853
13458	180	3	135	1853
13459	6	3	137	1853
13460	2.5	3	146	1853
13461	4.5	3	149	1853
13462	0.8	3	152	1853
13463	1	3	154	1853
13464	0.25	3	155	1853
13465	30	3	162	1853
13466	120	3	119	1854
13467	180	3	135	1854
13468	6	3	137	1854
13469	2.5	3	146	1854
13470	4.5	3	149	1854
13471	0.8	3	152	1854
13472	1	3	154	1854
13473	0.25	3	155	1854
13474	30	3	162	1854
13475	120	3	119	1855
13476	180	3	135	1855
13477	6	3	137	1855
13478	2.5	3	146	1855
13479	4.5	3	149	1855
13480	0.8	3	152	1855
13481	1	3	154	1855
13482	0.25	3	155	1855
13483	30	3	162	1855
13484	120	3	119	1856
13485	180	3	135	1856
13486	6	3	137	1856
13487	2.5	3	146	1856
13488	4.5	3	149	1856
13489	0.8	3	152	1856
13490	1	3	154	1856
13491	0.25	3	155	1856
13492	30	3	162	1856
13493	120	3	119	1857
13494	180	3	135	1857
13495	6	3	137	1857
13496	2.5	3	146	1857
13497	4.5	3	149	1857
13498	0.8	3	152	1857
13499	1	3	154	1857
13500	0.25	3	155	1857
13501	30	3	162	1857
13502	245	1	119	1858
13503	55	1	134	1858
13504	5.2	1	137	1858
13505	0.5	1	146	1858
13506	0.5	1	152	1858
13507	0.12	1	155	1858
13508	0.008	1	157	1858
13509	120	3	119	1859
13510	180	3	135	1859
13511	6	3	137	1859
13512	2.5	3	146	1859
13513	4.5	3	149	1859
13514	0.8	3	152	1859
13515	1	3	154	1859
13516	0.25	3	155	1859
13517	30	3	162	1859
13518	245	1	119	1861
13519	55	1	134	1861
13520	5.2	1	137	1861
13521	0.5	1	146	1861
13522	0.5	1	152	1861
13523	0.12	1	155	1861
13524	0.008	1	157	1861
13525	245	1	119	1862
13526	55	1	134	1862
13527	5.2	1	137	1862
13528	0.5	1	146	1862
13529	0.5	1	152	1862
13530	0.12	1	155	1862
13531	0.008	1	157	1862
13532	245	1	119	1863
13533	55	1	134	1863
13534	5.2	1	137	1863
13535	0.5	1	146	1863
13536	0.5	1	152	1863
13537	0.12	1	155	1863
13538	0.008	1	157	1863
13539	6	1	162	1863
13540	245	1	119	1864
13541	55	1	134	1864
13542	4.2	1	137	1864
13543	0.5	1	146	1864
13544	0.5	1	152	1864
13545	0.12	1	155	1864
13546	0.008	1	157	1864
13547	6	1	162	1864
13548	245	1	119	1865
13549	55	1	134	1865
13550	5.2	1	137	1865
13551	0.5	1	146	1865
13553	0.12	1	155	1865
13555	6	1	162	1865
13584	150	3	135	1869
13586	2.5	3	146	1869
13588	1	3	152	1869
13590	0.25	3	155	1869
13610	90	3	135	1872
13612	2.5	3	146	1872
13614	0.8	3	152	1872
13616	0.25	3	155	1872
13552	0.5	1	152	1865
13554	0.008	1	157	1865
13583	150	3	119	1869
13585	5.5	3	137	1869
13587	4.5	3	149	1869
13589	1	3	154	1869
13591	15	3	162	1869
13609	210	3	119	1872
13611	5.8	3	137	1872
13613	4.5	3	149	1872
13615	1	3	154	1872
13556	120	3	119	1866
13557	180	3	135	1866
13559	2.5	3	146	1866
13560	4.5	3	149	1866
13562	1	3	154	1866
13563	0.25	3	155	1866
13574	120	3	119	1868
13575	180	3	135	1868
13577	2.5	3	146	1868
13578	4.5	3	149	1868
13580	1	3	154	1868
13581	0.25	3	155	1868
13625	245	1	119	1874
13626	55	1	134	1874
13628	0.5	1	146	1874
13629	0.5	1	152	1874
13631	0.008	1	157	1874
13632	6	1	162	1874
13642	40	8	134	1876
13643	2.2	8	137	1876
13645	3	8	149	1876
13646	0.2	8	152	1876
13655	60	8	119	1878
13657	2.2	8	137	1878
13658	0.7	8	146	1878
13660	0.2	8	152	1878
13661	0.05	8	155	1878
13670	35	8	134	1880
13671	2.5	8	137	1880
13673	3	8	149	1880
13674	0.2	8	152	1880
13691	40	8	134	1883
13692	2.3	8	137	1883
13694	3	8	149	1883
13695	0.3	8	152	1883
13740	40	8	134	1890
13741	2.5	8	137	1890
13743	3	8	149	1890
13744	0.3	8	152	1890
13747	40	8	134	1891
13748	2.3	8	137	1891
13750	3	8	149	1891
13751	0.3	8	152	1891
13760	60	8	122	1893
13761	40	8	134	1893
13763	0.7	8	146	1893
13764	3	8	149	1893
13766	0.05	8	155	1893
13789	35	8	134	1897
13790	2.2	8	137	1897
13792	3	8	149	1897
13793	0.2	8	152	1897
13817	35	8	134	1901
13818	2.4	8	137	1901
13820	3	8	149	1901
13821	0.2	8	152	1901
13848	35	8	134	1906
13849	2.4	8	137	1906
13851	3	8	149	1906
13852	0.2	8	152	1906
13862	40	8	134	1908
13863	2.2	8	137	1908
13865	3	8	149	1908
13866	0.2	8	152	1908
13917	60	8	122	1916
13919	2.2	8	137	1916
13920	0.7	8	146	1916
13922	0.2	8	152	1916
13923	0.05	8	155	1916
13932	40	8	134	1918
13933	2.2	8	137	1918
13935	3	8	149	1918
13936	0.2	8	152	1918
13558	5	3	137	1866
13561	1	3	152	1866
13564	15	3	162	1866
13576	5.8	3	137	1868
13579	1	3	152	1868
13582	15	3	162	1868
13627	4.1	1	137	1874
13630	0.12	1	155	1874
13641	60	8	119	1876
13644	0.7	8	146	1876
13647	0.05	8	155	1876
13656	40	8	134	1878
13659	3	8	149	1878
13669	65	8	119	1880
13672	0.7	8	146	1880
13675	0.05	8	155	1880
13690	60	8	122	1883
13693	0.7	8	146	1883
13696	0.05	8	155	1883
13739	60	8	122	1890
13742	0.7	8	146	1890
13745	0.05	8	155	1890
13746	60	8	122	1891
13749	0.7	8	146	1891
13752	0.05	8	155	1891
13762	2.3	8	137	1893
13765	0.3	8	152	1893
13788	65	8	119	1897
13791	0.7	8	146	1897
13794	0.05	8	155	1897
13816	65	8	119	1901
13819	0.7	8	146	1901
13822	0.05	8	155	1901
13847	65	8	119	1906
13850	0.7	8	146	1906
13853	0.05	8	155	1906
13861	60	8	119	1908
13864	0.7	8	146	1908
13867	0.05	8	155	1908
13918	40	8	134	1916
13921	3	8	149	1916
13931	60	8	122	1918
13934	0.7	8	146	1918
13937	0.05	8	155	1918
13565	120	3	119	1867
13568	2.5	3	146	1867
13571	1	3	154	1867
13593	75	5	134	1870
13596	4.5	5	149	1870
13599	0.01	5	157	1870
13602	90	2	135	1871
13605	4.5	2	149	1871
13608	0.25	2	155	1871
13619	5.2	1	137	1873
13622	0.12	1	155	1873
13635	5	1	137	1875
13638	0.12	1	155	1875
13650	2.2	8	137	1877
13653	0.2	8	152	1877
13664	2.4	8	137	1879
13667	0.2	8	152	1879
13677	35	8	134	1881
13680	3	8	149	1881
13683	60	8	122	1882
13686	0.7	8	146	1882
13689	0.05	8	155	1882
13699	2.5	8	137	1884
13702	0.2	8	152	1884
13712	40	8	134	1886
13715	3	8	149	1886
13718	60	8	122	1887
13721	0.7	8	146	1887
13724	0.05	8	155	1887
13725	60	8	122	1888
13728	0.7	8	146	1888
13731	0.05	8	155	1888
13733	40	8	134	1889
13736	3	8	149	1889
13755	2.4	8	137	1892
13758	0.3	8	152	1892
13774	60	8	122	1895
13777	0.7	8	146	1895
13780	0.05	8	155	1895
13783	2.2	8	137	1896
13786	0.2	8	152	1896
13797	2.4	8	137	1898
13800	0.2	8	152	1898
13803	35	8	134	1899
13806	3	8	149	1899
13811	2.2	8	137	1900
13814	0.2	8	152	1900
13823	65	8	119	1902
13826	0.7	8	146	1902
13829	0.05	8	155	1902
13830	65	8	119	1903
13833	0.7	8	146	1903
13836	0.05	8	155	1903
13838	35	8	134	1904
13841	3	8	149	1904
13855	40	8	134	1907
13858	3	8	149	1907
13868	60	8	119	1909
13871	0.7	8	146	1909
13874	0.05	8	155	1909
13875	60	8	119	1910
13878	0.7	8	146	1910
13881	0.05	8	155	1910
13882	60	8	119	1911
13885	0.7	8	146	1911
13888	0.05	8	155	1911
13889	65	8	122	1912
13892	0.7	8	146	1912
13895	0.05	8	155	1912
13903	60	8	122	1914
13906	0.7	8	146	1914
13909	0.05	8	155	1914
13911	35	8	134	1915
13914	3	8	149	1915
13924	60	8	122	1917
13927	0.7	8	146	1917
13930	0.05	8	155	1917
13566	180	3	135	1867
13569	4.5	3	149	1867
13572	0.25	3	155	1867
13594	5.6	5	137	1870
13597	0.6	5	152	1870
13600	15	5	162	1870
13603	4.5	2	137	1871
13606	0.8	2	152	1871
13618	55	1	134	1873
13621	0.5	1	152	1873
13624	10	1	162	1873
13633	245	1	119	1875
13636	0.5	1	146	1875
13639	0.008	1	157	1875
13648	60	8	119	1877
13651	0.7	8	146	1877
13654	0.05	8	155	1877
13662	65	8	122	1879
13665	0.7	8	146	1879
13668	0.05	8	155	1879
13678	2.5	8	137	1881
13681	0.2	8	152	1881
13684	40	8	134	1882
13687	3	8	149	1882
13697	65	8	119	1884
13700	0.7	8	146	1884
13703	0.05	8	155	1884
13713	2.3	8	137	1886
13716	0.2	8	152	1886
13719	40	8	134	1887
13722	3	8	149	1887
13726	40	8	134	1888
13729	3	8	149	1888
13734	2.3	8	137	1889
13737	0.2	8	152	1889
13753	65	8	122	1892
13756	0.7	8	146	1892
13759	0.05	8	155	1892
13775	40	8	134	1895
13778	3	8	149	1895
13781	65	8	119	1896
13784	0.7	8	146	1896
13787	0.05	8	155	1896
13795	65	8	119	1898
13798	0.7	8	146	1898
13801	0.05	8	155	1898
13804	2.2	8	137	1899
13807	0.2	8	152	1899
13809	65	8	119	1900
13812	0.7	8	146	1900
13815	0.05	8	155	1900
13824	35	8	134	1902
13827	3	8	149	1902
13831	35	8	134	1903
13834	3	8	149	1903
13839	2.2	8	137	1904
13842	0.2	8	152	1904
13856	2.2	8	137	1907
13859	0.2	8	152	1907
13870	2.2	8	137	1909
13873	0.2	8	152	1909
13877	2.4	8	137	1910
13880	0.2	8	152	1910
13884	2.2	8	137	1911
13887	0.2	8	152	1911
13891	2.4	8	137	1912
13894	0.2	8	152	1912
13905	2.2	8	137	1914
13908	0.2	8	152	1914
13910	65	8	122	1915
13913	0.7	8	146	1915
13916	0.05	8	155	1915
13926	2.2	8	137	1917
13929	0.2	8	152	1917
13567	7	3	137	1867
13570	1	3	152	1867
13573	15	3	162	1867
13592	225	5	119	1870
13595	0.5	5	146	1870
13598	0.12	5	155	1870
13601	210	2	119	1871
13604	2.5	2	146	1871
13607	1	2	154	1871
13617	245	1	119	1873
13620	0.5	1	146	1873
13623	0.008	1	157	1873
13634	55	1	134	1875
13637	0.5	1	152	1875
13640	8	1	162	1875
13649	40	8	134	1877
13652	3	8	149	1877
13663	35	8	134	1879
13666	3	8	149	1879
13676	65	8	119	1881
13679	0.7	8	146	1881
13682	0.05	8	155	1881
13685	2.3	8	137	1882
13688	0.2	8	152	1882
13698	35	8	134	1884
13701	3	8	149	1884
13711	60	8	119	1886
13714	0.7	8	146	1886
13717	0.05	8	155	1886
13720	2.3	8	137	1887
13723	0.2	8	152	1887
13727	2.3	8	137	1888
13730	0.2	8	152	1888
13732	60	8	119	1889
13735	0.7	8	146	1889
13738	0.05	8	155	1889
13754	35	8	134	1892
13757	3	8	149	1892
13776	2.2	8	137	1895
13779	0.2	8	152	1895
13782	35	8	134	1896
13785	3	8	149	1896
13796	35	8	134	1898
13799	3	8	149	1898
13802	65	8	119	1899
13805	0.7	8	146	1899
13808	0.05	8	155	1899
13810	35	8	134	1900
13813	3	8	149	1900
13825	2.2	8	137	1902
13828	0.2	8	152	1902
13832	2.4	8	137	1903
13835	0.2	8	152	1903
13837	65	8	119	1904
13840	0.7	8	146	1904
13843	0.05	8	155	1904
13854	60	8	119	1907
13857	0.7	8	146	1907
13860	0.05	8	155	1907
13869	40	8	134	1909
13872	3	8	149	1909
13876	40	8	134	1910
13879	3	8	149	1910
13883	40	8	134	1911
13886	3	8	149	1911
13890	35	8	134	1912
13893	3	8	149	1912
13904	40	8	134	1914
13907	3	8	149	1914
13912	2.4	8	137	1915
13915	0.2	8	152	1915
13925	40	8	134	1917
13928	3	8	149	1917
13704	60	8	119	1885
13706	2.3	8	137	1885
13708	3	8	149	1885
13710	0.05	8	155	1885
13767	60	8	119	1894
13769	2.3	8	137	1894
13771	3	8	149	1894
13773	0.05	8	155	1894
13896	60	8	119	1913
13898	2.2	8	137	1913
13900	3	8	149	1913
13902	0.05	8	155	1913
13705	40	8	134	1885
13707	0.7	8	146	1885
13709	0.2	8	152	1885
13768	40	8	134	1894
13770	0.7	8	146	1894
13772	0.3	8	152	1894
13897	40	8	134	1913
13899	0.7	8	146	1913
13901	0.2	8	152	1913
13938	65	8	122	1919
13939	35	8	134	1919
13940	2.4	8	137	1919
13941	0.7	8	146	1919
13942	3	8	149	1919
13943	0.2	8	152	1919
13944	0.05	8	155	1919
13945	240	1	119	1920
13946	60	1	134	1920
13947	4.2	1	137	1920
13948	0.5	1	146	1920
13949	0.5	1	152	1920
13950	0.12	1	155	1920
13951	0.008	1	157	1920
13952	5	1	162	1920
13953	210	3	119	1921
13954	90	3	135	1921
13955	4.7	3	137	1921
13956	2.5	3	146	1921
13957	4.5	3	149	1921
13958	0.8	3	152	1921
13959	1	3	154	1921
13960	0.25	3	155	1921
13961	240	1	119	1922
13962	60	1	134	1922
13963	4.2	1	137	1922
13964	0.5	1	146	1922
13965	0.5	1	152	1922
13966	0.12	1	155	1922
13967	0.008	1	157	1922
13968	5	1	162	1922
13969	210	3	119	1923
13970	90	3	135	1923
13971	4.7	3	137	1923
13972	2.5	3	146	1923
13973	4.5	3	149	1923
13974	0.8	3	152	1923
13975	1	3	154	1923
13976	0.25	3	155	1923
13977	210	3	119	1924
13978	90	3	135	1924
13979	4.7	3	137	1924
13980	2.5	3	146	1924
13981	4.5	3	149	1924
13982	0.8	3	152	1924
13983	1	3	154	1924
13984	0.25	3	155	1924
13985	240	1	119	1925
13986	60	1	134	1925
13987	4.2	1	137	1925
13988	0.5	1	146	1925
13989	0.5	1	152	1925
13990	0.25	1	155	1925
13991	0.008	1	157	1925
13992	5	1	162	1925
13993	210	3	119	1926
13994	90	3	135	1926
13995	6	3	137	1926
13996	2.5	3	146	1926
13997	4.5	3	149	1926
13998	0.8	3	152	1926
13999	1	3	154	1926
14000	0.25	3	155	1926
14001	210	3	119	1927
14002	90	3	135	1927
14003	4.7	3	137	1927
14004	2.5	3	146	1927
14005	4.5	3	149	1927
14006	0.8	3	152	1927
14007	1	3	154	1927
14008	0.25	3	155	1927
14009	210	3	119	1928
14010	90	3	135	1928
14011	6	3	137	1928
14012	2.5	3	146	1928
14013	4.5	3	149	1928
14014	0.8	3	152	1928
14015	1	3	154	1928
14016	0.25	3	155	1928
14017	240	1	119	1929
14018	60	1	134	1929
14019	4.2	1	137	1929
14020	0.5	1	146	1929
14021	0.5	1	152	1929
14022	0.12	1	155	1929
14023	0.008	1	157	1929
14024	5	1	162	1929
14025	210	3	119	1930
14026	90	3	135	1930
14027	6	3	137	1930
14028	2.5	3	146	1930
14029	4.5	3	149	1930
14030	0.8	3	152	1930
14031	1	3	154	1930
14032	0.25	3	155	1930
14033	240	1	119	1931
14034	60	1	134	1931
14035	4.2	1	137	1931
14036	0.5	1	146	1931
14037	0.5	1	152	1931
14038	0.12	1	155	1931
14039	0.008	1	157	1931
14040	5	1	162	1931
14041	120	3	119	1932
14042	180	3	135	1932
14043	6	3	137	1932
14044	2.5	3	146	1932
14045	4.5	3	149	1932
14046	0.8	3	152	1932
14047	1	3	154	1932
14048	0.25	3	155	1932
14049	30	3	162	1932
14050	210	3	119	1933
14051	90	3	135	1933
14052	5.8	3	137	1933
14053	2.5	3	146	1933
14054	4.5	3	149	1933
14055	0.8	3	152	1933
14056	1	3	154	1933
14057	0.25	3	155	1933
14058	120	3	119	1934
14059	180	3	135	1934
14060	6	3	137	1934
14061	2.5	3	146	1934
14062	4.5	3	149	1934
14063	0.8	3	152	1934
14064	1	3	154	1934
14065	0.25	3	155	1934
14127	120	3	119	1942
14130	2.5	3	146	1942
14133	1	3	154	1942
14174	3.5	1	139	1947
14177	0.004	1	157	1947
14180	15	1	162	1947
14208	75	1	119	1951
14211	0.22	1	146	1951
14214	0.3	1	159	1951
14327	3.8	1	137	1965
14330	0.12	1	155	1965
14453	50	9	135	1983
14456	2	9	149	1983
14459	0.05	9	155	1983
14066	120	3	119	1935
14069	2.5	3	146	1935
14072	1	3	154	1935
14076	180	3	135	1936
14079	4.5	3	149	1936
14082	0.25	3	155	1936
14111	6	3	137	1940
14114	0.8	3	152	1940
14117	30	3	162	1940
14120	3.5	1	139	1941
14123	0.004	1	157	1941
14126	35	1	162	1941
14136	75	1	119	1943
14139	0.22	1	146	1943
14142	0.3	1	159	1943
14163	75	1	119	1946
14166	0.22	1	146	1946
14169	0.3	1	159	1946
14191	10	1	136	1949
14194	0.1	1	155	1949
14197	1.8	1	160	1949
14200	10	1	136	1950
14203	0.1	1	155	1950
14206	1.3	1	160	1950
14217	75	1	119	1952
14220	0.22	1	146	1952
14223	0.3	1	159	1952
14227	1	1	136	1953
14230	0.1	1	155	1953
14233	1.8	1	160	1953
14235	3	1	136	1954
14238	0.1	1	155	1954
14241	1.8	1	160	1954
14243	75	1	119	1955
14246	0.22	1	146	1955
14249	0.5	1	159	1955
14297	10	2	136	1961
14300	0.4	2	155	1961
14303	15	2	162	1961
14304	75	2	119	1962
14307	1.2	2	147	1962
14310	1.8	2	160	1962
14313	55	1	134	1963
14316	0.5	1	152	1963
14320	5.4	1	137	1964
14323	0.12	1	155	1964
14332	245	1	119	1966
14335	0.5	1	146	1966
14338	0.008	1	157	1966
14339	225	5	119	1967
14342	2.5	5	146	1967
14345	0.7	5	154	1967
14363	5	3	137	1970
14366	1	3	152	1970
14369	50	3	162	1970
14372	5	3	137	1971
14375	1	3	152	1971
14378	50	3	162	1971
14380	55	1	134	1972
14383	0.5	1	152	1972
14387	55	1	134	1973
14390	0.6	1	152	1973
14394	40	8	134	1974
14397	0.05	8	155	1974
14407	2.2	9	137	1976
14410	0.2	9	152	1976
14412	75	7	119	1977
14415	0.7	7	146	1977
14418	0.05	7	155	1977
14421	2.2	1	137	1978
14424	0.04	1	155	1978
14427	40	8	134	1979
14430	3	8	149	1979
14433	90	521	119	1980
14436	1	521	146	1980
14398	60	5	122	1975
14446	35	9	134	1982
14449	2	9	149	1982
14468	50	9	119	1985
14471	0.7	9	146	1985
14474	0.2	9	154	1985
14478	1.8	9	137	1986
14481	0.2	9	152	1986
14067	180	3	135	1935
14070	4.5	3	149	1935
14073	0.25	3	155	1935
14077	6	3	137	1936
14080	0.8	3	152	1936
14083	30	3	162	1936
14109	120	3	119	1940
14112	2.5	3	146	1940
14115	1	3	154	1940
14118	75	1	119	1941
14121	0.22	1	146	1941
14124	0.3	1	159	1941
14137	10	1	136	1943
14140	0.1	1	155	1943
14143	1.3	1	160	1943
14164	10	1	136	1946
14167	0.1	1	155	1946
14170	1.3	1	160	1946
14192	3.5	1	137	1949
14195	0.004	1	157	1949
14198	15	1	162	1949
14201	3.5	1	139	1950
14204	0.004	1	157	1950
14207	15	1	162	1950
14218	10	1	136	1952
14221	0.1	1	155	1952
14224	1.3	1	160	1952
14228	3.5	1	137	1953
14231	0.004	1	157	1953
14236	3.5	1	137	1954
14239	0.004	1	157	1954
14242	30	1	162	1954
14244	10	1	136	1955
14247	0.1	1	155	1955
14250	1.8	1	160	1955
14298	3.5	2	137	1961
14301	0.5	2	159	1961
14305	10	2	136	1962
14308	0.4	2	155	1962
14311	15	2	162	1962
14312	245	1	119	1963
14315	0.5	1	146	1963
14319	55	1	134	1964
14322	0.6	1	152	1964
14334	5.2	1	137	1966
14337	0.12	1	155	1966
14341	5.5	5	137	1967
14344	0.6	5	152	1967
14361	120	3	119	1970
14364	2.5	3	146	1970
14367	1	3	154	1970
14370	120	3	119	1971
14373	2.5	3	146	1971
14376	1	3	154	1971
14379	245	1	119	1972
14382	0.5	1	146	1972
14385	0.008	1	157	1972
14386	245	1	119	1973
14389	0.5	1	146	1973
14392	0.008	1	157	1973
14393	60	8	119	1974
14396	0.7	8	146	1974
14406	40	9	134	1976
14409	3	9	149	1976
14414	2.4	7	137	1977
14417	0.2	7	152	1977
14419	80	1	119	1978
14422	0.2	1	146	1978
14425	0.003	1	157	1978
14428	2.2	8	137	1979
14431	0.2	8	152	1979
14434	15	521	134	1980
14437	3	521	149	1980
14447	2.3	9	137	1982
14450	0.2	9	152	1982
14469	50	9	135	1985
14472	2	9	149	1985
14475	0.05	9	155	1985
14476	50	9	119	1986
14479	0.7	9	146	1986
14482	0.2	9	154	1986
14068	6	3	137	1935
14071	0.8	3	152	1935
14074	30	3	162	1935
14075	120	3	119	1936
14078	2.5	3	146	1936
14081	1	3	154	1936
14084	210	3	119	1937
14085	90	3	135	1937
14086	5.8	3	137	1937
14087	2.5	3	146	1937
14088	4.5	3	149	1937
14089	0.8	3	152	1937
14090	1	3	154	1937
14091	0.25	3	155	1937
14092	210	3	119	1938
14093	90	3	135	1938
14094	5.8	3	137	1938
14095	2.5	3	146	1938
14096	4.5	3	149	1938
14097	0.8	3	152	1938
14098	1	3	154	1938
14099	0.25	3	155	1938
14110	180	3	135	1940
14113	4.5	3	149	1940
14116	0.25	3	155	1940
14119	10	1	136	1941
14122	0.1	1	155	1941
14125	1.3	1	160	1941
14138	3.5	1	139	1943
14141	0.004	1	157	1943
14144	20	1	162	1943
14154	75	1	119	1945
14155	10	1	136	1945
14156	3.5	1	139	1945
14157	0.22	1	146	1945
14158	0.1	1	155	1945
14159	0.004	1	157	1945
14160	0.3	1	159	1945
14161	1.3	1	160	1945
14162	15	1	162	1945
14165	3.5	1	139	1946
14168	0.04	1	157	1946
14171	15	1	162	1946
14181	75	1	119	1948
14182	10	1	136	1948
14183	3.5	1	139	1948
14184	0.22	1	146	1948
14185	0.1	1	155	1948
14186	0.004	1	157	1948
14187	0.5	1	159	1948
14188	1.8	1	160	1948
14189	15	1	162	1948
14190	75	1	119	1949
14193	0.22	1	146	1949
14196	0.5	1	159	1949
14199	75	1	119	1950
14202	0.22	1	146	1950
14205	0.3	1	159	1950
14219	3.5	1	139	1952
14222	0.004	1	157	1952
14225	30	1	162	1952
14226	75	1	119	1953
14229	0.22	1	146	1953
14232	0.5	1	159	1953
14234	75	1	119	1954
14237	0.22	1	146	1954
14240	0.5	1	159	1954
14245	3.5	1	139	1955
14248	0.04	1	157	1955
14251	30	1	162	1955
14270	75	1	119	1958
14271	3	1	136	1958
14272	3.5	1	137	1958
14273	0.22	1	146	1958
14274	0.1	1	155	1958
14275	0.004	1	157	1958
14276	0.5	1	159	1958
14277	1.8	1	160	1958
14278	20	1	162	1958
14279	75	1	119	1959
14280	10	1	136	1959
14281	3.5	1	137	1959
14282	0.22	1	146	1959
14283	0.1	1	155	1959
14284	0.004	1	157	1959
14285	0.5	1	159	1959
14286	1.8	1	160	1959
14287	15	1	162	1959
14288	75	1	119	1960
14289	1	1	136	1960
14290	3.5	1	138	1960
14291	0.22	1	146	1960
14292	0.1	1	155	1960
14293	0.004	1	157	1960
14294	0.5	1	159	1960
14295	1.8	1	160	1960
14296	75	2	119	1961
14299	1.2	2	147	1961
14302	1.8	2	160	1961
14309	0.5	2	159	1962
14314	3.8	1	137	1963
14317	0.25	1	155	1963
14318	245	1	119	1964
14321	0.5	1	146	1964
14324	0.008	1	157	1964
14333	55	1	134	1966
14336	0.6	1	152	1966
14340	75	5	135	1967
14343	4	5	149	1967
14346	0.25	5	155	1967
14362	180	3	135	1970
14365	1	3	149	1970
14368	0.25	3	155	1970
14371	180	3	135	1971
14374	1	3	149	1971
14377	0.25	3	155	1971
14381	3.8	1	137	1972
14384	0.12	1	155	1972
14388	5	1	137	1973
14391	0.12	1	155	1973
14395	2.3	8	137	1974
14399	40	5	134	1975
14400	2.5	5	137	1975
14401	0.7	5	146	1975
14402	3	5	149	1975
14403	0.3	5	152	1975
14404	0.05	5	155	1975
14405	60	9	119	1976
14408	0.7	9	146	1976
14411	0.05	9	155	1976
14413	25	7	134	1977
14416	1.5	7	149	1977
14420	20	1	134	1978
14423	0.2	1	152	1978
14460	50	9	119	1984
14100	210	3	119	1939
14102	6	3	137	1939
14104	4.5	3	149	1939
14106	1	3	154	1939
14108	30	3	162	1939
14145	75	1	119	1944
14147	3.5	1	139	1944
14149	0.1	1	155	1944
14151	0.3	1	159	1944
14153	15	1	162	1944
14252	75	1	119	1956
14254	3	1	137	1956
14256	0.1	1	155	1956
14258	0.5	1	159	1956
14260	30	1	162	1956
14261	75	1	119	1957
14263	3.5	1	139	1957
14265	0.1	1	155	1957
14267	0.3	1	159	1957
14269	30	1	162	1957
14347	245	1	119	1968
14349	3.8	1	137	1968
14351	0.5	1	152	1968
14353	0.008	1	157	1968
14355	55	1	134	1969
14357	0.5	1	146	1969
14359	0.12	1	155	1969
14440	15	521	134	1981
14442	1	521	146	1981
14444	0.07	521	155	1981
14101	180	3	135	1939
14103	2.5	3	146	1939
14105	0.8	3	152	1939
14107	0.25	3	155	1939
14146	10	1	136	1944
14148	0.22	1	146	1944
14150	0.004	1	157	1944
14152	1.3	1	160	1944
14253	3	1	136	1956
14255	0.22	1	146	1956
14257	0.004	1	157	1956
14259	1.8	1	160	1956
14262	10	1	136	1957
14264	0.22	1	146	1957
14266	0.04	1	157	1957
14268	1.3	1	160	1957
14348	55	1	134	1968
14350	0.5	1	146	1968
14352	0.12	1	155	1968
14354	245	1	119	1969
14356	5	1	137	1969
14358	0.6	1	152	1969
14360	0.008	1	157	1969
14439	90	521	119	1981
14441	2.4	521	137	1981
14443	3	521	149	1981
14128	180	3	135	1942
14131	4.5	3	149	1942
14134	0.25	3	155	1942
14172	75	1	119	1947
14175	0.22	1	146	1947
14178	0.3	1	159	1947
14209	10	1	136	1951
14212	0.1	1	155	1951
14215	1.3	1	160	1951
14326	55	1	134	1965
14329	0.5	1	152	1965
14452	50	9	119	1983
14455	0.7	9	146	1983
14458	0.2	9	154	1983
14129	6	3	137	1942
14132	0.8	3	152	1942
14135	30	3	162	1942
14173	10	1	136	1947
14176	0.1	1	155	1947
14179	1.3	1	160	1947
14210	3.5	1	139	1951
14213	0.004	1	157	1951
14216	30	1	162	1951
14325	245	1	119	1965
14328	0.5	1	146	1965
14331	0.008	1	157	1965
14454	2.4	9	137	1983
14457	0.2	9	152	1983
14426	60	8	119	1979
14429	0.2	8	146	1979
14432	0.05	8	155	1979
14435	2.4	521	137	1980
14438	0.07	521	155	1980
14445	65	9	119	1982
14448	0.1	9	146	1982
14451	0.05	9	157	1982
14470	2	9	137	1985
14473	0.2	9	152	1985
14477	50	9	135	1986
14480	2	9	149	1986
14483	0.05	9	155	1986
14461	50	9	135	1984
14463	0.7	9	146	1984
14465	0.2	9	152	1984
14467	0.05	9	155	1984
14484	245	1	119	1987
14486	3.9	1	137	1987
14488	0.5	1	152	1987
14490	0.008	1	157	1987
14462	2.2	9	137	1984
14464	2	9	149	1984
14466	0.2	9	154	1984
14485	55	1	134	1987
14487	0.5	1	146	1987
14489	0.12	1	155	1987
14491	10	1	162	1987
14492	245	1	119	1988
14493	55	1	134	1988
14494	3.8	1	137	1988
14495	0.5	1	146	1988
14496	0.5	1	152	1988
14497	0.12	1	155	1988
14498	0.008	1	157	1988
14499	10	1	162	1988
14500	225	5	119	1989
14501	75	5	135	1989
14502	6	5	137	1989
14503	0.5	5	146	1989
14504	0.8	5	152	1989
14505	0.7	5	154	1989
14506	0.12	5	155	1989
14507	0.01	5	157	1989
14508	225	5	119	1990
14509	75	5	135	1990
14510	5.8	5	137	1990
14511	0.5	5	146	1990
14512	0.8	5	152	1990
14513	0.5	5	154	1990
14514	0.12	5	155	1990
14515	0.01	5	157	1990
14516	245	1	119	1991
14517	55	1	134	1991
14518	4.8	1	137	1991
14519	0.5	1	146	1991
14520	0.5	1	152	1991
14521	0.12	1	155	1991
14522	0.008	1	157	1991
14523	10	1	162	1991
14524	245	1	119	1992
14525	55	1	134	1992
14526	4.6	1	137	1992
14527	0.5	1	146	1992
14528	0.5	1	152	1992
14529	0.12	1	155	1992
14530	0.008	1	157	1992
14531	10	1	162	1992
14532	245	1	119	1993
14533	55	1	134	1993
14534	3.8	1	137	1993
14535	0.5	1	146	1993
14536	0.5	1	152	1993
14537	0.12	1	155	1993
14538	0.008	1	157	1993
14539	6	1	162	1993
14540	225	5	119	1994
14541	75	5	135	1994
14542	5.8	5	137	1994
14543	0.5	5	146	1994
14544	0.8	5	152	1994
14545	0.5	5	154	1994
14546	0.12	5	155	1994
14547	0.01	5	157	1994
14548	245	1	119	1995
14549	55	1	134	1995
14550	4.6	1	137	1995
14551	0.5	1	146	1995
14552	0.5	1	152	1995
14553	0.12	1	155	1995
14554	0.008	1	157	1995
14555	6	1	162	1995
14556	245	1	119	1996
14557	55	1	134	1996
14558	3.8	1	137	1996
14559	0.5	1	146	1996
14560	0.5	1	152	1996
14561	0.12	1	155	1996
14562	0.008	1	157	1996
14563	6	1	162	1996
14564	225	5	119	1997
14565	75	5	135	1997
14566	5.8	5	137	1997
14567	0.5	5	146	1997
14568	0.8	5	152	1997
14569	0.5	5	154	1997
14570	0.12	5	155	1997
14571	0.01	5	157	1997
14572	245	1	119	1998
14573	55	1	134	1998
14574	4.6	1	137	1998
14575	0.5	1	146	1998
14576	0.5	1	152	1998
14577	0.12	1	155	1998
14578	0.008	1	157	1998
14579	6	1	162	1998
14580	245	1	119	1999
14581	55	1	134	1999
14582	3.8	1	137	1999
14583	0.5	1	146	1999
14584	0.5	1	152	1999
14585	0.12	1	155	1999
14586	0.008	1	157	1999
14587	6	1	162	1999
14588	225	5	119	2000
14589	75	5	135	2000
14590	5.8	5	137	2000
14591	0.5	5	146	2000
14592	4.5	5	149	2000
14593	0.8	5	152	2000
14594	0.5	5	154	2000
14595	0.12	5	155	2000
14596	0.01	5	157	2000
14597	245	1	119	2001
14598	55	1	134	2001
14599	4.6	1	137	2001
14600	0.5	1	146	2001
14601	0.5	1	152	2001
14602	0.12	1	155	2001
14603	0.008	1	157	2001
14604	6	1	162	2001
14605	245	1	119	2002
14606	55	1	134	2002
14607	3.8	1	137	2002
14608	0.5	1	146	2002
14609	0.5	1	152	2002
14610	0.12	1	155	2002
14611	0.008	1	157	2002
14612	6	1	162	2002
14613	225	5	119	2003
14614	75	5	135	2003
14615	5.8	5	137	2003
14616	0.5	5	146	2003
14617	4.5	5	149	2003
14618	0.8	5	152	2003
14619	0.5	5	154	2003
14620	0.12	5	155	2003
14621	0.01	5	157	2003
14646	245	1	119	2007
14648	3.8	1	137	2007
14650	0.5	1	152	2007
14652	0.008	1	157	2007
14688	55	1	134	2012
14690	0.5	1	146	2012
14692	0.12	1	155	2012
14694	6	1	162	2012
14622	245	1	119	2004
14625	0.5	1	146	2004
14628	0.008	1	157	2004
14640	4.8	1	137	2006
14643	0.12	1	155	2006
14655	55	1	134	2008
14658	0.6	1	152	2008
14661	6	1	162	2008
14662	120	3	119	2009
14665	2.5	3	146	2009
14668	1	3	154	2009
14679	245	1	119	2011
14682	0.5	1	146	2011
14685	0.008	1	157	2011
14704	80	1	119	2014
14707	0.2	1	146	2014
14710	0.003	1	157	2014
14719	40	9	134	2016
14722	3	9	149	2016
14726	40	9	134	2017
14729	3	9	149	2017
14740	40	9	134	2019
14743	3	9	149	2019
14623	55	1	134	2004
14626	0.5	1	152	2004
14629	6	1	162	2004
14638	245	1	119	2006
14641	0.5	1	146	2006
14644	0.008	1	157	2006
14656	5.4	1	137	2008
14659	0.12	1	155	2008
14663	180	3	135	2009
14666	4.5	3	149	2009
14669	0.25	3	155	2009
14680	55	1	134	2011
14683	0.6	1	152	2011
14686	6	1	162	2011
14705	20	1	134	2014
14708	0.2	1	152	2014
14720	2.2	9	137	2016
14723	0.2	9	152	2016
14725	60	9	119	2017
14728	0.7	9	146	2017
14731	0.05	9	155	2017
14739	60	9	119	2019
14742	0.7	9	146	2019
14745	0.05	9	155	2019
14624	4.6	1	137	2004
14627	0.12	1	155	2004
14639	55	1	134	2006
14642	0.6	1	152	2006
14645	6	1	162	2006
14654	245	1	119	2008
14657	0.5	1	146	2008
14660	0.008	1	157	2008
14664	5.2	3	137	2009
14667	1	3	152	2009
14670	40	3	162	2009
14681	3.8	1	137	2011
14684	0.12	1	155	2011
14706	2.2	1	137	2014
14709	0.04	1	155	2014
14718	60	9	119	2016
14721	0.7	9	146	2016
14724	0.05	9	155	2016
14727	2.2	9	137	2017
14730	0.2	9	152	2017
14741	2.2	9	137	2019
14744	0.2	9	152	2019
14630	245	1	119	2005
14633	0.5	1	146	2005
14636	0.008	1	157	2005
14673	3.8	1	137	2010
14676	0.12	1	155	2010
14695	120	3	119	2013
14698	2.5	3	146	2013
14701	1	3	154	2013
14732	60	9	119	2018
14735	0.7	9	146	2018
14738	0.05	9	155	2018
14631	55	1	134	2005
14634	0.6	1	152	2005
14637	6	1	162	2005
14671	245	1	119	2010
14674	0.5	1	146	2010
14677	0.008	1	157	2010
14696	180	3	135	2013
14699	4.5	3	149	2013
14702	0.25	3	155	2013
14733	40	9	134	2018
14736	3	9	149	2018
14632	5.5	1	137	2005
14635	0.12	1	155	2005
14672	55	1	134	2010
14675	0.5	1	152	2010
14678	6	1	162	2010
14697	5.5	3	137	2013
14700	1	3	152	2013
14703	40	3	162	2013
14734	2.2	9	137	2018
14737	0.2	9	152	2018
14647	55	1	134	2007
14649	0.5	1	146	2007
14651	0.12	1	155	2007
14653	6	1	162	2007
14687	245	1	119	2012
14689	4.6	1	137	2012
14691	0.6	1	152	2012
14693	0.008	1	157	2012
14711	60	9	119	2015
14713	2.2	9	137	2015
14715	3	9	149	2015
14717	0.05	9	155	2015
14712	40	9	134	2015
14714	0.7	9	146	2015
14716	0.2	9	152	2015
\.


--
-- Data for Name: stops; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.stops (id, stop_reason) FROM stdin;
2	گیرکردن بالابرها
3	عمل نکردن جک ها
4	خرابی برنامه PLC
5	پارگی برزنت ها
6	سوختن موتورها
7	خرابی گیربکس ها
8	سوختن مواد میکس شده
9	نبودن نیرو
10	تعطیلی
11	برق رفتگی
12	نبودن مواد اولیه
13	عدم درخواست میکس
14	نظافت
1	عدم توقف
15	نبودن لیفتراک
16	زیر تست بودن خطوط لوله
17	نبودن باد و خرابی پمپ باد
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, username, hashed_pass, role) FROM stdin;
4	admin	$2b$12$j5F3JKZ.QD/T9ATrGxmk4uS2u.vM4oO4YpvAvmWBRYMtAOrlkEYCe	admin
11	rasooli	$2b$12$sFS4wT69djc87u6kijqPmufMoBNTVyAf9Xmk9pKgxqTLQ4ydU0s5y	admin
15	Amir Hosen	$2b$12$OxKtB/q9wmMgqE.l/9H1j.VfzDEaWDikT6uCzCID4QHxpwKvThRyW	admin
16	Ebi	$2b$12$4aRYyF2SjL4b1mYefiaW3eQ.9RH3FUsZ7qIuf7kWJPiuaW6zPYD7C	viewer
17	mr etehadi	$2b$12$FHhjbMrZSnPvlnil5VEzmODKXxu/AXJB40/EGSq0slrA.91Alt92q	admin
12	bayat	$2b$12$PrK0ZgpA4wsNX/iVNd0S7etiA17kEA/FJbDRbm6FaFv7zQCJRgySy	admin
\.


--
-- Name: allproducts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.allproducts_id_seq', 1, false);


--
-- Name: allproducts_id_seq1; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.allproducts_id_seq1', 4037, true);


--
-- Name: id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.id_seq', 521, true);


--
-- Name: id_siq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.id_siq', 519, true);


--
-- Name: id_sss; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.id_sss', 1, false);


--
-- Name: machines_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.machines_id_seq', 23, true);


--
-- Name: materials_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.materials_id_seq', 527, true);


--
-- Name: mixentries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.mixentries_id_seq', 2347, true);


--
-- Name: operators_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.operators_id_seq', 45, true);


--
-- Name: rawmaterials_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.rawmaterials_id_seq', 164, true);


--
-- Name: recipes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.recipes_id_seq', 17170, true);


--
-- Name: stops_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.stops_id_seq', 17, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 17, true);


--
-- Name: allproducts allproducts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.allproducts
    ADD CONSTRAINT allproducts_pkey PRIMARY KEY (code);


--
-- Name: fittingproduct fittingproduct_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fittingproduct
    ADD CONSTRAINT fittingproduct_pkey PRIMARY KEY (id);


--
-- Name: machines machines_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.machines
    ADD CONSTRAINT machines_pkey PRIMARY KEY (id);


--
-- Name: materials materials_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materials
    ADD CONSTRAINT materials_pkey PRIMARY KEY (id);


--
-- Name: mixentries mixentries_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mixentries
    ADD CONSTRAINT mixentries_pkey PRIMARY KEY (id);


--
-- Name: operators operators_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.operators
    ADD CONSTRAINT operators_pkey PRIMARY KEY (id);


--
-- Name: pipeproduct pipeproduct_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pipeproduct
    ADD CONSTRAINT pipeproduct_pkey PRIMARY KEY (id);


--
-- Name: rawmaterials rawmaterials_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rawmaterials
    ADD CONSTRAINT rawmaterials_pkey PRIMARY KEY (id);


--
-- Name: recipes recipes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recipes
    ADD CONSTRAINT recipes_pkey PRIMARY KEY (id);


--
-- Name: stops stops_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stops
    ADD CONSTRAINT stops_pkey PRIMARY KEY (id);


--
-- Name: pipeproduct unique_code; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pipeproduct
    ADD CONSTRAINT unique_code UNIQUE (code);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: fki_mixentries_line_id_fkey; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_mixentries_line_id_fkey ON public.mixentries USING btree (line_id);


--
-- Name: fki_mixentries_operator_id_fkey; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_mixentries_operator_id_fkey ON public.mixentries USING btree (operator_id);


--
-- Name: fki_mixentries_product_id_fkey; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_mixentries_product_id_fkey ON public.mixentries USING btree (product_id);


--
-- Name: fki_recipes_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_recipes_fk ON public.mixentries USING btree (recipe_code);


--
-- Name: fki_recipes_fkey; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_recipes_fkey ON public.mixentries USING btree (recipe_code);


--
-- Name: fki_recipes_material_id_fkey; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_recipes_material_id_fkey ON public.recipes USING btree (material_id);


--
-- Name: fki_recipes_rawmaterial_id_fkey; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_recipes_rawmaterial_id_fkey ON public.recipes USING btree (rawmaterial_id);


--
-- Name: ix_allproducts_code; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_allproducts_code ON public.allproducts USING btree (code);


--
-- Name: ix_fittingproduct_code; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_fittingproduct_code ON public.fittingproduct USING btree (code);


--
-- Name: ix_fittingproduct_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_fittingproduct_id ON public.fittingproduct USING btree (id);


--
-- Name: ix_machines_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_machines_id ON public.machines USING btree (id);


--
-- Name: ix_materials_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_materials_id ON public.materials USING btree (id);


--
-- Name: ix_mixentries_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_mixentries_id ON public.mixentries USING btree (id);


--
-- Name: ix_operators_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_operators_id ON public.operators USING btree (id);


--
-- Name: ix_pipeproduct_code; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_pipeproduct_code ON public.pipeproduct USING btree (code);


--
-- Name: ix_pipeproduct_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_pipeproduct_id ON public.pipeproduct USING btree (id);


--
-- Name: ix_rawmaterials_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_rawmaterials_id ON public.rawmaterials USING btree (id);


--
-- Name: ix_recipes_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_recipes_id ON public.recipes USING btree (id);


--
-- Name: ix_users_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_users_id ON public.users USING btree (id);


--
-- Name: ix_users_username; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX ix_users_username ON public.users USING btree (username);


--
-- Name: mixentries fk_stop; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mixentries
    ADD CONSTRAINT fk_stop FOREIGN KEY (stop_id) REFERENCES public.stops(id);


--
-- Name: mixentries mixentries_line_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mixentries
    ADD CONSTRAINT mixentries_line_id_fkey FOREIGN KEY (line_id) REFERENCES public.machines(id) ON DELETE SET NULL NOT VALID;


--
-- Name: mixentries mixentries_operator_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mixentries
    ADD CONSTRAINT mixentries_operator_id_fkey FOREIGN KEY (operator_id) REFERENCES public.operators(id) ON DELETE SET NULL NOT VALID;


--
-- Name: mixentries mixentries_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mixentries
    ADD CONSTRAINT mixentries_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.allproducts(code) ON DELETE SET NULL NOT VALID;


--
-- Name: mixentries recipes_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mixentries
    ADD CONSTRAINT recipes_fkey FOREIGN KEY (recipe_code) REFERENCES public.materials(id) ON DELETE SET NULL NOT VALID;


--
-- Name: recipes recipes_material_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recipes
    ADD CONSTRAINT recipes_material_id_fkey FOREIGN KEY (material_id) REFERENCES public.materials(id) ON DELETE SET NULL NOT VALID;


--
-- Name: recipes recipes_mixentries_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recipes
    ADD CONSTRAINT recipes_mixentries_id_fkey FOREIGN KEY (mixentries_id) REFERENCES public.mixentries(id) ON DELETE CASCADE;


--
-- Name: recipes recipes_rawmaterial_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recipes
    ADD CONSTRAINT recipes_rawmaterial_id_fkey FOREIGN KEY (rawmaterial_id) REFERENCES public.rawmaterials(id) ON DELETE SET NULL NOT VALID;


--
-- PostgreSQL database dump complete
--

