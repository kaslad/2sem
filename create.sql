CREATE TABLE public.client
(
  id bigint NOT NULL DEFAULT nextval('client_id_seq'::regclass),
  player_degree character varying(255),
  user_id bigint,
  CONSTRAINT client_pkey PRIMARY KEY (id),
  CONSTRAINT fkmi4tlsbdbmn0myf9cejh82chh FOREIGN KEY (user_id)
      REFERENCES public."user" (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.client
  OWNER TO postgres;

CREATE TABLE public.coach
(
  id bigint NOT NULL DEFAULT nextval('coach_id_seq'::regclass),
  coach_degree character varying(255),
  player_degree character varying(255),
  price integer,
  user_id bigint,
  CONSTRAINT coach_pkey PRIMARY KEY (id),
  CONSTRAINT fk63heu44fdh0lyus3r9jr37oyp FOREIGN KEY (user_id)
      REFERENCES public."user" (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.coach
  OWNER TO postgres;

-- Table: public.document

-- DROP TABLE public.document;

CREATE TABLE public.document
(
  id bigint NOT NULL DEFAULT nextval('document_id_seq'::regclass),
  content oid NOT NULL,
  CONSTRAINT document_pkey PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.document
  OWNER TO postgres;

-- Table: public.manager

-- DROP TABLE public.manager;

CREATE TABLE public.manager
(
  id bigint NOT NULL DEFAULT nextval('manager_id_seq'::regclass),
  CONSTRAINT manager_pkey PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.manager
  OWNER TO postgres;

-- Table: public.persistent_logins

-- DROP TABLE public.persistent_logins;

CREATE TABLE public.persistent_logins
(
  username character varying(64) NOT NULL,
  series character varying(64) NOT NULL,
  token character varying(64) NOT NULL,
  last_used timestamp without time zone NOT NULL,
  CONSTRAINT persistent_logins_pkey PRIMARY KEY (series)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.persistent_logins
  OWNER TO postgres;

-- Table: public.question

-- DROP TABLE public.question;

CREATE TABLE public.question
(
  id bigint NOT NULL DEFAULT nextval('question_id_seq'::regclass),
  answer character varying(255),
  answered boolean,
  content character varying(255),
  date timestamp without time zone,
  client_id bigint,
  coach_id bigint,
  CONSTRAINT question_pkey PRIMARY KEY (id),
  CONSTRAINT fk3hid8vg7c6i59b5nyt38xe319 FOREIGN KEY (client_id)
      REFERENCES public.client (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fkea0cf96gq4f8atmto3abp11lm FOREIGN KEY (coach_id)
      REFERENCES public.coach (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.question
  OWNER TO postgres;

-- Table: public.string_application

-- DROP TABLE public.string_application;

CREATE TABLE public.string_application
(
  id bigint NOT NULL DEFAULT nextval('string_application_id_seq'::regclass),
  horizontal_weight smallint,
  vertical_weight smallint,
  racquet_string character varying(255),
  state character varying(255),
  time_finish timestamp without time zone,
  time_start timestamp without time zone,
  client_id bigint NOT NULL,
  stringer_id bigint,
  name character varying(255) NOT NULL,
  CONSTRAINT string_application_pkey PRIMARY KEY (id),
  CONSTRAINT fkikfbgqajvjuo2sr4cljua18q FOREIGN KEY (client_id)
      REFERENCES public.client (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fklwjhykfl16temri2bfmfw8g3n FOREIGN KEY (stringer_id)
      REFERENCES public.stringer (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.string_application
  OWNER TO postgres;

-- Table: public.stringer

-- DROP TABLE public.stringer;

CREATE TABLE public.stringer
(
  id bigint NOT NULL DEFAULT nextval('stringer_id_seq'::regclass),
  price character varying(255),
  user_id bigint,
  CONSTRAINT stringer_pkey PRIMARY KEY (id),
  CONSTRAINT fk65uc2hiv1socgvuwufu5js8l4 FOREIGN KEY (user_id)
      REFERENCES public."user" (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.stringer
  OWNER TO postgres;

-- Table: public."user"

-- DROP TABLE public."user";

CREATE TABLE public."user"
(
  id bigint NOT NULL DEFAULT nextval('user_id_seq'::regclass),
  age integer,
  email character varying(255),
  hash_password character varying(255),
  hash_temp_password character varying(255),
  login character varying(255),
  name character varying(255),
  phone character varying(255),
  role character varying(255),
  sex character varying(255),
  client_id bigint,
  coach_id bigint,
  manager_id bigint,
  stringer_id bigint,
  photo character varying(255),
  CONSTRAINT user_pkey PRIMARY KEY (id),
  CONSTRAINT fk185ohii76riaapeklvp5tcg08 FOREIGN KEY (client_id)
      REFERENCES public.client (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk91tdev0shfxo92cq2jadosfoj FOREIGN KEY (manager_id)
      REFERENCES public.manager (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk9xktlp0b7rwnf61we0tfpmut5 FOREIGN KEY (coach_id)
      REFERENCES public.coach (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fktp743nxlwdv0wdwq6xshumfq6 FOREIGN KEY (stringer_id)
      REFERENCES public.stringer (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT uk_ew1hvam8uwaknuaellwhqchhb UNIQUE (login)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public."user"
  OWNER TO postgres;