CREATE TABLE "schema_migrations" ("version" varchar NOT NULL);
CREATE UNIQUE INDEX "unique_schema_migrations" ON "schema_migrations" ("version");
CREATE TABLE "users" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "username" varchar, "email" varchar, "name" varchar, "password_digest" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "roles" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "assignments" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "user_id" integer, "role_id" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE INDEX "index_assignments_on_user_id" ON "assignments" ("user_id");
CREATE INDEX "index_assignments_on_role_id" ON "assignments" ("role_id");
CREATE TABLE "subjects" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar NOT NULL, "classGroup" varchar NOT NULL, "teacher_id" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE INDEX "index_subjects_on_teacher_id" ON "subjects" ("teacher_id");
CREATE TABLE "lessons" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar NOT NULL, "date" datetime NOT NULL, "subject_id" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE INDEX "index_lessons_on_subject_id" ON "lessons" ("subject_id");
CREATE TABLE "enrolments" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "student_id" integer, "subject_id" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE INDEX "index_enrolments_on_student_id" ON "enrolments" ("student_id");
CREATE INDEX "index_enrolments_on_subject_id" ON "enrolments" ("subject_id");
CREATE TABLE "meetings" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "subject" varchar, "date" datetime, "location" varchar, "agenda" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "attendees" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "user_id" integer, "meeting_id" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE INDEX "index_attendees_on_user_id" ON "attendees" ("user_id");
CREATE INDEX "index_attendees_on_meeting_id" ON "attendees" ("meeting_id");
CREATE TABLE "conversations" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "inboxes" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "recipient_id" integer, "message_id" integer, "read" boolean DEFAULT 'f', "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE INDEX "index_inboxes_on_recipient_id" ON "inboxes" ("recipient_id");
CREATE INDEX "index_inboxes_on_message_id" ON "inboxes" ("message_id");
CREATE TABLE "messages" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "body" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "sender_id" integer, "conversation_id" integer);
CREATE INDEX "index_messages_on_sender_id" ON "messages" ("sender_id");
CREATE TABLE "recipients" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "user_id" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "conversation_id" integer);
CREATE INDEX "index_recipients_on_user_id" ON "recipients" ("user_id");
CREATE INDEX "index_messages_on_conversation_id" ON "messages" ("conversation_id");
CREATE INDEX "index_recipients_on_conversation_id" ON "recipients" ("conversation_id");
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

