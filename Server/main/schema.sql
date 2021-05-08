DROP TABLE IF EXISTS users CASCADE;
CREATE TABLE users (
  uid SERIAL PRIMARY KEY,
  username VARCHAR(255) UNIQUE,
  email VARCHAR(255),
  email_verified BOOLEAN,
  date_created DATE,
  last_login DATE
);

INSERT INTO users(username, email, email_verified, date_created)
VALUES('Josephine', 'josephine@email.com', true, NOW());

DROP TABLE IF EXISTS posts CASCADE;
CREATE TABLE posts (
  pid SERIAL PRIMARY KEY,
  title VARCHAR(255),
  body VARCHAR,
  search_vector TSVECTOR,
  user_id INT REFERENCES users(uid),
  author VARCHAR REFERENCES users(username),
  date_created TIMESTAMP,
  like_user_id INT[] DEFAULT ARRAY[]::INT[],
  likes INT DEFAULT 0
);

INSERT INTO posts(title, body, user_id, author, date_created)
VALUES('title', 'body', 1, 'Josephine', NOW() );

INSERT INTO posts(title, body, user_id, author, date_created)
VALUES('Vacation', 'In cabo...', 1, 'Josephine', NOW() );

INSERT INTO posts(title, body, user_id, author, date_created)
VALUES('Weekend', 'In Montauk...', 1, 'Josephine', NOW() );

DROP TABLE IF EXISTS comments CASCADE;
CREATE TABLE comments (
  cid SERIAL PRIMARY KEY,
  comment VARCHAR(255),
  author VARCHAR REFERENCES users(username),
  user_id INT REFERENCES users(uid),
  post_id INT REFERENCES posts(pid),
  date_created TIMESTAMP
);

DROP TABLE IF EXISTS messages CASCADE;
CREATE TABLE messages (
  mid SERIAL PRIMARY KEY,
  message_sender VARCHAR(255) REFERENCES users(username),
  message_to VARCHAR(255) REFERENCES users(username),
  message_title VARCHAR(255),
  message_body VARCHAR,
  date_created TIMESTAMP
);


COMMIT;
