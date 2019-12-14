/* Test scenario 
Story: Moe, Omid and Ryan are in the employees table. 
Moe has three addresses, Omid has one and Ryan has no address.
Final Result must show all three employees with their recent movein date and recent address,
even if there is no address information for them.
*/
--populating tables
INSERT INTO  employees
VALUES (1,'Moe','Salari'),
	   (2,'Omid','Poostforoosh'),
       (3,'Ryan','Anderson');
 
INSERT INTO  addresses
VALUES (1,1,'N Bridgeton RD.','Portland',1,'97217','20170401'),
	   (2,1,'Naft ST','Tehran',2,'19818','19930404'),
	   (3,1,'Victory Ship Way','Vancouver',3,'V7l 0e2','20200119'),
	   (4,2,'O Address','Vancouver',3,'O zip','20040101');
 
INSERT INTO  provinces
VALUES (1,'Oregon'),
	   (2,'Tehran'),
	   (3,'British Columbia');
	   

select employeelist();
--Result is saved in 
SELECT * FROM employeerecentaddress

