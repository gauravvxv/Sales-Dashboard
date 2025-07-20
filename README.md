# 📊 SuperStore Sales Dashboard

A data-driven business intelligence project built using **Power BI**, **SQL**, and **Python (SQLAlchemy)** to extract actionable insights from SuperStore sales data. This dashboard helps uncover key business trends and supports data-driven decision-making.

---

## 🚀 Overview

This end-to-end project covers:
- 📥 Importing Excel data into SQL using Python & SQLAlchemy
- 🧾 Writing 26+ SQL queries to analyze sales and profit
- 📊 Building interactive visuals in Power BI
- 💡 Delivering strategic recommendations backed by data

> 🔧 Tools Used: Power BI, PostgreSQL, Python, SQLAlchemy, Pandas

---

## 📁 Project Structure

📦 SuperStore-Sales-Dashboard
│
├── sales.pdf # Final Power BI dashboard export
├── README.md # Project summary (this file)
├── /sql_queries # Folder with 26 custom SQL queries
├── /data_import # Python scripts for Excel → SQL
└── /assets # Dashboard screenshots (optional)


---

## 🔧 Technologies & Stack

| Tool          | Purpose                             |
|---------------|--------------------------------------|
| 💻 Power BI    | Dashboard creation and data visuals  |
| 🐘 PostgreSQL  | SQL queries and data modeling        |
| 🐍 Python      | Data processing and automation       |
| 🔌 SQLAlchemy  | Data migration (Excel → SQL)         |
| 🧮 Pandas      | Data cleaning and transformation     |

---

## 📊 Key Metrics

| Metric           | Value           |
|------------------|-----------------|
| 🧾 Total Orders   | 6,000           |
| 💰 Total Sales    | $1.6 Million    |
| 📈 Total Profit   | $175,000        |
| 🚚 Avg. Ship Days | 4 Days          |

---

## 🧠 Insights & Visualizations

### 🌍 Sales by Region
- 🟦 West – 33% ✅ Highest
- 🟨 East – 29%
- 🟧 Central – 22%
- 🟥 South – 16%

➡️ **Insight**: Focus marketing and inventory on **West** and **East** regions.

---

### 👥 Customer Segment
| Segment      | % of Sales |
|--------------|-------------|
| 🧍 Consumer     | 48% ✅ Dominant
| 🧑‍💼 Corporate    | 33%
| 🏠 Home Office  | 19%

➡️ **Insight**: Prioritize campaigns for the **Consumer** segment.

---

### 📦 Top Product Sub-Categories
| Sub-Category | Sales (approx.) |
|--------------|------------------|
| 📱 Phones       | $200K
| 💺 Chairs       | $180K
| 📚 Binders      | $170K

➡️ **Insight**: Stock and promote **Phones, Chairs, and Binders** for higher revenue.

---

### 🚚 Shipping Modes by Sales
| Mode           | Sales     |
|----------------|-----------|
| 📦 Standard     | $910K ✅
| 📦 Second Class | $310K
| 📦 First Class  | $240K
| 📦 Same Day     | $100K

➡️ **Insight**: Standard shipping is the most used—optimize logistics accordingly.

---

### 💳 Payment Preferences
| Mode     | Share |
|----------|--------|
| 💵 COD      | 42% ✅
| 💻 Online   | 37%
| 💳 Cards    | 22%

➡️ **Insight**: COD is still preferred—encourage digital payments with offers.

---

### 📅 Sales & Profit Trends
- 🔼 **Peaks** in Q4 (Oct–Dec)
- 🔽 **Lows** during April–July
- 📈 Consistent year-over-year patterns

➡️ **Insight**: Align campaigns and inventory for **Q4 seasonal spikes**.

---

## 🧾 SQL & Python Work

- ✅ **26 SQL queries** written for:
  - Sales by region, segment, sub-category
  - Monthly and yearly trend analysis
  - Profit margin, shipping time, customer value

- 🔌 **Excel to SQL Import** with Python:
```python
from sqlalchemy import create_engine
import pandas as pd

df = pd.read_excel("Superstore_Sales.xlsx")
engine = create_engine("postgresql://username:password@localhost/db_name")
df.to_sql("sales_data", engine, if_exists="replace", index=False)

💡 Recommendations
🎯 Focus on West & East regions
🧍 Prioritize the Consumer segment
🛒 Boost Phones, Chairs, and Binders stock
💸 Offer incentives for digital payments
🗓️ Plan major promotions for Q4

✅ Results
✅ Built an interactive dashboard using Power BI
✅ Wrote 26 optimized SQL queries for exploration
✅ Automated Excel-to-SQL pipeline using Python
✅ Delivered business-ready, visual insights

📬 Contact
📩 Feel free to connect and discuss data projects:
LinkedIn: linkedin.com/in/gauravxv
Email: gauravxv0410@gmail

