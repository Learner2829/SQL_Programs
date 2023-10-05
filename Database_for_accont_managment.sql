show databases;
create database db1;
use db1;
create table Account_emp(id int primary key auto_increment,
brach_name varchar(20),
amount_balance float);

insert into Account_emp values(1,"baroda",12000);
insert into Account_emp values(2,"Ahmedabad",100000);
insert into Account_emp values(3,"Gandhinagar",12000);
insert into Account_emp values(4,"jamnagar",20000);
select * from Account_emp;

delimiter //
create procedure withdraw(in input_id int,in w_amout float)
begin
update Account_emp
set amount_balance=amount_balance-w_amout
where id=input_id;
end;
//
delimiter ;
call withdraw(4,2000);
#2 . Write a procedure to deposit money into someone's account. The procedure should 
#accept account_id and deposit amount
delimiter //
create procedure deposit(in input_id int,in w_amout float)
begin
update Account_emp
set amount_balance=amount_balance+w_amout
where id=input_id;
end;
//
delimiter ;
call deposit(1,6000);
#. Write a procedure to transfer money from one person's account to another. The 
#  procedure should table two account_id’s one for giver and one for receiver and the amount 
#  to be transferred.
delimiter //
create procedure transfer(in cus1_id int, in cus2_id int, in amt_transfer float)
begin
update Account_emp 
set amount_balance = amount_balance - amt_transfer
where id = cus1_id;
update Account_emp 
set amount_balance = amount_balance + amt_transfer
where id = cus2_id;
end;
//
delimiter ;
drop procedure transfer;
select * from Account_emp;
call transfer(1,2,2000);
