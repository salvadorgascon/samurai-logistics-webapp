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
-- Name: btree_gin; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS btree_gin WITH SCHEMA public;


--
-- Name: EXTENSION btree_gin; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION btree_gin IS 'support for indexing common datatypes in GIN';


--
-- Name: btree_gist; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS btree_gist WITH SCHEMA public;


--
-- Name: EXTENSION btree_gist; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION btree_gist IS 'support for indexing common datatypes in GiST';


--
-- Name: fuzzystrmatch; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS fuzzystrmatch WITH SCHEMA public;


--
-- Name: EXTENSION fuzzystrmatch; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION fuzzystrmatch IS 'determine similarities and distance between strings';


--
-- Name: hstore; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS hstore WITH SCHEMA public;


--
-- Name: EXTENSION hstore; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION hstore IS 'data type for storing sets of (key, value) pairs';


--
-- Name: pg_trgm; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_trgm WITH SCHEMA public;


--
-- Name: EXTENSION pg_trgm; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION pg_trgm IS 'text similarity measurement and index searching based on trigrams';


--
-- Name: pgcrypto; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA public;


--
-- Name: EXTENSION pgcrypto; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';


--
-- Name: postgis; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;


--
-- Name: EXTENSION postgis; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION postgis IS 'PostGIS geometry and geography spatial types and functions';


--
-- Name: unaccent; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS unaccent WITH SCHEMA public;


--
-- Name: EXTENSION unaccent; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION unaccent IS 'text search dictionary that removes accents';


--
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: active_storage_attachments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.active_storage_attachments (
    id bigint NOT NULL,
    name character varying NOT NULL,
    record_type character varying NOT NULL,
    record_id bigint NOT NULL,
    blob_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL
);


--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.active_storage_attachments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.active_storage_attachments_id_seq OWNED BY public.active_storage_attachments.id;


--
-- Name: active_storage_blobs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.active_storage_blobs (
    id bigint NOT NULL,
    key character varying NOT NULL,
    filename character varying NOT NULL,
    content_type character varying,
    metadata text,
    service_name character varying NOT NULL,
    byte_size bigint NOT NULL,
    checksum character varying,
    created_at timestamp(6) without time zone NOT NULL
);


--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.active_storage_blobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.active_storage_blobs_id_seq OWNED BY public.active_storage_blobs.id;


--
-- Name: active_storage_variant_records; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.active_storage_variant_records (
    id bigint NOT NULL,
    blob_id bigint NOT NULL,
    variation_digest character varying NOT NULL
);


--
-- Name: active_storage_variant_records_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.active_storage_variant_records_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: active_storage_variant_records_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.active_storage_variant_records_id_seq OWNED BY public.active_storage_variant_records.id;


--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: brands; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.brands (
    id bigint NOT NULL,
    uid uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    code character varying(50) NOT NULL,
    name character varying NOT NULL,
    state character varying NOT NULL,
    state_at timestamp(6) without time zone NOT NULL,
    state_notes text,
    states jsonb[],
    notes text,
    tags character varying[],
    search_text tsvector,
    created_by_id integer NOT NULL,
    updated_by_id integer NOT NULL,
    lock_version integer DEFAULT 0,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: brands_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.brands_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: brands_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.brands_id_seq OWNED BY public.brands.id;


--
-- Name: colors; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.colors (
    id bigint NOT NULL,
    uid uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    name character varying NOT NULL,
    created_by_id integer NOT NULL,
    updated_by_id integer NOT NULL,
    lock_version integer DEFAULT 0,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: colors_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.colors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: colors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.colors_id_seq OWNED BY public.colors.id;


--
-- Name: companies; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.companies (
    id bigint NOT NULL,
    uid uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    code character varying(50) NOT NULL,
    name character varying NOT NULL,
    vat_number character varying,
    ein_number character varying,
    tin_number character varying,
    state character varying NOT NULL,
    state_at timestamp(6) without time zone NOT NULL,
    state_notes text,
    states jsonb[],
    notes text,
    tags character varying[],
    search_text tsvector,
    created_by_id integer NOT NULL,
    updated_by_id integer NOT NULL,
    lock_version integer DEFAULT 0,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: companies_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.companies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: companies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.companies_id_seq OWNED BY public.companies.id;


--
-- Name: cost_centers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cost_centers (
    id bigint NOT NULL,
    uid uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    code character varying(50) NOT NULL,
    name character varying NOT NULL,
    tags character varying[],
    search_text tsvector,
    created_by_id integer NOT NULL,
    updated_by_id integer NOT NULL,
    lock_version integer DEFAULT 0,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: cost_centers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cost_centers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cost_centers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cost_centers_id_seq OWNED BY public.cost_centers.id;


--
-- Name: countries; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.countries (
    id bigint NOT NULL,
    uid uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    name_en character varying NOT NULL,
    name_es character varying NOT NULL,
    iso_code_3166_1 character varying NOT NULL,
    lock_version integer DEFAULT 0,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: countries_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.countries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: countries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.countries_id_seq OWNED BY public.countries.id;


--
-- Name: currencies; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.currencies (
    id bigint NOT NULL,
    uid uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    name_en character varying NOT NULL,
    name_es character varying NOT NULL,
    iso_code_4217 character varying(3) NOT NULL,
    symbol character varying(3),
    num_decimals integer DEFAULT 2,
    lock_version integer DEFAULT 0,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: currencies_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.currencies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: currencies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.currencies_id_seq OWNED BY public.currencies.id;


--
-- Name: customers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.customers (
    id bigint NOT NULL,
    uid uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    code character varying(50) NOT NULL,
    name character varying NOT NULL,
    vat_number character varying,
    ein_number character varying,
    tin_number character varying,
    state character varying NOT NULL,
    state_at timestamp(6) without time zone NOT NULL,
    state_notes text,
    states jsonb[],
    notes text,
    tags character varying[],
    search_text tsvector,
    created_by_id integer NOT NULL,
    updated_by_id integer NOT NULL,
    lock_version integer DEFAULT 0,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: customers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.customers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: customers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.customers_id_seq OWNED BY public.customers.id;


--
-- Name: languages; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.languages (
    id bigint NOT NULL,
    uid uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    iso_code_639_1 character varying NOT NULL,
    locale character varying NOT NULL,
    name_en character varying NOT NULL,
    name_es character varying NOT NULL,
    lock_version integer DEFAULT 0,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: languages_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.languages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: languages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.languages_id_seq OWNED BY public.languages.id;


--
-- Name: products; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.products (
    id bigint NOT NULL,
    uid uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    code character varying(50) NOT NULL,
    barcode_type character varying,
    barcode character varying(50),
    name character varying NOT NULL,
    short_description text,
    long_description text,
    brand_id bigint,
    unit_measure character varying NOT NULL,
    is_assembled boolean DEFAULT false,
    is_component boolean DEFAULT false,
    state character varying NOT NULL,
    state_at timestamp(6) without time zone NOT NULL,
    state_notes text,
    states jsonb[],
    tags character varying[],
    notes text,
    search_text tsvector,
    created_by_id integer NOT NULL,
    updated_by_id integer NOT NULL,
    lock_version integer DEFAULT 0,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;


--
-- Name: sales_people; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sales_people (
    id bigint NOT NULL,
    uid uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    first_name character varying,
    last_name character varying,
    full_name character varying,
    id_number character varying,
    ssn_number character varying,
    email character varying,
    phone character varying,
    fax character varying,
    mobile character varying,
    direct_phone character varying,
    state character varying NOT NULL,
    state_at timestamp(6) without time zone NOT NULL,
    state_notes text,
    states jsonb[],
    notes text,
    tags character varying[],
    search_text tsvector,
    created_by_id integer NOT NULL,
    updated_by_id integer NOT NULL,
    lock_version integer DEFAULT 0,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: sales_people_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sales_people_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sales_people_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sales_people_id_seq OWNED BY public.sales_people.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


--
-- Name: suppliers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.suppliers (
    id bigint NOT NULL,
    uid uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    code character varying(50) NOT NULL,
    name character varying NOT NULL,
    vat_number character varying,
    ein_number character varying,
    tin_number character varying,
    state character varying NOT NULL,
    state_at timestamp(6) without time zone NOT NULL,
    state_notes text,
    states jsonb[],
    notes text,
    tags character varying[],
    search_text tsvector,
    created_by_id integer NOT NULL,
    updated_by_id integer NOT NULL,
    lock_version integer DEFAULT 0,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: suppliers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.suppliers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: suppliers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.suppliers_id_seq OWNED BY public.suppliers.id;


--
-- Name: taxes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.taxes (
    id bigint NOT NULL,
    uid uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    code character varying(50) NOT NULL,
    name_en character varying NOT NULL,
    name_es character varying NOT NULL,
    rate numeric(10,4) NOT NULL,
    is_purchase_tax boolean DEFAULT false,
    is_sales_tax boolean DEFAULT false,
    tags character varying[],
    search_text tsvector,
    lock_version integer DEFAULT 0,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: taxes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.taxes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: taxes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.taxes_id_seq OWNED BY public.taxes.id;


--
-- Name: user_settings; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.user_settings (
    id bigint NOT NULL,
    uid uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    user_id bigint NOT NULL,
    lock_version integer DEFAULT 0,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: user_settings_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.user_settings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: user_settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.user_settings_id_seq OWNED BY public.user_settings.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    uid uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp(6) without time zone,
    remember_created_at timestamp(6) without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp(6) without time zone,
    last_sign_in_at timestamp(6) without time zone,
    current_sign_in_ip character varying,
    last_sign_in_ip character varying,
    confirmation_token character varying,
    confirmed_at timestamp(6) without time zone,
    confirmation_sent_at timestamp(6) without time zone,
    unconfirmed_email character varying,
    failed_attempts integer DEFAULT 0 NOT NULL,
    unlock_token character varying,
    locked_at timestamp(6) without time zone,
    provider character varying,
    uid_provider character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
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
-- Name: warehouses; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.warehouses (
    id bigint NOT NULL,
    uid uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    code character varying(50) NOT NULL,
    barcode_type character varying,
    barcode character varying(50),
    name character varying NOT NULL,
    supplier_id bigint,
    customer_id bigint,
    is_default boolean DEFAULT false,
    state character varying NOT NULL,
    state_at timestamp(6) without time zone NOT NULL,
    state_notes text,
    states jsonb[],
    notes text,
    tags character varying[],
    search_text tsvector,
    created_by_id integer NOT NULL,
    updated_by_id integer NOT NULL,
    lock_version integer DEFAULT 0,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: warehouses_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.warehouses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: warehouses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.warehouses_id_seq OWNED BY public.warehouses.id;


--
-- Name: active_storage_attachments id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_attachments ALTER COLUMN id SET DEFAULT nextval('public.active_storage_attachments_id_seq'::regclass);


--
-- Name: active_storage_blobs id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_blobs ALTER COLUMN id SET DEFAULT nextval('public.active_storage_blobs_id_seq'::regclass);


--
-- Name: active_storage_variant_records id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_variant_records ALTER COLUMN id SET DEFAULT nextval('public.active_storage_variant_records_id_seq'::regclass);


--
-- Name: brands id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.brands ALTER COLUMN id SET DEFAULT nextval('public.brands_id_seq'::regclass);


--
-- Name: colors id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.colors ALTER COLUMN id SET DEFAULT nextval('public.colors_id_seq'::regclass);


--
-- Name: companies id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.companies ALTER COLUMN id SET DEFAULT nextval('public.companies_id_seq'::regclass);


--
-- Name: cost_centers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cost_centers ALTER COLUMN id SET DEFAULT nextval('public.cost_centers_id_seq'::regclass);


--
-- Name: countries id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.countries ALTER COLUMN id SET DEFAULT nextval('public.countries_id_seq'::regclass);


--
-- Name: currencies id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.currencies ALTER COLUMN id SET DEFAULT nextval('public.currencies_id_seq'::regclass);


--
-- Name: customers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customers ALTER COLUMN id SET DEFAULT nextval('public.customers_id_seq'::regclass);


--
-- Name: languages id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.languages ALTER COLUMN id SET DEFAULT nextval('public.languages_id_seq'::regclass);


--
-- Name: products id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- Name: sales_people id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sales_people ALTER COLUMN id SET DEFAULT nextval('public.sales_people_id_seq'::regclass);


--
-- Name: suppliers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.suppliers ALTER COLUMN id SET DEFAULT nextval('public.suppliers_id_seq'::regclass);


--
-- Name: taxes id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.taxes ALTER COLUMN id SET DEFAULT nextval('public.taxes_id_seq'::regclass);


--
-- Name: user_settings id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_settings ALTER COLUMN id SET DEFAULT nextval('public.user_settings_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: warehouses id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.warehouses ALTER COLUMN id SET DEFAULT nextval('public.warehouses_id_seq'::regclass);


--
-- Name: active_storage_attachments active_storage_attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_attachments
    ADD CONSTRAINT active_storage_attachments_pkey PRIMARY KEY (id);


--
-- Name: active_storage_blobs active_storage_blobs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_blobs
    ADD CONSTRAINT active_storage_blobs_pkey PRIMARY KEY (id);


--
-- Name: active_storage_variant_records active_storage_variant_records_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_variant_records
    ADD CONSTRAINT active_storage_variant_records_pkey PRIMARY KEY (id);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: brands brands_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.brands
    ADD CONSTRAINT brands_pkey PRIMARY KEY (id);


--
-- Name: colors colors_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.colors
    ADD CONSTRAINT colors_pkey PRIMARY KEY (id);


--
-- Name: companies companies_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.companies
    ADD CONSTRAINT companies_pkey PRIMARY KEY (id);


--
-- Name: cost_centers cost_centers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cost_centers
    ADD CONSTRAINT cost_centers_pkey PRIMARY KEY (id);


--
-- Name: countries countries_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.countries
    ADD CONSTRAINT countries_pkey PRIMARY KEY (id);


--
-- Name: currencies currencies_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.currencies
    ADD CONSTRAINT currencies_pkey PRIMARY KEY (id);


--
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (id);


--
-- Name: languages languages_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.languages
    ADD CONSTRAINT languages_pkey PRIMARY KEY (id);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: sales_people sales_people_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sales_people
    ADD CONSTRAINT sales_people_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: suppliers suppliers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.suppliers
    ADD CONSTRAINT suppliers_pkey PRIMARY KEY (id);


--
-- Name: taxes taxes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.taxes
    ADD CONSTRAINT taxes_pkey PRIMARY KEY (id);


--
-- Name: user_settings user_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_settings
    ADD CONSTRAINT user_settings_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: warehouses warehouses_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.warehouses
    ADD CONSTRAINT warehouses_pkey PRIMARY KEY (id);


--
-- Name: index_active_storage_attachments_on_blob_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_active_storage_attachments_on_blob_id ON public.active_storage_attachments USING btree (blob_id);


--
-- Name: index_active_storage_attachments_uniqueness; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_active_storage_attachments_uniqueness ON public.active_storage_attachments USING btree (record_type, record_id, name, blob_id);


--
-- Name: index_active_storage_blobs_on_key; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_active_storage_blobs_on_key ON public.active_storage_blobs USING btree (key);


--
-- Name: index_active_storage_variant_records_uniqueness; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_active_storage_variant_records_uniqueness ON public.active_storage_variant_records USING btree (blob_id, variation_digest);


--
-- Name: index_brands_on_code; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_brands_on_code ON public.brands USING btree (code);


--
-- Name: index_brands_on_name; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_brands_on_name ON public.brands USING btree (name);


--
-- Name: index_brands_on_search_text; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_brands_on_search_text ON public.brands USING gin (search_text);


--
-- Name: index_brands_on_state; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_brands_on_state ON public.brands USING btree (state);


--
-- Name: index_brands_on_tags; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_brands_on_tags ON public.brands USING gin (tags);


--
-- Name: index_brands_on_uid; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_brands_on_uid ON public.brands USING btree (uid);


--
-- Name: index_colors_on_name; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_colors_on_name ON public.colors USING btree (name);


--
-- Name: index_colors_on_uid; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_colors_on_uid ON public.colors USING btree (uid);


--
-- Name: index_companies_on_code; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_companies_on_code ON public.companies USING btree (code);


--
-- Name: index_companies_on_ein_number; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_companies_on_ein_number ON public.companies USING btree (ein_number);


--
-- Name: index_companies_on_name; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_companies_on_name ON public.companies USING btree (name);


--
-- Name: index_companies_on_search_text; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_companies_on_search_text ON public.companies USING gin (search_text);


--
-- Name: index_companies_on_state; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_companies_on_state ON public.companies USING btree (state);


--
-- Name: index_companies_on_tags; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_companies_on_tags ON public.companies USING gin (tags);


--
-- Name: index_companies_on_tin_number; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_companies_on_tin_number ON public.companies USING btree (tin_number);


--
-- Name: index_companies_on_uid; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_companies_on_uid ON public.companies USING btree (uid);


--
-- Name: index_companies_on_vat_number; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_companies_on_vat_number ON public.companies USING btree (vat_number);


--
-- Name: index_cost_centers_on_code; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_cost_centers_on_code ON public.cost_centers USING btree (code);


--
-- Name: index_cost_centers_on_name; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_cost_centers_on_name ON public.cost_centers USING btree (name);


--
-- Name: index_cost_centers_on_search_text; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_cost_centers_on_search_text ON public.cost_centers USING gin (search_text);


--
-- Name: index_cost_centers_on_tags; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_cost_centers_on_tags ON public.cost_centers USING gin (tags);


--
-- Name: index_cost_centers_on_uid; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_cost_centers_on_uid ON public.cost_centers USING btree (uid);


--
-- Name: index_countries_on_iso_code_3166_1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_countries_on_iso_code_3166_1 ON public.countries USING btree (iso_code_3166_1);


--
-- Name: index_countries_on_name_en; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_countries_on_name_en ON public.countries USING btree (name_en);


--
-- Name: index_countries_on_name_es; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_countries_on_name_es ON public.countries USING btree (name_es);


--
-- Name: index_countries_on_uid; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_countries_on_uid ON public.countries USING btree (uid);


--
-- Name: index_currencies_on_iso_code_4217; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_currencies_on_iso_code_4217 ON public.currencies USING btree (iso_code_4217);


--
-- Name: index_currencies_on_name_en; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_currencies_on_name_en ON public.currencies USING btree (name_en);


--
-- Name: index_currencies_on_name_es; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_currencies_on_name_es ON public.currencies USING btree (name_es);


--
-- Name: index_currencies_on_uid; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_currencies_on_uid ON public.currencies USING btree (uid);


--
-- Name: index_customers_on_code; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_customers_on_code ON public.customers USING btree (code);


--
-- Name: index_customers_on_ein_number; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_customers_on_ein_number ON public.customers USING btree (ein_number);


--
-- Name: index_customers_on_name; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_customers_on_name ON public.customers USING btree (name);


--
-- Name: index_customers_on_search_text; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_customers_on_search_text ON public.customers USING gin (search_text);


--
-- Name: index_customers_on_state; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_customers_on_state ON public.customers USING btree (state);


--
-- Name: index_customers_on_tags; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_customers_on_tags ON public.customers USING gin (tags);


--
-- Name: index_customers_on_tin_number; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_customers_on_tin_number ON public.customers USING btree (tin_number);


--
-- Name: index_customers_on_uid; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_customers_on_uid ON public.customers USING btree (uid);


--
-- Name: index_customers_on_vat_number; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_customers_on_vat_number ON public.customers USING btree (vat_number);


--
-- Name: index_languages_on_iso_code_639_1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_languages_on_iso_code_639_1 ON public.languages USING btree (iso_code_639_1);


--
-- Name: index_languages_on_locale; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_languages_on_locale ON public.languages USING btree (locale);


--
-- Name: index_languages_on_name_en; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_languages_on_name_en ON public.languages USING btree (name_en);


--
-- Name: index_languages_on_name_es; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_languages_on_name_es ON public.languages USING btree (name_es);


--
-- Name: index_languages_on_uid; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_languages_on_uid ON public.languages USING btree (uid);


--
-- Name: index_products_on_barcode; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_products_on_barcode ON public.products USING btree (barcode);


--
-- Name: index_products_on_barcode_type; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_products_on_barcode_type ON public.products USING btree (barcode_type);


--
-- Name: index_products_on_brand_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_products_on_brand_id ON public.products USING btree (brand_id);


--
-- Name: index_products_on_code; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_products_on_code ON public.products USING btree (code);


--
-- Name: index_products_on_name; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_products_on_name ON public.products USING btree (name);


--
-- Name: index_products_on_search_text; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_products_on_search_text ON public.products USING gin (search_text);


--
-- Name: index_products_on_state; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_products_on_state ON public.products USING btree (state);


--
-- Name: index_products_on_tags; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_products_on_tags ON public.products USING gin (tags);


--
-- Name: index_products_on_uid; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_products_on_uid ON public.products USING btree (uid);


--
-- Name: index_products_on_unit_measure; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_products_on_unit_measure ON public.products USING btree (unit_measure);


--
-- Name: index_sales_people_on_email; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_sales_people_on_email ON public.sales_people USING btree (email);


--
-- Name: index_sales_people_on_fax; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_sales_people_on_fax ON public.sales_people USING btree (fax);


--
-- Name: index_sales_people_on_first_name; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_sales_people_on_first_name ON public.sales_people USING btree (first_name);


--
-- Name: index_sales_people_on_id_number; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_sales_people_on_id_number ON public.sales_people USING btree (id_number);


--
-- Name: index_sales_people_on_last_name; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_sales_people_on_last_name ON public.sales_people USING btree (last_name);


--
-- Name: index_sales_people_on_mobile; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_sales_people_on_mobile ON public.sales_people USING btree (mobile);


--
-- Name: index_sales_people_on_phone; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_sales_people_on_phone ON public.sales_people USING btree (phone);


--
-- Name: index_sales_people_on_search_text; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_sales_people_on_search_text ON public.sales_people USING gin (search_text);


--
-- Name: index_sales_people_on_ssn_number; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_sales_people_on_ssn_number ON public.sales_people USING btree (ssn_number);


--
-- Name: index_sales_people_on_state; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_sales_people_on_state ON public.sales_people USING btree (state);


--
-- Name: index_sales_people_on_tags; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_sales_people_on_tags ON public.sales_people USING gin (tags);


--
-- Name: index_sales_people_on_uid; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_sales_people_on_uid ON public.sales_people USING btree (uid);


--
-- Name: index_suppliers_on_code; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_suppliers_on_code ON public.suppliers USING btree (code);


--
-- Name: index_suppliers_on_ein_number; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_suppliers_on_ein_number ON public.suppliers USING btree (ein_number);


--
-- Name: index_suppliers_on_name; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_suppliers_on_name ON public.suppliers USING btree (name);


--
-- Name: index_suppliers_on_search_text; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_suppliers_on_search_text ON public.suppliers USING gin (search_text);


--
-- Name: index_suppliers_on_state; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_suppliers_on_state ON public.suppliers USING btree (state);


--
-- Name: index_suppliers_on_tags; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_suppliers_on_tags ON public.suppliers USING gin (tags);


--
-- Name: index_suppliers_on_tin_number; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_suppliers_on_tin_number ON public.suppliers USING btree (tin_number);


--
-- Name: index_suppliers_on_uid; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_suppliers_on_uid ON public.suppliers USING btree (uid);


--
-- Name: index_suppliers_on_vat_number; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_suppliers_on_vat_number ON public.suppliers USING btree (vat_number);


--
-- Name: index_taxes_on_code; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_taxes_on_code ON public.taxes USING btree (code);


--
-- Name: index_taxes_on_name_en; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_taxes_on_name_en ON public.taxes USING btree (name_en);


--
-- Name: index_taxes_on_name_es; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_taxes_on_name_es ON public.taxes USING btree (name_es);


--
-- Name: index_taxes_on_search_text; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_taxes_on_search_text ON public.taxes USING gin (search_text);


--
-- Name: index_taxes_on_tags; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_taxes_on_tags ON public.taxes USING gin (tags);


--
-- Name: index_taxes_on_uid; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_taxes_on_uid ON public.taxes USING btree (uid);


--
-- Name: index_user_settings_on_uid; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_user_settings_on_uid ON public.user_settings USING btree (uid);


--
-- Name: index_user_settings_on_user; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_user_settings_on_user ON public.user_settings USING btree (user_id);


--
-- Name: index_user_settings_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_user_settings_on_user_id ON public.user_settings USING btree (user_id);


--
-- Name: index_users_on_confirmation_token; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_confirmation_token ON public.users USING btree (confirmation_token);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_email ON public.users USING btree (email);


--
-- Name: index_users_on_provider_and_uid_provider; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_provider_and_uid_provider ON public.users USING btree (provider, uid_provider);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON public.users USING btree (reset_password_token);


--
-- Name: index_users_on_uid; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_uid ON public.users USING btree (uid);


--
-- Name: index_users_on_unlock_token; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_unlock_token ON public.users USING btree (unlock_token);


--
-- Name: index_warehouses_on_barcode; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_warehouses_on_barcode ON public.warehouses USING btree (barcode);


--
-- Name: index_warehouses_on_barcode_type; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_warehouses_on_barcode_type ON public.warehouses USING btree (barcode_type);


--
-- Name: index_warehouses_on_code; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_warehouses_on_code ON public.warehouses USING btree (code);


--
-- Name: index_warehouses_on_customer_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_warehouses_on_customer_id ON public.warehouses USING btree (customer_id);


--
-- Name: index_warehouses_on_name; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_warehouses_on_name ON public.warehouses USING btree (name);


--
-- Name: index_warehouses_on_search_text; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_warehouses_on_search_text ON public.warehouses USING gin (search_text);


--
-- Name: index_warehouses_on_state; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_warehouses_on_state ON public.warehouses USING btree (state);


--
-- Name: index_warehouses_on_supplier_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_warehouses_on_supplier_id ON public.warehouses USING btree (supplier_id);


--
-- Name: index_warehouses_on_tags; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_warehouses_on_tags ON public.warehouses USING gin (tags);


--
-- Name: index_warehouses_on_uid; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_warehouses_on_uid ON public.warehouses USING btree (uid);


--
-- Name: customers fk_rails_0925b24147; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT fk_rails_0925b24147 FOREIGN KEY (created_by_id) REFERENCES public.users(id);


--
-- Name: suppliers fk_rails_1857f5e757; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.suppliers
    ADD CONSTRAINT fk_rails_1857f5e757 FOREIGN KEY (updated_by_id) REFERENCES public.users(id);


--
-- Name: suppliers fk_rails_2afd5b952e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.suppliers
    ADD CONSTRAINT fk_rails_2afd5b952e FOREIGN KEY (created_by_id) REFERENCES public.users(id);


--
-- Name: products fk_rails_2e9b78a2e7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT fk_rails_2e9b78a2e7 FOREIGN KEY (updated_by_id) REFERENCES public.users(id);


--
-- Name: cost_centers fk_rails_40f7023c4c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cost_centers
    ADD CONSTRAINT fk_rails_40f7023c4c FOREIGN KEY (updated_by_id) REFERENCES public.users(id);


--
-- Name: companies fk_rails_475d09990e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.companies
    ADD CONSTRAINT fk_rails_475d09990e FOREIGN KEY (created_by_id) REFERENCES public.users(id);


--
-- Name: colors fk_rails_47e8b016b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.colors
    ADD CONSTRAINT fk_rails_47e8b016b1 FOREIGN KEY (created_by_id) REFERENCES public.users(id);


--
-- Name: sales_people fk_rails_62c47d281f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sales_people
    ADD CONSTRAINT fk_rails_62c47d281f FOREIGN KEY (updated_by_id) REFERENCES public.users(id);


--
-- Name: cost_centers fk_rails_65bbfc3933; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cost_centers
    ADD CONSTRAINT fk_rails_65bbfc3933 FOREIGN KEY (created_by_id) REFERENCES public.users(id);


--
-- Name: warehouses fk_rails_69e5fa358b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.warehouses
    ADD CONSTRAINT fk_rails_69e5fa358b FOREIGN KEY (customer_id) REFERENCES public.customers(id);


--
-- Name: brands fk_rails_6e0f7750c4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.brands
    ADD CONSTRAINT fk_rails_6e0f7750c4 FOREIGN KEY (updated_by_id) REFERENCES public.users(id);


--
-- Name: customers fk_rails_70952c67aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT fk_rails_70952c67aa FOREIGN KEY (updated_by_id) REFERENCES public.users(id);


--
-- Name: active_storage_variant_records fk_rails_993965df05; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_variant_records
    ADD CONSTRAINT fk_rails_993965df05 FOREIGN KEY (blob_id) REFERENCES public.active_storage_blobs(id);


--
-- Name: warehouses fk_rails_9a09e153a7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.warehouses
    ADD CONSTRAINT fk_rails_9a09e153a7 FOREIGN KEY (created_by_id) REFERENCES public.users(id);


--
-- Name: sales_people fk_rails_a74d0187de; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sales_people
    ADD CONSTRAINT fk_rails_a74d0187de FOREIGN KEY (created_by_id) REFERENCES public.users(id);


--
-- Name: brands fk_rails_aa0c0af401; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.brands
    ADD CONSTRAINT fk_rails_aa0c0af401 FOREIGN KEY (created_by_id) REFERENCES public.users(id);


--
-- Name: products fk_rails_aefb4f3a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT fk_rails_aefb4f3a33 FOREIGN KEY (created_by_id) REFERENCES public.users(id);


--
-- Name: warehouses fk_rails_bc49502b24; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.warehouses
    ADD CONSTRAINT fk_rails_bc49502b24 FOREIGN KEY (supplier_id) REFERENCES public.suppliers(id);


--
-- Name: active_storage_attachments fk_rails_c3b3935057; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_attachments
    ADD CONSTRAINT fk_rails_c3b3935057 FOREIGN KEY (blob_id) REFERENCES public.active_storage_blobs(id);


--
-- Name: warehouses fk_rails_caa371610f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.warehouses
    ADD CONSTRAINT fk_rails_caa371610f FOREIGN KEY (updated_by_id) REFERENCES public.users(id);


--
-- Name: user_settings fk_rails_d1371c6356; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_settings
    ADD CONSTRAINT fk_rails_d1371c6356 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: companies fk_rails_d315b11075; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.companies
    ADD CONSTRAINT fk_rails_d315b11075 FOREIGN KEY (updated_by_id) REFERENCES public.users(id);


--
-- Name: colors fk_rails_e89ea06acf; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.colors
    ADD CONSTRAINT fk_rails_e89ea06acf FOREIGN KEY (updated_by_id) REFERENCES public.users(id);


--
-- Name: products fk_rails_f3b4d49caa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT fk_rails_f3b4d49caa FOREIGN KEY (brand_id) REFERENCES public.brands(id);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user", public;

INSERT INTO "schema_migrations" (version) VALUES
('20230407165436'),
('20230407165542'),
('20230407165641'),
('20230407165737'),
('20230407165836'),
('20230407165924'),
('20230407170007'),
('20230407170205'),
('20230407170550'),
('20230407170556'),
('20230408205526'),
('20230408211204'),
('20230409033218'),
('20230409033700'),
('20230409211224'),
('20230410105721'),
('20230410150932'),
('20230410151352'),
('20230410151917'),
('20230410225735'),
('20230415123221'),
('20230415123943'),
('20230415124744'),
('20230415125609'),
('20230422082949');


