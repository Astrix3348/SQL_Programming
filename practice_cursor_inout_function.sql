use dac_dbt_2022;
show databases;
select * from products;


drop function getStock;
delimiter //
create function getStock(pid int)
returns float
deterministic
begin
declare p_price float;
select stock_quantity into p_price from products where product_id = pid;

return p_price;
end //
delimiter ;

select getStock(102);


-------------------------------------------------------------------

drop procedure getDetails;
delimiter //
create procedure getDetails()
begin

declare done int default 0;
declare pid int default 0;
declare p_name varchar(255);
declare stock int;
declare new_stock int;

declare c1 cursor for select product_id, product_name, stock_quantity from products;
declare continue handler for not found set done = 1;

drop temporary table temp;
create temporary table temp(id int, name varchar(255), s_stock int);

open c1;
read_product : loop
fetch c1 into pid, p_name, stock;
   if done = 1 then 
   leave read_product;
   end if;
   insert into temp values (pid, p_name, stock);
end loop;
close c1;
select * from temp;
end //

call getDetails()//

----------------------------------------------------------------------------


select * from products;

drop procedure get_Stock;
delimiter //
create procedure get_Stock(inout p_value varchar(20))
begin
select product_name into p_value from products where 
product_id = p_value;
end //

set @pvalue = 101;
call get_Stock(@pvalue);
select @pvalue;

select * from products;

select * from products where product_name like "w%";





















