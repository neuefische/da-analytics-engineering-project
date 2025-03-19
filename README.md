<center><h2> Project <br><h1>Weather and Flights with SQL, an API and DBT</center>

It's project time again!  
In this project you will combine your Python, SQL, API and dbt skills and use them in combination with each other.  

## Objectives
As we have learned, the two main tools of Data Analysts are SQL and Python. In the last lectures and exercises, you have learned 

- how to use SQL
- retrieve data from an API and import it into a database
- transform it into insightful tables
- and get data from a database into a pandas dataframe

And now you should do it all together.


## Scenario Briefing
We want you as a Data Analyst to keep track of accumulated flights data in combination with weather data. 

Your task is to find a situation where the weather conditions have impacted flight performance and provide insights on how different weather conditions affect flights in various cities / airports.

## What you need

- a weather event in the US and the **time period** for data
- **flight data** for the time period and affected airports
- **weather data** for the time period and for the weather stations at the affected airports

![](images/PIREPs-featured.jpg)  

## Setting-up working environment

- In our Database, you will work in your own schema - as done previously

​	**Create a new project GitHub repository from scratch**

#### This repo will contain two things:
- Python: retrieving the data from sources and loading it to the database via Jupyter notebooks, as seen during the analytics engineering lectures
- dbt: initialise the repo as a new dbt project repository, so it will also hold the dbt project files (yml files, sql model files etc.)  
  
So, it will store all your development, experiments, analysis and visualizations. Organize your repo with folders, notebooks and sql files.
4. Check your `.gitignore` in order to avoid pushing credentials to GitHub. 

## Task Steps in Detail
1. Select a historical weather event that occurred in the United States within the past 30 years that you believe would have led to the cancellation of flights. Research online. Based on the time period when the weather event occurred, determine which timeframe for flight data would best reflect both regular traffic and the associated irregularities.  

2. Retrieve flight data as described in [fligths_data_wrangling.ipynb](fligths_data_wrangling.ipynb) and import it into the PostgreSQL database:  
     **a.** **`To Do:`** specify period  
     **b.** download and clean data `(pre-coded)`  
     **c.** **`To Do:`** Reduce your dataframe to include 3-5 origin airports (check if they have weather stations here: https://meteostat.net/en/)  
     **d.** **`To Do:`** Connect to database and import the flights data as a table in your schema.

     **e.** From the `airports` table in schema `public` filter the relevant airports and use the result set to create a new table in your schema. (or you copy the whole `airports` table)

3. As next step, get historical weather data using the [Meteostat API](https://dev.meteostat.net/api/point/daily.html#endpoint).   
     Based on the notebooks from our API lectures `meteostat_daily_fromAPI_toDB_lecture.ipynb`  and  `meteostat_hourly_fromAPI_toDB_lecture.ipynb` develop **new notebook(s)** to make API Calls to retrieve the necessary data, and to push it to your schema in our database. Up to you whether you want to use API endpoints for hourly or daily weather.  
     💡**Hint:** if the period you selected for the weather event is only a few days long, go for the **hourly data**. It gives you more granularity.

4. Using **dbt** transform the original data to insightful tables which will allow you to visualize flight events and weather changes over time, to summarize useful statistics in (e.g. to compare regular flight traffic averages with the metrics during the weather extremes)  
   💡**Hint:** actually you can use the existing yml files and staging prep models from our lecture. You might need to update the raw table names if you named them differently. 

5. In a Jupyter notebook, use SQLAlchemy to retrieve data from database tables and store it in pandas DataFrames.

6. With pandas you have multiple options:

     **a.** Perform a basic EDA on the data.  
     **b.** Come up with three different hypotheses regarding your available data. You could ask questions like 

     - "Can we see the weather event in the weather data?" 
     - "Can we see the weather event in the flights data?"
     - "Can we see a correlation between the data?"
     - "Can we see anything unusual? Any anomalies?"
     - ...

     **c.** Go deeper into your hypotheses (perhaps linking dep_delay to weather) and clearly outline your findings (either that everything is as expected or any unexpected results).  
     
     **d.** create visualizations reflecting your findings. (doesn't need to be many. Sometimes 1 or 2 charts are very insightful.)


### Deliverables
1. Jupyter notebook containing the loading and the cleaning of the flights data and the data import into the database.
2. Jupyter notebook with calls to the meteostat API and the data import into the database.
4. Jupyter notebook with EDA of weather data and flight traffic. Investigate and analyze the relationship between a specific weather event (which you’ll define) and any irregularities in flight traffic. Be sure to include relevant visualizations to support your findings.
5. max(!) ~10-minutes technical presentation (eg. via google slides) to your colleagues, presenting the results of your data exploration and answering your hypotheses.

**Keep in mind that your API calls are limited!**  
**When possible, separate code calling the API from other code working on the data.**
