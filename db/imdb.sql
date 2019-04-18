DROP TABLE cast;
DROP TABLE movie;
DROP TABLE star;


CREATE TABLE stars (
  id INT4 PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255)

);

CREATE TABLE movies (
  id INT4 PRIMARY KEY,
  title VARCHAR(255),
  genre VARCHAR(255)


);

CREATE TABLE castings (
  id INT4 PRIMARY KEY,
  movie_id INT4 REFERENCES movies(id) ON DELETE CASCADE,
  star_id INT4 REFERENCES stars(id) ON DELETE CASCADE,
  fee INT8
);
