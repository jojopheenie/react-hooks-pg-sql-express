DROP TABLE IF EXISTS users CASCADE;
CREATE TABLE users (
  uid SERIAL PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  email VARCHAR(255),
  password VARCHAR(255),
  slack_handle VARCHAR(255),
  reason_for_joining VARCHAR(255),
  country VARCHAR(255),
  region VARCHAR(255),
  city VARCHAR(255),
  post_code VARCHAR(255),
  linkedIn VARCHAR(255),
  job_title VARCHAR(255),
  main_speciality VARCHAR(255),
  experience VARCHAR(255),
  last_company VARCHAR(255),
  num_employees VARCHAR(255),
  sector VARCHAR(255),
  user_type VARCHAR(255),
  current_team_Id VARCHAR(255),
  date_created DATE,
  last_login DATE
);

INSERT INTO users(username, email, email_verified, date_created)
VALUES('Josephine', 'josephine@email.com', true, NOW());

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
