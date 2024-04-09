# Google Play Store Dataset Analysis

## Overview
This project focuses on cleaning and analyzing the Google Play Store apps dataset. The goal is to uncover insights into app categories, ratings, installations, and more. We begin by cleaning the dataset using Python, followed by analysis through SQL queries.

## Dataset Cleaning
The raw dataset, `googleplaystore.csv`, was cleaned using Pandas in Python. Steps taken include:

- Converting the `Size` column from strings to numerical values in megabytes.
- Parsing and converting the `Installs`, `Price`, and `Reviews` columns to numerical types.
- Handling non-numeric entries and duplicates.
- Formatting the `Last Updated` column into a datetime object.

The cleaned dataset was saved as `googleplaystore_cleaned.csv`.

## Database Setup
A PostgreSQL database, `google_play_store`, was created to store and analyze the cleaned data. The data was imported into an `apps` table.

### SQL Schema
The table schema for the `apps` table is as follows:

```sql
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

## Analysis

Several SQL queries were executed to analyze the dataset:

Count of Apps by Category - Identifies the most popular categories based on the number of apps.
Average Rating by Category - Determines the categories with the highest average ratings.
Top Installed Apps - Lists the top 10 apps based on the number of installs.
Count of Apps by Content Rating - Analyzes the distribution of apps based on their content rating.
Categories with the Highest Average Rating (with >5000 reviews) - Focuses on high-quality categories with a significant number of reviews.
Top App by Installs within Each Category and Type - Identifies leading apps in each category and type based on installs.

## Findings

Insights on which categories are most saturated and which hold the highest user ratings.
Identification of the most installed apps, providing a sense of user preference.
Understanding of content rating distribution among apps.
Insights into high-quality app categories based on average ratings and reviews.
Conclusion

This analysis offers valuable insights for developers and marketers in the mobile app industry, indicating potential areas for growth and user interest.

## How to Use

To replicate this analysis, ensure you have Python and PostgreSQL installed. Follow the steps outlined in the Dataset Cleaning and Database Setup sections.

## Acknowledgments

Dataset source: Google Play Store
Analysis tools: Python (Pandas library) and PostgreSQL

