SELECT * FROM houseprices 
LIMIT 5;

SELECT DISTINCT(street)
FROM houseprices;

SELECT AVG(saleprice)
FROM houseprices;

--saleprice by street type 
SELECT AVG(saleprice),COUNT(*),street
FROM houseprices
GROUP BY street
ORDER BY AVG(saleprice)DESC;

--average saleprice by month sold 
SELECT AVG(saleprice),COUNT(*),mosold
FROM houseprices 
GROUP BY mosold
ORDER BY AVG(saleprice)DESC;
--result low count per month 

--split year into first half second
SELECT AVG(saleprice),
		(SELECT AVG(saleprice)
			FROM houseprices
			WHERE mosold>6)AS secondhalf
FROM houseprices
WHERE mosold<6;


--saleprice by financial quarter 
SELECT AVG(saleprice)AS avg_price,MAX(saleprice),
		MIN(saleprice),COUNT(*), AVG(lotarea)AS avg_lotarea,
	CASE WHEN mosold BETWEEN 1 AND 3 THEN '1st Quarter'
		WHEN mosold BETWEEN 4 AND 6 THEN '2nd Quarter'
		WHEN mosold BETWEEN 7 AND 9 THEN '3rd Quarter'
		ELSE '4th Quarter' END AS quarter
FROM houseprices
GROUP BY quarter
ORDER BY AVG(saleprice)DESC;

--saleprice by grouped yearbuilt 
SELECT AVG(saleprice),MAX(saleprice),MIN(saleprice),COUNT(*),
	CASE WHEN yearbuilt<=1970 THEN 'Before 1970'
		WHEN yearbuilt>1970 THEN 'After 1970'
		END AS before_after_1970
FROM houseprices 
GROUP BY before_after_1970
ORDER BY AVG(saleprice)DESC;

--garage type saleprice count
SELECT DISTINCT(garagetype), AVG(saleprice)AS avg_price,MAX(saleprice),
		MIN(saleprice),COUNT(*), AVG(lotarea)AS avg_lotarea
FROM houseprices 
GROUP BY garagetype
ORDER BY AVG(saleprice)DESC;

--lot shape saleprice
SELECT DISTINCT(lotshape),AVG(saleprice)AS avg_price,MAX(saleprice),
		MIN(saleprice),COUNT(*), AVG(lotarea)AS avg_lotarea
FROM houseprices 
GROUP BY lotshape
ORDER BY AVG(saleprice)DESC;

--lot config saleprice
SELECT DISTINCT(lotconfig),AVG(saleprice),MAX(saleprice),MIN(saleprice),COUNT(*)
FROM houseprices 
GROUP BY lotconfig
ORDER BY AVG(saleprice)DESC;


--yearsold saleprice
SELECT DISTINCT(yrsold),AVG(saleprice)AS avg_price, MAX(saleprice),Min(saleprice),
		COUNT(*),AVG(lotarea)AS avg_lotarea
FROM houseprices
GROUP BY yrsold
ORDER BY AVG(saleprice)DESC;


--bedrooms saleprice 
SELECT DISTINCT(bedroomabvgr),AVG(saleprice)AS avg_price, MAX(saleprice),Min(saleprice),
		COUNT(*),AVG(lotarea)AS avg_lotarea
FROM houseprices
GROUP BY bedroomabvgr
ORDER BY AVG(saleprice)DESC;