# Ukraine Electricity Trade Partners

## Project overview

This project analyzes Ukraine’s electricity imports and exports by partner country and year. SQL was used to prepare and aggregate the data, and Tableau was used to build the dashboard.

## Business question

Who are Ukraine’s main electricity trade partners: which countries supplied the largest import volumes, which countries received the largest export volumes, and how did these flows change over time?

## Dashboard

The dashboard includes:
- Import and export volumes by partner country
- Annual import and export volumes
- A heatmap of trade volumes by country and year

https://public.tableau.com/app/profile/olena.vystavna/viz/-20192026/-20192026

## Data

- **Source:** https://energy-map.info/uk/datasets/56df70b0-6bc1-4c7d-a82f-284cf723438d#description
- **Note:** 2019 and 2026 contain partial-year data and should not be compared directly with full years.

## Methodology

1. Checked and prepared the raw trade data in PostgreSQL.
2. Standardized country names for consistent grouping.
3. Aggregated trade volumes by country, trade direction, and year.
4. Exported the result to CSV for Tableau.

## Tools

- PostgreSQL
- SQL
- Tableau

## Repository structure

- `data/raw/` — raw input data
- `data/processed/` — aggregated data used by Tableau
- `sql/` — data checks, preparation, and aggregation scripts
- `dashboard/` — Tableau workbook
