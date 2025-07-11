-- PASO 8: Análisis exploratorio de los datos (EDA)
-- 8.1 Ver primeros 10 registros
SELECT TOP 10 * FROM dbo.SocialMediaPosts;

-- 8.2 Engagement medio por plataforma y día
SELECT platform, day_of_week, AVG(engagement_rate) AS avg_engagement
FROM dbo.SocialMediaPosts
GROUP BY platform, day_of_week
ORDER BY avg_engagement DESC;

-- 8.3 Top categorías de contenido más efectivas
SELECT topic_category, AVG(engagement_rate) AS avg_engagement
FROM dbo.SocialMediaPosts
GROUP BY topic_category
ORDER BY avg_engagement DESC;

-- 8.4 Correlaciones con texto
SELECT text_length, sentiment_score, likes_count, engagement_rate
FROM dbo.SocialMediaPosts
WHERE text_length BETWEEN 20 AND 300;

-- 8.5 Emociones vs engagement
SELECT emotion_type, COUNT(*) AS posts, AVG(engagement_rate) AS avg_engagement
FROM dbo.SocialMediaPosts
GROUP BY emotion_type
ORDER BY avg_engagement DESC;

-- 8.6 Análisis temporal: engagement por año y mes
SELECT year, month, AVG(engagement_rate) AS avg_engagement
FROM dbo.SocialMediaPosts
GROUP BY year, month
ORDER BY avg_engagement DESC;