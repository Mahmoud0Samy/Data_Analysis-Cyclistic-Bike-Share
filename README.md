# Cyclistic Bike-Share Data Analysis Project
Welcome to the Cyclistic Bike-Share Data Analysis Project! In this project, we delve into a real-world case study as a junior data analyst working with Cyclistic, a prominent bike-share company in Chicago. Our mission is to contribute valuable insights that will inform a new marketing strategy aimed at maximizing annual memberships.
## Table of Contents
1. [Project Overview](#project-overview)
2. [Business Task](#business-task)
3. [Scenario](#scenario)
4. [Data](#data)
5. [Project Workflow](#project-workflow)
   - [Ask](#ask)
   - [Prepare](#prepare)
   - [Process](#process)
   - [Analyze](#analyze)
   - [Share](#share)
6. [Why This Matters](#why-this-matters)
7. [Results](#results)
## Project Overview
This capstone project serves as the culmination of the Google Data Analytics certificate. Its primary objective is to apply the acquired knowledge in a real-world context through a provided scenario, dataset, and business task. The task involves employing the phases covered in the course to address and solve the specified business challenge.
## Business Task
As part of the marketing analyst team, our primary business task is to answer the question: How do annual members and casual riders use Cyclistic bikes differently? The success of Cyclistic hinges on understanding the unique behaviors and preferences of these two user groups. By deciphering their distinct patterns, we aim to propose data-driven recommendations that will guide the development of an effective marketing strategy.
## Scenario
Imagine yourself in the role of a junior data analyst at Cyclistic. The director of marketing firmly believes that the key to the company's future success lies in increasing the number of annual memberships. To achieve this goal, our team is tasked with comprehensively understanding the differences in the usage patterns between casual riders and annual members. The ultimate objective is to design a compelling marketing strategy that successfully converts casual riders into loyal annual members.
## Data
Utilize Cyclistic's historical trip data for the analysis and identification of trends. You can download the Cyclistic trip data [here](https://divvy-tripdata.s3.amazonaws.com/index.html). Please note that the datasets have distinct names as Cyclistic is a fictional company. However, for the purposes of this case study, these datasets are suitable and will facilitate the exploration of business questions. You have the flexibility to choose between working with an entire year of data or just one quarter, as I have opted for the latter. If you encounter challenges viewing large files in Google Sheets, consider using SQL for analysis.
## Project Workflow
The roadmap to this project has 5 phases: ask, prepare, process, analyze, and share.  
It doesn't Include the act phase.
#### Ask

    Guiding Questions:
        What is the problem I’m trying to solve?
            - In what ways do annual members and casual members (those with single ride or full-day passes) 
              utilize our service differently? 
            - How can we encourage casual members to transition into becoming annual members?
        How can my insights drive business decisions?
            - Upon delivering well-supported and compelling data insights along with professional data visualization,
              I anticipate securing approval for my recommendation from the Cyclistic executive team. Following this approval,
              the Cyclistic marketing team is poised to implement fresh marketing strategies specifically tailored to target 
              casual members, with the goal of enticing them to transition into becoming annual members.
    Key Tasks:
        Identify the business task.
            - Analyze and delineate the distinct patterns of Cyclistic bike utilization between annual members
              and casual riders.
        Consider the key stakeholders.
            - Furnish the Cyclistic executive team with detailed data insights and impactful visualizations, 
              offering strategic recommendations aligned with organizational goals.
              This task is crucial for informing key decision-makers and steering Cyclistic toward success.
    Deliverable:
        Clear statement of business task.
            - Conduct a comprehensive analysis to distinguish and outline the unique patterns of Cyclistic bike utilization
              among annual members and casual riders.
#### Prepare  
    Guiding Questions:
        Where is your data located?
            - The data is hosted on a public index accessible for public viewing and downloading; however, direct editing or
              uploading to the index is restricted.
        How is the data organized?
            - The data is structured to incorporate essential attributes crucial for addressing the business task,
              encompassing ride details such as time, date, locations, and bike type. Each ride is represented with comprehensive
              and detailed information.
        Are there issues with bias or credibility in this data? Does your data ROCCC?
            - Certainly, the data exhibits reliability, as it is accurate, complete, and free from bias. The originality is inherent,
              given that it is automatically gathered by the company through user interactions with the application.
              The data is comprehensive, sufficiently addressing our inquiries, and it's current as of 2023. Furthermore,
              it is cited, considering it originates from automatic collection during each ride by the company servers.
        How did you verify the data’s integrity?
            - I ensured the integrity of the data through a multi-faceted approach. Firstly, the data originates from
              an internal source, collected within our company. Secondly, measures were taken to prevent bias,
              ensuring that it does not favor any particular group. Although some may contend that the representation
              of member types is not equal, it's important to note that the focus lies not in comparing their counts
              but rather in understanding the predominant behaviors and patterns among them.
        How does it help you answer your question?
            - It aids me in discerning distinctions between annual and casual members by examining the locations
              where they predominantly initiate or conclude their rides, the times at which their rides commence or conclude,
              the duration of their rides, and the specific dates on which they initiate their rides.
        Are there any problems with the data?
            - Regrettably, there are issues with the data. Approximately 22.02% of the records contain null values for either
              the start station, end station, or both, posing a significant challenge for handling the data effectively.
            - Additionally, a substantial number of rides commence and conclude within the same minute and at the same station,
              prompting the speculation that these instances may represent incomplete rides, possibly canceled ones.
            - Moreover, there is a higher representation of annual members compared to casual members in the data. While not ideal,
              this discrepancy in counts should not pose a major issue since our focus is on comparing behavioral patterns rather than numerical counts.
    Key Tasks:
        Download data and store it appropriately.
            - All necessary data has been downloaded and stored in a dedicated folder, encapsulated within the project directory.
        Identify how it’s organized.
            - It's structured to incorporate ride ID and type, ride time and date, ride locations, and ride member type,
              all assigned with the appropriate data types.
        Sort and filter the data.
            - Sorting the data may not currently provide significant value since it can be addressed during
              the process of querying the data.
        Determine the credibility of the data.
            - There is no cause for distrust in the data, given that it is automatically gathered through customer interactions
              with the application, and its origin is internal, not reliant on human collection.

    Deliverable:
        A description of all data sources used.
            - It is available as an open source, allowing the public to access and download the data online.
              I specifically selected the data for the first quarter of the year 2023.
#### Process
    Guiding Questions:
        What tools are you choosing and why?
            - The data is hosted on a public index accessible for public viewing and downloading;
              however, direct editing or uploading to the index is restricted.
            - How can we encourage casual members to transition into becoming annual members?
        How is the data organized
            - The data is structured to incorporate essential attributes crucial for addressing the business task,
              encompassing ride details such as time, date, locations, and bike type.
              Each ride is represented with comprehensive and detailed information.
        Are there issues with bias or credibility in this data? Does your data ROCCC?
            - Certainly, the data exhibits reliability, as it is accurate, complete, and free from bias.
              The originality is inherent, given that it is automatically gathered by the company through user
              interactions with the application. The data is comprehensive, sufficiently addressing our inquiries,
              and it's current as of 2023. Furthermore, it is cited, considering it originates from automatic collection
              during each ride by the company servers.
        How did you verify the data’s integrity?
            - I ensured the integrity of the data through a multi-faceted approach. Firstly, the data originates from
              an internal source, collected within our company. Secondly, measures were taken to prevent bias, ensuring that
              it does not favor any particular group. Although some may contend that the representation of member types is not equal,
              it's important to note that the focus lies not in comparing their counts but rather in understanding the predominant
              behaviors and patterns among them.
        How does it help you answer your question?
            - It aids me in discerning distinctions between annual and casual members by examining the locations
              where they predominantly initiate or conclude their rides, the times at which their rides commence or conclude,
              the duration of their rides, and the specific dates on which they initiate their rides.
        Are there any problems with the data?
            - Regrettably, there are issues with the data. Approximately 22.02% of the records contain null values for
              either the start station, end station, or both, posing a significant challenge for handling the data effectively.
            - Additionally, a substantial number of rides commence and conclude within the same minute and at the same station,
              prompting the speculation that these instances may represent incomplete rides, possibly canceled ones.
            - Moreover, there is a higher representation of annual members compared to casual members in the data. While not ideal,
              this discrepancy in counts should not pose a major issue since our focus is on comparing behavioral patterns rather than numerical counts.
    Key Tasks:
        Download data and store it appropriately.
            - All necessary data has been downloaded and stored in a dedicated folder, encapsulated within the project directory.
        Identify how it’s organized.
            - It's structured to incorporate ride ID and type, ride time and date, ride locations, and ride member type, all assigned with the appropriate data types.
        Sort and filter the data.
            - Sorting the data may not currently provide significant value since it can be addressed during the process of querying the data.
        Determine the credibility of the data.
            - There is no cause for distrust in the data, given that it is automatically gathered through customer interactions with the application,
              and its origin is internal, not reliant on human collection.

    Deliverable:
        A description of all data sources used.
            - It is available as an open source, allowing the public to access and download the data online.
              I specifically selected the data for the first quarter of the year 2023.
  #### Analyze
    Guiding Questions:
        How should you organize your data to perform analysis on it?
            - By cleaning, formatting, documenting, categorizing, visualizing, and maintaining a systematic approach for effective and insightful analysis.
        Has your data been properly formatted?
            - Yes, I created the table and imported all the data into it, ensuring that each column is appropriately assigned with the correct data type.
        What surprises did you discover in the data? What trends or relationships did you find in the data?
            - Noteworthy findings in the data include heightened activity at stations like Ellis Ave & 60th St, University Ave & 57th St, and Clinton St & Washington Blvd.
              Conversely, stations near the Public Rack exhibit lower activity, possibly influenced by the sheer number of stations in that area.
            - In the first quarter of 2023, classic bikes were utilized 286,864 times, docked bikes 6,777 times, and electric bikes 204,650 times.
            - There was a lack of usage of docked bikes by members during the selected time period.
            - The average ride duration peaks on Saturdays and Sundays compared to other days of the week.
            - Casual members, on average, have a ride length of 16 minutes and 30 seconds, while annual members have a shorter average ride duration of 10 minutes and 11 seconds.
            - The majority of rides commence during hours 16 and 17 of the day.
            - The ratio of casual members to annual members is 1:3.5 for rides in the first quarter of 2023.
            - It was surprising to find that casual members tend to have longer rides, while annual members engage in more frequent rides.
            - There was no utilization of docked bikes by members during the specified time period.
        How will these insights help answer your business questions?
            - All these insights help us identify the key differences between annual and casual members.
    Key Tasks:
        Check the data for errors.
            - Reviewed the data for any instances of null values, duplicates, as well as data featuring incorrect dates, and start and end times that lack coherence.
        Choose your tools.
            - Choose SQL, and tableau.
        Document the cleaning process.
            - Every manipulation done on the data was documented here and on the query file.

    Deliverable:
        Documentation of any cleaning or manipulation of data.
            - Documentation can be found on this roadmap or in the query file.
#### Share
    Guiding Questions:
        Were you able to answer the question of how annual members and casual riders use Cyclistic bikes differently?
            - Yes, There were multiple differences that I was able to find such as ride lenght and start time of rides.
        Who is your audience? What is the best way to communicate with them?
            - The audience is the Cyclistic executive team, and the best way to communicate with them is with detailed visualizations that answers the business task.
        Can data visualization help you share your findings?
            - Yes, It will help show the differences in patterns, which is great because most of the comparisons done is to show the differneces in behavioral patterns of 
              annual and casual members, and is due to the fact the number of rides done by annual members is much higher than casual members.
    Key Tasks:
        Check the data for errors.
            - Reviewed the data for any instances of null values, duplicates, as well as data featuring incorrect dates, and start and end times that lack coherence.
        Choose your tools.
            - Choose SQL, and tableau.
        Document the cleaning process.
            - Every manipulation done on the data was documented here and on the query file.
    Deliverable:
        Documentation of any cleaning or manipulation of data.
            - Documentation can be found on this roadmap or in the query file.

## Why This Matters
Understanding how annual members and casual riders use Cyclistic bikes differently is the cornerstone of a successful marketing strategy. By aligning our recommendations with concrete data insights, we not only enhance the likelihood of executive approval but also contribute significantly to Cyclistic's long-term success.

It's important to highlight that this dataset is publicly accessible, allowing you to delve into how various customer types utilize Cyclistic bikes. However, due to data privacy concerns, it is crucial to refrain from using personally identifiable information of riders. Consequently, connecting pass purchases to credit card numbers to ascertain details such as whether casual riders reside in the Cyclistic service area or if they have made multiple single pass purchases is not permissible.
## Results
The outcomes of my analysis are documented in the file labeled "Tableau Output," encompassing all the visualizations created, accompanied by conclusions for each visual. Additionally, these results are available in an alternative PowerPoint/PDF file named "Presentation."

