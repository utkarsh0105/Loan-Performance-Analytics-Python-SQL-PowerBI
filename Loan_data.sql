create database loan_data;
use loan_data;
SELECT COUNT(*) FROM loan_data;
SELECT * FROM loan_data LIMIT 10;


## 1. Total Loan Amount Disbursed

SELECT SUM(loan_amount) AS total_loan_amount
FROM loan_data;


---

## 2. Average Loan Amount

SELECT AVG(loan_amount) AS avg_loan_amount
FROM loan_data;


---

## 3. Loan Status Distribution


SELECT loan_status,
       COUNT(*) AS total_loans
FROM loan_data
GROUP BY loan_status
ORDER BY total_loans DESC;


---

## 4. Loan Status Percentage


SELECT loan_status,
       COUNT(*) AS loan_count,
       ROUND(COUNT(*) * 100.0 /
       (SELECT COUNT(*) FROM loan_data),2) AS percentage
FROM loan_data
GROUP BY loan_status;


---

## 5. Grade-wise Loan Amount


SELECT grade,
       SUM(loan_amount) AS total_loan_amount
FROM loan_data
GROUP BY grade
ORDER BY total_loan_amount DESC;


---

## 6. Average Interest Rate by Grade

SELECT grade,
       ROUND(AVG(int_rate),2) AS avg_interest_rate
FROM loan_data
GROUP BY grade
ORDER BY grade;

---

## 7. Purpose-wise Loan Analysis

SELECT purpose,
       COUNT(*) AS total_loans,
       SUM(loan_amount) AS total_amount
FROM loan_data
GROUP BY purpose
ORDER BY total_amount DESC;

---

## 8. Home Ownership Analysis

SELECT home_ownership,
       COUNT(*) AS customers,
       ROUND(AVG(loan_amount),2) AS avg_loan
FROM loan_data
GROUP BY home_ownership;


---

## 9. State-wise Loan Amount

SELECT address_state,
       SUM(loan_amount) AS total_loan_amount
FROM loan_data
GROUP BY address_state
ORDER BY total_loan_amount DESC
LIMIT 10;

---

## 10. Top 10 Highest Loans


SELECT id,
       loan_amount,
       annual_income,
       grade
FROM loan_data
ORDER BY loan_amount DESC
LIMIT 10;


---

## 11. Charged-Off (Default) Loan Analysissql

SELECT grade,
       COUNT(*) AS default_count
FROM loan_data
WHERE loan_status = 'Charged Off'
GROUP BY grade
ORDER BY default_count DESC;


---

## 12. Fully Paid vs Charged Off Comparison

SELECT loan_status,
       ROUND(AVG(loan_amount),2) AS avg_loan,
       ROUND(AVG(int_rate),2) AS avg_interest
FROM loan_data
WHERE loan_status IN ('Fully Paid','Charged Off')
GROUP BY loan_status;


---

## 13. Income vs Loan Amount

SELECT
    CASE
        WHEN annual_income < 50000 THEN 'Low Income'
        WHEN annual_income BETWEEN 50000 AND 100000 THEN 'Medium Income'
        ELSE 'High Income'
    END AS income_group,
    ROUND(AVG(loan_amount),2) AS avg_loan_amount
FROM loan_data
GROUP BY income_group;


---

## 14. Monthly Loan Trend

SELECT
    YEAR(issue_date) AS loan_year,
    MONTH(issue_date) AS loan_month,
    COUNT(*) AS total_loans,
    SUM(loan_amount) AS total_amount
FROM loan_data
GROUP BY loan_year, loan_month
ORDER BY loan_year, loan_month;


---

## 15. Complete Dashboard Query

SELECT
    COUNT(*) AS total_loans,
    SUM(loan_amount) AS total_loan_amount,
    ROUND(AVG(loan_amount),2) AS avg_loan_amount,
    ROUND(AVG(int_rate),2) AS avg_interest_rate,
    SUM(total_payment) AS total_payment_received
FROM loan_data;


