# Business Assumptions

This document lists the assumptions used in the analysis and the Strategy Simulator page of the Power BI dashboard. These are important to understand because the financial projections in this project are estimates, not actual business results.

---

## Dataset Assumptions

- **The dataset is synthetic.** It was created to simulate realistic telecom customer churn patterns, but it does not represent any real company or customer base.
- **500 customers** are included in the sample. This is small enough to work with easily but large enough to show meaningful patterns.
- **Churn labels are pre-assigned.** In a real scenario, churn would be determined by actual customer behavior (cancellation, non-renewal, etc.). Here, it's simulated based on statistical patterns.

---

## Churn Model Assumptions

- **The churn probability model is a logistic regression** using basic features: tenure, monthly charges, contract type, internet service, and support tickets.
- **The model is trained on the same dataset it predicts on.** This means the probabilities are useful for ranking customers but should not be treated as precise predictions. In production, you'd use a proper train/test split and cross-validation.
- **Model accuracy is approximate.** The goal here is to demonstrate the workflow (data → model → risk segments → actions), not to achieve state-of-the-art prediction performance.

---

## Risk Segmentation Assumptions

Customers are grouped into three risk segments based on their predicted churn probability:

| Risk Segment | Churn Probability Range | Meaning |
|---|---|---|
| Low Risk | Below 0.3 (30%) | Unlikely to churn in the near term |
| Medium Risk | 0.3 to 0.6 (30%–60%) | Some risk of churning, worth monitoring |
| High Risk | Above 0.6 (60%) | Strong likelihood of churning, should be prioritized |

These thresholds are chosen for simplicity. In practice, the cutoffs would be tuned based on business needs and the cost of intervention vs. the cost of losing a customer.

---

## Strategy Simulator Assumptions

The Strategy Simulator page in Power BI uses these assumed values:

| Assumption | Default Value | Notes |
|---|---|---|
| **Retention offer cost per customer** | ~$50 (assumed) | Cost of a discount, incentive, or outreach per targeted customer |
| **Expected save rate** | ~30% (assumed) | Percentage of targeted customers who actually stay because of the retention effort |
| **Revenue saved calculation** | Monthly charges × 12 × save rate | Estimates annual revenue retained from saved customers |
| **Campaign cost calculation** | Offer cost × number of targeted customers | Total cost of running the retention campaign |
| **Net revenue impact** | Revenue saved − campaign cost | Whether the campaign is financially worth it |

### Important notes:
- These values are **assumptions for simulation purposes only**. They are not based on real campaign data.
- In a real business, the save rate would come from historical campaign performance data.
- The offer cost would depend on the specific retention strategy (discount, free month, upgrade, personal outreach, etc.).
- A real analysis would also consider customer lifetime value (CLV) rather than just 12 months of revenue.

---

## Revenue at Risk Assumptions

- **Revenue at risk** is calculated as: `monthly_charges × 12 × churn_probability`
- This assumes a 12-month revenue horizon. In reality, you might use customer lifetime value instead.
- This metric is meant to help prioritize customers — it's not a precise financial forecast.

---

## General Notes

- This project simulates how an analyst can identify churn risk and estimate the financial impact of retention actions. It does not claim to represent actual business performance.
- All numbers in the Strategy Simulator are estimates. They should be used for directional thinking ("is this worth doing?"), not exact budgeting.
- If this were a real project, every assumption would need to be validated with actual business data and stakeholder input.
