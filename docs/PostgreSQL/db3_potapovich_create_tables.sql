
-- Таблица поставщиков
CREATE TABLE Supplier (
    supplierID SERIAL PRIMARY KEY,
    companyName VARCHAR(255),
    companyAddress VARCHAR(255)
);

-- Таблица клиентов
CREATE TABLE Client (
    clientID SERIAL PRIMARY KEY,
    fullName VARCHAR(255),
    phoneNumber VARCHAR(255)
);

-- Таблица менеджеров
CREATE TABLE Manager (
    managerID SERIAL PRIMARY KEY,
    fullName VARCHAR(255)
);

-- Таблица запчастей
CREATE TABLE SparePart (
    sparePartID SERIAL PRIMARY KEY,
    name VARCHAR(255),
    price INT,
    remainingStock INT
);

-- Таблица автомобилей
CREATE TABLE Automobile (
    automobileID SERIAL PRIMARY KEY,
    supplierID INT,
    name VARCHAR(255),
    mileage INT,
    transmissionType VARCHAR(255),
    engineType VARCHAR(255),
    powerAutomobile INT,
    price INT,
    engineCapacity INT,
    yearOfIssue INT,
    color VARCHAR(255),
    FOREIGN KEY (supplierID) REFERENCES Supplier(supplierID)
);

-- Таблица финансовых транзакций
CREATE TABLE FinancialTransaction (
    financialTransactionID SERIAL PRIMARY KEY,
    clientID INT,
    dateFinancialTransaction DATE,
    amount INT,
    typeFinancialTransaction VARCHAR(255),
    FOREIGN KEY (clientID) REFERENCES Client(clientID)
);

-- Таблица обслуживания автомобилей
CREATE TABLE ServiceMaintenance (
    serviceMaintenanceID SERIAL PRIMARY KEY,
    automobileID INT,
    clientID INT,
    sparePartID INT,
    dateServiceMaintenance DATE,
    price INT,
    FOREIGN KEY (automobileID) REFERENCES Automobile(automobileID),
    FOREIGN KEY (clientID) REFERENCES Client(clientID),
    FOREIGN KEY (sparePartID) REFERENCES SparePart(sparePartID)
);

-- Таблица продаж
CREATE TABLE Sale (
    saleID SERIAL PRIMARY KEY,
    clientID INT,
    managerID INT,
    dateSale DATE,
    FOREIGN KEY (clientID) REFERENCES Client(clientID),
    FOREIGN KEY (managerID) REFERENCES Manager(managerID)
);

-- Таблица проданных автомобилей
CREATE TABLE SaleAutomobile (
    saleAutomobileID SERIAL PRIMARY KEY,
    saleID INT,
    automobileID INT,
    FOREIGN KEY (saleID) REFERENCES Sale(saleID),
    FOREIGN KEY (automobileID) REFERENCES Automobile(automobileID)
);

-- Таблица проданных запчастей
CREATE TABLE SaleSparePart (
    saleSparePartID SERIAL PRIMARY KEY,
    saleID INT,
    sparePartID INT,
    quantity INT,
    FOREIGN KEY (saleID) REFERENCES Sale(saleID),
    FOREIGN KEY (sparePartID) REFERENCES SparePart(sparePartID)
);

-- Таблица жалоб
CREATE TABLE Complaint (
    complaintID SERIAL PRIMARY KEY,
    clientID INT,
    submissionDate DATE,
    status BOOLEAN,
    FOREIGN KEY (clientID) REFERENCES Client(clientID)
);

-- Таблица тест-драйвов
CREATE TABLE TestDrive (
    testDriveID SERIAL PRIMARY KEY,
    clientID INT,
    automobileID INT,
    startTime TIME,
    endTime TIME,
    dateTestDrive DATE,
    FOREIGN KEY (clientID) REFERENCES Client(clientID),
    FOREIGN KEY (automobileID) REFERENCES Automobile(automobileID)
);
