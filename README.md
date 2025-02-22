# ETL Pipeline for Commercial Aircraft Accidents and Incidents

## Goal
The objective of this project is to build an ETL pipeline to scrape, clean, transform, and analyze data from the Wikipedia page listing commercial aircraft accidents and incidents. The final output is structured data stored in SQL format and visualized via a dashboard.

## Data of Interest
- **Year**
- **Month**
- **Airline**
- **From** (Origin)
- **To** (Destination)

## Steps

### Step 1 - Extract
- Scraped data from [Wikipedia](https://en.wikipedia.org/wiki/List_of_accidents_and_incidents_involving_commercial_aircraft) using Python's `BeautifulSoup` library.
- The page structure was not optimal for direct data extraction:
  - Each year section contained a `<ul>` with multiple `<li>` items.
  - Some `<li>` items were disrupted by images, causing data splits.
- Manually merged split lists to reconstruct the original dataset. While tedious, this was manageable given the dataset's size.

### Step 2 - Transform
- Extracted airline names and locations from the incident details.
- Annotated data to tag all airline occurrences.
- Built a **custom Named Entity Recognition (NER) pipeline** for better data extraction.
- Extracted crash sites from incident descriptions.

#### Approaches:
1. **Regex Matching**: Identified frequently occurring phrases related to locations.
2. **NER-based Extraction**: Used entity tags such as `GPE` (Geopolitical Entity), `LOC` (Location), and `FAC` (Facility).
3. **POS-based Pattern Matching**:
   - Used linguistic patterns commonly found in crash descriptions.
   - Example pattern: `VERB -> PREPOSITION -> NOUN/PROPER NOUN -> PREPOSITION -> PROPER NOUN`
   - Example phrase: "Crashed in the *Pacific Ocean*".

#### Challenges:
- Extracting crash sites required extensive cleaning, leading to the decision to omit them.
- An alternative approach could be implementing another **custom NER pipeline** for improved accuracy.

### Step 3 - Load
- Stored structured data in dictionaries and 2D lists.
- Loaded the data into a **Pandas DataFrame**.
- Exported data into **SQL** and **CSV** formats.

### Step 4 - Analysis
- Given the dataset size, analysis was limited but insightful.
- Executed SQL queries for insights.
- Created a **dashboard using Google Looker Studio** for visualization.

## Technologies Used
- **Python** (BeautifulSoup, Pandas, Regex, NLTK, SpaCy)
- **SQL** (for structured storage and querying)
- **Google Looker Studio** (for visualization)

## Future Improvements
- Automating the merging process to handle dynamically structured HTML.
- Expanding the NER model to improve accuracy in extracting crash site locations.
- Exploring alternative visualization tools like Tableau or Power BI for enhanced analytics.

---
🚀 **This project demonstrates a complete ETL workflow, from raw web data to structured insights.**

