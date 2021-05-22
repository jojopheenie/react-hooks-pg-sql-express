CREATE TABLE users (
  uid SERIAL PRIMARY KEY,
  username VARCHAR(255) UNIQUE,
  email VARCHAR(255),
  email_verified BOOLEAN,
  date_created DATE,
  last_login DATE
);

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

CREATE TABLE comments (
  cid SERIAL PRIMARY KEY,
  comment VARCHAR(255),
  author VARCHAR REFERENCES users(username),
  user_id INT REFERENCES users(uid),
  post_id INT REFERENCES posts(pid),
  date_created TIMESTAMP
);


CREATE TABLE messages (
  mid SERIAL PRIMARY KEY,
  message_sender VARCHAR(255) REFERENCES users(username),
  message_to VARCHAR(255) REFERENCES users(username),
  message_title VARCHAR(255),
  message_body VARCHAR,
  date_created TIMESTAMP
);

-- --USERS

-- DROP TABLE IF EXISTS users CASCADE;
-- CREATE TABLE users (
--   uid SERIAL PRIMARY KEY,
--   first_name VARCHAR(25) NOT NULL,
--   last_name VARCHAR(25) NOT NULL,
--   email VARCHAR(30) NOT NULL UNIQUE,
--   pwd VARCHAR(10) NOT NULL,
--   slack_handle VARCHAR(30),
--   reason_for_joining VARCHAR(30),
--   country VARCHAR(56),
--   region VARCHAR(26),
--   city VARCHAR(26),
--   post_code INT,
--   linkedIn VARCHAR(50),
--   job_title VARCHAR(50),
--   main_speciality VARCHAR(30),
--   experience VARCHAR(50),
--   last_company VARCHAR(30),
--   num_employees INT,
--   sector VARCHAR(30),
--   user_type VARCHAR(15),
--   current_team_Id INT,
--   date_created DATE,
--   CHECK (length(pwd) >= 6 AND length(pwd) <= 10)
-- );

-- -- USERS seeding
-- INSERT INTO users(first_name, last_name, email, pwd)
-- VALUES('Josephine', 'Amos','josephine@email.com', '000000');

-- INSERT INTO users(first_name, last_name, email, pwd)
-- VALUES('Beyonce', 'Knowles','beyonce@email.com', '111111');

-- INSERT INTO users(first_name, last_name, email, pwd)
-- VALUES('Idris', 'Elba','idris@email.com', '222222');

-- INSERT INTO users(first_name, last_name, email, pwd)
-- VALUES('test1', 'test1','test@email.com', '333333');

-- -- EQUALITHONS
-- DROP TABLE IF EXISTS equalithons CASCADE;
-- CREATE TABLE equalithons (
--   equalithon_id SERIAL PRIMARY KEY,
--   equalithon_name VARCHAR(30) NOT NULL,
--   startDate DATE NOT NULL,
--   endDate DATE NOT NULL,
--   non_profit VARCHAR(30) NOT NULL,
--   sponsor VARCHAR(30) NOT NULL,
--   descript TEXT NOT NULL,
--   challenge1 INT NOT NULL,
--   challenge2 INT NOT NULL,
--   challenge3 INT,
--   -- vvv admin who creates the equalithon
--   userId INT,
--   FOREIGN KEY (userId) REFERENCES users(uid),
--   FOREIGN KEY (challenge1) REFERENCES challenges(challenge_id),
--   FOREIGN KEY (challenge2) REFERENCES challenges(challenge_id),
--   FOREIGN KEY (challenge3) REFERENCES challenges(challenge_id)
-- );

-- -- EQUALITHONS seeding
-- INSERT INTO equalithons(equalithon_name, startDate, endDate, non_profit, sponsor, descript, challenge1, challenge2, challenge3, userId)
-- VALUES('Womens Day', '2021-03-22', '2021-03-30', 'Planned Parenthood', 'Women Who Code', 'hackathon for womens history month', 1, 2, 3, 1);

-- INSERT INTO equalithons(equalithon_name, startDate, endDate, non_profit, sponsor, descript, challenge1, challenge2, challenge3, userId)
-- VALUES('Pride', '2021-06-19', '2021-06-21', 'Trevor Project', 'American Express', 'hackathon for pride month', 1, 2, 3, 1);

-- INSERT INTO equalithons(equalithon_name, startDate, endDate, non_profit, sponsor, descript, challenge1, challenge2, challenge3, userId)
-- VALUES('Rural Gap', '2021-05-22', '2021-05-30', 'Listen First Project', 'Airtable', 'For the World Day for Cultural Diversity, Essteem is preparing an Equalithon for rural areas inclusion.', 1, 2, 3, 1);

-- -- CHALLENGES
-- DROP TABLE IF EXISTS challenges CASCADE;
-- CREATE TABLE challenges (
--   challenge_id SERIAL PRIMARY KEY,
--   challenge_descript TEXT,
--   equalithon_id INT,
--   FOREIGN KEY (equalithon_id) REFERENCES equalithons(equalithon_id)
-- );

-- -- CHALLENGES seeding
-- INSERT INTO challenges(challenge_descript, equalithon_id)
-- VALUES('creating a project that addresses this non profit', 1);

-- INSERT INTO challenges(challenge_descript, equalithon_id)
-- VALUES('creating a project that addresses this non profit', 1);

-- INSERT INTO challenges(challenge_descript, equalithon_id)
-- VALUES('creating a project that addresses this non profit', 1);

-- INSERT INTO challenges(challenge_descript, equalithon_id)
-- VALUES('creating a project that addresses this non profit', 2);

-- INSERT INTO challenges(challenge_descript, equalithon_id)
-- VALUES('creating a project that addresses this non profit', 2);

-- INSERT INTO challenges(challenge_descript, equalithon_id)
-- VALUES('creating a project that addresses this non profit', 2);

-- INSERT INTO challenges(challenge_descript, equalithon_id)
-- VALUES('creating a project that addresses this non profit', 3);

-- INSERT INTO challenges(challenge_descript, equalithon_id)
-- VALUES('creating a project that addresses this non profit', 3);

-- INSERT INTO challenges(challenge_descript, equalithon_id)
-- VALUES('creating a project that addresses this non profit', 3);

-- -- TEAMS
-- DROP TABLE IF EXISTS teams CASCADE;
-- CREATE TABLE teams (
--   team_id SERIAL PRIMARY KEY,
--   team_name VARCHAR(30) NOT NULL,
--   team_status VARCHAR(30),
--   need TEXT,
--   team_lead_id INT,
--   equalithon_id INT,
--   challenge_id INT,
--   FOREIGN KEY (team_lead_id) REFERENCES users(uid),
--   FOREIGN KEY (equalithon_id) REFERENCES equalithons(equalithon_id),
--   FOREIGN KEY (challenge_id) REFERENCES challenges(challenge_id)
-- );

-- -- TEAMS seeding
-- INSERT INTO teams(team_name, team_status, need, team_lead_id, equalithon_id, challenge_id)
-- VALUES('team1', 'looking for members', 'need: UX/UI Designer, Product Manager, Back End Developer, Front End Developer, Full Stack Developer', 1, 1, 1);

-- INSERT INTO teams(team_name, team_status, need, team_lead_id, equalithon_id, challenge_id)
-- VALUES('team2', 'looking for members', 'need: UX/UI Designer, Product Manager, Back End Developer, Front End Developer, Full Stack Developer', 1, 1, 2);

-- INSERT INTO teams(team_name, team_status, need, team_lead_id, equalithon_id, challenge_id)
-- VALUES('team3', 'looking for members', 'need: UX/UI Designer, Product Manager, Back End Developer, Front End Developer, Full Stack Developer', 1, 1, 3);

-- INSERT INTO teams(team_name, team_status, need, team_lead_id, equalithon_id, challenge_id)
-- VALUES('team1', 'looking for members', 'need: UX/UI Designer, Product Manager, Back End Developer, Front End Developer, Full Stack Developer', 1, 2, 1);

-- INSERT INTO teams(team_name, team_status, need, team_lead_id, equalithon_id, challenge_id)
-- VALUES('team2', 'looking for members', 'need: UX/UI Designer, Product Manager, Back End Developer, Front End Developer, Full Stack Developer', 1, 2, 2);

-- INSERT INTO teams(team_name, team_status, need, team_lead_id, equalithon_id, challenge_id)
-- VALUES('team3', 'looking for members', 'need: UX/UI Designer, Product Manager, Back End Developer, Front End Developer, Full Stack Developer', 1, 2, 3);


-- INSERT INTO teams(team_name, team_status, need, team_lead_id, equalithon_id, challenge_id)
-- VALUES('team1', 'looking for members', 'need: UX/UI Designer, Product Manager, Back End Developer, Front End Developer, Full Stack Developer', 1, 3, 1);

-- INSERT INTO teams(team_name, team_status, need, team_lead_id, equalithon_id, challenge_id)
-- VALUES('team2', 'looking for members', 'need: UX/UI Designer, Product Manager, Back End Developer, Front End Developer, Full Stack Developer', 1, 3, 2);

-- INSERT INTO teams(team_name, team_status, need, team_lead_id, equalithon_id, challenge_id)
-- VALUES('team3', 'looking for members', 'need: UX/UI Designer, Product Manager, Back End Developer, Front End Developer, Full Stack Developer', 1, 3, 3);


-- -- USER EQUALITHONS
-- DROP TABLE IF EXISTS user_equalithons CASCADE;
-- CREATE TABLE user_equalithons (
--   user_id INT NOT NULL,
--   equalithon_id INT NOT NULL,
--   team_id INT NOT NULL,
--   current BOOLEAN NOT NULL,
--   FOREIGN KEY (user_id) REFERENCES users(uid),
--   FOREIGN KEY (equalithon_id) REFERENCES equalithons(equalithon_id),
--   FOREIGN KEY (team_id) REFERENCES teams(team_id)
-- );

-- -- USER EQUALITHONS seeding

-- INSERT INTO user_equalithons(user_id, equalithon_id, team_id, current)
-- VALUES(1, 1, 2, true);

-- INSERT INTO user_equalithons(user_id, equalithon_id, team_id, current)
-- VALUES(2, 1, 1, true);

-- INSERT INTO user_equalithons(user_id, equalithon_id, team_id, current)
-- VALUES(3, 1, 3, true);

-- INSERT INTO user_equalithons(user_id, equalithon_id, team_id, current)
-- VALUES(1, 2, 1, true);

-- INSERT INTO user_equalithons(user_id, equalithon_id, team_id, current)
-- VALUES(2, 2, 2, true);

-- INSERT INTO user_equalithons(user_id, equalithon_id, team_id, current)
-- VALUES(3, 2, 3, true);



COMMIT;
