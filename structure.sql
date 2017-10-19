CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

DROP TABLE IF EXISTS "events";

CREATE TABLE "events" (
  "id"            bigserial   PRIMARY KEY NOT NULL,
  "uuid"          uuid                    NOT NULL  DEFAULT uuid_generate_v4(),
  "type"          text                    NOT NULL,
  "body"          jsonb                   NOT NULL,
  "inserted_at"   timestamp(6)            NOT NULL  DEFAULT statement_timestamp()
);

CREATE INDEX "idx_events_type" ON "events" (type ASC);

CREATE INDEX "idx_events_uuid" ON "events" (uuid);

CREATE INDEX "idx_events_inserted_at" ON "events" (inserted_at DESC);
