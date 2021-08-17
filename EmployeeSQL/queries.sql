-- Retrieve employee number, last name, first name, sex, and salary
SELECT e.emp_no,
	   e.last_name,
	   e.first_name,
	   e.sex,
	   s.salary
FROM employees e
JOIN salaries s USING (emp_no);

-- Retrieve first name, last name, and hire date for employees who were hired in 1986
SELECT first_name,
	   last_name,
	   hire_date
FROM employees 
WHERE hire_date BETWEEN '1986/1/1' AND '1986/12/31';

-- Retrieve the manager of each department with department number, department name, the manager's employee number, last name, first name
SELECT m.dept_no,
	   d.dept_name,
	   m.emp_no,
	   e.last_name,
	   e.first_name
FROM dept_manager m
JOIN departments d USING(dept_no)
JOIN employees e USING (emp_no);

-- Retrieve the department of each employee with employee number, last name, first name, and department name 
SELECT de.emp_no,
	   e.last_name,
	   e.first_name,
	   d.dept_name
FROM employees e
JOIN dept_employees de USING(emp_no)
JOIN departments d USING(dept_no);

-- Retrieve first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B"
SELECT first_name,
	   last_name,
	   sex
FROM employees 
WHERE first_name = 'Hercules' 
AND last_name LIKE 'B%';

-- Retrieve all employees in the Sales department, including their employee number, last name, first name, and department name
SELECT e.emp_no,
	   e.last_name,
	   e.first_name,
	   d.dept_name
FROM employees e
JOIN dept_employees de USING(emp_no)
JOIN departments d USING(dept_no)
WHERE dept_name = 'Sales';

-- Retrieve all employees in the Sales and Development departments, including their employee number, last name, first name, and department name
SELECT e.emp_no,
	   e.last_name,
	   e.first_name,
	   d.dept_name
FROM employees e
JOIN dept_employees de USING(emp_no)
JOIN departments d USING(dept_no)
WHERE dept_name = 'Sales' 
OR dept_name = 'Development';

-- In descending order, retrieve a frequency count of employee last names
SELECT last_name,
	   COUNT(last_name) AS "frequency_count"
FROM employees
GROUP BY last_name
ORDER BY frequency_count DESC;
