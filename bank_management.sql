-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 29, 2025 at 01:51 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bank_management`
--

DELIMITER $$
--
-- Functions
--
CREATE DEFINER=`root`@`localhost` FUNCTION `fd_maturity_amount` (`principal` DOUBLE, `interest_rate` DOUBLE, `years` DOUBLE, `tax_rate` DOUBLE) RETURNS DOUBLE DETERMINISTIC BEGIN
    DECLARE total_amount DOUBLE;
    DECLARE total_interest DOUBLE;
    DECLARE tax_amount DOUBLE;
    DECLARE maturity_amount DOUBLE;
    
    -- Calculate total amount with compound interest
    SET total_amount = principal * POW(1 + (interest_rate / 100), years);
    SET total_interest = total_amount - principal;
    SET tax_amount = total_interest * (tax_rate / 100);
    SET maturity_amount = total_amount - tax_amount;
    
    RETURN maturity_amount;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `account_number` varchar(20) NOT NULL,
  `pin` varchar(10) NOT NULL,
  `holder_name` varchar(100) NOT NULL,
  `address` varchar(200) DEFAULT NULL,
  `mobile_number` varchar(15) DEFAULT NULL,
  `balance` decimal(15,2) NOT NULL,
  `credit_score` int(11) DEFAULT 700,
  `account_type` varchar(20) DEFAULT 'SAVINGS',
  `transaction_count` int(11) DEFAULT 0,
  `last_interest_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`account_number`, `pin`, `holder_name`, `address`, `mobile_number`, `balance`, `credit_score`, `account_type`, `transaction_count`, `last_interest_date`) VALUES
('1000000001', '1234', 'Rajesh Patel', '101 Shivranjani, Ahmedabad - 380015', '9876543210', 125004.67, 750, 'SAVINGS', 12, '2025-08-16'),
('1000000002', '2345', 'Priya Shah', '45 Satellite Road, Ahmedabad - 380015', '9876543211', 85000.75, 720, 'SAVINGS', 8, '2023-06-20'),
('1000000003', '3456', 'Amit Desai', '78 Prahladnagar, Ahmedabad - 380051', '9876543212', 250000.00, 800, 'CURRENT', 25, NULL),
('1000000004', '4567', 'Neha Joshi', '23 Maninagar, Ahmedabad - 380008', '9876543213', 50000.25, 680, 'SAVINGS', 5, '2023-04-10'),
('1000000005', '5678', 'Vikram Mehta', '12 Vastrapur, Ahmedabad - 380052', '9876543214', 175000.00, 710, 'SAVINGS', 18, '2023-07-01'),
('1000000006', '4096', 'Ananya Sharma', '34 Navrangpura, Ahmedabad - 380009', '9876543215', 90003.50, 690, 'SAVINGS', 9, '2025-08-15'),
('1000000007', '7890', 'Rahul Gupta', '56 Bopal, Ahmedabad - 380058', '9876543216', 300000.75, 780, 'CURRENT', 30, '2023-03-25'),
('1000000008', '8901', 'Dipika Singh', '67 Thaltej, Ahmedabad - 380054', '9876543217', 75000.00, 700, 'SAVINGS', 7, '2023-08-12'),
('1000000009', '9012', 'Karan Patel', '89 Naranpura, Ahmedabad - 380013', '9876543218', 110000.25, 730, 'SAVINGS', 15, NULL),
('1000000010', '0123', 'Mira Shah', '32 Paldi, Ahmedabad - 380007', '9876543219', 60000.75, 650, 'SAVINGS', 6, '2023-02-18'),
('1000000011', '1122', 'Harsh Desai', '43 Chandkheda, Ahmedabad - 380024', '9876543220', 185000.00, 760, 'CURRENT', 22, '2023-01-30'),
('1000000012', '2233', 'Pooja Joshi', '54 Gota, Ahmedabad - 380061', '9876543221', 95000.50, 710, 'SAVINGS', 10, NULL),
('1000000013', '3344', 'Arjun Mehta', '65 Bodakdev, Ahmedabad - 380054', '9876543222', 225000.25, 790, 'CURRENT', 28, '2023-09-05'),
('1000000014', '4455', 'Isha Sharma', '76 Ambawadi, Ahmedabad - 380015', '9876543223', 80000.00, 680, 'SAVINGS', 8, '2023-04-22'),
('1000000015', '5566', 'Rohan Gupta', '87 Memnagar, Ahmedabad - 380052', '9876543224', 140000.75, 740, 'SAVINGS', 16, NULL),
('1000000016', '6677', 'Tanvi Singh', '98 Vejalpur, Ahmedabad - 380051', '9876543225', 55000.25, 670, 'SAVINGS', 5, '2023-03-15'),
('1000000017', '7788', 'Nikhil Patel', '10 Jodhpur, Ahmedabad - 380015', '9876543226', 275000.00, 810, 'CURRENT', 32, '2023-07-30'),
('1000000018', '8899', 'Divya Shah', '21 Gurukul, Ahmedabad - 380052', '9876543227', 70000.50, 690, 'SAVINGS', 7, NULL),
('1000000019', '9900', 'Jay Desai', '32 Ambli, Ahmedabad - 380058', '9876543228', 120000.75, 750, 'SAVINGS', 14, '2023-05-10'),
('1000000020', '0011', 'Riya Joshi', '43 Sindhu Bhavan, Ahmedabad - 380054', '9876543229', 65000.00, 660, 'SAVINGS', 6, '2023-02-28'),
('1000000021', '1212', 'Aarav Mehta', '54 Science City, Ahmedabad - 380060', '9876543230', 195000.25, 770, 'CURRENT', 24, NULL),
('1000000022', '2323', 'Anvi Sharma', '65 S.G. Highway, Ahmedabad - 380054', '9876543231', 85000.50, 700, 'SAVINGS', 9, '2023-06-15'),
('1000000023', '3434', 'Vihaan Gupta', '76 Judges Bungalow, Ahmedabad - 380015', '9876543232', 240000.75, 800, 'CURRENT', 29, '2023-08-20'),
('1000000024', '4545', 'Kiara Singh', '87 Satellite, Ahmedabad - 380015', '9876543233', 75000.25, 680, 'SAVINGS', 7, NULL),
('1000000025', '5656', 'Aditya Patel', '98 Prahladnagar, Ahmedabad - 380051', '9876543234', 130000.00, 740, 'SAVINGS', 15, '2023-04-05'),
('1000000026', '6767', 'Ishaan Shah', '09 Maninagar, Ahmedabad - 380008', '9876543235', 50000.75, 650, 'SAVINGS', 5, '2023-01-12'),
('1000000027', '7878', 'Avni Desai', '18 Vastrapur, Ahmedabad - 380052', '9876543236', 290000.25, 820, 'CURRENT', 35, NULL),
('1000000028', '8989', 'Kabir Joshi', '27 Navrangpura, Ahmedabad - 380009', '9876543237', 80000.00, 690, 'SAVINGS', 8, '2023-07-18'),
('1000000029', '9090', 'Myra Mehta', '36 Bopal, Ahmedabad - 380058', '9876543238', 115000.50, 730, 'SAVINGS', 13, '2023-03-22'),
('1000000030', '0101', 'Reyansh Sharma', '45 Thaltej, Ahmedabad - 380054', '9876543239', 60000.75, 660, 'SAVINGS', 6, NULL),
('1000000031', '1112', 'Aanya Gupta', '54 Naranpura, Ahmedabad - 380013', '9876543240', 205000.00, 780, 'CURRENT', 26, '2023-09-10'),
('1000000032', '2223', 'Atharv Singh', '63 Paldi, Ahmedabad - 380007', '9876543241', 90000.25, 700, 'SAVINGS', 10, '2023-05-25'),
('1000000033', '3334', 'Anika Patel', '72 Chandkheda, Ahmedabad - 380024', '9876543242', 260000.50, 810, 'CURRENT', 31, NULL),
('1000000034', '4445', 'Dhruv Shah', '81 Gota, Ahmedabad - 380061', '9876543243', 70000.75, 680, 'SAVINGS', 7, '2023-02-15'),
('1000000035', '5556', 'Pari Desai', '90 Bodakdev, Ahmedabad - 380054', '9876543244', 125000.00, 750, 'SAVINGS', 16, '2023-08-05'),
('1000000036', '6667', 'Aadi Joshi', '19 Ambawadi, Ahmedabad - 380015', '9876543245', 55000.25, 650, 'SAVINGS', 5, NULL),
('1000000037', '7778', 'Siya Mehta', '28 Memnagar, Ahmedabad - 380052', '9876543246', 300000.75, 830, 'CURRENT', 38, '2023-04-30'),
('1000000038', '8889', 'Vivaan Sharma', '37 Vejalpur, Ahmedabad - 380051', '9876543247', 85000.00, 690, 'SAVINGS', 9, '2023-01-20'),
('1000000039', '9990', 'Krisha Gupta', '46 Jodhpur, Ahmedabad - 380015', '9876543248', 140000.50, 760, 'SAVINGS', 17, NULL),
('1000000040', '0001', 'Aryan Singh', '55 Gurukul, Ahmedabad - 380052', '9876543249', 65000.75, 660, 'SAVINGS', 6, '2023-06-28'),
('1000000041', '1123', 'Navya Patel', '64 Ambli, Ahmedabad - 380058', '9876543250', 215000.25, 790, 'CURRENT', 27, '2023-03-10'),
('1000000042', '2234', 'Yuvaan Shah', '73 Sindhu Bhavan, Ahmedabad - 380054', '9876543251', 95000.00, 700, 'SAVINGS', 11, NULL),
('1000000043', '3345', 'Aarohi Desai', '82 Science City, Ahmedabad - 380060', '9876543252', 270000.50, 820, 'CURRENT', 33, '2023-07-15'),
('1000000044', '4456', 'Advait Joshi', '91 S.G. Highway, Ahmedabad - 380054', '9876543253', 75000.75, 680, 'SAVINGS', 7, '2023-02-05'),
('1000000045', '5567', 'Anaya Mehta', '10 Judges Bungalow, Ahmedabad - 380015', '9876543254', 135000.25, 770, 'SAVINGS', 18, NULL),
('1000000046', '6678', 'Ishita Sharma', '29 Satellite, Ahmedabad - 380015', '9876543255', 50000.00, 650, 'SAVINGS', 5, '2023-05-20'),
('1000000047', '7789', 'Vihan Gupta', '38 Prahladnagar, Ahmedabad - 380051', '9876543256', 310000.75, 840, 'CURRENT', 40, '2023-09-25'),
('1000000048', '8890', 'Om Singh', '47 Maninagar, Ahmedabad - 380008', '9876543257', 90000.25, 690, 'SAVINGS', 10, '2023-04-15'),
('1000000049', '9901', 'Tara Patel', '56 Vastrapur, Ahmedabad - 380052', '9876543258', 150000.50, 780, 'SAVINGS', 20, NULL),
('1000000050', '0012', 'Arnav Shah', '65 Navrangpura, Ahmedabad - 380009', '9876543259', 70000.75, 670, 'SAVINGS', 7, '2023-01-30'),
('1000000051', '1357', 'Yash Patel', '102 Shivaji Nagar, Ahmedabad - 380016', '9876543260', 185000.00, 760, 'SAVINGS', 21, '2025-05-15'),
('1000000052', '2468', 'Mansi Shah', '31 Gurukul Road, Ahmedabad - 380052', '9876543261', 92000.50, 710, 'SAVINGS', 11, NULL),
('1000000053', '3579', 'Dev Desai', '88 Science City Road, Ahmedabad - 380060', '9876543262', 275000.75, 810, 'CURRENT', 34, '2025-08-15'),
('1000000054', '4680', 'Kavya Joshi', '17 Judges Bungalow Road, Ahmedabad - 380015', '9876543263', 68000.25, 670, 'SAVINGS', 8, '2025-03-05'),
('1000000055', '5791', 'Rishi Mehta', '26 S.G. Highway, Ahmedabad - 380054', '9876543264', 145000.00, 750, 'SAVINGS', 19, NULL),
('1000000056', '6802', 'Disha Sharma', '35 Satellite, Ahmedabad - 380015', '9876543265', 52000.75, 650, 'SAVINGS', 6, '2025-01-18'),
('1000000057', '7913', 'Arnav Gupta', '44 Prahladnagar, Ahmedabad - 380051', '9876543266', 320000.25, 830, 'CURRENT', 42, '2025-09-30'),
('1000000058', '8024', 'Ira Singh', '53 Maninagar, Ahmedabad - 380008', '9876543267', 88000.00, 690, 'SAVINGS', 10, NULL),
('1000000059', '9135', 'Veer Patel', '62 Vastrapur, Ahmedabad - 380052', '9876543268', 165000.50, 770, 'SAVINGS', 23, '2025-07-22'),
('1000000060', '0246', 'Trisha Shah', '71 Navrangpura, Ahmedabad - 380009', '9876543269', 72000.25, 680, 'SAVINGS', 9, '2025-04-12'),
('1000000061', '1358', 'Rudra Desai', '80 Bopal, Ahmedabad - 380058', '9876543270', 235000.75, 800, 'CURRENT', 31, NULL),
('1000000062', '2469', 'Zara Joshi', '09 Thaltej, Ahmedabad - 380054', '9876543271', 95000.00, 700, 'SAVINGS', 12, '2025-02-28'),
('1000000063', '3570', 'Ayaan Mehta', '18 Naranpura, Ahmedabad - 380013', '9876543272', 155000.25, 780, 'SAVINGS', 25, '2025-08-08'),
('1000000064', '4681', 'Kiara Sharma', '27 Paldi, Ahmedabad - 380007', '9876543273', 58000.50, 660, 'SAVINGS', 7, NULL),
('1000000065', '5792', 'Vihaan Gupta', '36 Chandkheda, Ahmedabad - 380024', '9876543274', 330000.00, 840, 'CURRENT', 45, '2025-10-05'),
('1000000066', '6803', 'Anvi Singh', '45 Gota, Ahmedabad - 380061', '9876543275', 89000.75, 690, 'SAVINGS', 11, '2025-05-15'),
('1000000067', '7914', 'Kian Patel', '54 Bodakdev, Ahmedabad - 380054', '9876543276', 175000.25, 790, 'SAVINGS', 27, NULL),
('1000000068', '8025', 'Mira Shah', '63 Ambawadi, Ahmedabad - 380015', '9876543277', 65000.00, 670, 'SAVINGS', 8, '2025-03-20'),
('1000000069', '9136', 'Aarav Desai', '72 Memnagar, Ahmedabad - 380052', '9876543278', 245000.50, 820, 'CURRENT', 36, '2025-09-12'),
('1000000070', '0247', 'Anaya Joshi', '81 Vejalpur, Ahmedabad - 380051', '9876543279', 98000.25, 710, 'SAVINGS', 14, NULL),
('1000000071', '1359', 'Reyansh Mehta', '90 Jodhpur, Ahmedabad - 380015', '9876543280', 135000.75, 760, 'SAVINGS', 22, '2025-07-05'),
('1000000072', '2460', 'Ishani Sharma', '19 Gurukul, Ahmedabad - 380052', '9876543281', 55000.00, 650, 'SAVINGS', 6, '2025-01-25'),
('1000000073', '3571', 'Advait Gupta', '28 Ambli, Ahmedabad - 380058', '9876543282', 340000.25, 850, 'CURRENT', 48, NULL),
('1000000074', '4682', 'Pari Singh', '37 Sindhu Bhavan, Ahmedabad - 380054', '9876543283', 92000.50, 700, 'SAVINGS', 13, '2025-06-18'),
('1000000075', '5793', 'Dhruv Patel', '46 Science City, Ahmedabad - 380060', '9876543284', 185000.00, 800, 'SAVINGS', 29, '2025-04-30'),
('1000000076', '6804', 'Myra Shah', '55 S.G. Highway, Ahmedabad - 380054', '9876543285', 68000.75, 680, 'SAVINGS', 9, NULL),
('1000000077', '7915', 'Kabir Desai', '64 Judges Bungalow, Ahmedabad - 380015', '9876543286', 255000.25, 830, 'CURRENT', 39, '2025-10-15'),
('1000000078', '8026', 'Siya Joshi', '73 Satellite, Ahmedabad - 380015', '9876543287', 105000.00, 720, 'SAVINGS', 16, '2025-08-22'),
('1000000079', '9137', 'Aryan Mehta', '82 Prahladnagar, Ahmedabad - 380051', '9876543288', 115000.50, 740, 'SAVINGS', 20, NULL),
('1000000080', '0248', 'Kiara Sharma', '91 Maninagar, Ahmedabad - 380008', '9876543289', 62000.25, 660, 'SAVINGS', 7, '2025-05-28'),
('1000000081', '1360', 'Vivaan Gupta', '10 Vastrapur, Ahmedabad - 380052', '9876543290', 350000.75, 860, 'CURRENT', 50, '2025-11-01'),
('1000000082', '2471', 'Anika Singh', '29 Navrangpura, Ahmedabad - 380009', '9876543291', 98000.00, 710, 'SAVINGS', 15, NULL),
('1000000084', '4693', 'Pihu Shah', '47 Thaltej, Ahmedabad - 380054', '9876543293', 75000.50, 690, 'SAVINGS', 10, '2025-07-12'),
('1000000085', '5704', 'Arjun Desai', '56 Naranpura, Ahmedabad - 380013', '9876543294', 265000.00, 840, 'CURRENT', 44, NULL),
('1000000086', '6815', 'Ishita Joshi', '65 Paldi, Ahmedabad - 380007', '9876543295', 112000.75, 730, 'SAVINGS', 18, '2025-05-05'),
('1000000087', '7926', 'Vihaan Mehta', '74 Chandkheda, Ahmedabad - 380024', '9876543296', 125000.25, 750, 'SAVINGS', 24, '2025-03-15'),
('1000000088', '8037', 'Navya Sharma', '83 Gota, Ahmedabad - 380061', '9876543297', 58000.00, 650, 'SAVINGS', 6, NULL),
('1000000089', '9148', 'Yuvaan Gupta', '92 Bodakdev, Ahmedabad - 380054', '9876543298', 360000.50, 870, 'CURRENT', 52, '2025-11-10'),
('1000000090', '0259', 'Aarohi Singh', '21 Ambawadi, Ahmedabad - 380015', '9876543299', 108000.25, 720, 'SAVINGS', 17, '2025-08-30'),
('1000000091', '1370', 'Advait Patel', '30 Memnagar, Ahmedabad - 380052', '9876543300', 205000.75, 820, 'SAVINGS', 35, NULL),
('1000000092', '2481', 'Anaya Shah', '39 Vejalpur, Ahmedabad - 380051', '9876543301', 82000.00, 700, 'SAVINGS', 12, '2025-06-25'),
('1000000093', '3592', 'Aarav Desai', '48 Jodhpur, Ahmedabad - 380015', '9876543302', 275000.25, 850, 'CURRENT', 46, '2025-10-22'),
('1000000094', '4603', 'Ira Joshi', '57 Gurukul, Ahmedabad - 380052', '9876543303', 135000.50, 770, 'SAVINGS', 26, NULL),
('1000000095', '5714', 'Reyansh Mehta', '66 Ambli, Ahmedabad - 380058', '9876543304', 95000.75, 710, 'SAVINGS', 15, '2025-09-15'),
('1000000096', '6825', 'Kiara Sharma', '75 Sindhu Bhavan, Ahmedabad - 380054', '9876543305', 380000.00, 880, 'CURRENT', 54, '2025-12-05'),
('1000000097', '7936', 'Vihan Gupta', '84 Science City, Ahmedabad - 380060', '9876543306', 115000.25, 740, 'SAVINGS', 21, NULL),
('1000000098', '8047', 'Tara Singh', '93 S.G. Highway, Ahmedabad - 380054', '9876543307', 68000.50, 680, 'SAVINGS', 9, '2025-07-28'),
('1000000099', '9158', 'Arnav Patel', '12 Judges Bungalow, Ahmedabad - 380015', '9876543308', 225000.75, 830, 'SAVINGS', 38, '2025-05-10'),
('1580', '4040', 'jalp', 'lj', '8541236415', 676009.68, 700, 'BUSINESS', 3, '2025-08-19'),
('2222', '2221', 'Man Patel', 'LJU', '7896523654', 775011.58, 700, 'BUSINESS', 3, '2025-08-24'),
('2229', '2229', 'Neel Patel', 'LJKU', '9658741236', 784983.00, 700, 'BUSINESS', 4, NULL);

--
-- Triggers `accounts`
--
DELIMITER $$
CREATE TRIGGER `before_account_delete` BEFORE DELETE ON `accounts` FOR EACH ROW BEGIN INSERT INTO accounts_backup (account_number, pin, holder_name, address, mobile_number, balance, credit_score, account_type, transaction_count, last_interest_date, deleted_by) VALUES (OLD.account_number, OLD.pin, OLD.holder_name, OLD.address, OLD.mobile_number, OLD.balance, OLD.credit_score, OLD.account_type, OLD.transaction_count, OLD.last_interest_date, IFNULL(@current_deleter, 'system')); INSERT INTO account_deletion_log (account_number, holder_name, deleted_by) VALUES (OLD.account_number, OLD.holder_name, IFNULL(@current_deleter, 'system')); END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `accounts_backup`
--

CREATE TABLE `accounts_backup` (
  `backup_id` int(11) NOT NULL,
  `account_number` varchar(20) NOT NULL,
  `pin` varchar(10) NOT NULL,
  `holder_name` varchar(100) NOT NULL,
  `address` varchar(200) DEFAULT NULL,
  `mobile_number` varchar(15) DEFAULT NULL,
  `balance` decimal(15,2) NOT NULL,
  `credit_score` int(11) DEFAULT 700,
  `account_type` varchar(20) DEFAULT 'SAVINGS',
  `transaction_count` int(11) DEFAULT 0,
  `last_interest_date` date DEFAULT NULL,
  `deleted_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `deleted_by` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `accounts_backup`
--

INSERT INTO `accounts_backup` (`backup_id`, `account_number`, `pin`, `holder_name`, `address`, `mobile_number`, `balance`, `credit_score`, `account_type`, `transaction_count`, `last_interest_date`, `deleted_at`, `deleted_by`) VALUES
(8, '4096', '1234', 'dax', 'lj1', '5236987415', 804526.82, 700, 'SAVINGS', 2, '2025-08-19', '2025-08-19 13:07:53', 'staff1'),
(9, '4085', '1969', 'sujal', 'LJ', '9826895698', 500000.00, 700, 'SENIOR', 0, NULL, '2025-08-25 04:18:32', 'staff1');

-- --------------------------------------------------------

--
-- Table structure for table `account_deletion_log`
--

CREATE TABLE `account_deletion_log` (
  `id` int(11) NOT NULL,
  `account_number` varchar(20) NOT NULL,
  `holder_name` varchar(100) NOT NULL,
  `deletion_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `deleted_by` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `account_deletion_log`
--

INSERT INTO `account_deletion_log` (`id`, `account_number`, `holder_name`, `deletion_date`, `deleted_by`) VALUES
(5, '4096', 'dax', '2025-08-19 13:07:53', 'staff1'),
(6, '4085', 'sujal', '2025-08-25 04:18:32', 'staff1');

-- --------------------------------------------------------

--
-- Table structure for table `fixed_deposits`
--

CREATE TABLE `fixed_deposits` (
  `id` int(11) NOT NULL,
  `account_number` varchar(20) NOT NULL,
  `principal` decimal(15,2) NOT NULL,
  `tenure_months` int(11) NOT NULL,
  `tax_amount` decimal(15,2) NOT NULL,
  `maturity_amount` decimal(15,2) NOT NULL,
  `created_date` datetime DEFAULT current_timestamp(),
  `interest_rate` decimal(5,2) NOT NULL,
  `tax_rate` decimal(5,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fixed_deposits`
--

INSERT INTO `fixed_deposits` (`id`, `account_number`, `principal`, `tenure_months`, `tax_amount`, `maturity_amount`, `created_date`, `interest_rate`, `tax_rate`) VALUES
(1, '1000000050', 113180.00, 36, 7257.99, 132064.97, '2025-08-19 19:19:05', 0.00, 0.00),
(2, '1000000006', 63322.00, 24, 9219.18, 62197.35, '2025-08-19 19:19:05', 0.00, 0.00),
(3, '1000000050', 17241.00, 36, 2353.72, 18812.14, '2025-08-19 19:19:05', 0.00, 0.00),
(4, '1000000048', 98377.00, 6, 6693.41, 94637.50, '2025-08-19 19:19:05', 0.00, 0.00),
(5, '1000000047', 68963.00, 24, 6128.93, 73329.55, '2025-08-19 19:19:05', 0.00, 0.00),
(6, '1000000058', 107172.00, 6, 7257.87, 103544.21, '2025-08-19 19:19:05', 0.00, 0.00),
(7, '1000000057', 106591.00, 12, 5558.44, 109293.21, '2025-08-19 19:19:05', 0.00, 0.00),
(8, '1000000024', 10076.00, 12, 1374.72, 9273.12, '2025-08-19 19:19:05', 0.00, 0.00),
(9, '1000000035', 195144.00, 24, 23568.19, 192782.16, '2025-08-19 19:19:05', 0.00, 0.00),
(10, '1000000050', 150698.00, 36, 15547.05, 165396.36, '2025-08-19 19:19:05', 0.00, 0.00),
(11, '1000000075', 85283.00, 48, 6856.97, 101352.51, '2025-08-19 19:19:05', 0.00, 0.00),
(12, '1000000019', 187835.00, 12, 11660.79, 186031.74, '2025-08-19 19:19:05', 0.00, 0.00),
(13, '1000000022', 103451.00, 24, 7981.50, 107023.03, '2025-08-19 19:19:05', 0.00, 0.00),
(14, '1000000071', 17670.00, 60, 1269.49, 23031.15, '2025-08-19 19:19:05', 0.00, 0.00),
(15, '1000000097', 66110.00, 60, 4177.96, 88338.59, '2025-08-19 19:19:05', 0.00, 0.00),
(16, '1000000046', 65721.00, 36, 5816.42, 74515.59, '2025-08-19 19:19:05', 0.00, 0.00),
(17, '1000000059', 77459.00, 24, 4603.05, 80784.57, '2025-08-19 19:19:05', 0.00, 0.00),
(18, '1000000063', 75123.00, 60, 8448.89, 87335.08, '2025-08-19 19:19:05', 0.00, 0.00),
(19, '1000000001', 46624.00, 60, 5280.66, 58064.35, '2025-08-19 19:19:05', 0.00, 0.00),
(20, '1000000001', 109262.00, 6, 11113.39, 101603.54, '2025-08-19 19:19:05', 0.00, 0.00),
(21, '1000000037', 162573.00, 60, 21138.14, 197507.20, '2025-08-19 19:19:05', 0.00, 0.00),
(22, '1000000092', 69158.00, 60, 4433.13, 87092.83, '2025-08-19 19:19:05', 0.00, 0.00),
(23, '1000000080', 153392.00, 6, 14937.29, 143417.48, '2025-08-19 19:19:05', 0.00, 0.00),
(24, '1000000056', 123358.00, 6, 12283.20, 114270.62, '2025-08-19 19:19:05', 0.00, 0.00),
(25, '1000000044', 159398.00, 12, 21631.49, 150097.16, '2025-08-19 19:19:05', 0.00, 0.00),
(26, '1000000005', 133166.00, 60, 12712.53, 170376.93, '2025-08-19 19:19:05', 0.00, 0.00),
(27, '1000000051', 169589.00, 60, 13550.45, 204634.60, '2025-08-19 19:19:05', 0.00, 0.00),
(28, '1000000098', 71691.00, 60, 4807.18, 94062.13, '2025-08-19 19:19:05', 0.00, 0.00),
(29, '1000000051', 21259.00, 12, 2546.40, 20045.76, '2025-08-19 19:19:05', 0.00, 0.00),
(30, '1000000032', 73848.00, 12, 10858.21, 67151.27, '2025-08-19 19:19:05', 0.00, 0.00),
(31, '1000000058', 198454.00, 60, 10221.51, 252640.76, '2025-08-19 19:19:05', 0.00, 0.00),
(32, '1000000085', 46723.00, 12, 2887.54, 47330.88, '2025-08-19 19:19:05', 0.00, 0.00),
(33, '1000000081', 100546.00, 48, 11797.06, 114218.63, '2025-08-19 19:19:05', 0.00, 0.00),
(34, '1000000009', 54503.00, 60, 3405.49, 66015.50, '2025-08-19 19:19:05', 0.00, 0.00),
(35, '1000000058', 153883.00, 6, 10386.76, 147866.05, '2025-08-19 19:19:05', 0.00, 0.00),
(36, '1000000085', 179658.00, 60, 15498.91, 235074.20, '2025-08-19 19:19:05', 0.00, 0.00),
(37, '1000000084', 135579.00, 48, 14237.83, 159163.66, '2025-08-19 19:19:05', 0.00, 0.00),
(38, '1000000005', 88215.00, 6, 6059.28, 84535.62, '2025-08-19 19:19:05', 0.00, 0.00),
(39, '1000000088', 90126.00, 6, 8419.11, 84676.27, '2025-08-19 19:19:05', 0.00, 0.00),
(40, '1000000054', 33254.00, 36, 2619.74, 36371.56, '2025-08-19 19:19:05', 0.00, 0.00),
(41, '1000000027', 160957.00, 24, 16942.66, 168737.74, '2025-08-19 19:19:05', 0.00, 0.00),
(42, '1000000024', 14637.00, 6, 1913.66, 13279.87, '2025-08-19 19:19:05', 0.00, 0.00),
(43, '1000000096', 174891.00, 36, 18225.68, 186502.19, '2025-08-19 19:19:05', 0.00, 0.00),
(44, '1000000088', 141835.00, 60, 8148.28, 174023.96, '2025-08-19 19:19:05', 0.00, 0.00),
(45, '1000000001', 149101.00, 24, 8406.37, 160032.82, '2025-08-19 19:19:05', 0.00, 0.00),
(46, '1000000004', 14329.00, 24, 1004.11, 15568.30, '2025-08-19 19:19:05', 0.00, 0.00),
(47, '1000000097', 51408.00, 48, 3899.31, 57866.47, '2025-08-19 19:19:05', 0.00, 0.00),
(48, '1000000035', 123703.00, 60, 18435.86, 151288.61, '2025-08-19 19:19:05', 0.00, 0.00),
(49, '1000000079', 139440.00, 36, 16788.26, 148586.79, '2025-08-19 19:19:05', 0.00, 0.00),
(50, '1000000070', 70274.00, 24, 10286.39, 68905.77, '2025-08-19 19:19:05', 0.00, 0.00),
(52, '1580', 5000.00, 12, 35.00, 5350.00, '2025-08-19 19:42:06', 7.00, 10.00),
(53, '2222', 50000.00, 16, 472.03, 54720.29, '2025-08-24 19:03:58', 7.00, 10.00),
(54, '2229', 50000.00, 12, 350.00, 53500.00, '2025-08-24 19:06:27', 7.00, 10.00),
(59, '1580', 50000.00, 16, 54248.26, 54248.26, '2025-08-24 19:35:29', 7.00, 10.00);

-- --------------------------------------------------------

--
-- Table structure for table `loans`
--

CREATE TABLE `loans` (
  `loan_id` int(11) NOT NULL,
  `account_number` varchar(20) NOT NULL,
  `amount` decimal(15,2) NOT NULL,
  `interest_rate` decimal(5,2) NOT NULL,
  `term_months` int(11) NOT NULL,
  `purpose` varchar(200) DEFAULT NULL,
  `status` varchar(20) DEFAULT 'PENDING',
  `application_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `approval_date` timestamp NULL DEFAULT NULL,
  `approved_by` varchar(20) DEFAULT NULL,
  `monthly_payment` decimal(15,2) DEFAULT NULL,
  `total_repayment` decimal(15,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `loans`
--

INSERT INTO `loans` (`loan_id`, `account_number`, `amount`, `interest_rate`, `term_months`, `purpose`, `status`, `application_date`, `approval_date`, `approved_by`, `monthly_payment`, `total_repayment`) VALUES
(1, '1000000007', 185000.00, 9.25, 60, 'Home Loan', 'APPROVED', '2025-08-19 02:03:39', '2025-08-19 02:03:39', 'manager1', 3850.00, 231000.00),
(2, '1000000015', 95000.00, 10.75, 36, 'Car Loan', 'APPROVED', '2025-08-19 02:03:39', '2025-08-19 02:03:39', 'manager1', 3100.00, 111600.00),
(3, '1000000023', 240000.00, 8.90, 60, 'Business Loan', 'APPROVED', '2025-08-19 02:03:39', '2025-08-19 02:03:39', 'manager1', 4950.00, 297000.00),
(4, '1000000048', 75000.00, 11.25, 24, 'Education Loan', 'APPROVED', '2025-08-19 02:03:39', '2025-08-19 02:03:39', 'manager1', 3500.00, 84000.00),
(5, '1000000059', 165000.00, 10.50, 48, 'Medical Loan', 'APPROVED', '2025-08-19 02:03:39', '2025-08-19 02:03:39', 'manager1', 4300.00, 206400.00),
(6, '1000000065', 220000.00, 9.50, 60, 'Home Loan', 'APPROVED', '2025-08-19 02:03:39', '2025-08-19 02:03:39', 'manager1', 4600.00, 276000.00),
(7, '1000000078', 105000.00, 11.00, 36, 'Wedding Loan', 'APPROVED', '2025-08-19 02:03:39', '2025-08-19 02:03:39', 'manager1', 3450.00, 124200.00),
(8, '1000000081', 180000.00, 9.75, 48, 'Car Loan', 'APPROVED', '2025-08-19 02:03:39', '2025-08-19 02:03:39', 'manager1', 4600.00, 220800.00),
(9, '1000000092', 82000.00, 11.50, 24, 'Education Loan', 'APPROVED', '2025-08-19 02:03:39', '2025-08-19 02:03:39', 'manager1', 3800.00, 91200.00),
(10, '1000000096', 275000.00, 8.80, 60, 'Business Loan', 'APPROVED', '2025-08-19 02:03:39', '2025-08-19 02:03:39', 'manager1', 5500.00, 330000.00),
(11, '1000000002', 85000.00, 10.50, 24, 'Medical Loan', 'APPROVED', '2025-08-19 02:03:39', '2025-08-19 02:03:39', 'manager1', 3750.00, 90000.00),
(12, '1000000031', 205000.00, 9.20, 60, 'Home Loan', 'APPROVED', '2025-08-19 02:03:39', '2025-08-19 02:03:39', 'manager1', 4100.00, 246000.00),
(13, '1000000040', 60000.00, 11.75, 12, 'Personal Loan', 'APPROVED', '2025-08-19 02:03:39', '2025-08-19 02:03:39', 'manager1', 5300.00, 63600.00),
(14, '1000000051', 145000.00, 10.25, 36, 'Car Loan', 'APPROVED', '2025-08-19 02:03:39', '2025-08-19 02:03:39', 'manager1', 3700.00, 133200.00),
(15, '1000000069', 245000.00, 9.00, 60, 'Business Loan', 'APPROVED', '2025-08-19 02:03:39', '2025-08-19 02:03:39', 'manager1', 4900.00, 294000.00),
(16, '1000000074', 92000.00, 11.25, 24, 'Education Loan', 'APPROVED', '2025-08-19 02:03:39', '2025-08-19 02:03:39', 'manager1', 4200.00, 100800.00),
(17, '1000000086', 112000.00, 10.50, 36, 'Medical Loan', 'APPROVED', '2025-08-19 02:03:39', '2025-08-19 02:03:39', 'manager1', 3650.00, 131400.00),
(18, '1000000099', 225000.00, 9.40, 48, 'Home Loan', 'APPROVED', '2025-08-19 02:03:39', '2025-08-19 02:03:39', 'manager1', 4850.00, 232800.00),
(19, '1000000006', 90000.00, 11.00, 24, 'Wedding Loan', 'APPROVED', '2025-08-19 02:03:39', '2025-08-19 02:03:39', 'manager1', 4100.00, 98400.00),
(20, '1000000012', 95000.00, 10.25, 36, 'Car Loan', 'APPROVED', '2025-08-19 02:03:39', '2025-08-19 02:03:39', 'manager1', 3150.00, 113400.00),
(21, '1000000027', 290000.00, 8.75, 60, 'Business Loan', 'APPROVED', '2025-08-19 02:03:39', '2025-08-19 02:03:39', 'manager1', 5800.00, 348000.00),
(22, '1000000033', 260000.00, 9.00, 60, 'Home Loan', 'APPROVED', '2025-08-19 02:03:39', '2025-08-19 02:03:39', 'manager1', 5200.00, 312000.00),
(23, '1000000042', 95000.00, 11.00, 24, 'Education Loan', 'APPROVED', '2025-08-19 02:03:39', '2025-08-19 02:03:39', 'manager1', 4300.00, 103200.00),
(24, '1000000055', 140000.00, 10.25, 48, 'Medical Loan', 'APPROVED', '2025-08-19 02:03:39', '2025-08-19 02:03:39', 'manager1', 3500.00, 168000.00),
(25, '1000000067', 175000.00, 9.75, 36, 'Car Loan', 'APPROVED', '2025-08-19 02:03:39', '2025-08-19 02:03:39', 'manager1', 3900.00, 140400.00),
(26, '1000000073', 340000.00, 8.90, 60, 'Business Loan', 'APPROVED', '2025-08-19 02:03:39', '2025-08-19 02:03:39', 'manager1', 6800.00, 408000.00),
(27, '1000000084', 75000.00, 11.50, 24, 'Travel Loan', 'APPROVED', '2025-08-19 02:03:39', '2025-08-19 02:03:39', 'manager1', 3500.00, 84000.00),
(28, '1000000090', 108000.00, 10.75, 36, 'Wedding Loan', 'APPROVED', '2025-08-19 02:03:39', '2025-08-19 02:03:39', 'manager1', 3600.00, 129600.00),
(29, '1000000001', 125000.00, 9.50, 48, 'Car Loan', 'APPROVED', '2025-08-19 02:03:39', '2025-08-19 02:03:39', 'manager1', 2600.00, 124800.00),
(30, '1000000019', 120000.00, 10.25, 36, 'Medical Loan', 'APPROVED', '2025-08-19 02:03:39', '2025-08-19 02:03:39', 'manager1', 4000.00, 144000.00),
(31, '1000000025', 130000.00, 9.75, 48, 'Home Loan', 'APPROVED', '2025-08-19 02:03:39', '2025-08-19 02:03:39', 'manager1', 2700.00, 129600.00),
(32, '1000000035', 125000.00, 10.00, 36, 'Car Loan', 'APPROVED', '2025-08-19 02:03:39', '2025-08-19 02:03:39', 'manager1', 4200.00, 151200.00),
(33, '1000000047', 310000.00, 9.00, 60, 'Business Loan', 'APPROVED', '2025-08-19 02:03:39', '2025-08-19 02:03:39', 'manager1', 6200.00, 372000.00),
(34, '1000000053', 275000.00, 9.20, 60, 'Home Loan', 'APPROVED', '2025-08-19 02:03:39', '2025-08-19 02:03:39', 'manager1', 5500.00, 330000.00),
(35, '1000000061', 235000.00, 9.50, 48, 'Business Loan', 'APPROVED', '2025-08-19 02:03:39', '2025-08-19 02:03:39', 'manager1', 4900.00, 235200.00),
(36, '1000000070', 98000.00, 11.25, 24, 'Education Loan', 'APPROVED', '2025-08-19 02:03:39', '2025-08-19 02:03:39', 'manager1', 4100.00, 98400.00),
(37, '1000000082', 98000.00, 10.50, 36, 'Medical Loan', 'APPROVED', '2025-08-19 02:03:39', '2025-08-19 02:03:39', 'manager1', 3300.00, 118800.00),
(38, '1000000094', 135000.00, 10.00, 36, 'Car Loan', 'APPROVED', '2025-08-19 02:03:39', '2025-08-19 02:03:39', 'manager1', 4500.00, 162000.00),
(39, '1000000008', 75000.00, 11.00, 24, 'Wedding Loan', 'APPROVED', '2025-08-19 02:03:39', '2025-08-19 02:03:39', 'manager1', 3600.00, 86400.00),
(40, '1000000020', 65000.00, 11.50, 24, 'Personal Loan', 'APPROVED', '2025-08-19 02:03:39', '2025-08-19 02:03:39', 'manager1', 2950.00, 70800.00),
(41, '1000000037', 300000.00, 9.00, 60, 'Home Loan', 'APPROVED', '2025-08-19 02:03:39', '2025-08-19 02:03:39', 'manager1', 6000.00, 360000.00),
(42, '1000000057', 320000.00, 8.75, 60, 'Business Loan', 'APPROVED', '2025-08-19 02:03:39', '2025-08-19 02:03:39', 'manager1', 6400.00, 384000.00),
(43, '1000000063', 155000.00, 9.75, 48, 'Medical Loan', 'APPROVED', '2025-08-19 02:03:39', '2025-08-19 02:03:39', 'manager1', 3200.00, 153600.00),
(44, '1000000075', 185000.00, 9.50, 48, 'Car Loan', 'APPROVED', '2025-08-19 02:03:39', '2025-08-19 02:03:39', 'manager1', 3700.00, 177600.00),
(45, '1000000087', 125000.00, 10.25, 36, 'Education Loan', 'APPROVED', '2025-08-19 02:03:39', '2025-08-19 02:03:39', 'manager1', 4200.00, 151200.00),
(46, '1000000091', 205000.00, 9.25, 60, 'Home Loan', 'APPROVED', '2025-08-19 02:03:39', '2025-08-19 02:03:39', 'manager1', 4100.00, 246000.00),
(47, '1000000004', 50000.00, 12.00, 12, 'Emergency Loan', 'APPROVED', '2025-08-19 02:03:39', '2025-08-19 02:03:39', 'manager1', 4500.00, 54000.00),
(48, '1000000010', 60000.00, 11.75, 24, 'Medical Loan', 'APPROVED', '2025-08-19 02:03:39', '2025-08-19 02:03:39', 'manager1', 2700.00, 64800.00),
(49, '1000000029', 115000.00, 10.50, 36, 'Wedding Loan', 'APPROVED', '2025-08-19 02:03:39', '2025-08-19 02:03:39', 'manager1', 3800.00, 136800.00),
(50, '1000000045', 135000.00, 9.90, 48, 'Car Loan', 'APPROVED', '2025-08-19 02:03:39', '2025-08-19 02:03:39', 'manager1', 2800.00, 134400.00),
(51, '1580', 100000.00, 10.00, 12, 'car', 'APPROVED', '2025-08-19 06:53:48', '2025-08-19 06:55:18', 'manager1', 9166.67, 110000.00),
(53, '2222', 80000.00, 10.00, 20, 'Car', 'APPROVED', '2025-08-24 14:10:03', '2025-08-25 04:43:08', 'manager1', 4666.67, 93333.33),
(54, '2229', 500000.00, 10.00, 25, 'car', 'REJECTED', '2025-08-24 14:10:51', '2025-08-25 04:43:16', 'manager1', 24166.67, 604166.67);

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `staff_id` varchar(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `age` int(11) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `email` varchar(100) NOT NULL,
  `mobile_number` varchar(15) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`staff_id`, `name`, `age`, `gender`, `email`, `mobile_number`, `password`) VALUES
('staff1', 'Jalp Patel', 19, 'Male', 'jalppatel@bank.com', '9874563258', 'jalp'),
('staff2', 'Man Patel', 18, 'Male', 'manpatel@bank.com', '8654712369', 'man'),
('staff3', 'Neel Patel', 18, 'Male', 'neelpatel@bank.com', '9632587458', 'neel'),
('staff5', 'dax', 18, 'male', 'dax@bank.com', '6985332147', 'dax');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `transaction_id` int(11) NOT NULL,
  `account_number` varchar(20) NOT NULL,
  `type` varchar(20) NOT NULL,
  `amount` decimal(15,2) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  `transaction_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`transaction_id`, `account_number`, `type`, `amount`, `description`, `transaction_date`) VALUES
(1, '1000000021', 'DEPOSIT', 10945.00, 'DEPOSIT Transaction 1', '2024-05-03 18:30:00'),
(2, '1000000036', 'WITHDRAWAL', 30780.00, 'WITHDRAWAL Transaction 2', '2024-10-24 18:30:00'),
(3, '1000000085', 'LOAN EMI', 7898.00, 'LOAN EMI Transaction 3', '2024-05-31 18:30:00'),
(4, '1000000067', 'DEPOSIT', 11876.00, 'DEPOSIT Transaction 4', '2024-06-08 18:30:00'),
(5, '1000000087', 'TRANSFER', 35242.00, 'TRANSFER Transaction 5', '2024-06-09 18:30:00'),
(6, '1000000030', 'LOAN EMI', 14021.00, 'LOAN EMI Transaction 6', '2025-01-08 18:30:00'),
(7, '1000000023', 'TRANSFER', 14649.00, 'TRANSFER Transaction 7', '2024-05-29 18:30:00'),
(8, '1000000051', 'WITHDRAWAL', 33175.00, 'WITHDRAWAL Transaction 8', '2025-07-16 18:30:00'),
(9, '1000000048', 'DEPOSIT', 15468.00, 'DEPOSIT Transaction 9', '2024-06-12 18:30:00'),
(10, '1000000059', 'LOAN EMI', 27386.00, 'LOAN EMI Transaction 10', '2025-01-06 18:30:00'),
(11, '1000000040', 'WITHDRAWAL', 7697.00, 'WITHDRAWAL Transaction 11', '2025-02-27 18:30:00'),
(12, '1000000061', 'LOAN EMI', 22947.00, 'LOAN EMI Transaction 12', '2024-11-27 18:30:00'),
(13, '1000000095', 'WITHDRAWAL', 45275.00, 'WITHDRAWAL Transaction 13', '2024-11-15 18:30:00'),
(14, '1000000012', 'TRANSFER', 44640.00, 'TRANSFER Transaction 14', '2024-04-09 18:30:00'),
(15, '1000000021', 'LOAN EMI', 10813.00, 'LOAN EMI Transaction 15', '2024-09-13 18:30:00'),
(16, '1000000088', 'LOAN EMI', 1552.00, 'LOAN EMI Transaction 16', '2025-08-04 18:30:00'),
(17, '1000000001', 'LOAN EMI', 21499.00, 'LOAN EMI Transaction 17', '2025-02-02 18:30:00'),
(18, '1000000016', 'LOAN EMI', 49163.00, 'LOAN EMI Transaction 18', '2025-05-05 18:30:00'),
(19, '1000000013', 'LOAN EMI', 36291.00, 'LOAN EMI Transaction 19', '2025-03-09 18:30:00'),
(20, '1000000009', 'WITHDRAWAL', 12227.00, 'WITHDRAWAL Transaction 20', '2025-07-03 18:30:00'),
(21, '1000000075', 'WITHDRAWAL', 47270.00, 'WITHDRAWAL Transaction 21', '2025-01-14 18:30:00'),
(22, '1000000019', 'LOAN EMI', 22999.00, 'LOAN EMI Transaction 22', '2025-07-14 18:30:00'),
(23, '1000000053', 'WITHDRAWAL', 34392.00, 'WITHDRAWAL Transaction 23', '2024-02-07 18:30:00'),
(24, '1000000082', 'WITHDRAWAL', 47508.00, 'WITHDRAWAL Transaction 24', '2024-12-03 18:30:00'),
(25, '1000000067', 'LOAN EMI', 28526.00, 'LOAN EMI Transaction 25', '2025-06-05 18:30:00'),
(26, '1000000009', 'TRANSFER', 30829.00, 'TRANSFER Transaction 26', '2025-03-31 18:30:00'),
(27, '1000000097', 'LOAN EMI', 571.00, 'LOAN EMI Transaction 27', '2024-04-13 18:30:00'),
(28, '1000000008', 'LOAN EMI', 29934.00, 'LOAN EMI Transaction 28', '2024-09-07 18:30:00'),
(29, '1000000016', 'WITHDRAWAL', 42750.00, 'WITHDRAWAL Transaction 29', '2024-02-12 18:30:00'),
(30, '1000000043', 'LOAN EMI', 48639.00, 'LOAN EMI Transaction 30', '2024-05-28 18:30:00'),
(31, '1000000033', 'TRANSFER', 40843.00, 'TRANSFER Transaction 31', '2025-01-26 18:30:00'),
(32, '1000000054', 'TRANSFER', 49582.00, 'TRANSFER Transaction 32', '2025-05-22 18:30:00'),
(33, '1000000098', 'DEPOSIT', 25837.00, 'DEPOSIT Transaction 33', '2025-07-08 18:30:00'),
(34, '1000000028', 'TRANSFER', 2392.00, 'TRANSFER Transaction 34', '2025-08-11 18:30:00'),
(35, '1000000054', 'TRANSFER', 46404.00, 'TRANSFER Transaction 35', '2024-12-05 18:30:00'),
(36, '1000000057', 'DEPOSIT', 40929.00, 'DEPOSIT Transaction 36', '2025-05-16 18:30:00'),
(37, '1000000013', 'LOAN EMI', 48968.00, 'LOAN EMI Transaction 37', '2025-02-08 18:30:00'),
(38, '1000000015', 'DEPOSIT', 19648.00, 'DEPOSIT Transaction 38', '2024-04-13 18:30:00'),
(39, '1000000092', 'TRANSFER', 13517.00, 'TRANSFER Transaction 39', '2025-06-22 18:30:00'),
(40, '1000000091', 'DEPOSIT', 18497.00, 'DEPOSIT Transaction 40', '2025-01-11 18:30:00'),
(41, '1000000075', 'TRANSFER', 13894.00, 'TRANSFER Transaction 41', '2024-02-12 18:30:00'),
(42, '1000000065', 'DEPOSIT', 12836.00, 'DEPOSIT Transaction 42', '2025-07-03 18:30:00'),
(43, '1000000071', 'DEPOSIT', 17862.00, 'DEPOSIT Transaction 43', '2024-03-12 18:30:00'),
(44, '1000000098', 'LOAN EMI', 16253.00, 'LOAN EMI Transaction 44', '2025-01-18 18:30:00'),
(45, '1000000084', 'WITHDRAWAL', 41729.00, 'WITHDRAWAL Transaction 45', '2024-09-04 18:30:00'),
(46, '1000000039', 'LOAN EMI', 25588.00, 'LOAN EMI Transaction 46', '2024-05-11 18:30:00'),
(47, '1000000086', 'DEPOSIT', 7228.00, 'DEPOSIT Transaction 47', '2025-07-10 18:30:00'),
(48, '1000000064', 'TRANSFER', 34813.00, 'TRANSFER Transaction 48', '2024-09-26 18:30:00'),
(49, '1000000042', 'LOAN EMI', 48301.00, 'LOAN EMI Transaction 49', '2024-02-27 18:30:00'),
(50, '1000000076', 'LOAN EMI', 47253.00, 'LOAN EMI Transaction 50', '2025-05-28 18:30:00'),
(51, '1000000052', 'DEPOSIT', 36864.00, 'DEPOSIT Transaction 51', '2024-06-17 18:30:00'),
(52, '1000000036', 'WITHDRAWAL', 30227.00, 'WITHDRAWAL Transaction 52', '2025-06-30 18:30:00'),
(53, '1000000012', 'DEPOSIT', 12232.00, 'DEPOSIT Transaction 53', '2025-04-05 18:30:00'),
(54, '1000000087', 'WITHDRAWAL', 15090.00, 'WITHDRAWAL Transaction 54', '2025-08-01 18:30:00'),
(55, '1000000010', 'TRANSFER', 15282.00, 'TRANSFER Transaction 55', '2024-12-16 18:30:00'),
(56, '1000000025', 'DEPOSIT', 36786.00, 'DEPOSIT Transaction 56', '2024-04-19 18:30:00'),
(57, '1000000098', 'WITHDRAWAL', 43870.00, 'WITHDRAWAL Transaction 57', '2024-07-27 18:30:00'),
(58, '1000000047', 'LOAN EMI', 41080.00, 'LOAN EMI Transaction 58', '2024-08-24 18:30:00'),
(59, '1000000043', 'WITHDRAWAL', 41714.00, 'WITHDRAWAL Transaction 59', '2025-05-08 18:30:00'),
(60, '1000000033', 'WITHDRAWAL', 43453.00, 'WITHDRAWAL Transaction 60', '2025-03-02 18:30:00'),
(61, '1000000009', 'WITHDRAWAL', 24937.00, 'WITHDRAWAL Transaction 61', '2023-12-31 18:30:00'),
(62, '1000000029', 'DEPOSIT', 27632.00, 'DEPOSIT Transaction 62', '2024-01-30 18:30:00'),
(63, '1000000056', 'LOAN EMI', 37394.00, 'LOAN EMI Transaction 63', '2025-06-16 18:30:00'),
(64, '1000000048', 'WITHDRAWAL', 33093.00, 'WITHDRAWAL Transaction 64', '2024-02-12 18:30:00'),
(65, '1000000016', 'DEPOSIT', 8561.00, 'DEPOSIT Transaction 65', '2024-12-03 18:30:00'),
(66, '1000000024', 'LOAN EMI', 46365.00, 'LOAN EMI Transaction 66', '2024-08-23 18:30:00'),
(67, '1000000044', 'WITHDRAWAL', 38117.00, 'WITHDRAWAL Transaction 67', '2024-12-14 18:30:00'),
(68, '1000000092', 'DEPOSIT', 49627.00, 'DEPOSIT Transaction 68', '2024-02-06 18:30:00'),
(69, '1000000064', 'TRANSFER', 42546.00, 'TRANSFER Transaction 69', '2024-08-18 18:30:00'),
(70, '1000000009', 'WITHDRAWAL', 12875.00, 'WITHDRAWAL Transaction 70', '2025-05-10 18:30:00'),
(71, '1000000029', 'DEPOSIT', 20768.00, 'DEPOSIT Transaction 71', '2024-07-17 18:30:00'),
(72, '1000000030', 'DEPOSIT', 41250.00, 'DEPOSIT Transaction 72', '2024-03-30 18:30:00'),
(73, '1000000071', 'LOAN EMI', 1670.00, 'LOAN EMI Transaction 73', '2025-01-25 18:30:00'),
(74, '1000000093', 'LOAN EMI', 28072.00, 'LOAN EMI Transaction 74', '2024-08-31 18:30:00'),
(75, '1000000004', 'LOAN EMI', 43165.00, 'LOAN EMI Transaction 75', '2024-07-05 18:30:00'),
(76, '1000000012', 'DEPOSIT', 32500.00, 'DEPOSIT Transaction 76', '2024-12-05 18:30:00'),
(77, '1000000006', 'WITHDRAWAL', 42513.00, 'WITHDRAWAL Transaction 77', '2025-05-01 18:30:00'),
(78, '1000000043', 'WITHDRAWAL', 28490.00, 'WITHDRAWAL Transaction 78', '2024-11-10 18:30:00'),
(79, '1000000087', 'WITHDRAWAL', 39945.00, 'WITHDRAWAL Transaction 79', '2024-07-29 18:30:00'),
(80, '1000000069', 'DEPOSIT', 43646.00, 'DEPOSIT Transaction 80', '2024-11-11 18:30:00'),
(81, '1000000087', 'DEPOSIT', 10366.00, 'DEPOSIT Transaction 81', '2024-06-07 18:30:00'),
(82, '1000000048', 'DEPOSIT', 35021.00, 'DEPOSIT Transaction 82', '2025-02-23 18:30:00'),
(83, '1000000099', 'TRANSFER', 13394.00, 'TRANSFER Transaction 83', '2025-08-12 18:30:00'),
(84, '1000000066', 'WITHDRAWAL', 44751.00, 'WITHDRAWAL Transaction 84', '2024-01-06 18:30:00'),
(85, '1000000054', 'WITHDRAWAL', 44769.00, 'WITHDRAWAL Transaction 85', '2024-11-20 18:30:00'),
(86, '1000000094', 'DEPOSIT', 20051.00, 'DEPOSIT Transaction 86', '2024-08-29 18:30:00'),
(87, '1000000030', 'WITHDRAWAL', 38747.00, 'WITHDRAWAL Transaction 87', '2025-07-02 18:30:00'),
(88, '1000000004', 'DEPOSIT', 33908.00, 'DEPOSIT Transaction 88', '2024-06-08 18:30:00'),
(89, '1000000069', 'LOAN EMI', 40629.00, 'LOAN EMI Transaction 89', '2024-08-31 18:30:00'),
(90, '1000000059', 'LOAN EMI', 34250.00, 'LOAN EMI Transaction 90', '2025-02-24 18:30:00'),
(91, '1000000070', 'TRANSFER', 33892.00, 'TRANSFER Transaction 91', '2024-04-27 18:30:00'),
(92, '1000000061', 'WITHDRAWAL', 28198.00, 'WITHDRAWAL Transaction 92', '2024-11-19 18:30:00'),
(93, '1000000039', 'LOAN EMI', 49992.00, 'LOAN EMI Transaction 93', '2024-06-04 18:30:00'),
(94, '1000000056', 'WITHDRAWAL', 48254.00, 'WITHDRAWAL Transaction 94', '2025-01-25 18:30:00'),
(95, '1000000035', 'WITHDRAWAL', 5361.00, 'WITHDRAWAL Transaction 95', '2024-04-17 18:30:00'),
(96, '1000000074', 'TRANSFER', 24735.00, 'TRANSFER Transaction 96', '2025-02-04 18:30:00'),
(97, '1000000061', 'TRANSFER', 20910.00, 'TRANSFER Transaction 97', '2024-10-30 18:30:00'),
(98, '1000000047', 'WITHDRAWAL', 25955.00, 'WITHDRAWAL Transaction 98', '2025-07-03 18:30:00'),
(99, '1000000069', 'TRANSFER', 29013.00, 'TRANSFER Transaction 99', '2024-01-21 18:30:00'),
(100, '1000000079', 'WITHDRAWAL', 46822.00, 'WITHDRAWAL Transaction 100', '2025-05-20 18:30:00'),
(101, '1000000001', 'DEPOSIT', 15000.00, 'Initial Deposit', '2025-01-15 04:55:00'),
(102, '1000000002', 'WITHDRAWAL', 5000.00, 'ATM Withdrawal', '2025-02-05 08:40:00'),
(103, '1000000003', 'TRANSFER', 20000.00, 'Transfer to 1000000005', '2025-02-20 05:45:00'),
(104, '1000000004', 'LOAN EMI', 4500.00, 'Home Loan EMI', '2025-03-10 04:00:00'),
(105, '1000000005', 'DEPOSIT', 18000.00, 'Salary Credit', '2025-03-25 10:50:00'),
(106, '1000000006', 'WITHDRAWAL', 7000.00, 'ATM Withdrawal', '2025-04-02 12:35:00'),
(107, '1000000007', 'TRANSFER', 25000.00, 'Transfer to 1000000010', '2025-04-15 08:10:00'),
(108, '1000000008', 'LOAN EMI', 3500.00, 'Car Loan EMI', '2025-05-01 05:20:00'),
(109, '1000000009', 'DEPOSIT', 22000.00, 'Cheque Deposit', '2025-05-18 06:30:00'),
(110, '1000000010', 'WITHDRAWAL', 6000.00, 'ATM Withdrawal', '2025-06-02 03:15:00'),
(111, '1000000011', 'TRANSFER', 15000.00, 'Transfer to 1000000013', '2025-06-20 13:35:00'),
(112, '1000000012', 'DEPOSIT', 25000.00, 'UPI Credit', '2025-07-10 08:55:00'),
(113, '1000000013', 'LOAN EMI', 5000.00, 'Business Loan EMI', '2025-07-25 12:00:00'),
(114, '1000000014', 'WITHDRAWAL', 3000.00, 'ATM Withdrawal', '2025-08-01 10:20:00'),
(115, '1000000015', 'TRANSFER', 28000.00, 'Transfer to 1000000017', '2025-08-12 03:50:00'),
(116, '1000000016', 'DEPOSIT', 32000.00, 'Salary Credit', '2025-08-18 05:40:00'),
(117, '1000000017', 'LOAN EMI', 7000.00, 'Home Loan EMI', '2025-09-01 04:45:00'),
(118, '1000000018', 'WITHDRAWAL', 4500.00, 'ATM Withdrawal', '2025-09-05 07:30:00'),
(119, '1000000019', 'TRANSFER', 12000.00, 'Transfer to 1000000020', '2025-09-20 11:10:00'),
(120, '1000000020', 'DEPOSIT', 18000.00, 'Cheque Deposit', '2025-10-02 04:25:00'),
(154, '1580', 'DEPOSIT', 500.00, 'Staff-assisted deposit', '2025-08-19 03:11:13'),
(155, '1580', 'INTEREST', 9.68, 'Monthly interest credit', '2025-08-19 03:15:44'),
(156, '1580', 'WITHDRAWAL', 500.00, 'Cash withdrawal', '2025-08-19 06:52:39'),
(157, '1580', 'DEPOSIT', 500.00, 'Cash deposit', '2025-08-19 06:52:47'),
(163, '1580', 'DEPOSIT', 500.00, 'Staff-assisted deposit', '2025-08-22 08:16:00'),
(164, '1580', 'DEPOSIT', 50000.00, 'Staff-assisted deposit by staff1', '2025-08-22 08:48:48'),
(165, '2222', 'DEPOSIT', 50000.00, 'Staff-assisted deposit by staff1', '2025-08-24 13:33:03'),
(166, '2222', 'WITHDRAWAL', 80000.00, 'Staff-assisted withdrawal by staff1', '2025-08-24 13:33:24'),
(167, '2229', 'DEPOSIT', 25896.00, 'Staff-assisted deposit by staff1', '2025-08-24 13:36:02'),
(168, '2222', 'INTEREST', 11.58, 'Monthly interest credit', '2025-08-24 14:15:29'),
(169, '2222', 'LOAN', 80000.00, 'Loan approved and credited', '2025-08-25 04:43:08');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`account_number`);

--
-- Indexes for table `accounts_backup`
--
ALTER TABLE `accounts_backup`
  ADD PRIMARY KEY (`backup_id`);

--
-- Indexes for table `account_deletion_log`
--
ALTER TABLE `account_deletion_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fixed_deposits`
--
ALTER TABLE `fixed_deposits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_number` (`account_number`);

--
-- Indexes for table `loans`
--
ALTER TABLE `loans`
  ADD PRIMARY KEY (`loan_id`),
  ADD KEY `account_number` (`account_number`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`staff_id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`transaction_id`),
  ADD KEY `account_number` (`account_number`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts_backup`
--
ALTER TABLE `accounts_backup`
  MODIFY `backup_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `account_deletion_log`
--
ALTER TABLE `account_deletion_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `fixed_deposits`
--
ALTER TABLE `fixed_deposits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `loans`
--
ALTER TABLE `loans`
  MODIFY `loan_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `transaction_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=170;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `fixed_deposits`
--
ALTER TABLE `fixed_deposits`
  ADD CONSTRAINT `fixed_deposits_ibfk_1` FOREIGN KEY (`account_number`) REFERENCES `accounts` (`account_number`);

--
-- Constraints for table `loans`
--
ALTER TABLE `loans`
  ADD CONSTRAINT `loans_ibfk_1` FOREIGN KEY (`account_number`) REFERENCES `accounts` (`account_number`);

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`account_number`) REFERENCES `accounts` (`account_number`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
