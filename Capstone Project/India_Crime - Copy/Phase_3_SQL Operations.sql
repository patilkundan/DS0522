--for 3.1 and 3.4 and 3.8.1 All the given files for phase 3 has been dumped in MSSQL Server 
---3.2	Write SQL query to find the highest number of rapes & Kidnappings that happened in which state, District, and year---
SELECT STATE_UT, DISTRICT, [YEAR], MAX(RAPE+CUSTODIAL_RAPE+OTHER_RAPE)as RAPE, MAX(KIDNAPPING_ABDUCTION+KIDNAPPING_AND_ABDUCTION_OF_WOMEN_AND_GIRLS+KIDNAPPING_AND_ABDUCTION_OF_OTHERS) as KIDNAPPING_AND_ABDUCTION_OF_WOMEN_AND_GIRLS
FROM [dbo].[01_District_wise_crimes_committed_IPC]
GROUP BY STATE_UT, DISTRICT, YEAR
ORDER BY MAX(RAPE+CUSTODIAL_RAPE+OTHER_RAPE) DESC;

SELECT STATE_UT, DISTRICT, [YEAR], MAX(RAPE+CUSTODIAL_RAPE+OTHER_RAPE)as RAPE, MAX(KIDNAPPING_ABDUCTION+KIDNAPPING_AND_ABDUCTION_OF_WOMEN_AND_GIRLS+KIDNAPPING_AND_ABDUCTION_OF_OTHERS) as KIDNAPPING_AND_ABDUCTION_OF_WOMEN_AND_GIRLS
FROM [dbo].[01_District_wise_crimes_committed_IPC]
GROUP BY STATE_UT, DISTRICT, YEAR
ORDER BY MAX(KIDNAPPING_ABDUCTION+KIDNAPPING_AND_ABDUCTION_OF_WOMEN_AND_GIRLS+KIDNAPPING_AND_ABDUCTION_OF_OTHERS) DESC;
--------------------------------------------------------------------------------------------------------------------------------------------
----3.3	Write SQL query to find All the lowest number of rapes & Kidnappings that happened in which state, District, and year--------------
SELECT STATE_UT, DISTRICT, [YEAR], MAX(RAPE+CUSTODIAL_RAPE+OTHER_RAPE)as RAPE, MAX(KIDNAPPING_ABDUCTION+KIDNAPPING_AND_ABDUCTION_OF_WOMEN_AND_GIRLS+KIDNAPPING_AND_ABDUCTION_OF_OTHERS) as KIDNAPPING_AND_ABDUCTION_OF_WOMEN_AND_GIRLS
FROM [dbo].[01_District_wise_crimes_committed_IPC]
GROUP BY STATE_UT, DISTRICT, YEAR
ORDER BY MAX(RAPE+CUSTODIAL_RAPE+OTHER_RAPE) ;

SELECT STATE_UT, DISTRICT, [YEAR], MAX(RAPE+CUSTODIAL_RAPE+OTHER_RAPE)as RAPE, MAX(KIDNAPPING_ABDUCTION+KIDNAPPING_AND_ABDUCTION_OF_WOMEN_AND_GIRLS+KIDNAPPING_AND_ABDUCTION_OF_OTHERS) as KIDNAPPING_AND_ABDUCTION_OF_WOMEN_AND_GIRLS
FROM [dbo].[01_District_wise_crimes_committed_IPC]
GROUP BY STATE_UT, DISTRICT, YEAR
ORDER BY MAX(KIDNAPPING_ABDUCTION+KIDNAPPING_AND_ABDUCTION_OF_WOMEN_AND_GIRLS+KIDNAPPING_AND_ABDUCTION_OF_OTHERS) ;

----------------------------------------------------------------------------------------------------------------------------------------------
------3.5	Write SQL query to find the highest number of dacoity/robbery in which district.-------
SELECT DISTRICT, [Year], MAX(Dacoity+Robbery) as Dacoity_or_Robbery
FROM [dbo].[02_District_wise_crimes_committed_against_SC]
GROUP BY DISTRICT, [Year]
ORDER BY Dacoity_or_Robbery DESC;
------------------------------------------------------------------------------------------------------------------------------------------------
----3.6	Write SQL query to find in which districts(All) the lowest number of murders happened.--------
SELECT DISTRICT, MIN(MURDER) AS MIN_MURDER
FROM [dbo].[01_District_wise_crimes_committed_IPC]
GROUP BY DISTRICT
ORDER BY MIN_MURDER ASC;
--------------------------------------------------------------------------------------------------------------------------------------
----3.7	Write SQL query to find the number of murders in ascending order in district and yearwise-------------------------------
SELECT DISTRICT, [YEAR], MURDER
FROM [dbo].[01_District_wise_crimes_committed_IPC]
ORDER BY DISTRICT ASC, [YEAR] ASC, MURDER ASC
-------------------------------------------------------------------------------------------------------------
---3.8.1	Insert records of STATE/UT, DISTRICT, YEAR, MURDER, ATTEMPT TO MURDER, and RAPE columns only from 01_District_wise_crimes_committed_IPC_2001_2012.csv into a new table
CREATE TABLE Crime_india (
    STATE_UT VARCHAR(100),
    DISTRICT VARCHAR(100),
    [YEAR] INT,
    MURDER INT,
    ATTEMPT_TO_MURDER INT,
    RAPE INT
);

INSERT INTO Crime_Data (STATE_UT, DISTRICT, [YEAR], MURDER, ATTEMPT_TO_MURDER, RAPE)
SELECT STATE_UT, DISTRICT, [YEAR], MURDER, ATTEMPT_TO_MURDER, RAPE
FROM [dbo].[01_District_wise_crimes_committed_IPC]

----------------------------------------------------------------------------------------------------
----3.8.2	Write SQL query to find which District in each state/ut has the highest number of murders yearwise. Your output should show STATE/UT, YEAR, DISTRICT, and MURDERS.
SELECT 
    [STATE_UT],
    [YEAR],
    [DISTRICT],
    [MURDER]
FROM 
    [AdventureWorks2017].[dbo].[01_District_wise_crimes_committed_IPC] t1
WHERE
    [MURDER] = (
        SELECT MAX([MURDER])
        FROM [AdventureWorks2017].[dbo].[01_District_wise_crimes_committed_IPC] t2
        WHERE 
            t2.[STATE_UT] = t1.[STATE_UT] AND
            t2.[YEAR] = t1.[YEAR]
    )
ORDER BY 
    [STATE_UT], 
    [YEAR]
----------------------------------------------------------------------
---for 3.8.3 results of above query is saved in csv file for next opration of 3.8.4 
---3.8.4 refer the jupyter note book 

