-- Calculating metrics dynamically for the current month
SELECT
    wholesales.email,
    COUNT(email) AS number_of_orders,
    SUM(wholesales.total_out_vat25) AS brutto_sales_vat25,
    SUM(wholesales.result_vat0) AS total_resultvat0,
    AVG(wholesales.margin) AS average_margin,
    ROUND(SUM(wholesales.result_vat0) / SUM(SUM(wholesales.result_vat0)) OVER () * 100, 2) AS percent_of_total_sales
FROM
    vpglobaloy.pellettirekkafi.gs_sales AS wholesales
WHERE 
    wholesales.invoice_out IS NOT NULL AND
    EXTRACT(YEAR FROM wholesales.date) = EXTRACT(YEAR FROM CURRENT_DATE())
    AND EXTRACT(MONTH FROM wholesales.date) = EXTRACT(MONTH FROM CURRENT_DATE())
GROUP BY 
    email;
