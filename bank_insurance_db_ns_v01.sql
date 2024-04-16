-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 15, 2024 at 04:55 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bank_insurance_db_ns_v01`
--

-- --------------------------------------------------------

--
-- Table structure for table `aspnetroleclaims`
--

CREATE TABLE `aspnetroleclaims` (
  `Id` int(11) NOT NULL,
  `RoleId` varchar(255) NOT NULL,
  `ClaimType` longtext DEFAULT NULL,
  `ClaimValue` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `aspnetroles`
--

CREATE TABLE `aspnetroles` (
  `Id` varchar(255) NOT NULL,
  `Name` varchar(256) DEFAULT NULL,
  `NormalizedName` varchar(256) DEFAULT NULL,
  `ConcurrencyStamp` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `aspnetroles`
--

INSERT INTO `aspnetroles` (`Id`, `Name`, `NormalizedName`, `ConcurrencyStamp`) VALUES
('cd14e372-0ddd-4b5d-80ba-f5556483e35f', 'Admin', 'ADMIN', NULL),
('d974e5c4-a799-49e5-83e9-0a2082247f6c', 'User', 'USER', '57fa4620-a93b-46db-8a3a-6a83ca73624e');

-- --------------------------------------------------------

--
-- Table structure for table `aspnetuserclaims`
--

CREATE TABLE `aspnetuserclaims` (
  `Id` int(11) NOT NULL,
  `UserId` varchar(255) NOT NULL,
  `ClaimType` longtext DEFAULT NULL,
  `ClaimValue` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `aspnetuserlogins`
--

CREATE TABLE `aspnetuserlogins` (
  `LoginProvider` varchar(128) NOT NULL,
  `ProviderKey` varchar(128) NOT NULL,
  `ProviderDisplayName` longtext DEFAULT NULL,
  `UserId` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `aspnetuserroles`
--

CREATE TABLE `aspnetuserroles` (
  `UserId` varchar(255) NOT NULL,
  `RoleId` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `aspnetuserroles`
--

INSERT INTO `aspnetuserroles` (`UserId`, `RoleId`) VALUES
('31e0ca35-1b21-4286-ab40-0d1d4aa2a254', 'd974e5c4-a799-49e5-83e9-0a2082247f6c'),
('49573782-f7d4-4510-8a27-07d3210ccf0d', 'cd14e372-0ddd-4b5d-80ba-f5556483e35f'),
('4a579bfd-1ae4-46dc-96fd-80281cb1e5aa', 'd974e5c4-a799-49e5-83e9-0a2082247f6c'),
('90164791-04cc-489b-a764-f564e691a7bf', 'd974e5c4-a799-49e5-83e9-0a2082247f6c'),
('936a9cc4-8e3f-49d6-98e0-77c930ec213b', 'd974e5c4-a799-49e5-83e9-0a2082247f6c');

-- --------------------------------------------------------

--
-- Table structure for table `aspnetusers`
--

CREATE TABLE `aspnetusers` (
  `Id` varchar(255) NOT NULL,
  `Discriminator` varchar(21) NOT NULL,
  `FullName` longtext DEFAULT NULL,
  `Profession` longtext DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  `NicNo` longtext DEFAULT NULL,
  `Address` longtext DEFAULT NULL,
  `UserName` varchar(256) DEFAULT NULL,
  `NormalizedUserName` varchar(256) DEFAULT NULL,
  `Email` varchar(256) DEFAULT NULL,
  `NormalizedEmail` varchar(256) DEFAULT NULL,
  `EmailConfirmed` tinyint(1) NOT NULL,
  `PasswordHash` longtext DEFAULT NULL,
  `SecurityStamp` longtext DEFAULT NULL,
  `ConcurrencyStamp` longtext DEFAULT NULL,
  `PhoneNumber` longtext DEFAULT NULL,
  `PhoneNumberConfirmed` tinyint(1) NOT NULL,
  `TwoFactorEnabled` tinyint(1) NOT NULL,
  `LockoutEnd` datetime(6) DEFAULT NULL,
  `LockoutEnabled` tinyint(1) NOT NULL,
  `AccessFailedCount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `aspnetusers`
--

INSERT INTO `aspnetusers` (`Id`, `Discriminator`, `FullName`, `Profession`, `DOB`, `NicNo`, `Address`, `UserName`, `NormalizedUserName`, `Email`, `NormalizedEmail`, `EmailConfirmed`, `PasswordHash`, `SecurityStamp`, `ConcurrencyStamp`, `PhoneNumber`, `PhoneNumberConfirmed`, `TwoFactorEnabled`, `LockoutEnd`, `LockoutEnabled`, `AccessFailedCount`) VALUES
('31e0ca35-1b21-4286-ab40-0d1d4aa2a254', 'ApplicationUser', 'Arjun', 'SE', '0001-01-11', '982411904v', '2413', 'Arjun.madhuwantha@gmail.com', 'ARJUN.MADHUWANTHA@GMAIL.COM', 'Arjun.madhuwantha@gmail.com', 'ARJUN.MADHUWANTHA@GMAIL.COM', 0, 'AQAAAAIAAYagAAAAEDyERhzQbSI46oc/G0DqR6tAgXfwZcIBPblAwZC12TvM89c0UmY5iwih8t8Di8xFgg==', 'E4OKI4NBLM74ASQXHUDLD54C4CTJIPTZ', '7d9e859e-1ccb-4d81-bbcd-9d34285526cb', '0768605430', 0, 0, NULL, 1, 0),
('49573782-f7d4-4510-8a27-07d3210ccf0d', 'ApplicationUser', 'Admin', 'Admin', '2024-03-23', '123456789V', 'Default Admin', 'defaultadmin@gmail.com', 'DEFAULTADMIN@GMAIL.COM', 'defaultadmin@gmail.com', 'DEFAULTADMIN@GMAIL.COM', 0, 'AQAAAAIAAYagAAAAECI9EYX2BYHCQOLD8D1ZLJZ9PUtbVd0/mIAc/UWhKCstWXenJfzdyIkCuF18Cm/BKA==', 'KVMZW6KK6CLDJOAB2UN5S5JF3CPF2BNM', '816de0b1-237c-437e-a6bb-6633de3f89d2', NULL, 0, 0, NULL, 1, 0),
('4a579bfd-1ae4-46dc-96fd-80281cb1e5aa', 'ApplicationUser', 'Wataya', 'QA', '1950-01-18', '2375464857V', 'ASDA', 'Wataya@gmail.com', 'WATAYA@GMAIL.COM', 'Wataya@gmail.com', 'WATAYA@GMAIL.COM', 0, 'AQAAAAIAAYagAAAAEP+ncK7gVoCvtLMXl6Fes8x90nR9VkLyjWaALjvytL2tU2SW6Tse8rPN/0b4LXvtlw==', '2BG2PHJ2ON77Q5IDJKR7ID4LDP43WFMB', '9cacfcea-af1b-4957-b255-9e0bd7f7f42f', NULL, 0, 0, NULL, 1, 0),
('90164791-04cc-489b-a764-f564e691a7bf', 'ApplicationUser', 'Madhuwantha', 'se', '2024-04-03', '9824119044v', '2413', 'madhuwantha@gmail.com', 'MADHUWANTHA@GMAIL.COM', 'madhuwantha@gmail.com', 'MADHUWANTHA@GMAIL.COM', 0, 'AQAAAAIAAYagAAAAEIqFPJH6/jX5ydHhupKTy9zFTRJwfryDSuj1TuyHUHis8AidOl39a4E/kIFJX1bHcw==', 'QCQQ22LBDEJLXOTROEJ6ABZSHE7THW2C', '96059ae8-c679-4a0f-8387-c20e8c6a7fd2', NULL, 0, 0, NULL, 1, 0),
('936a9cc4-8e3f-49d6-98e0-77c930ec213b', 'ApplicationUser', 'User', 'User', '2024-03-23', '123456789v', 'Default User', 'defaultuser@gmail', 'DEFAULTUSER@GMAIL', 'defaultuser@gmail', 'DEFAULTUSER@GMAIL', 0, 'AQAAAAIAAYagAAAAEPpjVNNFNrMLguS34iMIYfTTVFFbtoBAyZ1n47M7LZBOvKEdPMiX1FNhtFSG/q+DjA==', 'TS3762ZAWSPXN24B4VMRLM5TZBB3MZLJ', 'b0cc4387-d827-4fcb-9d89-7bd6987f3575', NULL, 0, 0, NULL, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `aspnetusertokens`
--

CREATE TABLE `aspnetusertokens` (
  `UserId` varchar(255) NOT NULL,
  `LoginProvider` varchar(128) NOT NULL,
  `Name` varchar(128) NOT NULL,
  `Value` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bankinginsuarancecompenstaions`
--

CREATE TABLE `bankinginsuarancecompenstaions` (
  `BankingInsuaranceCompenstaionID` int(11) NOT NULL,
  `Value` double NOT NULL,
  `Data` date NOT NULL,
  `Comment` longtext DEFAULT NULL,
  `PolicyNo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bankinginsuarancecompenstaions`
--

INSERT INTO `bankinginsuarancecompenstaions` (`BankingInsuaranceCompenstaionID`, `Value`, `Data`, `Comment`, `PolicyNo`) VALUES
(1, 400000, '2024-04-17', 'egfrgdg', 'Poilicy-Banking-BR001'),
(2, 23400, '2024-04-17', 'done', 'Poilicy-Banking-BR001');

-- --------------------------------------------------------

--
-- Table structure for table `bankinginsuarancedatas`
--

CREATE TABLE `bankinginsuarancedatas` (
  `DataId` int(11) NOT NULL,
  `Date` date NOT NULL,
  `Amount` double NOT NULL,
  `PolicyNo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bankinginsuarancedatas`
--

INSERT INTO `bankinginsuarancedatas` (`DataId`, `Date`, `Amount`, `PolicyNo`) VALUES
(7, '2024-03-24', 500, 'Poilicy-banking-BR001'),
(8, '0001-01-01', 0, 'Poilicy-banking-BR001'),
(9, '0001-01-01', 0, 'Poilicy-banking-BR001'),
(10, '2024-03-12', 445, 'Poilicy-banking-BR001'),
(11, '2024-04-04', 445, 'Poilicy-banking-BR001'),
(12, '2024-04-25', 44, 'Poilicy-banking-BR001'),
(13, '2024-04-24', 3000, 'Poilicy-banking-BR001');

-- --------------------------------------------------------

--
-- Table structure for table `bankinginsuarances`
--
-- Error reading structure for table bank_insurance_db_ns_v01.bankinginsuarances: #1932 - Table &#039;bank_insurance_db_ns_v01.bankinginsuarances&#039; doesn&#039;t exist in engine
-- Error reading data for table bank_insurance_db_ns_v01.bankinginsuarances: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `bank_insurance_db_ns_v01`.`bankinginsuarances`&#039; at line 1

-- --------------------------------------------------------

--
-- Table structure for table `branches`
--

CREATE TABLE `branches` (
  `BranchId` varchar(255) NOT NULL,
  `Branch_name` longtext DEFAULT NULL,
  `Address` longtext DEFAULT NULL,
  `TpNo` longtext DEFAULT NULL,
  `City` longtext DEFAULT NULL,
  `ZoneId` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `branches`
--

INSERT INTO `branches` (`BranchId`, `Branch_name`, `Address`, `TpNo`, `City`, `ZoneId`) VALUES
('B001', 'Branch 03', '2413/A', '0719956302', 'Colombo', NULL),
('B004', 'Kuliyapitiya', '2413/A', '071234563', 'Kuliyapitiya', NULL),
('BR001', 'Branch 01', 'BR001', '0000000000', 'BR001', 'Z001'),
('BR002', 'Branch 02', 'BR002', '0000000000', 'BR002', 'Z001'),
('BR003', 'නැනෝසොෆ්ට්', 'BR003', '0000000000', 'BR003', 'Z001');

-- --------------------------------------------------------

--
-- Table structure for table `buildiinginsurancecompenstaions`
--

CREATE TABLE `buildiinginsurancecompenstaions` (
  `BuildiingInsuranceCompenstaionID` int(11) NOT NULL,
  `Value` double NOT NULL,
  `Data` date NOT NULL,
  `Comment` longtext DEFAULT NULL,
  `PolicyNo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `buildiinginsurancecompenstaions`
--

INSERT INTO `buildiinginsurancecompenstaions` (`BuildiingInsuranceCompenstaionID`, `Value`, `Data`, `Comment`, `PolicyNo`) VALUES
(1, 40000, '2024-04-09', 'dome', 'Poilicy-Building-BR001');

-- --------------------------------------------------------

--
-- Table structure for table `buildinginsuarancedatas`
--

CREATE TABLE `buildinginsuarancedatas` (
  `DataId` int(11) NOT NULL,
  `Date` date NOT NULL,
  `Amount` double NOT NULL,
  `PolicyNo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `buildinginsuarancedatas`
--

INSERT INTO `buildinginsuarancedatas` (`DataId`, `Date`, `Amount`, `PolicyNo`) VALUES
(7, '2024-03-24', 0, 'Poilicy-building-BR001'),
(8, '0001-01-01', 0, 'Poilicy-building-BR001'),
(9, '0001-01-01', 0, 'Poilicy-building-BR001'),
(10, '2024-03-12', 0, 'Poilicy-building-BR001'),
(11, '2024-04-04', 0, 'Poilicy-building-BR001'),
(12, '2024-04-25', 0, 'Poilicy-building-BR001'),
(13, '2024-04-24', 0, 'Poilicy-building-BR001');

-- --------------------------------------------------------

--
-- Table structure for table `buildinginsuarances`
--

CREATE TABLE `buildinginsuarances` (
  `PolicyNo` varchar(255) NOT NULL,
  `InsuranceId` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `buildinginsuarances`
--

INSERT INTO `buildinginsuarances` (`PolicyNo`, `InsuranceId`) VALUES
('Poilicy-building-BR001', 'insuarance-003_BR001');

-- --------------------------------------------------------

--
-- Table structure for table `divisaranaabhiperanas`
--

CREATE TABLE `divisaranaabhiperanas` (
  `DataId` int(11) NOT NULL,
  `Month` longtext DEFAULT NULL,
  `Amount` double DEFAULT NULL,
  `Comment` longtext DEFAULT NULL,
  `BranchId` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `divisaranaabhiperanas`
--

INSERT INTO `divisaranaabhiperanas` (`DataId`, `Month`, `Amount`, `Comment`, `BranchId`) VALUES
(1, 'February', 2323, '23423', 'BR001'),
(2, 'August', 3000000, 'paid', 'BR001');

-- --------------------------------------------------------

--
-- Table structure for table `divisaranacircledates`
--

CREATE TABLE `divisaranacircledates` (
  `CircleId` int(11) NOT NULL,
  `BranchId` longtext DEFAULT NULL,
  `Fullname` longtext DEFAULT NULL,
  `TimePeriod` int(11) NOT NULL,
  `AddmissionFee` double NOT NULL,
  `TotalAmount` double NOT NULL,
  `DueAmount` double DEFAULT NULL,
  `StartDate` date NOT NULL,
  `NextExecuteDate` date NOT NULL,
  `RecoveryAmount` double NOT NULL,
  `CustomerPolicyNo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `divisaranacircledates`
--

INSERT INTO `divisaranacircledates` (`CircleId`, `BranchId`, `Fullname`, `TimePeriod`, `AddmissionFee`, `TotalAmount`, `DueAmount`, `StartDate`, `NextExecuteDate`, `RecoveryAmount`, `CustomerPolicyNo`) VALUES
(11, 'B001', 'Atrjun Madhuwantha', 1, 5000, 600, 550, '2024-05-02', '2024-07-02', 50, 'Divi-9812346589V');

-- --------------------------------------------------------

--
-- Table structure for table `divisaranacompensations`
--

CREATE TABLE `divisaranacompensations` (
  `CompensationId` int(11) NOT NULL,
  `MemberName` longtext DEFAULT NULL,
  `BranchId` longtext DEFAULT NULL,
  `DivisaranaNo` longtext DEFAULT NULL,
  `DeathPersonName` longtext DEFAULT NULL,
  `HospitalizedPerson` longtext DEFAULT NULL,
  `DeathDate` date NOT NULL,
  `DischargeDate` date NOT NULL,
  `Realtion` longtext DEFAULT NULL,
  `Hospital` longtext DEFAULT NULL,
  `Diseases` longtext DEFAULT NULL,
  `Surgery` longtext DEFAULT NULL,
  `CompensationValue` double DEFAULT NULL,
  `Reason` longtext DEFAULT NULL,
  `CustomerPolicyNo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `divisaranacompensations`
--

INSERT INTO `divisaranacompensations` (`CompensationId`, `MemberName`, `BranchId`, `DivisaranaNo`, `DeathPersonName`, `HospitalizedPerson`, `DeathDate`, `DischargeDate`, `Realtion`, `Hospital`, `Diseases`, `Surgery`, `CompensationValue`, `Reason`, `CustomerPolicyNo`) VALUES
(4, 'Atrjun Madhuwantha', 'B001', '122', ' maduka', NULL, '2024-04-10', '0001-01-01', 'Son', NULL, NULL, NULL, 50000, 'death', 'Divi-9812346589V');

-- --------------------------------------------------------

--
-- Table structure for table `divisaranadatas`
--

CREATE TABLE `divisaranadatas` (
  `CustomerPolicyNo` varchar(255) NOT NULL,
  `Fullname` longtext DEFAULT NULL,
  `Address` longtext DEFAULT NULL,
  `ID` longtext DEFAULT NULL,
  `BankMemberNo` longtext DEFAULT NULL,
  `DOB` date NOT NULL,
  `Job` longtext DEFAULT NULL,
  `Succssor` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `divisaranadatas`
--

INSERT INTO `divisaranadatas` (`CustomerPolicyNo`, `Fullname`, `Address`, `ID`, `BankMemberNo`, `DOB`, `Job`, `Succssor`) VALUES
('Divi-9812346589V', 'Atrjun Madhuwantha', '2413/A', '9812346589V', '666', '2014-06-10', 'stu', 'ajith');

-- --------------------------------------------------------

--
-- Table structure for table `divisaranaparithoshithas`
--

CREATE TABLE `divisaranaparithoshithas` (
  `DataId` int(11) NOT NULL,
  `Name` longtext DEFAULT NULL,
  `MemberNo` longtext DEFAULT NULL,
  `Amount` double DEFAULT NULL,
  `Comment` longtext DEFAULT NULL,
  `BranchId` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `divisaranaparithoshithas`
--

INSERT INTO `divisaranaparithoshithas` (`DataId`, `Name`, `MemberNo`, `Amount`, `Comment`, `BranchId`) VALUES
(1, 'aaa', '111', 123, 'ggg', 'BR002'),
(2, 'aaa', '111', 3423, '3423423', 'BR001'),
(3, 'W', 'Wtaya', 20000, 'PAID', 'B001'),
(4, 'Wataya', '111', 234000, 'Paid', 'BR001');

-- --------------------------------------------------------

--
-- Table structure for table `divisaranapayments`
--

CREATE TABLE `divisaranapayments` (
  `PaymentId` int(11) NOT NULL,
  `BranchId` longtext DEFAULT NULL,
  `Fullname` longtext DEFAULT NULL,
  `PaymentDate` date NOT NULL,
  `SystemDate` date NOT NULL,
  `PaymentValue` double DEFAULT NULL,
  `RunningBalance` double DEFAULT NULL,
  `CustomerPolicyNo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `divisaranapayments`
--

INSERT INTO `divisaranapayments` (`PaymentId`, `BranchId`, `Fullname`, `PaymentDate`, `SystemDate`, `PaymentValue`, `RunningBalance`, `CustomerPolicyNo`) VALUES
(83, 'B001', 'Atrjun Madhuwantha', '2024-06-02', '2024-04-15', 50, NULL, 'Divi-9812346589V');

-- --------------------------------------------------------

--
-- Table structure for table `divisaranasuccssors`
--

CREATE TABLE `divisaranasuccssors` (
  `Id` int(11) NOT NULL,
  `SuccsorName` longtext DEFAULT NULL,
  `SuccssorDob` date NOT NULL,
  `Age` int(11) NOT NULL,
  `Relationship` longtext DEFAULT NULL,
  `CustomerPolicyNo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `divisaranasuccssors`
--

INSERT INTO `divisaranasuccssors` (`Id`, `SuccsorName`, `SuccssorDob`, `Age`, `Relationship`, `CustomerPolicyNo`) VALUES
(8, 'wataya', '2024-04-17', 26, 'son', 'Divi-9812346589V');

-- --------------------------------------------------------

--
-- Table structure for table `divisaranatbls`
--

CREATE TABLE `divisaranatbls` (
  `Id` int(11) NOT NULL,
  `PolicyNo` longtext DEFAULT NULL,
  `InsuranceId` varchar(255) DEFAULT NULL,
  `CustomerPolicyNo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `divisaranatbls`
--

INSERT INTO `divisaranatbls` (`Id`, `PolicyNo`, `InsuranceId`, `CustomerPolicyNo`) VALUES
(11, 'Poilicy-divi-B001', 'insuarance-008_B001', 'Divi-9812346589V');

-- --------------------------------------------------------

--
-- Table structure for table `healthinsuarancedatas`
--

CREATE TABLE `healthinsuarancedatas` (
  `DataId` int(11) NOT NULL,
  `Date` date NOT NULL,
  `Amount` double NOT NULL,
  `PolicyNo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `healthinsuarancedatas`
--

INSERT INTO `healthinsuarancedatas` (`DataId`, `Date`, `Amount`, `PolicyNo`) VALUES
(7, '2024-03-24', 300, 'Poilicy-health-BR001'),
(8, '0001-01-01', 0, 'Poilicy-health-BR001'),
(9, '0001-01-01', 0, 'Poilicy-health-BR001'),
(10, '2024-03-12', 444, 'Poilicy-health-BR001'),
(11, '2024-04-04', 256, 'Poilicy-health-BR001'),
(12, '2024-04-25', 44, 'Poilicy-health-BR001'),
(13, '2024-04-24', 2000, 'Poilicy-health-BR001');

-- --------------------------------------------------------

--
-- Table structure for table `healthinsuarances`
--

CREATE TABLE `healthinsuarances` (
  `PolicyNo` varchar(255) NOT NULL,
  `InsuranceId` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `healthinsuarances`
--

INSERT INTO `healthinsuarances` (`PolicyNo`, `InsuranceId`) VALUES
('Poilicy-health-BR001', 'insuarance-004_BR001');

-- --------------------------------------------------------

--
-- Table structure for table `healthinsurancecompenstaions`
--

CREATE TABLE `healthinsurancecompenstaions` (
  `HealthInsuranceCompenstaionID` int(11) NOT NULL,
  `Value` double NOT NULL,
  `Data` date NOT NULL,
  `Comment` longtext DEFAULT NULL,
  `PolicyNo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `insuarances`
--

CREATE TABLE `insuarances` (
  `InsuranceId` varchar(255) NOT NULL,
  `StartDate` longtext DEFAULT NULL,
  `PolicyNo` longtext DEFAULT NULL,
  `InsuranceProductID` varchar(255) DEFAULT NULL,
  `BranchId` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `insuarances`
--

INSERT INTO `insuarances` (`InsuranceId`, `StartDate`, `PolicyNo`, `InsuranceProductID`, `BranchId`) VALUES
('insuarance-001_BR001', '2024-01-01', 'Poilicy-saving-BR001', 'Product-001', 'BR001'),
('insuarance-002_BR001', '2024-01-01', 'Poilicy-banking-BR001', 'Product-002', 'BR001'),
('insuarance-003_BR001', '2024-01-01', 'Poilicy-building-BR001', 'Product-003', 'BR001'),
('insuarance-004_BR001', '2024-01-01', 'Poilicy-health-BR001', 'Product-004', 'BR001'),
('insuarance-005_', '2024-01-01', 'Poilicy-Treasuary-', 'Product-005', NULL),
('insuarance-005_BR001', '2024-01-01', 'Poilicy-Treasuary-BR001', 'Product-005', 'BR001'),
('insuarance-006_BR002', '2024-01-01', 'Poilicy-loan-BR002', 'Product-006', 'BR002'),
('insuarance-007_BR001', '2024-01-01', 'Poilicy-house-BR001', 'Product-006', 'BR001'),
('insuarance-008_B001', '2024-01-01', 'Poilicy-divi-B001', 'Product-006', 'B001');

-- --------------------------------------------------------

--
-- Table structure for table `insuranceproducts`
--

CREATE TABLE `insuranceproducts` (
  `InsuranceProductID` varchar(255) NOT NULL,
  `InsuranceProductName` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `insuranceproducts`
--

INSERT INTO `insuranceproducts` (`InsuranceProductID`, `InsuranceProductName`) VALUES
('Product-001', 'Product-One'),
('Product-002', 'Product-two'),
('Product-003', 'Product-three'),
('Product-004', 'Product-four'),
('Product-005', 'Product-five'),
('Product-006', 'Product-six'),
('Product-007', 'Product-Seven');

-- --------------------------------------------------------

--
-- Table structure for table `loancompenstaions`
--

CREATE TABLE `loancompenstaions` (
  `LoanCompenstaionID` int(11) NOT NULL,
  `FullName` longtext DEFAULT NULL,
  `BranchId` longtext DEFAULT NULL,
  `Value` double NOT NULL,
  `CompenstaionValue` double NOT NULL,
  `Requirement` longtext DEFAULT NULL,
  `Comment` longtext DEFAULT NULL,
  `Date` date NOT NULL,
  `CustomerPolicyNo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `loancustomers`
--

CREATE TABLE `loancustomers` (
  `CustomerPolicyNo` varchar(255) NOT NULL,
  `CustomerName` longtext DEFAULT NULL,
  `ID` longtext DEFAULT NULL,
  `Address` longtext DEFAULT NULL,
  `ProjectName` longtext DEFAULT NULL,
  `LoanIssueDate` date NOT NULL,
  `LoanEndDate` date NOT NULL,
  `TeamNo` longtext DEFAULT NULL,
  `LoanValue` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `loancustomers`
--

INSERT INTO `loancustomers` (`CustomerPolicyNo`, `CustomerName`, `ID`, `Address`, `ProjectName`, `LoanIssueDate`, `LoanEndDate`, `TeamNo`, `LoanValue`) VALUES
('House-982411904v', 'Arjun', '982411904v', '2413/A', 'Home Loan', '2024-04-01', '2024-04-30', '55', 50000),
('Loan-9812346589V', 'Sajitha', '9812346589V', '2413', 'Self-Employment', '2024-04-01', '2024-04-30', NULL, 40000);

-- --------------------------------------------------------

--
-- Table structure for table `loanpayments`
--

CREATE TABLE `loanpayments` (
  `PaymentId` int(11) NOT NULL,
  `PaymentDate` date NOT NULL,
  `Paymentvalue` double NOT NULL,
  `CustomerPolicyNo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `loanpayments`
--

INSERT INTO `loanpayments` (`PaymentId`, `PaymentDate`, `Paymentvalue`, `CustomerPolicyNo`) VALUES
(22, '2024-04-29', 500, 'House-982411904v'),
(23, '2024-04-24', 400, 'Loan-9812346589V');

-- --------------------------------------------------------

--
-- Table structure for table `loantbls`
--

CREATE TABLE `loantbls` (
  `Id` int(11) NOT NULL,
  `PolicyNo` longtext DEFAULT NULL,
  `InsuranceId` varchar(255) DEFAULT NULL,
  `CustomerPolicyNo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `loantbls`
--

INSERT INTO `loantbls` (`Id`, `PolicyNo`, `InsuranceId`, `CustomerPolicyNo`) VALUES
(26, 'Poilicy-house-BR001', 'insuarance-007_BR001', 'House-982411904v'),
(27, 'Poilicy-loan-BR002', 'insuarance-006_BR002', 'Loan-9812346589V');

-- --------------------------------------------------------

--
-- Table structure for table `savingreliefcompensations`
--

CREATE TABLE `savingreliefcompensations` (
  `MemberId` int(11) NOT NULL,
  `MemberName` longtext DEFAULT NULL,
  `MemberAddress` longtext DEFAULT NULL,
  `DeathpersonName` longtext DEFAULT NULL,
  `Reason` longtext DEFAULT NULL,
  `Realtion` longtext DEFAULT NULL,
  `ReasonDate` date NOT NULL,
  `CompensationValue` double NOT NULL,
  `RemainingBalanece` double NOT NULL,
  `Schoolname` longtext DEFAULT NULL,
  `Studentname` longtext DEFAULT NULL,
  `Universityname` longtext DEFAULT NULL,
  `PolicyNo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `savingreliefcompensations`
--

INSERT INTO `savingreliefcompensations` (`MemberId`, `MemberName`, `MemberAddress`, `DeathpersonName`, `Reason`, `Realtion`, `ReasonDate`, `CompensationValue`, `RemainingBalanece`, `Schoolname`, `Studentname`, `Universityname`, `PolicyNo`) VALUES
(1, 'Wataya', '2413', 'Sema', 'death', 'Son', '2024-04-24', 3900000, 2000, NULL, NULL, NULL, 'Poilicy-saving-BR001');

-- --------------------------------------------------------

--
-- Table structure for table `savingreliefdatas`
--

CREATE TABLE `savingreliefdatas` (
  `DataId` int(11) NOT NULL,
  `Date` date NOT NULL,
  `Amount` double NOT NULL,
  `PolicyNo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `savingreliefdatas`
--

INSERT INTO `savingreliefdatas` (`DataId`, `Date`, `Amount`, `PolicyNo`) VALUES
(7, '2024-03-24', 700, 'Poilicy-saving-BR001'),
(8, '0001-01-01', 0, 'Poilicy-saving-BR001'),
(9, '0001-01-01', 0, 'Poilicy-saving-BR001'),
(11, '2024-03-12', 444, 'Poilicy-saving-BR001'),
(13, '2024-04-04', 658, 'Poilicy-saving-BR001'),
(14, '2024-04-25', 44, 'Poilicy-saving-BR001'),
(15, '2024-04-24', 0, 'Poilicy-saving-BR001');

-- --------------------------------------------------------

--
-- Table structure for table `savingreliefparithoshithas`
--

CREATE TABLE `savingreliefparithoshithas` (
  `DataId` int(11) NOT NULL,
  `Name` longtext DEFAULT NULL,
  `MemberNo` longtext DEFAULT NULL,
  `Amount` double DEFAULT NULL,
  `Comment` longtext DEFAULT NULL,
  `BranchId` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `savingreliefparithoshithas`
--

INSERT INTO `savingreliefparithoshithas` (`DataId`, `Name`, `MemberNo`, `Amount`, `Comment`, `BranchId`) VALUES
(1, 'arjun', '112', 400, 'paid', 'BR001'),
(2, 'arjunM', '1123', 345666, 'paid', 'BR001');

-- --------------------------------------------------------

--
-- Table structure for table `savingreliefs`
--

CREATE TABLE `savingreliefs` (
  `PolicyNo` varchar(255) NOT NULL,
  `InsuranceId` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `savingreliefs`
--

INSERT INTO `savingreliefs` (`PolicyNo`, `InsuranceId`) VALUES
('Poilicy-saving-BR001', 'insuarance-001_BR001');

-- --------------------------------------------------------

--
-- Table structure for table `treasuaries`
--

CREATE TABLE `treasuaries` (
  `PolicyNo` varchar(255) NOT NULL,
  `InsuranceId` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `treasuaries`
--

INSERT INTO `treasuaries` (`PolicyNo`, `InsuranceId`) VALUES
('Poilicy-Treasuary-', 'insuarance-005_'),
('Poilicy-Treasuary-BR001', 'insuarance-005_BR001');

-- --------------------------------------------------------

--
-- Table structure for table `treasuarydatas`
--

CREATE TABLE `treasuarydatas` (
  `DataId` int(11) NOT NULL,
  `Date` date NOT NULL,
  `Amount` double NOT NULL,
  `PolicyNo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `treasuarydatas`
--

INSERT INTO `treasuarydatas` (`DataId`, `Date`, `Amount`, `PolicyNo`) VALUES
(7, '2024-03-24', 500, 'Poilicy-Treasuary-BR001'),
(8, '0001-01-01', 0, 'Poilicy-Treasuary-BR001'),
(9, '0001-01-01', 0, 'Poilicy-Treasuary-BR001'),
(10, '2024-03-12', 445, 'Poilicy-Treasuary-BR001'),
(11, '2024-04-04', 445, 'Poilicy-Treasuary-BR001'),
(12, '2024-04-25', 44, 'Poilicy-Treasuary-BR001'),
(13, '2024-04-24', 3000, 'Poilicy-Treasuary-BR001');

-- --------------------------------------------------------

--
-- Table structure for table `treasuaryescollections`
--

CREATE TABLE `treasuaryescollections` (
  `TreasuaryeId` int(11) NOT NULL,
  `TreasuaryName` longtext DEFAULT NULL,
  `Date` date NOT NULL,
  `PolicyNo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `treasuaryescollections`
--

INSERT INTO `treasuaryescollections` (`TreasuaryeId`, `TreasuaryName`, `Date`, `PolicyNo`) VALUES
(2, NULL, '0001-01-01', 'Poilicy-Treasuary-'),
(3, NULL, '0001-01-01', 'Poilicy-Treasuary-'),
(4, 'Arjun', '2024-03-08', 'Poilicy-Treasuary-'),
(5, 'AAA', '2024-04-10', 'Poilicy-Treasuary-'),
(6, 'B2', '2024-04-11', 'Poilicy-Treasuary-'),
(7, 'B1', '2024-04-05', 'Poilicy-Treasuary-'),
(8, 'abcd', '2024-04-10', 'Poilicy-Treasuary-'),
(9, 'Madhuwantha', '2024-04-04', 'Poilicy-Treasuary-BR001'),
(10, 'Sajitha', '2024-04-17', 'Poilicy-Treasuary-'),
(11, 'aaaaaaaaaaaaa', '2024-04-17', 'Poilicy-Treasuary-'),
(12, 'A123', '2024-04-10', 'Poilicy-Treasuary-'),
(13, 'Arjun2', '2024-04-17', 'Poilicy-Treasuary-'),
(14, 'test', '2024-04-26', 'Poilicy-Treasuary-'),
(15, 'Arjunmadhu', '2024-04-11', 'Poilicy-Treasuary-'),
(16, 'name1', '2024-04-03', 'Poilicy-Treasuary-BR001'),
(17, 'Madhuwantha', '2024-04-18', 'Poilicy-Treasuary-BR001'),
(18, 'Madhuwantha', '2024-04-17', 'Poilicy-Treasuary-BR001');

-- --------------------------------------------------------

--
-- Table structure for table `treasuraryinsurancecompenstaions`
--

CREATE TABLE `treasuraryinsurancecompenstaions` (
  `TreasuraryInsuranceCompenstaionID` int(11) NOT NULL,
  `Value` double NOT NULL,
  `Data` date NOT NULL,
  `Comment` longtext DEFAULT NULL,
  `PolicyNo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `zones`
--

CREATE TABLE `zones` (
  `ZoneId` varchar(255) NOT NULL,
  `Zone_name` longtext DEFAULT NULL,
  `Status` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `zones`
--

INSERT INTO `zones` (`ZoneId`, `Zone_name`, `Status`) VALUES
('Z001', 'Hambantota', 'Active'),
('Z002', 'Colombo', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `__efmigrationshistory`
--

CREATE TABLE `__efmigrationshistory` (
  `MigrationId` varchar(150) NOT NULL,
  `ProductVersion` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `__efmigrationshistory`
--

INSERT INTO `__efmigrationshistory` (`MigrationId`, `ProductVersion`) VALUES
('20240315181606_initial', '8.0.3'),
('20240315204121_initialAll', '8.0.3'),
('20240322094942_updateuserfull', '8.0.3');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `aspnetroleclaims`
--
ALTER TABLE `aspnetroleclaims`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IX_AspNetRoleClaims_RoleId` (`RoleId`);

--
-- Indexes for table `aspnetroles`
--
ALTER TABLE `aspnetroles`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `RoleNameIndex` (`NormalizedName`);

--
-- Indexes for table `aspnetuserclaims`
--
ALTER TABLE `aspnetuserclaims`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IX_AspNetUserClaims_UserId` (`UserId`);

--
-- Indexes for table `aspnetuserlogins`
--
ALTER TABLE `aspnetuserlogins`
  ADD PRIMARY KEY (`LoginProvider`,`ProviderKey`),
  ADD KEY `IX_AspNetUserLogins_UserId` (`UserId`);

--
-- Indexes for table `aspnetuserroles`
--
ALTER TABLE `aspnetuserroles`
  ADD PRIMARY KEY (`UserId`,`RoleId`),
  ADD KEY `IX_AspNetUserRoles_RoleId` (`RoleId`);

--
-- Indexes for table `aspnetusers`
--
ALTER TABLE `aspnetusers`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `UserNameIndex` (`NormalizedUserName`),
  ADD KEY `EmailIndex` (`NormalizedEmail`);

--
-- Indexes for table `aspnetusertokens`
--
ALTER TABLE `aspnetusertokens`
  ADD PRIMARY KEY (`UserId`,`LoginProvider`,`Name`);

--
-- Indexes for table `bankinginsuarancecompenstaions`
--
ALTER TABLE `bankinginsuarancecompenstaions`
  ADD PRIMARY KEY (`BankingInsuaranceCompenstaionID`),
  ADD KEY `IX_BankingInsuaranceCompenstaions_PolicyNo` (`PolicyNo`);

--
-- Indexes for table `bankinginsuarancedatas`
--
ALTER TABLE `bankinginsuarancedatas`
  ADD PRIMARY KEY (`DataId`),
  ADD KEY `IX_BankingInsuaranceDatas_PolicyNo` (`PolicyNo`);

--
-- Indexes for table `branches`
--
ALTER TABLE `branches`
  ADD PRIMARY KEY (`BranchId`),
  ADD KEY `IX_Branches_ZoneId` (`ZoneId`);

--
-- Indexes for table `buildiinginsurancecompenstaions`
--
ALTER TABLE `buildiinginsurancecompenstaions`
  ADD PRIMARY KEY (`BuildiingInsuranceCompenstaionID`),
  ADD KEY `IX_BuildiingInsuranceCompenstaions_PolicyNo` (`PolicyNo`);

--
-- Indexes for table `buildinginsuarancedatas`
--
ALTER TABLE `buildinginsuarancedatas`
  ADD PRIMARY KEY (`DataId`),
  ADD KEY `IX_BuildingInsuaranceDatas_PolicyNo` (`PolicyNo`);

--
-- Indexes for table `buildinginsuarances`
--
ALTER TABLE `buildinginsuarances`
  ADD PRIMARY KEY (`PolicyNo`),
  ADD KEY `IX_BuildingInsuarances_InsuranceId` (`InsuranceId`);

--
-- Indexes for table `divisaranaabhiperanas`
--
ALTER TABLE `divisaranaabhiperanas`
  ADD PRIMARY KEY (`DataId`),
  ADD KEY `IX_DivisaranaAbhiperanas_BranchId` (`BranchId`);

--
-- Indexes for table `divisaranacircledates`
--
ALTER TABLE `divisaranacircledates`
  ADD PRIMARY KEY (`CircleId`),
  ADD KEY `IX_DivisaranaCircleDates_CustomerPolicyNo` (`CustomerPolicyNo`);

--
-- Indexes for table `divisaranacompensations`
--
ALTER TABLE `divisaranacompensations`
  ADD PRIMARY KEY (`CompensationId`),
  ADD KEY `IX_DivisaranaCompensations_CustomerPolicyNo` (`CustomerPolicyNo`);

--
-- Indexes for table `divisaranadatas`
--
ALTER TABLE `divisaranadatas`
  ADD PRIMARY KEY (`CustomerPolicyNo`);

--
-- Indexes for table `divisaranaparithoshithas`
--
ALTER TABLE `divisaranaparithoshithas`
  ADD PRIMARY KEY (`DataId`),
  ADD KEY `IX_DivisaranaParithoshithas_BranchId` (`BranchId`);

--
-- Indexes for table `divisaranapayments`
--
ALTER TABLE `divisaranapayments`
  ADD PRIMARY KEY (`PaymentId`),
  ADD KEY `IX_DivisaranaPayments_CustomerPolicyNo` (`CustomerPolicyNo`);

--
-- Indexes for table `divisaranasuccssors`
--
ALTER TABLE `divisaranasuccssors`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IX_DivisaranaSuccssors_CustomerPolicyNo` (`CustomerPolicyNo`);

--
-- Indexes for table `divisaranatbls`
--
ALTER TABLE `divisaranatbls`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IX_DivisaranaTbls_CustomerPolicyNo` (`CustomerPolicyNo`),
  ADD KEY `IX_DivisaranaTbls_InsuranceId` (`InsuranceId`);

--
-- Indexes for table `healthinsuarancedatas`
--
ALTER TABLE `healthinsuarancedatas`
  ADD PRIMARY KEY (`DataId`),
  ADD KEY `IX_HealthInsuaranceDatas_PolicyNo` (`PolicyNo`);

--
-- Indexes for table `healthinsuarances`
--
ALTER TABLE `healthinsuarances`
  ADD PRIMARY KEY (`PolicyNo`),
  ADD KEY `IX_HealthInsuarances_InsuranceId` (`InsuranceId`);

--
-- Indexes for table `healthinsurancecompenstaions`
--
ALTER TABLE `healthinsurancecompenstaions`
  ADD PRIMARY KEY (`HealthInsuranceCompenstaionID`),
  ADD KEY `IX_HealthInsuranceCompenstaions_PolicyNo` (`PolicyNo`);

--
-- Indexes for table `insuarances`
--
ALTER TABLE `insuarances`
  ADD PRIMARY KEY (`InsuranceId`),
  ADD KEY `IX_Insuarances_BranchId` (`BranchId`),
  ADD KEY `IX_Insuarances_InsuranceProductID` (`InsuranceProductID`);

--
-- Indexes for table `insuranceproducts`
--
ALTER TABLE `insuranceproducts`
  ADD PRIMARY KEY (`InsuranceProductID`);

--
-- Indexes for table `loancompenstaions`
--
ALTER TABLE `loancompenstaions`
  ADD PRIMARY KEY (`LoanCompenstaionID`),
  ADD KEY `IX_LoanCompenstaions_CustomerPolicyNo` (`CustomerPolicyNo`);

--
-- Indexes for table `loancustomers`
--
ALTER TABLE `loancustomers`
  ADD PRIMARY KEY (`CustomerPolicyNo`);

--
-- Indexes for table `loanpayments`
--
ALTER TABLE `loanpayments`
  ADD PRIMARY KEY (`PaymentId`),
  ADD KEY `IX_LoanPayments_CustomerPolicyNo` (`CustomerPolicyNo`);

--
-- Indexes for table `loantbls`
--
ALTER TABLE `loantbls`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IX_LoanTbls_CustomerPolicyNo` (`CustomerPolicyNo`),
  ADD KEY `IX_LoanTbls_InsuranceId` (`InsuranceId`);

--
-- Indexes for table `savingreliefcompensations`
--
ALTER TABLE `savingreliefcompensations`
  ADD PRIMARY KEY (`MemberId`),
  ADD KEY `IX_SavingReliefCompensations_PolicyNo` (`PolicyNo`);

--
-- Indexes for table `savingreliefdatas`
--
ALTER TABLE `savingreliefdatas`
  ADD PRIMARY KEY (`DataId`),
  ADD KEY `IX_SavingReliefDatas_PolicyNo` (`PolicyNo`);

--
-- Indexes for table `savingreliefparithoshithas`
--
ALTER TABLE `savingreliefparithoshithas`
  ADD PRIMARY KEY (`DataId`),
  ADD KEY `IX_SavingReliefParithoshithas_BranchId` (`BranchId`);

--
-- Indexes for table `savingreliefs`
--
ALTER TABLE `savingreliefs`
  ADD PRIMARY KEY (`PolicyNo`),
  ADD UNIQUE KEY `IX_SavingReliefs_InsuranceId` (`InsuranceId`);

--
-- Indexes for table `treasuaries`
--
ALTER TABLE `treasuaries`
  ADD PRIMARY KEY (`PolicyNo`),
  ADD KEY `IX_Treasuaries_InsuranceId` (`InsuranceId`);

--
-- Indexes for table `treasuarydatas`
--
ALTER TABLE `treasuarydatas`
  ADD PRIMARY KEY (`DataId`),
  ADD KEY `IX_TreasuaryDatas_PolicyNo` (`PolicyNo`);

--
-- Indexes for table `treasuaryescollections`
--
ALTER TABLE `treasuaryescollections`
  ADD PRIMARY KEY (`TreasuaryeId`),
  ADD KEY `IX_TreasuaryesCollections_PolicyNo` (`PolicyNo`);

--
-- Indexes for table `treasuraryinsurancecompenstaions`
--
ALTER TABLE `treasuraryinsurancecompenstaions`
  ADD PRIMARY KEY (`TreasuraryInsuranceCompenstaionID`),
  ADD KEY `IX_TreasuraryInsuranceCompenstaions_PolicyNo` (`PolicyNo`);

--
-- Indexes for table `zones`
--
ALTER TABLE `zones`
  ADD PRIMARY KEY (`ZoneId`);

--
-- Indexes for table `__efmigrationshistory`
--
ALTER TABLE `__efmigrationshistory`
  ADD PRIMARY KEY (`MigrationId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `aspnetroleclaims`
--
ALTER TABLE `aspnetroleclaims`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `aspnetuserclaims`
--
ALTER TABLE `aspnetuserclaims`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bankinginsuarancecompenstaions`
--
ALTER TABLE `bankinginsuarancecompenstaions`
  MODIFY `BankingInsuaranceCompenstaionID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `bankinginsuarancedatas`
--
ALTER TABLE `bankinginsuarancedatas`
  MODIFY `DataId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `buildiinginsurancecompenstaions`
--
ALTER TABLE `buildiinginsurancecompenstaions`
  MODIFY `BuildiingInsuranceCompenstaionID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `buildinginsuarancedatas`
--
ALTER TABLE `buildinginsuarancedatas`
  MODIFY `DataId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `divisaranaabhiperanas`
--
ALTER TABLE `divisaranaabhiperanas`
  MODIFY `DataId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `divisaranacircledates`
--
ALTER TABLE `divisaranacircledates`
  MODIFY `CircleId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `divisaranacompensations`
--
ALTER TABLE `divisaranacompensations`
  MODIFY `CompensationId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `divisaranaparithoshithas`
--
ALTER TABLE `divisaranaparithoshithas`
  MODIFY `DataId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `divisaranapayments`
--
ALTER TABLE `divisaranapayments`
  MODIFY `PaymentId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- AUTO_INCREMENT for table `divisaranasuccssors`
--
ALTER TABLE `divisaranasuccssors`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `divisaranatbls`
--
ALTER TABLE `divisaranatbls`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `healthinsuarancedatas`
--
ALTER TABLE `healthinsuarancedatas`
  MODIFY `DataId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `healthinsurancecompenstaions`
--
ALTER TABLE `healthinsurancecompenstaions`
  MODIFY `HealthInsuranceCompenstaionID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `loancompenstaions`
--
ALTER TABLE `loancompenstaions`
  MODIFY `LoanCompenstaionID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `loanpayments`
--
ALTER TABLE `loanpayments`
  MODIFY `PaymentId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `loantbls`
--
ALTER TABLE `loantbls`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `savingreliefcompensations`
--
ALTER TABLE `savingreliefcompensations`
  MODIFY `MemberId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `savingreliefdatas`
--
ALTER TABLE `savingreliefdatas`
  MODIFY `DataId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `savingreliefparithoshithas`
--
ALTER TABLE `savingreliefparithoshithas`
  MODIFY `DataId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `treasuarydatas`
--
ALTER TABLE `treasuarydatas`
  MODIFY `DataId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `treasuaryescollections`
--
ALTER TABLE `treasuaryescollections`
  MODIFY `TreasuaryeId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `treasuraryinsurancecompenstaions`
--
ALTER TABLE `treasuraryinsurancecompenstaions`
  MODIFY `TreasuraryInsuranceCompenstaionID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `aspnetroleclaims`
--
ALTER TABLE `aspnetroleclaims`
  ADD CONSTRAINT `FK_AspNetRoleClaims_AspNetRoles_RoleId` FOREIGN KEY (`RoleId`) REFERENCES `aspnetroles` (`Id`) ON DELETE CASCADE;

--
-- Constraints for table `aspnetuserclaims`
--
ALTER TABLE `aspnetuserclaims`
  ADD CONSTRAINT `FK_AspNetUserClaims_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `aspnetusers` (`Id`) ON DELETE CASCADE;

--
-- Constraints for table `aspnetuserlogins`
--
ALTER TABLE `aspnetuserlogins`
  ADD CONSTRAINT `FK_AspNetUserLogins_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `aspnetusers` (`Id`) ON DELETE CASCADE;

--
-- Constraints for table `aspnetuserroles`
--
ALTER TABLE `aspnetuserroles`
  ADD CONSTRAINT `FK_AspNetUserRoles_AspNetRoles_RoleId` FOREIGN KEY (`RoleId`) REFERENCES `aspnetroles` (`Id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_AspNetUserRoles_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `aspnetusers` (`Id`) ON DELETE CASCADE;

--
-- Constraints for table `aspnetusertokens`
--
ALTER TABLE `aspnetusertokens`
  ADD CONSTRAINT `FK_AspNetUserTokens_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `aspnetusers` (`Id`) ON DELETE CASCADE;

--
-- Constraints for table `bankinginsuarancecompenstaions`
--
ALTER TABLE `bankinginsuarancecompenstaions`
  ADD CONSTRAINT `FK_BankingInsuaranceCompenstaions_BankingInsuarances_PolicyNo` FOREIGN KEY (`PolicyNo`) REFERENCES `bankinginsuarances` (`PolicyNo`);

--
-- Constraints for table `bankinginsuarancedatas`
--
ALTER TABLE `bankinginsuarancedatas`
  ADD CONSTRAINT `FK_BankingInsuaranceDatas_BankingInsuarances_PolicyNo` FOREIGN KEY (`PolicyNo`) REFERENCES `bankinginsuarances` (`PolicyNo`);

--
-- Constraints for table `branches`
--
ALTER TABLE `branches`
  ADD CONSTRAINT `FK_Branches_Zones_ZoneId` FOREIGN KEY (`ZoneId`) REFERENCES `zones` (`ZoneId`);

--
-- Constraints for table `buildiinginsurancecompenstaions`
--
ALTER TABLE `buildiinginsurancecompenstaions`
  ADD CONSTRAINT `FK_BuildiingInsuranceCompenstaions_BuildingInsuarances_PolicyNo` FOREIGN KEY (`PolicyNo`) REFERENCES `buildinginsuarances` (`PolicyNo`);

--
-- Constraints for table `buildinginsuarancedatas`
--
ALTER TABLE `buildinginsuarancedatas`
  ADD CONSTRAINT `FK_BuildingInsuaranceDatas_BuildingInsuarances_PolicyNo` FOREIGN KEY (`PolicyNo`) REFERENCES `buildinginsuarances` (`PolicyNo`);

--
-- Constraints for table `buildinginsuarances`
--
ALTER TABLE `buildinginsuarances`
  ADD CONSTRAINT `FK_BuildingInsuarances_Insuarances_InsuranceId` FOREIGN KEY (`InsuranceId`) REFERENCES `insuarances` (`InsuranceId`);

--
-- Constraints for table `divisaranaabhiperanas`
--
ALTER TABLE `divisaranaabhiperanas`
  ADD CONSTRAINT `FK_DivisaranaAbhiperanas_Branches_BranchId` FOREIGN KEY (`BranchId`) REFERENCES `branches` (`BranchId`);

--
-- Constraints for table `divisaranacircledates`
--
ALTER TABLE `divisaranacircledates`
  ADD CONSTRAINT `FK_DivisaranaCircleDates_DivisaranaDatas_CustomerPolicyNo` FOREIGN KEY (`CustomerPolicyNo`) REFERENCES `divisaranadatas` (`CustomerPolicyNo`);

--
-- Constraints for table `divisaranacompensations`
--
ALTER TABLE `divisaranacompensations`
  ADD CONSTRAINT `FK_DivisaranaCompensations_DivisaranaDatas_CustomerPolicyNo` FOREIGN KEY (`CustomerPolicyNo`) REFERENCES `divisaranadatas` (`CustomerPolicyNo`);

--
-- Constraints for table `divisaranaparithoshithas`
--
ALTER TABLE `divisaranaparithoshithas`
  ADD CONSTRAINT `FK_DivisaranaParithoshithas_Branches_BranchId` FOREIGN KEY (`BranchId`) REFERENCES `branches` (`BranchId`);

--
-- Constraints for table `divisaranapayments`
--
ALTER TABLE `divisaranapayments`
  ADD CONSTRAINT `FK_DivisaranaPayments_DivisaranaDatas_CustomerPolicyNo` FOREIGN KEY (`CustomerPolicyNo`) REFERENCES `divisaranadatas` (`CustomerPolicyNo`);

--
-- Constraints for table `divisaranasuccssors`
--
ALTER TABLE `divisaranasuccssors`
  ADD CONSTRAINT `FK_DivisaranaSuccssors_DivisaranaDatas_CustomerPolicyNo` FOREIGN KEY (`CustomerPolicyNo`) REFERENCES `divisaranadatas` (`CustomerPolicyNo`);

--
-- Constraints for table `divisaranatbls`
--
ALTER TABLE `divisaranatbls`
  ADD CONSTRAINT `FK_DivisaranaTbls_DivisaranaDatas_CustomerPolicyNo` FOREIGN KEY (`CustomerPolicyNo`) REFERENCES `divisaranadatas` (`CustomerPolicyNo`),
  ADD CONSTRAINT `FK_DivisaranaTbls_Insuarances_InsuranceId` FOREIGN KEY (`InsuranceId`) REFERENCES `insuarances` (`InsuranceId`);

--
-- Constraints for table `healthinsuarancedatas`
--
ALTER TABLE `healthinsuarancedatas`
  ADD CONSTRAINT `FK_HealthInsuaranceDatas_HealthInsuarances_PolicyNo` FOREIGN KEY (`PolicyNo`) REFERENCES `healthinsuarances` (`PolicyNo`);

--
-- Constraints for table `healthinsuarances`
--
ALTER TABLE `healthinsuarances`
  ADD CONSTRAINT `FK_HealthInsuarances_Insuarances_InsuranceId` FOREIGN KEY (`InsuranceId`) REFERENCES `insuarances` (`InsuranceId`);

--
-- Constraints for table `healthinsurancecompenstaions`
--
ALTER TABLE `healthinsurancecompenstaions`
  ADD CONSTRAINT `FK_HealthInsuranceCompenstaions_HealthInsuarances_PolicyNo` FOREIGN KEY (`PolicyNo`) REFERENCES `healthinsuarances` (`PolicyNo`);

--
-- Constraints for table `insuarances`
--
ALTER TABLE `insuarances`
  ADD CONSTRAINT `FK_Insuarances_Branches_BranchId` FOREIGN KEY (`BranchId`) REFERENCES `branches` (`BranchId`),
  ADD CONSTRAINT `FK_Insuarances_InsuranceProducts_InsuranceProductID` FOREIGN KEY (`InsuranceProductID`) REFERENCES `insuranceproducts` (`InsuranceProductID`);

--
-- Constraints for table `loancompenstaions`
--
ALTER TABLE `loancompenstaions`
  ADD CONSTRAINT `FK_LoanCompenstaions_LoanCustomers_CustomerPolicyNo` FOREIGN KEY (`CustomerPolicyNo`) REFERENCES `loancustomers` (`CustomerPolicyNo`);

--
-- Constraints for table `loanpayments`
--
ALTER TABLE `loanpayments`
  ADD CONSTRAINT `FK_LoanPayments_LoanCustomers_CustomerPolicyNo` FOREIGN KEY (`CustomerPolicyNo`) REFERENCES `loancustomers` (`CustomerPolicyNo`);

--
-- Constraints for table `loantbls`
--
ALTER TABLE `loantbls`
  ADD CONSTRAINT `FK_LoanTbls_Insuarances_InsuranceId` FOREIGN KEY (`InsuranceId`) REFERENCES `insuarances` (`InsuranceId`),
  ADD CONSTRAINT `FK_LoanTbls_LoanCustomers_CustomerPolicyNo` FOREIGN KEY (`CustomerPolicyNo`) REFERENCES `loancustomers` (`CustomerPolicyNo`);

--
-- Constraints for table `savingreliefcompensations`
--
ALTER TABLE `savingreliefcompensations`
  ADD CONSTRAINT `FK_SavingReliefCompensations_SavingReliefs_PolicyNo` FOREIGN KEY (`PolicyNo`) REFERENCES `savingreliefs` (`PolicyNo`);

--
-- Constraints for table `savingreliefdatas`
--
ALTER TABLE `savingreliefdatas`
  ADD CONSTRAINT `FK_SavingReliefDatas_SavingReliefs_PolicyNo` FOREIGN KEY (`PolicyNo`) REFERENCES `savingreliefs` (`PolicyNo`);

--
-- Constraints for table `savingreliefparithoshithas`
--
ALTER TABLE `savingreliefparithoshithas`
  ADD CONSTRAINT `FK_SavingReliefParithoshithas_Branches_BranchId` FOREIGN KEY (`BranchId`) REFERENCES `branches` (`BranchId`);

--
-- Constraints for table `savingreliefs`
--
ALTER TABLE `savingreliefs`
  ADD CONSTRAINT `FK_SavingReliefs_Insuarances_InsuranceId` FOREIGN KEY (`InsuranceId`) REFERENCES `insuarances` (`InsuranceId`);

--
-- Constraints for table `treasuaries`
--
ALTER TABLE `treasuaries`
  ADD CONSTRAINT `FK_Treasuaries_Insuarances_InsuranceId` FOREIGN KEY (`InsuranceId`) REFERENCES `insuarances` (`InsuranceId`);

--
-- Constraints for table `treasuarydatas`
--
ALTER TABLE `treasuarydatas`
  ADD CONSTRAINT `FK_TreasuaryDatas_Treasuaries_PolicyNo` FOREIGN KEY (`PolicyNo`) REFERENCES `treasuaries` (`PolicyNo`);

--
-- Constraints for table `treasuaryescollections`
--
ALTER TABLE `treasuaryescollections`
  ADD CONSTRAINT `FK_TreasuaryesCollections_Treasuaries_PolicyNo` FOREIGN KEY (`PolicyNo`) REFERENCES `treasuaries` (`PolicyNo`);

--
-- Constraints for table `treasuraryinsurancecompenstaions`
--
ALTER TABLE `treasuraryinsurancecompenstaions`
  ADD CONSTRAINT `FK_TreasuraryInsuranceCompenstaions_Treasuaries_PolicyNo` FOREIGN KEY (`PolicyNo`) REFERENCES `treasuaries` (`PolicyNo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
