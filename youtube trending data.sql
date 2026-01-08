CREATE DATABASE youtube_trending;
USE youtube_trending;
SHOW TABLES;

#Top categories by average views
SELECT categoryId,
       AVG(view_count) AS avg_views,
       AVG(likes)      AS avg_likes
FROM CA_trending_sql_clean_ascii       
GROUP BY categoryId
ORDER BY avg_views DESC;

#Top 10 channels by number of trending videos
SELECT channelTitle,
       COUNT(*) AS trending_videos
FROM CA_trending_sql_clean_ascii
GROUP BY channelTitle
ORDER BY trending_videos DESC
LIMIT 10;

#Videos with highest like‑to‑view ratio (quality engagement)
SELECT video_id, title, channelTitle,
       view_count,
       likes,
       (likes * 1.0 / NULLIF(view_count,0)) AS like_view_ratio
FROM CA_trending_sql_clean_ascii
WHERE view_count > 100000
ORDER BY like_view_ratio DESC
LIMIT 20;

#Average views by sentiment label
SELECT sentiment_label,
       COUNT(*)             AS videos,
       AVG(view_count)      AS avg_views,
       AVG(comment_count)   AS avg_comments
FROM CA_trending_sql_clean_ascii
GROUP BY sentiment_label;

#Sentiment distribution by category
SELECT categoryId,
       sentiment_label,
       COUNT(*) AS videos
FROM CA_trending_sql_clean_ascii
GROUP BY categoryId, sentiment_label
ORDER BY categoryId, sentiment_label;

#Sentiment vs performance
SELECT
    sentiment_label,
    COUNT(*)               AS videos,
    AVG(view_count)        AS avg_views,
    AVG(likes)             AS avg_likes,
    AVG(comment_count)     AS avg_comments
FROM CA_trending_sql_clean_ascii
GROUP BY sentiment_label;










