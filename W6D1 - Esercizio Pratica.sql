SHOW DATABASES;
USE ADVENTUREWORKSDW;
SHOW tables;
select * from dimproduct;

select 
ProductKey, ProductAlternateKey as 'Codice prodotto alternativo', EnglishProductName as 'Nome Prodotto',
Color as 'Colore', StandardCost, FinishedGoodsFlag as 'Prodotto finito'
from dimproduct;

select ProductKey, ProductAlternateKey, EnglishProductName,
Color,StandardCost, FinishedGoodsFlag
from dimproduct 
where FinishedGoodsFlag =1;

select ProductKey, ProductAlternateKey, EnglishProductName,
StandardCost, ListPrice
from dimproduct 
where ProductAlternateKey Like '%FR'
or ProductAlternateKey Like 'BK';

select ProductKey, ProductAlternateKey, EnglishProductName,
StandardCost, ListPrice,
ListPrice - StandardCost as Markup
from dimproduct;

select ProductKey, ProductAlternateKey, EnglishProductName,
ListPrice
from dimproduct
where EnglishProductName =1
and ListPrice between 1000 and 2000;

SHOW tables;
select * from dimemployee;

select FirstName, LastName, 
SalespersonFlag
from dimemployee
where SalesPersonFlag =1 ;

SHOW tables;
select * from factresellersales;

select SalesOrderNumber, SalesOrderLineNumber, OrderDate,
ProductKey, TotalProductCost, SalesAmount,
TotalProductCost - SalesAmount as Profit
from factresellersales
where OrderDate >= '2020-01-01'
and ProductKey in (597, 598, 477, 214)
order by 
OrderDate;

