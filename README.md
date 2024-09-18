# Blue-Jays-Pitching-2022
## Overview
This project explores the pitching performance of the Toronto Blue Jays during the 2022 MLB season. Using Excel and SQL, I analyzed key pitching metrics to gain deeper insights into the Blue Jays' pitching strategy and performance. The data is sourced from [Baseball Savant](https://baseballsavant.mlb.com/statcast_search?hfPT=&hfAB=&hfGT=R%7C&hfPR=&hfZ=&hfStadium=&hfBBL=&hfNewZones=&hfPull=&hfC=&hfSea=2022%7C&hfSit=&player_type=pitcher&hfOuts=&hfOpponent=&pitcher_throws=&batter_stands=&hfSA=&game_date_gt=2022-04-08&game_date_lt=2022-10-12&hfMo=&hfTeam=TOR%7C&home_road=&hfRO=&position=&hfInfield=&hfOutfield=&hfInn=&hfBBT=&hfFlag=is%5C.%5C.last%5C.%5C.pitch%7C&metric_1=&group_by=name&min_pitches=0&min_results=0&min_pas=0&sort_col=pitches&player_event_sort=api_p_release_speed&sort_order=desc#results) and [Baseball Reference](https://www.baseball-reference.com/teams/TOR/2022.shtml).

## Key Analyses
* **AVG Pitches Per At-Bat Analysis**
This section examines the average number of pitches thrown per at-bat, focusing on:

   * **Overall Average**: Average pitches per at-bat using data from LastPitchJays.
   * **Home vs Away**: Comparison of home vs away games.
   * **Lefty vs Righty**: Left-handed vs right-handed batters using CASE statements.
   * **By Team**: Breakdown of pitches per at-bat for lefty vs righty batters, categorized by away team (using Partition By).
   * **Top 3 Most Common Pitches**: The most common pitches in at-bats 1 through 10.
   * **Pitcher Analysis**: Average pitches per at-bat for pitchers with 20+ innings, ordered in descending order.
* **Last Pitch Analysis**
   * **Pitch Count**: Analysis of the most frequently thrown last pitches.
   * **Fastball vs Offspeed**: Count and percentage breakdown of fastballs versus offspeed pitches.
   * **Relievers vs Starters**: Top 5 most common last pitches for relief pitchers compared to starting pitchers (using subqueries).
* **Home Run Analysis**
   * **Home Run Pitches**: Identification of pitches that resulted in the most home runs.
   * **Pitch Zones**: Breakdown of home runs by zone and pitch type, highlighting the top 5 most common pitch-zone combinations that led to home runs.
* **Analysis of Alek Manoah**
Focused analysis of Blue Jays' pitcher Alek Manoah, including:

   * **Pitching Metrics**: Average release speed, spin rate, strikeouts, and his most frequently used zones.
   * **Launch Speed**: Identification of the pitches that caused the lowest launch speeds by hitters.
## Tools and Technologies Used
* **Excel**: For data cleaning, initial exploration, and visualization.
* **SQL**: For querying, filtering, and advanced data analysis.
## Baseball Pitch Zones
To support the analysis, I included a visual representation of baseball pitching zones, which divides the strike zone into four key sections:

* Heart: The center of the strike zone where hitters are most likely to make solid contact.
* Shadow: The edge of the strike zone, which can either be a strike or a ball depending on the umpire’s call.
* Chase: The area just outside the strike zone where hitters are tempted to swing.
* Waste: The area far outside the strike zone, used to intentionally miss.
These zones play a crucial role in understanding the strategy behind each pitch and its effectiveness.

![image](https://github.com/user-attachments/assets/ada5cbfb-afc8-450c-8803-88595bce678a)

## Data Sources
* **Baseball Savant Dataset**: The primary dataset for pitch data, available [here](https://baseballsavant.mlb.com/statcast_search?hfPT=&hfAB=&hfGT=R%7C&hfPR=&hfZ=&hfStadium=&hfBBL=&hfNewZones=&hfPull=&hfC=&hfSea=2022%7C&hfSit=&player_type=pitcher&hfOuts=&hfOpponent=&pitcher_throws=&batter_stands=&hfSA=&game_date_gt=2022-04-08&game_date_lt=2022-10-12&hfMo=&hfTeam=TOR%7C&home_road=&hfRO=&position=&hfInfield=&hfOutfield=&hfInn=&hfBBT=&hfFlag=is%5C.%5C.last%5C.%5C.pitch%7C&metric_1=&group_by=name&min_pitches=0&min_results=0&min_pas=0&sort_col=pitches&player_event_sort=api_p_release_speed&sort_order=desc#results).
* **Baseball Reference Dataset**: Provides team-specific stats and additional data on the Blue Jays' 2022 season, accessible [here](https://www.baseball-reference.com/teams/TOR/2022.shtml).

For a detailed explanation of the dataset's columns and their meanings, please refer to [Baseball Savant's CSV documentation](https://baseballsavant.mlb.com/csv-docs).


## Results and Insights
This project uncovers several insights into the Toronto Blue Jays' pitching performance during the 2022 season:

* Pitch selection and distribution for different game situations.
* Home vs away performance and how it impacts pitch strategy.
* Patterns in the types of pitches thrown in high-leverage situations, like the last pitch in an at-bat.
* A deep dive into Alek Manoah’s pitching style and effectiveness.
## Conclusion
This project showcases my ability to handle and analyze large datasets using both SQL and Excel. It highlights the importance of data in understanding performance metrics in sports, especially in baseball, where strategy and statistics go hand-in-hand. Through this analysis, key insights are drawn that can help coaches, analysts, and fans better understand the Blue Jays' pitching decisions during the 2022 season.

## Contributing
If you'd like to contribute, feel free to fork this repository and submit a pull request. Suggestions for improvement or additional analysis are always welcome!
