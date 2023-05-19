/*
Data Engineering
Use the provided information to create a table schema for each of the six CSV files. 

Be sure to do the following:

Remember to specify the data types, primary keys, foreign keys, and other constraints.

For the primary keys, verify that the column is unique. Otherwise, create a composite keyLinks to an external site., which takes two primary keys to uniquely identify a row.

Be sure to create the tables in the correct order to handle the foreign keys.

Import each CSV file into its corresponding SQL table.
*/

--Create departments table
CREATE TABLE departments(
	dept_no VARCHAR, 
	dept_name VARCHAR,
	PRIMARY KEY(dept_no)
);

--Create dept_emp table
CREATE TABLE dept_emp(
	emp_no INT,
	dept_no VARCHAR
);

ALTER TABLE dept_emp
ADD FOREIGN KEY (dept_no) REFERENCES departments (dept_no);

ALTER TABLE dept_emp
ADD FOREIGN KEY (emp_no) REFERENCES employees (emp_no);

ALTER TABLE dept_emp
ADD PRIMARY KEY (dept_no, emp_no);

SELECT *
FROM dept_emp;

--Create dept_manager table
CREATE TABLE dept_manager(
	dept_no VARCHAR,
	emp_no INT,
);
ALTER TABLE dept_manager
ADD PRIMARY KEY (dept_no, emp_no);

ALTER TABLE dept_manager
ADD FOREIGN KEY (dept_no) REFERENCES departments (dept_no);

ALTER TABLE dept_manager
ADD FOREIGN KEY (emp_no) REFERENCES employees (emp_no);

SELECT *
FROM dept_manager;

--Create employees table
CREATE TABLE employees(
	emp_no INT NOT NULL,
	emp_title_id VARCHAR NOT NULL, 
	birth_date DATE NOT NULL,
	first_name VARCHAR NOT NULL,
	last_name VARCHAR NOT NULL,
	sex	VARCHAR,
	hire_date DATE NOT NULL,
	PRIMARY KEY (emp_no),
	FOREIGN KEY (emp_title_id) REFERENCES titles (title_id)
);

SELECT *
FROM employees;

--CREATE salaries table
CREATE TABLE salaries(
	emp_no INT NOT NULL,
	salary INT NOT NULL
);

ALTER TABLE salaries
ADD PRIMARY KEY (emp_no, salary);

ALTER TABLE salaries
ADD FOREIGN KEY (emp_no) REFERENCES employees (emp_no);

SELECT *
FROM salaries;

--CREATE titles table
CREATE TABLE titles(
	title_id VARCHAR NOT NULL,
	title VARCHAR NOT NULL,
	PRIMARY KEY (title_id)
);

SELECT *
FROM titles;