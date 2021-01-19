--Introduction to basic Common Table Expressions
WITH AverageTotal
AS
(
	SELECT BillingCountry,Round(AVG(Total),2) as Average_Value
	from Invoice
	group by BillingCountry
)
select * from AverageTotal order by Average_Value desc;

select BillingCountry, avgttl.Average_Value
from Invoice i
inner join
AverageTotal avgttl
on i.BillingCountry =  avgttl.Country
where avgttl.Average_Value > 6;


----Removing duplicate rows using Common Table Expressions.

with Duplicates
as
(
select
    InvoiceId,CustomerId,InvoiceDate,BillingAddress,BillingCity,
    BillingState,BillingCountry,BillingPostalCode,Total, min(InvoiceId) AS MIN_ID
    from Invoice
    group by InvoiceId,CustomerId,InvoiceDate,BillingAddress,BillingCity,
    BillingState,BillingCountry,BillingPostalCode,Total
)

DELETE FROM Invoice
WHERE InvoiceId NOT IN (SELECT MIN_ID FROM Duplicates);