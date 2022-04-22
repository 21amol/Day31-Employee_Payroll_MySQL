create database payrollService;
show databases;
use payrollService;

create table employeePayroll (id int primary key auto_increment, name varchar(20), salary varchar(20),
startDate varchar(20));
desc employeePayroll;

insert into employeePayroll (name,salary,startDate) values ('Amol','30000','1-1-2022'), ('Priya','40000','10-2-2022'), 
('Rohit', '50000', '25-2-2022'), ('Apirya', '40000', '10-2-2022'); 
select *from payrollService.employeePayroll;

select salary from employeePayroll where id = 1;
select salary from employeePayroll where name = 'Amol';
select salary from employeePayroll where name = 'Rohit';
select *from employeePayroll where startDate between cast('10-2-2022' as date) and date(now());
select * from employeePayroll where startDate between '1-1-2022' and '10-2-2022';

alter table employeePayroll add gender varchar(1);
update employeePayroll set gender = 'M' where name = 'Amol' or name = 'Rohit'; 
update employeePayroll set gender = 'F' where name = 'Priya' or name = 'Apirya';

select min(salary) from employeePayroll;
select max(salary) from employeePayroll;
select avg(salary) as salary from employeePayroll where gender = 'M' group by gender;
select count(*) from employeePayroll;
select count(*) as count from employeePayroll;
select sum(salary) as salary from employeePayroll where gender = 'F' group by gender;

alter table employeePayroll add phoneNum varchar(20);
alter table employeePayroll add address varchar(20); 
alter table employeePayroll add dept varchar (20);
update employeePayroll set phoneNum = '8657169656' where name = 'Amol';
update employeePayroll set phoneNum = '1234567893' where name = 'Rohit';
update employeePayroll set phoneNum = '9874563212' where name = 'Priya';
update employeePayroll set address = 'Pune' where name = 'Amol';
update employeePayroll set address = 'Banglore' where name = 'Rohit';
update employeePayroll set address = 'Mumbai' where name = 'Priya';
update employeePayroll set dept = 'Admin' where name = 'Amol';
update employeePayroll set dept = 'Tech' where name = 'Rohit';
update employeePayroll set dept = 'Store' where name = 'Priya';
alter table employeePayroll drop phoneNo;

alter table employeePayroll add column basicPay varchar(40), add column deductions varchar(40),
add column taxablePay varchar (40), add column incomeTax varchar (40), add column netPay varchar (40);
update employeePayroll set basicPay = '5k', deductions = '2k' , taxablePay = '3k', incomeTax = '4k', netPay = '30k';
update employeePayroll set gender = 'F' where name = 'Terisa';

create table employeeDept (emp_id int primary key auto_increment,
 dept_id int, designation varchar(40),
 foreign key (dept_id) references employeePayroll(id));
 desc employeeDept;  
 
insert into employeeDept(dept_id,designation) values(1,'Manager'),(2,'Developer'),(3,'DevOps'),(4,'Manager'),(5,'Director');
select * from  employeeDept;

select name,dept,salary,designation,gender from employeeDept
inner join employeePayroll ON employeePayroll.id=employeeDept.dept_id;