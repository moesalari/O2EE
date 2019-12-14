CREATE OR REPLACE FUNCTION insertRecentEmployeeAddress()
RETURNS varchar(20) as
$body$
DECLARE
    err_context text;
BEGIN
	-- Keeping the most recent movein date for each employee
	DROP TABLE IF EXISTS recent_moveindate_employee;
    CREATE TEMPORARY TABLE recent_moveindate_employee
	(
		employeeid int,
		recentMovindate date
	);

	INSERT INTO recent_moveindate_employee
	SELECT 
		employeeid,
		MAX(moveindate)
	FROM  addresses
	GROUP BY employeeid;

	--result list
	INSERT INTO employeerecentaddress
		(
		employeeid,
		firstname,
		lastname,
		address,
		city,
		province,
		postalcode,
		moveindate
		)
	SELECT 
		emp.employeeid,
		emp.firstname,
		emp.lastname,
		rec_adr.address,
		rec_adr.city,
		pro.province,
		rec_adr.postalcode,
		rec_adr.moveindate
	FROM  employees as emp
	LEFT JOIN
		(SELECT
			adr.addressid,
			adr.employeeid,
			adr.address,
			adr.city,
			adr.provinceid,
			adr.postalcode,
			adr.moveindate
		 FROM
		  addresses as adr
		 INNER JOIN recent_moveindate_employee as rec
		 ON adr.employeeid = rec.employeeid
		 AND adr.moveindate =  rec.recentMovindate) as rec_adr 
	ON emp.employeeid = rec_adr.employeeid
	LEFT JOIN  provinces as pro
	ON rec_adr.provinceid = pro.provinceid;
	
    RETURN 'result saved in recent_moveindate_employee';
	
    EXCEPTION 
    when others then
        GET STACKED DIAGNOSTICS err_context = PG_EXCEPTION_CONTEXT;
        RAISE INFO 'Error Name:%',SQLERRM;
        RAISE INFO 'Error State:%', SQLSTATE;
        RAISE INFO 'Error Context:%', err_context;
        RETURN 'There is an error please investigate';
	

END;
$body$
language plpgsql;