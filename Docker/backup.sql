/*
PostgreSQL Backup
Database: voto-electronico/public
Backup Time: 2024-12-09 00:50:15
*/

DROP SEQUENCE IF EXISTS "public"."candidate_lists_id_seq";
DROP SEQUENCE IF EXISTS "public"."elections_id_seq";
DROP SEQUENCE IF EXISTS "public"."grade_id_seq";
DROP SEQUENCE IF EXISTS "public"."institutions_id_seq";
DROP SEQUENCE IF EXISTS "public"."list_roles_id_seq";
DROP SEQUENCE IF EXISTS "public"."role_users_id_seq";
DROP SEQUENCE IF EXISTS "public"."roles_id_seq";
DROP SEQUENCE IF EXISTS "public"."sections_id_seq";
DROP SEQUENCE IF EXISTS "public"."students_id_seq";
DROP SEQUENCE IF EXISTS "public"."users_id_seq";
DROP SEQUENCE IF EXISTS "public"."votes_id_seq";
DROP TABLE IF EXISTS "public"."candidate_lists";
DROP TABLE IF EXISTS "public"."elections";
DROP TABLE IF EXISTS "public"."grades";
DROP TABLE IF EXISTS "public"."institutions";
DROP TABLE IF EXISTS "public"."list_roles";
DROP TABLE IF EXISTS "public"."role_users";
DROP TABLE IF EXISTS "public"."roles";
DROP TABLE IF EXISTS "public"."sections";
DROP TABLE IF EXISTS "public"."students";
DROP TABLE IF EXISTS "public"."users";
DROP TABLE IF EXISTS "public"."votes";
CREATE SEQUENCE "candidate_lists_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;
CREATE SEQUENCE "elections_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;
CREATE SEQUENCE "grade_id_seq" 
INCREMENT 50
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;
CREATE SEQUENCE "institutions_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;
CREATE SEQUENCE "list_roles_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;
CREATE SEQUENCE "role_users_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;
CREATE SEQUENCE "roles_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;
CREATE SEQUENCE "sections_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;
CREATE SEQUENCE "students_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;
CREATE SEQUENCE "users_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;
CREATE SEQUENCE "votes_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;
CREATE TABLE "candidate_lists" (
  "id" int8 NOT NULL DEFAULT nextval('candidate_lists_id_seq'::regclass),
  "color" varchar(255) COLLATE "pg_catalog"."default",
  "img_candidate" varchar(255) COLLATE "pg_catalog"."default",
  "logo" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "state" varchar(255) COLLATE "pg_catalog"."default" NOT NULL
)
;
ALTER TABLE "candidate_lists" OWNER TO "postgres";
CREATE TABLE "elections" (
  "year" int4 NOT NULL,
  "id" int8 NOT NULL DEFAULT nextval('elections_id_seq'::regclass),
  "ips" varchar(255) COLLATE "pg_catalog"."default",
  "logo" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "state" varchar(255) COLLATE "pg_catalog"."default" NOT NULL
)
;
ALTER TABLE "elections" OWNER TO "postgres";
CREATE TABLE "grades" (
  "id" int8 NOT NULL,
  "abbreviation" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "state" varchar(255) COLLATE "pg_catalog"."default" NOT NULL
)
;
ALTER TABLE "grades" OWNER TO "postgres";
CREATE TABLE "institutions" (
  "id" int8 NOT NULL DEFAULT nextval('institutions_id_seq'::regclass),
  "logo" varchar(255) COLLATE "pg_catalog"."default",
  "name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL
)
;
ALTER TABLE "institutions" OWNER TO "postgres";
CREATE TABLE "list_roles" (
  "candidate_list_id" int8 NOT NULL,
  "id" int8 NOT NULL DEFAULT nextval('list_roles_id_seq'::regclass),
  "role_id" int8 NOT NULL,
  "name_candidate" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "state" varchar(255) COLLATE "pg_catalog"."default"
)
;
ALTER TABLE "list_roles" OWNER TO "postgres";
CREATE TABLE "role_users" (
  "id" int8 NOT NULL DEFAULT nextval('role_users_id_seq'::regclass),
  "user_id" int8,
  "name" varchar(255) COLLATE "pg_catalog"."default"
)
;
ALTER TABLE "role_users" OWNER TO "postgres";
CREATE TABLE "roles" (
  "orderr" int4 NOT NULL,
  "id" int8 NOT NULL DEFAULT nextval('roles_id_seq'::regclass),
  "name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "state" varchar(255) COLLATE "pg_catalog"."default" NOT NULL
)
;
ALTER TABLE "roles" OWNER TO "postgres";
CREATE TABLE "sections" (
  "id" int8 NOT NULL DEFAULT nextval('sections_id_seq'::regclass),
  "abbreviation" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "state" varchar(255) COLLATE "pg_catalog"."default" NOT NULL
)
;
ALTER TABLE "sections" OWNER TO "postgres";
CREATE TABLE "students" (
  "grade_id" int8,
  "id" int8 NOT NULL DEFAULT nextval('students_id_seq'::regclass),
  "section_id" int8,
  "dni" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "state" varchar(255) COLLATE "pg_catalog"."default" NOT NULL
)
;
ALTER TABLE "students" OWNER TO "postgres";
CREATE TABLE "users" (
  "state" bool NOT NULL,
  "created_at" timestamp(6),
  "id" int8 NOT NULL DEFAULT nextval('users_id_seq'::regclass),
  "update_at" timestamp(6),
  "username" varchar(30) COLLATE "pg_catalog"."default" NOT NULL,
  "password" varchar(60) COLLATE "pg_catalog"."default" NOT NULL,
  "last_name" varchar(255) COLLATE "pg_catalog"."default",
  "name" varchar(255) COLLATE "pg_catalog"."default"
)
;
ALTER TABLE "users" OWNER TO "postgres";
CREATE TABLE "votes" (
  "candidate_list_id" int8,
  "date" timestamp(6),
  "id" int8 NOT NULL DEFAULT nextval('votes_id_seq'::regclass),
  "student_id" int8
)
;
ALTER TABLE "votes" OWNER TO "postgres";
BEGIN;
LOCK TABLE "public"."candidate_lists" IN SHARE MODE;
DELETE FROM "public"."candidate_lists";
COMMIT;
BEGIN;
LOCK TABLE "public"."elections" IN SHARE MODE;
DELETE FROM "public"."elections";
COMMIT;
BEGIN;
LOCK TABLE "public"."grades" IN SHARE MODE;
DELETE FROM "public"."grades";
COMMIT;
BEGIN;
LOCK TABLE "public"."institutions" IN SHARE MODE;
DELETE FROM "public"."institutions";
COMMIT;
BEGIN;
LOCK TABLE "public"."list_roles" IN SHARE MODE;
DELETE FROM "public"."list_roles";
COMMIT;
BEGIN;
LOCK TABLE "public"."role_users" IN SHARE MODE;
DELETE FROM "public"."role_users";
INSERT INTO "public"."role_users" ("id","user_id","name") VALUES (1, 1, 'ROLE_USER'),(2, 2, 'ROLE_ADMIN'),(3, 2, 'ROLE_USER')
;
COMMIT;
BEGIN;
LOCK TABLE "public"."roles" IN SHARE MODE;
DELETE FROM "public"."roles";
COMMIT;
BEGIN;
LOCK TABLE "public"."sections" IN SHARE MODE;
DELETE FROM "public"."sections";
COMMIT;
BEGIN;
LOCK TABLE "public"."students" IN SHARE MODE;
DELETE FROM "public"."students";
COMMIT;
BEGIN;
LOCK TABLE "public"."users" IN SHARE MODE;
DELETE FROM "public"."users";
INSERT INTO "public"."users" ("state","created_at","id","update_at","username","password","last_name","name") VALUES ('t', NULL, 1, NULL, 'andres', '$2a$10$O9wxmH/AeyZZzIS09Wp8YOEMvFnbRVJ8B4dmAMVSGloR62lj.yqXG', NULL, NULL),('t', NULL, 2, NULL, 'admin', '$2a$10$DOMDxjYyfZ/e7RcBfUpzqeaCs8pLgcizuiQWXPkU35nOhZlFcE9MS', NULL, NULL)
;
COMMIT;
BEGIN;
LOCK TABLE "public"."votes" IN SHARE MODE;
DELETE FROM "public"."votes";
COMMIT;
ALTER TABLE "candidate_lists" ADD CONSTRAINT "candidate_lists_pkey" PRIMARY KEY ("id");
ALTER TABLE "elections" ADD CONSTRAINT "elections_pkey" PRIMARY KEY ("id");
ALTER TABLE "grades" ADD CONSTRAINT "grades_pkey" PRIMARY KEY ("id");
ALTER TABLE "institutions" ADD CONSTRAINT "institutions_pkey" PRIMARY KEY ("id");
ALTER TABLE "list_roles" ADD CONSTRAINT "list_roles_pkey" PRIMARY KEY ("id");
ALTER TABLE "role_users" ADD CONSTRAINT "role_users_pkey" PRIMARY KEY ("id");
ALTER TABLE "roles" ADD CONSTRAINT "roles_pkey" PRIMARY KEY ("id");
ALTER TABLE "sections" ADD CONSTRAINT "sections_pkey" PRIMARY KEY ("id");
ALTER TABLE "students" ADD CONSTRAINT "students_pkey" PRIMARY KEY ("id");
ALTER TABLE "users" ADD CONSTRAINT "users_pkey" PRIMARY KEY ("id");
ALTER TABLE "votes" ADD CONSTRAINT "votes_pkey" PRIMARY KEY ("id");
ALTER TABLE "grades" ADD CONSTRAINT "grades_abbreviation_key" UNIQUE ("abbreviation");
ALTER TABLE "grades" ADD CONSTRAINT "grades_name_key" UNIQUE ("name");
ALTER TABLE "list_roles" ADD CONSTRAINT "uk5q90pi4hu0fjf56lx1hkkh8jv" UNIQUE ("role_id", "candidate_list_id");
ALTER TABLE "list_roles" ADD CONSTRAINT "fk6bou4imhmat2tq8i7hw3puki3" FOREIGN KEY ("role_id") REFERENCES "public"."roles" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "list_roles" ADD CONSTRAINT "fkpj5r9bqjcjpbr7u9vejed04cb" FOREIGN KEY ("candidate_list_id") REFERENCES "public"."candidate_lists" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "role_users" ADD CONSTRAINT "ukbwhftt1kk6pgi8flracv8iuyr" UNIQUE ("user_id", "name");
ALTER TABLE "role_users" ADD CONSTRAINT "fkf685pkoo051sx8gk6o3l6116m" FOREIGN KEY ("user_id") REFERENCES "public"."users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "roles" ADD CONSTRAINT "roles_name_key" UNIQUE ("name");
ALTER TABLE "sections" ADD CONSTRAINT "sections_name_key" UNIQUE ("name");
ALTER TABLE "students" ADD CONSTRAINT "students_dni_key" UNIQUE ("dni");
ALTER TABLE "students" ADD CONSTRAINT "fkbu72kq4xd8qjcemytgfxel71l" FOREIGN KEY ("section_id") REFERENCES "public"."sections" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "students" ADD CONSTRAINT "fkexo2cgxoe0p8p60y4m6g9hent" FOREIGN KEY ("grade_id") REFERENCES "public"."grades" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "users" ADD CONSTRAINT "users_username_key" UNIQUE ("username");
ALTER TABLE "votes" ADD CONSTRAINT "votes_student_id_key" UNIQUE ("student_id");
ALTER TABLE "votes" ADD CONSTRAINT "fk62rcwode7wb5bko4gr245l44o" FOREIGN KEY ("candidate_list_id") REFERENCES "public"."candidate_lists" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "votes" ADD CONSTRAINT "fkedp02ocau0clg1eoax2xbmd4d" FOREIGN KEY ("student_id") REFERENCES "public"."students" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER SEQUENCE "candidate_lists_id_seq"
OWNED BY "candidate_lists"."id";
SELECT setval('"candidate_lists_id_seq"', 1, false);
ALTER SEQUENCE "candidate_lists_id_seq" OWNER TO "postgres";
ALTER SEQUENCE "elections_id_seq"
OWNED BY "elections"."id";
SELECT setval('"elections_id_seq"', 1, false);
ALTER SEQUENCE "elections_id_seq" OWNER TO "postgres";
SELECT setval('"grade_id_seq"', 1, false);
ALTER SEQUENCE "grade_id_seq" OWNER TO "postgres";
ALTER SEQUENCE "institutions_id_seq"
OWNED BY "institutions"."id";
SELECT setval('"institutions_id_seq"', 1, true);
ALTER SEQUENCE "institutions_id_seq" OWNER TO "postgres";
ALTER SEQUENCE "list_roles_id_seq"
OWNED BY "list_roles"."id";
SELECT setval('"list_roles_id_seq"', 1, false);
ALTER SEQUENCE "list_roles_id_seq" OWNER TO "postgres";
ALTER SEQUENCE "role_users_id_seq"
OWNED BY "role_users"."id";
SELECT setval('"role_users_id_seq"', 3, true);
ALTER SEQUENCE "role_users_id_seq" OWNER TO "postgres";
ALTER SEQUENCE "roles_id_seq"
OWNED BY "roles"."id";
SELECT setval('"roles_id_seq"', 1, false);
ALTER SEQUENCE "roles_id_seq" OWNER TO "postgres";
ALTER SEQUENCE "sections_id_seq"
OWNED BY "sections"."id";
SELECT setval('"sections_id_seq"', 1, false);
ALTER SEQUENCE "sections_id_seq" OWNER TO "postgres";
ALTER SEQUENCE "students_id_seq"
OWNED BY "students"."id";
SELECT setval('"students_id_seq"', 1, false);
ALTER SEQUENCE "students_id_seq" OWNER TO "postgres";
ALTER SEQUENCE "users_id_seq"
OWNED BY "users"."id";
SELECT setval('"users_id_seq"', 2, true);
ALTER SEQUENCE "users_id_seq" OWNER TO "postgres";
ALTER SEQUENCE "votes_id_seq"
OWNED BY "votes"."id";
SELECT setval('"votes_id_seq"', 1, false);
ALTER SEQUENCE "votes_id_seq" OWNER TO "postgres";
