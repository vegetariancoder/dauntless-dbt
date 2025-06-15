# ⚽ Football Analytics with dbt on Databricks

This project is a **modular analytics pipeline** built using **[dbt](https://www.getdbt.com/)** on **Databricks Lakehouse Platform**, designed to transform raw football data from **bronze to silver to gold** layers. It features robust testing, performance enrichment, and business insights around **players, teams, salaries, match results**, and more.

---

## 📚 Table of Contents

- [Project Structure](#file-folder-structure)
- [Data Sources](#data-sources)
- [Model Architecture](#model-architecture)
  - [Bronze Layer](#bronze-layer)
  - [Silver Layer](#silver-layer)
  - [Gold Layer](#gold-layer)
- [Tests & Validation](#tests--data-quality)
- [Key Metrics Tracked](#key-metrics--kpis)
- [How to Run](#how-to-run)
- [Future Enhancements](#future-enhancements)
- [Requirements](#requirements)
- [License](#license)

---

## 📁 File & Folder Structure


```bash
dbt_football_project/
│
├── models/
│   ├── bronze/                # Clean bronze inputs (stg_*)
│   ├── silver/                 # Business-level joins, cleansed models
│   ├── gold/                   # Analytical models, KPIs, dashboards
│   └── schema.yml              # Tests and descriptions
│
├── tests/                      # Custom SQL data quality tests
├── macros/                     # Custom test macros (if needed)
├── dbt_project.yml             # dbt project config
└── README.md                   # You're here bro 🔥
```


---

## 🌐 Data Sources

Raw data is assumed to be loaded into bronze tables within the Databricks Lakehouse environment:

- \`bronze_player_stats\`
- \`bronze_team_stats\`
- \`bronze_player_possession_stats\`
- \`bronze_team_possession_stats\`
- \`bronze_player_salaries\`
- \`bronze_team_salary\`
- \`bronze_fixtures\`

---

## 🏗️ Model Architecture

### 🥉 Bronze Layer
Raw ingested data from CSV/JSON/S3/DataLake. Tables here reflect the source data schema without transformation. Used via \`source()\` in dbt.

### 🥈 Silver Layer
Cleansed, conformed models created by transforming bronze data. Includes:

- \`silver_player_profile\`: Combines player stats, possession, and salary.
- \`silver_team_profile\`: Aggregates team-level metrics.
- \`silver_match_results\`: Adds match results logic to fixture data.
- \`silver_team_standings_profile\`: Joins team stats with salary for cost-efficiency KPIs.

### 🥇 Gold Layer
Business-level analytical models to power dashboards and reporting:

- \`gold_top_players\`: Top goal+assist contributors.
- \`gold_team_standings\`: Leaderboard of teams based on match results.
- \`gold_salary_vs_performance\`: Measures efficiency of salaries vs. performance metrics.

---

## ✅ Tests & Data Quality

### 🔹 Standard Tests

Implemented via \`schema.yml\`:
- ```not_null```
- ```unique```
- ```accepted_range``` (via [dbt-utils](https://hub.getdbt.com/dbt-labs/dbt_utils/latest/))

### 🔸 Custom Tests

Located in ```tests/``` folder:
- \`test_cost_per_goal_positive.sql\`: Ensure no negative cost-per-goal.
- \`test_salary_range.sql\`: Validate team salaries are within realistic bounds.
- \`test_no_null_metrics.sql\`: Ensure silver layer joins are intact.

Run them using:


```dbt test```


---

## 📊 Key Metrics & KPIs

- **Goals/Assists per player**
- **Progressive passes/carries**
- **Player and team salary efficiency**
- **Match winners and team points**
- **Touches in different zones (defensive/middle/attacking)**

---

## 🛠️ How to Run

### 1. Clone the repo


```git clone https://github.com/yourusername/dbt-football-databricks.git```
```cd dbt-football-databricks```


### 2. Set up dbt profile

Ensure your \`~/.dbt/profiles.yml\` contains your Databricks connection:


```yaml
dbt_football_project:
  outputs:
    dev:
      type: databricks
      catalog: hive_metastore
      schema: analytics
      host: <your-host>
      http_path: <your-http-path>
      token: <your-token>
  target: dev```

### 3. Install dependencies (if using packages)


```dbt deps```


### 4. Run the models


# Run all models
```dbt build```

# Run a specific layer
```dbt run --select silver```
```dbt run --select gold```

# Run tests
```dbt test```

---

## 🔮 Future Enhancements

- Add snapshots for salary changes over time.
- Set up exposures for dashboards and BI tools.
- Add CI/CD pipeline (e.g. GitHub Actions or dbt Cloud).
- Build macros for reusable KPIs and validation rules.
- Automate freshness checks with dbt source freshness.

---

## 🧰 Requirements

- Python 3.7+
- dbt-core
- dbt-databricks adapter
- Access to Databricks workspace and cluster

Install dependencies:


```pip install dbt-databricks```


---

## 📝 License

MIT License. Use freely, attribute fairly.