# Key DAX Measures

These are the main DAX measures used (or planned) for the Power BI dashboard. They power the KPIs, charts, and the Strategy Simulator page.

> **Note:** These measures are documented here for reference. Some may have slightly different implementations in the actual PBIX file depending on the data model structure.

---

## Basic Metrics

### Total Customers
```dax
Total Customers = COUNTROWS(customers)
```
Counts all customers in the dataset.

---

### Churned Customers
```dax
Churned Customers = 
CALCULATE(
    COUNTROWS(customers),
    customers[churn] = "Yes"
)
```
Counts customers who have churned.

---

### Churn Rate
```dax
Churn Rate = 
DIVIDE(
    [Churned Customers],
    [Total Customers],
    0
)
```
Percentage of total customers who have churned. Formatted as percentage in the dashboard.

---

### Average Monthly Charges
```dax
Avg Monthly Charges = AVERAGE(customers[monthly_charges])
```
Average monthly charges across all customers (or filtered context).

---

## Revenue Metrics

### Revenue at Risk
```dax
Revenue at Risk = 
SUMX(
    FILTER(customers, customers[risk_segment] = "High Risk"),
    customers[monthly_charges] * 12
)
```
Estimated annual revenue at risk from high-risk customers. Uses a 12-month revenue window.

---

### Total Monthly Revenue
```dax
Total Monthly Revenue = SUM(customers[monthly_charges])
```
Sum of all monthly charges — represents total monthly recurring revenue.

---

## Risk Metrics

### High Risk Customers
```dax
High Risk Customers = 
CALCULATE(
    COUNTROWS(customers),
    customers[risk_segment] = "High Risk"
)
```
Count of customers classified as high risk (churn probability > 0.6).

---

### Average Churn Probability
```dax
Avg Churn Probability = AVERAGE(customers[churn_probability])
```
Average predicted churn probability across filtered customers.

---

## Strategy Simulator Measures

These measures power the Strategy Simulator page. They use assumed input values (which can be adjusted via slicers or parameters in Power BI).

### Estimated Campaign Cost
```dax
Estimated Campaign Cost = 
[High Risk Customers] * [Offer Cost Per Customer]
```
Total cost of running a retention campaign targeting all high-risk customers. `Offer Cost Per Customer` is an assumed input value.

---

### Estimated Revenue Saved
```dax
Estimated Revenue Saved = 
[Revenue at Risk] * [Expected Save Rate]
```
Estimated annual revenue that could be retained if the retention campaign is successful. `Expected Save Rate` is an assumed percentage.

---

### Net Revenue Impact
```dax
Net Revenue Impact = 
[Estimated Revenue Saved] - [Estimated Campaign Cost]
```
The bottom line — if this is positive, the retention campaign is estimated to be worth the investment. If negative, the campaign costs more than it saves.

---

## Notes

- `Offer Cost Per Customer` and `Expected Save Rate` are parameters/assumptions, not calculated from data. They would typically be set up as What-If parameters in Power BI.
- All revenue projections use a simple 12-month window. A more sophisticated approach would use customer lifetime value.
- These measures work within Power BI's filter context, so they update automatically when users apply filters on the dashboard (e.g., filtering by contract type or risk segment).
- Some measure names or exact formulas may differ slightly in the PBIX file. This document captures the logic and intent behind each measure.
