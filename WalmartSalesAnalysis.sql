select * 
from Walmart

--Highest Weekly Sales in 2010
select top 1 store, date, weekly_sales
from Walmart
where date like '%2010%' 
order by date desc

--Highest temp in store 7?

Select Top 1 Store, MAX(Temperature) as Store7_HighestTemp
FROM Walmart
Where Store = '7'
Group BY Store
order by Store7_HighestTemp desc

--Sum of Sales From Each Store

Select DISTINCT(Store), Sum(Weekly_Sales) As Sales_Sum
From walmart
Group by Store
Order BY Sales_Sum Desc

--Select Highest Unemployment from Each Store Using this Query as CTE and Including Where = 'Store of Choice'


With CTE_Unemployment AS
(
Select Store, MAX(Unemployment) As Max_Unemployment
From Walmart
Group By Store
)
Select Store , Max_Unemployment
From CTE_Unemployment
Where Store = '2'

--Which Store has had the most unemployment?

Select Store, Max(Unemployment) As Max
From Walmart
Group By Store
HAVING Count(Store) >= 1
Order By Max Desc

--What Week was Fuel Price the Highest?

SET ROWCOUNT 1
Select DISTINCT(Date), Max(Fuel_Price) AS Highest_Fuel_Price
from Walmart
Group BY Date
Order By Highest_Fuel_Price DESC

