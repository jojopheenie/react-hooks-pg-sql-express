DROP TABLE IF EXISTS users CASCADE;
CREATE TABLE users (
  uid SERIAL PRIMARY KEY,
  first_name VARCHAR(25) NOT NULL,
  last_name VARCHAR(25) NOT NULL,
  email VARCHAR(30) NOT NULL,
  pwd VARCHAR(10) NOT NULL UNIQUE,
  slack_handle VARCHAR(30),
  reason_for_joining VARCHAR(30),
  country VARCHAR(30),
  region VARCHAR(20),
  city VARCHAR(20),
  post_code INT,
  linkedIn VARCHAR(30),
  job_title VARCHAR(30),
  main_speciality VARCHAR(30),
  experience VARCHAR(30),
  last_company VARCHAR(30),
  num_employees INT,
  sector VARCHAR(30),
  user_type VARCHAR(20),
  current_team_Id INT,
  date_created DATE,
  last_login DATE,
  CHECK (len(pwd) >= 6 AND len(pwd) <= 10)
);

INSERT INTO users(first_name, last_name, email, pwd)
VALUES('Josephine', 'Amos','josephine@email.com', '123456');

DROP TABLE IF EXISTS equalithons CASCADE;
CREATE TABLE posts (
  pid SERIAL PRIMARY KEY,
  name VARCHAR(255),
  start_date DATE,
  end_date DATE,
  non_profit VARCHAR(255),
  sponsor VARCHAR(255),
  description VARCHAR(255),
  challenge1 VARCHAR(255),
  challenge2 VARCHAR(255),
  challenge3 VARCHAR(255),
  equalithon_id
  search_vector TSVECTOR,
  user_id INT REFERENCES users(uid),
  author VARCHAR REFERENCES users(username),
  date_created TIMESTAMP,
  like_user_id INT[] DEFAULT ARRAY[]::INT[],
  likes INT DEFAULT 0
);

INSERT INTO posts(title, body, user_id, author, date_created)
VALUES('title', 'body', 1, 'Josephine', NOW() );

DROP TABLE IF EXISTS teams CASCADE;
CREATE TABLE comments (
  cid SERIAL PRIMARY KEY,
  comment VARCHAR(255),
  author VARCHAR REFERENCES users(username),
  user_id INT REFERENCES users(uid),
  post_id INT REFERENCES posts(pid),
  date_created TIMESTAMP
);

DROP TABLE IF EXISTS user_equalithons CASCADE;
CREATE TABLE messages (
  user_id TINYINT,
  message_sender VARCHAR(255) REFERENCES users(username),
  message_to VARCHAR(255) REFERENCES users(username),
  message_title VARCHAR(255),
  message_body VARCHAR,
  date_created TIMESTAMP
);


COMMIT;
