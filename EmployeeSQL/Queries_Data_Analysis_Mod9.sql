--Queries
/*
Query_1: List the employee number, last name, first name, sex, and salary of each employee.

Query_2: List the first name, last name, and hire date for the employees who were hired in 1986.

Query_3: List the manager of each department along with their department number, department name, employee number, last name, and first name.

Query_4: List the department number for each employee along with that employee’s employee number, last name, first name, and department name.

Query_5: List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.

Query_6: List each employee in the Sales department, including their employee number, last name, and first name.

Query_7: List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.

Query_8: List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
*/

--Query_1: List the employee number, last name, first name, sex, and salary of each employee.
CREATE VIEW Query_1 AS
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees
	INNER JOIN salaries
	ON (employees.emp_no = salaries.emp_no)
ORDER BY salaries.salary DESC;

--Query_2: List the first name, last name, and hire date for the employees who were hired in 1986.
CREATE VIEW Query_2 AS
SELECT employees.first_name, employees.last_name, employees.hire_date
FROM employees
WHERE employees.hire_date > '1986-01-01'
	AND employees.hire_date < '1987-01-01'
ORDER BY employees.hire_date DESC;

--Query_3: List the manager of each department along with their department number, department name, employee number, last name, and first name.
CREATE VIEW Query_3 AS
SELECT departments.dept_name, departments.dept_no, dept_manager.emp_no, employees.last_name, employees.first_name
FROM dept_manager
	INNER JOIN departments
		ON (dept_manager.dept_no = departments.dept_no)
	INNER JOIN employees
		ON (dept_manager.emp_no = employees.emp_no)
	ORDER BY departments.dept_name, employees.last_name;

--Query_4: List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
CREATE VIEW Query_4 AS
SELECT departments.dept_name, departments.dept_no, dept_emp.emp_no, employees.last_name, employees.first_name
FROM departments
	INNER JOIN dept_emp
		ON (departments.dept_no = dept_emp.dept_no)
	INNER JOIN employees
		ON (dept_emp.emp_no = employees.emp_no)
	ORDER BY departments.dept_name, employees.last_name;

--Query_5: List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
CREATE VIEW Query_5 AS
SELECT employees.first_name, employees.last_name, employees.sex
FROM employees
WHERE employees.first_name = 'Hercules' AND employees.last_name LIKE 'B%'
ORDER BY employees.last_name;

--Query_6: List each employee in the Sales department, including their employee number, last name, and first name.
CREATE VIEW Query_6 AS
SELECT departments.dept_name, employees.emp_no, employees.last_name, employees.first_name
FROM departments
	INNER JOIN dept_emp
		ON (departments.dept_no = dept_emp.dept_no)
	INNER JOIN employees
		ON (dept_emp.emp_no = employees.emp_no)
WHERE departments.dept_name = 'Sales'
ORDER BY departments.dept_name, employees.last_name;

--Query_7: List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
CREATE VIEW Query_7 AS
SELECT departments.dept_name, employees.emp_no, employees.last_name, employees.first_name
FROM departments
	INNER JOIN dept_emp
		ON (departments.dept_no = dept_emp.dept_no)
	INNER JOIN employees
		ON (dept_emp.emp_no = employees.emp_no)
WHERE departments.dept_name = 'Sales' OR departments.dept_name = 'Development'
ORDER BY departments.dept_name, employees.last_name;

--Query_8: List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
CREATE VIEW Query_8 AS
SELECT employees.last_name, COUNT (last_name) AS Count_Last_Name
FROM employees
GROUP BY employees.last_name 
ORDER BY Count_Last_Name DESC;
