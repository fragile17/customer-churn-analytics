# Customer Churn Intelligence & Revenue Strategy Platform

An end-to-end business analytics project that analyzes customer churn patterns, identifies high-risk customers, uncovers the main reasons behind churn, and simulates retention strategies with estimated financial impact. Built using Power BI, SQL, Python, and Excel.

---

## Why I Built This

I wanted to build a project that goes beyond just showing charts. The idea was to think like a business analyst — if customers are leaving, which customers should the team focus on first, why are they likely to leave, and what would be the financial impact of retaining them?

Most churn projects stop at "here's the churn rate." I wanted to take it further: prioritize customers by risk and value, understand the drivers, and actually estimate what a retention campaign might cost vs. what it could save. That's what makes this different from a standard dashboard exercise.

---

## Business Problem

Customer churn is one of the biggest problems for subscription and service-based businesses. When customers leave, the company loses recurring revenue — and acquiring new customers is usually much more expensive than keeping existing ones.

But not every customer who might churn needs the same level of attention. Some are high-value and high-risk — those should be the priority. Others might churn but have low revenue impact, so the effort might not be worth it.

**This project helps answer:**
- How many customers are churning, and what's the overall rate?
- Which customer segments have the highest churn?
- What drives churn — is it contract type, tenure, charges, or something else?
- Which customers should the retention team focus on first?
- If we run a retention campaign, what's the estimated cost vs. revenue saved?

---

## Tools Used

| Tool | Purpose |
|------|---------|
| **Python** | Data cleaning, exploratory analysis, churn risk scoring |
| **SQL** | Business-focused analytical queries |
| **Power BI** | Interactive dashboards for stakeholders |
| **Excel/CSV** | Data preparation and storage |

---

## Project Workflow

```
Sample Dataset → Data Cleaning → Exploratory Analysis → SQL Queries → Risk Scoring → Power BI Dashboard → Retention Simulation
```

**Step-by-step:**
1. Created a sample customer dataset with realistic churn patterns
2. Cleaned the data and handled missing values in Python
3. Explored churn patterns across different customer segments
4. Wrote SQL queries to answer specific business questions
5. Built a simple churn risk scoring model using logistic regression
6. Segmented customers into Low / Medium / High risk categories
7. Built a 3-page Power BI dashboard for decision-makers
8. Added a strategy simulator to estimate retention campaign impact

---

## Folder Structure

```
customer-churn-analytics/
│
├── README.md
├── Customer_Churn_Analytics_Dashboard.pbix
│
├── data/
│   ├── raw_customer_churn_sample.csv          ← sample dataset
│   └── processed_churn_scored_customers.csv   ← after risk scoring
│
├── notebooks/
│   └── 01_customer_churn_analysis.ipynb       ← full Python analysis
│
├── sql/
│   └── churn_analysis_queries.sql             ← business SQL queries
│
├── docs/
│   ├── data_dictionary.md
│   ├── business_assumptions.md
│   └── dashboard_walkthrough.md
│
├── dax/
│   └── key_measures.md                        ← Power BI DAX measures
│
├── Images/
│   ├── Executive Dashboard.png
│   ├── Risk Action Center.png
│   └── Strategy Simulator.png
│
├── requirements.txt
└── .gitignore
```

---

## Dashboard Pages

The Power BI dashboard has three pages, each designed for a different audience and purpose.

### 1. Executive Dashboard

![Executive Dashboard](Images/Executive%20Dashboard.png)

This page gives leadership a high-level view of the churn situation:
- Overall churn rate and total customer count
- Total revenue at risk from customers likely to churn
- Churn breakdown by contract type, tenure, and monthly charges
- Helps leadership understand the scale of the problem quickly

**Who uses this:** Senior managers, VPs, anyone who needs the big picture.

---

### 2. Risk Action Center

![Risk Action Center](Images/Risk%20Action%20Center.png)

This page is more operational. It shows:
- A list of high-risk customers ranked by churn probability and revenue at risk
- Filters for contract type, risk segment, and payment method
- Helps the retention team decide which customers to contact first

**Who uses this:** Customer success teams, retention managers, account managers.

---

### 3. Strategy Simulator

![Strategy Simulator](Images/Strategy%20Simulator.png)

This is the most interesting page. It lets users simulate retention scenarios:
- Input assumed offer cost (e.g., discount or incentive)
- Input expected save rate (what % of targeted customers might stay)
- See estimated revenue saved vs. campaign cost
- Understand the net financial impact of a retention campaign

**Important note:** This is a simulation based on assumed values, not actual business results. The numbers help decision-makers think through the financial trade-offs of retention efforts.

**Who uses this:** Strategy teams, finance, anyone evaluating retention campaign ROI.

---

## Key Insights

These are the main patterns I found during analysis:

1. **Month-to-month contract customers churn at a much higher rate** than those on one-year or two-year contracts. This makes sense — there's no commitment keeping them.

2. **Customers with shorter tenure (0–12 months) are more likely to churn.** The early months seem to be a critical period for customer retention.

3. **Higher monthly charges tend to correlate with higher churn risk.** Customers paying more may feel they're not getting enough value, or they may be more price-sensitive.

4. **Fiber optic internet service users show higher churn** compared to DSL or no-internet customers. This could be related to service quality or pricing differences.

5. **Revenue impact matters as much as churn probability.** A customer with 90% churn probability but $20/month revenue is less urgent than one with 60% probability and $100/month.

6. **Electronic check payment users churn more** than those using automatic bank transfers or credit cards. This might indicate less engagement or commitment.

---

## Business Recommendations

Based on the analysis, here are practical actions a business could take:

1. **Focus retention on high-risk, high-value customers first.** Don't treat all at-risk customers the same — prioritize by revenue impact.

2. **Create targeted offers for month-to-month customers** to encourage longer contracts (e.g., discounts for annual commitments).

3. **Pay close attention to customers in their first 12 months.** This is the highest-risk period. Early engagement programs could reduce early churn.

4. **Review pricing for high-charge customers.** If customers paying more are also churning more, there might be a value perception gap.

5. **Encourage automatic payment methods.** Customers on auto-pay tend to stay longer — reducing friction helps retention.

6. **Use the dashboard monthly** to track whether churn trends are improving and whether retention campaigns are having an effect.

---

## Limitations

I think it's important to be upfront about what this project can and can't do:

- **The dataset is synthetic/sample data.** It's designed to be realistic, but it doesn't come from an actual company. All patterns are simulated.
- **The churn probability model is simple.** It uses logistic regression with basic features. A production model would need more data, better features, and more rigorous validation.
- **Retention success rates in the simulator are assumed.** In reality, you'd need to track actual campaign results to know the real save rate.
- **No real-time data.** This is a static analysis. A real implementation would need automated data pipelines and scheduled refreshes.
- **Correlation ≠ causation.** The analysis shows patterns and associations, not definitive causes. For example, higher charges correlating with churn doesn't mean price is the reason — there could be other factors.
- **The financial projections are estimates.** They're useful for thinking through scenarios, but shouldn't be treated as precise forecasts.

---

## What I Learned

Through this project, I learned how to connect data analysis with business decision-making. It's not enough to just find patterns in data — the real value comes from translating those patterns into actions that someone can actually take.

I also understood that a dashboard is only useful when it helps someone decide what to do next. That's why I focused on building pages that serve specific purposes (overview, prioritization, simulation) rather than just cramming in every chart I could think of.

Working through the SQL queries helped me practice framing business questions in a way that data can answer. And building the risk scoring model — even a simple one — showed me how predictive analytics connects to business strategy.

Honestly, the hardest part wasn't the technical work. It was deciding what to include and what to leave out. A good analysis isn't about showing everything — it's about showing what matters.

---

## Future Improvements

If I were to continue building on this project:

- **Real-time data refresh** using automated pipelines
- **Cohort analysis** to track churn trends over time for different customer groups
- **Customer Lifetime Value (CLV)** calculation to better prioritize retention spending
- **More advanced modeling** (random forest, gradient boosting) to improve predictions
- **Campaign performance tracking** to measure whether retention efforts actually worked
- **A Streamlit web app** version for easier sharing without Power BI
- **A/B testing framework** for comparing different retention strategies

---

## How to Use This Repo

1. **Browse the analysis:** Check `notebooks/01_customer_churn_analysis.ipynb` for the full Python analysis
2. **Review SQL queries:** See `sql/churn_analysis_queries.sql` for business-focused queries
3. **Open the dashboard:** Download `Customer_Churn_Analytics_Dashboard.pbix` and open in Power BI Desktop
4. **Read the docs:** Check the `docs/` folder for data dictionary, assumptions, and dashboard walkthrough

### To run the notebook locally:
```bash
pip install -r requirements.txt
jupyter notebook notebooks/01_customer_churn_analysis.ipynb
```

---

*This project was built as a portfolio piece to demonstrate end-to-end business analytics skills. The dataset is synthetic and all business scenarios are simulated for learning purposes.*
