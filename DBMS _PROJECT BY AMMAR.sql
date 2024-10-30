create database busticket; 
use busticket;
CREATE TABLE Customer (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(50) UNIQUE,
    phone_number VARCHAR(15),
    address VARCHAR(255)
);

CREATE TABLE Bus (
    bus_id INT AUTO_INCREMENT PRIMARY KEY,
    bus_number VARCHAR(20) UNIQUE,
    capacity INT,
    bus_type ENUM('Standard', 'Luxury', 'Sleeper') DEFAULT 'Standard'
);

CREATE TABLE Route (
    route_id INT AUTO_INCREMENT PRIMARY KEY,
    origin_city VARCHAR(50),
    destination_city VARCHAR(50),
    distance_km DECIMAL(6, 2)
);

CREATE TABLE Schedule (
    schedule_id INT AUTO_INCREMENT PRIMARY KEY,
    bus_id INT,
    route_id INT,
    departure_time DATETIME,
    arrival_time DATETIME,
    fare DECIMAL(10, 2),
    FOREIGN KEY (bus_id) REFERENCES Bus(bus_id),
    FOREIGN KEY (route_id) REFERENCES Route(route_id)
);

CREATE TABLE Ticket (
    ticket_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    schedule_id INT,
    seat_number INT,
    booking_date DATE,
    status ENUM('Booked', 'Cancelled', 'Completed') DEFAULT 'Booked',
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
    FOREIGN KEY (schedule_id) REFERENCES Schedule(schedule_id)
);

CREATE TABLE Payment (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    ticket_id INT,
    payment_date DATE,
    amount DECIMAL(10, 2),
    payment_method ENUM('Credit Card', 'Debit Card', 'Cash', 'Online Transfer'),
    payment_status ENUM('Completed', 'Pending', 'Failed') DEFAULT 'Pending',
    FOREIGN KEY (ticket_id) REFERENCES Ticket(ticket_id)
);

select * from customer;
 select * from payment;
 select * from route;
 select * from schedule;
 select * from ticket;
 ALTER TABLE bus add speed varchar(20); 
 select * from bus;
 
INSERT INTO Customer (name, email, phone_number, address) VALUES 
("Aadil Khan", "aadilkhan@gmailcom", 03001234567, "Sukkur, Sindh"),
("Umar Farooq", "umar.farooq54@gmail.com", 03000298187, "Lahore, Punjab"),
("Muzaamil Arain", "muzammil.hussain@gmailcom", 03211234567, 'Sui Gas, Sindh'),
("Yasie Dharjo" , "Yasir786dharejo@gmail.com",0312987654,"Ahmed pur, Sindh"),
("Fatima Iqbal", 'fatimaiqbal34@gmail.com', 03012345678, "Quetta, Balochistan"),
("Daniyal Mughal","daniyalmughal@gmail.com", 01234556789, 'Peshawar, KPK');

INSERT INTO Bus 
 VALUES (22,"BUS-101", 40, "Luxury", "120 km/h"),
(23,"BUS-255", 68, "Standard", "65 km/h"),
(26,"BUS-2247", 75, "Sleeper", "85 km/h"),
(20,"BUS-2249", 70, "Luxury", "90 km/h"),
(36,"BUS-8011", 50, "Standard", "70 km/h");

INSERT INTO Route 
VALUES  ("Sukkur", "Karachi", 376.50),
("Lahore", "Karachi", 1240.75),
("Karachi", "Quetta", 700.00),
("Peshawar", "Islamabad", 187.50),
("Quetta", "Lahore", 880.00);

INSERT INTO Schedule (bus_id, route_id, departure_time, arrival_time, fare) VALUES 
(22, 1, "2024-11-01 08:00:00", "2024-11-01 14:00:00", 2000.00),
(23, 2, "2024-11-02 18:00:00", "2024-11-03 15:00:00", 6000.00),
(26, 3, "2024-11-04 06:00:00", "2024-11-05 12:00:00", 3700.00),
(20, 4, "2024-11-05 09:00:00", "2024-11-05 12:30:00", 2600.00),
(36, 5, "2024-11-06 07:00:00", "2024-11-07 08:00:00", 3600.00);

INSERT INTO Ticket (customer_id, schedule_id, seat_number, booking_date, status) VALUES 
(1, 1, 5, "2024-10-30", "Booked"),
(2, 2, 10, "2024-10-30", "Booked"),
(3, 3, 15, "2024-10-31", "Booked"),
(4, 4, 7, "2024-11-01", "Booked"),
(5, 5, 20, "2024-11-02", "Booked"),
(1, 2, 3, "2024-11-01", "Booked"),
(2, 3, 6, "2024-11-01", "Booked"),
(3, 4, 12, "2024-11-02", "Booked"),
(4, 5, 25, "2024-11-03", "Booked"),
(5, 1, 4, "2024-11-03", "Booked");

-- Insert Sample Data for Payment Table
INSERT INTO Payment (ticket_id, payment_date, amount, payment_method, payment_status) VALUES
(41, "2024-10-30", 1500.00, "Credit Card", "Completed"), 
(46, "2024-10-30", 4500.00, "Cash", "Pending"), 
(42, "2024-10-31", 3200.00, "Online Transfer", "Completed"), 
(47, "2024-11-01", 1200.00, "Debit Card", "Completed"),
(43, "2024-11-02", 3600.00, "Credit Card ", "Pending"),
(48, "2024-11-01", 4500.00, "Cash", "Completed"),
(44, "2024-11-01", 3200.00, "Online Transfer", "Completed"),
(49, "2024-11-02", 1200.00, "Credit Card", "Completed"),
(45, "2024-11-03", 3600.00, "Debit Card", "Completed"),
(50, "2024-11-03", 1500.00, "Cash", "Completed");
 select * from bus;
 select * from customer;
 select * from payment;
 select * from route;
 select * from schedule;
 select * from ticket;
 