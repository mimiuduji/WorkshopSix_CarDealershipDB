-- Get all dealerships
SELECT * FROM dealerships;

-- Find all vehicles for a specific dealership (example: dealership_id = 1)
SELECT v.VIN, v.make, v.model, v.year, v.color
FROM vehicles v
JOIN inventory i ON v.VIN = i.VIN
WHERE i.dealership_id = 1;

-- Find a car by VIN (example: VIN = '1HGCM82633A123456')
SELECT * FROM vehicles WHERE VIN = '1HGCM82633A123456';

-- Find the dealership where a certain car is located by VIN
SELECT d.name AS dealership_name, d.address
FROM dealerships d
JOIN inventory i ON d.dealership_id = i.dealership_id
WHERE i.VIN = '1HGCM82633A123456';

-- Find all dealerships that have a certain car type (example: Red Toyota Corolla)
SELECT DISTINCT d.name, d.address
FROM dealerships d
JOIN inventory i ON d.dealership_id = i.dealership_id
JOIN vehicles v ON i.VIN = v.VIN
WHERE v.color = 'Red' AND v.make = 'Toyota' AND v.model = 'Corolla';

-- Get all sales information for a specific dealer for a specific date range
-- (Example: dealership_id = 2, date range '2023-01-01' to '2023-12-31')
SELECT sc.contract_id, sc.VIN, sc.customer_name, sc.sale_price, sc.sale_date
FROM sales_contracts sc
JOIN inventory i ON sc.VIN = i.VIN
WHERE i.dealership_id = 2 AND sc.sale_date BETWEEN '2023-01-01' AND '2023-12-31';

