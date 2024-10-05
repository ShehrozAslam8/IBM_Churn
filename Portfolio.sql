CREATE DATABASE telco_churn;

USE telco_churn;

CREATE TABLE telco_churn (
    customer_id VARCHAR(20) PRIMARY KEY,
    number_of_referrals INT,
    tenure_in_months INT,
    offer VARCHAR(50),
    phone_service VARCHAR(10),
    avg_monthly_long_distance_charges DECIMAL(10, 2),
    multiple_lines VARCHAR(10),
    internet_type VARCHAR(50),
    avg_monthly_gb_download DECIMAL(10, 2),
    online_security VARCHAR(10),
    online_backup VARCHAR(10),
    device_protection_plan VARCHAR(10),
    premium_tech_support VARCHAR(10),
    streaming_tv VARCHAR(10),
    streaming_movies VARCHAR(10),
    streaming_music VARCHAR(10),
    unlimited_data VARCHAR(10),
    contract VARCHAR(20),
    paperless_billing VARCHAR(10),
    payment_method VARCHAR(20),
    monthly_charge DECIMAL(10, 2),
    total_charges DECIMAL(10, 2),
    total_refunds DECIMAL(10, 2),
    total_extra_data_charges DECIMAL(10, 2),
    total_long_distance_charges DECIMAL(10, 2),
    total_revenue DECIMAL(10, 2),
    city VARCHAR(50),
    zip_code VARCHAR(10),
    latitude DECIMAL(9, 6),
    longitude DECIMAL(9, 6),
    population INT,
    gender VARCHAR(10),
    age INT,
    married VARCHAR(10),
    number_of_dependents INT,
    satisfaction_score INT,
    customer_status VARCHAR(20),
    churn_label VARCHAR(10),
    churn_score INT,
    cltv INT,
    churn_category VARCHAR(50),
    churn_reason VARCHAR(100)
);

-- Query 1: Considering the top 5 groups with the highest average monthly charges among churned customers, how can personalized offers be tailored based on age, gender, and contract type to potentially improve customer retention rates?

SELECT 
    customer_id, 
    age, 
    gender, 
    contract_type, 
    avg_monthly_charges
FROM 
    telco_churn 
WHERE 
    churn_label = 'Yes' 
ORDER BY 
    avg_monthly_charges DESC 
LIMIT 5;


-- Query 2: What are the feedback or complaints from those churned customers

SELECT 
    feedback, 
    COUNT(*) AS complaint_count 
FROM 
    telco_churn 
WHERE 
    churn_label = 'Yes' 
GROUP BY 
    feedback 
ORDER BY 
    complaint_count DESC;

    
-- Query 3: How does the payment method influence churn behavior?

SELECT 
    payment_method, 
    COUNT(*) AS churn_count, 
    AVG(satisfaction_score) AS avg_satisfaction 
FROM 
    telco_churn 
WHERE 
    churn_label = 'Yes' 
GROUP BY 
    payment_method 
ORDER BY 
    churn_count DESC;

