
-- Retirement Titles table for employees who are born between January 1, 1952 and December 31, 1955
SELECT 
e.emp_no,
e.first_name,
e.last_name,
tl.title,
tl.from_date,
tl.to_date
INTO retirement_titles
FROM employees as e 
INNER JOIN dept_emp AS de
ON (e.emp_no = de.emp_no)
INNER JOIN titles AS tl
ON (de.emp_no = tl.emp_no)
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no, last_name DESC;

-- Unique Titles table that contains the employee number, first and last name, and most recent title
SELECT DISTINCT ON (emp_no)
e.emp_no,
e.first_name,
e.last_name,
tl.title,
tl.from_date,
tl.to_date
INTO unique_titles2
FROM employees as e 
INNER JOIN dept_emp AS de
ON (e.emp_no = de.emp_no)
INNER JOIN titles AS tl
ON (de.emp_no = tl.emp_no)
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
	AND (tl.to_date = '9999-01-01')
ORDER BY emp_no, last_name DESC;

--  Retiring Titles table that contains the number of titles filled by employees who are retiring 
SELECT COUNT (title), ut2.title
FROM  unique_titles2 as ut2
GROUP BY ut2.title
ORDER BY count DESC;


-- Mentorship Eligibility table for current employees who were born between January 1, 1965 and December 31, 1965
SELECT DISTINT ON (emp_no)
e.emp_no,
e.first_name,
e.last_name,
e.birth_date,
de.from_date,
de.to_date,
tl.title
INTO mentorship_elig
FROM employees as e 
INNER JOIN dept_emp AS de
ON (e.emp_no = de.emp_no)
INNER JOIN titles AS tl
ON (de.emp_no = tl.emp_no)
WHERE (birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY emp_no DESC;