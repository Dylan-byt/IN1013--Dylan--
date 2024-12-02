-- task 5

-- 1

SELECT s.first_name, s.surname, b.bill_date, COUNT(*) AS num_bills
FROM restBill b
JOIN restStaff s ON b.waiter_no = s.staff_no
GROUP BY b.waiter_no, b.bill_date
HAVING COUNT(*) >= 2;

-- 2

SELECT t.room_name, COUNT(*) AS num_tables
FROM restRest_table t
WHERE t.no_of_seats > 6
GROUP BY t.room_name;

-- 3

SELECT t.room_name, SUM(b.bill_total) AS total_bills
FROM restRest_table t
JOIN restBill b ON t.table_no = b.table_no
GROUP BY t.room_name;

-- 4

SELECT s.first_name AS headwaiter_first_name, 
       s.surname AS headwaiter_surname, 
       SUM(b.bill_total) AS total_bill_amount
FROM restStaff s
JOIN restStaff w ON s.staff_no = w.headwaiter
JOIN restBill b ON w.staff_no = b.waiter_no  
GROUP BY s.staff_no
ORDER BY total_bill_amount DESC;

-- 5

SELECT b.cust_name
FROM restBill b
GROUP BY b.cust_name
HAVING AVG(b.bill_total) > 400;

-- 6

SELECT s.first_name, 
       s.surname, 
       b.bill_date, 
       COUNT(*) AS number_of_bills
FROM restBill b
JOIN restStaff s ON b.waiter_no = s.staff_no
GROUP BY s.staff_no, b.bill_date
HAVING COUNT(*) >= 3;