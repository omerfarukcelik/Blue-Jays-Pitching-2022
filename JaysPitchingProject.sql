Select *
From JaysPitching.Dbo.LastPitchJays

Select *
From JaysPitching.Dbo.JaysPitchingStats

--Q1 AVG Pitches Per at Bat Analysis

--1a AVG Pitches Per At Bat (LastPitchJays)

Select AVG(1.00 * Pitch_number) as AvgNumofPitchesPerAtBat
From JaysPitching.Dbo.LastPitchJays

--Rows vs Columns--
--1b AVG Pitches Per At Bat Home Vs Away (LastPitchJays) -> Union

Select
	'Home' as TypeofGame,
	AVG(1.00 * Pitch_number) as AvgNumofPitchesPerAtBat
From JaysPitching.Dbo.LastPitchJays
Where home_team = 'TOR'
Union 
Select
	'Away' as TypeofGame,
	AVG(1.00 * Pitch_number) as AvgNumofPitchesPerAtBat
From JaysPitching.Dbo.LastPitchJays
Where away_team = 'TOR'

--1c AVG Pitches Per At Bat Lefty Vs Righty -> Case Statement

Select
	AVG(Case when batter_position = 'L' Then 1.00 * Pitch_number end) as Lefty_at_Bat,
	AVG(Case when batter_position = 'R' Then 1.00 * Pitch_number end) as Righty_at_Bat
From JaysPitching.Dbo.LastPitchJays

--1d AVG Pitches Per At Bat Lefty Vs Righty Pitcher | Each Away team -> Partition By

Select Distinct
	home_team,
	Pitcher_position,
	AVG(1.00 * Pitch_number) Over (Partition by home_team, Pitcher_position)
From JaysPitching.Dbo.LastPitchJays
Where away_team = 'TOR'

--1e Top 3 Most Common Pitch for at bat 1 through 10, and total amounts (LastPitchJays)

With totalpitchsequence as (
	Select Distinct
		Pitch_name,
		Pitch_number,
		count(pitch_name) Over (Partition By Pitch_name, Pitch_number) as PitchFrequency
	From JaysPitching.Dbo.LastPitchJays
	Where Pitch_number < 11
), 
pitchfrequencyrankquery as (
	Select 
		Pitch_name,
		Pitch_number,
		PitchFrequency,
		rank() Over (Partition By Pitch_number order by PitchFrequency desc) as PitchFrequency_Ranking
From totalpitchsequence
)
Select *
From pitchfrequencyrankquery
Where PitchFrequency_Ranking < 4

--1f AVG Pitches Per at Bat Per Pitcher with 20+ Innings | Order in descending (LastPitchJays + JaysPitchingStats)

Select 
	JPS.Name, 
	AVG(1.00 * Pitch_number) as AVG_Pitches
From JaysPitching.Dbo.LastPitchJays as LPJ
Join JaysPitching.Dbo.JaysPitchingStats as JPS On JPS.pitcher_id = LPJ.pitcher
Where IP >= 20
Group by JPS.Name
Order by AVG(1.00 * Pitch_number) desc


--Q2 Last Pitch Analysis

--2a Count of the Last Pitches Thrown in Desc Order (LastPitchJays)

Select
	pitch_name,
	count(*) as times_thrown
From JaysPitching.Dbo.LastPitchJays
Group by pitch_name
Order by count(*) desc

--2b Count of the different last pitches Fastball or Offspeed (LastPitchJays)

Select
	sum(case when pitch_name in ('4-Seam Fastball', 'Cutter') then 1 else 0 end) as Fastball,
	sum(case when pitch_name NOT in ('4-Seam Fastball', 'Cutter') then 1 else 0 end) as Offspeed
From JaysPitching.Dbo.LastPitchJays

--2c Percentage of the different last pitches Fastball or Offspeed (LastPitchJays)

Select
	100 * sum(case when pitch_name in ('4-Seam Fastball', 'Cutter') then 1 else 0 end) / count(*) as Fastball_Percent,
	100 * sum(case when pitch_name NOT in ('4-Seam Fastball', 'Cutter') then 1 else 0 end) / count(*) as Offspeed_Percent
From JaysPitching.Dbo.LastPitchJays

--2d Top 5 Most common last pitch for a Relif Pitcher vs Starting Pitcher (LastPitchJays + JaysPitchingStats) -> SubQueries

Select *
From (
	Select 
		RPvsSP.POS,
		RPvsSP.pitch_name,
		RPvsSP.times_thrown,
		RANK() Over (Partition by RPvsSP.POS Order by RPvsSP.times_thrown desc) as Pitch_Rank
	From (
		Select 
			JPS.POS,
			LPJ.pitch_name,
			count(*) as times_thrown
		From JaysPitching.Dbo.LastPitchJays as LPJ
		Join JaysPitching.Dbo.JaysPitchingStats as JPS On JPS.pitcher_id = LPJ.pitcher
		Group by JPS.POS, LPJ.pitch_name 
	) RPvsSP
) ranking
Where ranking.Pitch_Rank < 6

-- Q3 Homerun analysis

--3a What pitches have given up the most HRs (LastPitchRays)

Select 
	pitch_name,
	count(*) as Home_Runs
From JaysPitching.Dbo.LastPitchJays
Where events = 'home_run'
Group by pitch_name
Order by count(*) desc


--3b Show HRs given by zone and pitch, show top 5 most common

Select 
	TOP 5 zone, 
	pitch_name,
	count(*) as Home_Runs
From JaysPitching.Dbo.LastPitchJays
Where events = 'home_run'
Group by zone, pitch_name
Order by count(*) desc

--Q4 Analysis of Alek Manoah

--Select *
--From JaysPitching.dbo.LastPitchJays as LPJ
--Join JaysPitching.dbo.JaysPitchingStats as JPS On JPS.pitcher_id = LPJ.pitcher

--4a AVG Release Speed, spin rate, strikeouts, most popular zone only using LastPitchRays
Select 
	AVG(release_speed) as Avg_Release_Speed,
	AVG(release_spin_rate) as Avg_Spin_Rate,
	Sum(case when events = 'strikeout' then 1 else 0 end) as Strikeouts,
	Max(zones.zone) as Zone
From JaysPitching.dbo.LastPitchJays as LPJ
Join (
	Select 
		Top 1 pitcher,
		zone,
		count(*) as zone_number
	From JaysPitching.dbo.LastPitchJays as LPJ
	Where player_name = 'Manoah, Alek'
	Group by pitcher, zone
	Order by count(*) desc
) zones on zones.pitcher = LPJ.pitcher
Where player_name = 'Manoah, Alek'


--4b What pitch causes the lowest launch speed

Select
	Top 1 pitch_name,
	AVG(launch_speed * 1.00) as Launch_Speed
From JaysPitching.dbo.LastPitchJays
Where player_name = 'Manoah, Alek'
Group by pitch_name
Order by AVG(launch_speed)