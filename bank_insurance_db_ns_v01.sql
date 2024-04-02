-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: bank_insurance_db_ns_v01
-- ------------------------------------------------------
-- Server version	8.0.36

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `__efmigrationshistory`
--

DROP TABLE IF EXISTS `__efmigrationshistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `__efmigrationshistory` (
  `MigrationId` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `ProductVersion` varchar(32) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`MigrationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `__efmigrationshistory`
--

LOCK TABLES `__efmigrationshistory` WRITE;
/*!40000 ALTER TABLE `__efmigrationshistory` DISABLE KEYS */;
INSERT INTO `__efmigrationshistory` VALUES ('20240315181606_initial','8.0.3'),('20240315204121_initialAll','8.0.3'),('20240322094942_updateuserfull','8.0.3');
/*!40000 ALTER TABLE `__efmigrationshistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aspnetroleclaims`
--

DROP TABLE IF EXISTS `aspnetroleclaims`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aspnetroleclaims` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `RoleId` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `ClaimType` longtext COLLATE utf8mb4_general_ci,
  `ClaimValue` longtext COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`Id`),
  KEY `IX_AspNetRoleClaims_RoleId` (`RoleId`),
  CONSTRAINT `FK_AspNetRoleClaims_AspNetRoles_RoleId` FOREIGN KEY (`RoleId`) REFERENCES `aspnetroles` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aspnetroleclaims`
--

LOCK TABLES `aspnetroleclaims` WRITE;
/*!40000 ALTER TABLE `aspnetroleclaims` DISABLE KEYS */;
/*!40000 ALTER TABLE `aspnetroleclaims` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aspnetroles`
--

DROP TABLE IF EXISTS `aspnetroles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aspnetroles` (
  `Id` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `Name` varchar(256) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `NormalizedName` varchar(256) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ConcurrencyStamp` longtext COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `RoleNameIndex` (`NormalizedName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aspnetroles`
--

LOCK TABLES `aspnetroles` WRITE;
/*!40000 ALTER TABLE `aspnetroles` DISABLE KEYS */;
INSERT INTO `aspnetroles` VALUES ('cd14e372-0ddd-4b5d-80ba-f5556483e35f','Admin','ADMIN',NULL),('d974e5c4-a799-49e5-83e9-0a2082247f6c','User','USER',NULL);
/*!40000 ALTER TABLE `aspnetroles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aspnetuserclaims`
--

DROP TABLE IF EXISTS `aspnetuserclaims`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aspnetuserclaims` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `UserId` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `ClaimType` longtext COLLATE utf8mb4_general_ci,
  `ClaimValue` longtext COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`Id`),
  KEY `IX_AspNetUserClaims_UserId` (`UserId`),
  CONSTRAINT `FK_AspNetUserClaims_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `aspnetusers` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aspnetuserclaims`
--

LOCK TABLES `aspnetuserclaims` WRITE;
/*!40000 ALTER TABLE `aspnetuserclaims` DISABLE KEYS */;
/*!40000 ALTER TABLE `aspnetuserclaims` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aspnetuserlogins`
--

DROP TABLE IF EXISTS `aspnetuserlogins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aspnetuserlogins` (
  `LoginProvider` varchar(128) COLLATE utf8mb4_general_ci NOT NULL,
  `ProviderKey` varchar(128) COLLATE utf8mb4_general_ci NOT NULL,
  `ProviderDisplayName` longtext COLLATE utf8mb4_general_ci,
  `UserId` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`LoginProvider`,`ProviderKey`),
  KEY `IX_AspNetUserLogins_UserId` (`UserId`),
  CONSTRAINT `FK_AspNetUserLogins_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `aspnetusers` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aspnetuserlogins`
--

LOCK TABLES `aspnetuserlogins` WRITE;
/*!40000 ALTER TABLE `aspnetuserlogins` DISABLE KEYS */;
/*!40000 ALTER TABLE `aspnetuserlogins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aspnetuserroles`
--

DROP TABLE IF EXISTS `aspnetuserroles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aspnetuserroles` (
  `UserId` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `RoleId` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`UserId`,`RoleId`),
  KEY `IX_AspNetUserRoles_RoleId` (`RoleId`),
  CONSTRAINT `FK_AspNetUserRoles_AspNetRoles_RoleId` FOREIGN KEY (`RoleId`) REFERENCES `aspnetroles` (`Id`) ON DELETE CASCADE,
  CONSTRAINT `FK_AspNetUserRoles_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `aspnetusers` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aspnetuserroles`
--

LOCK TABLES `aspnetuserroles` WRITE;
/*!40000 ALTER TABLE `aspnetuserroles` DISABLE KEYS */;
INSERT INTO `aspnetuserroles` VALUES ('49573782-f7d4-4510-8a27-07d3210ccf0d','cd14e372-0ddd-4b5d-80ba-f5556483e35f'),('936a9cc4-8e3f-49d6-98e0-77c930ec213b','d974e5c4-a799-49e5-83e9-0a2082247f6c');
/*!40000 ALTER TABLE `aspnetuserroles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aspnetusers`
--

DROP TABLE IF EXISTS `aspnetusers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aspnetusers` (
  `Id` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `Discriminator` varchar(21) COLLATE utf8mb4_general_ci NOT NULL,
  `FullName` longtext COLLATE utf8mb4_general_ci,
  `Profession` longtext COLLATE utf8mb4_general_ci,
  `DOB` date DEFAULT NULL,
  `NicNo` longtext COLLATE utf8mb4_general_ci,
  `Address` longtext COLLATE utf8mb4_general_ci,
  `UserName` varchar(256) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `NormalizedUserName` varchar(256) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Email` varchar(256) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `NormalizedEmail` varchar(256) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EmailConfirmed` tinyint(1) NOT NULL,
  `PasswordHash` longtext COLLATE utf8mb4_general_ci,
  `SecurityStamp` longtext COLLATE utf8mb4_general_ci,
  `ConcurrencyStamp` longtext COLLATE utf8mb4_general_ci,
  `PhoneNumber` longtext COLLATE utf8mb4_general_ci,
  `PhoneNumberConfirmed` tinyint(1) NOT NULL,
  `TwoFactorEnabled` tinyint(1) NOT NULL,
  `LockoutEnd` datetime(6) DEFAULT NULL,
  `LockoutEnabled` tinyint(1) NOT NULL,
  `AccessFailedCount` int NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UserNameIndex` (`NormalizedUserName`),
  KEY `EmailIndex` (`NormalizedEmail`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aspnetusers`
--

LOCK TABLES `aspnetusers` WRITE;
/*!40000 ALTER TABLE `aspnetusers` DISABLE KEYS */;
INSERT INTO `aspnetusers` VALUES ('49573782-f7d4-4510-8a27-07d3210ccf0d','ApplicationUser','DefaultAdmin','Admin','2024-03-23','123456789V','Default Admin','defaultadmin@gmail.com','DEFAULTADMIN@GMAIL.COM','defaultadmin@gmail.com','DEFAULTADMIN@GMAIL.COM',0,'AQAAAAIAAYagAAAAECI9EYX2BYHCQOLD8D1ZLJZ9PUtbVd0/mIAc/UWhKCstWXenJfzdyIkCuF18Cm/BKA==','KVMZW6KK6CLDJOAB2UN5S5JF3CPF2BNM','816de0b1-237c-437e-a6bb-6633de3f89d2',NULL,0,0,NULL,1,0),('936a9cc4-8e3f-49d6-98e0-77c930ec213b','ApplicationUser','DefaultUser','User','2024-03-23','123456789v','Default User','defaultuser@gmail','DEFAULTUSER@GMAIL','defaultuser@gmail','DEFAULTUSER@GMAIL',0,'AQAAAAIAAYagAAAAEPpjVNNFNrMLguS34iMIYfTTVFFbtoBAyZ1n47M7LZBOvKEdPMiX1FNhtFSG/q+DjA==','TS3762ZAWSPXN24B4VMRLM5TZBB3MZLJ','b0cc4387-d827-4fcb-9d89-7bd6987f3575',NULL,0,0,NULL,1,0);
/*!40000 ALTER TABLE `aspnetusers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aspnetusertokens`
--

DROP TABLE IF EXISTS `aspnetusertokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aspnetusertokens` (
  `UserId` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `LoginProvider` varchar(128) COLLATE utf8mb4_general_ci NOT NULL,
  `Name` varchar(128) COLLATE utf8mb4_general_ci NOT NULL,
  `Value` longtext COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`UserId`,`LoginProvider`,`Name`),
  CONSTRAINT `FK_AspNetUserTokens_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `aspnetusers` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aspnetusertokens`
--

LOCK TABLES `aspnetusertokens` WRITE;
/*!40000 ALTER TABLE `aspnetusertokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `aspnetusertokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bankinginsuarancecompenstaions`
--

DROP TABLE IF EXISTS `bankinginsuarancecompenstaions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bankinginsuarancecompenstaions` (
  `BankingInsuaranceCompenstaionID` int NOT NULL AUTO_INCREMENT,
  `Value` double NOT NULL,
  `Data` date NOT NULL,
  `Comment` longtext COLLATE utf8mb4_general_ci,
  `PolicyNo` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`BankingInsuaranceCompenstaionID`),
  KEY `IX_BankingInsuaranceCompenstaions_PolicyNo` (`PolicyNo`),
  CONSTRAINT `FK_BankingInsuaranceCompenstaions_BankingInsuarances_PolicyNo` FOREIGN KEY (`PolicyNo`) REFERENCES `bankinginsuarances` (`PolicyNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bankinginsuarancecompenstaions`
--

LOCK TABLES `bankinginsuarancecompenstaions` WRITE;
/*!40000 ALTER TABLE `bankinginsuarancecompenstaions` DISABLE KEYS */;
/*!40000 ALTER TABLE `bankinginsuarancecompenstaions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bankinginsuarancedatas`
--

DROP TABLE IF EXISTS `bankinginsuarancedatas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bankinginsuarancedatas` (
  `DataId` int NOT NULL AUTO_INCREMENT,
  `Date` date NOT NULL,
  `Amount` double NOT NULL,
  `PolicyNo` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`DataId`),
  KEY `IX_BankingInsuaranceDatas_PolicyNo` (`PolicyNo`),
  CONSTRAINT `FK_BankingInsuaranceDatas_BankingInsuarances_PolicyNo` FOREIGN KEY (`PolicyNo`) REFERENCES `bankinginsuarances` (`PolicyNo`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bankinginsuarancedatas`
--

LOCK TABLES `bankinginsuarancedatas` WRITE;
/*!40000 ALTER TABLE `bankinginsuarancedatas` DISABLE KEYS */;
INSERT INTO `bankinginsuarancedatas` VALUES (7,'2024-03-24',500,'Poilicy-banking-BR001');
/*!40000 ALTER TABLE `bankinginsuarancedatas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bankinginsuarances`
--

DROP TABLE IF EXISTS `bankinginsuarances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bankinginsuarances` (
  `PolicyNo` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `InsuranceId` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`PolicyNo`),
  KEY `IX_BankingInsuarances_InsuranceId` (`InsuranceId`),
  CONSTRAINT `FK_BankingInsuarances_Insuarances_InsuranceId` FOREIGN KEY (`InsuranceId`) REFERENCES `insuarances` (`InsuranceId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bankinginsuarances`
--

LOCK TABLES `bankinginsuarances` WRITE;
/*!40000 ALTER TABLE `bankinginsuarances` DISABLE KEYS */;
INSERT INTO `bankinginsuarances` VALUES ('Poilicy-banking-BR001','insuarance-002_BR001');
/*!40000 ALTER TABLE `bankinginsuarances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `branches`
--

DROP TABLE IF EXISTS `branches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `branches` (
  `BranchId` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `Branch_name` longtext COLLATE utf8mb4_general_ci,
  `Address` longtext COLLATE utf8mb4_general_ci,
  `TpNo` longtext COLLATE utf8mb4_general_ci,
  `City` longtext COLLATE utf8mb4_general_ci,
  `ZoneId` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`BranchId`),
  KEY `IX_Branches_ZoneId` (`ZoneId`),
  CONSTRAINT `FK_Branches_Zones_ZoneId` FOREIGN KEY (`ZoneId`) REFERENCES `zones` (`ZoneId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branches`
--

LOCK TABLES `branches` WRITE;
/*!40000 ALTER TABLE `branches` DISABLE KEYS */;
INSERT INTO `branches` VALUES ('BR001','Branch 01','BR001','0000000000','BR001','Z001'),('BR002','Branch 02','BR002','0000000000','BR002','Z001'),('BR003','නැනෝසොෆ්ට්','BR003','0000000000','BR003','Z001');
/*!40000 ALTER TABLE `branches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `buildiinginsurancecompenstaions`
--

DROP TABLE IF EXISTS `buildiinginsurancecompenstaions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `buildiinginsurancecompenstaions` (
  `BuildiingInsuranceCompenstaionID` int NOT NULL AUTO_INCREMENT,
  `Value` double NOT NULL,
  `Data` date NOT NULL,
  `Comment` longtext COLLATE utf8mb4_general_ci,
  `PolicyNo` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`BuildiingInsuranceCompenstaionID`),
  KEY `IX_BuildiingInsuranceCompenstaions_PolicyNo` (`PolicyNo`),
  CONSTRAINT `FK_BuildiingInsuranceCompenstaions_BuildingInsuarances_PolicyNo` FOREIGN KEY (`PolicyNo`) REFERENCES `buildinginsuarances` (`PolicyNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buildiinginsurancecompenstaions`
--

LOCK TABLES `buildiinginsurancecompenstaions` WRITE;
/*!40000 ALTER TABLE `buildiinginsurancecompenstaions` DISABLE KEYS */;
/*!40000 ALTER TABLE `buildiinginsurancecompenstaions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `buildinginsuarancedatas`
--

DROP TABLE IF EXISTS `buildinginsuarancedatas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `buildinginsuarancedatas` (
  `DataId` int NOT NULL AUTO_INCREMENT,
  `Date` date NOT NULL,
  `Amount` double NOT NULL,
  `PolicyNo` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`DataId`),
  KEY `IX_BuildingInsuaranceDatas_PolicyNo` (`PolicyNo`),
  CONSTRAINT `FK_BuildingInsuaranceDatas_BuildingInsuarances_PolicyNo` FOREIGN KEY (`PolicyNo`) REFERENCES `buildinginsuarances` (`PolicyNo`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buildinginsuarancedatas`
--

LOCK TABLES `buildinginsuarancedatas` WRITE;
/*!40000 ALTER TABLE `buildinginsuarancedatas` DISABLE KEYS */;
INSERT INTO `buildinginsuarancedatas` VALUES (7,'2024-03-24',0,'Poilicy-building-BR001');
/*!40000 ALTER TABLE `buildinginsuarancedatas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `buildinginsuarances`
--

DROP TABLE IF EXISTS `buildinginsuarances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `buildinginsuarances` (
  `PolicyNo` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `InsuranceId` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`PolicyNo`),
  KEY `IX_BuildingInsuarances_InsuranceId` (`InsuranceId`),
  CONSTRAINT `FK_BuildingInsuarances_Insuarances_InsuranceId` FOREIGN KEY (`InsuranceId`) REFERENCES `insuarances` (`InsuranceId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buildinginsuarances`
--

LOCK TABLES `buildinginsuarances` WRITE;
/*!40000 ALTER TABLE `buildinginsuarances` DISABLE KEYS */;
INSERT INTO `buildinginsuarances` VALUES ('Poilicy-building-BR001','insuarance-003_BR001');
/*!40000 ALTER TABLE `buildinginsuarances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `divisaranaabhiperanas`
--

DROP TABLE IF EXISTS `divisaranaabhiperanas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `divisaranaabhiperanas` (
  `DataId` int NOT NULL AUTO_INCREMENT,
  `Month` longtext COLLATE utf8mb4_general_ci,
  `Amount` double DEFAULT NULL,
  `Comment` longtext COLLATE utf8mb4_general_ci,
  `BranchId` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`DataId`),
  KEY `IX_DivisaranaAbhiperanas_BranchId` (`BranchId`),
  CONSTRAINT `FK_DivisaranaAbhiperanas_Branches_BranchId` FOREIGN KEY (`BranchId`) REFERENCES `branches` (`BranchId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `divisaranaabhiperanas`
--

LOCK TABLES `divisaranaabhiperanas` WRITE;
/*!40000 ALTER TABLE `divisaranaabhiperanas` DISABLE KEYS */;
/*!40000 ALTER TABLE `divisaranaabhiperanas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `divisaranacircledates`
--

DROP TABLE IF EXISTS `divisaranacircledates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `divisaranacircledates` (
  `CircleId` int NOT NULL AUTO_INCREMENT,
  `BranchId` longtext COLLATE utf8mb4_general_ci,
  `Fullname` longtext COLLATE utf8mb4_general_ci,
  `TimePeriod` int NOT NULL,
  `AddmissionFee` double NOT NULL,
  `TotalAmount` double NOT NULL,
  `DueAmount` double DEFAULT NULL,
  `StartDate` date NOT NULL,
  `NextExecuteDate` date NOT NULL,
  `RecoveryAmount` double NOT NULL,
  `CustomerPolicyNo` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`CircleId`),
  KEY `IX_DivisaranaCircleDates_CustomerPolicyNo` (`CustomerPolicyNo`),
  CONSTRAINT `FK_DivisaranaCircleDates_DivisaranaDatas_CustomerPolicyNo` FOREIGN KEY (`CustomerPolicyNo`) REFERENCES `divisaranadatas` (`CustomerPolicyNo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `divisaranacircledates`
--

LOCK TABLES `divisaranacircledates` WRITE;
/*!40000 ALTER TABLE `divisaranacircledates` DISABLE KEYS */;
INSERT INTO `divisaranacircledates` VALUES (2,'BR001','Maduka Vinod',1,1000,600,550,'2024-03-24','2024-05-24',50,'Divi-123456789V');
/*!40000 ALTER TABLE `divisaranacircledates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `divisaranacompensations`
--

DROP TABLE IF EXISTS `divisaranacompensations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `divisaranacompensations` (
  `CompensationId` int NOT NULL AUTO_INCREMENT,
  `MemberName` longtext COLLATE utf8mb4_general_ci,
  `BranchId` longtext COLLATE utf8mb4_general_ci,
  `DivisaranaNo` longtext COLLATE utf8mb4_general_ci,
  `DeathPersonName` longtext COLLATE utf8mb4_general_ci,
  `HospitalizedPerson` longtext COLLATE utf8mb4_general_ci,
  `DeathDate` date NOT NULL,
  `DischargeDate` date NOT NULL,
  `Realtion` longtext COLLATE utf8mb4_general_ci,
  `Hospital` longtext COLLATE utf8mb4_general_ci,
  `Diseases` longtext COLLATE utf8mb4_general_ci,
  `Surgery` longtext COLLATE utf8mb4_general_ci,
  `CompensationValue` double DEFAULT NULL,
  `Reason` longtext COLLATE utf8mb4_general_ci,
  `CustomerPolicyNo` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`CompensationId`),
  KEY `IX_DivisaranaCompensations_CustomerPolicyNo` (`CustomerPolicyNo`),
  CONSTRAINT `FK_DivisaranaCompensations_DivisaranaDatas_CustomerPolicyNo` FOREIGN KEY (`CustomerPolicyNo`) REFERENCES `divisaranadatas` (`CustomerPolicyNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `divisaranacompensations`
--

LOCK TABLES `divisaranacompensations` WRITE;
/*!40000 ALTER TABLE `divisaranacompensations` DISABLE KEYS */;
/*!40000 ALTER TABLE `divisaranacompensations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `divisaranadatas`
--

DROP TABLE IF EXISTS `divisaranadatas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `divisaranadatas` (
  `CustomerPolicyNo` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `Fullname` longtext COLLATE utf8mb4_general_ci,
  `Address` longtext COLLATE utf8mb4_general_ci,
  `ID` longtext COLLATE utf8mb4_general_ci,
  `BankMemberNo` longtext COLLATE utf8mb4_general_ci,
  `DOB` date NOT NULL,
  `Job` longtext COLLATE utf8mb4_general_ci,
  `Succssor` longtext COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`CustomerPolicyNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `divisaranadatas`
--

LOCK TABLES `divisaranadatas` WRITE;
/*!40000 ALTER TABLE `divisaranadatas` DISABLE KEYS */;
INSERT INTO `divisaranadatas` VALUES ('Divi-123456789V','Maduka Vinod','Aranayake','123456789V','BMN 01','2024-03-24','SE','Shen');
/*!40000 ALTER TABLE `divisaranadatas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `divisaranaparithoshithas`
--

DROP TABLE IF EXISTS `divisaranaparithoshithas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `divisaranaparithoshithas` (
  `DataId` int NOT NULL AUTO_INCREMENT,
  `Name` longtext COLLATE utf8mb4_general_ci,
  `MemberNo` longtext COLLATE utf8mb4_general_ci,
  `Amount` double DEFAULT NULL,
  `Comment` longtext COLLATE utf8mb4_general_ci,
  `BranchId` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`DataId`),
  KEY `IX_DivisaranaParithoshithas_BranchId` (`BranchId`),
  CONSTRAINT `FK_DivisaranaParithoshithas_Branches_BranchId` FOREIGN KEY (`BranchId`) REFERENCES `branches` (`BranchId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `divisaranaparithoshithas`
--

LOCK TABLES `divisaranaparithoshithas` WRITE;
/*!40000 ALTER TABLE `divisaranaparithoshithas` DISABLE KEYS */;
/*!40000 ALTER TABLE `divisaranaparithoshithas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `divisaranapayments`
--

DROP TABLE IF EXISTS `divisaranapayments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `divisaranapayments` (
  `PaymentId` int NOT NULL AUTO_INCREMENT,
  `BranchId` longtext COLLATE utf8mb4_general_ci,
  `Fullname` longtext COLLATE utf8mb4_general_ci,
  `PaymentDate` date NOT NULL,
  `SystemDate` date NOT NULL,
  `PaymentValue` double DEFAULT NULL,
  `RunningBalance` double DEFAULT NULL,
  `CustomerPolicyNo` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`PaymentId`),
  KEY `IX_DivisaranaPayments_CustomerPolicyNo` (`CustomerPolicyNo`),
  CONSTRAINT `FK_DivisaranaPayments_DivisaranaDatas_CustomerPolicyNo` FOREIGN KEY (`CustomerPolicyNo`) REFERENCES `divisaranadatas` (`CustomerPolicyNo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `divisaranapayments`
--

LOCK TABLES `divisaranapayments` WRITE;
/*!40000 ALTER TABLE `divisaranapayments` DISABLE KEYS */;
INSERT INTO `divisaranapayments` VALUES (2,'BR001','Maduka Vinod','2024-04-24','2024-03-24',50,NULL,'Divi-123456789V');
/*!40000 ALTER TABLE `divisaranapayments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `divisaranasuccssors`
--

DROP TABLE IF EXISTS `divisaranasuccssors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `divisaranasuccssors` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `SuccsorName` longtext COLLATE utf8mb4_general_ci,
  `SuccssorDob` date NOT NULL,
  `Age` int NOT NULL,
  `Relationship` longtext COLLATE utf8mb4_general_ci,
  `CustomerPolicyNo` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `IX_DivisaranaSuccssors_CustomerPolicyNo` (`CustomerPolicyNo`),
  CONSTRAINT `FK_DivisaranaSuccssors_DivisaranaDatas_CustomerPolicyNo` FOREIGN KEY (`CustomerPolicyNo`) REFERENCES `divisaranadatas` (`CustomerPolicyNo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `divisaranasuccssors`
--

LOCK TABLES `divisaranasuccssors` WRITE;
/*!40000 ALTER TABLE `divisaranasuccssors` DISABLE KEYS */;
INSERT INTO `divisaranasuccssors` VALUES (2,'Shean','2024-03-24',15,'son','Divi-123456789V'),(3,'Shefgdfg','2024-03-24',19,'son','Divi-123456789V');
/*!40000 ALTER TABLE `divisaranasuccssors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `divisaranatbls`
--

DROP TABLE IF EXISTS `divisaranatbls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `divisaranatbls` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `PolicyNo` longtext COLLATE utf8mb4_general_ci,
  `InsuranceId` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CustomerPolicyNo` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `IX_DivisaranaTbls_CustomerPolicyNo` (`CustomerPolicyNo`),
  KEY `IX_DivisaranaTbls_InsuranceId` (`InsuranceId`),
  CONSTRAINT `FK_DivisaranaTbls_DivisaranaDatas_CustomerPolicyNo` FOREIGN KEY (`CustomerPolicyNo`) REFERENCES `divisaranadatas` (`CustomerPolicyNo`),
  CONSTRAINT `FK_DivisaranaTbls_Insuarances_InsuranceId` FOREIGN KEY (`InsuranceId`) REFERENCES `insuarances` (`InsuranceId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `divisaranatbls`
--

LOCK TABLES `divisaranatbls` WRITE;
/*!40000 ALTER TABLE `divisaranatbls` DISABLE KEYS */;
INSERT INTO `divisaranatbls` VALUES (2,'Poilicy-divi-BR001','insuarance-007_BR001','Divi-123456789V');
/*!40000 ALTER TABLE `divisaranatbls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `healthinsuarancedatas`
--

DROP TABLE IF EXISTS `healthinsuarancedatas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `healthinsuarancedatas` (
  `DataId` int NOT NULL AUTO_INCREMENT,
  `Date` date NOT NULL,
  `Amount` double NOT NULL,
  `PolicyNo` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`DataId`),
  KEY `IX_HealthInsuaranceDatas_PolicyNo` (`PolicyNo`),
  CONSTRAINT `FK_HealthInsuaranceDatas_HealthInsuarances_PolicyNo` FOREIGN KEY (`PolicyNo`) REFERENCES `healthinsuarances` (`PolicyNo`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `healthinsuarancedatas`
--

LOCK TABLES `healthinsuarancedatas` WRITE;
/*!40000 ALTER TABLE `healthinsuarancedatas` DISABLE KEYS */;
INSERT INTO `healthinsuarancedatas` VALUES (7,'2024-03-24',300,'Poilicy-health-BR001');
/*!40000 ALTER TABLE `healthinsuarancedatas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `healthinsuarances`
--

DROP TABLE IF EXISTS `healthinsuarances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `healthinsuarances` (
  `PolicyNo` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `InsuranceId` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`PolicyNo`),
  KEY `IX_HealthInsuarances_InsuranceId` (`InsuranceId`),
  CONSTRAINT `FK_HealthInsuarances_Insuarances_InsuranceId` FOREIGN KEY (`InsuranceId`) REFERENCES `insuarances` (`InsuranceId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `healthinsuarances`
--

LOCK TABLES `healthinsuarances` WRITE;
/*!40000 ALTER TABLE `healthinsuarances` DISABLE KEYS */;
INSERT INTO `healthinsuarances` VALUES ('Poilicy-health-BR001','insuarance-004_BR001');
/*!40000 ALTER TABLE `healthinsuarances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `healthinsurancecompenstaions`
--

DROP TABLE IF EXISTS `healthinsurancecompenstaions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `healthinsurancecompenstaions` (
  `HealthInsuranceCompenstaionID` int NOT NULL AUTO_INCREMENT,
  `Value` double NOT NULL,
  `Data` date NOT NULL,
  `Comment` longtext COLLATE utf8mb4_general_ci,
  `PolicyNo` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`HealthInsuranceCompenstaionID`),
  KEY `IX_HealthInsuranceCompenstaions_PolicyNo` (`PolicyNo`),
  CONSTRAINT `FK_HealthInsuranceCompenstaions_HealthInsuarances_PolicyNo` FOREIGN KEY (`PolicyNo`) REFERENCES `healthinsuarances` (`PolicyNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `healthinsurancecompenstaions`
--

LOCK TABLES `healthinsurancecompenstaions` WRITE;
/*!40000 ALTER TABLE `healthinsurancecompenstaions` DISABLE KEYS */;
/*!40000 ALTER TABLE `healthinsurancecompenstaions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `insuarances`
--

DROP TABLE IF EXISTS `insuarances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `insuarances` (
  `InsuranceId` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `StartDate` longtext COLLATE utf8mb4_general_ci,
  `PolicyNo` longtext COLLATE utf8mb4_general_ci,
  `InsuranceProductID` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `BranchId` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`InsuranceId`),
  KEY `IX_Insuarances_BranchId` (`BranchId`),
  KEY `IX_Insuarances_InsuranceProductID` (`InsuranceProductID`),
  CONSTRAINT `FK_Insuarances_Branches_BranchId` FOREIGN KEY (`BranchId`) REFERENCES `branches` (`BranchId`),
  CONSTRAINT `FK_Insuarances_InsuranceProducts_InsuranceProductID` FOREIGN KEY (`InsuranceProductID`) REFERENCES `insuranceproducts` (`InsuranceProductID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `insuarances`
--

LOCK TABLES `insuarances` WRITE;
/*!40000 ALTER TABLE `insuarances` DISABLE KEYS */;
INSERT INTO `insuarances` VALUES ('insuarance-001_BR001','2024-01-01','Poilicy-saving-BR001','Product-001','BR001'),('insuarance-002_BR001','2024-01-01','Poilicy-banking-BR001','Product-002','BR001'),('insuarance-003_BR001','2024-01-01','Poilicy-building-BR001','Product-003','BR001'),('insuarance-004_BR001','2024-01-01','Poilicy-health-BR001','Product-004','BR001'),('insuarance-005_BR001','2024-01-01','Poilicy-Treasuary-BR001','Product-005','BR001'),('insuarance-007_BR001','2024-01-01','Poilicy-divi-BR001','Product-006','BR001');
/*!40000 ALTER TABLE `insuarances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `insuranceproducts`
--

DROP TABLE IF EXISTS `insuranceproducts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `insuranceproducts` (
  `InsuranceProductID` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `InsuranceProductName` longtext COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`InsuranceProductID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `insuranceproducts`
--

LOCK TABLES `insuranceproducts` WRITE;
/*!40000 ALTER TABLE `insuranceproducts` DISABLE KEYS */;
INSERT INTO `insuranceproducts` VALUES ('Product-001','Product-One'),('Product-002','Product-two'),('Product-003','Product-three'),('Product-004','Product-four'),('Product-005','Product-five'),('Product-006','Product-six');
/*!40000 ALTER TABLE `insuranceproducts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loancompenstaions`
--

DROP TABLE IF EXISTS `loancompenstaions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loancompenstaions` (
  `LoanCompenstaionID` int NOT NULL AUTO_INCREMENT,
  `FullName` longtext COLLATE utf8mb4_general_ci,
  `BranchId` longtext COLLATE utf8mb4_general_ci,
  `Value` double NOT NULL,
  `CompenstaionValue` double NOT NULL,
  `Requirement` longtext COLLATE utf8mb4_general_ci,
  `Comment` longtext COLLATE utf8mb4_general_ci,
  `Date` date NOT NULL,
  `CustomerPolicyNo` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`LoanCompenstaionID`),
  KEY `IX_LoanCompenstaions_CustomerPolicyNo` (`CustomerPolicyNo`),
  CONSTRAINT `FK_LoanCompenstaions_LoanCustomers_CustomerPolicyNo` FOREIGN KEY (`CustomerPolicyNo`) REFERENCES `loancustomers` (`CustomerPolicyNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loancompenstaions`
--

LOCK TABLES `loancompenstaions` WRITE;
/*!40000 ALTER TABLE `loancompenstaions` DISABLE KEYS */;
/*!40000 ALTER TABLE `loancompenstaions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loancustomers`
--

DROP TABLE IF EXISTS `loancustomers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loancustomers` (
  `CustomerPolicyNo` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `CustomerName` longtext COLLATE utf8mb4_general_ci,
  `ID` longtext COLLATE utf8mb4_general_ci,
  `Address` longtext COLLATE utf8mb4_general_ci,
  `ProjectName` longtext COLLATE utf8mb4_general_ci,
  `LoanIssueDate` date NOT NULL,
  `LoanEndDate` date NOT NULL,
  `TeamNo` longtext COLLATE utf8mb4_general_ci,
  `LoanValue` double NOT NULL,
  PRIMARY KEY (`CustomerPolicyNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loancustomers`
--

LOCK TABLES `loancustomers` WRITE;
/*!40000 ALTER TABLE `loancustomers` DISABLE KEYS */;
/*!40000 ALTER TABLE `loancustomers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loanpayments`
--

DROP TABLE IF EXISTS `loanpayments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loanpayments` (
  `PaymentId` int NOT NULL AUTO_INCREMENT,
  `PaymentDate` date NOT NULL,
  `Paymentvalue` double NOT NULL,
  `CustomerPolicyNo` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`PaymentId`),
  KEY `IX_LoanPayments_CustomerPolicyNo` (`CustomerPolicyNo`),
  CONSTRAINT `FK_LoanPayments_LoanCustomers_CustomerPolicyNo` FOREIGN KEY (`CustomerPolicyNo`) REFERENCES `loancustomers` (`CustomerPolicyNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loanpayments`
--

LOCK TABLES `loanpayments` WRITE;
/*!40000 ALTER TABLE `loanpayments` DISABLE KEYS */;
/*!40000 ALTER TABLE `loanpayments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loantbls`
--

DROP TABLE IF EXISTS `loantbls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loantbls` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `PolicyNo` longtext COLLATE utf8mb4_general_ci,
  `InsuranceId` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CustomerPolicyNo` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `IX_LoanTbls_CustomerPolicyNo` (`CustomerPolicyNo`),
  KEY `IX_LoanTbls_InsuranceId` (`InsuranceId`),
  CONSTRAINT `FK_LoanTbls_Insuarances_InsuranceId` FOREIGN KEY (`InsuranceId`) REFERENCES `insuarances` (`InsuranceId`),
  CONSTRAINT `FK_LoanTbls_LoanCustomers_CustomerPolicyNo` FOREIGN KEY (`CustomerPolicyNo`) REFERENCES `loancustomers` (`CustomerPolicyNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loantbls`
--

LOCK TABLES `loantbls` WRITE;
/*!40000 ALTER TABLE `loantbls` DISABLE KEYS */;
/*!40000 ALTER TABLE `loantbls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `savingreliefcompensations`
--

DROP TABLE IF EXISTS `savingreliefcompensations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `savingreliefcompensations` (
  `MemberId` int NOT NULL AUTO_INCREMENT,
  `MemberName` longtext COLLATE utf8mb4_general_ci,
  `MemberAddress` longtext COLLATE utf8mb4_general_ci,
  `DeathpersonName` longtext COLLATE utf8mb4_general_ci,
  `Reason` longtext COLLATE utf8mb4_general_ci,
  `Realtion` longtext COLLATE utf8mb4_general_ci,
  `ReasonDate` date NOT NULL,
  `CompensationValue` double NOT NULL,
  `RemainingBalanece` double NOT NULL,
  `Schoolname` longtext COLLATE utf8mb4_general_ci,
  `Studentname` longtext COLLATE utf8mb4_general_ci,
  `Universityname` longtext COLLATE utf8mb4_general_ci,
  `PolicyNo` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`MemberId`),
  KEY `IX_SavingReliefCompensations_PolicyNo` (`PolicyNo`),
  CONSTRAINT `FK_SavingReliefCompensations_SavingReliefs_PolicyNo` FOREIGN KEY (`PolicyNo`) REFERENCES `savingreliefs` (`PolicyNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `savingreliefcompensations`
--

LOCK TABLES `savingreliefcompensations` WRITE;
/*!40000 ALTER TABLE `savingreliefcompensations` DISABLE KEYS */;
/*!40000 ALTER TABLE `savingreliefcompensations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `savingreliefdatas`
--

DROP TABLE IF EXISTS `savingreliefdatas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `savingreliefdatas` (
  `DataId` int NOT NULL AUTO_INCREMENT,
  `Date` date NOT NULL,
  `Amount` double NOT NULL,
  `PolicyNo` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`DataId`),
  KEY `IX_SavingReliefDatas_PolicyNo` (`PolicyNo`),
  CONSTRAINT `FK_SavingReliefDatas_SavingReliefs_PolicyNo` FOREIGN KEY (`PolicyNo`) REFERENCES `savingreliefs` (`PolicyNo`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `savingreliefdatas`
--

LOCK TABLES `savingreliefdatas` WRITE;
/*!40000 ALTER TABLE `savingreliefdatas` DISABLE KEYS */;
INSERT INTO `savingreliefdatas` VALUES (7,'2024-03-24',700,'Poilicy-saving-BR001');
/*!40000 ALTER TABLE `savingreliefdatas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `savingreliefparithoshithas`
--

DROP TABLE IF EXISTS `savingreliefparithoshithas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `savingreliefparithoshithas` (
  `DataId` int NOT NULL AUTO_INCREMENT,
  `Name` longtext COLLATE utf8mb4_general_ci,
  `MemberNo` longtext COLLATE utf8mb4_general_ci,
  `Amount` double DEFAULT NULL,
  `Comment` longtext COLLATE utf8mb4_general_ci,
  `BranchId` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`DataId`),
  KEY `IX_SavingReliefParithoshithas_BranchId` (`BranchId`),
  CONSTRAINT `FK_SavingReliefParithoshithas_Branches_BranchId` FOREIGN KEY (`BranchId`) REFERENCES `branches` (`BranchId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `savingreliefparithoshithas`
--

LOCK TABLES `savingreliefparithoshithas` WRITE;
/*!40000 ALTER TABLE `savingreliefparithoshithas` DISABLE KEYS */;
/*!40000 ALTER TABLE `savingreliefparithoshithas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `savingreliefs`
--

DROP TABLE IF EXISTS `savingreliefs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `savingreliefs` (
  `PolicyNo` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `InsuranceId` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`PolicyNo`),
  UNIQUE KEY `IX_SavingReliefs_InsuranceId` (`InsuranceId`),
  CONSTRAINT `FK_SavingReliefs_Insuarances_InsuranceId` FOREIGN KEY (`InsuranceId`) REFERENCES `insuarances` (`InsuranceId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `savingreliefs`
--

LOCK TABLES `savingreliefs` WRITE;
/*!40000 ALTER TABLE `savingreliefs` DISABLE KEYS */;
INSERT INTO `savingreliefs` VALUES ('Poilicy-saving-BR001','insuarance-001_BR001');
/*!40000 ALTER TABLE `savingreliefs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `treasuaries`
--

DROP TABLE IF EXISTS `treasuaries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `treasuaries` (
  `PolicyNo` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `InsuranceId` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`PolicyNo`),
  KEY `IX_Treasuaries_InsuranceId` (`InsuranceId`),
  CONSTRAINT `FK_Treasuaries_Insuarances_InsuranceId` FOREIGN KEY (`InsuranceId`) REFERENCES `insuarances` (`InsuranceId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `treasuaries`
--

LOCK TABLES `treasuaries` WRITE;
/*!40000 ALTER TABLE `treasuaries` DISABLE KEYS */;
INSERT INTO `treasuaries` VALUES ('Poilicy-Treasuary-BR001','insuarance-005_BR001');
/*!40000 ALTER TABLE `treasuaries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `treasuarydatas`
--

DROP TABLE IF EXISTS `treasuarydatas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `treasuarydatas` (
  `DataId` int NOT NULL AUTO_INCREMENT,
  `Date` date NOT NULL,
  `Amount` double NOT NULL,
  `PolicyNo` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`DataId`),
  KEY `IX_TreasuaryDatas_PolicyNo` (`PolicyNo`),
  CONSTRAINT `FK_TreasuaryDatas_Treasuaries_PolicyNo` FOREIGN KEY (`PolicyNo`) REFERENCES `treasuaries` (`PolicyNo`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `treasuarydatas`
--

LOCK TABLES `treasuarydatas` WRITE;
/*!40000 ALTER TABLE `treasuarydatas` DISABLE KEYS */;
INSERT INTO `treasuarydatas` VALUES (7,'2024-03-24',500,'Poilicy-Treasuary-BR001');
/*!40000 ALTER TABLE `treasuarydatas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `treasuaryescollections`
--

DROP TABLE IF EXISTS `treasuaryescollections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `treasuaryescollections` (
  `TreasuaryeId` int NOT NULL AUTO_INCREMENT,
  `TreasuaryName` longtext COLLATE utf8mb4_general_ci,
  `Date` date NOT NULL,
  `PolicyNo` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`TreasuaryeId`),
  KEY `IX_TreasuaryesCollections_PolicyNo` (`PolicyNo`),
  CONSTRAINT `FK_TreasuaryesCollections_Treasuaries_PolicyNo` FOREIGN KEY (`PolicyNo`) REFERENCES `treasuaries` (`PolicyNo`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `treasuaryescollections`
--

LOCK TABLES `treasuaryescollections` WRITE;
/*!40000 ALTER TABLE `treasuaryescollections` DISABLE KEYS */;
/*!40000 ALTER TABLE `treasuaryescollections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `treasuraryinsurancecompenstaions`
--

DROP TABLE IF EXISTS `treasuraryinsurancecompenstaions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `treasuraryinsurancecompenstaions` (
  `TreasuraryInsuranceCompenstaionID` int NOT NULL AUTO_INCREMENT,
  `Value` double NOT NULL,
  `Data` date NOT NULL,
  `Comment` longtext COLLATE utf8mb4_general_ci,
  `PolicyNo` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`TreasuraryInsuranceCompenstaionID`),
  KEY `IX_TreasuraryInsuranceCompenstaions_PolicyNo` (`PolicyNo`),
  CONSTRAINT `FK_TreasuraryInsuranceCompenstaions_Treasuaries_PolicyNo` FOREIGN KEY (`PolicyNo`) REFERENCES `treasuaries` (`PolicyNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `treasuraryinsurancecompenstaions`
--

LOCK TABLES `treasuraryinsurancecompenstaions` WRITE;
/*!40000 ALTER TABLE `treasuraryinsurancecompenstaions` DISABLE KEYS */;
/*!40000 ALTER TABLE `treasuraryinsurancecompenstaions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zones`
--

DROP TABLE IF EXISTS `zones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zones` (
  `ZoneId` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `Zone_name` longtext COLLATE utf8mb4_general_ci,
  `Status` longtext COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`ZoneId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zones`
--

LOCK TABLES `zones` WRITE;
/*!40000 ALTER TABLE `zones` DISABLE KEYS */;
INSERT INTO `zones` VALUES ('Z001','Hambantota','Active');
/*!40000 ALTER TABLE `zones` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-02 16:20:14
