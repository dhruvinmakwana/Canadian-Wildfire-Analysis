# Canadian Wildfire Analysis
Wildfire occurrence, frequency, and behavior have altered dramatically across time and location, owing primarily to the complex factors of climate change and variation. The annual amount of forest area burned by wildland fires in Canada's northwestern boreal regions increased steadily throughout the second half of the 20th
century. “Climate change during the 21st century is expected to result in more frequent fires in many boreal forests, with severe environmental and economic consequences” [1]. Understanding the future activity of wildfires is a prevalent research topic in academia. To that end, we present an exploratory analysis of historical wildfire activity seen in Canada from 1930 to 2020 using Google’s BigQuery platform and Data Studio. In addition, we apply various Machine Learning approaches to estimate the approximate amount of damage caused by fire based on key indices. 

# Approach
Following demonstration  displays the Extract Transform and Load datapipeline to feed data from various databases to Google's BigQuery Data Platform

![Latest](https://user-images.githubusercontent.com/92114607/166061878-86f97080-fc4e-4269-bfac-cd722b7375b9.png)

https://user-images.githubusercontent.com/92114607/166062100-17af6618-3743-4091-ba20-96ec6bc967db.mp4

To perform exploratory analysis Bigquery project is then connected to DataStudio platform to perform visualization


![595fd57b33924554ba2bde9d10c64269-0001](https://user-images.githubusercontent.com/92114607/166062447-d41eceb7-bdec-4a68-b930-ef6d79b451b3.jpg)


# Results
Next based on the exploratory analysis we drill down on fire activity in alberta and perform predictive analysis to estimate fire sizes in future using various ML models.

Regression Model  | Mean Absolute Error 
--- | --- 
SVM | 0.1552 
Random Forest | 0.1374 
Gradient Boosting | 0.0110 
K-Means | 0.1998

 
