--SQL Query
CREATE DATABASE google_play_store;

\c google_play_store


CREATE TABLE apps (
    app_id SERIAL PRIMARY KEY,
    app_name VARCHAR(255),
    category VARCHAR(50),
    rating FLOAT,
    reviews INT,
    size_mb FLOAT,
    installs INT,
    type VARCHAR(10),
    price FLOAT,
    content_rating VARCHAR(50),
    genres VARCHAR(100),
    last_updated DATE,
    current_version VARCHAR(50),
    android_version VARCHAR(50)
);

\copy apps(app_name, category, rating, reviews, size_mb, installs, type, price, content_rating, genres, last_updated, current_version, android_version) FROM '/Users/chantalstefan/Documents/Scripting/Data Analytics Portfolio für Git/googleplaystore_cleaned.csv' DELIMITER ',' CSV HEADER;


SELECT category, COUNT(*) AS number_of_apps
FROM apps
GROUP BY category
ORDER BY number_of_apps DESC;

SELECT category, AVG(rating) AS avg_rating
FROM apps
GROUP BY category
ORDER BY avg_rating DESC;

SELECT app_name, installs
FROM apps
ORDER BY installs DESC
LIMIT 10;

SELECT content_rating, COUNT(*) AS number_of_apps
FROM apps
GROUP BY content_rating
ORDER BY number_of_apps DESC;

SELECT category, AVG(rating) AS average_rating
FROM apps
WHERE reviews > 5000
GROUP BY category
ORDER BY average_rating DESC
LIMIT 5;

WITH ranked_apps AS (
  SELECT category, type, app_name, installs,
         ROW_NUMBER() OVER(PARTITION BY category, type ORDER BY installs DESC) AS rank
  FROM apps
)
SELECT category, type, app_name, installs
FROM ranked_apps
WHERE rank = 1
ORDER BY category, type;
