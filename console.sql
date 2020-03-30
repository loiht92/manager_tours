CREATE DATABASE tour_managements;
USE tour_managements;

CREATE TABLE travel_destinations
(
    id                   INT AUTO_INCREMENT PRIMARY KEY,
    destination_name     VARCHAR(100) NOT NULL,
    describe_destination VARCHAR(255),
    average_price        DOUBLE       NOT NULL,
    city_id              INT NOT NULL,
    FOREIGN KEY (city_id) REFERENCES city (id)
);

CREATE TABLE customer_order_tour
(
    id                    INT AUTO_INCREMENT PRIMARY KEY,
    customer_name         VARCHAR(100) NOT NULL,
    identification_number VARCHAR(50) UNIQUE,
    year_of_birth         YEAR(4),
    city_id               INT NOT NULL,
    FOREIGN KEY (city_id) REFERENCES city (id)
);

CREATE TABLE city
(
    id        INT AUTO_INCREMENT PRIMARY KEY,
    city_name VARCHAR(200)
);

CREATE TABLE tour
(
    id                          INT AUTO_INCREMENT PRIMARY KEY,
    tour_code                   VARCHAR(50) UNIQUE,
    tour_type_id                INT NOT NULL ,
    travel_destination_price DOUBLE,
    start_day_id                DATE,
    end_day                     DATE,
    FOREIGN KEY (tour_type_id) REFERENCES tour_type (id)
);

CREATE TABLE tour_type
(
    id        INT AUTO_INCREMENT PRIMARY KEY,
    type_code VARCHAR(50) UNIQUE,
    type_name VARCHAR(100)
);

CREATE TABLE tour_order_invoice
(
    tour_id     INT AUTO_INCREMENT PRIMARY KEY ,
    customer_id INT NOT NULL,
    status      VARCHAR(255),
    FOREIGN KEY (customer_id) REFERENCES customer_order_tour (id),
    FOREIGN KEY (tour_id) REFERENCES tour (id)
);

INSERT INTO city VALUES (1, 'Ha Noi'),
                        (2,'Ha Noi'), (3, 'Ha Noi'), (4,'Nghe An'),(5,'Ninh Binh');

INSERT INTO customer_order_tour VALUES
(1, 'Loi', 123456, 1992,1),
(2, 'Long', 124556, 1993,2),
(3, 'Minh', 129456, 1991,3),
(4, 'Hoa', 127856, 1990,4),
(5, 'Mai', 125656, 1995,5),
(6, 'Trang', 126456, 1999,5),
(7, 'Anh', 128756, 2000,5),
(8, 'Nam', 122956, 1993,2),
(9, 'Duc', 127256, 1994,3),
(10, 'Tung', 125156, 1992,1);

INSERT INTO tour VALUES
(1,'T1',1,1000,'2020-03-01','2020-04-01'),
(2,'T2',2,1000,'2020-03-12','2020-04-21'),
(3,'T3',1,1000,'2020-03-05','2020-03-30'),
(4,'T4',1,1000,'2020-04-01','2020-05-01'),
(5,'T5',2,1000,'2020-03-07','2020-05-01'),
(6,'T6',2,1000,'2020-04-11','2020-06-01'),
(7,'T7',1,1000,'2020-05-23','2020-06-30'),
(8,'T8',1,1000,'2020-02-09','2020-03-01'),
(9,'T9',2,1000,'2020-02-01','2020-04-01'),
(10,'T10',1,1000,'2020-03-25','2020-04-20'),
(11,'T11',1,1000,'2020-02-11','2020-03-01'),
(12,'T12',2,1000,'2020-02-21','2020-04-20'),
(13,'T13',1,1000,'2020-04-12','2020-05-01'),
(14,'T14',1,1000,'2020-03-09','2020-04-01'),
(15,'T15',1,1000,'2020-02-22','2020-04-01');

INSERT INTO tour_type VALUES
(1, 'A1','Hang 1'),
(2, 'A2', 'Hang 2');

INSERT INTO tour_order_invoice VALUES
(1,1,'Con Cho'),
(2,2,'Het Cho'),
(3,3,'Het Cho'),
(5,4,'Con Cho'),
(7,5,'Con Cho'),
(8,6,'Het Cho'),
(11,7,'Con Cho'),
(13,8,'Het Cho'),
(15,9,'Het Cho'),
(4,10,'Con Cho');

INSERT INTO travel_destinations VALUES
(1, 'Pho Co','Diem Du Lich',500, 1),
(2, 'Ho Hoan Kiem','Diem Du Lich',600, 2),
(3, 'Ho Tay','Diem Du Lich',700, 3),
(4, 'Trang An','Diem Du Lich',800, 4),
(5, 'Pho Co Hoi An','Diem Du Lich',900, 5);

SELECT city_name, count(city_name) 'number of tour' FROM tour
        JOIN tour_order_invoice toi ON tour.id = toi.tour_id
        JOIN customer_order_tour cot ON toi.customer_id = cot.id
        JOIN city c ON cot.city_id = c.id GROUP BY city_name;

SELECT count(start_day_id) 'Number of tour begin in 03-2020' FROM tour WHERE start_day_id >='2020-03-01' AND start_day_id <= '2020-03-31';
SELECT count(end_day) 'Number of tour end in 04-2020' FROM tour WHERE end_day >='2020-04-01' AND start_day_id <= '2020-04-30';

