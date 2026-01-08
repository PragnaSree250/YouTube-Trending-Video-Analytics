# YouTube Trending Video Analytics

This project analyzes YouTube trending videos (CA region) to find patterns in popularity, engagement, and **title sentiment** using Python, MySQL, and Power BI.[1][2]

## Overview
- **Goal:** Identify which categories, channels, and title sentiments are linked with higher views and engagement.  
- **Dataset:** Kaggle “YouTube Trending Video Dataset” (CA) with added `sentiment_score` and `sentiment_label` for each title.[3][1]
- **Stack:** Python (Pandas, NLTK VADER), MySQL, Power BI.

## Data preparation (Python)
- Loaded raw CSV, fixed types for `view_count`, `likes`, `comment_count`, and dates (`publishedAt`, `trending_date`).[4]
- Cleaned text (`title`, `tags`), handled missing values.  
- Created `sentiment_score` (−1 to 1) and `sentiment_label` (Positive/Neutral/Negative) from `title` using VADER.[5][6]
- Exported cleaned file `CA_trending_sql_clean_ascii.csv` for SQL/Power BI.

## SQL analysis (MySQL)
Table: `youtube_trending.CA_trending_sql_clean_ascii`.[2]

Key queries:
- Average views/likes/comments by **categoryId** (most popular genres).[2]
- Top channels by number of trending videos and average views.[7][2]
- Average views and engagement by **sentiment_label** and sentiment distribution within each category.[8]

SQL scripts are stored in the **SQL Queries – YouTube Trending Analytics** folder.

## Power BI dashboards
Power BI connects to MySQL and visualizes:

- **Overview page:**  
  - KPIs (total videos/views/likes).  
  - Top 10 channels.  
  - Bar chart: `categoryId` vs average `view_count` (popular genres).[9][2]

- **Sentiment page:**  
  - Count of videos by `sentiment_label`.  
  - Average views by `sentiment_label`.  
  - Category × sentiment matrix.[8]

- **Time trends page:**  
  - Line chart of `trending_date` vs total/average views with slicers for category and sentiment.[9]

## How to run
1. Clone repo and install Python packages (`pandas`, `nltk`, MySQL driver).  
2. Run the sentiment script to generate the cleaned CSV.  
3. Import `CA_trending_sql_clean_ascii.csv` into a MySQL database `youtube_trending`.  
4. Open the Power BI `.pbix` file and update the MySQL connection to your server.

