SELECT * FROM pizza.`dominos pizza sales`;
USE pizza;
SELECT * FROM `dominos pizza sales`;

#Total Revenue of Dominos Pizza in 2015
SELECT sum(TOTAL_PRICE) AS TOTAL_REVENUE FROM `dominos pizza sales`;

#Average Order value calculation = Revenue / Total Number of orders
SELECT * FROM `dominos pizza sales`;
SELECT COUNT(DISTINCT ORDER_ID) AS TOTAL_NUMBER_OF_ORDERS FROM `dominos pizza sales`;
SELECT SUM(TOTAL_PRICE)/COUNT(DISTINCT ORDER_ID) AS AVERAGE_ORDER_VALUE FROM `dominos pizza sales`;

#Total pizza sold = The sum of quantities of total pizza sold
SELECT SUM(QUANTITY) AS TOTAL_PIZZA_SOLD FROM `dominos pizza sales`;

#Total order = total number of order placed
SELECT COUNT(DISTINCT ORDER_ID) AS TOTAL_NUMBER_OF_ORDERS FROM `dominos pizza sales`;

#The average number of pizzas sold per order = Total Number of pizzas sold / Total Number of orders;
SELECT SUM(QUANTITY)/COUNT(DISTINCT ORDER_ID)AS AVERAGE_PIZZA_PER_ORDER FROM `dominos pizza sales`;

#Top selling pizzas by quantity
SELECT PIZZA_NAME, SUM(QUANTITY) AS TOTAL_SOLD
FROM `dominos pizza sales`
GROUP BY PIZZA_NAME
ORDER BY TOTAL_SOLD DESC
LIMIT 100;

#Monthly revenue trends for 2015
SELECT YEAR(ORDER_DATE) AS YEAR, MONTH(ORDER_DATE) AS MONTH, SUM(TOTAL_PRICE) AS MONTHLY_REVENUE
FROM `dominos pizza sales`
WHERE YEAR(ORDER_DATE) = 2015
GROUP BY YEAR, MONTH
ORDER BY YEAR, MONTH;

#____CHARTS REQUIREMENTS____

#Daily trends for total orders
SELECT ORDER_DATE, COUNT(DISTINCT ORDER_ID) AS TOTAL_ORDERS
FROM `dominos pizza sales`
WHERE ORDER_DATE BETWEEN '2015-01-01' AND '2015-12-31'  -- Specify your time period
GROUP BY ORDER_DATE
ORDER BY ORDER_DATE;

#Day wise trend of orders
SELECT DAYNAME(ORDER_DATE) AS DAY_OF_WEEK, COUNT(DISTINCT ORDER_ID) AS TOTAL_ORDERS
FROM `dominos pizza sales`
WHERE YEAR(ORDER_DATE) = 2015  -- Adjust the year as needed
GROUP BY DAY_OF_WEEK
ORDER BY FIELD(DAY_OF_WEEK, 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday');
    
#Hourly trends for total orders
SELECT HOUR(ORDER_TIME) AS HOUR_OF_DAY, COUNT(DISTINCT ORDER_ID) AS TOTAL_ORDERS
FROM `dominos pizza sales`
GROUP BY HOUR_OF_DAY
ORDER BY HOUR_OF_DAY;

#Percentage of sales by pizza CATEGORY
SELECT PIZZA_CATEGORY, SUM(TOTAL_PRICE) AS TOTAL_SALES
FROM `dominos pizza sales`
GROUP BY PIZZA_CATEGORY;

#Percentage of sales by pizza SIZE
SELECT PIZZA_SIZE, SUM(TOTAL_PRICE) AS TOTAL_SALES
FROM `dominos pizza sales`
GROUP BY PIZZA_SIZE;

#Top 5 best sellers by total pizza sold
SELECT PIZZA_NAME, SUM(QUANTITY) AS TOTAL_PIZZAS_SOLD
FROM `dominos pizza sales`
GROUP BY PIZZA_NAME
ORDER BY TOTAL_PIZZAS_SOLD DESC
LIMIT 5;

#Bottom 5 worst sellers by total pizza sold
SELECT PIZZA_NAME, SUM(QUANTITY) AS TOTAL_PIZZAS_SOLD
FROM `dominos pizza sales`
GROUP BY PIZZA_NAME
ORDER BY TOTAL_PIZZAS_SOLD ASC
LIMIT 5;

#Top 5 Pizza by Revenue
SELECT PIZZA_NAME, SUM(TOTAL_PRICE) AS TOTAL_REVENUE
FROM `dominos pizza sales`
GROUP BY PIZZA_NAME
ORDER BY TOTAL_REVENUE DESC
LIMIT 5;

#Bottom 5 Pizza by Revenue
SELECT PIZZA_NAME, SUM(TOTAL_PRICE) AS TOTAL_REVENUE
FROM `dominos pizza sales`
GROUP BY PIZZA_NAME
ORDER BY TOTAL_REVENUE ASC
LIMIT 5;

#Top 5 Pizza by number of orders
SELECT PIZZA_NAME, SUM(QUANTITY) AS TOTAL_ORDERS
FROM `dominos pizza sales`
GROUP BY PIZZA_NAME
ORDER BY TOTAL_ORDERS DESC
LIMIT 5;

#Bottom 5 Pizza by number of orders
SELECT PIZZA_NAME, SUM(QUANTITY) AS TOTAL_ORDERS
FROM `dominos pizza sales`
GROUP BY PIZZA_NAME
ORDER BY TOTAL_ORDERS ASC
LIMIT 5;