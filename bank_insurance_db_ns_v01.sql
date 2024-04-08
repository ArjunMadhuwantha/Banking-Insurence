Enter password:
-- MySQL dump 10.13  Distrib 8.3.0, for Linux (x86_64)
--
-- Host: localhost    Database: bankdb
-- ------------------------------------------------------
-- Server version       8.3.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
mysqldump: Error: 'Access denied; you need (at least one of) the PROCESS privilege(s) for this operation' when trying to dump tablespaces

--
-- Table structure for table `AspNetRoleClaims`
--

DROP TABLE IF EXISTS `AspNetRoleClaims`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AspNetRoleClaims` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `RoleId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ClaimType` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `ClaimValue` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  PRIMARY KEY (`Id`),
  KEY `IX_AspNetRoleClaims_RoleId` (`RoleId`),
  CONSTRAINT `FK_AspNetRoleClaims_AspNetRoles_RoleId` FOREIGN KEY (`RoleId`) REFERENCES `AspNetRoles` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AspNetRoleClaims`
--

LOCK TABLES `AspNetRoleClaims` WRITE;
/*!40000 ALTER TABLE `AspNetRoleClaims` DISABLE KEYS */;
/*!40000 ALTER TABLE `AspNetRoleClaims` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AspNetRoles`
--

DROP TABLE IF EXISTS `AspNetRoles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AspNetRoles` (
  `Id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Name` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `NormalizedName` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `ConcurrencyStamp` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `RoleNameIndex` (`NormalizedName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AspNetRoles`
--

LOCK TABLES `AspNetRoles` WRITE;
/*!40000 ALTER TABLE `AspNetRoles` DISABLE KEYS */;
INSERT INTO `AspNetRoles` VALUES ('cd14e372-0ddd-4b5d-80ba-f5556483e35f','Admin','ADMIN',NULL),('d974e5c4-a799-49e5-83e9-0a2082247f6c','User','USER',NULL);
/*!40000 ALTER TABLE `AspNetRoles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AspNetUserClaims`
--

DROP TABLE IF EXISTS `AspNetUserClaims`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AspNetUserClaims` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `UserId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ClaimType` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `ClaimValue` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  PRIMARY KEY (`Id`),
  KEY `IX_AspNetUserClaims_UserId` (`UserId`),
  CONSTRAINT `FK_AspNetUserClaims_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `AspNetUsers` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AspNetUserClaims`
--

LOCK TABLES `AspNetUserClaims` WRITE;
/*!40000 ALTER TABLE `AspNetUserClaims` DISABLE KEYS */;
/*!40000 ALTER TABLE `AspNetUserClaims` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AspNetUserLogins`
--

DROP TABLE IF EXISTS `AspNetUserLogins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AspNetUserLogins` (
  `LoginProvider` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ProviderKey` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ProviderDisplayName` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `UserId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`LoginProvider`,`ProviderKey`),
  KEY `IX_AspNetUserLogins_UserId` (`UserId`),
  CONSTRAINT `FK_AspNetUserLogins_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `AspNetUsers` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AspNetUserLogins`
--

LOCK TABLES `AspNetUserLogins` WRITE;
/*!40000 ALTER TABLE `AspNetUserLogins` DISABLE KEYS */;
/*!40000 ALTER TABLE `AspNetUserLogins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AspNetUserRoles`
--

DROP TABLE IF EXISTS `AspNetUserRoles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AspNetUserRoles` (
  `UserId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `RoleId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`UserId`,`RoleId`),
  KEY `IX_AspNetUserRoles_RoleId` (`RoleId`),
  CONSTRAINT `FK_AspNetUserRoles_AspNetRoles_RoleId` FOREIGN KEY (`RoleId`) REFERENCES `AspNetRoles` (`Id`) ON DELETE CASCADE,
  CONSTRAINT `FK_AspNetUserRoles_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `AspNetUsers` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AspNetUserRoles`
--

LOCK TABLES `AspNetUserRoles` WRITE;
/*!40000 ALTER TABLE `AspNetUserRoles` DISABLE KEYS */;
INSERT INTO `AspNetUserRoles` VALUES ('49573782-f7d4-4510-8a27-07d3210ccf0d','cd14e372-0ddd-4b5d-80ba-f5556483e35f'),('50e4b5f5-fa12-4989-b954-bdaf48adb463','cd14e372-0ddd-4b5d-80ba-f5556483e35f');
/*!40000 ALTER TABLE `AspNetUserRoles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AspNetUserTokens`
--

DROP TABLE IF EXISTS `AspNetUserTokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AspNetUserTokens` (
  `UserId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `LoginProvider` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  PRIMARY KEY (`UserId`,`LoginProvider`,`Name`),
  CONSTRAINT `FK_AspNetUserTokens_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `AspNetUsers` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AspNetUserTokens`
--

LOCK TABLES `AspNetUserTokens` WRITE;
/*!40000 ALTER TABLE `AspNetUserTokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `AspNetUserTokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AspNetUsers`
--

DROP TABLE IF EXISTS `AspNetUsers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AspNetUsers` (
  `Id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Discriminator` varchar(21) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `FullName` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `Profession` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `DOB` date DEFAULT NULL,
  `NicNo` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `Address` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `UserName` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `NormalizedUserName` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Email` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `NormalizedEmail` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `EmailConfirmed` tinyint(1) NOT NULL,
  `PasswordHash` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `SecurityStamp` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `ConcurrencyStamp` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `PhoneNumber` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `PhoneNumberConfirmed` tinyint(1) NOT NULL,
  `TwoFactorEnabled` tinyint(1) NOT NULL,
  `LockoutEnd` datetime(6) DEFAULT NULL,
  `LockoutEnabled` tinyint(1) NOT NULL,
  `AccessFailedCount` int NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UserNameIndex` (`NormalizedUserName`),
  KEY `EmailIndex` (`NormalizedEmail`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AspNetUsers`
--

LOCK TABLES `AspNetUsers` WRITE;
/*!40000 ALTER TABLE `AspNetUsers` DISABLE KEYS */;
INSERT INTO `AspNetUsers` VALUES ('49573782-f7d4-4510-8a27-07d3210ccf0d','ApplicationUser','DefaultAdmin','Admin','2024-03-23','123456789V','Default Admin','defaultadmin@gmail.com','DEFAULTADMIN@GMAIL.COM','defaultadmin@gmail.com','DEFAULTADMIN@GMAIL.COM',0,'AQAAAAIAAYagAAAAECI9EYX2BYHCQOLD8D1ZLJZ9PUtbVd0/mIAc/UWhKCstWXenJfzdyIkCuF18Cm/BKA==','KNEVPHGLEK7BUZYXDDN55FNHDV6HJKJR','7d9f514b-3a11-4b0d-8273-22f4bbf7493d','+94773526450',0,0,NULL,1,0),('50e4b5f5-fa12-4989-b954-bdaf48adb463','ApplicationUser','kavindu','DevOps Engineer','1998-12-22','199835700534','322/23/2, wellambarawtt, kahangama, ratnapura','kavindu@nanosoft.lk','KAVINDU@NANOSOFT.LK','kavindu@nanosoft.lk','KAVINDU@NANOSOFT.LK',0,'AQAAAAIAAYagAAAAENYYSIe3xCrgcnClZqfqo9yroLsa+q/INli/KbdC+4/+nNaPEV7DKL+jNDciUhM39A==','SY2N7EJ6B7GJGJJWWGBPXNRP3MQHFADH','f4f563bc-345e-4358-844b-405a3312bf47',NULL,0,0,NULL,1,0);
/*!40000 ALTER TABLE `AspNetUsers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BankingInsuaranceCompenstaions`
--

DROP TABLE IF EXISTS `BankingInsuaranceCompenstaions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `BankingInsuaranceCompenstaions` (
  `BankingInsuaranceCompenstaionID` int NOT NULL AUTO_INCREMENT,
  `Value` double NOT NULL,
  `Data` date NOT NULL,
  `Comment` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `PolicyNo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`BankingInsuaranceCompenstaionID`),
  KEY `IX_BankingInsuaranceCompenstaions_PolicyNo` (`PolicyNo`),
  CONSTRAINT `FK_BankingInsuaranceCompenstaions_BankingInsuarances_PolicyNo` FOREIGN KEY (`PolicyNo`) REFERENCES `BankingInsuarances` (`PolicyNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BankingInsuaranceCompenstaions`
--

LOCK TABLES `BankingInsuaranceCompenstaions` WRITE;
/*!40000 ALTER TABLE `BankingInsuaranceCompenstaions` DISABLE KEYS */;
/*!40000 ALTER TABLE `BankingInsuaranceCompenstaions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BankingInsuaranceDatas`
--

DROP TABLE IF EXISTS `BankingInsuaranceDatas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `BankingInsuaranceDatas` (
  `DataId` int NOT NULL AUTO_INCREMENT,
  `Date` date NOT NULL,
  `Amount` double NOT NULL,
  `PolicyNo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`DataId`),
  KEY `IX_BankingInsuaranceDatas_PolicyNo` (`PolicyNo`),
  CONSTRAINT `FK_BankingInsuaranceDatas_BankingInsuarances_PolicyNo` FOREIGN KEY (`PolicyNo`) REFERENCES `BankingInsuarances` (`PolicyNo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BankingInsuaranceDatas`
--

LOCK TABLES `BankingInsuaranceDatas` WRITE;
/*!40000 ALTER TABLE `BankingInsuaranceDatas` DISABLE KEYS */;
INSERT INTO `BankingInsuaranceDatas` VALUES (1,'2024-03-08',1000,'Poilicy-banking-Br002'),(2,'2024-04-05',100,'Poilicy-banking-Br002');
/*!40000 ALTER TABLE `BankingInsuaranceDatas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BankingInsuarances`
--

DROP TABLE IF EXISTS `BankingInsuarances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `BankingInsuarances` (
  `PolicyNo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `InsuranceId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`PolicyNo`),
  KEY `IX_BankingInsuarances_InsuranceId` (`InsuranceId`),
  CONSTRAINT `FK_BankingInsuarances_Insuarances_InsuranceId` FOREIGN KEY (`InsuranceId`) REFERENCES `Insuarances` (`InsuranceId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BankingInsuarances`
--

LOCK TABLES `BankingInsuarances` WRITE;
/*!40000 ALTER TABLE `BankingInsuarances` DISABLE KEYS */;
INSERT INTO `BankingInsuarances` VALUES ('Poilicy-banking-Br002','insuarance-002_Br002');
/*!40000 ALTER TABLE `BankingInsuarances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Branches`
--

DROP TABLE IF EXISTS `Branches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Branches` (
  `BranchId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Branch_name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `Address` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `TpNo` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `City` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `ZoneId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`BranchId`),
  KEY `IX_Branches_ZoneId` (`ZoneId`),
  CONSTRAINT `FK_Branches_Zones_ZoneId` FOREIGN KEY (`ZoneId`) REFERENCES `Zones` (`ZoneId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Branches`
--

LOCK TABLES `Branches` WRITE;
/*!40000 ALTER TABLE `Branches` DISABLE KEYS */;
INSERT INTO `Branches` VALUES ('B001','Kahangama','Kahangama,Ratnapura','0715224830','Ratnapura','Z001'),('Br002','Vavuniya','148/A pahala hanwella','0769199812','Hanwella','Ham001');
/*!40000 ALTER TABLE `Branches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BuildiingInsuranceCompenstaions`
--

DROP TABLE IF EXISTS `BuildiingInsuranceCompenstaions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `BuildiingInsuranceCompenstaions` (
  `BuildiingInsuranceCompenstaionID` int NOT NULL AUTO_INCREMENT,
  `Value` double NOT NULL,
  `Data` date NOT NULL,
  `Comment` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `PolicyNo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`BuildiingInsuranceCompenstaionID`),
  KEY `IX_BuildiingInsuranceCompenstaions_PolicyNo` (`PolicyNo`),
  CONSTRAINT `FK_BuildiingInsuranceCompenstaions_BuildingInsuarances_PolicyNo` FOREIGN KEY (`PolicyNo`) REFERENCES `BuildingInsuarances` (`PolicyNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BuildiingInsuranceCompenstaions`
--

LOCK TABLES `BuildiingInsuranceCompenstaions` WRITE;
/*!40000 ALTER TABLE `BuildiingInsuranceCompenstaions` DISABLE KEYS */;
/*!40000 ALTER TABLE `BuildiingInsuranceCompenstaions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BuildingInsuaranceDatas`
--

DROP TABLE IF EXISTS `BuildingInsuaranceDatas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `BuildingInsuaranceDatas` (
  `DataId` int NOT NULL AUTO_INCREMENT,
  `Date` date NOT NULL,
  `Amount` double NOT NULL,
  `PolicyNo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`DataId`),
  KEY `IX_BuildingInsuaranceDatas_PolicyNo` (`PolicyNo`),
  CONSTRAINT `FK_BuildingInsuaranceDatas_BuildingInsuarances_PolicyNo` FOREIGN KEY (`PolicyNo`) REFERENCES `BuildingInsuarances` (`PolicyNo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BuildingInsuaranceDatas`
--

LOCK TABLES `BuildingInsuaranceDatas` WRITE;
/*!40000 ALTER TABLE `BuildingInsuaranceDatas` DISABLE KEYS */;
INSERT INTO `BuildingInsuaranceDatas` VALUES (1,'2024-03-08',0,'Poilicy-building-Br002'),(2,'2024-04-05',0,'Poilicy-building-Br002');
/*!40000 ALTER TABLE `BuildingInsuaranceDatas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BuildingInsuarances`
--

DROP TABLE IF EXISTS `BuildingInsuarances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `BuildingInsuarances` (
  `PolicyNo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `InsuranceId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`PolicyNo`),
  KEY `IX_BuildingInsuarances_InsuranceId` (`InsuranceId`),
  CONSTRAINT `FK_BuildingInsuarances_Insuarances_InsuranceId` FOREIGN KEY (`InsuranceId`) REFERENCES `Insuarances` (`InsuranceId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BuildingInsuarances`
--

LOCK TABLES `BuildingInsuarances` WRITE;
/*!40000 ALTER TABLE `BuildingInsuarances` DISABLE KEYS */;
INSERT INTO `BuildingInsuarances` VALUES ('Poilicy-building-Br002','insuarance-003_Br002');
/*!40000 ALTER TABLE `BuildingInsuarances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DivisaranaAbhiperanas`
--

DROP TABLE IF EXISTS `DivisaranaAbhiperanas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DivisaranaAbhiperanas` (
  `DataId` int NOT NULL AUTO_INCREMENT,
  `Month` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `Amount` double DEFAULT NULL,
  `Comment` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `BranchId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`DataId`),
  KEY `IX_DivisaranaAbhiperanas_BranchId` (`BranchId`),
  CONSTRAINT `FK_DivisaranaAbhiperanas_Branches_BranchId` FOREIGN KEY (`BranchId`) REFERENCES `Branches` (`BranchId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DivisaranaAbhiperanas`
--

LOCK TABLES `DivisaranaAbhiperanas` WRITE;
/*!40000 ALTER TABLE `DivisaranaAbhiperanas` DISABLE KEYS */;
/*!40000 ALTER TABLE `DivisaranaAbhiperanas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DivisaranaCircleDates`
--

DROP TABLE IF EXISTS `DivisaranaCircleDates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DivisaranaCircleDates` (
  `CircleId` int NOT NULL AUTO_INCREMENT,
  `BranchId` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `Fullname` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `TimePeriod` int NOT NULL,
  `AddmissionFee` double NOT NULL,
  `TotalAmount` double NOT NULL,
  `DueAmount` double DEFAULT NULL,
  `StartDate` date NOT NULL,
  `NextExecuteDate` date NOT NULL,
  `RecoveryAmount` double NOT NULL,
  `CustomerPolicyNo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`CircleId`),
  KEY `IX_DivisaranaCircleDates_CustomerPolicyNo` (`CustomerPolicyNo`),
  CONSTRAINT `FK_DivisaranaCircleDates_DivisaranaDatas_CustomerPolicyNo` FOREIGN KEY (`CustomerPolicyNo`) REFERENCES `DivisaranaDatas` (`CustomerPolicyNo`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DivisaranaCircleDates`
--

LOCK TABLES `DivisaranaCircleDates` WRITE;
/*!40000 ALTER TABLE `DivisaranaCircleDates` DISABLE KEYS */;
INSERT INTO `DivisaranaCircleDates` VALUES (1,'Br002','arjuna Maduwantha',1,100,600,600,'2024-03-01','2024-04-01',50,'Divi-953460801V');
/*!40000 ALTER TABLE `DivisaranaCircleDates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DivisaranaCompensations`
--

DROP TABLE IF EXISTS `DivisaranaCompensations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DivisaranaCompensations` (
  `CompensationId` int NOT NULL AUTO_INCREMENT,
  `MemberName` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `BranchId` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `DivisaranaNo` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `DeathPersonName` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `HospitalizedPerson` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `DeathDate` date NOT NULL,
  `DischargeDate` date NOT NULL,
  `Realtion` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `Hospital` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `Diseases` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `Surgery` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `CompensationValue` double DEFAULT NULL,
  `Reason` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `CustomerPolicyNo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`CompensationId`),
  KEY `IX_DivisaranaCompensations_CustomerPolicyNo` (`CustomerPolicyNo`),
  CONSTRAINT `FK_DivisaranaCompensations_DivisaranaDatas_CustomerPolicyNo` FOREIGN KEY (`CustomerPolicyNo`) REFERENCES `DivisaranaDatas` (`CustomerPolicyNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DivisaranaCompensations`
--

LOCK TABLES `DivisaranaCompensations` WRITE;
/*!40000 ALTER TABLE `DivisaranaCompensations` DISABLE KEYS */;
/*!40000 ALTER TABLE `DivisaranaCompensations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DivisaranaDatas`
--

DROP TABLE IF EXISTS `DivisaranaDatas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DivisaranaDatas` (
  `CustomerPolicyNo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Fullname` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `Address` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `ID` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `BankMemberNo` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `DOB` date NOT NULL,
  `Job` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `Succssor` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  PRIMARY KEY (`CustomerPolicyNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DivisaranaDatas`
--

LOCK TABLES `DivisaranaDatas` WRITE;
/*!40000 ALTER TABLE `DivisaranaDatas` DISABLE KEYS */;
INSERT INTO `DivisaranaDatas` VALUES ('Divi-953460801V','arjuna Maduwantha','Kandy','953460801V','20','2024-03-01','student','MOTHER');
/*!40000 ALTER TABLE `DivisaranaDatas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DivisaranaParithoshithas`
--

DROP TABLE IF EXISTS `DivisaranaParithoshithas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DivisaranaParithoshithas` (
  `DataId` int NOT NULL AUTO_INCREMENT,
  `Name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `MemberNo` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `Amount` double DEFAULT NULL,
  `Comment` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `BranchId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`DataId`),
  KEY `IX_DivisaranaParithoshithas_BranchId` (`BranchId`),
  CONSTRAINT `FK_DivisaranaParithoshithas_Branches_BranchId` FOREIGN KEY (`BranchId`) REFERENCES `Branches` (`BranchId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DivisaranaParithoshithas`
--

LOCK TABLES `DivisaranaParithoshithas` WRITE;
/*!40000 ALTER TABLE `DivisaranaParithoshithas` DISABLE KEYS */;
/*!40000 ALTER TABLE `DivisaranaParithoshithas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DivisaranaPayments`
--

DROP TABLE IF EXISTS `DivisaranaPayments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DivisaranaPayments` (
  `PaymentId` int NOT NULL AUTO_INCREMENT,
  `BranchId` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `Fullname` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `PaymentDate` date NOT NULL,
  `SystemDate` date NOT NULL,
  `PaymentValue` double DEFAULT NULL,
  `RunningBalance` double DEFAULT NULL,
  `CustomerPolicyNo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`PaymentId`),
  KEY `IX_DivisaranaPayments_CustomerPolicyNo` (`CustomerPolicyNo`),
  CONSTRAINT `FK_DivisaranaPayments_DivisaranaDatas_CustomerPolicyNo` FOREIGN KEY (`CustomerPolicyNo`) REFERENCES `DivisaranaDatas` (`CustomerPolicyNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DivisaranaPayments`
--

LOCK TABLES `DivisaranaPayments` WRITE;
/*!40000 ALTER TABLE `DivisaranaPayments` DISABLE KEYS */;
/*!40000 ALTER TABLE `DivisaranaPayments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DivisaranaSuccssors`
--

DROP TABLE IF EXISTS `DivisaranaSuccssors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DivisaranaSuccssors` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `SuccsorName` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `SuccssorDob` date NOT NULL,
  `Age` int NOT NULL,
  `Relationship` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `CustomerPolicyNo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `IX_DivisaranaSuccssors_CustomerPolicyNo` (`CustomerPolicyNo`),
  CONSTRAINT `FK_DivisaranaSuccssors_DivisaranaDatas_CustomerPolicyNo` FOREIGN KEY (`CustomerPolicyNo`) REFERENCES `DivisaranaDatas` (`CustomerPolicyNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DivisaranaSuccssors`
--

LOCK TABLES `DivisaranaSuccssors` WRITE;
/*!40000 ALTER TABLE `DivisaranaSuccssors` DISABLE KEYS */;
/*!40000 ALTER TABLE `DivisaranaSuccssors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DivisaranaTbls`
--

DROP TABLE IF EXISTS `DivisaranaTbls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DivisaranaTbls` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `PolicyNo` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `InsuranceId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `CustomerPolicyNo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `IX_DivisaranaTbls_CustomerPolicyNo` (`CustomerPolicyNo`),
  KEY `IX_DivisaranaTbls_InsuranceId` (`InsuranceId`),
  CONSTRAINT `FK_DivisaranaTbls_DivisaranaDatas_CustomerPolicyNo` FOREIGN KEY (`CustomerPolicyNo`) REFERENCES `DivisaranaDatas` (`CustomerPolicyNo`),
  CONSTRAINT `FK_DivisaranaTbls_Insuarances_InsuranceId` FOREIGN KEY (`InsuranceId`) REFERENCES `Insuarances` (`InsuranceId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DivisaranaTbls`
--

LOCK TABLES `DivisaranaTbls` WRITE;
/*!40000 ALTER TABLE `DivisaranaTbls` DISABLE KEYS */;
INSERT INTO `DivisaranaTbls` VALUES (1,'Poilicy-divi-Br002','insuarance-007_Br002','Divi-953460801V');
/*!40000 ALTER TABLE `DivisaranaTbls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `HealthInsuaranceDatas`
--

DROP TABLE IF EXISTS `HealthInsuaranceDatas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `HealthInsuaranceDatas` (
  `DataId` int NOT NULL AUTO_INCREMENT,
  `Date` date NOT NULL,
  `Amount` double NOT NULL,
  `PolicyNo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`DataId`),
  KEY `IX_HealthInsuaranceDatas_PolicyNo` (`PolicyNo`),
  CONSTRAINT `FK_HealthInsuaranceDatas_HealthInsuarances_PolicyNo` FOREIGN KEY (`PolicyNo`) REFERENCES `HealthInsuarances` (`PolicyNo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HealthInsuaranceDatas`
--

LOCK TABLES `HealthInsuaranceDatas` WRITE;
/*!40000 ALTER TABLE `HealthInsuaranceDatas` DISABLE KEYS */;
INSERT INTO `HealthInsuaranceDatas` VALUES (1,'2024-03-08',5000,'Poilicy-health-Br002'),(2,'2024-04-05',100,'Poilicy-health-Br002');
/*!40000 ALTER TABLE `HealthInsuaranceDatas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `HealthInsuarances`
--

DROP TABLE IF EXISTS `HealthInsuarances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `HealthInsuarances` (
  `PolicyNo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `InsuranceId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`PolicyNo`),
  KEY `IX_HealthInsuarances_InsuranceId` (`InsuranceId`),
  CONSTRAINT `FK_HealthInsuarances_Insuarances_InsuranceId` FOREIGN KEY (`InsuranceId`) REFERENCES `Insuarances` (`InsuranceId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HealthInsuarances`
--

LOCK TABLES `HealthInsuarances` WRITE;
/*!40000 ALTER TABLE `HealthInsuarances` DISABLE KEYS */;
INSERT INTO `HealthInsuarances` VALUES ('Poilicy-health-Br002','insuarance-004_Br002');
/*!40000 ALTER TABLE `HealthInsuarances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `HealthInsuranceCompenstaions`
--

DROP TABLE IF EXISTS `HealthInsuranceCompenstaions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `HealthInsuranceCompenstaions` (
  `HealthInsuranceCompenstaionID` int NOT NULL AUTO_INCREMENT,
  `Value` double NOT NULL,
  `Data` date NOT NULL,
  `Comment` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `PolicyNo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`HealthInsuranceCompenstaionID`),
  KEY `IX_HealthInsuranceCompenstaions_PolicyNo` (`PolicyNo`),
  CONSTRAINT `FK_HealthInsuranceCompenstaions_HealthInsuarances_PolicyNo` FOREIGN KEY (`PolicyNo`) REFERENCES `HealthInsuarances` (`PolicyNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HealthInsuranceCompenstaions`
--

LOCK TABLES `HealthInsuranceCompenstaions` WRITE;
/*!40000 ALTER TABLE `HealthInsuranceCompenstaions` DISABLE KEYS */;
/*!40000 ALTER TABLE `HealthInsuranceCompenstaions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Insuarances`
--

DROP TABLE IF EXISTS `Insuarances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Insuarances` (
  `InsuranceId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `StartDate` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `PolicyNo` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `InsuranceProductID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `BranchId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`InsuranceId`),
  KEY `IX_Insuarances_BranchId` (`BranchId`),
  KEY `IX_Insuarances_InsuranceProductID` (`InsuranceProductID`),
  CONSTRAINT `FK_Insuarances_Branches_BranchId` FOREIGN KEY (`BranchId`) REFERENCES `Branches` (`BranchId`),
  CONSTRAINT `FK_Insuarances_InsuranceProducts_InsuranceProductID` FOREIGN KEY (`InsuranceProductID`) REFERENCES `InsuranceProducts` (`InsuranceProductID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Insuarances`
--

LOCK TABLES `Insuarances` WRITE;
/*!40000 ALTER TABLE `Insuarances` DISABLE KEYS */;
INSERT INTO `Insuarances` VALUES ('insuarance-001_Br002','2024-01-01','Poilicy-saving-Br002','Product-001','Br002'),('insuarance-002_Br002','2024-01-01','Poilicy-banking-Br002','Product-002','Br002'),('insuarance-003_Br002','2024-01-01','Poilicy-building-Br002','Product-003','Br002'),('insuarance-004_Br002','2024-01-01','Poilicy-health-Br002','Product-004','Br002'),('insuarance-005_Br002','2024-01-01','Poilicy-Treasuary-Br002','Product-005','Br002'),('insuarance-007_Br002','2024-01-01','Poilicy-divi-Br002','Product-006','Br002');
/*!40000 ALTER TABLE `Insuarances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `InsuranceProducts`
--

DROP TABLE IF EXISTS `InsuranceProducts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `InsuranceProducts` (
  `InsuranceProductID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `InsuranceProductName` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  PRIMARY KEY (`InsuranceProductID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `InsuranceProducts`
--

LOCK TABLES `InsuranceProducts` WRITE;
/*!40000 ALTER TABLE `InsuranceProducts` DISABLE KEYS */;
INSERT INTO `InsuranceProducts` VALUES ('Product-001','Product-One'),('Product-002','Product-two'),('Product-003','Product-three'),('Product-004','Product-four'),('Product-005','Product-five'),('Product-006','Product-six');
/*!40000 ALTER TABLE `InsuranceProducts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LoanCompenstaions`
--

DROP TABLE IF EXISTS `LoanCompenstaions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `LoanCompenstaions` (
  `LoanCompenstaionID` int NOT NULL AUTO_INCREMENT,
  `FullName` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `BranchId` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `Value` double NOT NULL,
  `CompenstaionValue` double NOT NULL,
  `Requirement` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `Comment` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `Date` date NOT NULL,
  `CustomerPolicyNo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`LoanCompenstaionID`),
  KEY `IX_LoanCompenstaions_CustomerPolicyNo` (`CustomerPolicyNo`),
  CONSTRAINT `FK_LoanCompenstaions_LoanCustomers_CustomerPolicyNo` FOREIGN KEY (`CustomerPolicyNo`) REFERENCES `LoanCustomers` (`CustomerPolicyNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LoanCompenstaions`
--

LOCK TABLES `LoanCompenstaions` WRITE;
/*!40000 ALTER TABLE `LoanCompenstaions` DISABLE KEYS */;
/*!40000 ALTER TABLE `LoanCompenstaions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LoanCustomers`
--

DROP TABLE IF EXISTS `LoanCustomers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `LoanCustomers` (
  `CustomerPolicyNo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `CustomerName` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `ID` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `Address` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `ProjectName` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `LoanIssueDate` date NOT NULL,
  `LoanEndDate` date NOT NULL,
  `TeamNo` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `LoanValue` double NOT NULL,
  PRIMARY KEY (`CustomerPolicyNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LoanCustomers`
--

LOCK TABLES `LoanCustomers` WRITE;
/*!40000 ALTER TABLE `LoanCustomers` DISABLE KEYS */;
/*!40000 ALTER TABLE `LoanCustomers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LoanPayments`
--

DROP TABLE IF EXISTS `LoanPayments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `LoanPayments` (
  `PaymentId` int NOT NULL AUTO_INCREMENT,
  `PaymentDate` date NOT NULL,
  `Paymentvalue` double NOT NULL,
  `CustomerPolicyNo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`PaymentId`),
  KEY `IX_LoanPayments_CustomerPolicyNo` (`CustomerPolicyNo`),
  CONSTRAINT `FK_LoanPayments_LoanCustomers_CustomerPolicyNo` FOREIGN KEY (`CustomerPolicyNo`) REFERENCES `LoanCustomers` (`CustomerPolicyNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LoanPayments`
--

LOCK TABLES `LoanPayments` WRITE;
/*!40000 ALTER TABLE `LoanPayments` DISABLE KEYS */;
/*!40000 ALTER TABLE `LoanPayments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LoanTbls`
--

DROP TABLE IF EXISTS `LoanTbls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `LoanTbls` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `PolicyNo` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `InsuranceId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `CustomerPolicyNo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `IX_LoanTbls_CustomerPolicyNo` (`CustomerPolicyNo`),
  KEY `IX_LoanTbls_InsuranceId` (`InsuranceId`),
  CONSTRAINT `FK_LoanTbls_Insuarances_InsuranceId` FOREIGN KEY (`InsuranceId`) REFERENCES `Insuarances` (`InsuranceId`),
  CONSTRAINT `FK_LoanTbls_LoanCustomers_CustomerPolicyNo` FOREIGN KEY (`CustomerPolicyNo`) REFERENCES `LoanCustomers` (`CustomerPolicyNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LoanTbls`
--

LOCK TABLES `LoanTbls` WRITE;
/*!40000 ALTER TABLE `LoanTbls` DISABLE KEYS */;
/*!40000 ALTER TABLE `LoanTbls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SavingReliefCompensations`
--

DROP TABLE IF EXISTS `SavingReliefCompensations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SavingReliefCompensations` (
  `MemberId` int NOT NULL AUTO_INCREMENT,
  `MemberName` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `MemberAddress` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `DeathpersonName` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `Reason` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `Realtion` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `ReasonDate` date NOT NULL,
  `CompensationValue` double NOT NULL,
  `RemainingBalanece` double NOT NULL,
  `Schoolname` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `Studentname` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `Universityname` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `PolicyNo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`MemberId`),
  KEY `IX_SavingReliefCompensations_PolicyNo` (`PolicyNo`),
  CONSTRAINT `FK_SavingReliefCompensations_SavingReliefs_PolicyNo` FOREIGN KEY (`PolicyNo`) REFERENCES `SavingReliefs` (`PolicyNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SavingReliefCompensations`
--

LOCK TABLES `SavingReliefCompensations` WRITE;
/*!40000 ALTER TABLE `SavingReliefCompensations` DISABLE KEYS */;
/*!40000 ALTER TABLE `SavingReliefCompensations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SavingReliefDatas`
--

DROP TABLE IF EXISTS `SavingReliefDatas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SavingReliefDatas` (
  `DataId` int NOT NULL AUTO_INCREMENT,
  `Date` date NOT NULL,
  `Amount` double NOT NULL,
  `PolicyNo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`DataId`),
  KEY `IX_SavingReliefDatas_PolicyNo` (`PolicyNo`),
  CONSTRAINT `FK_SavingReliefDatas_SavingReliefs_PolicyNo` FOREIGN KEY (`PolicyNo`) REFERENCES `SavingReliefs` (`PolicyNo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SavingReliefDatas`
--

LOCK TABLES `SavingReliefDatas` WRITE;
/*!40000 ALTER TABLE `SavingReliefDatas` DISABLE KEYS */;
INSERT INTO `SavingReliefDatas` VALUES (1,'2024-03-08',3000,'Poilicy-saving-Br002'),(2,'2024-04-05',100,'Poilicy-saving-Br002');
/*!40000 ALTER TABLE `SavingReliefDatas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SavingReliefParithoshithas`
--

DROP TABLE IF EXISTS `SavingReliefParithoshithas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SavingReliefParithoshithas` (
  `DataId` int NOT NULL AUTO_INCREMENT,
  `Name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `MemberNo` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `Amount` double DEFAULT NULL,
  `Comment` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `BranchId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`DataId`),
  KEY `IX_SavingReliefParithoshithas_BranchId` (`BranchId`),
  CONSTRAINT `FK_SavingReliefParithoshithas_Branches_BranchId` FOREIGN KEY (`BranchId`) REFERENCES `Branches` (`BranchId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SavingReliefParithoshithas`
--

LOCK TABLES `SavingReliefParithoshithas` WRITE;
/*!40000 ALTER TABLE `SavingReliefParithoshithas` DISABLE KEYS */;
/*!40000 ALTER TABLE `SavingReliefParithoshithas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SavingReliefs`
--

DROP TABLE IF EXISTS `SavingReliefs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SavingReliefs` (
  `PolicyNo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `InsuranceId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`PolicyNo`),
  UNIQUE KEY `IX_SavingReliefs_InsuranceId` (`InsuranceId`),
  CONSTRAINT `FK_SavingReliefs_Insuarances_InsuranceId` FOREIGN KEY (`InsuranceId`) REFERENCES `Insuarances` (`InsuranceId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SavingReliefs`
--

LOCK TABLES `SavingReliefs` WRITE;
/*!40000 ALTER TABLE `SavingReliefs` DISABLE KEYS */;
INSERT INTO `SavingReliefs` VALUES ('Poilicy-saving-Br002','insuarance-001_Br002');
/*!40000 ALTER TABLE `SavingReliefs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Treasuaries`
--

DROP TABLE IF EXISTS `Treasuaries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Treasuaries` (
  `PolicyNo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `InsuranceId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`PolicyNo`),
  KEY `IX_Treasuaries_InsuranceId` (`InsuranceId`),
  CONSTRAINT `FK_Treasuaries_Insuarances_InsuranceId` FOREIGN KEY (`InsuranceId`) REFERENCES `Insuarances` (`InsuranceId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Treasuaries`
--

LOCK TABLES `Treasuaries` WRITE;
/*!40000 ALTER TABLE `Treasuaries` DISABLE KEYS */;
INSERT INTO `Treasuaries` VALUES ('Poilicy-Treasuary-Br002','insuarance-005_Br002');
/*!40000 ALTER TABLE `Treasuaries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TreasuaryDatas`
--

DROP TABLE IF EXISTS `TreasuaryDatas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TreasuaryDatas` (
  `DataId` int NOT NULL AUTO_INCREMENT,
  `Date` date NOT NULL,
  `Amount` double NOT NULL,
  `PolicyNo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`DataId`),
  KEY `IX_TreasuaryDatas_PolicyNo` (`PolicyNo`),
  CONSTRAINT `FK_TreasuaryDatas_Treasuaries_PolicyNo` FOREIGN KEY (`PolicyNo`) REFERENCES `Treasuaries` (`PolicyNo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TreasuaryDatas`
--

LOCK TABLES `TreasuaryDatas` WRITE;
/*!40000 ALTER TABLE `TreasuaryDatas` DISABLE KEYS */;
INSERT INTO `TreasuaryDatas` VALUES (1,'2024-03-08',1000,'Poilicy-Treasuary-Br002'),(2,'2024-04-05',100,'Poilicy-Treasuary-Br002');
/*!40000 ALTER TABLE `TreasuaryDatas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TreasuaryesCollections`
--

DROP TABLE IF EXISTS `TreasuaryesCollections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TreasuaryesCollections` (
  `TreasuaryeId` int NOT NULL AUTO_INCREMENT,
  `TreasuaryName` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `Date` date NOT NULL,
  `PolicyNo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`TreasuaryeId`),
  KEY `IX_TreasuaryesCollections_PolicyNo` (`PolicyNo`),
  CONSTRAINT `FK_TreasuaryesCollections_Treasuaries_PolicyNo` FOREIGN KEY (`PolicyNo`) REFERENCES `Treasuaries` (`PolicyNo`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TreasuaryesCollections`
--

LOCK TABLES `TreasuaryesCollections` WRITE;
/*!40000 ALTER TABLE `TreasuaryesCollections` DISABLE KEYS */;
INSERT INTO `TreasuaryesCollections` VALUES (1,'Nimal','2024-04-05','Poilicy-Treasuary-Br002');
/*!40000 ALTER TABLE `TreasuaryesCollections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TreasuraryInsuranceCompenstaions`
--

DROP TABLE IF EXISTS `TreasuraryInsuranceCompenstaions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TreasuraryInsuranceCompenstaions` (
  `TreasuraryInsuranceCompenstaionID` int NOT NULL AUTO_INCREMENT,
  `Value` double NOT NULL,
  `Data` date NOT NULL,
  `Comment` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `PolicyNo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`TreasuraryInsuranceCompenstaionID`),
  KEY `IX_TreasuraryInsuranceCompenstaions_PolicyNo` (`PolicyNo`),
  CONSTRAINT `FK_TreasuraryInsuranceCompenstaions_Treasuaries_PolicyNo` FOREIGN KEY (`PolicyNo`) REFERENCES `Treasuaries` (`PolicyNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TreasuraryInsuranceCompenstaions`
--

LOCK TABLES `TreasuraryInsuranceCompenstaions` WRITE;
/*!40000 ALTER TABLE `TreasuraryInsuranceCompenstaions` DISABLE KEYS */;
/*!40000 ALTER TABLE `TreasuraryInsuranceCompenstaions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Zones`
--

DROP TABLE IF EXISTS `Zones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Zones` (
  `ZoneId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Zone_name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `Status` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  PRIMARY KEY (`ZoneId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Zones`
--

LOCK TABLES `Zones` WRITE;
/*!40000 ALTER TABLE `Zones` DISABLE KEYS */;
INSERT INTO `Zones` VALUES ('Ham001','Colombo','Active'),('Z001','Ratnapura','Active');
/*!40000 ALTER TABLE `Zones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `__EFMigrationsHistory`
--

DROP TABLE IF EXISTS `__EFMigrationsHistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `__EFMigrationsHistory` (
  `MigrationId` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ProductVersion` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`MigrationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `__EFMigrationsHistory`
--

LOCK TABLES `__EFMigrationsHistory` WRITE;
/*!40000 ALTER TABLE `__EFMigrationsHistory` DISABLE KEYS */;
INSERT INTO `__EFMigrationsHistory` VALUES ('20240315181606_initial','8.0.3'),('20240315204121_initialAll','8.0.3'),('20240322094942_updateuserfull','8.0.3');
/*!40000 ALTER TABLE `__EFMigrationsHistory` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-06  4:04:24
ss
