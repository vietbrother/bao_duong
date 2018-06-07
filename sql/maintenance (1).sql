-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 07, 2018 at 05:22 AM
-- Server version: 10.1.26-MariaDB
-- PHP Version: 7.1.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `maintenance`
--

-- --------------------------------------------------------

--
-- Table structure for table `cata_user`
--

CREATE TABLE `cata_user` (
  `id` int(11) NOT NULL,
  `BIRTH_DAY` date DEFAULT NULL,
  `EMAIL` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `FIRST_NAME` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `LAST_NAME` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `LOCATION` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `SEX` bit(1) DEFAULT NULL,
  `PHONE` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `ROLE` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `TITLE` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `USERNAME` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `WEBSITE` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- --------------------------------------------------------

--
-- Table structure for table `c_asset`
--

CREATE TABLE `c_asset` (
  `C_ASSET_ID` int(10) NOT NULL,
  `CODE` text COLLATE utf8_unicode_ci NOT NULL,
  `NAME` text COLLATE utf8_unicode_ci NOT NULL,
  `NUMBER` int(10) DEFAULT NULL,
  `C_UNIT_ID` text COLLATE utf8_unicode_ci NOT NULL,
  `C_ASSET_TYPE_ID` text COLLATE utf8_unicode_ci NOT NULL,
  `C_ASSET_GROUP_ID` text COLLATE utf8_unicode_ci NOT NULL,
  `C_ASSET_CLASS_ID` text COLLATE utf8_unicode_ci NOT NULL,
  `C_ORGANIZATION_ID` text COLLATE utf8_unicode_ci NOT NULL,
  `C_EMPLOYEE_ID` text COLLATE utf8_unicode_ci NOT NULL,
  `DESIGN` text COLLATE utf8_unicode_ci COMMENT 'Kiểu dáng',
  `SEATS` int(11) DEFAULT NULL COMMENT 'Số chỗ ngồi',
  `DEPRECIATION_DATE` date DEFAULT NULL,
  `C_PROVIDER_ID` text COLLATE utf8_unicode_ci NOT NULL,
  `CONTENT` text COLLATE utf8_unicode_ci,
  `URL_IMAGE` text COLLATE utf8_unicode_ci,
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  `IS_ACTIVE` tinyint(1) DEFAULT NULL,
  `CREATED` date DEFAULT NULL,
  `CREATED_BY` text COLLATE utf8_unicode_ci,
  `UPDATED` date DEFAULT NULL,
  `UPDATED_BY` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `c_asset`
--

INSERT INTO `c_asset` (`C_ASSET_ID`, `CODE`, `NAME`, `NUMBER`, `C_UNIT_ID`, `C_ASSET_TYPE_ID`, `C_ASSET_GROUP_ID`, `C_ASSET_CLASS_ID`, `C_ORGANIZATION_ID`, `C_EMPLOYEE_ID`, `DESIGN`, `SEATS`, `DEPRECIATION_DATE`, `C_PROVIDER_ID`, `CONTENT`, `URL_IMAGE`, `DESCRIPTION`, `IS_ACTIVE`, `CREATED`, `CREATED_BY`, `UPDATED`, `UPDATED_BY`) VALUES
(1, '30A-25740', 'Xe ôtô Huyndai 29 chỗ', 1, '1', '1', '1', '1', '2', '1', NULL, 28900, '2017-10-18', '1', 'Xe 29 chỗ hiệu Huyndai', NULL, 'Xe công của Sở y tế', NULL, NULL, NULL, NULL, NULL),
(2, '30A-68688', 'Xe 50 chỗ', 2, '1', '2', '1', '1', '3', '2', NULL, 105335, '2017-10-17', '2', 'Xe 50 chỗ hiệu Mercedes', NULL, 'Xe phục vụ đưa đón cán bộ, công nhân viên', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `c_asset_class`
--

CREATE TABLE `c_asset_class` (
  `C_ASSET_CLASS_ID` int(10) NOT NULL,
  `NAME` text COLLATE utf8_unicode_ci NOT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  `IS_ACTIVE` tinyint(1) DEFAULT NULL,
  `CREATED` datetime DEFAULT NULL,
  `CREATED_BY` text COLLATE utf8_unicode_ci,
  `UPDATED` datetime DEFAULT NULL,
  `UPDATED_BY` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `c_asset_class`
--

INSERT INTO `c_asset_class` (`C_ASSET_CLASS_ID`, `NAME`, `DESCRIPTION`, `IS_ACTIVE`, `CREATED`, `CREATED_BY`, `UPDATED`, `UPDATED_BY`) VALUES
(1, 'Tài sản cố định', NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'Tài sản lưu động', NULL, NULL, NULL, NULL, NULL, NULL),
(3, 'Tài sản hữu hình', NULL, NULL, NULL, NULL, NULL, NULL),
(4, 'Tài sản vô hình', NULL, NULL, NULL, NULL, NULL, NULL),
(5, 'Khác', NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `c_asset_group`
--

CREATE TABLE `c_asset_group` (
  `C_ASSET_GROUP_ID` int(10) NOT NULL,
  `NAME` text COLLATE utf8_unicode_ci NOT NULL,
  `IS_ACTIVE` tinyint(1) DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  `CREATED` datetime DEFAULT NULL,
  `CREATED_BY` text COLLATE utf8_unicode_ci,
  `UPDATED` datetime DEFAULT NULL,
  `UPDATED_BY` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `c_asset_group`
--

INSERT INTO `c_asset_group` (`C_ASSET_GROUP_ID`, `NAME`, `IS_ACTIVE`, `DESCRIPTION`, `CREATED`, `CREATED_BY`, `UPDATED`, `UPDATED_BY`) VALUES
(1, 'Tài sản vật tư', NULL, 'Tài sản dạng vật tư', NULL, NULL, NULL, NULL),
(2, 'Tài sản khác', NULL, 'Các loại tài sản khác', NULL, NULL, NULL, NULL),
(3, 'Tài sản xe', NULL, 'Các loại tài sản xe: oto, xe máy...', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `c_asset_type`
--

CREATE TABLE `c_asset_type` (
  `C_ASSET_TYPE_ID` int(10) NOT NULL,
  `CODE` text COLLATE utf8_unicode_ci,
  `NAME` text COLLATE utf8_unicode_ci NOT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  `IS_ACTIVE` tinyint(1) DEFAULT NULL,
  `CREATED` datetime DEFAULT NULL,
  `CREATED_BY` text COLLATE utf8_unicode_ci,
  `UPDATED` datetime DEFAULT NULL,
  `UPDATED_BY` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `c_asset_type`
--

INSERT INTO `c_asset_type` (`C_ASSET_TYPE_ID`, `CODE`, `NAME`, `DESCRIPTION`, `IS_ACTIVE`, `CREATED`, `CREATED_BY`, `UPDATED`, `UPDATED_BY`) VALUES
(1, 'O_TO', 'Ô-tô', 'Xe ô-tô', NULL, NULL, NULL, NULL, NULL),
(2, 'VAN_PHONG', 'Tài sản văn phòng', 'Tài sản phục vụ văn phòng', NULL, NULL, NULL, NULL, NULL),
(3, 'XE_MAY', 'Xe Máy', 'Xe máy', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `c_calendar`
--

CREATE TABLE `c_calendar` (
  `calendar_id` int(11) NOT NULL,
  `calendar_name` varchar(200) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `working_date` int(11) DEFAULT NULL COMMENT 'ngày đi làm hay không',
  `description` varchar(500) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `status` int(11) DEFAULT NULL COMMENT 'trạng thái',
  `inserted_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `inserted_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `color` varchar(200) COLLATE utf8_vietnamese_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `c_calendar`
--

INSERT INTO `c_calendar` (`calendar_id`, `calendar_name`, `working_date`, `description`, `status`, `inserted_by`, `updated_by`, `inserted_time`, `updated_time`, `color`) VALUES
(1, '122', 1, '', NULL, NULL, NULL, NULL, NULL, 'RED');

-- --------------------------------------------------------

--
-- Table structure for table `c_color_defined`
--

CREATE TABLE `c_color_defined` (
  `color_name` varchar(10) COLLATE utf8_vietnamese_ci NOT NULL,
  `color_code` varchar(10) COLLATE utf8_vietnamese_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `c_color_defined`
--

INSERT INTO `c_color_defined` (`color_name`, `color_code`) VALUES
('AQUA', '00FFFF'),
('BLACK', '000000'),
('BLUE', '0000FF'),
('FUCHSIA', 'FF00FF'),
('GRAY', '808080'),
('GREEN', '008000'),
('LIME', '00FF00'),
('MAROON', '800000'),
('NAVY', '000080'),
('OLIVE', '808000'),
('PURPLE', '800080'),
('RED', 'FF0000'),
('SILVER', 'C0C0C0'),
('TEAL', '008080'),
('WHITE', 'FFFFFF'),
('YELLOW', 'FFFF00');

-- --------------------------------------------------------

--
-- Table structure for table `c_country`
--

CREATE TABLE `c_country` (
  `C_COUNTRY_ID` int(10) NOT NULL,
  `CODE` text COLLATE utf8_unicode_ci NOT NULL,
  `NAME` text COLLATE utf8_unicode_ci NOT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  `IS_ACTIVE` tinyint(1) DEFAULT NULL,
  `CREATED` datetime DEFAULT NULL,
  `CREATED_BY` text COLLATE utf8_unicode_ci,
  `UPDATED` datetime DEFAULT NULL,
  `UPDATED_BY` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `c_country`
--

INSERT INTO `c_country` (`C_COUNTRY_ID`, `CODE`, `NAME`, `DESCRIPTION`, `IS_ACTIVE`, `CREATED`, `CREATED_BY`, `UPDATED`, `UPDATED_BY`) VALUES
(1, 'ADO', 'Ấn Độ', NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'VNI', 'Việt Nam', NULL, NULL, NULL, NULL, NULL, NULL),
(3, 'GEM', 'Đức', NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `c_document`
--

CREATE TABLE `c_document` (
  `id` int(11) NOT NULL,
  `document_code` varchar(45) NOT NULL,
  `document_name` varchar(255) DEFAULT NULL,
  `document_type` varchar(45) DEFAULT NULL,
  `security_level` varchar(45) DEFAULT NULL,
  `created_by` varchar(45) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `part_storage_time` int(10) DEFAULT NULL,
  `department_storage_time` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `c_document`
--

INSERT INTO `c_document` (`id`, `document_code`, `document_name`, `document_type`, `security_level`, `created_by`, `status`, `part_storage_time`, `department_storage_time`) VALUES
(3, 'TAI_LIEU_01', 'Tài liệu quy trình nghiệp vụ Y', 'Cứng', 'Trung bình', 'Admin', 'Đã lưu', 36, 12),
(4, 'TAI_LIEU_02', 'Quy định về làm việc liên bộ phận', 'Cứng', 'Cao', 'Admin', 'Đã lưu', 36, 12);

-- --------------------------------------------------------

--
-- Table structure for table `c_education`
--

CREATE TABLE `c_education` (
  `C_EDUCATION_ID` int(10) NOT NULL,
  `NAME` text COLLATE utf8_unicode_ci NOT NULL,
  `VALUE` text COLLATE utf8_unicode_ci NOT NULL,
  `IS_ACTIVE` tinyint(1) DEFAULT NULL,
  `CREATED` datetime DEFAULT NULL,
  `CREATED_BY` text COLLATE utf8_unicode_ci,
  `UPDATED` datetime DEFAULT NULL,
  `UPDATED_BY` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `c_education`
--

INSERT INTO `c_education` (`C_EDUCATION_ID`, `NAME`, `VALUE`, `IS_ACTIVE`, `CREATED`, `CREATED_BY`, `UPDATED`, `UPDATED_BY`) VALUES
(1, 'DEGREE_TYPE', 'Chứng chỉ', NULL, NULL, NULL, NULL, NULL),
(2, 'DEGREE_TYPE', 'Cao Đẳng', NULL, NULL, NULL, NULL, NULL),
(3, 'DEGREE_TYPE', 'Đại Học', NULL, NULL, NULL, NULL, NULL),
(4, 'DEGREE_TYPE', 'Thạc Sỹ', NULL, NULL, NULL, NULL, NULL),
(5, 'DEGREE_TYPE', 'Tiến Sĩ', NULL, NULL, NULL, NULL, NULL),
(6, 'DEGREE_TYPE', 'Khác', NULL, NULL, NULL, NULL, NULL),
(7, 'EDUCATION_TYPE', 'Tại chức', NULL, NULL, NULL, NULL, NULL),
(8, 'EDUCATION_TYPE', 'Nội bộ', NULL, NULL, NULL, NULL, NULL),
(9, 'EDUCATION_TYPE', 'Chính quy', NULL, NULL, NULL, NULL, NULL),
(10, 'EDUCATION_TYPE', 'Khác', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `c_employees`
--

CREATE TABLE `c_employees` (
  `C_EMPLOYEE_ID` int(10) NOT NULL,
  `EMPLOYEE_CODE` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mã cán bộ, nhân viên',
  `EMPLOYEE_TYPE_ID` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'Loại cán bộ hay viên chức hay thử việc',
  `FIRST_NAME` text COLLATE utf8_unicode_ci NOT NULL,
  `LAST_NAME` text COLLATE utf8_unicode_ci NOT NULL,
  `BIRTHDAY` date NOT NULL,
  `EMAIL` text COLLATE utf8_unicode_ci NOT NULL,
  `MOBILE` text COLLATE utf8_unicode_ci NOT NULL,
  `ADDRESS` text COLLATE utf8_unicode_ci NOT NULL,
  `IMAGE_URL` text COLLATE utf8_unicode_ci COMMENT 'Lưu đường dẫn ảnh cá nhân',
  `HIRE_FROM_DATE` date DEFAULT NULL,
  `HIRE_TO_DATE` date DEFAULT NULL,
  `SALARY` text COLLATE utf8_unicode_ci,
  `COMMISSION_PCT` text COLLATE utf8_unicode_ci,
  `DEPARTMENT_ID` text COLLATE utf8_unicode_ci NOT NULL,
  `JOB_ID` text COLLATE utf8_unicode_ci NOT NULL,
  `IS_ACTIVE` tinyint(1) NOT NULL,
  `CREATED_BY` text COLLATE utf8_unicode_ci,
  `CREATED` date DEFAULT NULL,
  `UPDATED_BY` text COLLATE utf8_unicode_ci,
  `UPDATED` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `c_employees`
--

INSERT INTO `c_employees` (`C_EMPLOYEE_ID`, `EMPLOYEE_CODE`, `EMPLOYEE_TYPE_ID`, `FIRST_NAME`, `LAST_NAME`, `BIRTHDAY`, `EMAIL`, `MOBILE`, `ADDRESS`, `IMAGE_URL`, `HIRE_FROM_DATE`, `HIRE_TO_DATE`, `SALARY`, `COMMISSION_PCT`, `DEPARTMENT_ID`, `JOB_ID`, `IS_ACTIVE`, `CREATED_BY`, `CREATED`, `UPDATED_BY`, `UPDATED`) VALUES
(1, '195455', '1', 'Lê Trung', 'Thực', '1987-01-17', 'minhn@viettel.com.vn', '0917333333', 'Cầu Giấy - Hà Nội', '/image/minhn.png', '2010-10-02', NULL, '21000000', 'PCT', '2', '1', 1, NULL, NULL, NULL, NULL),
(2, '195456', '2', 'Nguyễn Diệu', 'Linh', '1988-10-10', 'linhnd20@viettel.com.vn', '0987789987', 'Đống Đa', '/image/2.png', NULL, NULL, NULL, NULL, '3', '2', 1, NULL, NULL, NULL, NULL),
(3, '200118', '2', 'Mai Việt', 'Anh', '1991-10-26', 'anhmv@viettel.com.vn', '01667778889', 'Thanh Xuân', '/image/5.png', NULL, NULL, NULL, NULL, '5', '3', 1, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `c_employee_education`
--

CREATE TABLE `c_employee_education` (
  `C_EMPLOYEE_EDUCATION_ID` int(10) NOT NULL,
  `C_EMPLOYEE_ID` text COLLATE utf8_unicode_ci NOT NULL,
  `FROM_DATE` date NOT NULL,
  `TO_DATE` date NOT NULL,
  `C_DEGREE_TYPE_ID` text COLLATE utf8_unicode_ci NOT NULL,
  `C_EDUCATION_TYPE_ID` text COLLATE utf8_unicode_ci NOT NULL,
  `EDUCATION_PLACE` text COLLATE utf8_unicode_ci NOT NULL,
  `CLASSIFICATION` text COLLATE utf8_unicode_ci NOT NULL,
  `IS_ACTIVE` tinyint(1) DEFAULT NULL,
  `CREATED` datetime DEFAULT NULL,
  `CREATED_BY` text COLLATE utf8_unicode_ci,
  `UPDATED` datetime DEFAULT NULL,
  `UPDATED_BY` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `c_employee_education`
--

INSERT INTO `c_employee_education` (`C_EMPLOYEE_EDUCATION_ID`, `C_EMPLOYEE_ID`, `FROM_DATE`, `TO_DATE`, `C_DEGREE_TYPE_ID`, `C_EDUCATION_TYPE_ID`, `EDUCATION_PLACE`, `CLASSIFICATION`, `IS_ACTIVE`, `CREATED`, `CREATED_BY`, `UPDATED`, `UPDATED_BY`) VALUES
(1, '1', '2017-10-03', '2017-10-11', '3', '9', 'ĐH Công nghệ', 'Khá', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `c_employee_process`
--

CREATE TABLE `c_employee_process` (
  `C_EMPLOYEE_PROCESS_ID` int(10) NOT NULL,
  `C_EMPLOYEE_ID` text COLLATE utf8_unicode_ci NOT NULL,
  `FROM_DATE` date NOT NULL,
  `TO_DATE` date NOT NULL,
  `C_JOB_ID` text COLLATE utf8_unicode_ci NOT NULL,
  `C_EMPLOYEE_TYPE_ID` text COLLATE utf8_unicode_ci NOT NULL,
  `C_DEPARTMENT_ID` text COLLATE utf8_unicode_ci NOT NULL,
  `IS_ACTIVE` tinyint(1) DEFAULT NULL,
  `CREATED` datetime DEFAULT NULL,
  `CREATED_BY` text COLLATE utf8_unicode_ci,
  `UPDATED` datetime DEFAULT NULL,
  `UPDATED_BY` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `c_employee_process`
--

INSERT INTO `c_employee_process` (`C_EMPLOYEE_PROCESS_ID`, `C_EMPLOYEE_ID`, `FROM_DATE`, `TO_DATE`, `C_JOB_ID`, `C_EMPLOYEE_TYPE_ID`, `C_DEPARTMENT_ID`, `IS_ACTIVE`, `CREATED`, `CREATED_BY`, `UPDATED`, `UPDATED_BY`) VALUES
(1, '1', '2017-10-04', '2017-10-11', '11', '11', '2', NULL, NULL, NULL, NULL, NULL),
(2, '1', '2017-09-24', '2017-09-30', '10', '12', '3', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `c_employee_reward`
--

CREATE TABLE `c_employee_reward` (
  `C_EMPLOYEE_REWARD_ID` int(10) NOT NULL,
  `C_EMPLOYEE_ID` text COLLATE utf8_unicode_ci NOT NULL,
  `REWARD_TYPE` text COLLATE utf8_unicode_ci NOT NULL,
  `REWARD_DATE` date NOT NULL,
  `CONTENT` text COLLATE utf8_unicode_ci,
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  `IS_ACTIVE` tinyint(1) DEFAULT NULL,
  `CREATED` datetime DEFAULT NULL,
  `CREATED_BY` text COLLATE utf8_unicode_ci,
  `UPDATED` datetime DEFAULT NULL,
  `UPDATED_BY` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `c_employee_reward`
--

INSERT INTO `c_employee_reward` (`C_EMPLOYEE_REWARD_ID`, `C_EMPLOYEE_ID`, `REWARD_TYPE`, `REWARD_DATE`, `CONTENT`, `DESCRIPTION`, `IS_ACTIVE`, `CREATED`, `CREATED_BY`, `UPDATED`, `UPDATED_BY`) VALUES
(1, '1', '1', '2017-10-14', 'Lao động tiên tiến năm 2016', 'Triển khai thành công hệ thống BCCS 2.0 phục vụ SXKD thị trường.', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `c_employee_type`
--

CREATE TABLE `c_employee_type` (
  `C_EMPLOYEE_TYPE_ID` int(10) NOT NULL,
  `EMPLOYEE_TYPE` text COLLATE utf8_unicode_ci NOT NULL,
  `IS_ACTIVE` tinyint(1) DEFAULT NULL,
  `CREATED_BY` text COLLATE utf8_unicode_ci,
  `CREATED` date DEFAULT NULL,
  `UPDATED_BY` text COLLATE utf8_unicode_ci,
  `UPDATED` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `c_employee_type`
--

INSERT INTO `c_employee_type` (`C_EMPLOYEE_TYPE_ID`, `EMPLOYEE_TYPE`, `IS_ACTIVE`, `CREATED_BY`, `CREATED`, `UPDATED_BY`, `UPDATED`) VALUES
(1, 'Viên chức', NULL, NULL, NULL, NULL, NULL),
(2, 'Công chức', NULL, NULL, NULL, NULL, NULL),
(3, 'Nhân viên', NULL, NULL, NULL, NULL, NULL),
(4, 'Hợp đồng ngắn hạn', NULL, NULL, NULL, NULL, NULL),
(5, 'Thử việc', NULL, NULL, NULL, NULL, NULL),
(10, 'Ắc quy khô', NULL, NULL, NULL, NULL, NULL),
(11, 'Ắc quy nước', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `c_field`
--

CREATE TABLE `c_field` (
  `C_FIELD_ID` int(10) NOT NULL,
  `CODE` text COLLATE utf8_unicode_ci NOT NULL,
  `NAME` text COLLATE utf8_unicode_ci NOT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  `IS_ACTIVE` tinyint(1) DEFAULT NULL,
  `CREATED` datetime DEFAULT NULL,
  `CREATED_BY` text COLLATE utf8_unicode_ci,
  `UPDATED` datetime DEFAULT NULL,
  `UPDATED_BY` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `c_file`
--

CREATE TABLE `c_file` (
  `id` int(11) NOT NULL,
  `file_code` varchar(45) NOT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `file_type` varchar(45) DEFAULT NULL,
  `security_level` varchar(45) DEFAULT NULL,
  `created_by` varchar(45) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `part_storage_time` int(10) DEFAULT NULL,
  `department_storage_time` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `c_file`
--

INSERT INTO `c_file` (`id`, `file_code`, `file_name`, `file_type`, `security_level`, `created_by`, `status`, `part_storage_time`, `department_storage_time`) VALUES
(2, 'HO_SO_1', 'Hồ sơ 01', 'Mềm', 'Cao', NULL, 'Đã ban hành', 12, 11),
(3, 'HO_SO_2', 'NĐ 01', 'Mềm', 'Cao', NULL, 'Đang xét duyệt', 12, 12),
(5, 'HO_SO_3', 'QĐ 01', 'Cứng', 'Mềm', NULL, 'Nháp', 12, 12);

-- --------------------------------------------------------

--
-- Table structure for table `c_job`
--

CREATE TABLE `c_job` (
  `C_JOB_ID` int(11) NOT NULL,
  `JOB_TITLE` text COLLATE utf8_unicode_ci NOT NULL,
  `SALARY_GLONE` decimal(10,0) DEFAULT NULL,
  `SALARY_WAGE` decimal(10,0) DEFAULT NULL,
  `MIN_SALARY` decimal(10,0) DEFAULT NULL,
  `MAX_SALARY` decimal(10,0) DEFAULT NULL,
  `IS_ACTIVE` tinyint(1) DEFAULT NULL,
  `CREATED_BY` text COLLATE utf8_unicode_ci,
  `CREATED` date DEFAULT NULL,
  `UPDATED_BY` text COLLATE utf8_unicode_ci,
  `UPDATED` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `c_job`
--

INSERT INTO `c_job` (`C_JOB_ID`, `JOB_TITLE`, `SALARY_GLONE`, `SALARY_WAGE`, `MIN_SALARY`, `MAX_SALARY`, `IS_ACTIVE`, `CREATED_BY`, `CREATED`, `UPDATED_BY`, `UPDATED`) VALUES
(1, 'Trưởng phòng', '3', '5', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'Nhân viên', '2', '3', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 'Phó Trưởng Phòng', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(10, 'GS Platinum (MF) - Nhật Bản', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(11, 'GS 90Ah (R) Platinum - Nhật Bản', '1', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(12, 'Michelin', '2', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `c_job_history`
--

CREATE TABLE `c_job_history` (
  `C_JOB_HISTORY_ID` int(10) NOT NULL,
  `EMPLOYEE_ID` text COLLATE utf8_unicode_ci NOT NULL,
  `EMPLOYEE_TYPE_ID` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'Loại cán bộ, viên chức, hợp đồng, thử việc...',
  `START_DATE` text COLLATE utf8_unicode_ci NOT NULL,
  `END_DATE` date NOT NULL,
  `JOB_ID` text COLLATE utf8_unicode_ci NOT NULL,
  `DEPARTMENT_ID` text COLLATE utf8_unicode_ci NOT NULL,
  `SALARY_GLONE` decimal(10,0) DEFAULT NULL COMMENT 'Ngạch lương',
  `SALARY_WAGE` decimal(10,0) DEFAULT NULL COMMENT 'Bậc lương',
  `IS_ACTIVE` tinyint(1) DEFAULT NULL,
  `CREATED_BY` text COLLATE utf8_unicode_ci,
  `CREATED` date DEFAULT NULL,
  `UPDATED_BY` text COLLATE utf8_unicode_ci,
  `UPDATED` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `c_maintenance`
--

CREATE TABLE `c_maintenance` (
  `C_MAINTENANCE_ID` int(10) NOT NULL,
  `CODE` text COLLATE utf8_unicode_ci NOT NULL,
  `NAME` text COLLATE utf8_unicode_ci NOT NULL,
  `TYPE` text COLLATE utf8_unicode_ci NOT NULL,
  `PARENT_ID` text COLLATE utf8_unicode_ci,
  `C_ASSET_ID` text COLLATE utf8_unicode_ci NOT NULL,
  `TEXT_A` text COLLATE utf8_unicode_ci,
  `TEXT_B` text COLLATE utf8_unicode_ci,
  `TEXT_C` text COLLATE utf8_unicode_ci,
  `TEXT_D` text COLLATE utf8_unicode_ci,
  `TEXT_E` text COLLATE utf8_unicode_ci,
  `TEXT_F` text COLLATE utf8_unicode_ci,
  `TEXT_G` text COLLATE utf8_unicode_ci,
  `TEXT_H` text COLLATE utf8_unicode_ci,
  `COST` decimal(10,0) DEFAULT NULL COMMENT 'Chi phí chung (%)',
  `CONTENT` text COLLATE utf8_unicode_ci,
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  `IS_ACTIVE` tinyint(1) DEFAULT NULL,
  `CREATED` datetime DEFAULT NULL,
  `CREATED_BY` text COLLATE utf8_unicode_ci,
  `UPDATED` datetime DEFAULT NULL,
  `UPDATED_BY` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `c_maintenance`
--

INSERT INTO `c_maintenance` (`C_MAINTENANCE_ID`, `CODE`, `NAME`, `TYPE`, `PARENT_ID`, `C_ASSET_ID`, `TEXT_A`, `TEXT_B`, `TEXT_C`, `TEXT_D`, `TEXT_E`, `TEXT_F`, `TEXT_G`, `TEXT_H`, `COST`, `CONTENT`, `DESCRIPTION`, `IS_ACTIVE`, `CREATED`, `CREATED_BY`, `UPDATED`, `UPDATED_BY`) VALUES
(1, 'DXBD_01_20171030', 'Đơn xin bảo dưỡng xe 30A-25740', '1', NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'BBDN-02-171031', 'Biên bản đề nghị bảo dưỡng 30A-68688', '0', NULL, '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 'BBKTKT-01-171031', 'Biên bản kiểm tra kỹ thuật xe 30A-68688', '2', '2', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `c_maintenance_type`
--

CREATE TABLE `c_maintenance_type` (
  `C_MAINTENANCE_TYPE_ID` int(10) NOT NULL,
  `CODE` text COLLATE utf8_unicode_ci,
  `NAME` text COLLATE utf8_unicode_ci NOT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  `IS_ACTIVE` tinyint(1) DEFAULT NULL,
  `CREATED` datetime DEFAULT NULL,
  `CREATED_BY` text COLLATE utf8_unicode_ci,
  `UPDATED` datetime DEFAULT NULL,
  `UPDATED_BY` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `c_maintenance_type`
--

INSERT INTO `c_maintenance_type` (`C_MAINTENANCE_TYPE_ID`, `CODE`, `NAME`, `DESCRIPTION`, `IS_ACTIVE`, `CREATED`, `CREATED_BY`, `UPDATED`, `UPDATED_BY`) VALUES
(0, '0', 'Biên bản đề nghị bảo dưỡng', NULL, NULL, NULL, NULL, NULL, NULL),
(1, '1', 'Đơn xin sửa chữa, thay thế phụ tùng ôtô - xe máy', NULL, NULL, NULL, NULL, NULL, NULL),
(2, '2', 'Biên bản kiểm tra kỹ thuật', NULL, NULL, NULL, NULL, NULL, NULL),
(3, '3', 'Biên bản bàn giao kỹ thuật', NULL, NULL, NULL, NULL, NULL, NULL),
(4, '4', 'Biên bản nghiệm thu kỹ thuật', NULL, NULL, NULL, NULL, NULL, NULL),
(5, '5', 'Biên bản nghiệm thu bảo dưỡng I', NULL, NULL, NULL, NULL, NULL, NULL),
(6, '6', 'Biên bản nghiệm thu bảo dưỡng II', NULL, NULL, NULL, NULL, NULL, NULL),
(7, '7', 'Biên bản thu hồi vật tư', NULL, NULL, NULL, NULL, NULL, NULL),
(8, '8', 'Dự toán kinh phí', NULL, NULL, NULL, NULL, NULL, NULL),
(9, '9', 'Quyết toán kinh phí', NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `c_material`
--

CREATE TABLE `c_material` (
  `C_MATERIAL_ID` int(10) NOT NULL,
  `CODE` text COLLATE utf8_unicode_ci NOT NULL,
  `NAME` text COLLATE utf8_unicode_ci NOT NULL,
  `NUMBER` int(10) DEFAULT NULL,
  `C_UNIT_ID` text COLLATE utf8_unicode_ci NOT NULL,
  `C_MATERIAL_TYPE_ID` text COLLATE utf8_unicode_ci NOT NULL,
  `C_MATERIAL_GROUP_ID` text COLLATE utf8_unicode_ci NOT NULL,
  `C_ORGANIZATION_ID` text COLLATE utf8_unicode_ci NOT NULL,
  `SIZES` text COLLATE utf8_unicode_ci COMMENT 'Kích thước',
  `DEPRECIATION_DATE` date DEFAULT NULL,
  `C_PROVIDER_ID` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'Nhãn hiệu, nhà cung cấp',
  `C_COUNTRY_ID` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'Nước sản xuất',
  `CONTENT` text COLLATE utf8_unicode_ci,
  `URL_IMAGE` text COLLATE utf8_unicode_ci,
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  `IS_ACTIVE` tinyint(1) DEFAULT NULL,
  `CREATED` date DEFAULT NULL,
  `CREATED_BY` text COLLATE utf8_unicode_ci,
  `UPDATED` date DEFAULT NULL,
  `UPDATED_BY` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `c_material`
--

INSERT INTO `c_material` (`C_MATERIAL_ID`, `CODE`, `NAME`, `NUMBER`, `C_UNIT_ID`, `C_MATERIAL_TYPE_ID`, `C_MATERIAL_GROUP_ID`, `C_ORGANIZATION_ID`, `SIZES`, `DEPRECIATION_DATE`, `C_PROVIDER_ID`, `C_COUNTRY_ID`, `CONTENT`, `URL_IMAGE`, `DESCRIPTION`, `IS_ACTIVE`, `CREATED`, `CREATED_BY`, `UPDATED`, `UPDATED_BY`) VALUES
(1, 'LOP900x20', 'Lốp 900x20', 1, '1', '1', '1', '1', '900x20', '2017-10-30', '1', '1', 'Lốp PLA', NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `c_material_group`
--

CREATE TABLE `c_material_group` (
  `C_MATERIAL_GROUP_ID` int(10) NOT NULL,
  `NAME` text COLLATE utf8_unicode_ci NOT NULL,
  `IS_ACTIVE` tinyint(1) DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  `CREATED` datetime DEFAULT NULL,
  `CREATED_BY` text COLLATE utf8_unicode_ci,
  `UPDATED` datetime DEFAULT NULL,
  `UPDATED_BY` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `c_material_group`
--

INSERT INTO `c_material_group` (`C_MATERIAL_GROUP_ID`, `NAME`, `IS_ACTIVE`, `DESCRIPTION`, `CREATED`, `CREATED_BY`, `UPDATED`, `UPDATED_BY`) VALUES
(1, 'Nhóm 1', NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'Nhóm 2', NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `c_material_type`
--

CREATE TABLE `c_material_type` (
  `C_MATERIAL_TYPE_ID` int(10) NOT NULL,
  `CODE` text COLLATE utf8_unicode_ci,
  `NAME` text COLLATE utf8_unicode_ci NOT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  `IS_ACTIVE` tinyint(1) DEFAULT NULL,
  `CREATED` datetime DEFAULT NULL,
  `CREATED_BY` text COLLATE utf8_unicode_ci,
  `UPDATED` datetime DEFAULT NULL,
  `UPDATED_BY` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `c_material_type`
--

INSERT INTO `c_material_type` (`C_MATERIAL_TYPE_ID`, `CODE`, `NAME`, `DESCRIPTION`, `IS_ACTIVE`, `CREATED`, `CREATED_BY`, `UPDATED`, `UPDATED_BY`) VALUES
(1, 'PHAN_GAM', 'Phần gầm', NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'THUY_LUC', 'Phần thủy lực', NULL, NULL, NULL, NULL, NULL, NULL),
(3, 'MAY', 'Máy', NULL, NULL, NULL, NULL, NULL, NULL),
(4, 'GIAM', 'Giám', NULL, NULL, NULL, NULL, NULL, NULL),
(5, 'DIEN', 'Điện', NULL, NULL, NULL, NULL, NULL, NULL),
(6, 'KHAC', 'Khác', NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `c_organization_task`
--

CREATE TABLE `c_organization_task` (
  `task_id` int(11) NOT NULL,
  `task_name` varchar(200) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `task_group_id` int(11) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `budget` float DEFAULT NULL,
  `currency` varchar(5) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `task_piority_id` int(11) DEFAULT NULL,
  `task_content` varchar(1000) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `attachment` varchar(1000) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `process_user_id` int(11) DEFAULT NULL COMMENT 'người thực hiện',
  `progress` int(11) DEFAULT NULL COMMENT 'tiến độ công việc',
  `status` int(11) DEFAULT NULL,
  `task_parent_id` int(11) DEFAULT NULL,
  `insert_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `inserted_user_id` int(11) DEFAULT NULL COMMENT 'người tạo',
  `updated_user_id` int(11) DEFAULT NULL COMMENT 'người cập nhật'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- --------------------------------------------------------

--
-- Table structure for table `c_procedure`
--

CREATE TABLE `c_procedure` (
  `C_PROCEDURE_ID` int(10) NOT NULL,
  `CODE` text COLLATE utf8_unicode_ci NOT NULL,
  `NAME` text COLLATE utf8_unicode_ci NOT NULL,
  `LEVEL` text COLLATE utf8_unicode_ci NOT NULL,
  `TYPE` text COLLATE utf8_unicode_ci NOT NULL,
  `C_FIELD_ID` text COLLATE utf8_unicode_ci NOT NULL,
  `CONTENT` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  `IS_ACTIVE` tinyint(1) DEFAULT NULL,
  `CREATED` datetime DEFAULT NULL,
  `CREATED_BY` text COLLATE utf8_unicode_ci,
  `UPDATED` datetime DEFAULT NULL,
  `UPDATED_BY` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `c_process_guide`
--

CREATE TABLE `c_process_guide` (
  `process_guide_id` int(11) NOT NULL,
  `process_guide_name` varchar(200) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `description` varchar(1000) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `position` varchar(20) COLLATE utf8_vietnamese_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `c_process_guide`
--

INSERT INTO `c_process_guide` (`process_guide_id`, `process_guide_name`, `description`, `status`, `position`) VALUES
(1, 'Đăng ký tài khoản', 'group__1', 0, '1'),
(2, 'Nộp hồ sơ trực tuyến', 'group__2', 1, '2'),
(3, 'Thanh toán lệ phí', 'group__3', 1, '3');

-- --------------------------------------------------------

--
-- Table structure for table `c_profile_machine`
--

CREATE TABLE `c_profile_machine` (
  `C_PROFILE_MACHINE_ID` int(10) NOT NULL,
  `CODE` text COLLATE utf8_unicode_ci,
  `NAME` text COLLATE utf8_unicode_ci,
  `MANUFACTORY_COUNTRY` text COLLATE utf8_unicode_ci,
  `MANUFACTORY_YEAR` text COLLATE utf8_unicode_ci,
  `WHEEL_FORMULA` text COLLATE utf8_unicode_ci,
  `C_REPAIR_TYPE_ID` int(10) DEFAULT NULL,
  `SIZE_TOTAL` text COLLATE utf8_unicode_ci,
  `NUMBER_SEATING` text COLLATE utf8_unicode_ci,
  `WIDTH` text COLLATE utf8_unicode_ci,
  `WEIGHT` text COLLATE utf8_unicode_ci,
  `WEIGHT_CURRENT` text COLLATE utf8_unicode_ci,
  `VOLUME` text COLLATE utf8_unicode_ci,
  `MAX_POWER` text COLLATE utf8_unicode_ci,
  `DRIVE_SYSTEM` text COLLATE utf8_unicode_ci,
  `BATTERY` text COLLATE utf8_unicode_ci,
  `WHEEL_USE` text COLLATE utf8_unicode_ci,
  `DETAIL` text COLLATE utf8_unicode_ci,
  `AVATAR` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `c_profile_machine`
--

INSERT INTO `c_profile_machine` (`C_PROFILE_MACHINE_ID`, `CODE`, `NAME`, `MANUFACTORY_COUNTRY`, `MANUFACTORY_YEAR`, `WHEEL_FORMULA`, `C_REPAIR_TYPE_ID`, `SIZE_TOTAL`, `NUMBER_SEATING`, `WIDTH`, `WEIGHT`, `WEIGHT_CURRENT`, `VOLUME`, `MAX_POWER`, `DRIVE_SYSTEM`, `BATTERY`, `WHEEL_USE`, `DETAIL`, `AVATAR`) VALUES
(2, '1', '1', '1', '1', '1', 12, '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '101533_a.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `c_provider`
--

CREATE TABLE `c_provider` (
  `C_PROVIDER_ID` int(10) NOT NULL,
  `CODE` text COLLATE utf8_unicode_ci,
  `NAME` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'Tên nhãn hiệu, nhà cung cấp',
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  `IS_ACTIVE` tinyint(1) DEFAULT NULL,
  `CREATED` datetime DEFAULT NULL,
  `CREATED_BY` text COLLATE utf8_unicode_ci,
  `UPDATED_BY` datetime DEFAULT NULL,
  `UPDATED` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `c_provider`
--

INSERT INTO `c_provider` (`C_PROVIDER_ID`, `CODE`, `NAME`, `DESCRIPTION`, `IS_ACTIVE`, `CREATED`, `CREATED_BY`, `UPDATED_BY`, `UPDATED`) VALUES
(1, 'MERC', 'Mercedez', 'Hãng xe Mercedez', NULL, NULL, NULL, NULL, NULL),
(2, 'AN_PHAT', 'Công ty cổ phần công nghệ An Phát', 'Cung cấp mặt hàng Router, Network Device', NULL, NULL, NULL, NULL, NULL),
(3, 'HOA_PHAT', 'Công ty thương mại dịch vụ Hòa Phát', 'Cung cấp đồ dùng văn phòng, thiết bị văn phòng', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `c_repair_labor`
--

CREATE TABLE `c_repair_labor` (
  `C_REPAIR_LABOR_ID` int(10) NOT NULL,
  `PARENT_ID` int(10) DEFAULT NULL,
  `CODE` text COLLATE utf8_unicode_ci,
  `NAME` text COLLATE utf8_unicode_ci,
  `LEVEL_LABOR` text COLLATE utf8_unicode_ci,
  `QUOTA` text COLLATE utf8_unicode_ci,
  `C_REPAIR_TYPE_ID` int(10) DEFAULT NULL,
  `DECREASE_RATE` text COLLATE utf8_unicode_ci,
  `MAINTAIN_TYPE` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `c_repair_labor`
--

INSERT INTO `c_repair_labor` (`C_REPAIR_LABOR_ID`, `PARENT_ID`, `CODE`, `NAME`, `LEVEL_LABOR`, `QUOTA`, `C_REPAIR_TYPE_ID`, `DECREASE_RATE`, `MAINTAIN_TYPE`) VALUES
(1, NULL, '1', 'ĐỘNG CƠ', '5', NULL, NULL, NULL, 0),
(2, NULL, '2', 'PHẦN GẦM', '5', NULL, NULL, NULL, 0),
(3, NULL, '3', 'PHẦN SỬA CHỮA CƠ KHÍ', '5', NULL, NULL, NULL, 0),
(4, NULL, '4', 'PHẦN ĐIỆN', '5', NULL, NULL, NULL, 0),
(128, 1, 'Thay xéc măng (bao gồm tháo lắp, thay thế)', 'Thay xéc măng (bao gồm tháo lắp, thay thế)', '5', '176', 14, '1', 0),
(129, 1, 'Thay xéc măng (bao gồm tháo lắp, thay thế)', 'Thay xéc măng (bao gồm tháo lắp, thay thế)', '5', '0', 16, '1', 0),
(130, 1, 'Thay xéc măng (bao gồm tháo lắp, thay thế)', 'Thay xéc măng (bao gồm tháo lắp, thay thế)', '5', '160', 6, '1', 0),
(131, 1, 'Thay xéc măng (bao gồm tháo lắp, thay thế)', 'Thay xéc măng (bao gồm tháo lắp, thay thế)', '5', '176', 4, '1', 0),
(132, 1, 'Thay xéc măng (bao gồm tháo lắp, thay thế)', 'Thay xéc măng (bao gồm tháo lắp, thay thế)', '5', '155', 2, '1', 0),
(133, 4, 'Tháo lắp két nước', 'Tháo lắp két nước', '5', '176', 12, '1', 0),
(134, 4, 'Tháo lắp két nước', 'Tháo lắp két nước', '5', '200', 10, '1', 0),
(135, 4, 'Tháo lắp két nước', 'Tháo lắp két nước', '5', '155', 8, '1', 0),
(136, 4, 'Tháo lắp két nước', 'Tháo lắp két nước', '5', '176', 14, '1', 0),
(137, 4, 'Tháo lắp két nước', 'Tháo lắp két nước', '5', '0', 16, '1', 0),
(138, 4, 'Tháo lắp két nước', 'Tháo lắp két nước', '5', '160', 6, '1', 0),
(139, 4, 'Tháo lắp két nước', 'Tháo lắp két nước', '5', '176', 4, '1', 0),
(140, 4, 'Tháo lắp két nước', 'Tháo lắp két nước', '5', '155', 2, '1', 0),
(141, 2, 'Ly hợp (lá côn, bàn ép, bi T)', 'Ly hợp (lá côn, bàn ép, bi T)', '5', '176', 12, '1', 0),
(142, 2, 'Ly hợp (lá côn, bàn ép, bi T)', 'Ly hợp (lá côn, bàn ép, bi T)', '5', '200', 10, '1', 0),
(143, 2, 'Ly hợp (lá côn, bàn ép, bi T)', 'Ly hợp (lá côn, bàn ép, bi T)', '5', '155', 8, '1', 0),
(144, 2, 'Ly hợp (lá côn, bàn ép, bi T)', 'Ly hợp (lá côn, bàn ép, bi T)', '5', '176', 14, '1', 0),
(145, 2, 'Ly hợp (lá côn, bàn ép, bi T)', 'Ly hợp (lá côn, bàn ép, bi T)', '5', '0', 16, '1', 0),
(146, 2, 'Ly hợp (lá côn, bàn ép, bi T)', 'Ly hợp (lá côn, bàn ép, bi T)', '5', '160', 6, '1', 0),
(147, 2, 'Ly hợp (lá côn, bàn ép, bi T)', 'Ly hợp (lá côn, bàn ép, bi T)', '5', '176', 4, '1', 0),
(148, 2, 'Ly hợp (lá côn, bàn ép, bi T)', 'Ly hợp (lá côn, bàn ép, bi T)', '5', '155', 2, '1', 0),
(149, 3, 'Thay máng nóc ca bin', 'Thay máng nóc ca bin', '5', '176', 12, '1', 0),
(150, 3, 'Thay máng nóc ca bin', 'Thay máng nóc ca bin', '5', '200', 10, '1', 0),
(151, 3, 'Thay máng nóc ca bin', 'Thay máng nóc ca bin', '5', '155', 8, '1', 0),
(152, 3, 'Thay máng nóc ca bin', 'Thay máng nóc ca bin', '5', '176', 14, '1', 0),
(153, 3, 'Thay máng nóc ca bin', 'Thay máng nóc ca bin', '5', '0', 16, '1', 0),
(154, 3, 'Thay máng nóc ca bin', 'Thay máng nóc ca bin', '5', '160', 6, '1', 0),
(155, 3, 'Thay máng nóc ca bin', 'Thay máng nóc ca bin', '5', '176', 4, '1', 0),
(156, 3, 'Thay máng nóc ca bin', 'Thay máng nóc ca bin', '5', '155', 2, '1', 0),
(157, 1, 'Thay xéc măng (bao gồm tháo lắp, thay thế)', 'Thay xéc măng (bao gồm tháo lắp, thay thế)', '5', '176', 12, '1', 0),
(158, 1, 'Thay xéc măng (bao gồm tháo lắp, thay thế)', 'Thay xéc măng (bao gồm tháo lắp, thay thế)', '5', '200', 10, '1', 0),
(159, 1, 'Thay xéc măng (bao gồm tháo lắp, thay thế)', 'Thay xéc măng (bao gồm tháo lắp, thay thế)', '5', '155', 8, '1', 0),
(160, 1, 'Thay xéc măng (bao gồm tháo lắp, thay thế)', 'Thay xéc măng (bao gồm tháo lắp, thay thế)', '5', '176', 14, '1', 0),
(161, 1, 'Thay xéc măng (bao gồm tháo lắp, thay thế)', 'Thay xéc măng (bao gồm tháo lắp, thay thế)', '5', '0', 16, '1', 0),
(162, 1, 'Thay xéc măng (bao gồm tháo lắp, thay thế)', 'Thay xéc măng (bao gồm tháo lắp, thay thế)', '5', '160', 6, '1', 0),
(163, 1, 'Thay xéc măng (bao gồm tháo lắp, thay thế)', 'Thay xéc măng (bao gồm tháo lắp, thay thế)', '5', '176', 4, '1', 0),
(164, 1, 'Thay xéc măng (bao gồm tháo lắp, thay thế)', 'Thay xéc măng (bao gồm tháo lắp, thay thế)', '5', '155', 2, '1', 0),
(165, 4, 'Tháo lắp két nước', 'Tháo lắp két nước', '5', '176', 12, '1', 0),
(166, 4, 'Tháo lắp két nước', 'Tháo lắp két nước', '5', '200', 10, '1', 0),
(167, 4, 'Tháo lắp két nước', 'Tháo lắp két nước', '5', '155', 8, '1', 0),
(168, 4, 'Tháo lắp két nước', 'Tháo lắp két nước', '5', '176', 14, '1', 0),
(169, 4, 'Tháo lắp két nước', 'Tháo lắp két nước', '5', '0', 16, '1', 0),
(170, 4, 'Tháo lắp két nước', 'Tháo lắp két nước', '5', '160', 6, '1', 0),
(171, 4, 'Tháo lắp két nước', 'Tháo lắp két nước', '5', '176', 4, '1', 0),
(172, 4, 'Tháo lắp két nước', 'Tháo lắp két nước', '5', '155', 2, '1', 0),
(173, 2, 'Ly hợp (lá côn, bàn ép, bi T)', 'Ly hợp (lá côn, bàn ép, bi T)', '5', '176', 12, '1', 0),
(174, 2, 'Ly hợp (lá côn, bàn ép, bi T)', 'Ly hợp (lá côn, bàn ép, bi T)', '5', '200', 10, '1', 0),
(175, 2, 'Ly hợp (lá côn, bàn ép, bi T)', 'Ly hợp (lá côn, bàn ép, bi T)', '5', '155', 8, '1', 0),
(176, 2, 'Ly hợp (lá côn, bàn ép, bi T)', 'Ly hợp (lá côn, bàn ép, bi T)', '5', '176', 14, '1', 0),
(177, 2, 'Ly hợp (lá côn, bàn ép, bi T)', 'Ly hợp (lá côn, bàn ép, bi T)', '5', '0', 16, '1', 0),
(178, 2, 'Ly hợp (lá côn, bàn ép, bi T)', 'Ly hợp (lá côn, bàn ép, bi T)', '5', '160', 6, '1', 0),
(179, 2, 'Ly hợp (lá côn, bàn ép, bi T)', 'Ly hợp (lá côn, bàn ép, bi T)', '5', '176', 4, '1', 0),
(180, 2, 'Ly hợp (lá côn, bàn ép, bi T)', 'Ly hợp (lá côn, bàn ép, bi T)', '5', '155', 2, '1', 0),
(181, 3, 'Thay máng nóc ca bin', 'Thay máng nóc ca bin', '5', '176', 12, '1', 0),
(182, 3, 'Thay máng nóc ca bin', 'Thay máng nóc ca bin', '5', '200', 10, '1', 0),
(183, 3, 'Thay máng nóc ca bin', 'Thay máng nóc ca bin', '5', '155', 8, '1', 0),
(184, 3, 'Thay máng nóc ca bin', 'Thay máng nóc ca bin', '5', '176', 14, '1', 0),
(185, 3, 'Thay máng nóc ca bin', 'Thay máng nóc ca bin', '5', '0', 16, '1', 0),
(186, 3, 'Thay máng nóc ca bin', 'Thay máng nóc ca bin', '5', '160', 6, '1', 0),
(187, 3, 'Thay máng nóc ca bin', 'Thay máng nóc ca bin', '5', '176', 4, '1', 0),
(188, 3, 'Thay máng nóc ca bin', 'Thay máng nóc ca bin', '5', '155', 2, '1', 0),
(189, 1, 'Thay xéc măng (bao gồm tháo lắp, thay thế)', 'Thay xéc măng (bao gồm tháo lắp, thay thế)', '5', '176', 12, '0.88', 0),
(190, 1, 'Thay xéc măng (bao gồm tháo lắp, thay thế)', 'Thay xéc măng (bao gồm tháo lắp, thay thế)', '5', '200', 10, '0.88', 0),
(191, 1, 'Thay xéc măng (bao gồm tháo lắp, thay thế)', 'Thay xéc măng (bao gồm tháo lắp, thay thế)', '5', '154.88', 8, '0.88', 0),
(192, 1, 'Thay xéc măng (bao gồm tháo lắp, thay thế)', 'Thay xéc măng (bao gồm tháo lắp, thay thế)', '5', '176', 14, '0.88', 0),
(193, 1, 'Thay xéc măng (bao gồm tháo lắp, thay thế)', 'Thay xéc măng (bao gồm tháo lắp, thay thế)', '5', '0', 16, '0.88', 0),
(194, 1, 'Thay xéc măng (bao gồm tháo lắp, thay thế)', 'Thay xéc măng (bao gồm tháo lắp, thay thế)', '5', '160', 6, '0.88', 0),
(195, 1, 'Thay xéc măng (bao gồm tháo lắp, thay thế)', 'Thay xéc măng (bao gồm tháo lắp, thay thế)', '5', '176', 4, '0.88', 0),
(196, 1, 'Thay xéc măng (bao gồm tháo lắp, thay thế)', 'Thay xéc măng (bao gồm tháo lắp, thay thế)', '5', '154.88', 2, '0.88', 0),
(197, 4, 'Tháo lắp két nước', 'Tháo lắp két nước', '5', '176', 12, '0.88', 0),
(198, 4, 'Tháo lắp két nước', 'Tháo lắp két nước', '5', '200', 10, '0.88', 0),
(199, 4, 'Tháo lắp két nước', 'Tháo lắp két nước', '5', '154.88', 8, '0.88', 0),
(200, 4, 'Tháo lắp két nước', 'Tháo lắp két nước', '5', '176', 14, '0.88', 0),
(201, 4, 'Tháo lắp két nước', 'Tháo lắp két nước', '5', '0', 16, '0.88', 0),
(202, 4, 'Tháo lắp két nước', 'Tháo lắp két nước', '5', '160', 6, '0.88', 0),
(203, 4, 'Tháo lắp két nước', 'Tháo lắp két nước', '5', '176', 4, '0.88', 0),
(204, 4, 'Tháo lắp két nước', 'Tháo lắp két nước', '5', '154.88', 2, '0.88', 0),
(205, 2, 'Ly hợp (lá côn, bàn ép, bi T)', 'Ly hợp (lá côn, bàn ép, bi T)', '5', '176', 12, '0.88', 0),
(206, 2, 'Ly hợp (lá côn, bàn ép, bi T)', 'Ly hợp (lá côn, bàn ép, bi T)', '5', '200', 10, '0.88', 0),
(207, 2, 'Ly hợp (lá côn, bàn ép, bi T)', 'Ly hợp (lá côn, bàn ép, bi T)', '5', '154.88', 8, '0.88', 0),
(208, 2, 'Ly hợp (lá côn, bàn ép, bi T)', 'Ly hợp (lá côn, bàn ép, bi T)', '5', '176', 14, '0.88', 0),
(209, 2, 'Ly hợp (lá côn, bàn ép, bi T)', 'Ly hợp (lá côn, bàn ép, bi T)', '5', '0', 16, '0.88', 0),
(210, 2, 'Ly hợp (lá côn, bàn ép, bi T)', 'Ly hợp (lá côn, bàn ép, bi T)', '5', '160', 6, '0.88', 0),
(211, 2, 'Ly hợp (lá côn, bàn ép, bi T)', 'Ly hợp (lá côn, bàn ép, bi T)', '5', '176', 4, '0.88', 0),
(212, 2, 'Ly hợp (lá côn, bàn ép, bi T)', 'Ly hợp (lá côn, bàn ép, bi T)', '5', '154.88', 2, '0.88', 0),
(213, 3, 'Thay máng nóc ca bin', 'Thay máng nóc ca bin', '5', '176', 12, '0.88', 0),
(214, 3, 'Thay máng nóc ca bin', 'Thay máng nóc ca bin', '5', '200', 10, '0.88', 0),
(215, 3, 'Thay máng nóc ca bin', 'Thay máng nóc ca bin', '5', '154.88', 8, '0.88', 0),
(216, 3, 'Thay máng nóc ca bin', 'Thay máng nóc ca bin', '5', '176', 14, '0.88', 0),
(217, 3, 'Thay máng nóc ca bin', 'Thay máng nóc ca bin', '5', '0', 16, '0.88', 0),
(218, 3, 'Thay máng nóc ca bin', 'Thay máng nóc ca bin', '5', '160', 6, '0.88', 0),
(219, 3, 'Thay máng nóc ca bin', 'Thay máng nóc ca bin', '5', '176', 4, '0.88', 0),
(220, 3, 'Thay máng nóc ca bin', 'Thay máng nóc ca bin', '5', '154.88', 2, '0.88', 0),
(221, 1, NULL, '123', '123', '123', 12, '0.8', 0);

-- --------------------------------------------------------

--
-- Table structure for table `c_repair_type`
--

CREATE TABLE `c_repair_type` (
  `C_REPAIR_TYPE_ID` int(10) NOT NULL,
  `CODE` text COLLATE utf8_unicode_ci,
  `NAME` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `c_repair_type`
--

INSERT INTO `c_repair_type` (`C_REPAIR_TYPE_ID`, `CODE`, `NAME`) VALUES
(2, '1', 'Xe 8 tấn'),
(4, '1', 'Xe 4 tấn'),
(6, '1', 'Xe 2 tấn'),
(8, '1', 'Máy 30 T'),
(10, '1', 'Máy 20 T'),
(12, '1', 'Máy 10 T'),
(14, '1', 'Máy FĐ'),
(16, '1', 'Máy khác');

-- --------------------------------------------------------

--
-- Table structure for table `c_security_level`
--

CREATE TABLE `c_security_level` (
  `id` int(11) NOT NULL,
  `security_level_name` varchar(255) DEFAULT NULL,
  `security_level_color` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `is_active` int(11) DEFAULT NULL,
  `created_by` varchar(45) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `updated_by` varchar(45) DEFAULT NULL,
  `updated_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `c_security_level`
--

INSERT INTO `c_security_level` (`id`, `security_level_name`, `security_level_color`, `description`, `is_active`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES
(1, 'test', '#0000', 'test324', 0, 'test', NULL, 'test', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `c_task`
--

CREATE TABLE `c_task` (
  `task_id` int(11) NOT NULL,
  `task_name` varchar(200) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `task_group_id` int(11) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `budget` float DEFAULT NULL,
  `currency` varchar(5) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `task_piority_id` int(11) DEFAULT NULL,
  `task_content` varchar(1000) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `task_parent_id` int(11) DEFAULT NULL,
  `assigned_by` int(11) DEFAULT NULL COMMENT 'người giao việc',
  `insert_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL COMMENT 'người tạo',
  `updated_by` int(11) DEFAULT NULL COMMENT 'người cập nhật',
  `reviewed_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `reviewed_result` int(11) DEFAULT NULL,
  `reviewed_content` varchar(3000) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `reviewed_by` int(11) DEFAULT NULL,
  `rate` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `c_task`
--

INSERT INTO `c_task` (`task_id`, `task_name`, `task_group_id`, `department_id`, `start_time`, `end_time`, `budget`, `currency`, `task_piority_id`, `task_content`, `status`, `task_parent_id`, `assigned_by`, `insert_time`, `update_time`, `created_by`, `updated_by`, `reviewed_time`, `reviewed_result`, `reviewed_content`, `reviewed_by`, `rate`) VALUES
(1, 'task_name', 1, 2, '2017-10-04 00:00:00', '2017-10-06 00:00:00', 100000, NULL, 1, 'content', 1, NULL, NULL, '2017-10-04 00:00:00', '2017-10-04 00:00:00', 1, 1, '2017-10-05 15:27:03', NULL, NULL, NULL, 70),
(2, 'task_childname', 1, 2, '2017-10-04 00:00:00', '2017-10-06 00:00:00', 100000, NULL, 1, 'sub_content', 1, 1, NULL, '2017-10-04 00:00:00', '2017-10-04 00:00:00', 1, 1, '2017-10-05 15:27:03', NULL, NULL, NULL, 30),
(3, 'abc', 1, 2, '2017-10-11 16:49:35', '2017-10-11 16:49:38', 1234, NULL, 1, 'ác', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `c_task_assignee`
--

CREATE TABLE `c_task_assignee` (
  `task_id` int(11) NOT NULL,
  `seq` int(11) NOT NULL,
  `assigned_id` int(11) NOT NULL,
  `is_main` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Triggers `c_task_assignee`
--
DELIMITER $$
CREATE TRIGGER `c_task_assignee_BI` BEFORE INSERT ON `c_task_assignee` FOR EACH ROW BEGIN
    SET NEW.seq = (
       SELECT IFNULL(MAX(seq), 0) + 1
       FROM c_task_assignee
       WHERE task_id  = NEW.task_id
    );
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `c_task_attachment`
--

CREATE TABLE `c_task_attachment` (
  `task_id` int(11) NOT NULL,
  `seq` int(11) NOT NULL,
  `attachment_type` int(11) NOT NULL COMMENT 'loại đính kèm: task hoặc báo cáo',
  `file_name` varchar(100) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `attachment_url` varchar(1000) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `hist_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `c_task_attachment`
--

INSERT INTO `c_task_attachment` (`task_id`, `seq`, `attachment_type`, `file_name`, `attachment_url`, `hist_id`) VALUES
(6, 1, 1, '014407_tuyen_26_3x_copy.jpg', '../data/task/2017/10/10/', NULL),
(7, 1, 2, '084335_d75fd_De_cuong_Do_an_tot_nghiep_HTTT_.doc', '../data/task_report/2017/10/15/', 3),
(4, 1, 1, '155518_bao_cao_datn_Mai_Thi_Nga.docx', '../data/task/2017/10/19/', NULL),
(4, 1, 2, '163340_BCompare_4_key.txt', '../data/task_report/2017/10/19/', 4);

--
-- Triggers `c_task_attachment`
--
DELIMITER $$
CREATE TRIGGER `c_task_attachment_BI` BEFORE INSERT ON `c_task_attachment` FOR EACH ROW BEGIN
    SET NEW.seq = (
       SELECT IFNULL(MAX(seq), 0) + 1
       FROM c_task_attachment
       WHERE task_id  = NEW.task_id
       AND attachment_type = NEW.attachment_type
    );
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `c_task_group`
--

CREATE TABLE `c_task_group` (
  `task_group_id` int(11) NOT NULL,
  `task_group_name` varchar(200) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `description` varchar(1000) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `color` varchar(20) COLLATE utf8_vietnamese_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `c_task_group`
--

INSERT INTO `c_task_group` (`task_group_id`, `task_group_name`, `description`, `status`, `color`) VALUES
(1, 'N', 'group__1', 1, 'blue'),
(2, 'group__2', 'group__2', 1, 'red'),
(3, 'group__3', 'group__3', 1, 'green');

-- --------------------------------------------------------

--
-- Table structure for table `c_task_history`
--

CREATE TABLE `c_task_history` (
  `hist_id` int(11) NOT NULL,
  `task_id` int(11) NOT NULL,
  `report_content` varchar(3000) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `report_time` datetime DEFAULT NULL,
  `inserted_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `inserted_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `report_rate` int(3) DEFAULT NULL COMMENT 'tiến độ công việc: dánh cho báo cáo và kiểm tra',
  `check_result` varchar(500) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `check_time` datetime DEFAULT NULL,
  `check_rate` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `c_task_history`
--

INSERT INTO `c_task_history` (`hist_id`, `task_id`, `report_content`, `report_time`, `inserted_time`, `updated_time`, `inserted_by`, `updated_by`, `report_rate`, `check_result`, `check_time`, `check_rate`) VALUES
(3, 7, 'test', '2017-10-15 08:43:31', '2017-10-15 08:43:44', '2017-10-15 09:18:11', NULL, NULL, 5, 'chua dung voi bao cao', '2017-10-15 09:17:56', 3),
(4, 4, 'y bc', '2017-10-19 16:33:41', '2017-10-19 16:33:47', '2017-10-19 16:43:05', NULL, NULL, 9, 'test kt', '2017-10-19 16:42:59', 5);

--
-- Triggers `c_task_history`
--
DELIMITER $$
CREATE TRIGGER `CHECK_RATE_AI` AFTER INSERT ON `c_task_history` FOR EACH ROW BEGIN
        update c_task set rate = (select check_rate from c_task_history where task_id = NEW.task_id and inserted_time = (SELECT max(inserted_time) from c_task_history where task_id = NEW.task_id GROUP BY task_id)) where task_id = NEW.task_id;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `CHECK_RATE_AU` AFTER UPDATE ON `c_task_history` FOR EACH ROW BEGIN
        update c_task set rate = (select check_rate from c_task_history where task_id = NEW.task_id and inserted_time = (SELECT max(inserted_time) from c_task_history where task_id = NEW.task_id GROUP BY task_id)) where task_id = NEW.task_id;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `c_task_piority`
--

CREATE TABLE `c_task_piority` (
  `task_piority_id` int(11) NOT NULL,
  `task_piority_name` varchar(100) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `description` varchar(1000) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `color` varchar(20) COLLATE utf8_vietnamese_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- --------------------------------------------------------

--
-- Table structure for table `c_task_priority`
--

CREATE TABLE `c_task_priority` (
  `task_priority_id` int(11) NOT NULL,
  `task_priority_name` varchar(100) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `description` varchar(1000) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `color` varchar(20) COLLATE utf8_vietnamese_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `c_task_priority`
--

INSERT INTO `c_task_priority` (`task_priority_id`, `task_priority_name`, `description`, `status`, `color`) VALUES
(1, 'pri01', 'pri01', 1, 'white');

-- --------------------------------------------------------

--
-- Table structure for table `c_task_review`
--

CREATE TABLE `c_task_review` (
  `task_id` int(11) NOT NULL,
  `seq` int(11) NOT NULL,
  `criteria_name` varchar(500) COLLATE utf8_vietnamese_ci DEFAULT NULL COMMENT 'tên tiêu chí',
  `mark` int(11) DEFAULT NULL COMMENT 'điểm đánh giá',
  `reviewed_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `result` int(11) NOT NULL COMMENT 'đạt hay ko đạt',
  `unsuitable` int(11) NOT NULL COMMENT 'điểm không phù hợp. chưa rõ là gì'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Triggers `c_task_review`
--
DELIMITER $$
CREATE TRIGGER `update_seq` BEFORE INSERT ON `c_task_review` FOR EACH ROW BEGIN
    SET NEW.seq = (
       SELECT IFNULL(MAX(seq), 0) + 1
       FROM c_task_review
       WHERE task_id  = NEW.task_id
    );
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `c_unit`
--

CREATE TABLE `c_unit` (
  `C_UNIT_ID` int(10) NOT NULL,
  `CODE` text COLLATE utf8_unicode_ci,
  `NAME` text COLLATE utf8_unicode_ci NOT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  `IS_ACTIVE` tinyint(1) DEFAULT NULL,
  `CREATED` datetime DEFAULT NULL,
  `CREATED_BY` text COLLATE utf8_unicode_ci,
  `UPDATED` datetime DEFAULT NULL,
  `UPDATED_BY` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `c_unit`
--

INSERT INTO `c_unit` (`C_UNIT_ID`, `CODE`, `NAME`, `DESCRIPTION`, `IS_ACTIVE`, `CREATED`, `CREATED_BY`, `UPDATED`, `UPDATED_BY`) VALUES
(1, 'CHIEC', 'Chiếc', 'Chiếc', NULL, NULL, NULL, NULL, NULL),
(2, 'CAI', 'Cái', 'Cái', NULL, NULL, NULL, NULL, NULL),
(3, 'CUON', 'Cuộn', 'Cuộn', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `m_maintenance_material`
--

CREATE TABLE `m_maintenance_material` (
  `M_MAINTENANCE_MATERIAL_ID` int(10) NOT NULL,
  `C_MAINTENANCE_ID` text COLLATE utf8_unicode_ci NOT NULL,
  `C_MATERIAL_ID` text COLLATE utf8_unicode_ci NOT NULL,
  `CODE` text COLLATE utf8_unicode_ci COMMENT 'Trong trường hợp có nhiều mã vật tư tại 1 phiếu (Ví dụ: Lốp)',
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  `IS_ACTIVE` tinyint(1) DEFAULT NULL,
  `CREATED` datetime DEFAULT NULL,
  `CREATED_BY` text COLLATE utf8_unicode_ci,
  `UPDATED` datetime DEFAULT NULL,
  `UPDATED_BY` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_maintenance_work`
--

CREATE TABLE `m_maintenance_work` (
  `M_MAINTENANCE_WORK_ID` int(10) NOT NULL,
  `C_MAINTENANCE_ID` text COLLATE utf8_unicode_ci NOT NULL,
  `CODE` text COLLATE utf8_unicode_ci,
  `C_MATERIAL_TYPE_ID` text COLLATE utf8_unicode_ci COMMENT 'Phần gầm, phần thủy lực, khác...',
  `NAME` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'Tên công việc',
  `NUMBER` decimal(10,0) NOT NULL COMMENT 'Số lượng',
  `LEVEL` int(11) NOT NULL COMMENT 'Bậc',
  `PRICE` decimal(10,0) NOT NULL COMMENT 'Đơn giá',
  `SUM` decimal(10,0) NOT NULL COMMENT 'Thành tiền',
  `CONTENT` text COLLATE utf8_unicode_ci,
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  `IS_ACTIVE` tinyint(1) DEFAULT NULL,
  `CREATED` datetime DEFAULT NULL,
  `CREATED_BY` text COLLATE utf8_unicode_ci,
  `UPDATED` datetime DEFAULT NULL,
  `UPDATED_BY` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_procedure_document`
--

CREATE TABLE `m_procedure_document` (
  `M_PROCEDURE_DOCUMENT_ID` int(10) NOT NULL,
  `C_PROCEDURE_ID` text COLLATE utf8_unicode_ci NOT NULL,
  `C_DOCUMENT_ID` text COLLATE utf8_unicode_ci NOT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  `IS_ACTIVE` tinyint(1) DEFAULT NULL,
  `CREATED` datetime DEFAULT NULL,
  `CREATED_BY` text COLLATE utf8_unicode_ci,
  `UPDATED` datetime DEFAULT NULL,
  `UPDATED_BY` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_profile_employee`
--

CREATE TABLE `m_profile_employee` (
  `M_PROFILE_EMPLOYEE_ID` int(10) NOT NULL,
  `C_PROFILE_MACHINE_ID` int(10) NOT NULL,
  `C_EMPLOYEE_ID` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `m_profile_employee`
--

INSERT INTO `m_profile_employee` (`M_PROFILE_EMPLOYEE_ID`, `C_PROFILE_MACHINE_ID`, `C_EMPLOYEE_ID`) VALUES
(2, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `organization`
--

CREATE TABLE `organization` (
  `id` int(11) NOT NULL,
  `CREATE_TIME` date DEFAULT NULL,
  `TIME_UPDATE` date DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `CODE` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `VALUE` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `POSITION` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `PARENT_ID` int(11) DEFAULT '0',
  `DESCRIPTION` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `STATUS` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `CREATED_BY` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `UPDATE_BY` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `level` varchar(25) COLLATE utf8_vietnamese_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `organization`
--

INSERT INTO `organization` (`id`, `CREATE_TIME`, `TIME_UPDATE`, `NAME`, `CODE`, `VALUE`, `POSITION`, `PARENT_ID`, `DESCRIPTION`, `STATUS`, `CREATED_BY`, `UPDATE_BY`, `level`) VALUES
(1, '2017-09-20', '2017-09-20', 'CÔNG TY MTV THOÁT NƯỚC HÀ NỘI', 'cty.x', '-1', '1', 0, 'CÔNG TY MTV THOÁT NƯỚC HÀ NỘI', 'ACTIVE', 'admin', 'admin', '0'),
(2, '2017-09-20', '2017-09-20', 'Xí nghiệp 1', 'tt.a', '1', '1', 1, NULL, 'ACTIVE', 'admin', 'admin', '1'),
(3, '2017-09-20', '2017-09-20', 'Xí nghiệp 2', 'tt.b', '2', '2', 1, NULL, 'ACTIVE', 'admin', 'admin', '1'),
(4, '2017-09-20', '2017-09-20', 'Phòng KT_CN', 'tt.c', '3', '3', 1, NULL, 'ACTIVE', 'admin', 'admin', '1'),
(5, '2017-09-20', '2017-09-20', 'Xí nghiệp TCCG-XL', 'p.a1', '1', '1', 1, NULL, 'ACTIVE', 'admin', 'admin', '2'),
(6, '2017-09-20', '2017-09-20', 'Ban quản lý xe', 'p.a2', '2', '2', 1, NULL, 'ACTIVE', 'admin', 'admin', '2'),
(7, '2017-09-20', '2017-09-20', 'Phòng QL-KT', 'p.b', '1', '1', 1, NULL, 'ACTIVE', 'admin', 'admin', '2'),
(10, '2017-09-21', '2017-09-21', 'Phòng Kế toán', 'p.D', '1', '1', 1, 'asdasd', NULL, 'admin', 'admin', '1');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `id` int(11) NOT NULL,
  `FIRST_NAME` varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  `LAST_NAME` varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  `SECTION` varchar(255) COLLATE utf8_vietnamese_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `BIRTH_DAY` date DEFAULT NULL,
  `EMAIL` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `FIRST_NAME` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `LAST_NAME` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `LOCATION` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `SEX` int(2) DEFAULT NULL,
  `PHONE` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `ROLE` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `TITLE` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `USERNAME` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `WEBSITE` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `BIRTH_DAY`, `EMAIL`, `FIRST_NAME`, `LAST_NAME`, `LOCATION`, `SEX`, `PHONE`, `ROLE`, `TITLE`, `USERNAME`, `WEBSITE`) VALUES
(1, '2017-09-06', 'EMAIL@gmail.com', 'EMAIL', 'EMAIL', 'fields', 1, 'Mai Việt anh', 'fields', 'fields', 'username1', 'fields'),
(2, '2017-09-06', 'EMAIL@gmail.com', 'name1', 'name1', 'fields', 1, 'phone1', 'fields', 'fields', 'username2', 'fields'),
(3, '2017-09-06', 'EMAIL@gmail.com', 'name2', 'name2', 'fields', 1, 'phone1', 'fields', 'fields', 'username3', 'fields'),
(4, '2017-09-06', 'EMAIL@gmail.com', 'name3', 'name3', 'fields', 1, 'phone1', 'fields', 'fields', 'username4', 'fields'),
(5, '2017-09-06', 'EMAIL@gmail.com', 'name4', 'name4', 'fields', 1, 'phone1', 'fields', 'fields', 'username5', 'fields'),
(6, '2017-09-06', 'EMAIL@gmail.com', 'name5', 'name5', 'fields', 1, 'phone1', 'fields', 'fields', 'username6', 'fields'),
(7, '2017-09-06', 'EMAIL@gmail.com', 'name6', 'name6', 'fields', 1, 'phone1', 'fields', 'fields', 'username7', 'fields');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cata_user`
--
ALTER TABLE `cata_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `c_asset`
--
ALTER TABLE `c_asset`
  ADD PRIMARY KEY (`C_ASSET_ID`);

--
-- Indexes for table `c_asset_class`
--
ALTER TABLE `c_asset_class`
  ADD PRIMARY KEY (`C_ASSET_CLASS_ID`);

--
-- Indexes for table `c_asset_group`
--
ALTER TABLE `c_asset_group`
  ADD PRIMARY KEY (`C_ASSET_GROUP_ID`);

--
-- Indexes for table `c_asset_type`
--
ALTER TABLE `c_asset_type`
  ADD PRIMARY KEY (`C_ASSET_TYPE_ID`);

--
-- Indexes for table `c_calendar`
--
ALTER TABLE `c_calendar`
  ADD PRIMARY KEY (`calendar_id`);

--
-- Indexes for table `c_color_defined`
--
ALTER TABLE `c_color_defined`
  ADD PRIMARY KEY (`color_name`);

--
-- Indexes for table `c_country`
--
ALTER TABLE `c_country`
  ADD PRIMARY KEY (`C_COUNTRY_ID`);

--
-- Indexes for table `c_document`
--
ALTER TABLE `c_document`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `c_education`
--
ALTER TABLE `c_education`
  ADD PRIMARY KEY (`C_EDUCATION_ID`);

--
-- Indexes for table `c_employees`
--
ALTER TABLE `c_employees`
  ADD PRIMARY KEY (`C_EMPLOYEE_ID`);

--
-- Indexes for table `c_employee_education`
--
ALTER TABLE `c_employee_education`
  ADD PRIMARY KEY (`C_EMPLOYEE_EDUCATION_ID`);

--
-- Indexes for table `c_employee_process`
--
ALTER TABLE `c_employee_process`
  ADD PRIMARY KEY (`C_EMPLOYEE_PROCESS_ID`);

--
-- Indexes for table `c_employee_reward`
--
ALTER TABLE `c_employee_reward`
  ADD PRIMARY KEY (`C_EMPLOYEE_REWARD_ID`);

--
-- Indexes for table `c_employee_type`
--
ALTER TABLE `c_employee_type`
  ADD PRIMARY KEY (`C_EMPLOYEE_TYPE_ID`);

--
-- Indexes for table `c_field`
--
ALTER TABLE `c_field`
  ADD PRIMARY KEY (`C_FIELD_ID`);

--
-- Indexes for table `c_file`
--
ALTER TABLE `c_file`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `c_job`
--
ALTER TABLE `c_job`
  ADD PRIMARY KEY (`C_JOB_ID`);

--
-- Indexes for table `c_job_history`
--
ALTER TABLE `c_job_history`
  ADD PRIMARY KEY (`C_JOB_HISTORY_ID`);

--
-- Indexes for table `c_maintenance`
--
ALTER TABLE `c_maintenance`
  ADD PRIMARY KEY (`C_MAINTENANCE_ID`);

--
-- Indexes for table `c_maintenance_type`
--
ALTER TABLE `c_maintenance_type`
  ADD PRIMARY KEY (`C_MAINTENANCE_TYPE_ID`);

--
-- Indexes for table `c_material`
--
ALTER TABLE `c_material`
  ADD PRIMARY KEY (`C_MATERIAL_ID`);

--
-- Indexes for table `c_material_group`
--
ALTER TABLE `c_material_group`
  ADD PRIMARY KEY (`C_MATERIAL_GROUP_ID`);

--
-- Indexes for table `c_material_type`
--
ALTER TABLE `c_material_type`
  ADD PRIMARY KEY (`C_MATERIAL_TYPE_ID`);

--
-- Indexes for table `c_organization_task`
--
ALTER TABLE `c_organization_task`
  ADD PRIMARY KEY (`task_id`);

--
-- Indexes for table `c_procedure`
--
ALTER TABLE `c_procedure`
  ADD PRIMARY KEY (`C_PROCEDURE_ID`);

--
-- Indexes for table `c_process_guide`
--
ALTER TABLE `c_process_guide`
  ADD PRIMARY KEY (`process_guide_id`);

--
-- Indexes for table `c_profile_machine`
--
ALTER TABLE `c_profile_machine`
  ADD PRIMARY KEY (`C_PROFILE_MACHINE_ID`);

--
-- Indexes for table `c_provider`
--
ALTER TABLE `c_provider`
  ADD PRIMARY KEY (`C_PROVIDER_ID`);

--
-- Indexes for table `c_repair_labor`
--
ALTER TABLE `c_repair_labor`
  ADD PRIMARY KEY (`C_REPAIR_LABOR_ID`);

--
-- Indexes for table `c_repair_type`
--
ALTER TABLE `c_repair_type`
  ADD PRIMARY KEY (`C_REPAIR_TYPE_ID`);

--
-- Indexes for table `c_security_level`
--
ALTER TABLE `c_security_level`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `c_task`
--
ALTER TABLE `c_task`
  ADD PRIMARY KEY (`task_id`);

--
-- Indexes for table `c_task_attachment`
--
ALTER TABLE `c_task_attachment`
  ADD KEY `task_id` (`task_id`,`attachment_type`,`seq`) USING BTREE;

--
-- Indexes for table `c_task_group`
--
ALTER TABLE `c_task_group`
  ADD PRIMARY KEY (`task_group_id`);

--
-- Indexes for table `c_task_history`
--
ALTER TABLE `c_task_history`
  ADD PRIMARY KEY (`hist_id`);

--
-- Indexes for table `c_task_piority`
--
ALTER TABLE `c_task_piority`
  ADD PRIMARY KEY (`task_piority_id`);

--
-- Indexes for table `c_task_priority`
--
ALTER TABLE `c_task_priority`
  ADD PRIMARY KEY (`task_priority_id`);

--
-- Indexes for table `c_task_review`
--
ALTER TABLE `c_task_review`
  ADD KEY `task_id` (`task_id`,`seq`);

--
-- Indexes for table `c_unit`
--
ALTER TABLE `c_unit`
  ADD PRIMARY KEY (`C_UNIT_ID`);

--
-- Indexes for table `m_maintenance_material`
--
ALTER TABLE `m_maintenance_material`
  ADD PRIMARY KEY (`M_MAINTENANCE_MATERIAL_ID`);

--
-- Indexes for table `m_maintenance_work`
--
ALTER TABLE `m_maintenance_work`
  ADD PRIMARY KEY (`M_MAINTENANCE_WORK_ID`);

--
-- Indexes for table `m_procedure_document`
--
ALTER TABLE `m_procedure_document`
  ADD PRIMARY KEY (`M_PROCEDURE_DOCUMENT_ID`);

--
-- Indexes for table `m_profile_employee`
--
ALTER TABLE `m_profile_employee`
  ADD PRIMARY KEY (`M_PROFILE_EMPLOYEE_ID`);

--
-- Indexes for table `organization`
--
ALTER TABLE `organization`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cata_user`
--
ALTER TABLE `cata_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `c_asset`
--
ALTER TABLE `c_asset`
  MODIFY `C_ASSET_ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `c_asset_class`
--
ALTER TABLE `c_asset_class`
  MODIFY `C_ASSET_CLASS_ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `c_asset_group`
--
ALTER TABLE `c_asset_group`
  MODIFY `C_ASSET_GROUP_ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `c_asset_type`
--
ALTER TABLE `c_asset_type`
  MODIFY `C_ASSET_TYPE_ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `c_calendar`
--
ALTER TABLE `c_calendar`
  MODIFY `calendar_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `c_country`
--
ALTER TABLE `c_country`
  MODIFY `C_COUNTRY_ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `c_document`
--
ALTER TABLE `c_document`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `c_education`
--
ALTER TABLE `c_education`
  MODIFY `C_EDUCATION_ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `c_employees`
--
ALTER TABLE `c_employees`
  MODIFY `C_EMPLOYEE_ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `c_employee_education`
--
ALTER TABLE `c_employee_education`
  MODIFY `C_EMPLOYEE_EDUCATION_ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `c_employee_process`
--
ALTER TABLE `c_employee_process`
  MODIFY `C_EMPLOYEE_PROCESS_ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `c_employee_reward`
--
ALTER TABLE `c_employee_reward`
  MODIFY `C_EMPLOYEE_REWARD_ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `c_employee_type`
--
ALTER TABLE `c_employee_type`
  MODIFY `C_EMPLOYEE_TYPE_ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `c_field`
--
ALTER TABLE `c_field`
  MODIFY `C_FIELD_ID` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `c_file`
--
ALTER TABLE `c_file`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `c_job`
--
ALTER TABLE `c_job`
  MODIFY `C_JOB_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `c_job_history`
--
ALTER TABLE `c_job_history`
  MODIFY `C_JOB_HISTORY_ID` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `c_maintenance`
--
ALTER TABLE `c_maintenance`
  MODIFY `C_MAINTENANCE_ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `c_maintenance_type`
--
ALTER TABLE `c_maintenance_type`
  MODIFY `C_MAINTENANCE_TYPE_ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `c_material`
--
ALTER TABLE `c_material`
  MODIFY `C_MATERIAL_ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `c_material_group`
--
ALTER TABLE `c_material_group`
  MODIFY `C_MATERIAL_GROUP_ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `c_material_type`
--
ALTER TABLE `c_material_type`
  MODIFY `C_MATERIAL_TYPE_ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `c_organization_task`
--
ALTER TABLE `c_organization_task`
  MODIFY `task_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `c_procedure`
--
ALTER TABLE `c_procedure`
  MODIFY `C_PROCEDURE_ID` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `c_process_guide`
--
ALTER TABLE `c_process_guide`
  MODIFY `process_guide_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `c_profile_machine`
--
ALTER TABLE `c_profile_machine`
  MODIFY `C_PROFILE_MACHINE_ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `c_provider`
--
ALTER TABLE `c_provider`
  MODIFY `C_PROVIDER_ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `c_repair_labor`
--
ALTER TABLE `c_repair_labor`
  MODIFY `C_REPAIR_LABOR_ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=222;
--
-- AUTO_INCREMENT for table `c_repair_type`
--
ALTER TABLE `c_repair_type`
  MODIFY `C_REPAIR_TYPE_ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `c_security_level`
--
ALTER TABLE `c_security_level`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `c_task`
--
ALTER TABLE `c_task`
  MODIFY `task_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `c_task_group`
--
ALTER TABLE `c_task_group`
  MODIFY `task_group_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `c_task_history`
--
ALTER TABLE `c_task_history`
  MODIFY `hist_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `c_task_piority`
--
ALTER TABLE `c_task_piority`
  MODIFY `task_piority_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `c_task_priority`
--
ALTER TABLE `c_task_priority`
  MODIFY `task_priority_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `c_unit`
--
ALTER TABLE `c_unit`
  MODIFY `C_UNIT_ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `m_maintenance_material`
--
ALTER TABLE `m_maintenance_material`
  MODIFY `M_MAINTENANCE_MATERIAL_ID` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `m_maintenance_work`
--
ALTER TABLE `m_maintenance_work`
  MODIFY `M_MAINTENANCE_WORK_ID` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `m_procedure_document`
--
ALTER TABLE `m_procedure_document`
  MODIFY `M_PROCEDURE_DOCUMENT_ID` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `m_profile_employee`
--
ALTER TABLE `m_profile_employee`
  MODIFY `M_PROFILE_EMPLOYEE_ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `organization`
--
ALTER TABLE `organization`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
