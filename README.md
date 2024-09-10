# Blue-Jays-Pitching-2022
In this project, I utilized both Excel and SQL to analyze the last pitches thrown by the Toronto Blue Jays during the 2022 season. The data was sourced from [Baseball Savant](https://baseballsavant.mlb.com/statcast_search?hfPT=&hfAB=&hfGT=R%7C&hfPR=&hfZ=&hfStadium=&hfBBL=&hfNewZones=&hfPull=&hfC=&hfSea=2022%7C&hfSit=&player_type=pitcher&hfOuts=&hfOpponent=&pitcher_throws=&batter_stands=&hfSA=&game_date_gt=2022-04-08&game_date_lt=2022-10-12&hfMo=&hfTeam=TOR%7C&home_road=&hfRO=&position=&hfInfield=&hfOutfield=&hfInn=&hfBBT=&hfFlag=is%5C.%5C.last%5C.%5C.pitch%7C&metric_1=&group_by=name&min_pitches=0&min_results=0&min_pas=0&sort_col=pitches&player_event_sort=api_p_release_speed&sort_order=desc#results) and [Baseball Reference](https://www.baseball-reference.com/teams/TOR/2022.shtml), with two main datasets: **JaysPitchingStats** and **LastPitchJays**.

Using SQL, I conducted a detailed analysis to answer several key questions:

1. **AVG Pitches Per at Bat Analysis**:
   - 1a. Average pitches per at-bat (LastPitchJays).
   - 1b. Home vs Away average pitches per at-bat (Union).
   - 1c. Lefty vs Righty average pitches per at-bat (using a CASE statement).
   - 1d. Lefty vs Righty average pitches per at-bat for each away team (Partition By).
   - 1e. Top 3 most common pitches for at-bats 1 through 10, along with totals.
   - 1f. Average pitches per at-bat per pitcher with 20+ innings, ordered by descending (combining LastPitchJays + JaysPitchingStats).

2. **Last Pitch Analysis**:
   - 2a. Count of last pitches thrown in descending order.
   - 2b. Count of different last pitches (Fastball or Offspeed).
   - 2c. Percentage breakdown of Fastball vs Offspeed last pitches.
   - 2d. Top 5 most common last pitches for relief pitchers vs starting pitchers (using subqueries).

3. **Home Run Analysis**:
   - 3a. Pitches that gave up the most home runs.
   - 3b. Breakdown of home runs by zone and pitch, highlighting the top 5 most common combinations.

4. **Analysis of Alek Manoah**:
   - 4a. Average release speed, spin rate, strikeouts, and most popular zone.
   - 4b. Pitches that caused the lowest launch speed.

To support the analysis, I included a visual representation of the baseball pitching zones, which divides the strike zone into four sections: **Heart**, **Shadow**, **Chase**, and **Waste**. 
![image](https://github.com/user-attachments/assets/ada5cbfb-afc8-450c-8803-88595bce678a)

Each of these zones plays a critical role in understanding pitch strategy and outcomes. You can find the detailed explanation of the columns in the datasets by visiting [Baseball Savant's CSV documentation](https://baseballsavant.mlb.com/csv-docs), which clarifies the data used in the analysis.

This project highlights my ability to clean and manipulate sports data using Excel and SQL while answering complex queries related to baseball statistics, showcasing practical data analysis skills.



