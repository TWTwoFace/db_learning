INSERT INTO Supplier (companyName, companyAddress) VALUES(
	'VAZ',
    'ul mira dom 1'
);

INSERT INTO Client (fullName, phoneNumber) VALUES(
	'Фёдор Петрович',
	'+7 800 555 35 35'
);

INSERT INTO Manager (fullName) VALUES(
	'Николай Семеныч'
);

INSERT INTO SparePart (name, price, remainingStock) VALUES(
	'Fuze',
    23000,
    12
);

INSERT INTO Automobile (supplierID, name, mileage, transmissionType, engineType, powerAutomobile, price, engineCapacity, yearOfIssue, color) VALUES(
	2,
    'VAZ 2112',
    2002,
    'MG',
    '16V',
    200,
    500000,
    123122,
    2020,
    'yellow'
);


INSERT INTO FinancialTransaction (clientID, dateFinancialTransaction, amount, typeFinancialTransaction) VALUES(
	2,
	'1999-01-10',
	2,
	'Покупка машины'
);


INSERT INTO ServiceMaintenance (automobileID, clientID, sparePartID, dateServiceMaintenance, price) VALUES(
	3,
    2,
    2,
    '2023-02-13',
    6000000
);

INSERT INTO Sale (clientID, managerID, dateSale) VALUES(
	0,
	0,
	'2025-02-20'
);

INSERT INTO SaleSparePart (saleID, sparePartID, quantity) VALUES(
	1,
    2,
    12
);

INSERT INTO Complaint (clientID, submissionDate, status) VALUES(
	2,
    '2024-04-23',
    true
);

INSERT INTO TestDrive (clientID, automobileID, startTime, endTime, dateTestDrive) VALUES(
	2,
    3,
    '16:20:12',
    '16:50:23',
    '2020-12-10'
);