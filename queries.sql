-- MySQL 8.0

-- a.     Фамилия сотрудника с самой высокой зарплатой
SELECT SUBSTRING_INDEX(full_name, ' ', 1) AS Employee_surname
FROM employees
WHERE salary = (
    SELECT MAX(salary) FROM employees
);

-- b.     Фамилии сотрудников в алфавитном порядке
SELECT SUBSTRING_INDEX(full_name, ' ', 1) AS Employee_surname
FROM employees
ORDER BY full_name;

-- c.     Средний стаж для каждого уровня сотрудников
SELECT AVG(salary)
FROM employees
GROUP BY lvl;

-- d.     Фамилия сотрудника и название отдела, в котором он работает
SELECT SUBSTRING_INDEX(employees.full_name, ' ', 1) AS Employee_surname, departments.name AS Department
FROM employees
INNER JOIN departments
ON employees.department_id = departments.id;


-- e.    Название отдела и фамилия сотрудника с самой высокой зарплатой в данном отделе и его зарплата
SELECT departments.name AS Department, SUBSTRING_INDEX(employees.full_name, ' ', 1) AS Employee_surname, salary
FROM departments
INNER JOIN employees
ON employees.department_id = departments.id
ORDER BY salary DESC
LIMIT 1;

