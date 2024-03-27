DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS titles;


CREATE TABLE departments (
	dept_no VARCHAR NOT NULL,
	dept_name VARCHAR NOT NULL,
	CONSTRAINT departments_pk PRIMARY KEY (dept_no)
);

select *
from departments;

CREATE TABLE dept_emp (
	emp_no INT,
	dept_no VARCHAR NOT NULL
);

select *
from dept_emp;

CREATE TABLE dept_manager (
	dept_no VARCHAR NOT NULL,
	emp_no INT
);

select *
from dept_manager;

CREATE TABLE employees (
	emp_no INT NOT NULL,
	CONSTRAINT employees_pk PRIMARY KEY (emp_no),
	emp_title_id VARCHAR NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR NOT NULL,
	last_name VARCHAR NOT NULL,
	sex VARCHAR NOT NULL,
	hire_date DATE NOT NULL
);

select *
from employees;


CREATE TABLE salaries (
	emp_no INT,
	salary INT
);

select *
from salaries;

CREATE TABLE titles (
	title_id VARCHAR NOT NULL,
	CONSTRAINT titles_pk PRIMARY KEY (title_id),
	titles VARCHAR NOT NULL
);

select *
from titles;

ALTER TABLE dept_emp ADD CONSTRAINT fk_dept_emp_no FOREIGN KEY(emp_no) REFERENCES employees (emp_no);

ALTER TABLE dept_emp ADD CONSTRAINT fk_dept_no FOREIGN KEY(dept_no) REFERENCES departments (dept_no);

ALTER TABLE dept_manager ADD CONSTRAINT fk_manager_dept_no FOREIGN KEY(dept_no) REFERENCES departments (dept_no);

ALTER TABLE dept_manager ADD CONSTRAINT fk_manager_emp_no FOREIGN KEY(emp_no) REFERENCES employees (emp_no);

ALTER TABLE salaries ADD CONSTRAINT fk_salaries_emp_no FOREIGN KEY(emp_no) REFERENCES employees (emp_no);

ALTER TABLE employees ADD CONSTRAINT fk_employees_title_id FOREIGN KEY(emp_title_id) REFERENCES titles (title_id);