# O2EE
Data Engineering Assignment 

Part 1: Data Capture<br />

**Requirements for running python file,<br />**
  1-	Python 3.7 and above<br />
  2-	feedparser library<br />
  3-	pandas library<br />
  

**Solution <br />**
  1-	Connect to SSR URL and parse<br />
  2-	Creating empty data frame<br />
  3-	Populating data frame with values that come from parsing + Data cleaning <br />
  4-	Save data frame as CSV<br />
  

**Test Scenarios <br />**
  1-	Wrong URL<br />
  2-	Out of index<br />
  3-	Data verification: Comparing top 5 result with actual data in the website.  Please see ~Capture Data\compare.xlsx<br />
  
  
**To Improve<br />**
1-	Work more on data cleansing (for instance in some articles there are math symbols like lambda, gamma, rho.) <br />
2-	An automated audit for checking final result with website<br />
3-	…..


**Part 2: SQL Knowledge**
**Requirements for running python file,<br />**
 1-	PostgreSQL <br />
 
 **Solution <br />**
 1- Come up with a temparary table to keep employeeid and most recent movein date
 2- Join tables 
 3- Insert to final table 
 
 **Test Scenarios <br />**
Story: Moe, Omid and Ryan are in the employees table. 
Moe has three addresses, Omid has one and Ryan has no address.
Final Result must show all three employees with their recent movein date and recent address,
even if there is no address information for them.


 
