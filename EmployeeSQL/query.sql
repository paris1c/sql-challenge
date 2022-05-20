-- List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees e
LEFT JOIN salaries AS s
ON e.emp_no=s.emp_no
ORDER BY e.last_name ASC;

-- List first name, last name, and hire date for employees who were hired in 1986. 
SELECT first_name, last_name, hire_date
FROM employees 
WHERE hire_date > '1986-12-31'
ORDER BY hire_date ASC

/* List the manager of each department with the following information: 
department number, department name, the manager's employee number, last name, first name. */
Select m.dept_no, dept_name, m.emp_no, Last_name, first_name
FROM dept_manager m 
RIGHT JOIN departments d 
	ON m.dept_no = d.dept_no
LEFT JOIN employees e
	ON m.emp_no = e.emp_no 
ORDER BY dept_name ASC

/* List the department of each employee with the following information:
employee number, last name, first name, and department name. */
SELECT e.emp_no, last_name, first_name, dept_name
FROM employees e
JOIN dept_emp de
	ON e.emp_no = de.emp_no
JOIN departments d
	ON de.dept_no = d.dept_no
ORDER BY last_name ASC

--List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT last_name, first_name, sex
FROM employees
WHERE first_name ='Hercules' AND last_name LIKE 'B%'

-- List all employees in the Sales department, including their 
-- employee number, last name, first name, and department name.
SELECT e.emp_no, last_name, first_name, dept_name
FROM employees e
JOIN dept_emp de
	ON e.emp_no = de.emp_no
JOIN departments d
	ON de.dept_no = d.dept_no
WHERE dept_name = 'Sales'

-- List all employees in the Sales and Development departments, 
-- including their employee number, last name, first name, and department name.
SELECT e.emp_no, last_name, first_name, dept_name
FROM employees e
JOIN dept_emp de
	ON e.emp_no = de.emp_no
JOIN departments d
	ON de.dept_no = d.dept_no
WHERE dept_name = 'Sales' OR dept_name = 'Development'  
ORDER BY last_name ASC

-- List the frequency count of employee last names (i.e., how many employees share each last name) in descending order.
SELECT last_name, COUNT(last_name) AS "frequency count"
FROM employees
GROUP BY last_name
ORDER BY "frequency count" DESC;



