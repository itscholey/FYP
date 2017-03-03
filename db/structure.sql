--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.6
-- Dumped by pg_dump version 9.5.6

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user", public;

INSERT INTO schema_migrations (version) VALUES ('20170209180608');

INSERT INTO schema_migrations (version) VALUES ('20170209180645');

INSERT INTO schema_migrations (version) VALUES ('20170209181009');

INSERT INTO schema_migrations (version) VALUES ('20170217181905');

INSERT INTO schema_migrations (version) VALUES ('20170217181945');

INSERT INTO schema_migrations (version) VALUES ('20170220102723');

INSERT INTO schema_migrations (version) VALUES ('20170223083825');

INSERT INTO schema_migrations (version) VALUES ('20170223084109');

INSERT INTO schema_migrations (version) VALUES ('20170302125952');

INSERT INTO schema_migrations (version) VALUES ('20170302130059');

INSERT INTO schema_migrations (version) VALUES ('20170302130142');

INSERT INTO schema_migrations (version) VALUES ('20170302154651');

INSERT INTO schema_migrations (version) VALUES ('20170303163726');

INSERT INTO schema_migrations (version) VALUES ('20170303164015');

INSERT INTO schema_migrations (version) VALUES ('20170303171440');

