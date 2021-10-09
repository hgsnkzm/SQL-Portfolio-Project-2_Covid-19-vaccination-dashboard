# SQL-Portfolio-Project-2_Covid-19-vaccination-dashboard
## Project Purpose
* Looking at global Covid-19 vaccinations data and comparing those numbers/percentages between countries or continent, and visualizing them. Aiming to show trends or comparison of Covid-19 deaths data.
* Also, comparing the situation of vaccinations of each country and GDP per captita, and finding the correlation between them.

## Tools
This project uses following languages/tools:
* DB Browser for SQLite Version 3.12.2
* Tableau Public

## Data
I used data from [here](https://ourworldindata.org/covid-vaccinations).

### Columns
I mainly used following columns :

* `iso_code` ISO 3166-1 alpha-3 – three-letter country codes
* `continent` Continent of the geographical location
* `location` Geographical location
* `date` Date of observation
* `population` Population in 2020
* `total_vaccinations`	Total number of COVID-19 vaccination doses administered
* `people_vaccinated`	Total number of people who received at least one vaccine dose
* `people_fully_vaccinated`	Total number of people who received all doses prescribed by the vaccination protocol
* `total_boosters`	Total number of COVID-19 vaccination booster doses administered (doses administered beyond the number prescribed by the vaccination protocol)
* `new_vaccinations`	New COVID-19 vaccination doses administered (only calculated for consecutive days
* also, I used the data of countries' gdp per capita as of 2020 from [here](https://data.worldbank.org/indicator/NY.GDP.PCAP.CD?end=2020&most_recent_value_desc=false&start=1960&view=chart)


## Data Visualization
Result Tableau visualization is [here](https://public.tableau.com/views/Covid-19VccinationDashboard/Dashboard1?:language=en-US&:display_count=n&:origin=viz_share_link)
