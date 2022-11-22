-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 20, 2022 at 05:09 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hospital`
--

-- --------------------------------------------------------

--
-- Table structure for table `attendant`
--

CREATE TABLE `attendant` (
  `employee_No` char(25) NOT NULL,
  `hourly charge rate` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `cleaner`
--

CREATE TABLE `cleaner` (
  `employee_No` char(25) NOT NULL,
  `contract_no` char(25) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `daily record`
--

CREATE TABLE `daily record` (
  `patient_ID` char(25) NOT NULL,
  `MCRN_of_nurse` char(25) NOT NULL,
  `time` time NOT NULL,
  `date` date NOT NULL,
  `weight` varchar(10) NOT NULL,
  `blood pressure` varchar(10) NOT NULL,
  `pulse` varchar(10) NOT NULL,
  `temperature` varchar(10) NOT NULL,
  `symptom` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `diagnostic`
--

CREATE TABLE `diagnostic` (
  `patient_ID` char(25) NOT NULL,
  `DEA_no` char(25) NOT NULL,
  `time` time NOT NULL,
  `code` char(25) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `diagnostic_imaging_test`
--

CREATE TABLE `diagnostic_imaging_test` (
  `test_code` char(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `diagnostic_lab_test`
--

CREATE TABLE `diagnostic_lab_test` (
  `test_code` char(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `diagnostic_unit`
--

CREATE TABLE `diagnostic_unit` (
  `ID` char(25) NOT NULL,
  `name` varchar(50) NOT NULL,
  `patient_care_unit_id` char(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

CREATE TABLE `doctor` (
  `DEA_no` char(25) NOT NULL,
  `area_of_specialty` varchar(50) NOT NULL,
  `medical_Council_registration_number` char(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `doctor`
--

INSERT INTO `doctor` (`DEA_no`, `area_of_specialty`, `medical_Council_registration_number`) VALUES
('d001', 'ent', 'm001');

-- --------------------------------------------------------

--
-- Table structure for table `drug`
--

CREATE TABLE `drug` (
  `patient_ID` char(25) NOT NULL,
  `DEA_no` char(25) NOT NULL,
  `drug_code` char(25) NOT NULL,
  `name` varchar(50) NOT NULL,
  `unit_cost` int(11) NOT NULL,
  `drug_type` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `emergency contact`
--

CREATE TABLE `emergency contact` (
  `ID` char(25) NOT NULL,
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `relationship` varchar(50) NOT NULL,
  `contact_no` int(11) NOT NULL,
  `address` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `employee_No` char(25) NOT NULL,
  `name` varchar(50) NOT NULL,
  `address` varchar(150) NOT NULL,
  `contact_No` int(11) NOT NULL,
  `working_state` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`employee_No`, `name`, `address`, `contact_No`, `working_state`) VALUES
('e001', 'K.D.K.Gunawardhana', 'no.35/nugegoda/colombo', 741582364, 'full time'),
('e002', ' P.K.N.Amarasingha', 'no.67/samagi pura/kottawa', 774586245, 'part time');

-- --------------------------------------------------------

--
-- Table structure for table `employee-patient_care_unit`
--

CREATE TABLE `employee-patient_care_unit` (
  `employee_No` char(25) NOT NULL,
  `patient_care_unit_id` char(25) NOT NULL,
  `work hours-per week` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `insurance_company`
--

CREATE TABLE `insurance_company` (
  `company_name` varchar(50) NOT NULL,
  `branch_name` varchar(50) NOT NULL,
  `branch_address` text NOT NULL,
  `contact_number` int(11) NOT NULL,
  `subscriber_first_name` varchar(50) NOT NULL,
  `subscriber_last_name` varchar(50) NOT NULL,
  `relationship_to_patient` varchar(50) DEFAULT NULL,
  `subscriber_address` text DEFAULT NULL,
  `subscriber_contact_number` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `insurance_company`
--

INSERT INTO `insurance_company` (`company_name`, `branch_name`, `branch_address`, `contact_number`, `subscriber_first_name`, `subscriber_last_name`, `relationship_to_patient`, `subscriber_address`, `subscriber_contact_number`) VALUES
('AIA Insurance Lanka Ltd.', 'AIA Kottawa', 'no.100/high level road/kottawa', 714521586, 'Kamal', 'Kapugedhara', 'Son', '167/1H/1/amara pura/kottawa', 778541235);

-- --------------------------------------------------------

--
-- Table structure for table `in_patient`
--

CREATE TABLE `in_patient` (
  `ID` char(25) NOT NULL,
  `dob` date NOT NULL,
  `insurance_company_name` varchar(50) DEFAULT NULL,
  `ward_ID` char(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `in_patient`
--

INSERT INTO `in_patient` (`ID`, `dob`, `insurance_company_name`, `ward_ID`) VALUES
('p001', '1998-08-14', 'AIA Insurance Lanka Ltd.', 'w001');

-- --------------------------------------------------------

--
-- Table structure for table `l_c_l_diagnostic_lab_test`
--

CREATE TABLE `l_c_l_diagnostic_lab_test` (
  `test_code` char(25) NOT NULL,
  `lipid_profile_flag` tinyint(1) NOT NULL,
  `CBC_flag` tinyint(1) NOT NULL,
  `liver_function_flag` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `medical_staff`
--

CREATE TABLE `medical_staff` (
  `employee_No` char(25) NOT NULL,
  `join_date` date NOT NULL,
  `resigned_date` date NOT NULL,
  `medical_Council_registration_number` char(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `medical_staff`
--

INSERT INTO `medical_staff` (`employee_No`, `join_date`, `resigned_date`, `medical_Council_registration_number`) VALUES
('e001', '2020-01-07', '0000-00-00', 'm001'),
('e002', '2020-02-10', '0000-00-00', 'm002');

-- --------------------------------------------------------

--
-- Table structure for table `mri_x-ray_diagnostic_imaging_test`
--

CREATE TABLE `mri_x-ray_diagnostic_imaging_test` (
  `test_code` char(25) NOT NULL,
  `MRI_flag` tinyint(1) NOT NULL,
  `X-ray_flag` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `non-medical_staff`
--

CREATE TABLE `non-medical_staff` (
  `employee_No` char(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `nurse`
--

CREATE TABLE `nurse` (
  `medical_Council_registration_number` char(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `nurse`
--

INSERT INTO `nurse` (`medical_Council_registration_number`) VALUES
('m002');

-- --------------------------------------------------------

--
-- Table structure for table `out_patient`
--

CREATE TABLE `out_patient` (
  `ID` char(25) NOT NULL,
  `OPD_arrival_date` date NOT NULL,
  `OPD_arrival_time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `out_patient`
--

INSERT INTO `out_patient` (`ID`, `OPD_arrival_date`, `OPD_arrival_time`) VALUES
('p002', '2021-05-05', '11:47:00');

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `ID` char(25) NOT NULL,
  `name` varchar(50) NOT NULL,
  `MCRN_of_nurse` char(25) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `time` time DEFAULT NULL,
  `weight(kg)` char(10) DEFAULT NULL,
  `pulse(beats per minute)` char(10) DEFAULT NULL,
  `temperature(*C)` char(10) DEFAULT NULL,
  `blood pressure(systolic mm Hg)` char(10) DEFAULT NULL,
  `symptom` text DEFAULT NULL,
  `DEA_no_of_doctor` char(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`ID`, `name`, `MCRN_of_nurse`, `date`, `time`, `weight(kg)`, `pulse(beats per minute)`, `temperature(*C)`, `blood pressure(systolic mm Hg)`, `symptom`, `DEA_no_of_doctor`) VALUES
('p001', 'G.H.Kumari', 'm002', '2021-10-04', '09:00:00', '75', '72', '37.1', '105', 'Difficulty breathing', 'd001'),
('p002', 'H.L.Saman', 'm002', '2021-05-05', '11:30:00', '80', '73', '37', '107', 'Stomach ache', 'd001');

-- --------------------------------------------------------

--
-- Table structure for table `patient_care_unit`
--

CREATE TABLE `patient_care_unit` (
  `ID` char(25) NOT NULL,
  `in_charge_emp_No` char(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `patient_care_unit`
--

INSERT INTO `patient_care_unit` (`ID`, `in_charge_emp_No`) VALUES
('pcu001', 'e001');

-- --------------------------------------------------------

--
-- Table structure for table `patient_diagnostic`
--

CREATE TABLE `patient_diagnostic` (
  `patient_ID` char(25) NOT NULL,
  `code` char(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `supply`
--

CREATE TABLE `supply` (
  `reg_no` char(25) NOT NULL,
  `drug_code` char(25) NOT NULL,
  `date` date NOT NULL,
  `quantity` int(11) NOT NULL,
  `unit_cost` int(11) NOT NULL,
  `liquid` tinyint(1) NOT NULL,
  `tablet` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `test`
--

CREATE TABLE `test` (
  `patient_ID` char(25) NOT NULL,
  `DEA_no` char(25) NOT NULL,
  `test_code` char(25) NOT NULL,
  `test_name` varchar(50) NOT NULL,
  `cost` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `treatment`
--

CREATE TABLE `treatment` (
  `patient_ID` char(25) NOT NULL,
  `DEA_no` char(25) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `vendor`
--

CREATE TABLE `vendor` (
  `reg_no` char(25) NOT NULL,
  `name` varchar(50) NOT NULL,
  `address` text NOT NULL,
  `contact_No` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `ward`
--

CREATE TABLE `ward` (
  `ID` char(25) NOT NULL,
  `name` varchar(50) NOT NULL,
  `patient_care_unit_id` char(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ward`
--

INSERT INTO `ward` (`ID`, `name`, `patient_care_unit_id`) VALUES
('w001', 'w_1_a', 'pcu001');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attendant`
--
ALTER TABLE `attendant`
  ADD PRIMARY KEY (`employee_No`);

--
-- Indexes for table `cleaner`
--
ALTER TABLE `cleaner`
  ADD PRIMARY KEY (`employee_No`);

--
-- Indexes for table `daily record`
--
ALTER TABLE `daily record`
  ADD PRIMARY KEY (`patient_ID`,`MCRN_of_nurse`,`time`,`date`),
  ADD KEY `MCRN_of_nurse` (`MCRN_of_nurse`);

--
-- Indexes for table `diagnostic`
--
ALTER TABLE `diagnostic`
  ADD PRIMARY KEY (`code`),
  ADD KEY `patient_ID` (`patient_ID`),
  ADD KEY `DEA_no` (`DEA_no`);

--
-- Indexes for table `diagnostic_imaging_test`
--
ALTER TABLE `diagnostic_imaging_test`
  ADD PRIMARY KEY (`test_code`);

--
-- Indexes for table `diagnostic_lab_test`
--
ALTER TABLE `diagnostic_lab_test`
  ADD PRIMARY KEY (`test_code`);

--
-- Indexes for table `diagnostic_unit`
--
ALTER TABLE `diagnostic_unit`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `patient_care_unit_id` (`patient_care_unit_id`);

--
-- Indexes for table `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`DEA_no`),
  ADD KEY `medical Council registration number` (`medical_Council_registration_number`);

--
-- Indexes for table `drug`
--
ALTER TABLE `drug`
  ADD PRIMARY KEY (`drug_code`),
  ADD KEY `patient_ID` (`patient_ID`),
  ADD KEY `DEA_no` (`DEA_no`);

--
-- Indexes for table `emergency contact`
--
ALTER TABLE `emergency contact`
  ADD PRIMARY KEY (`ID`,`first_name`,`last_name`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`employee_No`);

--
-- Indexes for table `employee-patient_care_unit`
--
ALTER TABLE `employee-patient_care_unit`
  ADD PRIMARY KEY (`employee_No`,`patient_care_unit_id`),
  ADD KEY `patient_care_unit_id` (`patient_care_unit_id`);

--
-- Indexes for table `insurance_company`
--
ALTER TABLE `insurance_company`
  ADD PRIMARY KEY (`company_name`,`subscriber_first_name`,`subscriber_last_name`);

--
-- Indexes for table `in_patient`
--
ALTER TABLE `in_patient`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `insurance company name` (`insurance_company_name`),
  ADD KEY `ward_ID` (`ward_ID`);

--
-- Indexes for table `l_c_l_diagnostic_lab_test`
--
ALTER TABLE `l_c_l_diagnostic_lab_test`
  ADD PRIMARY KEY (`test_code`);

--
-- Indexes for table `medical_staff`
--
ALTER TABLE `medical_staff`
  ADD PRIMARY KEY (`medical_Council_registration_number`),
  ADD KEY `employee_No` (`employee_No`);

--
-- Indexes for table `mri_x-ray_diagnostic_imaging_test`
--
ALTER TABLE `mri_x-ray_diagnostic_imaging_test`
  ADD PRIMARY KEY (`test_code`);

--
-- Indexes for table `non-medical_staff`
--
ALTER TABLE `non-medical_staff`
  ADD PRIMARY KEY (`employee_No`);

--
-- Indexes for table `nurse`
--
ALTER TABLE `nurse`
  ADD PRIMARY KEY (`medical_Council_registration_number`);

--
-- Indexes for table `out_patient`
--
ALTER TABLE `out_patient`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `MCRN of nurse` (`MCRN_of_nurse`),
  ADD KEY `DEA_no of doctor` (`DEA_no_of_doctor`);

--
-- Indexes for table `patient_care_unit`
--
ALTER TABLE `patient_care_unit`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `in-charge_emp_No` (`in_charge_emp_No`);

--
-- Indexes for table `patient_diagnostic`
--
ALTER TABLE `patient_diagnostic`
  ADD PRIMARY KEY (`patient_ID`,`code`),
  ADD KEY `code` (`code`);

--
-- Indexes for table `supply`
--
ALTER TABLE `supply`
  ADD PRIMARY KEY (`reg_no`,`drug_code`,`date`),
  ADD KEY `drug_code` (`drug_code`);

--
-- Indexes for table `test`
--
ALTER TABLE `test`
  ADD PRIMARY KEY (`test_code`),
  ADD KEY `patient_ID` (`patient_ID`),
  ADD KEY `DEA_no` (`DEA_no`);

--
-- Indexes for table `treatment`
--
ALTER TABLE `treatment`
  ADD PRIMARY KEY (`patient_ID`,`DEA_no`,`date`,`time`),
  ADD KEY `DEA_no` (`DEA_no`);

--
-- Indexes for table `vendor`
--
ALTER TABLE `vendor`
  ADD PRIMARY KEY (`reg_no`);

--
-- Indexes for table `ward`
--
ALTER TABLE `ward`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `patient_care_unit_id` (`patient_care_unit_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attendant`
--
ALTER TABLE `attendant`
  ADD CONSTRAINT `attendant_ibfk_1` FOREIGN KEY (`employee_No`) REFERENCES `non-medical_staff` (`employee_No`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cleaner`
--
ALTER TABLE `cleaner`
  ADD CONSTRAINT `cleaner_ibfk_1` FOREIGN KEY (`employee_No`) REFERENCES `non-medical_staff` (`employee_No`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `daily record`
--
ALTER TABLE `daily record`
  ADD CONSTRAINT `daily record_ibfk_1` FOREIGN KEY (`patient_ID`) REFERENCES `in_patient` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `daily record_ibfk_2` FOREIGN KEY (`MCRN_of_nurse`) REFERENCES `nurse` (`medical_Council_registration_number`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `diagnostic`
--
ALTER TABLE `diagnostic`
  ADD CONSTRAINT `diagnostic_ibfk_1` FOREIGN KEY (`patient_ID`) REFERENCES `patient` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `diagnostic_ibfk_2` FOREIGN KEY (`DEA_no`) REFERENCES `doctor` (`DEA_no`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `diagnostic_imaging_test`
--
ALTER TABLE `diagnostic_imaging_test`
  ADD CONSTRAINT `diagnostic_imaging_test_ibfk_1` FOREIGN KEY (`test_code`) REFERENCES `test` (`test_code`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `diagnostic_lab_test`
--
ALTER TABLE `diagnostic_lab_test`
  ADD CONSTRAINT `diagnostic_lab_test_ibfk_1` FOREIGN KEY (`test_code`) REFERENCES `test` (`test_code`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `diagnostic_unit`
--
ALTER TABLE `diagnostic_unit`
  ADD CONSTRAINT `diagnostic_unit_ibfk_1` FOREIGN KEY (`patient_care_unit_id`) REFERENCES `patient_care_unit` (`ID`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `doctor`
--
ALTER TABLE `doctor`
  ADD CONSTRAINT `doctor_ibfk_1` FOREIGN KEY (`medical_Council_registration_number`) REFERENCES `medical_staff` (`medical_Council_registration_number`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `drug`
--
ALTER TABLE `drug`
  ADD CONSTRAINT `drug_ibfk_1` FOREIGN KEY (`patient_ID`) REFERENCES `patient` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `drug_ibfk_2` FOREIGN KEY (`DEA_no`) REFERENCES `doctor` (`DEA_no`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `emergency contact`
--
ALTER TABLE `emergency contact`
  ADD CONSTRAINT `emergency contact_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `in_patient` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `employee-patient_care_unit`
--
ALTER TABLE `employee-patient_care_unit`
  ADD CONSTRAINT `employee-patient_care_unit_ibfk_1` FOREIGN KEY (`employee_No`) REFERENCES `employee` (`employee_No`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `employee-patient_care_unit_ibfk_2` FOREIGN KEY (`patient_care_unit_id`) REFERENCES `patient_care_unit` (`ID`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `in_patient`
--
ALTER TABLE `in_patient`
  ADD CONSTRAINT `in_patient_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `patient` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `in_patient_ibfk_2` FOREIGN KEY (`insurance_company_name`) REFERENCES `insurance_company` (`company_name`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `in_patient_ibfk_3` FOREIGN KEY (`ward_ID`) REFERENCES `ward` (`ID`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `l_c_l_diagnostic_lab_test`
--
ALTER TABLE `l_c_l_diagnostic_lab_test`
  ADD CONSTRAINT `l_c_l_diagnostic_lab_test_ibfk_1` FOREIGN KEY (`test_code`) REFERENCES `test` (`test_code`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `medical_staff`
--
ALTER TABLE `medical_staff`
  ADD CONSTRAINT `medical_staff_ibfk_1` FOREIGN KEY (`employee_No`) REFERENCES `employee` (`employee_No`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `mri_x-ray_diagnostic_imaging_test`
--
ALTER TABLE `mri_x-ray_diagnostic_imaging_test`
  ADD CONSTRAINT `mri_x-ray_diagnostic_imaging_test_ibfk_1` FOREIGN KEY (`test_code`) REFERENCES `test` (`test_code`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `non-medical_staff`
--
ALTER TABLE `non-medical_staff`
  ADD CONSTRAINT `non-medical_staff_ibfk_1` FOREIGN KEY (`employee_No`) REFERENCES `employee` (`employee_No`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `nurse`
--
ALTER TABLE `nurse`
  ADD CONSTRAINT `nurse_ibfk_1` FOREIGN KEY (`medical_Council_registration_number`) REFERENCES `medical_staff` (`medical_Council_registration_number`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `out_patient`
--
ALTER TABLE `out_patient`
  ADD CONSTRAINT `out_patient_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `patient` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `patient`
--
ALTER TABLE `patient`
  ADD CONSTRAINT `patient_ibfk_1` FOREIGN KEY (`MCRN_of_nurse`) REFERENCES `nurse` (`medical_Council_registration_number`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `patient_ibfk_2` FOREIGN KEY (`DEA_no_of_doctor`) REFERENCES `doctor` (`DEA_no`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `patient_care_unit`
--
ALTER TABLE `patient_care_unit`
  ADD CONSTRAINT `patient_care_unit_ibfk_1` FOREIGN KEY (`in_charge_emp_No`) REFERENCES `employee` (`employee_No`) ON UPDATE CASCADE;

--
-- Constraints for table `patient_diagnostic`
--
ALTER TABLE `patient_diagnostic`
  ADD CONSTRAINT `patient_diagnostic_ibfk_1` FOREIGN KEY (`patient_ID`) REFERENCES `patient` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `patient_diagnostic_ibfk_2` FOREIGN KEY (`code`) REFERENCES `diagnostic` (`code`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `supply`
--
ALTER TABLE `supply`
  ADD CONSTRAINT `supply_ibfk_1` FOREIGN KEY (`drug_code`) REFERENCES `drug` (`drug_code`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `supply_ibfk_2` FOREIGN KEY (`reg_no`) REFERENCES `vendor` (`reg_no`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `test`
--
ALTER TABLE `test`
  ADD CONSTRAINT `test_ibfk_1` FOREIGN KEY (`patient_ID`) REFERENCES `patient` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `test_ibfk_2` FOREIGN KEY (`DEA_no`) REFERENCES `doctor` (`DEA_no`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `treatment`
--
ALTER TABLE `treatment`
  ADD CONSTRAINT `treatment_ibfk_1` FOREIGN KEY (`patient_ID`) REFERENCES `patient` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `treatment_ibfk_2` FOREIGN KEY (`DEA_no`) REFERENCES `doctor` (`DEA_no`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `ward`
--
ALTER TABLE `ward`
  ADD CONSTRAINT `ward_ibfk_1` FOREIGN KEY (`patient_care_unit_id`) REFERENCES `patient_care_unit` (`ID`) ON DELETE NO ACTION ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
