-- SCHEMA: create_tables

-- DROP SCHEMA IF EXISTS create_tables ;

CREATE SCHEMA IF NOT EXISTS create_tables
    AUTHORIZATION postgres;

create table departments (
 	dept_no  varchar(255) PRIMARY KEY,
    dept_name varchar(255) NOT NULL
);

create table titles (
 	title_id varchar(5) PRIMARY KEY,
	title varchar(100)	
);

create table employees (
 	emp_no  int PRIMARY KEY,
    emp_title_id varchar(50) NOT NULL,
	birth_date date NOT NULL,
	first_name varchar(50) NOT NULL,
	last_name varchar(50) NOT NULL,
	sex char(1) NOT NULL,
	hire_date date NOT NULL,
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
	
);

create table dept_emp (
 	emp_no int NOT NULL,
	dept_no varchar(4) NOT NULL,
	foreign key(emp_no) references employees(emp_no),
	foreign key (dept_no) references departments(dept_no),
	Constraint PK_dept_emp Primary Key (emp_no, dept_no)
);

create table dept_manager (
 	dept_no varchar(4) NOT NULL,
	emp_no int NOT NULL,
	foreign key (dept_no) references departments(dept_no),
	foreign key(emp_no) references employees(emp_no),
	Constraint PK_dept_manager Primary Key (dept_no, emp_no)
);

create table salaries (
 	emp_no int NOT NULL Primary Key,
	salary int NOT NULL,
	foreign key(emp_no) references employees(emp_no)
);

