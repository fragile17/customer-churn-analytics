-- =============================================================================
-- Customer Churn Analysis - SQL Queries
-- =============================================================================
-- These queries are designed to answer common business questions about customer
-- churn. They work with SQLite or PostgreSQL syntax.
--
-- Table assumed: customers
-- Dataset: sample/synthetic customer churn data
-- =============================================================================


-- -----------------------------------------------------------------------------
-- 1. How many total customers do we have?
-- Basic count to understand the size of the customer base.
-- -----------------------------------------------------------------------------

SELECT COUNT(*) AS total_customers
FROM customers;


-- -----------------------------------------------------------------------------
-- 2. What is the overall churn rate?
-- This tells us what percentage of customers have churned.
-- A churn rate above 25-30% is generally considered high for telecom.
-- -----------------------------------------------------------------------------

SELECT 
    COUNT(*) AS total_customers,
    SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        SUM(CASE WHEN churn = 'Yes' THEN 1.0 ELSE 0.0 END) / COUNT(*) * 100, 
        2
    ) AS churn_rate_pct
FROM customers;


-- -----------------------------------------------------------------------------
-- 3. What is the churn rate by contract type?
-- Month-to-month customers typically churn more since there's no commitment.
-- This helps us see if contract type is a strong churn driver.
-- -----------------------------------------------------------------------------

SELECT 
    contract_type,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) AS churned,
    ROUND(
        SUM(CASE WHEN churn = 'Yes' THEN 1.0 ELSE 0.0 END) / COUNT(*) * 100, 
        2
    ) AS churn_rate_pct
FROM customers
GROUP BY contract_type
ORDER BY churn_rate_pct DESC;


-- -----------------------------------------------------------------------------
-- 4. What is the churn rate by tenure group?
-- Grouping customers by how long they've been with us helps identify
-- which tenure ranges are most at risk. New customers often churn more.
-- -----------------------------------------------------------------------------

SELECT 
    CASE 
        WHEN tenure_months <= 6 THEN '0-6 months'
        WHEN tenure_months <= 12 THEN '7-12 months'
        WHEN tenure_months <= 24 THEN '13-24 months'
        WHEN tenure_months <= 48 THEN '25-48 months'
        ELSE '49+ months'
    END AS tenure_group,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) AS churned,
    ROUND(
        SUM(CASE WHEN churn = 'Yes' THEN 1.0 ELSE 0.0 END) / COUNT(*) * 100, 
        2
    ) AS churn_rate_pct
FROM customers
GROUP BY 
    CASE 
        WHEN tenure_months <= 6 THEN '0-6 months'
        WHEN tenure_months <= 12 THEN '7-12 months'
        WHEN tenure_months <= 24 THEN '13-24 months'
        WHEN tenure_months <= 48 THEN '25-48 months'
        ELSE '49+ months'
    END
ORDER BY churn_rate_pct DESC;


-- -----------------------------------------------------------------------------
-- 5. What is the churn rate by payment method?
-- Some payment methods (like electronic check) may correlate with higher churn.
-- Customers who set up auto-pay might be more committed.
-- -----------------------------------------------------------------------------

SELECT 
    payment_method,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) AS churned,
    ROUND(
        SUM(CASE WHEN churn = 'Yes' THEN 1.0 ELSE 0.0 END) / COUNT(*) * 100, 
        2
    ) AS churn_rate_pct
FROM customers
GROUP BY payment_method
ORDER BY churn_rate_pct DESC;


-- -----------------------------------------------------------------------------
-- 6. What are the average monthly charges for churned vs. retained customers?
-- If churned customers are paying more on average, there might be a pricing
-- or value perception issue worth investigating.
-- -----------------------------------------------------------------------------

SELECT 
    churn,
    COUNT(*) AS customer_count,
    ROUND(AVG(monthly_charges), 2) AS avg_monthly_charges,
    ROUND(AVG(total_charges), 2) AS avg_total_charges
FROM customers
GROUP BY churn;


-- -----------------------------------------------------------------------------
-- 7. How much revenue is at risk from churned/at-risk customers?
-- This puts a dollar figure on churn, which is important for getting 
-- leadership attention. Revenue at risk = monthly charges * 12 for annual view.
-- -----------------------------------------------------------------------------

SELECT 
    risk_segment,
    COUNT(*) AS customer_count,
    ROUND(SUM(monthly_charges), 2) AS total_monthly_revenue,
    ROUND(SUM(monthly_charges) * 12, 2) AS annual_revenue_at_risk
FROM customers
WHERE churn = 'Yes' OR risk_segment = 'High Risk'
GROUP BY risk_segment
ORDER BY annual_revenue_at_risk DESC;


-- -----------------------------------------------------------------------------
-- 8. Which high-risk customers have the most revenue at risk?
-- This is the "action list" — these are the customers the retention team
-- should contact first. Sorted by revenue impact.
-- -----------------------------------------------------------------------------

SELECT 
    customer_id,
    contract_type,
    tenure_months,
    monthly_charges,
    churn_probability,
    risk_segment,
    ROUND(monthly_charges * 12, 2) AS annual_revenue_at_risk
FROM customers
WHERE risk_segment = 'High Risk'
ORDER BY monthly_charges DESC
LIMIT 20;


-- -----------------------------------------------------------------------------
-- 9. What is the churn rate by internet service type?
-- Fiber optic users sometimes show higher churn — this could be due to
-- higher pricing, service issues, or competitive alternatives.
-- -----------------------------------------------------------------------------

SELECT 
    internet_service,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) AS churned,
    ROUND(
        SUM(CASE WHEN churn = 'Yes' THEN 1.0 ELSE 0.0 END) / COUNT(*) * 100, 
        2
    ) AS churn_rate_pct
FROM customers
GROUP BY internet_service
ORDER BY churn_rate_pct DESC;


-- -----------------------------------------------------------------------------
-- 10. Top customer segments for retention priority
-- Combines contract type and risk segment to find the groups that should
-- get the most attention. Sorted by total revenue at risk.
-- This is the kind of query a business analyst would run to build a
-- retention priority matrix.
-- -----------------------------------------------------------------------------

SELECT 
    contract_type,
    risk_segment,
    COUNT(*) AS customer_count,
    ROUND(AVG(churn_probability), 3) AS avg_churn_probability,
    ROUND(SUM(monthly_charges), 2) AS total_monthly_charges,
    ROUND(SUM(monthly_charges) * 12, 2) AS annual_revenue_at_risk
FROM customers
GROUP BY contract_type, risk_segment
ORDER BY annual_revenue_at_risk DESC;
