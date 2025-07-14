-- PASO 1: Crear tabla principal de posteos en redes sociales
CREATE TABLE SocialMediaPosts (
    post_id VARCHAR(50) PRIMARY KEY,
    timestamp DATETIME,
    day_of_week VARCHAR(15),
    platform VARCHAR(20),
    user_id VARCHAR(50),
    language VARCHAR(10),
    text_content TEXT,
    hashtags TEXT,
    mentions TEXT,
    keywords TEXT,
    topic_category VARCHAR(50),
    sentiment_score FLOAT,
    sentiment_label VARCHAR(20),
    emotion_type VARCHAR(30),
    toxicity_score FLOAT,
    likes_count INT,
    shares_count INT,
    comments_count INT,
    impressions INT,
    engagement_rate FLOAT,
    brand_name VARCHAR(50),
    product_name VARCHAR(50),
    campaign_name VARCHAR(50),
    campaign_phase VARCHAR(30),
    user_past_sentiment_avg FLOAT,
    user_engagement_growth FLOAT,
    buzz_change_rate FLOAT,
    city VARCHAR(50),
    country VARCHAR(50),
    interaction_volume INT,
    interaction_rate FLOAT,
    likes_ratio FLOAT,
    comments_ratio FLOAT,
    shares_ratio FLOAT,
    hour_of_day INT,
    month INT,
    is_weekend BIT,
    year INT,
    text_length INT,
    has_hashtags BIT,
    has_mentions BIT,
    num_keywords INT,
    growth_level VARCHAR(20)
);

-- PASO 2: Crear tabla calendario
CREATE TABLE Calendar (
    date DATE PRIMARY KEY,
    year INT,
    month INT,
    month_name VARCHAR(15),
    day INT,
    day_of_week_name VARCHAR(15),
    day_of_week_num INT,
    is_weekend BIT,
    quarter INT,
    year_month VARCHAR(7),
    month_abbr VARCHAR(3)
);

-- PASO 3: Este paso se realizó en Python → insertar datos en la tabla Calendar y SocialMediaPosts

-- PASO 4: Asignar abreviaciones de meses en español en la tabla Calendar
UPDATE Calendar
SET month_abbr = CASE month
    WHEN 1 THEN 'ENE'
    WHEN 2 THEN 'FEB'
    WHEN 3 THEN 'MAR'
    WHEN 4 THEN 'ABR'
    WHEN 5 THEN 'MAY'
    WHEN 6 THEN 'JUN'
    WHEN 7 THEN 'JUL'
    WHEN 8 THEN 'AGO'
    WHEN 9 THEN 'SEP'
    WHEN 10 THEN 'OCT'
    WHEN 11 THEN 'NOV'
    WHEN 12 THEN 'DIC'
END;

-- PASO 5: Agregar columna post_date para vincular con el calendario
ALTER TABLE SocialMediaPosts
ADD post_date DATE;

-- PASO 6: Poblar la nueva columna post_date (extrayendo solo la fecha del timestamp)
UPDATE SocialMediaPosts
SET post_date = CAST(timestamp AS DATE);

-- PASO 7: Crear clave foránea entre SocialMediaPosts y Calendar
ALTER TABLE SocialMediaPosts
ADD CONSTRAINT FK_Posts_Calendar
FOREIGN KEY (post_date)
REFERENCES Calendar(date);