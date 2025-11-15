-- =====================================================
-- DATABASE
-- =====================================================
CREATE DATABASE company_data;
USE company_data;

-- =====================================================
-- 1) DEPARTMENTS
-- =====================================================
CREATE TABLE departments (
  dept_id INT PRIMARY KEY,
  dept_name VARCHAR(100) NOT NULL,
  location VARCHAR(100) NOT NULL
);

INSERT INTO departments VALUES
(1, 'HR', 'Chennai'),
(2, 'IT', 'Bangalore'),
(3, 'Finance', 'Delhi'),
(4, 'Marketing', 'Mumbai');

-- =====================================================
-- 2) EMPLOYEES
-- =====================================================
CREATE TABLE employees (
  emp_id INT PRIMARY KEY,
  emp_name VARCHAR(100) NOT NULL,
  gender VARCHAR(10),
  dept_id INT,
  hire_date DATE,
  FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

INSERT INTO employees VALUES
(101, 'Rahul', 'Male', 1, '2022-05-10'),
(102, 'Priya', 'Female', 2, '2021-03-15'),
(103, 'Karthik', 'Male', 3, '2023-01-10'),
(104, 'Sneha', 'Female', 2, '2020-11-25'),
(105, 'Varun', 'Male', 4, '2022-07-19'),
(106, 'Divya', 'Female', 1, '2023-05-28');

-- =====================================================
-- 3) SALARIES
-- =====================================================
CREATE TABLE salaries (
  emp_id INT,
  salary INT NOT NULL,
  effective_date DATE,
  FOREIGN KEY (emp_id) REFERENCES employees(emp_id)
);

INSERT INTO salaries VALUES
(101, 45000, '2024-01-01'),
(102, 65000, '2024-01-01'),
(103, 55000, '2024-01-01'),
(104, 70000, '2024-01-01'),
(105, 48000, '2024-01-01'),
(106, 50000, '2024-01-01');

-- =====================================================
-- 4) TITLES
-- =====================================================
CREATE TABLE titles (
  emp_id INT,
  title VARCHAR(100),
  title_start DATE,
  FOREIGN KEY (emp_id) REFERENCES employees(emp_id)
);

INSERT INTO titles VALUES
(101, 'HR Executive', '2022-05-10'),
(102, 'Software Engineer', '2021-03-15'),
(103, 'Financial Analyst', '2023-01-10'),
(104, 'Senior Developer', '2022-03-01'),
(105, 'Marketing Specialist', '2022-07-19'),
(106, 'HR Coordinator', '2023-05-28');

-- =====================================================
-- 5) PROJECTS
-- =====================================================
CREATE TABLE projects (
  project_id INT PRIMARY KEY,
  project_name VARCHAR(200),
  dept_id INT,
  budget INT,
  FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

INSERT INTO projects VALUES
(501, 'Recruitment Automation', 1, 500000),
(502, 'Cloud Migration', 2, 1500000),
(503, 'Annual Audit', 3, 700000),
(504, 'Brand Growth Campaign', 4, 400000);

-- =====================================================
-- 6) EMPLOYEE_PROJECTS (many-to-many)
-- =====================================================
CREATE TABLE employee_projects (
  emp_id INT,
  project_id INT,
  assigned_date DATE,
  FOREIGN KEY (emp_id) REFERENCES employees(emp_id),
  FOREIGN KEY (project_id) REFERENCES projects(project_id)
);

INSERT INTO employee_projects VALUES
(101, 501, '2023-01-01'),
(102, 502, '2022-02-01'),
(103, 503, '2023-05-01'),
(104, 502, '2022-04-10'),
(105, 504, '2023-02-15'),
(106, 501, '2023-08-01');

-- =====================================================
-- 7) ATTENDANCE
-- =====================================================
CREATE TABLE attendance (
  att_id INT PRIMARY KEY,
  emp_id INT,
  login_time DATETIME,
  logout_time DATETIME,
  FOREIGN KEY (emp_id) REFERENCES employees(emp_id)
);

INSERT INTO attendance VALUES
(1, 101, '2025-02-01 09:00:00', '2025-02-01 18:00:00'),
(2, 102, '2025-02-01 09:30:00', '2025-02-01 17:00:00'),
(3, 103, '2025-02-01 10:00:00', '2025-02-01 18:30:00'),
(4, 104, '2025-02-01 09:15:00', '2025-02-01 19:00:00');
