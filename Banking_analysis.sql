create database bankdb;
show databases;


create table customers
(customerid int primary key auto_increment,
firstname varchar(100)not null,
lastname varchar(100)not null,
phone varchar (15)unique,
email varchar(100)unique);


create table Accounts
(AccountID int primary key auto_increment,
customerid int ,
Accountnumber varchar (20)unique,
Accounttype varchar(20),check(Accounttype in("current","savings")),
Balance decimal(12,2)check(Balance>=0),

foreign key(customerid)
references customers(customerid));



create table Transactions
(TransactionID int primary key auto_increment,
AccountID int ,
Transactiontype varchar(100)not null,
Amount decimal(12,2)check(Amount >0),
TransactionDate datetime default(current_timestamp),

foreign key(AccountID)
references Accounts(AccountID));



create table Loan
(LoanID int primary key auto_increment,
customerID int not null,
LoanAmount decimal(12,2)check(LoanAmount>0),
InterestRate int not null,

foreign key(customerID)
references customers(customerID));

create table Branches
(BranchID int primary key auto_increment,
BranchName varchar (50),
Location varchar (20));


insert into customers
(firstname,lastname,phone,email)
values
("Ada","Joel","09011111111","adajoel@gmail.com"),
("Emeka","timoty","08022222222","emekajoel@gmail.com"),
("Peace","Micheal","09033333333","peacemicheal@gmail.com"),
("Daniel","Adam","09044444444","danieladam345@gmail.com"),
("Moses","peterson","09166666666","mosespeterson3866@gmail.com"),
("Enebong","Akpan","08122222222","enebongset3645@gmail.com"),
("Oluoma","sunday","09088888888","olutech345@gmail.com"),
("Henry","Johnson","09022334455","heryson45@gmail.com"),
("Emmanuel","Udo","09012345678","emmanueludo@gmail.com"),
("Nneka","Ogbonna","09093512673","nnekaodhonaya@gmail.com");




insert into Accounts
(customerid,Accountnumber,Accounttype,Balance)
values
(1,"0011223344","savings",100000),
(2,"1122334455","current",3000000),
(3,"1100223344","current",300000),
(4,"7755662222","savings",50000),
(5,"6611222265","savings",30000),
(6,"1123423423","current",500000),
(7,"5521437895","current",435450),
(8,"2266448395","savings",803765),
(9,"2635486543","current",130000),
(10,"8855332241","savings",536909);

select * from Accounts;

insert into Transactions
(AccountID,Transactiontype,Amount)
values
(1,"deposit",50000),
(3,"withdrawal",20000),
(2,"transfer",50000),
(5,"transfer",20000),
(4,"deposit",100000),
(6,"deposit",23900),
(8,"withdrawal",80000),
(10,"deposit",50000),
(7,"transfer",100000),
(9,"withdrawal",30000);

select * from Transactions;



insert into loan
(customerid,LoanAmount,InterestRate)
values
(1,20000,10),
(2,40000,10),
(3,50000,15),
(4,70000,15),
(5,55000,15),
(6,60000,15),
(7,25000,10),
(8,30000,10),
(9,100000,20),
(10,90000,15);

select * from loan;


insert into Branches
(BranchName,Location)
values
('Head Office', 'Lagos'),
('Victoria Island Branch', 'Lagos'),
('Garki Branch', 'Abuja'),
('Port Harcourt Branch', 'Rivers'),
('Uyo Branch', 'Akwa Ibom'),
('Enugu Branch', 'Enugu'),
('Ibadan Branch', 'Oyo'),
('Benin Branch', 'Edo'),
('Owerri Branch', 'Imo'),
('Kano Branch', 'Kano');

select * from Branches;

-- Tasks--
-- Display all customers--
select * from customers;

-- Display customers names and account numbers--
select customers.firstname,customers.lastname,Accounts.Accountnumber
from customers
left join
Accounts on customers.customerid = Accounts.customerid;

-- Display customers with account balance greater than 100,000--
select concat (customers.firstname," ",customers.lastname)As "Customer Name" ,Accounts.Balance As "Account Balance"
from customers
inner join
Accounts on customers.customerid = Accounts.customerid
where Accounts. balance > 100000;

-- Arrange customers by account balance from highest to lowest--
select concat(customers.firstname," ",customers.lastname)As "Coustomer Name", Accounts.Balance As "Account Balance"
from customers
left join
Accounts on customers.customerid = Accounts.customerid 
order by (Accounts.Balance)desc;

-- Display customers whose name begin with M--
select concat(customers.firstname, " ", customers.lastname)As "customers Name" from customers 
where customers.firstname like "m%" 
		or customers.lastname like "m%";

-- Display customers with balances between 50,000 t0 500,000--
select concat( customers.firstname," ",customers.lastname) as "customers", Accounts.Accountnumber, Accounts.balance
from customers
inner join Accounts on customers.customerid = Accounts.customerid where (Accounts.balance) between
50000 and 500000;


 -- display customers whoose Accounttype is savings or current--
 select concat(customers.firstname," ",customers.lastname)as customers,Accounts.Accountnumber,Accounts.Accounttype
 from customers
 inner join
 Accounts on customers.customerid = Accounts.customerid
 where Accounts.Accounttype = "savings";
 
  select concat(customers.firstname," ",customers.lastname)as customers,Accounts.Accountnumber,Accounts.Accounttype
 from customers
 inner join
 Accounts on customers.customerid = Accounts.customerid
 where Accounts.Accounttype = "current";
 
 
 -- counts the total number of cussomers--
 select count(*) from customers;
 
 -- calculate the total amount deposited in all accounts--
 select sum(Amount) As "Total Deposit"
from Transactions
where TransactionType = 'Deposit';


-- calculate the average account balance--
select avg(balance) as "Average Balance" from Accounts;
select AccountID, avg(balance) as "Average Balance"from Accounts  group by Accounts.AccountID ;

-- Display the smallest account balance--
select min(balance)as "Smallest Amount" from Accounts;

-- Display the highest account balance-
select max(balance)as "Highest Amount" from Accounts;

alter table accounts
add BranchID int ;



update Accounts
set BranchID = 1
where AccountID = 1;
update Accounts
set BranchID = 2
where AccountID = 2;
update Accounts
set BranchID = 3
where AccountID = 3;
update Accounts
set BranchID = 4
where AccountID = 4;
update Accounts
set BranchID = 5
where AccountID = 5;
update Accounts
set BranchID = 6
where AccountID = 6;
update Accounts
set BranchID = 7
where AccountID = 7;
update Accounts
set BranchID = 8
where AccountID = 8;
update Accounts
set BranchID = 9
where AccountID = 9;
update Accounts
set BranchID = 10
where AccountID = 10;


alter table accounts
add foreign key(BranchID)
references Branches(BranchID);




-- Display the total number of accounts in each branch--


select branches.BranchName, count( Accounts.Accountnumber) as "totalaccount"
from Accounts
inner join 
branches on accounts.BranchID = branches.BranchID
Group by Branches.BranchID,branches.BranchName;

-- Display branches with more than 10 customer account--
select branches.BranchID, branches.BranchName,
count(accounts.Accountnumber) as "TotalAccount" from
accounts
inner join branches on accounts.BranchID = branches.BranchID
group by branches.BranchID,branches.BranchName
having count(accounts.Accountnumber)>10;

-- Display the first five transaction--
select * from transactions order by TransactionID limit 5;

-- Display customer names and account balances--
select concat(customers.firstname," ",customers.lastname)as "customers Name", Accounts.Balance
from customers
inner join
Accounts on customers.customerid = accounts.customerid
order by customers.customerid;


-- Display customer names,account,numbers,and transaction amounts--
select concat(customers.firstname," ",customers.lastname)as "customer name",accounts.Accountnumber,transactions.Amount
from customers
inner join
accounts on customers.customerid = accounts.customerid
inner join
transactions on accounts.AccountID = transactions.AccountID
order by customers.customerid;

-- Display customer names, branch names,and account balance--
select concat(customers.firstname," ", customers.lastname)as "customers Name", Branches.Branchname,accounts.Balance
from customers
left join
accounts on customers.customerid = accounts.customerid
left join
branches on accounts.branchID = branches.BranchID
order by customers.customerid;

-- Display all customers, including those without any transaction records--
select concat(customers.firstname, " ", customers.lastname)as "customer",transactions.Amount
from customers
left join
accounts on customers.customerid = accounts.customerid
left join
transactions on accounts.AccountID = transactions.AccountID
order by customers.customerid;





--  Count customers, accounts, and branches
SELECT
    (SELECT COUNT(*) FROM customers) AS total_customers,
    (SELECT COUNT(*) FROM Accounts) AS total_accounts,
    (SELECT COUNT(*) FROM Branches) AS total_branches;

--  Analyze transactions by type
SELECT
    Transactiontype,
    COUNT(*) AS transaction_count,
    SUM(Amount) AS total_amount,
    AVG(Amount) AS average_amount
FROM Transactions
GROUP BY Transactiontype
ORDER BY total_amount DESC;

--  Find the accounts with the highest balances
SELECT
    c.FirstName,
    c.LastName,
    a.Accountnumber,
    a.Accounttype,
    a.Balance
FROM customers c
JOIN Accounts a ON c.customerid = a.customerid
ORDER BY a.Balance DESC
LIMIT 5;

--  Analyze loan amounts by interest rate
SELECT
    InterestRate,
    COUNT(*) AS number_of_loans,
    SUM(LoanAmount) AS total_loan_amount,
    AVG(LoanAmount) AS average_loan_amount
FROM Loan
GROUP BY InterestRate
ORDER BY InterestRate;

--  Calculate the total balance held in all accounts
SELECT
    SUM(Balance) AS total_account_balance,
    AVG(Balance) AS average_account_balance
FROM Accounts;

--  Analyze account distribution by branch
SELECT
    b.BranchName,
    b.Location,
    COUNT(a.AccountID) AS total_accounts,
    COALESCE(SUM(a.Balance), 0) AS total_account_balance
FROM Branches b
LEFT JOIN Accounts a ON b.BranchID = a.BranchID
GROUP BY b.BranchID, b.BranchName, b.Location
ORDER BY total_account_balance DESC;

-- Find customers who have no transactions
SELECT
    c.CustomerID,
    c.FirstName,
    c.LastName
FROM customers c
LEFT JOIN Accounts a ON c.CustomerID = a.CustomerID
LEFT JOIN Transactions t ON a.AccountID = t.AccountID
WHERE t.TransactionID IS NULL;







 
 
 




























