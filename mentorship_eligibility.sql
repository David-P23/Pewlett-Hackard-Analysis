SELECT DISTINCT ON (employees.emp_no) employees.emp_no,  
	employees.first_name,  
	employees.last_name,  
	employees.birth_date,  
	dept_emp.from_date,  
	dept_emp.to_date,  
	titles.title      
INTO mentorship_eligibility  
FROM employees  
LEFT JOIN dept_emp  
ON employees.emp_no = dept_emp.emp_no  
LEFT JOIN titles  
ON titles.emp_no = employees.emp_no  
WHERE employees.birth_date BETWEEN '1965-01-01' AND '1965-12-31'  
ORDER BY employees.emp_no  
SELECT * FROM mentorship_eligibility 