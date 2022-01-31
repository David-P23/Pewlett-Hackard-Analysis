# Pewlett-Hackard-Analysis  
  
## 1. Employees & Retirement  
  
First I created the following retirement Table pertaining to the employees born between 1/1/1952 and 12/31/1955.  
  
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


Next I used the DISTINCT ON statement to eliminate the duplicate rows such as first/last name, titles using the DISTINCT ON statement.  

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

The above queries produced the table below:  

  
This table is shown below:  
  
![retiring_employees_by_title](https://user-images.githubusercontent.com/91306342/150102475-80dcd2c2-d816-4cdf-9210-ffba6d1c1915.png)
  
  
## 2. Mentorship Eligibility  

To determine mentorship eligibility, I made a table including current employees who were born between January 1, 1965 and December 31, 1965:  
  
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
  
The employees meeting the above criteria are shown below

![mentorship_eligibility](https://user-images.githubusercontent.com/91306342/150105608-11328dc3-e2a8-4a85-9375-de0f9244815f.PNG)


## 3. Analysis & Summary  

Management had good reason to prioritize the analysis of this data:  

- Because these roles are largely technichal and senior positions, they likely can't be filled easily by an external candidate  
- Our earlier search posed that under 2,000 employees met the criteria for the mentorship program, or about 2 for every 100 jobs left vacant.  
- Just over 90,000 jobs will need to be filled resulting from the employees nearing retirement  
- A look at the raw data shows that this accounts for just under a third of the current workforce!  

These are evident in the tables below

![Mentee_count](https://user-images.githubusercontent.com/91306342/150113442-7ffedff7-9baa-464f-981e-ed39e6870942.PNG)

<img width="182" alt="retiring_mentors" src="https://user-images.githubusercontent.com/91306342/150115480-9e52a15f-1cb2-4aad-bf41-799a2306113b.png">

Immediate measures should be taken to mitigate the oncoming wave of retirement. I would recommend exploring  
means beyond the mentorship program, or at the very least expanding it. This should further minimize the loss  
of human capital.

