CREATE TABLE clans (
  id SERIAL PRIMARY KEY,
  name VARCHAR(20) UNIQUE,
  description VARCHAR(100),
  avatar INT
);

CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  nickname VARCHAR(20) UNIQUE NOT NULL,
  login VARCHAR(20) UNIQUE NOT NULL,
  password_hash VARCHAR(255) NOT NULL,
  money INT NOT NULL DEFAULT 1000,
  clan_id INT DEFAULT NULL,
  FOREIGN KEY (clan_id) REFERENCES clans (id) ON DELETE SET NULL
);

ALTER TABLE clans
  ADD COLUMN owner_id INT UNIQUE NOT NULL;

ALTER TABLE clans
  ADD CONSTRAINT owner_id_fkey FOREIGN KEY (owner_id) REFERENCES users(id) ON DELETE CASCADE;


CREATE TABLE statistics (
  id SERIAL PRIMARY KEY,
  user_id INT NOT NULL,
  win_count INT NOT NULL DEFAULT 0,
  matches_count INT NOT NULL DEFAULT 0,
  max_rating INT NOT NULL DEFAULT 100,
  current_rating INT NOT NULL DEFAULT 100,
  FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);


CREATE TABLE clan_actions (
  id SERIAL PRIMARY KEY,
  user_id INT NOT NULL,
  clan_id INT NOT NULL,
  description VARCHAR(255) NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
  FOREIGN KEY (clan_id) REFERENCES clans(id) ON DELETE CASCADE
);

CREATE TABLE match_statistics (
  id SERIAL PRIMARY KEY,
  host_id INT NOT NULL,
  peer_id INT NOT NULL,
  result INT NOT NULL,
  duration INT NOT NULL,
  room_id INT NOT NULL,
  FOREIGN KEY (host_id) REFERENCES users(id) ON DELETE CASCADE,
  FOREIGN KEY (peer_id) REFERENCES users(id) ON DELETE CASCADE
);

CREATE TABLE matchmakers_rooms (
  id SERIAL PRIMARY KEY,
  host_id INT UNIQUE NOT NULL,
  peer_id INT UNIQUE DEFAULT NULL,
  state BOOLEAN NOT NULL DEFAULT false,
  FOREIGN KEY (host_id) REFERENCES users(id) ON DELETE CASCADE,
  FOREIGN KEY (peer_id) REFERENCES users(id) ON DELETE SET NULL
);

CREATE TABLE decks (
  id SERIAL PRIMARY KEY,
  user_id INT NOT NULL,
  deck_number INT NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

CREATE TABLE cards (
  id SERIAL PRIMARY KEY,
  user_id INT NOT NULL,  
  deck_id INT DEFAULT NULL,
  card_id INT NOT NULL,
  level INT NOT NULL DEFAULT 1,
  power FLOAT NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
  FOREIGN KEY (deck_id) REFERENCES decks(id) ON DELETE SET NULL
);

CREATE TABLE shops (
  id SERIAL PRIMARY KEY,
  update_date timestamp NOT NULL
);

CREATE TABLE sell_items (
  id SERIAL PRIMARY KEY,
  card_id INT NOT NULL,
  cost INT NOT NULL
);

CREATE TABLE shops_sell_items(
  id SERIAL PRIMARY KEY,
  shop_id INT NOT NULL,
  sell_item_id INT NOT NULL,
  FOREIGN KEY (shop_id) REFERENCES shops(id) ON DELETE CASCADE,
  FOREIGN KEY (sell_item_id) REFERENCES sell_items(id) ON DELETE CASCADE
);