CREATE TABLE "user" (
  "id" integer PRIMARY KEY,
  "nickname" varchar UNIQUE,
  "login" varchar UNIQUE,
  "password_hash" varchar,
  "money" integer,
  "clan_id" integer
);

CREATE TABLE "statistics" (
  "id" integer PRIMARY KEY,
  "user_id" integer,
  "win_count" integer,
  "matches_count" integer,
  "max_rating" integer,
  "current_rating" integer
);

CREATE TABLE "clan" (
  "id" integer PRIMARY KEY,
  "name" varchar UNIQUE,
  "description" varchar,
  "avatar" integer
);

CREATE TABLE "clan_action" (
  "id" integer PRIMARY KEY,
  "user_id" integer,
  "clan_id" integer,
  "description" varchar
);

CREATE TABLE "match_statistics" (
  "id" integer PRIMARY KEY,
  "host_id" integer,
  "peer_id" integer,
  "result" integer,
  "duration" integer
);

CREATE TABLE "matchmakers_room" (
  "id" integer PRIMARY KEY,
  "host_id" integer,
  "rating" integer,
  "state" boolean
);

CREATE TABLE "deck" (
  "id" integer PRIMARY KEY,
  "deck_number" integer,
  "user_id" integer
);

CREATE TABLE "card" (
  "id" integer PRIMARY KEY,
  "card_id" integer,
  "user_id" integer,
  "deck_id" integer,
  "level" integer,
  "power" float
);

CREATE TABLE "shop" (
  "id" integer PRIMARY KEY,
  "update_date" timestamp
);

CREATE TABLE "sell_item" (
  "id" integer PRIMARY KEY,
  "card_id" integer,
  "cost" integer
);

ALTER TABLE "card" ADD FOREIGN KEY ("user_id") REFERENCES "user" ("id");

ALTER TABLE "deck" ADD FOREIGN KEY ("user_id") REFERENCES "user" ("id");

ALTER TABLE "statistics" ADD FOREIGN KEY ("user_id") REFERENCES "user" ("id");

ALTER TABLE "match_statistics" ADD FOREIGN KEY ("host_id") REFERENCES "user" ("id");

ALTER TABLE "match_statistics" ADD FOREIGN KEY ("peer_id") REFERENCES "user" ("id");

ALTER TABLE "matchmakers_room" ADD FOREIGN KEY ("host_id") REFERENCES "user" ("id");

ALTER TABLE "clan_action" ADD FOREIGN KEY ("user_id") REFERENCES "user" ("id");

ALTER TABLE "user" ADD FOREIGN KEY ("clan_id") REFERENCES "clan" ("id");

ALTER TABLE "clan_action" ADD FOREIGN KEY ("clan_id") REFERENCES "clan" ("id");

ALTER TABLE "card" ADD FOREIGN KEY ("deck_id") REFERENCES "deck" ("id");

CREATE TABLE "shop_sell_item" (
  "shop_id" integer,
  "sell_item_id" integer,
  PRIMARY KEY ("shop_id", "sell_item_id")
);

ALTER TABLE "shop_sell_item" ADD FOREIGN KEY ("shop_id") REFERENCES "shop" ("id");

ALTER TABLE "shop_sell_item" ADD FOREIGN KEY ("sell_item_id") REFERENCES "sell_item" ("id");

