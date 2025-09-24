use dac_dbt_2022;


-------------------------------------------------------
-- INTO

drop procedure empget;
delimiter //
create procedure empget(in id int)
begin
declare psal int default 0;
select basicpay into psal from emp where empcode = id;
set psal = psal + 2200;
select psal;
end //
delimiter ;
call empget(7888);

---------------------------------------------------------

-- OUT

drop procedure empget;
delimiter //
create procedure empget(in deptid varchar(20), out pname varchar(20))
begin
select empname into pname from emp where basicpay = (select max(basicpay) from emp where deptcode = deptid);
end //
delimiter ;
call empget("SALE", @pname);
select @pname;











