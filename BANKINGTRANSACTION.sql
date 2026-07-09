SELECT * FROM dimaccount;
SELECT * FROM dimbranch;
SELECT * FROM dimcustomer;
SELECT * FROM dimdate;
SELECT * FROM dimproduct;
SELECT * FROM dimproductcategory;
SELECT * FROM dimproductsubcategory;
SELECT * FROM facttransaction

-- ALL QUESTIONS


--total transaction amount
select sum(transactionamount) as total_amount
from facttransaction

--total transactions
select count(transactionid) as total_transaction
from facttransaction

--total number of customers
select count(customerid) as total_customer
from dimcustomer


--Find the Total Number of Branches
select count(branchid) as total_branch 
from dimbranch

--Find the Total Number of Accounts
select count(accountid) as total_account
from dimaccount

-- Find the Total Transaction Amount by Transaction Type
select transactiontype, sum(transactionamount) as total_tranasaction
from facttransaction
group by transactiontype


--Find the Total Number of Transactions by Transaction Type
select transactiontype, count(transactionid) as total_tranasaction
from facttransaction
group by transactiontype

-- Find the Total Transaction Amount by Transaction Channel

select transactionchannel, sum(transactionamount) as total_amount
from facttransaction
group by transactionchannel
order by total_amount desc


-- Find the Average Transaction Amount by Transaction Type

select transactiontype, avg(transactionamount) as avg_amount
from facttransaction
group by transactiontype
order by avg_amount desc

-- Find the Total Account Balance by Account Type

select accounttype, sum(balance) as total_balance
from dimaccount
group by accounttype
order by total_balance desc

-- Find the Total Number of Customers by Gender

select gender, count(customerid) as total_customer
from dimcustomer
group by gender


-- Find the Total Transaction Amount by Account Type
select a.accounttype, sum(t.transactionamount) as total_amount
from dimaccount a
join
facttransaction t
on a.accountid=t.accountid
group by a.accounttype
order by total_amount desc


--Find the Total Number of Transactions by Account Type
select a.accounttype, count(t.transactionid) as total_transaction
from dimaccount a 
join
facttransaction t
on a.accountid=t.accountid
group by a.accounttype
order by total_transaction desc


--Find the Total Transaction Amount by Branch

select b.branchname, sum(t.transactionamount) as total_amount
from facttransaction t
join
dimaccount a
on t.accountid=a.accountid
join
dimbranch b
on a.branchid=b.branchid
group by b.branchname
order by total_amount desc

--Find the Total Number of Transactions by Branch
select b.branchname, count(t.transactionid) as total_transaction
from dimbranch b
join
dimaccount a
on b.branchid=a.branchid
join
facttransaction t
on t.accountid=a.accountid
group by b.branchname
order by total_transaction desc

--Find the Total Transaction Amount by Product Category
select pc.productcategoryname, sum(t.transactionamount) as total_amount
from facttransaction t
join
dimproduct p
on t.productid=p.productid
join
dimproductsubcategory ps
on p.productsubcategoryid=ps.productsubcategoryid
join
dimproductcategory pc
on ps.productcategoryid=pc.productcategoryid
group by pc.productcategoryname
order by total_amount desc


-- Find the Total Number of Customers by Customer Segment

select customersegment, count(customerid) as total_customer
from dimcustomer
group by customersegment
order by total_customer desc

-- Find the Total Transaction Amount by Year

select d.year, sum(t.transactionamount) as total_amount
from dimdate d
join facttransaction t
on d.datekey=t.datekey
group by d.year
order by d.year
