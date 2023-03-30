DROP TABLE IF EXISTS "public"."students";

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS students_id_seq;

-- Table Definition
CREATE TABLE "public"."students" (
    "id" SERIAL,
    "name" text,
    "cohort_id" int4,
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "public"."cohorts";


-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS cohorts_id_seq;

-- Table Definition
CREATE TABLE "public"."cohorts" (
    "id" SERIAL,
    "name" text,
    "starting_date" text,
    PRIMARY KEY ("id")
);

INSERT INTO "public"."cohorts" ("id", "name", "starting_date") VALUES
(1, 'March', '2023, 03, 10'),
(2, 'January', '2023, 01, 15'),
(3, 'May', '2023, 05, 10');

INSERT INTO "public"."students" ("id", "name", "cohort_id") VALUES
(1, 'Carolina', 1),
(2, 'John', 1),
(3, 'Emma', 2);