select * 
from VideoGameSales

--Shows most sold WiiU games in North America

SELECT Name, Platform, Publisher, Na_Sales
from VideoGameSales
where Publisher = 'Nintendo' and Platform = 'WiiU'
Order by Na_Sales DESC


--Shows percentage of North American Sales for WiiU games

SELECT Name, Platform, Publisher, Na_Sales, Global_Sales, 
(Na_Sales/Global_Sales)*100 As Percentage_Of_Sales_Na
from VideoGameSales
where Publisher = 'Nintendo' and Platform = 'WiiU'

--CTE For Reuse

WITH CTE AS 
(SELECT Name, Platform, Publisher, Na_Sales, Global_Sales, 
(Na_Sales/Global_Sales)*100 As Percentage_Of_Sales_Na
from VideoGameSales
where Publisher = 'Nintendo' and Platform = 'WiiU')
Select * From CTE
Order By Global_Sales Desc

--North American Sales of Mario Kart 8 vs Japanese Sales 

SELECT Name, Platform, Publisher, Na_Sales, JP_Sales, Global_Sales, 
(Na_Sales/Global_Sales)*100 As Percentage_Of_Sales_Na, 
(Jp_Sales/Global_Sales)*100 As Percentage_Of_Sales_JP 
from VideoGameSales
where Name = 'Mario Kart 8' and Platform = 'WiiU'


--Shows top 10 selling Pokemon Games


Select top 10 Name, PLATFORM, global_sales
from VideoGameSales
Where Name like 'Pokemon%'
group by Name, PLATFORM, global_sales
order by global_sales desc


--Top 10 best selling games(all nintendo!)


Select top 10 Name, PLATFORM, global_sales
from VideoGameSales
group by Name, PLATFORM, global_sales
order by global_sales desc


--What year did the best selling video game come out?

Select top 1 name, year, global_sales
From videogamesales
Order by global_sales desc;


--Best selling PS4 Game?


Select top 1 Name, PLATFORM, global_sales
from videogamesales
where platform = 'PS4'
order by global_sales desc