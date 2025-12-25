-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Час створення: Гру 25 2025 р., 12:13
-- Версія сервера: 10.4.32-MariaDB
-- Версія PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База даних: `autopartsstore`
--

-- --------------------------------------------------------

--
-- Структура таблиці `cars`
--

CREATE TABLE `cars` (
  `ID` int(11) NOT NULL,
  `ModelName` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп даних таблиці `cars`
--

INSERT INTO `cars` (`ID`, `ModelName`) VALUES
(1, 'Toyota Camry'),
(2, 'BMW X5'),
(3, 'Volkswagen Golf'),
(4, 'Audi A6'),
(5, 'Ford Focus');

-- --------------------------------------------------------

--
-- Структура таблиці `categories`
--

CREATE TABLE `categories` (
  `ID` int(11) NOT NULL,
  `Name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп даних таблиці `categories`
--

INSERT INTO `categories` (`ID`, `Name`) VALUES
(1, 'Двигун'),
(2, 'Підвіска'),
(3, 'Електрика'),
(4, 'Гальмівна система'),
(5, 'Кузовні деталі');

-- --------------------------------------------------------

--
-- Структура таблиці `customers`
--

CREATE TABLE `customers` (
  `ID` int(11) NOT NULL,
  `FullName` varchar(100) DEFAULT NULL,
  `Phone` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп даних таблиці `customers`
--

INSERT INTO `customers` (`ID`, `FullName`, `Phone`) VALUES
(1, 'Коваленко Олександр', '+380670000001'),
(2, 'Мельник Марія', '+380500000002'),
(3, 'Шевченко Дмитро', '+380930000003');

-- --------------------------------------------------------

--
-- Структура таблиці `employees`
--

CREATE TABLE `employees` (
  `ID` int(11) NOT NULL,
  `FullName` varchar(100) DEFAULT NULL,
  `Position` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп даних таблиці `employees`
--

INSERT INTO `employees` (`ID`, `FullName`, `Position`) VALUES
(1, 'Іванов Іван Іванович', 'Старший менеджер'),
(2, 'Петренко Ганна Сергіївна', 'Продавець-консультант'),
(3, 'Сидоренко Петро Васильович', 'Завідувач складу');

-- --------------------------------------------------------

--
-- Структура таблиці `manufacturers`
--

CREATE TABLE `manufacturers` (
  `ID` int(11) NOT NULL,
  `BrandName` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп даних таблиці `manufacturers`
--

INSERT INTO `manufacturers` (`ID`, `BrandName`) VALUES
(1, 'Bosch'),
(2, 'Brembo'),
(3, 'Denso'),
(4, 'Sachs'),
(5, 'Valeo');

-- --------------------------------------------------------

--
-- Структура таблиці `orders`
--

CREATE TABLE `orders` (
  `ID` int(11) NOT NULL,
  `CustomerID` int(11) DEFAULT NULL,
  `EmployeeID` int(11) DEFAULT NULL,
  `OrderDate` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп даних таблиці `orders`
--

INSERT INTO `orders` (`ID`, `CustomerID`, `EmployeeID`, `OrderDate`) VALUES
(1, 1, 2, '2025-12-23 18:23:28'),
(2, 2, 1, '2025-12-22 18:23:28'),
(3, 3, 2, '2025-12-18 18:23:28');

-- --------------------------------------------------------

--
-- Структура таблиці `order_details`
--

CREATE TABLE `order_details` (
  `OrderID` int(11) NOT NULL,
  `PartID` int(11) NOT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `PriceAtSale` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп даних таблиці `order_details`
--

INSERT INTO `order_details` (`OrderID`, `PartID`, `Quantity`, `PriceAtSale`) VALUES
(1, 1, 4, 350.00),
(1, 3, 1, 250.00),
(2, 2, 2, 1200.00),
(3, 4, 2, 2800.00);

-- --------------------------------------------------------

--
-- Структура таблиці `parts`
--

CREATE TABLE `parts` (
  `ID` int(11) NOT NULL,
  `Name` varchar(150) DEFAULT NULL,
  `CategoryID` int(11) DEFAULT NULL,
  `ManufacturerID` int(11) DEFAULT NULL,
  `CarID` int(11) DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп даних таблиці `parts`
--

INSERT INTO `parts` (`ID`, `Name`, `CategoryID`, `ManufacturerID`, `CarID`, `Price`) VALUES
(1, 'Свічка запалювання Platinum', 3, 1, 1, 350.00),
(2, 'Гальмівні колодки передні', 4, 2, 3, 1200.00),
(3, 'Фільтр масляний', 1, 3, 1, 250.00),
(4, 'Амортизатор задній', 2, 4, 2, 2800.00),
(5, 'Фара ліва LED', 3, 5, 4, 15400.00),
(6, 'Ремінь ГРМ', 1, 1, 5, 950.00),
(7, 'Датчик ABS', 3, 1, 2, 1100.00),
(8, 'Зчеплення в зборі', 1, 4, 3, 7500.00);

-- --------------------------------------------------------

--
-- Структура таблиці `stock`
--

CREATE TABLE `stock` (
  `PartID` int(11) NOT NULL,
  `SupplierID` int(11) DEFAULT NULL,
  `Quantity` int(11) DEFAULT 0,
  `ShelfLocation` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп даних таблиці `stock`
--

INSERT INTO `stock` (`PartID`, `SupplierID`, `Quantity`, `ShelfLocation`) VALUES
(1, 1, 50, 'A-101'),
(2, 1, 20, 'B-205'),
(3, 1, 100, 'A-102'),
(4, 2, 10, 'D-101'),
(5, 3, 2, 'E-501'),
(6, 1, 15, 'C-301'),
(7, 2, 8, 'B-206'),
(8, 4, 3, 'F-101');

-- --------------------------------------------------------

--
-- Структура таблиці `suppliers`
--

CREATE TABLE `suppliers` (
  `ID` int(11) NOT NULL,
  `SupplierName` varchar(100) DEFAULT NULL,
  `ContactPhone` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп даних таблиці `suppliers`
--

INSERT INTO `suppliers` (`ID`, `SupplierName`, `ContactPhone`) VALUES
(1, 'InterCars', '+380671112233'),
(2, 'Exist', '+380504445566'),
(3, 'Omega-Auto', '+380637778899'),
(4, 'EuroAuto', '+380990001122');

--
-- Індекси збережених таблиць
--

--
-- Індекси таблиці `cars`
--
ALTER TABLE `cars`
  ADD PRIMARY KEY (`ID`);

--
-- Індекси таблиці `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`ID`);

--
-- Індекси таблиці `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`ID`);

--
-- Індекси таблиці `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`ID`);

--
-- Індекси таблиці `manufacturers`
--
ALTER TABLE `manufacturers`
  ADD PRIMARY KEY (`ID`);

--
-- Індекси таблиці `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `CustomerID` (`CustomerID`),
  ADD KEY `EmployeeID` (`EmployeeID`);

--
-- Індекси таблиці `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`OrderID`,`PartID`),
  ADD KEY `PartID` (`PartID`);

--
-- Індекси таблиці `parts`
--
ALTER TABLE `parts`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `CategoryID` (`CategoryID`),
  ADD KEY `ManufacturerID` (`ManufacturerID`),
  ADD KEY `CarID` (`CarID`);

--
-- Індекси таблиці `stock`
--
ALTER TABLE `stock`
  ADD PRIMARY KEY (`PartID`),
  ADD KEY `SupplierID` (`SupplierID`);

--
-- Індекси таблиці `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT для збережених таблиць
--

--
-- AUTO_INCREMENT для таблиці `cars`
--
ALTER TABLE `cars`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблиці `categories`
--
ALTER TABLE `categories`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблиці `customers`
--
ALTER TABLE `customers`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблиці `employees`
--
ALTER TABLE `employees`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблиці `manufacturers`
--
ALTER TABLE `manufacturers`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблиці `orders`
--
ALTER TABLE `orders`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблиці `parts`
--
ALTER TABLE `parts`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблиці `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Обмеження зовнішнього ключа збережених таблиць
--

--
-- Обмеження зовнішнього ключа таблиці `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `customers` (`ID`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`EmployeeID`) REFERENCES `employees` (`ID`);

--
-- Обмеження зовнішнього ключа таблиці `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `orders` (`ID`),
  ADD CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`PartID`) REFERENCES `parts` (`ID`);

--
-- Обмеження зовнішнього ключа таблиці `parts`
--
ALTER TABLE `parts`
  ADD CONSTRAINT `parts_ibfk_1` FOREIGN KEY (`CategoryID`) REFERENCES `categories` (`ID`),
  ADD CONSTRAINT `parts_ibfk_2` FOREIGN KEY (`ManufacturerID`) REFERENCES `manufacturers` (`ID`),
  ADD CONSTRAINT `parts_ibfk_3` FOREIGN KEY (`CarID`) REFERENCES `cars` (`ID`);

--
-- Обмеження зовнішнього ключа таблиці `stock`
--
ALTER TABLE `stock`
  ADD CONSTRAINT `stock_ibfk_1` FOREIGN KEY (`PartID`) REFERENCES `parts` (`ID`),
  ADD CONSTRAINT `stock_ibfk_2` FOREIGN KEY (`SupplierID`) REFERENCES `suppliers` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
