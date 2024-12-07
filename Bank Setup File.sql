CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    date_of_birth DATE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone BIGINT UNIQUE,
    address VARCHAR(255),
    city VARCHAR(50),
    state VARCHAR(50),
    zip_code INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Accounts (
    account_number BIGINT PRIMARY KEY,
    customer_id INT NOT NULL,
    account_type ENUM('Savings', 'Current', 'Salary', 'OverDraft') NOT NULL,
    balance DECIMAL(15, 2) NOT NULL CHECK (balance >= 0),
    branch_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (branch_id) REFERENCES Branches(branch_id)
);

CREATE TABLE Branches (
    branch_id INT PRIMARY KEY,
    branch_name VARCHAR(50) NOT NULL,
    branch_address VARCHAR(255),
    branch_location ENUM('Rural', 'Urban') NOT NULL,
    city VARCHAR(50),
    state VARCHAR(50),
    zip_code INT,
    phone BIGINT UNIQUE NOT NULL,
    manager_id INT
);

CREATE TABLE Employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone BIGINT UNIQUE,
    hire_date DATE NOT NULL,
    position VARCHAR(50) NOT NULL,
    branch_id INT NOT NULL,
    FOREIGN KEY (branch_id) REFERENCES Branches(branch_id)
);

CREATE TABLE Transactions (
    transaction_id INT PRIMARY KEY,
    account_number BIGINT NOT NULL,
    transaction_type ENUM('Deposit', 'Withdrawal', 'Transfer') NOT NULL,
    amount DECIMAL(15, 2) NOT NULL CHECK (amount > 0),
    transaction_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (account_number) REFERENCES Accounts(account_number)
);

ALTER TABLE Branches
ADD CONSTRAINT fk_manager
FOREIGN KEY (manager_id)
REFERENCES Employees(employee_id);

desc accounts;
desc branches;
desc customers;
desc employees;
desc transactions;





