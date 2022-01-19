## Pewlett-Hackard-Analysis

# Employees & Retirement

First a query was written to Create the following retirement Table pertaining to the given dates of 1/1/1952 and 12/31/1955.

SELECT employees.emp_no,
    employees.first_name,
    employees.last_name,
    titles.title,
    titles.from_date,
    titles.to_date
    
INTO retirement_titles
FROM employees
LEFT JOIN titles
ON employees.emp_no = titles.emp_no
WHERE employees.birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY employees.emp_no
SELECT * FROM retirement_titles


Next I removed the duplicate rows such as first/last name, titles using the DISTINCT ON statement.

SELECT DISTINCT ON (retirement_titles.emp_no) retirement_titles.emp_no,
    retirement_titles.first_name,
    retirement_titles.last_name,
    retirement_titles.title
    
INTO unique_titles
FROM retirement_titles
ORDER BY retirement_titles.emp_no, retirement_titles.to_date DESC;
SELECT * FROM unique_titles


I then used the Count function to create a table chowing retiree number by job title.

SELECT title, COUNT(*)
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY 2 DESC
SELECT * FROM retiring_titles


