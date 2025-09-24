use dac_dbt_2022;

delimiter //
create procedure getempdetails(in eid int)
begin 
select empname,empcode from emp
where empcode = eid;
end //
delimiter ;

--------------------------------------------
call getempdetails(7369);
select * from emp;

drop procedure find_max;
delimiter //
create procedure find_max()
begin
select max(basicpay) from emp;
end //
delimiter ;

call find_max();
-----------------------------------------------

DELIMITER //
CREATE PROCEDURE find_max1()
BEGIN
    SELECT MAX(basicpay) FROM emp;
END //
DELIMITER ;
CALL find_max1();
DROP PROCEDURE find_max1;

-----------------------------------------------

DROP PROCEDURE find_max1;
DELIMITER //
CREATE PROCEDURE find_max1()
BEGIN
    SELECT empcode, empname, basicpay FROM emp
    where empcode = (select empcode from emp where basicpay = (select max(basicpay) from emp));
END //
DELIMITER ;
CALL find_max1();

------------------------------------------------

DROP PROCEDURE getEmp;
DELIMITER //
CREATE PROCEDURE getEmp(in dept varchar(20))
BEGIN
    SELECT empcode, empname, deptcode FROM emp
    where deptcode = dept;
END //
DELIMITER ;
CALL getEmp("ACCT");

-----------------------------------------------

DROP PROCEDURE getEmp;
DELIMITER //
CREATE PROCEDURE getEmp(in dept varchar(20))
BEGIN
    SELECT empcode, empname, deptcode FROM emp
    where deptcode = dept and
    basicpay = (select max(basicpay) from emp where deptcode = dept);
END //
DELIMITER ;
CALL getEmp("PRCH");











