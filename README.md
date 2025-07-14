# final-project-books
Project Title:
Children’s Book Trends & Market Insights — A Pathway to Inclusive Publishing
This project analyzes a dataset of 1,200 children's books to uncover key trends in pricing, ratings, age targeting, and bestseller categories. 
The goal is to draw insights that can guide the development of culturally inclusive educational materials — such as Amharic books and puzzles — for the Ethiopian community.

•	Using Python and Tableau, we explore which age groups are most targeted, 
•	what types of books are bestsellers,
•	how pricing correlates with customer satisfaction, and 
•	What opportunities exist for underrepresented voices in the children's book market?
# Re-create the README markdown file after kernel reset
readme_content = """
# 📘 Children's Book Market Analysis – Final Project

## 📌 Project Overview
This project analyzes a dataset of children's books using SQL, Tableau, and Excel to uncover insights on ratings, pricing, publication trends, and author performance. It answers key business questions relevant to publishers, authors, and educators interested in understanding what makes a children's book successful.

---

## 🎯 Business Question
**What factors influence the popularity and quality of children’s books, and how can publishers optimize content by age, format, pricing, and authorship?**

---

## 📁 Data Sources
- `final_dashboard_data_for_tableau.xlsx` (Includes cleaned and summarized sheets)
  - Age Group Summary
  - Series vs Standalone
  - Publication Trend
  - Price Distribution
  - Rating Distribution
  - Missing Ratings
  - Top Authors

---

## 🛠 Tools Used
- SQL (MySQL) – data cleaning, aggregation, and exploration
- Python (Pandas) – mock data simulation and export
- Tableau – interactive dashboard and story building

---

## 📊 Dashboard Structure

### 🔝 Top KPIs
- Total Books
- Average Rating
- % Bestsellers (optional)

### 📘 Story 1: Age Group Focus
- Most books target ages 6–8 and 9–12
- These groups have the highest average ratings

### 📙 Story 2: Series vs Standalone
- Series books are more popular and better rated
- Series make up 45%+ of the dataset

### 📈 Story 3: Publication Trend
- Publishing increased during 2019–2021
- Ratings remained stable (avg ~4.2–4.4)

### 💵 Story 4: Price Distribution
- $5–$10 is the sweet spot for price and quality

### ⭐ Story 5: Rating Distribution
- Most books are highly rated (4.0–5.0)

### 👩‍💼 Story 6: Top Authors
- Mo Willems, Dr. Seuss, and others dominate volume and quality

### ⚠️ Story 7: Missing Ratings
- Very low number of missing values → clean dataset

---

## 📈 Tableau Dashboard
- Includes filters by age group, author, and year
- Uses bar charts, pie charts, dual-axis lines, and KPI tiles
- Presented as a story with 7 visual insights

---

## ✅ Key Insights
- Focus on ages 6–12 for best engagement
- Series books build loyalty and ratings
- Optimal pricing: $5–$10
- Top authors drive both volume and quality

---

## 🧾 Recommendation
Publishers should:
- Prioritize middle-grade readers (6–12)
- Consider producing books in series
- Price books between $5–$10
- Analyze successful authors for content strategy

---

## 👩‍💻 Author
Final project by Hilena Tadesse – Ironhack Data Analytics Bootcamp

"""

readme_path = "/mnt/data/README_Children_Book_Analysis.md"
with open(readme_path, "w", encoding="utf-8") as f:
    f.write(readme_content)

readme_path
