
SELECT em.emp_no, em.first_name, em.last_name, em.birth_date, ti.title, ti.from_date, ti.to_date
INTO new_emp_db
FROM employees as em
INNER JOIN titles as ti
ON em.emp_no = ti.emp_no
WHERE em.birth_date BETWEEN ' 1952-01-01' AND '1955-12-31'
ORDER BY em.emp_no;

SELECT * FROM new_emp_db

-- # of Employees bu their most recen job title
SELECT DISTINCT ON (emp_no)
emp_no,
first_name,
last_name,
title
INTO unique_title
FROM new_emp_db
ORDER BY emp_no, to_date DESC;

select * FROM unique_title


SELECT COUNT(emp_no), 
title 
INTO retiring_titles
FROM unique_title
GROUP BY title
ORDER BY COUNT(emp_no) DESC;

SELECT * FROM retiring_titles

-- Delivery 2

SELECT DISTINCT ON (em.emp_no) em.emp_no, em.first_name, em.last_name, em.birth_date, de.from_date, de.to_date,
ti.title
INTO mentorship_table
FROM employees as em
INNER JOIN dept_employee as de
ON em.emp_no = de.emp_no
INNER JOIN titles as ti
ON em.emp_no = ti.emp_no
WHERE em.birth_date BETWEEN '1965-01-01' AND '1965-12-31'
AND de.to_date = '9999-01-01'
ORDER BY em.emp_no, de.from_date Desc;

SELECT * FROM mentorship_table