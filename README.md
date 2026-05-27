# 🎮 Video Games Database System
**CSCE 2501 — Fundamentals of Database Systems**
*Prof. Hossam Sharara | Dept. of Computer Science, AUC*

---

## Overview

A full-stack database application for video games released between **2020 and 2025**, built on data crawled from [MobyGames](https://www.mobygames.com). The system allows users to explore games by genre, platform, publisher, developer, and more — and to submit their own ratings.

---

## Project Structure

The project is divided into three milestones:

```
project/
├── milestone1/          # ERD, relational model, SQL schema
│   ├── erd.png
│   ├── relational_model.pdf
│   └── schema.sql
│
├── milestone2/          # Web crawler & database population
│   ├── crawler/
│   │   └── crawler.py
│   ├── dumps/
│   │   └── database_dump.sql
│   └── csv/             # One CSV per table
│
└── milestone3/          # Application layer
    ├── src/             # Application source code
    ├── demo/            # Video demo
    └── dumps/
        └── final_dump.sql
```

---

## Milestones

### Milestone I — Database Design & Implementation
**Deadline:** October 5, 2025 | **Points:** 20

Designed the full database schema to store comprehensive video game information.

**Stored data includes:**
- Game name, release date, platform-specific release dates
- Publishers, developers, genre, pacing, setting
- Business model, media type, maturity rating
- Moby score, critic/player ratings and counts
- Perspective, input devices, interface, and director

**Developer/Publisher data:** name, overview, and website.

**User accounts:** email, username, gender, age, birthdate, country — with the ability to rate games after registering.

**Deliverables:**
- Entity-Relationship Diagram (ERD)
- Relational Model
- SQL transcript (`schema.sql`)

**Tool:** MySQL

---

### Milestone II — Web Crawling & Data Population
**Deadline:** November 2, 2025 | **Points:** 50

Implemented a web crawler targeting MobyGames to collect all video games from 2020–2025.

**Crawl entry point:**
```
https://www.mobygames.com/game/from:2020/until:2025/page:1/
```
Pages are iterated by incrementing the page number until all results are covered.

The crawler parses HTML and extracts all relevant fields for the non-user tables. User tables are populated with sample test data.

> **Note:** The bonus task (extracting publisher/developer country from their overview text) was **not implemented**.

**Deliverables:**
- Crawling script
- Populated MySQL database dump
- CSV files for each table

**Tools:** Python, Scrapy / BeautifulSoup / Selenium (or equivalent)

---

### Milestone III — Application Layer
**Deadline:** November 23, 2025 | **Points:** 30

A client application connected to a remotely hosted MySQL database (e.g., [db4free.net](https://www.db4free.net)).

**Features implemented:**

| # | Feature |
|---|---------|
| 1 | Register a new user |
| 2 | Add a user rating for an existing game |
| 3 | View all ratings for the logged-in user |
| 4 | Top-rated games by critics and players per genre / year |
| 5 | All games for a specific genre / platform / publisher / developer |
| 6 | Top 5 games per genre & setting by Moby Score |
| 7 | Top 5 development companies by critics rating per genre |
| 8 | Dream Game — generate ideal game specs based on player ratings |
| 9 | Top 5 game directors by volume of games |
| 10 | Top 5 director–company collaborations by number of shared projects |
| 11 | Number of games per platform with average critic and player ratings |

> **Note:** The GUI/Web-based bonus (5 extra points) was **not implemented**. The application is command-line based.

**Deliverables:**
- Application source code + executable
- Latest database dump
- Video demo

---

## Setup & Usage

### Prerequisites
- Python 3.x
- MySQL Server
- Required Python packages:

```bash
pip install scrapy beautifulsoup4 selenium mysql-connector-python
```

### 1. Database Setup

```bash
mysql -u <user> -p < milestone1/schema.sql
```

### 2. Run the Crawler

```bash
cd milestone2/crawler
python crawler.py
```

### 3. Load Data into the Database

```bash
mysql -u <user> -p <db_name> < milestone2/dumps/database_dump.sql
```

### 4. Run the Application

```bash
cd milestone3/src
python app.py
```

> Make sure your database connection string points to the **remote hosted database**, not localhost.

---

## Data Source

All game data is sourced from **[MobyGames](https://www.mobygames.com)**, covering releases from **2020 to 2025**.

---

## Course Info

| Field | Details |
|-------|---------|
| Course | CSCE 2501 — Fundamentals of Database Systems |
| Instructor | Prof. Hossam Sharara |
| Department | Computer Science, AUC |
| Semester | Fall 2025 |
