# Weather vs. Flights Project

It's project time again :tada:!  
In this project you will combine your Python, SQL, API and dbt skills and use them in combination with each other.  



## Objectives
As we have learned, the two main tools of Data Analysts are SQL and Python. In the last lectures and exercises, you have learned 

- how to use SQL
- retrieve data from an API and import it into a database
- transform it into insightful tables
- and get data from a database into a pandas dataframe

And now you should do it all together.




## Task Briefing
The Research Center for Aerospace (RCA) where you work for as Data Analyst wants to keep track of accumulated flights data in combination with weather data. Your task is to find a situation where the weather has impacted flight performance and use this to contribute some knowledge about how different weather affects flights in different cities.

![](images/PIREPs-featured.jpg)  



### Setting-up working environment

1. One team member can fork this repository to their GitHub

2. The owner then adds the team members to the repository as collaborators

3. All team members can clone the repository from the owner to local

4. Organize your repo with folders, notebooks and sql files

5. Check your .gitignore in order to avoid pushing credentials to GitHub. 

   

6. For the dbt repo you would need to create a separate GitHub repository. One owner, other team members collaborate. 

7. Prioritize using branches and pull requests reviewed by other team members, so the `main` remains the "source of truth"

8. Additionally to that members can create fork of the dbt project repo to their GitHub.  
   **BUT DO NOT CLONE THE FORKED REPO TO LOCAL.** We only work in the original dbt repo (see 6. and 7.) 
   
   **Make sure to synchronize your fork with the original before running any dbt models!**

9.  Each team will get a new project schema in our DB. Members will have write and read rights. (fingers crossed!)

10. (experimental) Each team member could use their own dbt Cloud to connect to the (hopefully synchronized) fork repos and to the project database schema. 

    

### Task steps
1. Select a historical weather event that occurred in the United States within the past 30 years that you believe would have led to the cancellation of flights. Research online. Based on the time period when the weather event occurred, determine which timeframe for flight data would best reflect both regular traffic and the associated irregularities.  

2. Retrieve flight data as described in [fligths_data_wrangling.ipynb](fligths_data_wrangling.ipynb) and import it into the PostgreSQL database:  
     **a.** download the CSV file containing flights data for the specific years and months you need from the [Bureau of Transportation Statistics website](https://transtats.bts.gov).      
     **b.** Clean your data (e.g. specify which columns you want to keep, rename columns etc.).  
     **c.** (**not yet in the notebook!**) Reduce your dataframe to include 3-5 origin airports (check if they have weather stations here: https://meteostat.net/en/). You can expand your dataset to include more locations or destinations if this is helpful in your analysis. But keep an eye on the size of your data. Dealing with GBs of raw data can make everything very slow.    
     **d.** (**not yet in the notebook!**) Connect to database and import the flights data as a table in the project schema.

     **e.** From the `airports` table in schema `public` filter the relevant airports and use the result set to create a new table in your project schema. 

3. As next step, get historical weather data using the [Meteostat API](https://dev.meteostat.net/api/point/daily.html#endpoint).   
     Based on the notebooks from our API lectures `meteostat_daily_fromAPI_toDB_lecture.ipynb`  and  `meteostat_hourly_fromAPI_toDB_lecture.ipynb` develop a new notebook to make API Calls to retrieve the necessary data, and to push it to the project schema in our database. Up to you whether you want to use API endpoints for hourly or daily weather.

4. Using dbt Cloud transform the original data to insightful tables which will allow you to visualize flight events and weather changes over time, to summarize useful statistics  in (e.g. to compare regular flight traffic averages with the metrics during the weather extremes)

5. In a Jupyter Notebook use SQLAlchemy to retrieve data from database tables and store it in pandas DataFrames.

6. With pandas you have multiple options:

     **a.** Perform a basic EDA on the initial data (prep or staging tables). The EDA should reflect what data is your project based on.
     **b.** Come up with three different hypotheses regarding your available data. You could ask questions like 

     - "Can we see the weather event in the weather data?" 
     - "Can we see the weather event in the flights data?"
     - "Can we see a correlation between the data?"
     - "Can we see anything unusual? Any anomalies?"
     - ...

   	**c.** Go deeper into your hypotheses (perhaps linking dep_delay to weather) and clearly outline your findings (either that everything is as expected or any unexpected 
	   results).  

​	   **d.** create visualizations reflecting your findings. (doesn't need to be many. Sometimes 1 or 2 charts are very insightful.)



### Deliverables
1. Jupyter notebook containing the loading and the cleaning of the flights data and the data import into the database.
2. Jupyter notebook with calls to the meteostat API and the data import into the database.
3. Jupyter notebook with EDA of weather data and flight traffic. Investigate and analyze the relationship between a specific weather event (which you’ll define) and any irregularities in flight traffic. Be sure to include relevant visualizations to support your findings.
4. ~10-minutes technical presentation (eg. via google slides) to your colleagues, presenting the results of your data exploration and answering your hypotheses.



**Keep in mind that your API calls are limited!**  
**When possible, separate code calling the API from other code working on the data.**
