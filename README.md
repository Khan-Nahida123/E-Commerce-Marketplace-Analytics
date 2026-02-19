\# SQL E-Commerce Marketplace Analytics



End-to-end SQL analytics project using a real-world e-commerce dataset.



This project analyzes the Brazilian Olist marketplace dataset to uncover

insights about customer behavior, revenue patterns, seller performance,

and logistics efficiency using structured SQL queries.



---



\## Project Objective



The goal of this project is to simulate how data analysts work in a

production environment by:



\- designing a relational database

\- cleaning raw data

\- writing analytical SQL queries

\- extracting business insights

\- presenting results in a structured report



This mirrors real marketplace analytics workflows.



---



\## Dataset



Source: Brazilian Olist E-Commerce Dataset (Kaggle)



The dataset represents a multi-vendor online marketplace with real

transactional behavior.



Tables used:



\- customers

\- orders

\- order\_items

\- products

\- sellers

\- payments

\- reviews

\- geolocation

\- category\_translation



The data was cleaned using Python and imported into MySQL for analysis.



---



\## Database Design



The schema follows a normalized relational structure.



Core transaction flow:



customers → orders → order\_items



Supporting analytical tables:



\- payments (transaction behavior)

\- reviews (customer satisfaction)

\- sellers (marketplace supply)

\- products (catalog metadata)

\- geolocation (regional analysis)



Foreign keys maintain integrity and enable complex joins.



ER diagram included in the reports folder.



---



\## Key Business Questions



The analysis answers practical marketplace questions:



\- Who are the highest spending customers?

\- Which cities generate the most revenue?

\- How efficient is delivery performance?

\- Which sellers drive marketplace growth?

\- How does delivery speed impact ratings?

\- Is revenue concentrated among a few buyers?

\- Are customers repeating purchases?



---



\## Major Insights



\- Revenue is concentrated among a small group of customers

\- Major cities dominate total platform revenue

\- Marketplace activity is driven by top sellers

\- Slow delivery correlates with lower review scores

\- Most customers purchase only once (low retention)

\- Logistics performance varies significantly by region



---



\## SQL Skills Demonstrated



\- Complex multi-table joins

\- Aggregations and GROUP BY

\- Subqueries

\- Window functions

\- Ranking logic

\- Running totals

\- Business KPI analysis

\- Relational modeling



Total analytical queries: \*\*50\*\*



---



\## Tools Used



\- MySQL

\- SQL

\- Python

\- Jupyter Notebook



---



\## Project Structure



```

sql-ecommerce-analytics/

│

├── data/

│   ├── raw/

│   └── cleaned/

│

├── notebooks/

│   └── data\_cleaning.ipynb

│

├── sql/

│   ├── schema.sql

│   ├── cleaning.sql

│   ├── import\_data.sql

│   └── analysis\_queries.sql

│

├── reports/

│   ├── insights.md

│   ├── er\_diagram.png

│   └── final\_summary.pdf

│

├── README.md

└── requirements.txt

```



---



\## Conclusion



This project demonstrates practical SQL analytics applied to a

real-world marketplace dataset.



It showcases the ability to:



\- model relational databases

\- answer business questions with SQL

\- interpret results into insights

\- present analytical findings professionally



Designed for entry-level data analyst and SQL analytics roles.



---



\## Author



Khan Nahida



End-to-end data analytics portfolio project.



