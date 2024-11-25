schema.sql
-- Drop the database if it already exists
DROP DATABASE IF EXISTS CarDealershipDB;

-- Create the database
CREATE DATABASE CarDealershipDB;

-- Use the newly created database
USE CarDealershipDB;

-- Create the dealerships table
CREATE TABLE dealerships (
    dealership_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    address VARCHAR(50),
    phone VARCHAR(12)
);

-- Create the vehicles table
CREATE TABLE vehicles (
    VIN VARCHAR(17) PRIMARY KEY,
    make VARCHAR(50) NOT NULL,
    model VARCHAR(50) NOT NULL,
    year INT NOT NULL,
    color VARCHAR(20),
    sold BOOLEAN DEFAULT FALSE
);

-- Create the inventory table
CREATE TABLE inventory (
    dealership_id INT NOT NULL,
    VIN VARCHAR(17) NOT NULL,
    FOREIGN KEY (dealership_id) REFERENCES dealerships(dealership_id),
    FOREIGN KEY (VIN) REFERENCES vehicles(VIN)
);

-- Create the sales_contracts table
CREATE TABLE sales_contracts (
    contract_id INT AUTO_INCREMENT PRIMARY KEY,
    VIN VARCHAR(17) NOT NULL,
    customer_name VARCHAR(50) NOT NULL,
    sale_price DECIMAL(10, 2),
    sale_date DATE,
    FOREIGN KEY (VIN) REFERENCES vehicles(VIN)
);

-- Create the lease_contracts table (optional)
CREATE TABLE lease_contracts (
    contract_id INT AUTO_INCREMENT PRIMARY KEY,
    VIN VARCHAR(17) NOT NULL,
    customer_name VARCHAR(50) NOT NULL,
    lease_price DECIMAL(10, 2),
    lease_duration_months INT,
    lease_start_date DATE,
    FOREIGN KEY (VIN) REFERENCES vehicles(VIN)
);

-- Insert sample data into dealerships
INSERT INTO dealerships (name, address, phone) VALUES
('City Cars', '123 Main St', '555-1234'),
('Highway Autos', '456 Elm St', '555-5678');

-- Insert sample data into vehicles
INSERT INTO vehicles (VIN, make, model, year, color, sold) VALUES
('1HGCM82633A123456', 'Honda', 'Civic', 2020, 'Blue', FALSE),
('2HGCM82633A654321', 'Toyota', 'Corolla', 2021, 'Red', TRUE);

-- Insert sample data into inventory
INSERT INTO inventory (dealership_id, VIN) VALUES
(1, '1HGCM82633A123456'),
(2, '2HGCM82633A654321');

-- Insert sample data into sales_contracts
INSERT INTO sales_contracts (VIN, customer_name, sale_price, sale_date) VALUES
('2HGCM82633A654321', 'John Doe', 20000.00, '2023-05-15');
