# Dashboard Walkthrough

This guide explains how to read and use the Power BI dashboard. It's written for someone seeing it for the first time — whether that's a recruiter, hiring manager, or business stakeholder.

---

## Overview

The dashboard has three pages, each serving a different purpose:

1. **Executive Dashboard** — The big picture (start here)
2. **Risk Action Center** — Who needs attention
3. **Strategy Simulator** — What happens if we act

The idea is to follow a natural decision-making flow: understand the problem → identify who's at risk → evaluate what to do about it.

---

## Page 1: Executive Dashboard

**Purpose:** Give leadership a quick, clear view of the churn situation.

**What to look at:**

- **Churn Rate card** — Shows the overall percentage of customers who have churned. This is the headline number.
- **Total Customers and Churned Customers** — Basic counts to understand the scale.
- **Revenue at Risk** — The estimated annual revenue that could be lost from at-risk customers. This gets attention because it translates churn into dollars.
- **Churn by Contract Type** — Usually shows that month-to-month customers churn significantly more than those on annual contracts. This is one of the clearest patterns in most churn datasets.
- **Churn by Tenure** — Shows that newer customers (0–12 months) tend to churn more. This suggests the early customer experience is critical.
- **Churn by Monthly Charges** — Higher-paying customers often show higher churn rates, which could mean there's a value perception issue.

**How a recruiter should read this page:** Look at how the metrics are organized. The page answers "how big is the churn problem?" in one view. It's designed for someone who has 2 minutes and needs the key numbers.

---

## Page 2: Risk Action Center

**Purpose:** Help the retention team decide which customers to focus on.

**What to look at:**

- **Customer list sorted by risk** — Shows individual customers ranked by churn probability and revenue at risk. High-risk, high-value customers appear at the top.
- **Risk segment filter** — Lets you filter by Low Risk, Medium Risk, or High Risk to focus on specific groups.
- **Contract type and payment method filters** — Help narrow down the view to specific customer segments.
- **Revenue at risk by segment** — Shows how much potential revenue is at stake for each risk group.

**How a recruiter should read this page:** This page demonstrates the operational side of analytics. It's not just about seeing a chart — it's about giving someone an actionable list of customers to contact. The prioritization logic (risk × value) is the key thing to notice.

**Why this matters:** In a real business, a retention manager would use this page to decide their outreach list for the week. That's the kind of practical impact an analyst should aim for.

---

## Page 3: Strategy Simulator

**Purpose:** Estimate the financial impact of a retention campaign before running it.

**What to look at:**

- **Input sliders/parameters** — You can adjust the assumed retention offer cost and expected save rate. These are "what if" inputs.
- **Estimated Revenue Saved** — Based on the save rate assumption, this shows how much revenue the company might retain.
- **Campaign Cost** — The total cost of offering the retention incentive to all targeted customers.
- **Net Revenue Impact** — Revenue saved minus campaign cost. If this is positive, the campaign is worth considering.

**How a recruiter should read this page:** This page shows the ability to think beyond just data analysis. It demonstrates business thinking — asking "if we do something, what's the financial trade-off?" That's a skill that sets apart a good analyst.

**Important:** The numbers on this page are simulations, not actual results. The save rate and offer cost are assumed values. In a real project, these would come from historical campaign data.

---

## How to Navigate

1. **Start with the Executive Dashboard** to understand the overall churn situation
2. **Move to the Risk Action Center** to see which specific customers or segments need attention
3. **Use the Strategy Simulator** to think through what a retention campaign might look like financially

Each page builds on the previous one. The dashboard tells a story: here's the problem → here's who's affected → here's what we could do about it.

---

## Tips for Reviewers

- **Look at how the data flows** from raw analysis to actionable insights. That's the main thing this project demonstrates.
- **The tool choice matters less than the thinking.** Power BI is the visualization layer, but the real work is in how the problem is framed and how the analysis supports decision-making.
- **Check the docs folder** for data dictionary and business assumptions. These show attention to documentation, which is important in real analyst work.
- **The limitations section in the README is intentional.** Being honest about what a project can and can't do shows maturity and real-world awareness.
