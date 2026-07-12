# Data Dictionary

This document describes each column in the customer churn dataset. The dataset is synthetic (sample data) created to simulate realistic telecom customer churn patterns.

---

## Raw Dataset Columns

These columns are present in `data/raw_customer_churn_sample.csv`:

| Column | Data Type | Description |
|--------|-----------|-------------|
| `customer_id` | String | Unique identifier for each customer (e.g., CUST-0001) |
| `gender` | String | Customer's gender — Male or Female |
| `senior_citizen` | Integer | Whether the customer is a senior citizen — 0 (No) or 1 (Yes) |
| `tenure_months` | Integer | Number of months the customer has been with the company |
| `contract_type` | String | Type of contract — Month-to-month, One year, or Two year |
| `payment_method` | String | How the customer pays — Electronic check, Mailed check, Bank transfer (automatic), Credit card (automatic) |
| `monthly_charges` | Float | Amount charged to the customer each month (in dollars) |
| `total_charges` | Float | Total amount the customer has been charged over their entire tenure |
| `internet_service` | String | Type of internet service — DSL, Fiber optic, or No |
| `support_tickets` | Integer | Number of customer support tickets filed by the customer |
| `paperless_billing` | String | Whether the customer uses paperless billing — Yes or No |
| `churn` | String | Whether the customer has churned (left) — Yes or No |

---

## Processed Dataset Columns

These additional columns are in `data/processed_churn_scored_customers.csv`, created during the Python analysis:

| Column | Data Type | Description |
|--------|-----------|-------------|
| `churn_numeric` | Integer | Numeric version of churn — 1 (Yes) or 0 (No). Used for modeling. |
| `tenure_group` | String | Tenure grouped into categories — 0-6 months, 7-12 months, 13-24 months, 25-48 months, 49+ months |
| `charge_per_month_tenure` | Float | Monthly charges divided by tenure (shows average spend intensity). Set to monthly_charges for customers with 0 tenure. |
| `churn_probability` | Float | Predicted probability of churn from logistic regression model (0.0 to 1.0) |
| `risk_segment` | String | Customer risk category based on churn probability — Low Risk (< 0.3), Medium Risk (0.3–0.6), High Risk (> 0.6) |
| `revenue_at_risk` | Float | Estimated annual revenue at risk for the customer. Calculated as monthly_charges × 12 × churn_probability. |

---

## Notes

- The raw dataset has 500 rows (customers). This is a small sample meant for demonstration.
- All data is synthetic — it doesn't represent any real company or customer base.
- `total_charges` is calculated as approximately `monthly_charges × tenure_months`, with some small random variation added to make it more realistic.
- `churn_probability` comes from a logistic regression model trained on this dataset. Since the model is trained and predicted on the same data (small sample), the probabilities should be taken as approximate, not production-quality predictions.
- `revenue_at_risk` is a simple estimate. In practice, you'd want to factor in customer lifetime value and discount rates.
