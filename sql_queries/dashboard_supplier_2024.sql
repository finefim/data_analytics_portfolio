SELECT
  suppliers.supplier,
  COUNT(email) AS number_of_trucks,
  SUM(resultvat0) AS profit,
  SUM(totalpriceincvat) AS net_sales,
  ROUND(AVG(suppliers.margin),2) AS average_margin

FROM `vpglobaloy.pellettirekkafi.clean_sales` AS suppliers
WHERE
  date BETWEEN DATE('2024-01-01') AND DATE('2024-12-31')
GROUP BY
  supplier
