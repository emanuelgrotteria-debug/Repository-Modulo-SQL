show databases;
USE AdventureWorksDW;

#Esercizio 1
#Esponi lʼanagrafica dei prodotti indicando per ciascun prodotto anche la sua sottocategoria DimProduct, DimProductSubcategory).

select ProductKey,
EnglishProductName,
EnglishProductSubcategoryName
from dimproduct s 
join dimproductsubcategory p 
on s.ProductSubcategoryKey = p.ProductSubcategoryKey;

#Esercizio2 
#Esponi lʼanagrafica dei prodotti indicando per ciascun prodotto la sua sottocategoria e la sua categoria (DimProduct, DimProductSubcategory, DimProductCategory)

select ProductKey,
EnglishProductName,
EnglishProductCategoryName,
EnglishProductSubcategoryName
from dimproduct s
join dimproductsubcategory p 
on s.ProductSubcategoryKey = p.ProductSubcategoryKey
join dimproductcategory c 
on p.ProductcategoryKey = c.ProductcategoryKey;

#Esercizio 3 
#Esponi lʼelenco dei soli prodotti venduti (DimProduct, FactResellerSales)

select p.ProductKey,
p.ProductAlternateKey,
p.EnglishProductName
from dimproduct p
where p.Productkey in (select s.ProductKey from factresellersales s);

select distinct s.ProductKey
from factresellersales s;

#Esercizio4
#Esponi lʼelenco dei prodotti non venduti (considera i soli prodotti finiti cioè quelli per i quali il campo FinishedGoodsFlag è uguale a 1)
#Subquery

select ProductKey,
ProductAlternateKey,
EnglishProductName
from dimproduct
where ProductKey not in ( select ProductKey
                          from factresellersales
                          )
and FinishedGoodsFlag = 1;                          

#Join
select p.ProductKey, sales.ProductKey
from dimproduct p
left join factresellersales sales
on p.ProductKey = sales.ProductKey
where sales.ProductKey is Null
and FinishedGoodsFlag = 1;

#esercizio5 
#Esponi lʼelenco delle transazioni di vendita (FactResellerSales) indicando anche il nome del prodotto venduto (DimProduct)

select s.SalesOrderNumber,
s.SalesOrderLineNumber, (select p.EnglishProductName
						 from dimproduct p
                         where p.ProductKey = s.ProductKey) AS ProductName,
                         s.OrderDate,
                         s.UnitPrice,
                         s.OrderQuantity,
                         s.TotalProductCost
                         from factresellersales s;
#Join                       
 select s.SalesOrderNumber,
 s.SalesOrderLineNumber,
 p.EnglishProductName,
 s.OrderDate,
 s.UnitPrice,
 s.OrderQuantity,
 s.TotalProductCost
 from factresellersales s
 inner join dimproduct p
on s.ProductKey = p.ProductKey;
  


 
                         
                         
                          




