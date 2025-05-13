# DASHBOARD PERFORMANCE ANALYTICS OF KIMIA FARMA:  BUSINESS INSIGHTS (2020-2023)
<p align="center">
    <img src="https://github.com/user-attachments/assets/afb56b3e-8904-4361-a32b-799d2a483b25" width="500">
    <img src="https://github.com/user-attachments/assets/a0453bbc-9dd7-43f9-a393-0a158d3c5315" width="500">
</p>

Kimia Farma is the first pharmaceutical industry company in Indonesia, founded by the Dutch East Indies government in 1817. Initially, the company's name was NV Chemicalien Handle Rathkamp & Co. Based on the nationalization policy of former Dutch companies in the early years of independence, in 1958, the Government of the Republic of Indonesia merged several pharmaceutical companies into PNF (Perusahaan Negara Farmasi) Bhinneka Kimia Farma. Then, on August 16, 1971, the legal status of PNF was changed to a limited liability company (Perseroan Terbatas), and the company's name was changed to PT Kimia Farma (Persero).

## Problem Statement 

A lack of centralized, data-driven insights makes it challenging for decision-makers to identify growth opportunities, optimize branch performance, and enhance product strategy.
By leveraging data analytics and visualization, this dashboard will enable Kimia Farma to detect sales trends, assess regional strengths and weaknesses, and uncover emerging opportunities for sustainable business growth.

## Goal
This project aims to develop a comprehensive interactive dashboard that visualizes key performance indicators (KPIs)—including total sales, regional performance, product category trends, and quarterly growth patterns—to evaluate business performance from 2020 to 2023. The objective is to provide business leaders with actionable insights to enhance strategic planning, optimize resource allocation, and strengthen market positioning in 2024.

## Data Gathering
The dataset is obtained from Kimia Farma's internal data, sourced from four .csv files. It records sales transaction details, including customer information, products, pricing, discounts, and ratings.
The four available files were selected for analysis and imported to Google BigQuery using SQL for data preparation and dashboarding. The files include:
```bash
kf_final_transaction.csv
kf_inventory.csv
kf_kantor_cabang.csv
kf_product.csv
```
Only relevant columns were retained, and necessary merges were performed to consolidate the data into a single .csv file.
Additional computed columns include:
persentase_gross_laba: The expected profit percentage based on the product price:
- Price ≤ Rp 50,000 → 10% profit
- Price > Rp 50,000 - 100,000 → 15% profit
- Price > Rp 100,000 - 300,000 → 20% profit
- Price > Rp 300,000 - 500,000 → 25% profit
- Price > Rp 500,000 → 30% profit
- nett_sales: The final price after applying discounts.
- nett_profit: The profit earned by Kimia Farma.

SQL query for data cleaning and formatting is in 
```bash
rakamin_KF_analysis.sql
```
or kindly click here:
[Performance Analytics Kimia Farma (SQL File)](https://github.com/bintangphylosophie/Performance-Analytics-Kimia-Farma/blob/main/rakamin_KF_analysis.sql)

The dataset is linked to Looker Studio, which supports Google BigQuery, enabling further analysis and visualization for dashboard creation.

## Data Modeling
An Entity Relationship Diagram (ERD) was created to visualize the relationships among all tables and ensure proper data structure for analysis.
<div align="center">
  <img src="https://github.com/user-attachments/assets/7e30c497-c965-458a-9fb7-4717e70d3de6" width="400">
</div>

## Analysis of Data, Insight, Recommendation
The analysis of data, insights, and recommendations can be viewed in the file here:
```bash
Dashboard Performance Analytics of Kimia Farma.pdf
```
or kindly click: 
[Dashboard Performance Analytics of Kimia Farma (PDF)](https://github.com/bintangphylosophie/Performance-Analytics-Kimia-Farma/blob/main/Dashboard%20Performance%20Analytics%20of%20Kimia%20Farma.pdf)

## Dashboard
This link will take you to Looker Studio to view the  Dashboard Performance Analytics of Kimia Farma: Business Insight 2020-2023

[Looker Studio Report](https://lookerstudio.google.com/reporting/746d43b7-ef6e-4bc5-995a-634e0c437a08)
<div align="center">
  <img src="https://github.com/user-attachments/assets/dd28504b-1d8e-4942-80fb-5581f6a4712f" width="600">
</div>
<div align="center">
  <img src="https://github.com/user-attachments/assets/ee7d0a74-90c6-42a4-a618-fe66c632b3c9" width="600">
</div> 
<div align="center">
  <img src="https://github.com/user-attachments/assets/ecae25c5-57d3-4164-a2d2-6afdc69a7cfa" width="600">
</div>

# Thank You
