# Top 10 customers 2024 by number of orders, profit, average margin, total sales, % of taotal sales
SELECT
    clean_sales.email,
    COUNT(email) AS number_of_orders,
    SUM(clean_sales.resultvat0) AS total_resultvat0,
    SUM(clean_sales.totalpriceincvat) AS total_turnover,
    AVG(clean_sales.margin) AS average_margin,
    ROUND(SUM(clean_sales.resultvat0) / SUM(SUM(clean_sales.resultvat0)) OVER () * 100, 2) AS percent_of_total_sales
FROM
    `vpglobaloy.pellettirekkafi.clean_sales` AS clean_sales
WHERE 
    clean_sales.date BETWEEN DATE('2024-01-01') AND DATE('2024-12-31')
GROUP BY 
    email
ORDER BY
    total_turnover DESC
    LIMIT 10
