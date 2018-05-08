-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 08, 2018 at 12:29 AM
-- Server version: 10.1.26-MariaDB
-- PHP Version: 7.1.9

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
-- Table structure for table `c_maintain_sup`
--

CREATE TABLE `c_maintain_sup` (
  `c_maintain_sup_id` int(11) NOT NULL,
  `sup_name` text CHARACTER SET utf8 COLLATE utf8_vietnamese_ci,
  `sup_unit` text CHARACTER SET utf8 COLLATE utf8_vietnamese_ci,
  `c_repair_type_id` int(11) DEFAULT NULL,
  `quantity` text CHARACTER SET utf8 COLLATE utf8_vietnamese_ci,
  `MAINTAIN_TYPE` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `c_maintain_sup`
--

INSERT INTO `c_maintain_sup` (`c_maintain_sup_id`, `sup_name`, `sup_unit`, `c_repair_type_id`, `quantity`, `MAINTAIN_TYPE`) VALUES
(2, 'Dầu rửa (diesel)', 'lít', 2, '3', 2);

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
  `C_EMPLOYEE_ID` int(11) DEFAULT NULL,
  `MANUFACTORY_NAME` text COLLATE utf8_unicode_ci,
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

INSERT INTO `c_profile_machine` (`C_PROFILE_MACHINE_ID`, `CODE`, `NAME`, `C_EMPLOYEE_ID`, `MANUFACTORY_NAME`, `MANUFACTORY_COUNTRY`, `MANUFACTORY_YEAR`, `WHEEL_FORMULA`, `C_REPAIR_TYPE_ID`, `SIZE_TOTAL`, `NUMBER_SEATING`, `WIDTH`, `WEIGHT`, `WEIGHT_CURRENT`, `VOLUME`, `MAX_POWER`, `DRIVE_SYSTEM`, `BATTERY`, `WHEEL_USE`, `DETAIL`, `AVATAR`) VALUES
(884, '29L - 4873', 'Xe téc chở bùn', NULL, 'Nissan', 'Nhật', '1997', '4x2', 4, '6100x2150x2500mm', '3 chỗ', '3250mm', '4300kg', '4000kg', '6925 cm3', '180PS', 'có trợ lực', 'bình 12V-70Ah x 2 bình', '825-16', '- Dung tích téc chứa bùn: 3,7m3\r\n- Cơ cấu nâng hạ téc chứa bùn: được điều khiển bằng cơ cấu thủy lực\r\n- Đường kính ống hút, xả: F100mm\r\n- Téc chứa bùn chịu được áp:\r\n   + Áp suất hút: - 740mmHg\r\n   + Áp suất xả: 0,05Mpa\r\n- Vật liệu téc chứa bùn:\r\n   + Nửa trên: inox 304, dầy 5mm\r\n   + Nửa dưới: thép chịu lực, dầy 4,5mm', NULL),
(885, '29L - 4874', 'Xe téc chở bùn', NULL, 'Nissan', 'Nhật', '1997', '4x2', 4, '6100x2150x2500mm', '3 chỗ', '3250mm', '4300kg', '4000kg', '6925 cm3', '180PS', 'có trợ lực', 'bình 12V-70Ah x 2 bình', '825-16', '- Dung tích téc chứa bùn: 3,7m3\r\n- Cơ cấu nâng hạ téc chứa bùn: được điều khiển bằng cơ cấu thủy lực\r\n- Đường kính ống hút, xả: F100mm\r\n- Téc chứa bùn chịu được áp:\r\n   + Áp suất hút: - 740mmHg\r\n   + Áp suất xả: 0,05Mpa\r\n- Vật liệu téc chứa bùn:\r\n   + Nửa trên: inox 304, dầy 5mm\r\n   + Nửa dưới: thép chịu lực, dầy 4,5mm', NULL),
(886, '29L - 4829', 'Xe hút chân không 4 tấn', NULL, 'Nissan', 'Nhật', '1997', '4x2', 4, '7540x2140x2490mm', '3 chỗ', '3700mm', '6760kg', '4000kg', '10760cm3', '177HP', 'có trợ lực', 'bình 12V-70Ah x 2 bình', '825-16', '1. Téc chứa bùn:\r\n- Dung tích téc chứa bùn: 2,5m3\r\n- Cơ cấu nâng hạ téc chứa bùn: được điều khiển bằng cơ cấu thủy lực\r\n- Đường kính ống hút, xả: F100mm\r\n- Téc chứa bùn chịu được áp:\r\n   + Áp suất hút: - 740mmHg\r\n   + Áp suất xả: 0,05Mpa\r\n- Lưu lượng khí: 21m3/phút', NULL),
(887, '29C – 481.37', 'Xe chở bùn loại con lắc', NULL, 'Hino', 'Việt Nam', '2015', '4x2', 14, '6200x2400x3300mm', '3 chỗ', '3420mm', '5725kg', '3465kg', '5123cm3', '118kw', 'có trợ lực', 'bình 12V-70Ah x 2 bình', '825-16', '- Đặc điểm: thùng chứa bùn có thể tách rời khỏi xe\r\n- Dung tích thùng chứa bùn: 3,6m3 \r\n- Cơ cấu điều khiển nâng hạ: bằng hệ thống thủy lực\r\n- Nắp đậy thùng bùn được vận hành bằng cơ cấu puly dẫn động cáp\r\n- Vật liệu chế tạo: thép', NULL),
(888, '29C – 318.80', 'Xe chở bùn loại con lắc', NULL, 'Dongphong', 'Trung Quốc', '2013', '4x2', 14, '7000x2450x3200mm', '3 chỗ', '3950mm', '5900kg', '4355kg', '4257cm3', '105kw', 'có trợ lực', 'bình 12V-100Ah x 2 bình', '900-20', '- Đặc điểm: thùng chứa bùn có thể tách rời khỏi xe\r\n- Cơ cấu điều khiển nâng hạ: bằng hệ thống thủy lực\r\n- Nắp đậy thùng bùn được vận hành bằng cơ cấu puly dẫn động cáp\r\n- Dung tích thùng chứa bùn: 3,6m3 \r\n- Vật liệu chế tạo: thép', NULL),
(889, '30Y - 3368', 'Xe chở bùn loại con lắc', NULL, 'Dongphong', 'Trung Quốc', '2010', '4x2', 14, '7165x2490x3160mm', '3 chỗ', '3420mm', '5255kg', '4500kg', '4257cm3', '105kw', 'có trợ lực', 'bình 12V-100Ah x 2 bình', '900-20', '- Đặc điểm: thùng chứa bùn có thể tách rời khỏi xe- Cơ cấu điều khiển nâng hạ: bằng hệ thống thủy lực- Nắp đậy thùng bùn được vận hành bằng cơ cấu puly dẫn động cáp- Dung tích thùng chứa bùn: 3,6m3 - Vật liệu chế tạo: thép', NULL),
(890, '29C – 189.00', 'Xe chở bùn cống ngang', NULL, 'Dongphong', 'Trung Quốc', '2012', '4x2', 12, '6800x2490x2750mm', '3 chỗ', '3950mm', '6255kg', '4500kg', '5883cm3', '118kw', 'có trợ lực', 'bình 12V-100Ah x 2 bình', '900-20', '- Đặc điểm: thùng chứa bùn được lắp cố định trên xe\r\n- Hệ thống chuyên dùng để nâng hạ xe gom bùn được lắp trên thành xe\r\n- Cơ cấu nâng hạ thùng chứa bùn: được nâng hạ bằng hệ thống thủy lực và việc trút đổ giống xe tải ben tự đổ\r\n- Cơ cấu điều khiển nâng hạ xe gom: bằng hệ thống thủy lực\r\n- Dung tích thùng chứa bùn: 5m3 \r\n- Vật liệu chế tạo: thép', NULL),
(891, '29U – 4876', 'Xe chở bùn loại con lắc', NULL, 'Isuzu', 'Việt Nam', '2003', '4x2', 14, '6900x2480x2870mm', '3 chỗ', '4175mm', '5290kg', '3395kg', '4570cm3', '89kw', 'có trợ lực', 'bình 12V-700Ah x 2 bình', '825-16', '- Đặc điểm: thùng chứa bùn có thể tách rời khỏi xe- Cơ cấu điều khiển nâng hạ: bằng hệ thống thủy lực- Nắp đậy thùng bùn được vận hành bằng cơ cấu puly dẫn động cáp- Dung tích thùng chứa bùn: 3,6m3 - Vật liệu chế tạo: thép', NULL),
(892, '30U - 5151', 'Xe tải cẩu 1,4 tấn', NULL, 'Kia', 'Việt Nam', '2009', '4x2', 6, '5330x1770x2120mm', '3 chỗ', '2760mm', '1980kg', '1400kg', '2957cm3', '67,5kw', 'có trợ lực', 'bình 12V-70Ah x 1 bình', '+ Lốp trước: 650-16+ Lốp sau: 550-13', '- Nhãn hiệu: Soosan- Nước sản xuất: Hàn quốc- Tải trọng nâng lớn nhất: 2,2 tấn/1,9m- Bán kính làm việc: 6,2m- Loại cần/ số đoạn: lục giác/3 đoạn- Tốc độ kéo dài cần: 3,7m/11s- Tốc độ cáp: 11m/phút- Hệ thống thủy lực:+ Tốc độ bơm: 37 l/ph+ Áp suất bơm: 200 kgf/cm2- Chân chống: 02 bộ, vận hành thủy lực- Chiều rộng chân chống khi ra chân: 3,12m', NULL),
(893, '29L - 4855', 'Xe hút chân không 4 tấn', NULL, 'Nissan', 'Nhật', '1997', '4x2', 4, '6550x2050x2700mm', '3 chỗ', '3800mm', '7500kg', '4000kg', '6925cm3', '180HP', 'có trợ lực', 'bình 12V-70Ah x 2 bình', '825-16', '1. Téc chứa bùn:\r\n- Dung tích téc chứa bùn: 2,5m3\r\n- Cơ cấu nâng hạ téc chứa bùn: được điều khiển bằng cơ cấu thủy lực\r\n- Đường kính ống hút, xả: F100mm\r\n- Téc chứa bùn chịu được áp:\r\n   + Áp suất hút: - 740mmHg\r\n   + Áp suất xả: 0,05Mpa\r\n- Lưu lượng khí: 21m3/phút\r\n- Vật liệu téc chứa bùn:\r\n   + Nửa trên: inox 304, dầy 5mm\r\n   + Nửa dưới: thép chịu lực, dầy 4,5mm\r\n2. Bơm châm không\r\n- Chủng loại bơm: bơm chân không\r\n- Hệ thống truyền động: truyền chuyển động bằng dây đai.\r\n- áp suất hút của bơm: -740mmHg\r\n- Áp suất xả của bơm: 0,05Mpa\r\n- Lưu lượng khí: 21m3/phút', NULL),
(894, '29L - 4875', 'Xe téc chở bùn', NULL, 'Nissan', 'Nhật', '1997', '4x2', 4, '5900x2250x2350mm', '3 chỗ', '3800mm', '4480kg', '4000kg', '6925 cm3', '160PS', 'có trợ lực', 'bình 12V-70Ah x 2 bình', '825-16', '- Dung tích téc chứa bùn: 3,7m3\r\n- Cơ cấu nâng hạ téc chứa bùn: được điều khiển bằng cơ cấu thủy lực\r\n- Đường kính ống hút, xả: F100mm\r\n- Téc chứa bùn chịu được áp:\r\n   + Áp suất hút: - 740mmHg\r\n   + Áp suất xả: 0,05Mpa\r\n- Vật liệu téc chứa bùn:\r\n   + Nửa trên: inox 304, dầy 5mm\r\n   + Nửa dưới: thép chịu lực, dầy 4,5mm', NULL),
(895, '29L - 4876', 'Xe téc chở bùn', NULL, 'Nissan', 'Nhật', '1997', '4x2', 4, '6040x2140x2640mm', '3 chỗ', '3220mm', '6315kg', '4000kg', '6625 cm3', '177HP', 'có trợ lực', 'bình 12V-70Ah x 2 bình', '825-16', '- Dung tích téc chứa bùn: 3,7m3\r\n- Cơ cấu nâng hạ téc chứa bùn: được điều khiển bằng cơ cấu thủy lực\r\n- Đường kính ống hút, xả: F100mm\r\n- Téc chứa bùn chịu được áp:\r\n   + Áp suất hút: - 740mmHg\r\n   + Áp suất xả: 0,05Mpa\r\n- Vật liệu téc chứa bùn:\r\n   + Nửa trên: inox 304, dầy 5mm\r\n   + Nửa dưới: thép chịu lực, dầy 4,5mm', NULL),
(896, '29L - 4930', 'Xe phun nước phản lực', NULL, 'Nissan', 'Nhật', '1997', '4x2', 10, '6680x2170x2600mm', '3 chỗ', '3770mm', '6760kg', '5000kg', '6625 cm3', '177HP', 'có trợ lực', 'bình 12V-70Ah x 2 bình', '825-16', '1. Bơm:\r\n- Loại: kiểu bơm pít tông\r\n- Cơ cấu truyền động: bằng truyền động dây đai\r\n- Lưu lượng nước: 180 lít/phút\r\n- Áp suất bơm: 19,6Mpa\r\n2. Téc chứa nước:\r\n- Loại: hình vuông\r\n- Dung tích téc chứa: 2,5m3\r\n3. Ống áp lực chính:\r\n- Đường kính: ¾ inch x 80m\r\n- Áp suất làm việc lớn nhất:  áp suất làm việc 21,5Mpa\r\n- Áp suất phá hủy:  áp suất làm việc 86Mpa\r\n4. Ống áp lực phụ:\r\n- Đường kính: 3/8 inch x 20m\r\n- Áp suất làm việc lớn nhất:  áp suất làm việc 33Mpa\r\n- Áp suất phá hủy:  áp suất làm việc 132Mpa', NULL),
(897, '30Y - 3183', 'Xe chở bùn loại con lắc', NULL, 'Dongphong', 'Trung Quốc', '2010', '4x2', 14, '7165x2490x3160mm', '3 chỗ', '3920mm', '5255kg', '4500kg', '4257cm3', '105kw', 'có trợ lực', 'bình 12V-100Ah x 2 bình', '900-20', '- Đặc điểm: thùng chứa bùn có thể tách rời khỏi xe- Cơ cấu điều khiển nâng hạ: bằng hệ thống thủy lực- Nắp đậy thùng bùn được vận hành bằng cơ cấu puly dẫn động cáp- Dung tích thùng chứa bùn: 3,6m3 - Vật liệu chế tạo: thép', NULL),
(898, '29C – 319.58', 'Xe chở bùn loại con lắc', NULL, 'Dongphong', 'Trung Quốc', '2013', '4x2', 14, '7000x2450x3200mm', '3 chỗ', '3950mm', '5900kg', '4355kg', '4257cm3', '105kw', 'có trợ lực', 'bình 12V-100Ah x 2 bình', '900-20', '- Đặc điểm: thùng chứa bùn có thể tách rời khỏi xe\r\n- Cơ cấu điều khiển nâng hạ: bằng hệ thống thủy lực\r\n- Nắp đậy thùng bùn được vận hành bằng cơ cấu puly dẫn động cáp\r\n- Dung tích thùng chứa bùn: 3,6m3 \r\n- Vật liệu chế tạo: thép', NULL),
(899, '29C – 188.75', 'Xe chở bùn cống ngang', NULL, 'Dongphong', 'Trung Quốc', '2012', '4x2', 12, '6800x2490x2750mm', '3 chỗ', '3950mm', '6255kg', '4500kg', '5883cm3', '118kw', 'có trợ lực', 'bình 12V-100Ah x 2 bình', '900-20', '- Đặc điểm: thùng chứa bùn được lắp cố định trên xe\r\n- Hệ thống chuyên dùng để nâng hạ xe gom bùn được lắp trên thành xe\r\n- Cơ cấu nâng hạ thùng chứa bùn: được nâng hạ bằng hệ thống thủy lực và việc trút đổ giống xe tải ben tự đổ\r\n- Cơ cấu điều khiển nâng hạ xe gom: bằng hệ thống thủy lực\r\n- Dung tích thùng chứa bùn: 5m3 \r\n- Vật liệu chế tạo: thép', NULL),
(900, '29C – 183.26', 'Xe tải có gắn cẩu 3 tấn', NULL, 'Hino', 'Việt Nam', '2010', '4x2', 16, '7850x2420x3400mm', '3 chỗ', '4350mm', '5005kg', '5200kg', '5123cm3', '118kw', 'có trợ lực', 'bình 12V-70Ah x 2 bình', '825-16', '- Nhãn hiệu: Tadano\r\n- Nước sản xuất: Nhật\r\n- Tải trọng nâng lớn nhất: 3,03 tấn/2,5m\r\n- Bán kính làm việc: 7,5m\r\n- Loại cần/ số đoạn: lục giác/3 đoạn\r\n- Chiều cao nâng: 9,2m\r\n- Bán kính làm việc: 7,5m\r\n- Đường kính cáp: F 8mm x 51m', NULL),
(901, '29V - 7447', 'Xe chở bùn loại con lắc', NULL, 'Hino', 'Việt Nam', '2004', '4x2', 14, '6350x2400x3250mm', '3 chỗ', '3420mm', '5900kg', '4305kg', '6634 cm3', '121kw', 'có trợ lực', 'bình 12V-70Ah x 2 bình', '825-16', '- Đặc điểm: thùng chứa bùn có thể tách rời khỏi xe- Cơ cấu điều khiển nâng hạ: bằng hệ thống thủy lực- Nắp đậy thùng bùn được vận hành bằng cơ cấu puly dẫn động cáp- Dung tích thùng chứa bùn: 3,6m3 - Vật liệu chế tạo: thép', NULL),
(902, '29U – 4916', 'Xe chở bùn loại con lắc', NULL, 'Isuzu', 'Việt Nam', '2003', '4x2', 14, '6900x2480x2870mm', '3 chỗ', '4175mm', '5290kg', '3395kg', '4570cm3', '89kw', 'có trợ lực', 'bình 12V-700Ah x 2 bình', '825-20', '- Đặc điểm: thùng chứa bùn có thể tách rời khỏi xe- Cơ cấu điều khiển nâng hạ: bằng hệ thống thủy lực- Nắp đậy thùng bùn được vận hành bằng cơ cấu puly dẫn động cáp- Dung tích thùng chứa bùn: 3,6m3 - Vật liệu chế tạo: thép', NULL),
(903, '29L - 4847', 'Xe hút chân không 4 tấn', NULL, 'Nissan', 'Nhật', '1997', '4x2', 4, '6550x2050x2700mm', '3 chỗ', '3800mm', '5520kg', '4000kg', '6925 cm3', '180HP', 'có trợ lực', 'bình 12V-70Ah x 2 bình', '825-16', '1. Téc chứa bùn:\r\n- Dung tích téc chứa bùn: 2,5m3\r\n- Cơ cấu nâng hạ téc chứa bùn: được điều khiển bằng cơ cấu thủy lực\r\n- Đường kính ống hút, xả: F100mm\r\n- Téc chứa bùn chịu được áp:\r\n   + Áp suất hút: - 740mmHg\r\n   + Áp suất xả: 0,05Mpa\r\n- Lưu lượng khí: 21m3/phút\r\n- Vật liệu téc chứa bùn:\r\n   + Nửa trên: inox 304, dầy 5mm\r\n   + Nửa dưới: thép chịu lực, dầy 4,5mm\r\n2. Bơm châm không\r\n- Chủng loại bơm: bơm chân không\r\n- Hệ thống truyền động: truyền chuyển động bằng dây đai.\r\n- áp suất hút của bơm: -740mmHg\r\n- Áp suất xả của bơm: 0,05Mpa- Lưu lượng khí: 21m3/phút', NULL),
(904, '29L - 4881', 'Xe téc chở bùn', NULL, 'Nissan', 'Nhật', '1998', '4x2', 4, '5850x2100x2650mm', '3 chỗ', '3250mm', '4400kg', '4000kg', '6925 cm3', '180HP', 'có trợ lực', 'bình 12V-70Ah x 2 bình', '825-16', '- Dung tích téc chứa bùn: 3,7m3\r\n- Cơ cấu nâng hạ téc chứa bùn: được điều khiển bằng cơ cấu thủy lực\r\n- Đường kính ống hút, xả: F100mm\r\n- Téc chứa bùn chịu được áp:\r\n   + Áp suất hút: - 740mmHg\r\n   + Áp suất xả: 0,05Mpa\r\n- Vật liệu téc chứa bùn:\r\n   + Nửa trên: inox 304, dầy 5mm\r\n   + Nửa dưới: thép chịu lực, dầy 4,5mm', NULL),
(905, '29L - 4880', 'Xe téc chở bùn', NULL, 'Nissan', 'Nhật', '1998', '4x2', 4, '5850x2100x2650mm', '3 chỗ', '3250mm', '4430kg', '4000kg', '6925 cm3', '180PS', 'có trợ lực', 'bình 12V-70Ah x 2 bình', '825-16', '- Dung tích téc chứa bùn: 3,7m3\r\n- Cơ cấu nâng hạ téc chứa bùn: được điều khiển bằng cơ cấu thủy lực\r\n- Đường kính ống hút, xả: F100mm\r\n- Téc chứa bùn chịu được áp:\r\n   + Áp suất hút: - 740mmHg\r\n   + Áp suất xả: 0,05Mpa\r\n- Vật liệu téc chứa bùn:\r\n   + Nửa trên: inox 304, dầy 5mm\r\n   + Nửa dưới: thép chịu lực, dầy 4,5mm', NULL),
(906, '29X - 2218', 'Xe chở bùn loại con lắc', NULL, 'Hino', 'Việt Nam', '2004', '4x2', 14, '6350x2400x3250mm', '3 chỗ', '3420mm', '5900kg', '4305kg', '6634 cm3', '121kw', 'có trợ lực', 'bình 12V-70Ah x 2 bình', '825-16', '- Đặc điểm: thùng chứa bùn có thể tách rời khỏi xe- Cơ cấu điều khiển nâng hạ: bằng hệ thống thủy lực- Nắp đậy thùng bùn được vận hành bằng cơ cấu puly dẫn động cáp- Dung tích thùng chứa bùn: 3,6m3 - Vật liệu chế tạo: thép', NULL),
(907, '29C – 097.82', 'Xe chở bùn cống ngang', NULL, 'Dongphong', 'Trung Quốc', '2011', '4x2', 12, '6460x2462x2750mm', '3 chỗ', '3950mm', '6255kg', '4500kg', '5883cm3', '118kw', 'có trợ lực', 'bình 12V-100Ah x 2 bình', '900-20', '- Đặc điểm: thùng chứa bùn được lắp cố định trên xe\r\n- Hệ thống chuyên dùng để nâng hạ xe gom bùn được lắp trên thành xe\r\n- Cơ cấu nâng hạ thùng chứa bùn: được nâng hạ bằng hệ thống thủy lực và việc trút đổ giống xe tải ben tự đổ\r\n- Cơ cấu điều khiển nâng hạ xe gom: bằng hệ thống thủy lực\r\n- Dung tích thùng chứa bùn: 5m3 \r\n- Vật liệu chế tạo: thép', NULL),
(908, '30Y - 3772', 'Xe chở bùn loại con lắc', NULL, 'Dongphong', 'Trung Quốc', '2010', '4x2', 14, '7165x2490x3160mm', '3 chỗ', '3950mm', '5255kg', '4500kg', '4257cm3', '105kw', 'có trợ lực', 'bình 12V-100Ah x 2 bình', '900-20', '- Đặc điểm: thùng chứa bùn có thể tách rời khỏi xe- Cơ cấu điều khiển nâng hạ: bằng hệ thống thủy lực- Nắp đậy thùng bùn được vận hành bằng cơ cấu puly dẫn động cáp- Dung tích thùng chứa bùn: 3,6m3 - Vật liệu chế tạo: thép', NULL),
(909, '29C – 318.85', 'Xe chở bùn loại con lắc', NULL, 'Dongphong', 'Trung Quốc', '2013', '4x2', 14, '7000x2450x3200mm', '3 chỗ', '3950mm', '5900kg', '4355kg', '4257cm3', '105kw', 'có trợ lực', 'bình 12V-100Ah x 2 bình', '900-20', '- Đặc điểm: thùng chứa bùn có thể tách rời khỏi xe\r\n- Cơ cấu điều khiển nâng hạ: bằng hệ thống thủy lực\r\n- Nắp đậy thùng bùn được vận hành bằng cơ cấu puly dẫn động cáp\r\n- Dung tích thùng chứa bùn: 3,6m3 \r\n- Vật liệu chế tạo: thép', NULL),
(910, '30N - 0323', 'Xe chở bùn loại con lắc', NULL, 'Dongphong', 'Trung Quốc', '2007', '4x2', 14, '7350x2470x3100mm', '3 chỗ', '3950mm', '5965kg', '3600kg', '4257cm3', '105kw', 'có trợ lực', 'bình 12V-100Ah x 2 bình', '900-20', '- Đặc điểm: thùng chứa bùn có thể tách rời khỏi xe- Cơ cấu điều khiển nâng hạ: bằng hệ thống thủy lực- Nắp đậy thùng bùn được vận hành bằng cơ cấu puly dẫn động cáp- Dung tích thùng chứa bùn: 3,6m3 - Vật liệu chế tạo: thép', NULL),
(911, '30U - 5971', 'Xe tải cẩu 1,4 tấn', NULL, 'Kia', 'Việt Nam', '2009', '4x2', 6, '5330x1770x2120mm', '3 chỗ', '2760mm', '1980kg', '1400kg', '2957cm3', '67,5kw', 'có trợ lực', 'bình 12V-70Ah x 1 bình', '+ Lốp trước: 650-16+ Lốp sau: 550-13', '- Nhãn hiệu: Soosan- Nước sản xuất: Hàn quốc- Tải trọng nâng lớn nhất: 2,2 tấn/1,9m- Bán kính làm việc: 6,2m- Loại cần/ số đoạn: lục giác/3 đoạn- Tốc độ kéo dài cần: 3,7m/11s- Tốc độ cáp: 11m/phút- Hệ thống thủy lực:+ Tốc độ bơm: 37 l/ph+ Áp suất bơm: 200 kgf/cm2- Chân chống: 02 bộ, vận hành thủy lực- Chiều rộng chân chống khi ra chân: 3,12m', NULL),
(912, '29L - 4845', 'Xe hút chân không 4 tấn', NULL, 'Nissan', 'Nhật', '1997', '4x2', 4, '7540x2140x2490mm', '3 chỗ', '3700mm', '6760kg', '4000kg', '6625 cm3', '177HP', 'có trợ lực', 'bình 12V-70Ah x 2 bình', '825-16', '1. Téc chứa bùn:\r\n- Dung tích téc chứa bùn: 2,5m3\r\n- Cơ cấu nâng hạ téc chứa bùn: được điều khiển bằng cơ cấu thủy lực\r\n- Đường kính ống hút, xả: F100mm\r\n- Téc chứa bùn chịu được áp:\r\n   + Áp suất hút: - 740mmHg\r\n   + Áp suất xả: 0,05Mpa\r\n- Lưu lượng khí: 21m3/phút\r\n- Vật liệu téc chứa bùn:\r\n   + Nửa trên: inox 304, dầy 5mm\r\n   + Nửa dưới: thép chịu lực, dầy 4,5mm\r\n2. Bơm châm không\r\n- Chủng loại bơm: bơm chân không\r\n- Hệ thống truyền động: truyền chuyển động bằng dây đai.\r\n- áp suất hút của bơm: -740mmHg\r\n- Áp suất xả của bơm: 0,05Mpa\r\n- Lưu lượng khí: 21m3/phút', NULL),
(913, '29L - 4883', 'Xe téc chở bùn', NULL, 'Nissan', 'Nhật', '1998', '4x2', 4, '5850x2100x2650mm', '3 chỗ', '3250mm', '4430kg', '4000kg', '6925 cm3', '180PS', 'có trợ lực', 'bình 12V-70Ah x 2 bình', '825-16', '- Dung tích téc chứa bùn: 3,7m3\r\n- Cơ cấu nâng hạ téc chứa bùn: được điều khiển bằng cơ cấu thủy lực\r\n- Đường kính ống hút, xả: F100mm\r\n- Téc chứa bùn chịu được áp:\r\n   + Áp suất hút: - 740mmHg\r\n   + Áp suất xả: 0,05Mpa\r\n- Vật liệu téc chứa bùn:\r\n   + Nửa trên: inox 304, dầy 5mm\r\n   + Nửa dưới: thép chịu lực, dầy 4,5mm', NULL),
(914, '29L - 4882', 'Xe téc chở bùn', NULL, 'Nissan', 'Nhật', '1998', '4x2', 4, '6040x2140x2640mm', '3 chỗ', '3220mm', '4400kg', '4000kg', '6625 cm3', '177HP', 'có trợ lực', 'bình 12V-70Ah x 2 bình', '825-16', '- Dung tích téc chứa bùn: 3,7m3\r\n- Cơ cấu nâng hạ téc chứa bùn: được điều khiển bằng cơ cấu thủy lực\r\n- Đường kính ống hút, xả: F100mm\r\n- Téc chứa bùn chịu được áp:\r\n   + Áp suất hút: - 740mmHg\r\n   + Áp suất xả: 0,05Mpa\r\n- Vật liệu téc chứa bùn:\r\n   + Nửa trên: inox 304, dầy 5mm\r\n   + Nửa dưới: thép chịu lực, dầy 4,5mm', NULL),
(915, '29C – 319.20', 'Xe chở bùn loại con lắc', NULL, 'Dongphong', 'Trung Quốc', '2013', '4x2', 14, '7000x2450x3200mm', '3 chỗ', '3950mm', '5900kg', '4355kg', '4257cm3', '105kw', 'có trợ lực', 'bình 12V-100Ah x 2 bình', '900-20', '- Đặc điểm: thùng chứa bùn có thể tách rời khỏi xe\r\n- Cơ cấu điều khiển nâng hạ: bằng hệ thống thủy lực\r\n- Nắp đậy thùng bùn được vận hành bằng cơ cấu puly dẫn động cáp\r\n- Dung tích thùng chứa bùn: 3,6m3 \r\n- Vật liệu chế tạo: thép', NULL),
(916, '30Y - 3275', 'Xe chở bùn loại con lắc', NULL, 'Dongphong', 'Trung Quốc', '2010', '4x2', 14, '7165x2490x3160mm', '3 chỗ', '3950mm', '5255kg', '4500kg', '4257cm3', '105kw', 'có trợ lực', 'bình 12V-100Ah x 2 bình', '900-20', '- Đặc điểm: thùng chứa bùn có thể tách rời khỏi xe- Cơ cấu điều khiển nâng hạ: bằng hệ thống thủy lực- Nắp đậy thùng bùn được vận hành bằng cơ cấu puly dẫn động cáp- Dung tích thùng chứa bùn: 3,6m3 - Vật liệu chế tạo: thép', NULL),
(917, '29C – 188.59', 'Xe chở bùn cống ngang', NULL, 'Dongphong', 'Trung Quốc', '2012', '4x2', 12, '6800x2490x2750mm', '3 chỗ', '3950mm', '6255kg', '4500kg', '5883cm3', '118kw', 'có trợ lực', 'bình 12V-100Ah x 2 bình', '900-20', '- Đặc điểm: thùng chứa bùn được lắp cố định trên xe\r\n- Hệ thống chuyên dùng để nâng hạ xe gom bùn được lắp trên thành xe\r\n- Cơ cấu nâng hạ thùng chứa bùn: được nâng hạ bằng hệ thống thủy lực và việc trút đổ giống xe tải ben tự đổ\r\n- Cơ cấu điều khiển nâng hạ xe gom: bằng hệ thống thủy lực\r\n- Dung tích thùng chứa bùn: 5m3 \r\n- Vật liệu chế tạo: thép', NULL),
(918, '29C – 184.22', 'Xe tải có gắn cẩu 3 tấn', NULL, 'Hino', 'Việt Nam', '2010', '4x2', 16, '7850x2420x3400mm', '3 chỗ', '4350mm', '5005kg', '5200kg', '5123 cm3', '118kw', 'có trợ lực', 'bình 12V-70Ah x 2 bình', '825-16', '- Nhãn hiệu: Tadano\r\n- Nước sản xuất: Nhật\r\n- Tải trọng nâng lớn nhất: 3,03 tấn/2,5m\r\n- Bán kính làm việc: 7,5m\r\n- Loại cần/ số đoạn: lục giác/3 đoạn\r\n- Chiều cao nâng: 9,2m\r\n- Bán kính làm việc: 7,5m\r\n- Đường kính cáp: F 8mm x 51m', NULL),
(919, '29X - 5784', 'Xe chở bùn loại con lắc', NULL, 'Hino', 'Việt Nam', '2004', '4x2', 14, '6350x2400x3250mm', '3 chỗ', '3420mm', '5900kg', '4305g', '6634cm3', '121kw', 'có trợ lực', 'bình 12V-70Ah x 2 bình', '825-16', '- Đặc điểm: thùng chứa bùn có thể tách rời khỏi xe- Cơ cấu điều khiển nâng hạ: bằng hệ thống thủy lực- Nắp đậy thùng bùn được vận hành bằng cơ cấu puly dẫn động cáp- Dung tích thùng chứa bùn: 3,6m3 - Vật liệu chế tạo: thép', NULL),
(920, '29C – 480.50', 'Xe chở bùn loại con lắc', NULL, 'Hino', 'Việt Nam', '2015', '4x2', 14, '6200x2400x3300mm', '3 chỗ', '3420mm', '5725kg', '3465kg', '5123cm3', '118kw', 'có trợ lực', 'bình 12V-70Ah x 2 bình', '825-16', '- Đặc điểm: thùng chứa bùn có thể tách rời khỏi xe\r\n- Cơ cấu điều khiển nâng hạ: bằng hệ thống thủy lực\r\n- Nắp đậy thùng bùn được vận hành bằng cơ cấu puly dẫn động cáp\r\n- Dung tích thùng chứa bùn: 3,6m3 \r\n- Vật liệu chế tạo: thép', NULL),
(921, '30U - 5297', 'Xe tải cẩu 1,4 tấn', NULL, 'Kia', 'Việt Nam', '2009', '4x2', 6, '5330x1770x2120mm', '3 chỗ', '2760mm', '1980kg', '1400kg', '2957cm3', '67,5kw', 'có trợ lực', 'bình 12V-70Ah x 1 bình', '+ Lốp trước: 650-16+ Lốp sau: 550-13', '- Nhãn hiệu: Soosan- Nước sản xuất: Hàn quốc- Tải trọng nâng lớn nhất: 2,2 tấn/1,9m- Bán kính làm việc: 6,2m- Loại cần/ số đoạn: lục giác/3 đoạn- Tốc độ kéo dài cần: 3,7m/11s- Tốc độ cáp: 11m/phút- Hệ thống thủy lực:+ Tốc độ bơm: 37 l/ph+ Áp suất bơm: 200 kgf/cm2- Chân chống: 02 bộ, vận hành thủy lực- Chiều rộng chân chống khi ra chân: 3,12m', NULL),
(922, '29L - 4872', 'Xe tải ben 5 tấn', NULL, 'Nissan', 'Nhật', '1998', '4x2', 4, '5650x2300x2500mm', '3 chỗ', '3200mm', '3910kg', '4000kg', '3000cm3', '180PS', 'có trợ lực', 'bình 12V-70Ah x 2 bình', '825-16', '- Kích thước thùng xe: 3200x1900x500mm\r\n- Dung tích thùng: 3m3\r\n- Cơ cấu nâng hạ: bằng hệ thống thủy lực và nâng hạ ben để trút đổ vật liệu', NULL),
(923, '29Y - 4863', 'Xe phun nước phản lực', NULL, 'Nissan', 'Nhật', '2005', '4x2', 10, '6610x2200x2560mm', '3 chỗ', '3770mm', '5950kg', '2625kg', '6925 cm3', '151kw', 'có trợ lực', 'bình 12V-70Ah x 2 bình', '825-16', '1. Bơm:- Loại: kiểu bơm pít tông- Cơ cấu truyền động: bằng truyền động dây đai- Lưu lượng nước: 180 lít/phút- Áp suất bơm: 19,6Mpa2. Téc chứa nước:- Loại: hình vuông- Dung tích téc chứa: 2,5m33. Ống áp lực chính:- Đường kính: ¾ inch x 80m- Áp suất làm việc lớn nhất:  áp suất làm việc 21,5Mpa- Áp suất phá hủy:  áp suất làm việc 86Mpa3. Ống áp lực phụ:- Đường kính: 3/8 inch x 20m- Áp suất làm việc lớn nhất:  áp suất làm việc 33Mpa- Áp suất phá hủy:  áp suất làm việc 132Mpa', NULL),
(924, '29L - 4856', 'Xe hút chân không 4 tấn', NULL, 'Nissan', 'Nhật', '1997', '4x2', 4, '7540x2140x2490mm', '3 chỗ', '3700mm', '6760kg', '4000kg', '10760cm3', '177HP', 'có trợ lực', 'bình 12V-70Ah x 2 bình', '825-16', '1. Téc chứa bùn:\n- Dung tích téc chứa bùn: 2,5m3\n- Cơ cấu nâng hạ téc chứa bùn: được điều khiển bằng cơ cấu thủy lực\n- Đường kính ống hút, xả: F100mm\n- Téc chứa bùn chịu được áp:\n   + Áp suất hút: - 740mmHg \n   + Áp suất xả: 0,05Mpa\n- Lưu lượng khí: 21m3/phút\n- Vật liệu téc chứa bùn:\n   + Nửa trên: inox 304, dầy 5mm \n   + Nửa dưới: thép chịu lực, dầy 4,5mm\n2. Bơm châm không\n- Chủng loại bơm: bơm chân không\n- Hệ thống truyền động: truyền chuyển động bằng dây đai.\n- áp suất hút của bơm: -740mmHg\n- Áp suất xả của bơm: 0,05Mpa\n- Lưu lượng khí: 21m3/phút', ''),
(925, '29L - 4841', 'Xe téc chở nước', NULL, 'Nissan', 'Nhật', '1998', '4x2', 4, '6600x2220x2480mm', '3 chỗ', '3700mm', '4360kg', '4000kg', '6625 cm3', '177HP', 'có trợ lực', 'bình 12V-70Ah x 2 bình', '825-16', '- Dung tích téc chứa: 5m3\r\n- Lưu lượng bơm lớn nhất: 1400 lít/phút', NULL),
(926, '29L - 4886', 'Xe téc chở bùn', NULL, 'Nissan', 'Nhật', '1997', '4x2', 4, '6040x2140x2640mm', '3 chỗ', '3220mm', '6315kg', '4000kg', '6625 cm3', '177HP', 'có trợ lực', 'bình 12V-70Ah x 2 bình', '825-16', '- Dung tích téc chứa bùn: 3,7m3\r\n- Cơ cấu nâng hạ téc chứa bùn: được điều khiển bằng cơ cấu thủy lực\r\n- Đường kính ống hút, xả: F100mm\r\n- Téc chứa bùn chịu được áp:\r\n   + Áp suất hút: - 740mmHg\r\n   + Áp suất xả: 0,05Mpa\r\n- Vật liệu téc chứa bùn:\r\n   + Nửa trên: inox 304, dầy 5mm\r\n   + Nửa dưới: thép chịu lực, dầy 4,5mm', NULL),
(927, '29C – 188.68', 'Xe chở bùn cống ngang', NULL, 'Dongphong', 'Trung Quốc', '2012', '4x2', 12, '6800x2490x2750mm', '3 chỗ', '3950mm', '6255kg', '4500kg', '5883cm3', '118kw', 'có trợ lực', 'bình 12V-100Ah x 2 bình', '900-20', '- Đặc điểm: thùng chứa bùn được lắp cố định trên xe\r\n- Hệ thống chuyên dùng để nâng hạ xe gom bùn được lắp trên thành xe\r\n- Cơ cấu nâng hạ thùng chứa bùn: được nâng hạ bằng hệ thống thủy lực và việc trút đổ giống xe tải ben tự đổ\r\n- Cơ cấu điều khiển nâng hạ xe gom: bằng hệ thống thủy lực\r\n- Dung tích thùng chứa bùn: 5m3 \r\n- Vật liệu chế tạo: thép', NULL),
(928, '29C – 319.49', 'Xe chở bùn loại con lắc', NULL, 'Dongphong', 'Trung Quốc', '2013', '4x2', 14, '7000x2450x3200mm', '3 chỗ', '3950mm', '5900kg', '4355kg', '4257cm3', '105kw', 'có trợ lực', 'bình 12V-100Ah x 2 bình', '900-20', '- Đặc điểm: thùng chứa bùn có thể tách rời khỏi xe\r\n- Cơ cấu điều khiển nâng hạ: bằng hệ thống thủy lực\r\n- Nắp đậy thùng bùn được vận hành bằng cơ cấu puly dẫn động cáp\r\n- Dung tích thùng chứa bùn: 3,6m3 \r\n- Vật liệu chế tạo: thép', NULL),
(929, '29C – 319.41', 'Xe chở bùn loại con lắc', NULL, 'Dongphong', 'Trung Quốc', '2013', '4x2', 14, '7000x2450x3200mm', '3 chỗ', '3950mm', '5900kg', '4355kg', '4257cm3', '105kw', 'có trợ lực', 'bình 12V-100Ah x 2 bình', '900-20', '- Đặc điểm: thùng chứa bùn có thể tách rời khỏi xe\r\n- Cơ cấu điều khiển nâng hạ: bằng hệ thống thủy lực\r\n- Nắp đậy thùng bùn được vận hành bằng cơ cấu puly dẫn động cáp\r\n- Dung tích thùng chứa bùn: 3,6m3 \r\n- Vật liệu chế tạo: thép', NULL),
(930, '30Y - 3496', 'Xe chở bùn loại con lắc', NULL, 'Dongphong', 'Trung Quốc', '2010', '4x2', 14, '7165x2490x3160mm', '3 chỗ', '3950mm', '5255kg', '4500kg', '4257cm3', '105kw', 'có trợ lực', 'bình 12V-100Ah x 2 bình', '900-20', '- Đặc điểm: thùng chứa bùn có thể tách rời khỏi xe- Cơ cấu điều khiển nâng hạ: bằng hệ thống thủy lực- Nắp đậy thùng bùn được vận hành bằng cơ cấu puly dẫn động cáp- Dung tích thùng chứa bùn: 3,6m3 - Vật liệu chế tạo: thép', NULL),
(931, '29C – 184.59', 'Xe tải có gắn cẩu 3 tấn', NULL, 'Hino', 'Việt Nam', '2010', '4x2', 16, '7850x2420x3400mm', '3 chỗ', '4350mm', '5005kg', '5200kg', '5123 cm3', '118kw', 'có trợ lực', 'bình 12V-70Ah x 2 bình', '825-16', '- Nhãn hiệu: Tadano\r\n- Nước sản xuất: Nhật\r\n- Tải trọng nâng lớn nhất: 3,03 tấn/2,5m\r\n- Bán kính làm việc: 7,5m\r\n- Loại cần/ số đoạn: lục giác/3 đoạn\r\n- Chiều cao nâng: 9,2m\r\n- Bán kính làm việc: 7,5m\r\n- Đường kính cáp: F 8mm x 51m', NULL),
(932, '29V - 7459', 'Xe chở bùn loại con lắc', NULL, 'Hino', 'Việt Nam', '2004', '4x2', 14, '6350x2400x3250mm', '3 chỗ', '3420mm', '5900kg', '4305g', '6634cm3', '121kw', 'có trợ lực', 'bình 12V-70Ah x 2 bình', '825-16', '- Đặc điểm: thùng chứa bùn có thể tách rời khỏi xe- Cơ cấu điều khiển nâng hạ: bằng hệ thống thủy lực- Nắp đậy thùng bùn được vận hành bằng cơ cấu puly dẫn động cáp- Dung tích thùng chứa bùn: 3,6m3 - Vật liệu chế tạo: thép', NULL),
(933, '29X - 2216', 'Xe chở bùn loại con lắc', NULL, 'Hino', 'Việt Nam', '2004', '4x2', 14, '6350x2400x3250mm', '3 chỗ', '3420mm', '5900kg', '4305kg', '6634 cm3', '121kw', 'có trợ lực', 'bình 12V-70Ah x 2 bình', '825-16', '- Đặc điểm: thùng chứa bùn có thể tách rời khỏi xe- Cơ cấu điều khiển nâng hạ: bằng hệ thống thủy lực- Nắp đậy thùng bùn được vận hành bằng cơ cấu puly dẫn động cáp- Dung tích thùng chứa bùn: 3,6m3 - Vật liệu chế tạo: thép', NULL),
(934, '30U - 5702', 'Xe tải cẩu 1,4 tấn', NULL, 'Kia', 'Việt Nam', '2009', '4x2', 6, '5330x1770x2120mm', '3 chỗ', '2760mm', '1980kg', '1400kg', '2957cm3', '67,5kw', 'có trợ lực', 'bình 12V-70Ah x 1 bình', '+ Lốp trước: 650-16+ Lốp sau: 550-13', '- Nhãn hiệu: Soosan- Nước sản xuất: Hàn quốc- Tải trọng nâng lớn nhất: 2,2 tấn/1,9m- Bán kính làm việc: 6,2m- Loại cần/ số đoạn: lục giác/3 đoạn- Tốc độ kéo dài cần: 3,7m/11s- Tốc độ cáp: 11m/phút- Hệ thống thủy lực:+ Tốc độ bơm: 37 l/ph+ Áp suất bơm: 200 kgf/cm2- Chân chống: 02 bộ, vận hành thủy lực- Chiều rộng chân chống khi ra chân: 3,12m', NULL),
(935, '29L - 4853', 'Xe hút chân không 8 tấn', NULL, 'Nissan', 'Nhật', '1998', '4x2', 2, '7200x2450x3000mm', '3 chỗ', '4200mm', '9500kg', '8000kg', '12503cm3', '232HP', 'có trợ lực', 'bình 12V-135Ah x 2 bình', '1100-20', '1. Téc chứa bùn:\r\n- Dung tích téc chứa bùn: 4,5m3\r\n- Cơ cấu nâng hạ téc chứa bùn: được điều khiển bằng cơ cấu thủy lực\r\n- Đường kính ống hút, xả: F100mm\r\n- Téc chứa bùn chịu được áp:\r\n   + Áp suất hút: - 740mmHg\r\n   + Áp suất xả: 0,05Mpa\r\n- Lưu lượng khí: 32m3/phút\r\n- Vật liệu téc chứa bùn:\r\n   + Nửa trên: inox 304, dầy 5mm\r\n   + Nửa dưới: thép chịu lực, dầy 4,5mm\r\n2. Bơm châm không\r\n- Chủng loại bơm: bơm chân không\r\n- Hệ thống truyền động: truyền chuyển động bằng dây đai.\r\n- áp suất hút của bơm: -740mmHg\r\n- Áp suất xả của bơm: 0,05Mpa\r\n- Lưu lượng khí: 32m3/phút', NULL),
(936, '29C – 480.95', 'Xe chở bùn loại con lắc', NULL, 'Hino', 'Việt Nam', '2015', '4x2', 14, '6200x2400x3300mm', '3 chỗ', '3420mm', '5725kg', '3465kg', '5123cm3', '118kw', 'có trợ lực', 'bình 12V-70Ah x 2 bình', '825-16', '- Đặc điểm: thùng chứa bùn có thể tách rời khỏi xe\r\n- Cơ cấu điều khiển nâng hạ: bằng hệ thống thủy lực\r\n- Nắp đậy thùng bùn được vận hành bằng cơ cấu puly dẫn động cáp\r\n- Dung tích thùng chứa bùn: 3,6m3 \r\n- Vật liệu chế tạo: thép', NULL),
(937, '29C – 480.13', 'Xe chở bùn loại con lắc', NULL, 'Hino', 'Việt Nam', '2015', '4x2', 14, '6200x2400x3300mm', '3 chỗ', '3420mm', '5725kg', '3465kg', '5123cm3', '118kw', 'có trợ lực', 'bình 12V-70Ah x 2 bình', '825-16', '- Đặc điểm: thùng chứa bùn có thể tách rời khỏi xe\r\n- Cơ cấu điều khiển nâng hạ: bằng hệ thống thủy lực\r\n- Nắp đậy thùng bùn được vận hành bằng cơ cấu puly dẫn động cáp\r\n- Dung tích thùng chứa bùn: 3,6m3 \r\n- Vật liệu chế tạo: thép', NULL),
(938, '30Y - 3694', 'Xe chở bùn loại con lắc', NULL, 'Dongphong', 'Trung Quốc', '2010', '4x2', 14, '7165x2490x3160mm', '3 chỗ', '3950mm', '5255kg', '4500kg', '4257cm3', '105kw', 'có trợ lực', 'bình 12V-100Ah x 2 bình', '900-20', '- Đặc điểm: thùng chứa bùn có thể tách rời khỏi xe- Cơ cấu điều khiển nâng hạ: bằng hệ thống thủy lực- Nắp đậy thùng bùn được vận hành bằng cơ cấu puly dẫn động cáp- Dung tích thùng chứa bùn: 3,6m3 - Vật liệu chế tạo: thép', NULL),
(939, '29C – 188.82', 'Xe chở bùn cống ngang', NULL, 'Dongphong', 'Trung Quốc', '2012', '4x2', 12, '6800x2490x2750mm', '3 chỗ', '3950mm', '6255kg', '4500kg', '5883cm3', '118kw', 'có trợ lực', 'bình 12V-100Ah x 2 bình', '900-20', '- Đặc điểm: thùng chứa bùn được lắp cố định trên xe\r\n- Hệ thống chuyên dùng để nâng hạ xe gom bùn được lắp trên thành xe\r\n- Cơ cấu nâng hạ thùng chứa bùn: được nâng hạ bằng hệ thống thủy lực và việc trút đổ giống xe tải ben tự đổ\r\n- Cơ cấu điều khiển nâng hạ xe gom: bằng hệ thống thủy lực\r\n- Dung tích thùng chứa bùn: 5m3 \r\n- Vật liệu chế tạo: thép', NULL),
(940, '29C – 320.42', 'Xe chở bùn loại con lắc', NULL, 'Dongphong', 'Trung Quốc', '2013', '4x2', 14, '7000x2450x3200mm', '3 chỗ', '3950mm', '5900kg', '4355kg', '4257cm3', '105kw', 'có trợ lực', 'bình 12V-100Ah x 2 bình', '900-20', '- Đặc điểm: thùng chứa bùn có thể tách rời khỏi xe\r\n- Cơ cấu điều khiển nâng hạ: bằng hệ thống thủy lực\r\n- Nắp đậy thùng bùn được vận hành bằng cơ cấu puly dẫn động cáp\r\n- Dung tích thùng chứa bùn: 3,6m3 \r\n- Vật liệu chế tạo: thép', NULL),
(941, '30U - 5253', 'Xe tải cẩu 1,4 tấn', NULL, 'Kia', 'Việt Nam', '2009', '4x2', 6, '5330x1770x2120mm', '3 chỗ', '2760mm', '1980kg', '1400kg', '2957cm3', '67,5kw', 'có trợ lực', 'bình 12V-70Ah x 1 bình', '+ Lốp trước: 650-16+ Lốp sau: 550-13', '- Nhãn hiệu: Soosan- Nước sản xuất: Hàn quốc- Tải trọng nâng lớn nhất: 2,2 tấn/1,9m- Bán kính làm việc: 6,2m- Loại cần/ số đoạn: lục giác/3 đoạn- Tốc độ kéo dài cần: 3,7m/11s- Tốc độ cáp: 11m/phút- Hệ thống thủy lực:+ Tốc độ bơm: 37 l/ph+ Áp suất bơm: 200 kgf/cm2- Chân chống: 02 bộ, vận hành thủy lực- Chiều rộng chân chống khi ra chân: 3,12m', NULL),
(942, '29C – 518.31 ', 'Xe chở bùn loại con lắc', NULL, 'Dongphong', 'Trung Quốc', '2007', '4x2', 14, '7350x2470x3100mm', '3 chỗ', '3950mm', '5965kg', '3600kg', '4257cm3', '105kw', 'có trợ lực', 'bình 12V-100Ah x 2 bình', '900-20', '- Đặc điểm: thùng chứa bùn có thể tách rời khỏi xe\r\n- Cơ cấu điều khiển nâng hạ: bằng hệ thống thủy lực\r\n- Nắp đậy thùng bùn được vận hành bằng cơ cấu puly dẫn động cáp\r\n- Dung tích thùng chứa bùn: 3,6m3 \r\n- Vật liệu chế tạo: thép', NULL),
(943, '29C – 0394', 'Xe chở bùn loại con lắc', NULL, 'Dongphong', 'Trung Quốc', '2007', '4x2', 14, '7350x2470x3100mm', '3 chỗ', '3950mm', '5965kg', '3600kg', '4257cm3', '105kw', 'có trợ lực', 'bình 12V-100Ah x 2 bình', '900-20', '- Đặc điểm: thùng chứa bùn có thể tách rời khỏi xe\r\n- Cơ cấu điều khiển nâng hạ: bằng hệ thống thủy lực\r\n- Nắp đậy thùng bùn được vận hành bằng cơ cấu puly dẫn động cáp\r\n- Dung tích thùng chứa bùn: 3,6m3 \r\n- Vật liệu chế tạo: thép', NULL),
(944, '29C – 318.49', 'Xe tải cẩu 1,4 tấn', NULL, 'Kia', 'Việt Nam', '2014', '4x2', 6, '5330x1770x2120mm', '3 chỗ', '2760mm', '1980kg', '1400kg', '2957cm3', '67,5kw', 'có trợ lực', 'bình 12V-70Ah x 1 bình', '+ Lốp trước: 650-16+ Lốp sau: 550-13', '- Nhãn hiệu: Soosan\r\n- Nước sản xuất: Hàn quốc\r\n- Tải trọng nâng lớn nhất: 2,2 tấn/1,9m\r\n- Bán kính làm việc: 6,2m\r\n- Loại cần/ số đoạn: lục giác/3 đoạn\r\n- Tốc độ kéo dài cần: 3,7m/11s\r\n- Tốc độ cáp: 11m/phút\r\n- Hệ thống thủy lực:\r\n   + Tốc độ bơm: 37 l/ph\r\n   + Áp suất bơm: 200 kgf/cm2\r\n- Chân chống: 02 bộ, vận hành thủy lực\r\n- Chiều rộng chân chống khi ra chân: 3,12m', NULL),
(945, '29C – 321.98', 'Xe chở bùn loại con lắc', NULL, 'Dongphong', 'Trung Quốc', '2013', '4x2', 14, '7000x2450x3200mm', '3 chỗ', '3950mm', '5900kg', '4355kg', '4257cm3', '105kw', 'có trợ lực', 'bình 12V-100Ah x 2 bình', '900-20', '- Đặc điểm: thùng chứa bùn có thể tách rời khỏi xe\r\n- Cơ cấu điều khiển nâng hạ: bằng hệ thống thủy lực\r\n- Nắp đậy thùng bùn được vận hành bằng cơ cấu puly dẫn động cáp\r\n- Dung tích thùng chứa bùn: 3,6m3 \r\n- Vật liệu chế tạo: thép', NULL),
(946, '29L - 4849', 'Xe hút chân không 4 tấn', NULL, 'Nissan', 'Nhật', '1997', '4x2', 4, '6550x2050x2700mm', '3 chỗ', '3800mm', '5530kg', '4000kg', '6925cm3', '180PS', 'có trợ lực', 'bình 12V-70Ah x 2 bình', '825-16', '1. Téc chứa bùn:\r\n- Dung tích téc chứa bùn: 2,5m3\r\n- Cơ cấu nâng hạ téc chứa bùn: được điều khiển bằng cơ cấu thủy lực\r\n- Đường kính ống hút, xả: F100mm\r\n- Téc chứa bùn chịu được áp:\r\n   + Áp suất hút: - 740mmHg\r\n   + Áp suất xả: 0,05Mpa\r\n- Lưu lượng khí: 21m3/phút\r\n- Vật liệu téc chứa bùn:\r\n   + Nửa trên: inox 304, dầy 5mm\r\n   + Nửa dưới: thép chịu lực, dầy 4,5mm\r\n2. Bơm châm không\r\n- Chủng loại bơm: bơm chân không\r\n- Hệ thống truyền động: truyền chuyển động bằng dây đai.\r\n- áp suất hút của bơm: -740mmHg\r\n- Áp suất xả của bơm: 0,05Mpa\r\n- Lưu lượng khí: 21m3/phút', NULL),
(947, '29L - 4891', 'Xe téc chở bùn', NULL, 'Nissan', 'Nhật', '1997', '4x2', 4, '6040x2140x2640mm', '3 chỗ', '3220mm', '6315kg', '4000kg', '6625 cm3', '177HP', 'có trợ lực', 'bình 12V-70Ah x 2 bình', '825-16', '- Dung tích téc chứa bùn: 3,7m3\r\n- Cơ cấu nâng hạ téc chứa bùn: được điều khiển bằng cơ cấu thủy lực\r\n- Đường kính ống hút, xả: F100mm\r\n- Téc chứa bùn chịu được áp:\r\n   + Áp suất hút: - 740mmHg\r\n   + Áp suất xả: 0,05Mpa\r\n- Vật liệu téc chứa bùn:\r\n   + Nửa trên: inox 304, dầy 5mm\r\n   + Nửa dưới: thép chịu lực, dầy 4,5mm', NULL),
(948, '29L - 4846', 'Xe téc chở nước', NULL, 'Nissan', 'Nhật', '1998', '4x2', 4, '6600x2220x2480mm', '3 chỗ', '3700mm', '4390kg', '5000kg', '6625 cm3', '177HP', 'có trợ lực', 'bình 12V-70Ah x 2 bình', '825-16', '- Dung tích téc chứa: 5m3\r\n- Lưu lượng bơm lớn nhất: 1400 lít/phút', NULL),
(949, '29L - 4928', 'Xe phun nước phản lực', NULL, 'Nissan', 'Nhật', '1998', '4x2', 10, '6450x2150x2400mm', '3 chỗ', '3800mm', '6790kg', '5000kg', '6625 cm3', '177HP', 'có trợ lực', 'bình 12V-70Ah x 2 bình', '825-16', '1. Bơm:\r\n- Loại: kiểu bơm pít tông\r\n- Cơ cấu truyền động: bằng truyền động dây đai\r\n- Lưu lượng nước: 180 lít/phút\r\n- Áp suất bơm: 19,6Mpa\r\n2. Téc chứa nước:\r\n- Loại: hình vuông\r\n- Dung tích téc chứa: 2,5m3\r\n3. Ống áp lực chính:\r\n- Đường kính: ¾ inch x 80m\r\n- Áp suất làm việc lớn nhất:  áp suất làm việc 21,5Mpa\r\n- Áp suất phá hủy:  áp suất làm việc 86Mpa\r\n4. Ống áp lực phụ:\r\n- Đường kính: 3/8 inch x 20m\r\n- Áp suất làm việc lớn nhất:  áp suất làm việc 33Mpa\r\n- Áp suất phá hủy:  áp suất làm việc 132Mpa', NULL),
(950, '29L - 4885', 'Xe téc chở bùn', NULL, 'Nissan', 'Nhật', '1998', '4x2', 4, '5850x2100x2650mm', '3 chỗ', '3250mm', '4400kg', '4000kg', '6625 cm3', '180PS', 'có trợ lực', 'bình 12V-70Ah x 2 bình', '825-16', '- Dung tích téc chứa bùn: 3,7m3\r\n- Cơ cấu nâng hạ téc chứa bùn: được điều khiển bằng cơ cấu thủy lực\r\n- Đường kính ống hút, xả: F100mm\r\n- Téc chứa bùn chịu được áp:\r\n   + Áp suất hút: - 740mmHg\r\n   + Áp suất xả: 0,05Mpa\r\n- Vật liệu téc chứa bùn:\r\n   + Nửa trên: inox 304, dầy 5mm\r\n   + Nửa dưới: thép chịu lực, dầy 4,5mm', NULL),
(951, '29C – 184.88', 'Xe tải ben', NULL, 'Hino', 'Việt Nam', '2010', '4x2', 16, '5760x2200x2660mm', '3 chỗ', '3420mm', '4205kg', '6000kg', '5123cm3', '118kw', 'có trợ lực', 'bình 12V-70Ah x 2 bình', '825-16', '- Kích thước thùng xe: 3400x2000x700mm\r\n- Dung tích thùng: 4,76m3\r\n- Cơ cấu nâng hạ: bằng hệ thống thủy lực và nâng hạ ben để trút đổ vật liệu.', NULL),
(952, '31F - 1593', 'Xe chở bùn loại con lắc', NULL, 'Dongphong', 'Trung Quốc', '2010', '4x2', 14, '7300x2462x3400mm', '3 chỗ', '3950mm', '7555kg', '3200kg', '5883cm3', '118kw', 'có trợ lực', 'bình 12V-100Ah x 2 bình', '900-20', '- Đặc điểm: thùng chứa bùn có thể tách rời khỏi xe- Cơ cấu điều khiển nâng hạ: bằng hệ thống thủy lực- Nắp đậy thùng bùn được vận hành bằng cơ cấu puly dẫn động cáp- Vật liệu chế tạo: thép', NULL),
(953, '29A – 094.13', 'Xe tải ben', NULL, 'Trường Giang', 'Trung Quốc', '2011', '4x2', 16, '5850x2350x2770mm', '3 chỗ', '3280', '6010kg', '3450kg', '…..cm3', '96kw', 'có trợ lực', 'bình 12V-100Ah x 2 bình', '900-20', '- Kích thước thùng xe: 3840x2150x700mm\r\n- Dung tích thùng: 5,77m3\r\n- Cơ cấu nâng hạ: bằng hệ thống thủy lực và nâng hạ ben để trút đổ vật liệu.', NULL),
(954, '29C – 183.55', 'Xe tải ben', NULL, 'Hino', 'Việt Nam', '2010', '4x2', 16, '5760x2200x2660mm', '3 chỗ', '3420mm', '4205kg', '6000kg', '5123cm3', '118kw', 'có trợ lực', 'bình 12V-70Ah x 2 bình', '825-16', '- Kích thước thùng xe: 3400x2000x700mm\r\n- Dung tích thùng: 4,76m3\r\n- Cơ cấu nâng hạ: bằng hệ thống thủy lực và nâng hạ ben để trút đổ vật liệu.', NULL),
(955, '30X - 8411', 'Xe chở rác', NULL, 'Hino', 'Việt Nam', '2009', '4x2', 2, '8300x2450x3200mm', '3 chỗ', '4280mm', '8405kg', '6500kg', '7384cm3', '167kw', 'có trợ lực', 'bình 12V-70Ah x 2 bình', '1000-20', '', NULL),
(956, '30X - 8183', 'Xe chở rác', NULL, 'Hino', 'Việt Nam', '2009', '4x2', 2, '8300x2450x3200mm', '3 chỗ', '4280mm', '8405kg', '6500kg', '7384cm3', '167kw', 'có trợ lực', 'bình 12V-70Ah x 2 bình', '1000-20', '', NULL),
(957, '30H - 7271', 'Xe chở rác', NULL, 'Mitsubishi', 'Nhật', '2005', '4x2', 2, '8245x2370x2800mm', '3 chỗ', '4620mm', '7250kg', '5560kg', '7545cm3', '…….kw', 'có trợ lực', 'bình 12V-70Ah x 2 bình', '900-20', '', NULL),
(958, '30H - 7873', 'Xe chở rác', NULL, 'Mitsubishi', 'Nhật', '2005', '4x2', 2, '8245x2370x2800mm', '3 chỗ', '4620mm', '7250kg', '5560kg', '7545cm3', '…….kw', 'có trợ lực', 'bình 12V-70Ah x 2 bình', '900-20', '', NULL),
(959, '29C – 488.35', 'Xe chở rác', NULL, 'Huyndai', 'Hàn Quốc', '2013', '4x2', 2, ' 6852x2255x2585mm', '3 chỗ', '3845mm', '4080kg', '4310kg', ' 5899cm3', '165kw', 'có trợ lực', 'bình 12V-70Ah x 2 bình', '245/70R19.5', '', NULL),
(960, '29C – 488.15', 'Xe chở rác', NULL, 'Huyndai', 'Hàn Quốc', '2013', '4x2', 2, ' 6852x2255x2585mm', '3 chỗ', '3845mm', '4080kg', '4310kg', ' 5899cm3', '165kw', 'có trợ lực', 'bình 12V-70Ah x 2 bình', '245/70R19.5', '', NULL),
(961, '29S - 3496', 'Xe tải có gắn cẩu 3 tấn', NULL, 'Hino', 'Việt Nam', '2002', '4x2', 16, ' 7300x2610x3020mm', '3 chỗ', '4150mm', '4980kg', '3325kg', ' 4009cm3', '81,5kw', 'có trợ lực', 'bình 12V-70Ah x 2 bình', '825-16', '', NULL),
(962, '29C – 183.65', 'Xe tải có gắn cẩu 3 tấn', NULL, 'Hino', 'Việt Nam', '2010', '4x2', 16, '7850x2420x3400mm', '3 chỗ', '4350mm', '5005kg', '5200kg', '5123 cm3', '118kw', 'có trợ lực', 'bình 12V-70Ah x 2 bình', '825-16', '', NULL),
(963, '29A – 010.15', 'Xe tải có gắn cẩu 3 tấn', NULL, 'Suzuki', 'Việt Nam', '2011', '4x2', 16, '3290x1395x1780mm', '3 chỗ', '1840mm', '740kg', '580kg', '970cm3', '31kw', 'có trợ lực', 'bình 12V-70Ah x 1 bình', '500-12', '', NULL),
(964, '29C-183.51', 'Xe tải ben', NULL, 'Hino', 'Việt Nam', '2010', '4x2', 16, '5760x2200x2660mm', '3 chỗ', '3420mm', '4205kg', '6000kg', '5123cm3', '118kw', 'có trợ lực', 'bình 12V-70Ah x 2 bình', '825-16', '- Kích thước thùng xe: 3400x2000x700mm\r\n- Dung tích thùng: 4,76m3\r\n- Cơ cấu nâng hạ: bằng hệ thống thủy lực và nâng hạ ben để trút đổ vật liệu.', NULL),
(965, '29C-144.96', 'Xe tải ben', NULL, 'Hino', 'Việt Nam', '2010', '4x2', 16, '5760x2200x2660mm', '3 chỗ', '3420mm', '4205kg', '6000kg', '5123cm3', '118kw', 'có trợ lực', 'bình 12V-70Ah x 2 bình', '825-16', '- Kích thước thùng xe: 3400x2000x700mm\r\n- Dung tích thùng: 4,76m3\r\n- Cơ cấu nâng hạ: bằng hệ thống thủy lực và nâng hạ ben để trút đổ vật liệu.', NULL),
(966, '29C-182.40', 'Xe tải ben', NULL, 'Hino', 'Việt Nam', '2010', '4x2', 16, '5760x2200x2660mm', '3 chỗ', '3420mm', '4205kg', '6000kg', '5123cm3', '118kw', 'có trợ lực', 'bình 12V-70Ah x 2 bình', '825-16', '- Kích thước thùng xe: 3400x2000x700mm\r\n- Dung tích thùng: 4,76m3\r\n- Cơ cấu nâng hạ: bằng hệ thống thủy lực và nâng hạ ben để trút đổ vật liệu.', NULL),
(967, '29C-182.00', 'Xe tải ben', NULL, 'Hino', 'Việt Nam', '2010', '4x2', 16, '5760x2200x2660mm', '3 chỗ', '3420mm', '4205kg', '6000kg', '5123cm3', '118kw', 'có trợ lực', 'bình 12V-70Ah x 2 bình', '825-16', '- Kích thước thùng xe: 3400x2000x700mm\r\n- Dung tích thùng: 4,76m3\r\n- Cơ cấu nâng hạ: bằng hệ thống thủy lực và nâng hạ ben để trút đổ vật liệu.', NULL),
(968, '29C-184.47', 'Xe hút chân không 8 tấn', NULL, 'Nissan', 'Nhật', '2011', '4x2', 2, '7530x2420x2880mm', '3 chỗ', '4350mm', '8300kg', '5705kg', '6925cm3', '157kw', 'có trợ lực', 'bình 12V-135Ah x 2 bình', '900-20', '1. Téc chứa bùn:\r\n- Dung tích téc chứa bùn: 4,5m3\r\n- Cơ cấu nâng hạ téc chứa bùn: được điều khiển bằng cơ cấu thủy lực\r\n   + Áp suất hút: - 740mmHg\r\n   + Áp suất xả: 0,05Mpa\r\n- Lưu lượng khí: 32m3/phút\r\n- Vật liệu téc chứa bùn:\r\n   + Nửa trên: inox 304, dầy 5mm\r\n   + Nửa dưới: thép chịu lực, dầy 4,5mm\r\n2. Bơm châm không\r\n- Chủng loại bơm: bơm chân không\r\n- Hệ thống truyền động: truyền chuyển động bằng dây đai.\r\n- áp suất hút của bơm: -740mmHg\r\n- Áp suất xả của bơm: 0,05Mpa\r\n- Lưu lượng khí: 32m3/phút', NULL),
(969, '29C-183.37', 'Xe hút chân không 8 tấn', NULL, 'Nissan', 'Nhật', '2011', '4x2', 2, '7530x2420x2880mm', '3 chỗ', '4350mm', '8300kg', '5705kg', '6925cm3', '157kw', 'có trợ lực', 'bình 12V-135Ah x 2 bình', '900-20', '1. Téc chứa bùn:\r\n- Dung tích téc chứa bùn: 4,5m3\r\n- Cơ cấu nâng hạ téc chứa bùn: được điều khiển bằng cơ cấu thủy lực\r\n   + Áp suất hút: - 740mmHg\r\n   + Áp suất xả: 0,05Mpa\r\n- Lưu lượng khí: 32m3/phút\r\n- Vật liệu téc chứa bùn:\r\n   + Nửa trên: inox 304, dầy 5mm\r\n   + Nửa dưới: thép chịu lực, dầy 4,5mm\r\n2. Bơm châm không\r\n- Chủng loại bơm: bơm chân không\r\n- Hệ thống truyền động: truyền chuyển động bằng dây đai.\r\n- áp suất hút của bơm: -740mmHg\r\n- Áp suất xả của bơm: 0,05Mpa\r\n- Lưu lượng khí: 32m3/phút', NULL),
(970, '29C-184.53', 'Xe hút chân không 8 tấn', NULL, 'Nissan', 'Nhật', '2011', '4x2', 2, '7530x2420x2880mm', '3 chỗ', '4350mm', '8300kg', '5705kg', '6925cm3', '157kw', 'có trợ lực', 'bình 12V-135Ah x 2 bình', '900-20', '1. Téc chứa bùn:\r\n- Dung tích téc chứa bùn: 4,5m3\r\n- Cơ cấu nâng hạ téc chứa bùn: được điều khiển bằng cơ cấu thủy lực\r\n   + Áp suất hút: - 740mmHg\r\n   + Áp suất xả: 0,05Mpa\r\n- Lưu lượng khí: 32m3/phút\r\n- Vật liệu téc chứa bùn:\r\n   + Nửa trên: inox 304, dầy 5mm\r\n   + Nửa dưới: thép chịu lực, dầy 4,5mm\r\n2. Bơm châm không\r\n- Chủng loại bơm: bơm chân không\r\n- Hệ thống truyền động: truyền chuyển động bằng dây đai.\r\n- áp suất hút của bơm: -740mmHg\r\n- Áp suất xả của bơm: 0,05Mpa\r\n- Lưu lượng khí: 32m3/phút', NULL),
(971, '29L- 4850', 'Xe hút chân không 4 tấn', NULL, 'Nissan', 'Nhật', '1997', '4x2', 4, '6550x2050x2700mm', '3 chỗ', '3800mm', '5530kg', '4000kg', '6925cm3', '180PS', 'có trợ lực', 'bình 12V-70Ah x 2 bình', '825-16', '1. Téc chứa bùn:- Dung tích téc chứa bùn: 2,5m3- Cơ cấu nâng hạ téc chứa bùn: được điều khiển bằng cơ cấu thủy lực+ Áp suất hút: - 740mmHg+ Áp suất xả: 0,05Mpa- Lưu lượng khí: 21m3/phút- Vật liệu téc chứa bùn:+ Nửa trên: inox 304, dầy 5mm+ Nửa dưới: thép chịu lực, dầy 4,5mm2. Bơm châm không- Chủng loại bơm: bơm chân không- Hệ thống truyền động: truyền chuyển động bằng dây đai.- áp suất hút của bơm: -740mmHg- Áp suất xả của bơm: 0,05Mpa- Lưu lượng khí: 32m3/phút', NULL),
(972, '29L- 4862', 'Xe hút chân không 4 tấn', NULL, 'Nissan', 'Nhật', '1997', '4x2', 4, '7450x2140x2490mm', '3 chỗ', '3700mm', '6240kg', '4000kg', '6625cm3', '177HP', 'có trợ lực', 'bình 12V-70Ah x 2 bình', '825-16', '1. Téc chứa bùn:- Dung tích téc chứa bùn: 2,5m3- Cơ cấu nâng hạ téc chứa bùn: được điều khiển bằng cơ cấu thủy lực+ Áp suất hút: - 740mmHg+ Áp suất xả: 0,05Mpa- Lưu lượng khí: 21m3/phút- Vật liệu téc chứa bùn:+ Nửa trên: inox 304, dầy 5mm+ Nửa dưới: thép chịu lực, dầy 4,5mm2. Bơm châm không- Chủng loại bơm: bơm chân không- Hệ thống truyền động: truyền chuyển động bằng dây đai.- áp suất hút của bơm: -740mmHg- Áp suất xả của bơm: 0,05Mpa- Lưu lượng khí: 32m3/phút', NULL),
(973, '29L- 4848', 'Xe hút chân không 4 tấn', NULL, 'Nissan', 'Nhật', '1997', '4x2', 4, '7450x2140x2490mm', '3 chỗ', '3700mm', '6760kg', '4000kg', '6625cm3', '177HP', 'có trợ lực', 'bình 12V-70Ah x 2 bình', '825-16', '1. Téc chứa bùn:- Dung tích téc chứa bùn: 2,5m3- Cơ cấu nâng hạ téc chứa bùn: được điều khiển bằng cơ cấu thủy lực+ Áp suất hút: - 740mmHg+ Áp suất xả: 0,05Mpa- Lưu lượng khí: 21m3/phút- Vật liệu téc chứa bùn:+ Nửa trên: inox 304, dầy 5mm+ Nửa dưới: thép chịu lực, dầy 4,5mm2. Bơm châm không- Chủng loại bơm: bơm chân không- Hệ thống truyền động: truyền chuyển động bằng dây đai.- áp suất hút của bơm: -740mmHg- Áp suất xả của bơm: 0,05Mpa- Lưu lượng khí: 32m3/phút', NULL),
(974, '29L- 4854', 'Xe hút chân không 4 tấn', NULL, 'Nissan', 'Nhật', '1997', '4x2', 4, '7450x2140x2490mm', '3 chỗ', '3700mm', '6760kg', '4000kg', '6625cm3', '177HP', 'có trợ lực', 'bình 12V-70Ah x 2 bình', '825-16', '1. Téc chứa bùn:- Dung tích téc chứa bùn: 2,5m3- Cơ cấu nâng hạ téc chứa bùn: được điều khiển bằng cơ cấu thủy lực+ Áp suất hút: - 740mmHg+ Áp suất xả: 0,05Mpa- Lưu lượng khí: 21m3/phút- Vật liệu téc chứa bùn:+ Nửa trên: inox 304, dầy 5mm+ Nửa dưới: thép chịu lực, dầy 4,5mm2. Bơm châm không- Chủng loại bơm: bơm chân không- Hệ thống truyền động: truyền chuyển động bằng dây đai.- áp suất hút của bơm: -740mmHg- Áp suất xả của bơm: 0,05Mpa- Lưu lượng khí: 32m3/phút', NULL),
(975, '29Y – 4934', 'Xe hút chân không 4 tấn', NULL, 'Nissan', 'Nhật', '2005', '4x2', 4, '6650x2200x2670mm', '3 chỗ', '3770mm', '6760kg', '4000kg', '6925cm3', '151kw', 'có trợ lực', 'bình 12V-70Ah x 2 bình', '825-16', '1. Téc chứa bùn:- Dung tích téc chứa bùn: 2,5m3- Cơ cấu nâng hạ téc chứa bùn: được điều khiển bằng cơ cấu thủy lực+ Áp suất hút: - 740mmHg+ Áp suất xả: 0,05Mpa- Lưu lượng khí: 21m3/phút- Vật liệu téc chứa bùn:+ Nửa trên: inox 304, dầy 5mm+ Nửa dưới: thép chịu lực, dầy 4,5mm2. Bơm châm không- Chủng loại bơm: bơm chân không- Hệ thống truyền động: truyền chuyển động bằng dây đai.- áp suất hút của bơm: -740mmHg- Áp suất xả của bơm: 0,05Mpa- Lưu lượng khí: 32m3/phút', NULL),
(976, '29C-183.01', 'Xe hút chân không 4 tấn', NULL, 'Nissan', 'Nhật', '2011', '4x2', 4, '6430x220x2570mm', '3 chỗ', '3770mm', '5900kg', '3375kg', '6925cm3', '157kw', 'có trợ lực', 'bình 12V-70Ah x 2 bình', '825-16', '1. Téc chứa bùn:\r\n- Dung tích téc chứa bùn: 2,5m3\r\n- Cơ cấu nâng hạ téc chứa bùn: được điều khiển bằng cơ cấu thủy lực\r\n   + Áp suất hút: - 740mmHg\r\n   + Áp suất xả: 0,05Mpa\r\n- Lưu lượng khí: 21m3/phút\r\n- Vật liệu téc chứa bùn:\r\n   + Nửa trên: inox 304, dầy 5mm\r\n   + Nửa dưới: thép chịu lực, dầy 4,5mm\r\n2. Bơm châm không:\r\n- Chủng loại bơm: bơm chân không\r\n- Hệ thống truyền động: truyền chuyển động bằng dây đai.\r\n- áp suất hút của bơm: -740mmHg\r\n- Áp suất xả của bơm: 0,05Mpa\r\n- Lưu lượng khí: 32m3/phút', NULL),
(977, '29C-182.33', 'Xe hút chân không 4 tấn', NULL, 'Nissan', 'Nhật', '2011', '4x2', 4, '6430x220x2570mm', '3 chỗ', '3770mm', '5900kg', '3375kg', '6925cm3', '157kw', 'có trợ lực', 'bình 12V-70Ah x 2 bình', '825-16', '1. Téc chứa bùn:\r\n- Dung tích téc chứa bùn: 2,5m3\r\n- Cơ cấu nâng hạ téc chứa bùn: được điều khiển bằng cơ cấu thủy lực\r\n   + Áp suất hút: - 740mmHg\r\n   + Áp suất xả: 0,05Mpa\r\n- Lưu lượng khí: 21m3/phút\r\n- Vật liệu téc chứa bùn:\r\n   + Nửa trên: inox 304, dầy 5mm\r\n   + Nửa dưới: thép chịu lực, dầy 4,5mm\r\n2. Bơm châm không:\r\n- Chủng loại bơm: bơm chân không\r\n- Hệ thống truyền động: truyền chuyển động bằng dây đai.\r\n- áp suất hút của bơm: -740mmHg\r\n- Áp suất xả của bơm: 0,05Mpa\r\n- Lưu lượng khí: 32m3/phút', NULL),
(978, '29C-183.38', 'Xe hút chân không 4 tấn', NULL, 'Nissan', 'Nhật', '2011', '4x2', 4, '6430x220x2570mm', '3 chỗ', '3770mm', '5900kg', '3375kg', '6925cm3', '157kw', 'có trợ lực', 'bình 12V-70Ah x 2 bình', '825-16', '1. Téc chứa bùn:\r\n- Dung tích téc chứa bùn: 2,5m3\r\n- Cơ cấu nâng hạ téc chứa bùn: được điều khiển bằng cơ cấu thủy lực\r\n   + Áp suất hút: - 740mmHg\r\n   + Áp suất xả: 0,05Mpa\r\n- Lưu lượng khí: 21m3/phút\r\n- Vật liệu téc chứa bùn:\r\n   + Nửa trên: inox 304, dầy 5mm\r\n   + Nửa dưới: thép chịu lực, dầy 4,5mm\r\n2. Bơm châm không\r\n- Chủng loại bơm: bơm chân không\r\n- Hệ thống truyền động: truyền chuyển động bằng dây đai.\r\n- áp suất hút của bơm: -740mmHg\r\n- Áp suất xả của bơm: 0,05Mpa\r\n- Lưu lượng khí: 32m3/phút', NULL);
INSERT INTO `c_profile_machine` (`C_PROFILE_MACHINE_ID`, `CODE`, `NAME`, `C_EMPLOYEE_ID`, `MANUFACTORY_NAME`, `MANUFACTORY_COUNTRY`, `MANUFACTORY_YEAR`, `WHEEL_FORMULA`, `C_REPAIR_TYPE_ID`, `SIZE_TOTAL`, `NUMBER_SEATING`, `WIDTH`, `WEIGHT`, `WEIGHT_CURRENT`, `VOLUME`, `MAX_POWER`, `DRIVE_SYSTEM`, `BATTERY`, `WHEEL_USE`, `DETAIL`, `AVATAR`) VALUES
(979, '29C-183.18', 'Xe phun nước phản lực', NULL, 'Nissan', 'Nhật', '2011', '4x2', 10, '6770x2200x2550mm', '3 chỗ', '3770mm', '6300kg', '2500kg', '6925cm3', '157kw', 'có trợ lực', 'bình 12V-70Ah x 2 bình', '825-16', '1. Bơm:\r\n- Loại: kiểu bơm pít tông\r\n- Cơ cấu truyền động: bằng truyền động dây đai\r\n2. Téc chứa nước:\r\n- Loại: hình vuông\r\n- Dung tích téc chứa: 2,5m3\r\n3. Ống áp lực chính:\r\n- Đường kính: ¾ inch x 80m\r\n- Áp suất làm việc lớn nhất:  áp suất làm việc 21,5Mpa\r\n- Áp suất phá hủy:  áp suất làm việc 86Mpa\r\n4. Ống áp lực phụ:\r\n- Đường kính: 3/8 inch x 20m\r\n- Áp suất làm việc lớn nhất:  áp suất làm việc 33Mpa\r\n- Áp suất phá hủy:  áp suất làm việc 132Mpa', NULL),
(980, '29C-184.89', 'Xe phun nước phản lực', NULL, 'Nissan', 'Nhật', '2011', '4x2', 10, '6770x2200x2550mm', '3 chỗ', '3770mm', '6300kg', '2500kg', '6925cm3', '157kw', 'có trợ lực', 'bình 12V-70Ah x 2 bình', '825-16', '1. Bơm:\r\n- Loại: kiểu bơm pít tông\r\n- Cơ cấu truyền động: bằng truyền động dây đai\r\n2. Téc chứa nước:\r\n- Loại: hình vuông\r\n- Dung tích téc chứa: 2,5m3\r\n3. Ống áp lực chính:\r\n- Đường kính: ¾ inch x 80m\r\n- Áp suất làm việc lớn nhất:  áp suất làm việc 21,5Mpa\r\n- Áp suất phá hủy:  áp suất làm việc 86Mpa\r\n4. Ống áp lực phụ:\r\n- Đường kính: 3/8 inch x 20m\r\n- Áp suất làm việc lớn nhất:  áp suất làm việc 33Mpa\r\n- Áp suất phá hủy:  áp suất làm việc 132Mpa', NULL),
(981, '29L- 4890', 'Xe téc chở bùn', NULL, 'Nissan', 'Nhật', '1997', '4x2', 4, '6040x2140x2640mm', '3 chỗ', '3220mm', '6315kg', '4000kg', '6625 cm3', '177HP', 'có trợ lực', 'bình 12V-70Ah x 2 bình', '825-16', '- Dung tích téc chứa bùn: 3,7m3- Cơ cấu nâng hạ téc chứa bùn: được điều khiển bằng cơ cấu thủy lực- Đường kính ống hút, xả: F100mm+ Áp suất xả: 0,05Mpa- Vật liệu téc chứa bùn:+ Nửa trên: inox 304, dầy 5mm+ Nửa dưới: thép chịu lực, dầy 4,5mm', NULL),
(982, '29L- 4892', 'Xe téc chở bùn', NULL, 'Nissan', 'Nhật', '1998', '4x2', 4, '5850x2100x2650mm', '3 chỗ', '3250mm', '4350kg', '4000kg', '6925cm3', '180PS', 'có trợ lực', 'bình 12V-70Ah x 2 bình', '825-16', '- Dung tích téc chứa bùn: 3,7m3- Cơ cấu nâng hạ téc chứa bùn: được điều khiển bằng cơ cấu thủy lực- Đường kính ống hút, xả: F100mm+ Áp suất xả: 0,05Mpa- Vật liệu téc chứa bùn:+ Nửa trên: inox 304, dầy 5mm+ Nửa dưới: thép chịu lực, dầy 4,5mm', NULL),
(983, '29L- 4893', 'Xe téc chở bùn', NULL, 'Nissan', 'Nhật', '1997', '4x2', 4, '6100x2150x2500mm', '3 chỗ', '3250mm', '4300kg', '4000kg', '6925cm3', '180PS', 'có trợ lực', 'bình 12V-70Ah x 2 bình', '825-16', '- Dung tích téc chứa bùn: 3,7m3- Cơ cấu nâng hạ téc chứa bùn: được điều khiển bằng cơ cấu thủy lực- Đường kính ống hút, xả: F100mm+ Áp suất xả: 0,05Mpa- Vật liệu téc chứa bùn:+ Nửa trên: inox 304, dầy 5mm+ Nửa dưới: thép chịu lực, dầy 4,5mm', NULL),
(984, '29Y – 4571', 'Xe téc chở bùn', NULL, 'Nissan', 'Nhật', '2005', '4x2', 4, '6020x2200x2580mm', '3 chỗ', '3220mm', '4290kg', '3885kg', '6925cm3', '132kw', 'có trợ lực', 'bình 12V-70Ah x 2 bình', '825-16', '- Dung tích téc chứa bùn: 3,7m3- Cơ cấu nâng hạ téc chứa bùn: được điều khiển bằng cơ cấu thủy lực- Đường kính ống hút, xả: F100mm+ Áp suất xả: 0,05Mpa- Vật liệu téc chứa bùn:+ Nửa trên: inox 304, dầy 5mm+ Nửa dưới: thép chịu lực, dầy 4,5mm', NULL),
(985, '29Y – 4574', 'Xe téc chở bùn', NULL, 'Nissan', 'Nhật', '2005', '4x2', 4, '6020x2200x2580mm', '3 chỗ', '3220mm', '4290kg', '3885kg', '6925cm3', '132kw', 'có trợ lực', 'bình 12V-70Ah x 2 bình', '825-16', '- Dung tích téc chứa bùn: 3,7m3- Cơ cấu nâng hạ téc chứa bùn: được điều khiển bằng cơ cấu thủy lực- Đường kính ống hút, xả: F100mm+ Áp suất xả: 0,05Mpa- Vật liệu téc chứa bùn:+ Nửa trên: inox 304, dầy 5mm+ Nửa dưới: thép chịu lực, dầy 4,5mm', NULL),
(986, '29Y – 4623', 'Xe téc chở bùn', NULL, 'Nissan', 'Nhật', '2005', '4x2', 4, '6020x2200x2580mm', '3 chỗ', '3220mm', '4290kg', '3885kg', '6925cm3', '132kw', 'có trợ lực', 'bình 12V-70Ah x 2 bình', '825-16', '- Dung tích téc chứa bùn: 3,7m3- Cơ cấu nâng hạ téc chứa bùn: được điều khiển bằng cơ cấu thủy lực- Đường kính ống hút, xả: F100mm+ Áp suất xả: 0,05Mpa- Vật liệu téc chứa bùn:+ Nửa trên: inox 304, dầy 5mm+ Nửa dưới: thép chịu lực, dầy 4,5mm', NULL),
(987, '29Y – 4652', 'Xe téc chở bùn', NULL, 'Nissan', 'Nhật', '2005', '4x2', 4, '6020x2200x2580mm', '3 chỗ', '3220mm', '4290kg', '3885kg', '6925cm3', '132kw', 'có trợ lực', 'bình 12V-70Ah x 2 bình', '825-16', '- Dung tích téc chứa bùn: 3,7m3- Cơ cấu nâng hạ téc chứa bùn: được điều khiển bằng cơ cấu thủy lực- Đường kính ống hút, xả: F100mm+ Áp suất xả: 0,05Mpa- Vật liệu téc chứa bùn:+ Nửa trên: inox 304, dầy 5mm+ Nửa dưới: thép chịu lực, dầy 4,5mm', NULL),
(988, '29Y – 4782', 'Xe téc chở bùn', NULL, 'Nissan', 'Nhật', '2005', '4x2', 4, '6020x2200x2580mm', '3 chỗ', '3220mm', '4290kg', '3885kg', '6925cm3', '132kw', 'có trợ lực', 'bình 12V-70Ah x 2 bình', '825-16', '- Dung tích téc chứa bùn: 3,7m3- Cơ cấu nâng hạ téc chứa bùn: được điều khiển bằng cơ cấu thủy lực- Đường kính ống hút, xả: F100mm+ Áp suất xả: 0,05Mpa- Vật liệu téc chứa bùn:+ Nửa trên: inox 304, dầy 5mm+ Nửa dưới: thép chịu lực, dầy 4,5mm', NULL),
(989, '29Y – 4859', 'Xe téc chở bùn', NULL, 'Nissan', 'Nhật', '2005', '4x2', 4, '6020x2200x2580mm', '3 chỗ', '3220mm', '4290kg', '3885kg', '6925cm3', '132kw', 'có trợ lực', 'bình 12V-70Ah x 2 bình', '825-16', '- Dung tích téc chứa bùn: 3,7m3- Cơ cấu nâng hạ téc chứa bùn: được điều khiển bằng cơ cấu thủy lực- Đường kính ống hút, xả: F100mm+ Áp suất xả: 0,05Mpa- Vật liệu téc chứa bùn:+ Nửa trên: inox 304, dầy 5mm+ Nửa dưới: thép chịu lực, dầy 4,5mm', NULL),
(990, '29Y – 4905', 'Xe téc chở bùn', NULL, 'Nissan', 'Nhật', '2005', '4x2', 4, '6020x2200x2580mm', '3 chỗ', '3220mm', '4290kg', '3885kg', '6925cm3', '132kw', 'có trợ lực', 'bình 12V-70Ah x 2 bình', '825-16', '- Dung tích téc chứa bùn: 3,7m3- Cơ cấu nâng hạ téc chứa bùn: được điều khiển bằng cơ cấu thủy lực- Đường kính ống hút, xả: F100mm+ Áp suất xả: 0,05Mpa- Vật liệu téc chứa bùn:+ Nửa trên: inox 304, dầy 5mm+ Nửa dưới: thép chịu lực, dầy 4,5mm', NULL),
(991, '29Y – 4827', 'Xe téc chở bùn', NULL, 'Nissan', 'Nhật', '2005', '4x2', 4, '6020x2200x2580mm', '3 chỗ', '3220mm', '4290kg', '3885kg', '6925cm3', '132kw', 'có trợ lực', 'bình 12V-70Ah x 2 bình', '825-16', '- Dung tích téc chứa bùn: 3,7m3- Cơ cấu nâng hạ téc chứa bùn: được điều khiển bằng cơ cấu thủy lực- Đường kính ống hút, xả: F100mm+ Áp suất xả: 0,05Mpa- Vật liệu téc chứa bùn:+ Nửa trên: inox 304, dầy 5mm+ Nửa dưới: thép chịu lực, dầy 4,5mm', NULL),
(992, '29Y – 4845', 'Xe téc chở bùn', NULL, 'Nissan', 'Nhật', '2005', '4x2', 4, '6020x2200x2580mm', '3 chỗ', '3220mm', '4290kg', '3885kg', '6925cm3', '132kw', 'có trợ lực', 'bình 12V-70Ah x 2 bình', '825-16', '- Dung tích téc chứa bùn: 3,7m3- Cơ cấu nâng hạ téc chứa bùn: được điều khiển bằng cơ cấu thủy lực- Đường kính ống hút, xả: F100mm+ Áp suất xả: 0,05Mpa- Vật liệu téc chứa bùn:+ Nửa trên: inox 304, dầy 5mm+ Nửa dưới: thép chịu lực, dầy 4,5mm', NULL),
(993, '29Y - 4935', 'Xe téc chở bùn', NULL, 'Nissan', 'Nhật', '2005', '4x2', 4, '6020x2200x2580mm', '3 chỗ', '3220mm', '4290kg', '3885kg', '6925cm3', '132kw', 'có trợ lực', 'bình 12V-70Ah x 2 bình', '825-16', '- Dung tích téc chứa bùn: 3,7m3- Cơ cấu nâng hạ téc chứa bùn: được điều khiển bằng cơ cấu thủy lực- Đường kính ống hút, xả: F100mm+ Áp suất xả: 0,05Mpa- Vật liệu téc chứa bùn:+ Nửa trên: inox 304, dầy 5mm+ Nửa dưới: thép chịu lực, dầy 4,5mm', NULL),
(994, '29L – 4884', 'Xe téc chở bùn', NULL, 'Nissan', 'Nhật', '1998', '4x2', 4, '5850x2100x2650mm', '3 chỗ', '3250mm', '4400kg', '4000kg', '6925cm3', '180PS', 'có trợ lực', 'bình 12V-70Ah x 2 bình', '825-16', '- Dung tích téc chứa bùn: 3,7m3\r\n- Cơ cấu nâng hạ téc chứa bùn: được điều khiển bằng cơ cấu thủy lực\r\n- Đường kính ống hút, xả: F100mm\r\n   + Áp suất xả: 0,05Mpa\r\n- Vật liệu téc chứa bùn:\r\n   + Nửa trên: inox 304, dầy 5mm\r\n   + Nửa dưới: thép chịu lực, dầy 4,5mm', NULL),
(995, '29C-144.48', 'Xe téc chở bùn', NULL, 'Nissan', 'Nhật', '2011', '4x2', 4, '6040x2200x2600mm', '3 chỗ', '3220mm', '4600kg', '4440kg', '6925cm3', '157kw', 'có trợ lực', 'bình 12V-70Ah x 2 bình', '825-16', '- Dung tích téc chứa bùn: 3,7m3\r\n- Cơ cấu nâng hạ téc chứa bùn: được điều khiển bằng cơ cấu thủy lực\r\n- Đường kính ống hút, xả: F100mm\r\n   + Áp suất xả: 0,05Mpa\r\n- Vật liệu téc chứa bùn:\r\n   + Nửa trên: inox 304, dầy 5mm\r\n   + Nửa dưới: thép chịu lực, dầy 4,5mm', NULL),
(996, '29C-183.15', 'Xe téc chở bùn', NULL, 'Nissan', 'Nhật', '2011', '4x2', 4, '6040x2200x2600mm', '3 chỗ', '3220mm', '4600kg', '4440kg', '6925cm3', '157kw', 'có trợ lực', 'bình 12V-70Ah x 2 bình', '825-16', '- Dung tích téc chứa bùn: 3,7m3\r\n- Cơ cấu nâng hạ téc chứa bùn: được điều khiển bằng cơ cấu thủy lực\r\n- Đường kính ống hút, xả: F100mm\r\n   + Áp suất xả: 0,05Mpa\r\n- Vật liệu téc chứa bùn:\r\n   + Nửa trên: inox 304, dầy 5mm\r\n   + Nửa dưới: thép chịu lực, dầy 4,5mm', NULL),
(997, '29C-184.25', 'Xe téc chở bùn', NULL, 'Nissan', 'Nhật', '2011', '4x2', 4, '6040x2200x2600mm', '3 chỗ', '3220mm', '4600kg', '4440kg', '6925cm3', '157kw', 'có trợ lực', 'bình 12V-70Ah x 2 bình', '825-16', '- Dung tích téc chứa bùn: 3,7m3\r\n- Cơ cấu nâng hạ téc chứa bùn: được điều khiển bằng cơ cấu thủy lực\r\n- Đường kính ống hút, xả: F100mm\r\n   + Áp suất xả: 0,05Mpa\r\n- Vật liệu téc chứa bùn:\r\n   + Nửa trên: inox 304, dầy 5mm\r\n   + Nửa dưới: thép chịu lực, dầy 4,5mm', NULL),
(998, '29C-184.43', 'Xe téc chở bùn', NULL, 'Nissan', 'Nhật', '2011', '4x2', 4, '6040x2200x2600mm', '3 chỗ', '3220mm', '4600kg', '4440kg', '6925cm3', '157kw', 'có trợ lực', 'bình 12V-70Ah x 2 bình', '825-16', '- Dung tích téc chứa bùn: 3,7m3\r\n- Cơ cấu nâng hạ téc chứa bùn: được điều khiển bằng cơ cấu thủy lực\r\n- Đường kính ống hút, xả: F100mm\r\n   + Áp suất xả: 0,05Mpa\r\n- Vật liệu téc chứa bùn:\r\n   + Nửa trên: inox 304, dầy 5mm\r\n   + Nửa dưới: thép chịu lực, dầy 4,5mm', NULL),
(999, '29C-151.71', 'Xe téc chở bùn', NULL, 'Nissan', 'Nhật', '2011', '4x2', 4, '6040x2200x2600mm', '3 chỗ', '3220mm', '4600kg', '4440kg', '6925cm3', '157kw', 'có trợ lực', 'bình 12V-70Ah x 2 bình', '825-16', '- Dung tích téc chứa bùn: 3,7m3\r\n- Cơ cấu nâng hạ téc chứa bùn: được điều khiển bằng cơ cấu thủy lực\r\n- Đường kính ống hút, xả: F100mm\r\n   + Áp suất xả: 0,05Mpa\r\n- Vật liệu téc chứa bùn:\r\n   + Nửa trên: inox 304, dầy 5mm\r\n   + Nửa dưới: thép chịu lực, dầy 4,5mm', NULL),
(1000, '29L- 4836', 'Xe téc nước', 1, 'Nissan', 'Nhật', '1998', '4x2', 4, '6600x2200x2480mm', '3 chỗ', '3700mm', '4390kg', '5000kg', '6625cm3', '177HP', 'có trợ lực', 'bình 12V-70Ah x 2 bình', '825-16', '- Dung tích téc chứa: 5m3\n- Lưu lượng bơm lớn nhất: 1400 lít/phút', ''),
(1001, '29L- 4839', 'Xe téc chở nước', NULL, 'Nissan', 'Nhật', '1998', '4x2', 4, '6600x2200x2480mm', '3 chỗ', '3700mm', '4390kg', '5000kg', '6625cm3', '177HP', 'có trợ lực', 'bình 12V-70Ah x 2 bình', '825-16', '- Dung tích téc chứa: 5m3\n- Lưu lượng bơm lớn nhất: 1400 lít/phút', ''),
(1002, '29C-184.92', 'Xe téc chở nước', NULL, 'Hino', 'Việt Nam', '2010', '4x2', 4, '6320x2200x2970mm', '3 chỗ', '3420mm', '4205kg', '6000kg', '5123cm3', '118kw', 'có trợ lực', 'bình 12V-70Ah x 2 bình', '825-16', '- Dung tích téc chứa: 5m3\n- Lưu lượng bơm lớn nhất: 1400 lít/phút', ''),
(1003, '29C-184.45', 'Xe téc chở nước', NULL, 'Hino', 'Việt Nam', '2010', '4x2', 4, '6320x2200x2970mm', '3 chỗ', '3420mm', '4205kg', '6000kg', '5123cm3', '118kw', 'có trợ lực', 'bình 12V-70Ah x 2 bình', '825-16', '- Dung tích téc chứa: 5m3\n- Lưu lượng bơm lớn nhất: 1400 lít/phút', ''),
(1004, '29C-183.57', 'Xe téc chở nước', NULL, 'Hino', 'Việt Nam', '2010', '4x2', 4, '6320x2200x2970mm', '3 chỗ', '3420mm', '4205kg', '6000kg', '5123cm3', '118kw', 'có trợ lực', 'bình 12V-70Ah x 2 bình', '825-16', '- Dung tích téc chứa: 5m3\n- Lưu lượng bơm lớn nhất: 1400 lít/phút', ''),
(1005, '29C-184.75', 'Xe téc chở nước', NULL, 'Hino', 'Việt Nam', '2010', '4x2', 4, '6320x2200x2970mm', '3 chỗ', '3420mm', '4205kg', '6000kg', '5123cm3', '118kw', 'có trợ lực', 'bình 12V-70Ah x 2 bình', '825-16', '- Dung tích téc chứa: 5m3\n- Lưu lượng bơm lớn nhất: 1400 lít/phút', ''),
(1006, '29L- 4830', 'Xe tải có gắn cẩu 3 tấn', NULL, 'Nissan', 'Nhật', '1998', '4x2', 16, '6500x2140x2610mm', '3 chỗ', '4530mm', '4670kg', '4000kg', '6625cm3', '177HP', 'có trợ lực', 'bình 12V-70Ah x 2 bình', '825-16', '', NULL),
(1007, '29L- 4831', 'Xe tải có gắn cẩu 3 tấn', NULL, 'Nissan', 'Nhật', '1998', '4x2', 16, '6100x2140x2610mm', '3 chỗ', '4530mm', '4670kg', '4000kg', '6625cm3', '177HP', 'có trợ lực', 'bình 12V-70Ah x 2 bình', '825-16', '', NULL),
(1008, '29L- 4840', 'Xe tải có gắn cẩu 3 tấn', NULL, 'Nissan', 'Nhật', '1998', '4x2', 16, '6100x2140x2610mm', '3 chỗ', '4530mm', '4670kg', '4000kg', '6625cm3', '177HP', 'có trợ lực', 'bình 12V-70Ah x 2 bình', '825-16', '', NULL),
(1009, '29L- 4837', 'Xe tải có gắn cẩu 3 tấn', NULL, 'Nissan', 'Nhật', '1998', '4x2', 16, '7700x2200x2050mm', '3 chỗ', '4550mm', '5220kg', '4000kg', '6625cm3', '180PS', 'có trợ lực', 'bình 12V-70Ah x 2 bình', '825-16', '', NULL),
(1010, '29C – 184.54', 'Xe bơm nước lưu động 30m3/ph', NULL, 'Nissan', 'Nhật', '2011', '4x2', 12, '7780x2490x3000mm', '3 chỗ', '4350mm', '9700kg', '', '6925cm3', '157kw', 'có trợ lực', 'bình 12V-70Ah x 2 bình', '900-20', '1. Bơm:\n+ Loại bơm chìm\n+ Số lượng: 4 bơm\n+ Đường kính: 200mm\n+ Lưu lượng: 7,5m3/ph\n+ Tổng cột áp: 10m\n+ Động cơ chìm dưới nước\n+ Công suất: 18kw\n2. Máy phát:\n+ Loại: Brushies\n+ Số lượng: 1 máy\n+ Công suất: 125kva\n+ Điện áp: 440v\n+ Tần số: 60Hz\n3. Tủ điện điều khiển:\n+ Loại kiểu đứng, ngoài trời\n+ Kích thước: 2010x1020x1575mm', ''),
(1011, '29C – 184.76', 'Xe tải có gắn cẩu 3 tấn', NULL, 'Hino', 'Việt Nam', '2010', '4x2', 16, '7850x2420x3400mm', '3 chỗ', '4350mm', '5005kg', '5200kg', '5123 cm3', '118kw', 'có trợ lực', 'bình 12V-70Ah x 2 bình', '825-16', '- Nhãn hiệu: Tadano\r\n- Nước sản xuất: Nhật\r\n- Tải trọng nâng lớn nhất: 3,03 tấn/2,5m\r\n- Bán kính làm việc: 7,5m\r\n- Loại cần/ số đoạn: lục giác/3 đoạn\r\n- Chiều cao nâng: 9,2m\r\n- Bán kính làm việc: 7,5m\r\n- Đường kính cáp: F 8mm x 51m', NULL),
(1012, '29C – 182.69', 'Xe bơm nước lưu động 30m3/ph', 2, 'Nissan', 'Nhật', '2011', '4x2', 12, '7780x2490x3000mm', '3 chỗ', '4350mm', '9700kg', '', '6925cm3', '157kw', 'có trợ lực', '', '900-20', '1. Bơm:\n- Loại bơm chìm\n- Số lượng: 4 bơm\n- Đường kính: 200mm\n- Lưu lượng: 7,5m3/ph\n- Tổng cột áp: 10m\n- Động cơ chìm dưới nước\n- Công suất: 18kw\n2. Máy phát:\n- Loại: Brushies\n- Số lượng: 1 máy\n- Công suất: 125kva\n- Điện áp: 440v\n- Tần số: 60Hz\n3. Tủ điện điều khiển:\n- Loại kiểu đứng, ngoài trời\n- Kích thước: 2010x1020x1575mm', '../data/avatar/2018/05/04/124458_29C_182.69.jpg'),
(1013, '29L - 2339', 'Xe hút chân không 8 tấn', NULL, 'Nissan', 'Nhật', '1995', '4x2', 2, '7520x2100x2800mm', '3 chỗ', '4650mm', '7670kg', '7000kg', '', '', 'có trợ lực', 'bình 12V-135Ah x 2 bình', '1000-20', '', NULL),
(1014, '29LA-1392', 'Xe tải có gắn cẩu 3 tấn', NULL, 'Hitachi', 'Nhật', '2011', '', 16, '7690x2530x3130mm', '3 chỗ', '', '15700kg', '', '', '90kw', '', '', '', '- Dung tích gầu: 0,4m3- Kiểu gầu: Gầu nghịch- Bánh kính đào lớn nhất: 8040mm- Chiều cao đổ vật liệu lớn nhất: 6240mm- Vận tốc di chuyển lớn nhất: 35km/h- Kiểu động cơ: AI-4JJ1X- Áp suất của hệ thủy lực lớn nhất: 350kg/cm2', NULL),
(1015, '29LA-1393', 'Xe tải có gắn cẩu 3 tấn', NULL, 'Hitachi', 'Nhật', '2011', '', 16, '7710x2530x3240mm', '3 chỗ', '16000kg', '', '', '', '90kw', '', '', '', '- Dung tích gầu: 0,2m3- Kiểu gầu: Gầu nghịch- Bánh kính đào lớn nhất: 8870mm- Chiều cao đổ vật liệu lớn nhất: 6760mm- Vận tốc di chuyển lớn nhất: 35km/h- Kiểu động cơ: C64ACERT- Áp suất của hệ thủy lực lớn nhất: 350kg/cm2', NULL),
(1016, '29LA-1394', 'cần trục bánh lốp', NULL, 'Tadano', 'Nhật', '2011', '', 8, '11245x2620x3535mm', '3 chỗ', '', '26940kg', '', '', '160kw', '', '', '', '- Sức nâng lớn nhất: 30 tấn- Tải trọng lớn nhât: 30 tấn/3m- Tải trọng nâng cho phép ở tầm với lớn nhất: 0,5 tấn/28m- Chiều cao nâng móc 31,8m- Tầm với lớn nhất 28m- Vận tốc di chuyển lớn nhất: 47km/h- Kiểu động cơ: QSB67- Tốc độ nâng hạ hàng: 10m/ph- Cần hộp, 4 đoạn, có cần phụ', NULL);

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
(221, 1, NULL, '123', '123', '123', 12, '0.8', 0),
(222, 0, 'Vệ sinh toàn bộ, rửa xe', 'Vệ sinh toàn bộ, rửa xe', '4', '4', 12, NULL, 1),
(223, 0, 'Vệ sinh toàn bộ, rửa xe', 'Vệ sinh toàn bộ, rửa xe', '4', '4', 10, NULL, 1),
(224, 0, 'Vệ sinh toàn bộ, rửa xe', 'Vệ sinh toàn bộ, rửa xe', '4', '4', 8, NULL, 1),
(225, 0, 'Vệ sinh toàn bộ, rửa xe', 'Vệ sinh toàn bộ, rửa xe', '4', '1', 14, NULL, 1),
(226, 0, 'Vệ sinh toàn bộ, rửa xe', 'Vệ sinh toàn bộ, rửa xe', '4', '1', 16, NULL, 1),
(227, 0, 'Vệ sinh toàn bộ, rửa xe', 'Vệ sinh toàn bộ, rửa xe', '4', '2', 6, NULL, 1),
(228, 0, 'Vệ sinh toàn bộ, rửa xe', 'Vệ sinh toàn bộ, rửa xe', '4', '3', 4, NULL, 1),
(229, 0, 'Vệ sinh toàn bộ, rửa xe', 'Vệ sinh toàn bộ, rửa xe', '4', '4', 2, NULL, 1),
(230, 0, 'Vệ sinh bầu lọc gió hoặc thay mới theo chu kỳ', 'Vệ sinh bầu lọc gió hoặc thay mới theo chu kỳ', '4', '0.5', 12, NULL, 1),
(231, 0, 'Vệ sinh bầu lọc gió hoặc thay mới theo chu kỳ', 'Vệ sinh bầu lọc gió hoặc thay mới theo chu kỳ', '4', '0.5', 10, NULL, 1),
(232, 0, 'Vệ sinh bầu lọc gió hoặc thay mới theo chu kỳ', 'Vệ sinh bầu lọc gió hoặc thay mới theo chu kỳ', '4', '0.5', 8, NULL, 1),
(233, 0, 'Vệ sinh bầu lọc gió hoặc thay mới theo chu kỳ', 'Vệ sinh bầu lọc gió hoặc thay mới theo chu kỳ', '4', '0.2', 14, NULL, 1),
(234, 0, 'Vệ sinh bầu lọc gió hoặc thay mới theo chu kỳ', 'Vệ sinh bầu lọc gió hoặc thay mới theo chu kỳ', '4', '0.2', 16, NULL, 1),
(235, 0, 'Vệ sinh bầu lọc gió hoặc thay mới theo chu kỳ', 'Vệ sinh bầu lọc gió hoặc thay mới theo chu kỳ', '4', '0.33', 6, NULL, 1),
(236, 0, 'Vệ sinh bầu lọc gió hoặc thay mới theo chu kỳ', 'Vệ sinh bầu lọc gió hoặc thay mới theo chu kỳ', '4', '0.5', 4, NULL, 1),
(237, 0, 'Vệ sinh bầu lọc gió hoặc thay mới theo chu kỳ', 'Vệ sinh bầu lọc gió hoặc thay mới theo chu kỳ', '4', '0.5', 2, NULL, 1),
(238, 0, 'Kiểm tra, bảo dưỡng hệ thống nhiên liệu, rửa sạch bầu lọc, xả cặn thùng nhiên liệu, kiểm tra các chỗ rò rỉ', 'Kiểm tra, bảo dưỡng hệ thống nhiên liệu, rửa sạch bầu lọc, xả cặn thùng nhiên liệu, kiểm tra các chỗ rò rỉ', '4', '2.5', 12, NULL, 1),
(239, 0, 'Kiểm tra, bảo dưỡng hệ thống nhiên liệu, rửa sạch bầu lọc, xả cặn thùng nhiên liệu, kiểm tra các chỗ rò rỉ', 'Kiểm tra, bảo dưỡng hệ thống nhiên liệu, rửa sạch bầu lọc, xả cặn thùng nhiên liệu, kiểm tra các chỗ rò rỉ', '4', '2.5', 10, NULL, 1),
(240, 0, 'Kiểm tra, bảo dưỡng hệ thống nhiên liệu, rửa sạch bầu lọc, xả cặn thùng nhiên liệu, kiểm tra các chỗ rò rỉ', 'Kiểm tra, bảo dưỡng hệ thống nhiên liệu, rửa sạch bầu lọc, xả cặn thùng nhiên liệu, kiểm tra các chỗ rò rỉ', '4', '2.5', 8, NULL, 1),
(241, 0, 'Kiểm tra, bảo dưỡng hệ thống nhiên liệu, rửa sạch bầu lọc, xả cặn thùng nhiên liệu, kiểm tra các chỗ rò rỉ', 'Kiểm tra, bảo dưỡng hệ thống nhiên liệu, rửa sạch bầu lọc, xả cặn thùng nhiên liệu, kiểm tra các chỗ rò rỉ', '4', '0.5', 14, NULL, 1),
(242, 0, 'Kiểm tra, bảo dưỡng hệ thống nhiên liệu, rửa sạch bầu lọc, xả cặn thùng nhiên liệu, kiểm tra các chỗ rò rỉ', 'Kiểm tra, bảo dưỡng hệ thống nhiên liệu, rửa sạch bầu lọc, xả cặn thùng nhiên liệu, kiểm tra các chỗ rò rỉ', '4', '0.5', 16, NULL, 1),
(243, 0, 'Kiểm tra, bảo dưỡng hệ thống nhiên liệu, rửa sạch bầu lọc, xả cặn thùng nhiên liệu, kiểm tra các chỗ rò rỉ', 'Kiểm tra, bảo dưỡng hệ thống nhiên liệu, rửa sạch bầu lọc, xả cặn thùng nhiên liệu, kiểm tra các chỗ rò rỉ', '4', '2.17', 6, NULL, 1),
(244, 0, 'Kiểm tra, bảo dưỡng hệ thống nhiên liệu, rửa sạch bầu lọc, xả cặn thùng nhiên liệu, kiểm tra các chỗ rò rỉ', 'Kiểm tra, bảo dưỡng hệ thống nhiên liệu, rửa sạch bầu lọc, xả cặn thùng nhiên liệu, kiểm tra các chỗ rò rỉ', '4', '2.33', 4, NULL, 1),
(245, 0, 'Kiểm tra, bảo dưỡng hệ thống nhiên liệu, rửa sạch bầu lọc, xả cặn thùng nhiên liệu, kiểm tra các chỗ rò rỉ', 'Kiểm tra, bảo dưỡng hệ thống nhiên liệu, rửa sạch bầu lọc, xả cặn thùng nhiên liệu, kiểm tra các chỗ rò rỉ', '4', '2.5', 2, NULL, 1),
(246, 0, 'Tháo rửa bầu lọc dầu máy, thay theo định ngạch. Bổ sung dầu máy nếu thiếu', 'Tháo rửa bầu lọc dầu máy, thay theo định ngạch. Bổ sung dầu máy nếu thiếu', '4', '4', 12, NULL, 1),
(247, 0, 'Tháo rửa bầu lọc dầu máy, thay theo định ngạch. Bổ sung dầu máy nếu thiếu', 'Tháo rửa bầu lọc dầu máy, thay theo định ngạch. Bổ sung dầu máy nếu thiếu', '4', '4', 10, NULL, 1),
(248, 0, 'Tháo rửa bầu lọc dầu máy, thay theo định ngạch. Bổ sung dầu máy nếu thiếu', 'Tháo rửa bầu lọc dầu máy, thay theo định ngạch. Bổ sung dầu máy nếu thiếu', '4', '4', 8, NULL, 1),
(249, 0, 'Tháo rửa bầu lọc dầu máy, thay theo định ngạch. Bổ sung dầu máy nếu thiếu', 'Tháo rửa bầu lọc dầu máy, thay theo định ngạch. Bổ sung dầu máy nếu thiếu', '4', '0.25', 14, NULL, 1),
(250, 0, 'Tháo rửa bầu lọc dầu máy, thay theo định ngạch. Bổ sung dầu máy nếu thiếu', 'Tháo rửa bầu lọc dầu máy, thay theo định ngạch. Bổ sung dầu máy nếu thiếu', '4', '0.25', 16, NULL, 1),
(251, 0, 'Tháo rửa bầu lọc dầu máy, thay theo định ngạch. Bổ sung dầu máy nếu thiếu', 'Tháo rửa bầu lọc dầu máy, thay theo định ngạch. Bổ sung dầu máy nếu thiếu', '4', '3.5', 6, NULL, 1),
(252, 0, 'Tháo rửa bầu lọc dầu máy, thay theo định ngạch. Bổ sung dầu máy nếu thiếu', 'Tháo rửa bầu lọc dầu máy, thay theo định ngạch. Bổ sung dầu máy nếu thiếu', '4', '3.84', 4, NULL, 1),
(253, 0, 'Tháo rửa bầu lọc dầu máy, thay theo định ngạch. Bổ sung dầu máy nếu thiếu', 'Tháo rửa bầu lọc dầu máy, thay theo định ngạch. Bổ sung dầu máy nếu thiếu', '4', '4', 2, NULL, 1),
(254, 0, 'Kiểm tra và bổ sung nếu thiếu dầu hộp số, dầu cầu, dầu thủy lực, trợ lái, bơm hơi', 'Kiểm tra và bổ sung nếu thiếu dầu hộp số, dầu cầu, dầu thủy lực, trợ lái, bơm hơi', '4', '4', 12, NULL, 1),
(255, 0, 'Kiểm tra và bổ sung nếu thiếu dầu hộp số, dầu cầu, dầu thủy lực, trợ lái, bơm hơi', 'Kiểm tra và bổ sung nếu thiếu dầu hộp số, dầu cầu, dầu thủy lực, trợ lái, bơm hơi', '4', '4', 10, NULL, 1),
(256, 0, 'Kiểm tra và bổ sung nếu thiếu dầu hộp số, dầu cầu, dầu thủy lực, trợ lái, bơm hơi', 'Kiểm tra và bổ sung nếu thiếu dầu hộp số, dầu cầu, dầu thủy lực, trợ lái, bơm hơi', '4', '4', 8, NULL, 1),
(257, 0, 'Kiểm tra và bổ sung nếu thiếu dầu hộp số, dầu cầu, dầu thủy lực, trợ lái, bơm hơi', 'Kiểm tra và bổ sung nếu thiếu dầu hộp số, dầu cầu, dầu thủy lực, trợ lái, bơm hơi', '4', '0', 14, NULL, 1),
(258, 0, 'Kiểm tra và bổ sung nếu thiếu dầu hộp số, dầu cầu, dầu thủy lực, trợ lái, bơm hơi', 'Kiểm tra và bổ sung nếu thiếu dầu hộp số, dầu cầu, dầu thủy lực, trợ lái, bơm hơi', '4', '0', 16, NULL, 1),
(259, 0, 'Kiểm tra và bổ sung nếu thiếu dầu hộp số, dầu cầu, dầu thủy lực, trợ lái, bơm hơi', 'Kiểm tra và bổ sung nếu thiếu dầu hộp số, dầu cầu, dầu thủy lực, trợ lái, bơm hơi', '4', '3.5', 6, NULL, 1),
(260, 0, 'Kiểm tra và bổ sung nếu thiếu dầu hộp số, dầu cầu, dầu thủy lực, trợ lái, bơm hơi', 'Kiểm tra và bổ sung nếu thiếu dầu hộp số, dầu cầu, dầu thủy lực, trợ lái, bơm hơi', '4', '3.84', 4, NULL, 1),
(261, 0, 'Kiểm tra và bổ sung nếu thiếu dầu hộp số, dầu cầu, dầu thủy lực, trợ lái, bơm hơi', 'Kiểm tra và bổ sung nếu thiếu dầu hộp số, dầu cầu, dầu thủy lực, trợ lái, bơm hơi', '4', '4', 2, NULL, 1),
(262, 0, 'Kiểm tra điều chỉnh độ căng dây cu roa', 'Kiểm tra điều chỉnh độ căng dây cu roa', '4', '1', 12, NULL, 1),
(263, 0, 'Kiểm tra điều chỉnh độ căng dây cu roa', 'Kiểm tra điều chỉnh độ căng dây cu roa', '4', '1', 10, NULL, 1),
(264, 0, 'Kiểm tra điều chỉnh độ căng dây cu roa', 'Kiểm tra điều chỉnh độ căng dây cu roa', '4', '1', 8, NULL, 1),
(265, 0, 'Kiểm tra điều chỉnh độ căng dây cu roa', 'Kiểm tra điều chỉnh độ căng dây cu roa', '4', '0.5', 14, NULL, 1),
(266, 0, 'Kiểm tra điều chỉnh độ căng dây cu roa', 'Kiểm tra điều chỉnh độ căng dây cu roa', '4', '0.5', 16, NULL, 1),
(267, 0, 'Kiểm tra điều chỉnh độ căng dây cu roa', 'Kiểm tra điều chỉnh độ căng dây cu roa', '4', '0.5', 6, NULL, 1),
(268, 0, 'Kiểm tra điều chỉnh độ căng dây cu roa', 'Kiểm tra điều chỉnh độ căng dây cu roa', '4', '0.84', 4, NULL, 1),
(269, 0, 'Kiểm tra điều chỉnh độ căng dây cu roa', 'Kiểm tra điều chỉnh độ căng dây cu roa', '4', '1', 2, NULL, 1),
(270, 0, 'Kiểm tra điều chỉnh phanh tay, phanh chân, côn, độ nhạy chân ga', 'Kiểm tra điều chỉnh phanh tay, phanh chân, côn, độ nhạy chân ga', '5', '2', 12, NULL, 1),
(271, 0, 'Kiểm tra điều chỉnh phanh tay, phanh chân, côn, độ nhạy chân ga', 'Kiểm tra điều chỉnh phanh tay, phanh chân, côn, độ nhạy chân ga', '5', '2', 10, NULL, 1),
(272, 0, 'Kiểm tra điều chỉnh phanh tay, phanh chân, côn, độ nhạy chân ga', 'Kiểm tra điều chỉnh phanh tay, phanh chân, côn, độ nhạy chân ga', '5', '2', 8, NULL, 1),
(273, 0, 'Kiểm tra điều chỉnh phanh tay, phanh chân, côn, độ nhạy chân ga', 'Kiểm tra điều chỉnh phanh tay, phanh chân, côn, độ nhạy chân ga', '5', '0', 14, NULL, 1),
(274, 0, 'Kiểm tra điều chỉnh phanh tay, phanh chân, côn, độ nhạy chân ga', 'Kiểm tra điều chỉnh phanh tay, phanh chân, côn, độ nhạy chân ga', '5', '0', 16, NULL, 1),
(275, 0, 'Kiểm tra điều chỉnh phanh tay, phanh chân, côn, độ nhạy chân ga', 'Kiểm tra điều chỉnh phanh tay, phanh chân, côn, độ nhạy chân ga', '5', '1.5', 6, NULL, 1),
(276, 0, 'Kiểm tra điều chỉnh phanh tay, phanh chân, côn, độ nhạy chân ga', 'Kiểm tra điều chỉnh phanh tay, phanh chân, côn, độ nhạy chân ga', '5', '1.84', 4, NULL, 1),
(277, 0, 'Kiểm tra điều chỉnh phanh tay, phanh chân, côn, độ nhạy chân ga', 'Kiểm tra điều chỉnh phanh tay, phanh chân, côn, độ nhạy chân ga', '5', '2', 2, NULL, 1),
(278, 0, 'Kiểm tra, xiết chặt các liên kết của két nước. Vệ sinh làm sạch cánh tản nhiệt và bổ sung nước vào két làm mát', 'Kiểm tra, xiết chặt các liên kết của két nước. Vệ sinh làm sạch cánh tản nhiệt và bổ sung nước vào két làm mát', '4', '1', 12, NULL, 1),
(279, 0, 'Kiểm tra, xiết chặt các liên kết của két nước. Vệ sinh làm sạch cánh tản nhiệt và bổ sung nước vào két làm mát', 'Kiểm tra, xiết chặt các liên kết của két nước. Vệ sinh làm sạch cánh tản nhiệt và bổ sung nước vào két làm mát', '4', '1', 10, NULL, 1),
(280, 0, 'Kiểm tra, xiết chặt các liên kết của két nước. Vệ sinh làm sạch cánh tản nhiệt và bổ sung nước vào két làm mát', 'Kiểm tra, xiết chặt các liên kết của két nước. Vệ sinh làm sạch cánh tản nhiệt và bổ sung nước vào két làm mát', '4', '1', 8, NULL, 1),
(281, 0, 'Kiểm tra, xiết chặt các liên kết của két nước. Vệ sinh làm sạch cánh tản nhiệt và bổ sung nước vào két làm mát', 'Kiểm tra, xiết chặt các liên kết của két nước. Vệ sinh làm sạch cánh tản nhiệt và bổ sung nước vào két làm mát', '4', '0.5', 14, NULL, 1),
(282, 0, 'Kiểm tra, xiết chặt các liên kết của két nước. Vệ sinh làm sạch cánh tản nhiệt và bổ sung nước vào két làm mát', 'Kiểm tra, xiết chặt các liên kết của két nước. Vệ sinh làm sạch cánh tản nhiệt và bổ sung nước vào két làm mát', '4', '0.5', 16, NULL, 1),
(283, 0, 'Kiểm tra, xiết chặt các liên kết của két nước. Vệ sinh làm sạch cánh tản nhiệt và bổ sung nước vào két làm mát', 'Kiểm tra, xiết chặt các liên kết của két nước. Vệ sinh làm sạch cánh tản nhiệt và bổ sung nước vào két làm mát', '4', '0.5', 6, NULL, 1),
(284, 0, 'Kiểm tra, xiết chặt các liên kết của két nước. Vệ sinh làm sạch cánh tản nhiệt và bổ sung nước vào két làm mát', 'Kiểm tra, xiết chặt các liên kết của két nước. Vệ sinh làm sạch cánh tản nhiệt và bổ sung nước vào két làm mát', '4', '0.84', 4, NULL, 1),
(285, 0, 'Kiểm tra, xiết chặt các liên kết của két nước. Vệ sinh làm sạch cánh tản nhiệt và bổ sung nước vào két làm mát', 'Kiểm tra, xiết chặt các liên kết của két nước. Vệ sinh làm sạch cánh tản nhiệt và bổ sung nước vào két làm mát', '4', '1', 2, NULL, 1),
(286, 0, 'Kiểm tra, điều chỉnh độ rơ tay lái, độ rơ bánh dẫn hướng. Kiểm tra siết chặt các rô tuyn  ba ngang, ba dọc. Bổ sung dầu trợ lực lái nếu thiếu (hoặc hệ thống điều khiển chuyển hướng đối với máy công trình)', 'Kiểm tra, điều chỉnh độ rơ tay lái, độ rơ bánh dẫn hướng. Kiểm tra siết chặt các rô tuyn  ba ngang, ba dọc. Bổ sung dầu trợ lực lái nếu thiếu (hoặc hệ thống điều khiển chuyển hướng đối với máy công trình)', '5', '2', 12, NULL, 1),
(287, 0, 'Kiểm tra, điều chỉnh độ rơ tay lái, độ rơ bánh dẫn hướng. Kiểm tra siết chặt các rô tuyn  ba ngang, ba dọc. Bổ sung dầu trợ lực lái nếu thiếu (hoặc hệ thống điều khiển chuyển hướng đối với máy công trình)', 'Kiểm tra, điều chỉnh độ rơ tay lái, độ rơ bánh dẫn hướng. Kiểm tra siết chặt các rô tuyn  ba ngang, ba dọc. Bổ sung dầu trợ lực lái nếu thiếu (hoặc hệ thống điều khiển chuyển hướng đối với máy công trình)', '5', '2', 10, NULL, 1),
(288, 0, 'Kiểm tra, điều chỉnh độ rơ tay lái, độ rơ bánh dẫn hướng. Kiểm tra siết chặt các rô tuyn  ba ngang, ba dọc. Bổ sung dầu trợ lực lái nếu thiếu (hoặc hệ thống điều khiển chuyển hướng đối với máy công trình)', 'Kiểm tra, điều chỉnh độ rơ tay lái, độ rơ bánh dẫn hướng. Kiểm tra siết chặt các rô tuyn  ba ngang, ba dọc. Bổ sung dầu trợ lực lái nếu thiếu (hoặc hệ thống điều khiển chuyển hướng đối với máy công trình)', '5', '2', 8, NULL, 1),
(289, 0, 'Kiểm tra, điều chỉnh độ rơ tay lái, độ rơ bánh dẫn hướng. Kiểm tra siết chặt các rô tuyn  ba ngang, ba dọc. Bổ sung dầu trợ lực lái nếu thiếu (hoặc hệ thống điều khiển chuyển hướng đối với máy công trình)', 'Kiểm tra, điều chỉnh độ rơ tay lái, độ rơ bánh dẫn hướng. Kiểm tra siết chặt các rô tuyn  ba ngang, ba dọc. Bổ sung dầu trợ lực lái nếu thiếu (hoặc hệ thống điều khiển chuyển hướng đối với máy công trình)', '5', '0', 14, NULL, 1),
(290, 0, 'Kiểm tra, điều chỉnh độ rơ tay lái, độ rơ bánh dẫn hướng. Kiểm tra siết chặt các rô tuyn  ba ngang, ba dọc. Bổ sung dầu trợ lực lái nếu thiếu (hoặc hệ thống điều khiển chuyển hướng đối với máy công trình)', 'Kiểm tra, điều chỉnh độ rơ tay lái, độ rơ bánh dẫn hướng. Kiểm tra siết chặt các rô tuyn  ba ngang, ba dọc. Bổ sung dầu trợ lực lái nếu thiếu (hoặc hệ thống điều khiển chuyển hướng đối với máy công trình)', '5', '0', 16, NULL, 1),
(291, 0, 'Kiểm tra, điều chỉnh độ rơ tay lái, độ rơ bánh dẫn hướng. Kiểm tra siết chặt các rô tuyn  ba ngang, ba dọc. Bổ sung dầu trợ lực lái nếu thiếu (hoặc hệ thống điều khiển chuyển hướng đối với máy công trình)', 'Kiểm tra, điều chỉnh độ rơ tay lái, độ rơ bánh dẫn hướng. Kiểm tra siết chặt các rô tuyn  ba ngang, ba dọc. Bổ sung dầu trợ lực lái nếu thiếu (hoặc hệ thống điều khiển chuyển hướng đối với máy công trình)', '5', '1.5', 6, NULL, 1),
(292, 0, 'Kiểm tra, điều chỉnh độ rơ tay lái, độ rơ bánh dẫn hướng. Kiểm tra siết chặt các rô tuyn  ba ngang, ba dọc. Bổ sung dầu trợ lực lái nếu thiếu (hoặc hệ thống điều khiển chuyển hướng đối với máy công trình)', 'Kiểm tra, điều chỉnh độ rơ tay lái, độ rơ bánh dẫn hướng. Kiểm tra siết chặt các rô tuyn  ba ngang, ba dọc. Bổ sung dầu trợ lực lái nếu thiếu (hoặc hệ thống điều khiển chuyển hướng đối với máy công trình)', '5', '1.84', 4, NULL, 1),
(293, 0, 'Kiểm tra, điều chỉnh độ rơ tay lái, độ rơ bánh dẫn hướng. Kiểm tra siết chặt các rô tuyn  ba ngang, ba dọc. Bổ sung dầu trợ lực lái nếu thiếu (hoặc hệ thống điều khiển chuyển hướng đối với máy công trình)', 'Kiểm tra, điều chỉnh độ rơ tay lái, độ rơ bánh dẫn hướng. Kiểm tra siết chặt các rô tuyn  ba ngang, ba dọc. Bổ sung dầu trợ lực lái nếu thiếu (hoặc hệ thống điều khiển chuyển hướng đối với máy công trình)', '5', '2', 2, NULL, 1),
(294, 0, 'Kiểm tra, bổ sung dung dịch bình điện', 'Kiểm tra, bổ sung dung dịch bình điện', '4', '1.5', 12, NULL, 1),
(295, 0, 'Kiểm tra, bổ sung dung dịch bình điện', 'Kiểm tra, bổ sung dung dịch bình điện', '4', '1.5', 10, NULL, 1),
(296, 0, 'Kiểm tra, bổ sung dung dịch bình điện', 'Kiểm tra, bổ sung dung dịch bình điện', '4', '1.5', 8, NULL, 1),
(297, 0, 'Kiểm tra, bổ sung dung dịch bình điện', 'Kiểm tra, bổ sung dung dịch bình điện', '4', '0.5', 14, NULL, 1),
(298, 0, 'Kiểm tra, bổ sung dung dịch bình điện', 'Kiểm tra, bổ sung dung dịch bình điện', '4', '0.5', 16, NULL, 1),
(299, 0, 'Kiểm tra, bổ sung dung dịch bình điện', 'Kiểm tra, bổ sung dung dịch bình điện', '4', '1', 6, NULL, 1),
(300, 0, 'Kiểm tra, bổ sung dung dịch bình điện', 'Kiểm tra, bổ sung dung dịch bình điện', '4', '1.33', 4, NULL, 1),
(301, 0, 'Kiểm tra, bổ sung dung dịch bình điện', 'Kiểm tra, bổ sung dung dịch bình điện', '4', '1.5', 2, NULL, 1),
(302, 0, 'Kiểm tra tình trạng bề mặt ngoài của lốp và áp suất lốp theo tiêu chuẩn. Bơm bổ sung nếu không đủ. (Hoặc các guốc xích, bánh căng, bánh sao và các con lăn đối với máy công trình)', 'Kiểm tra tình trạng bề mặt ngoài của lốp và áp suất lốp theo tiêu chuẩn. Bơm bổ sung nếu không đủ. (Hoặc các guốc xích, bánh căng, bánh sao và các con lăn đối với máy công trình)', '4', '1', 12, NULL, 1),
(303, 0, 'Kiểm tra tình trạng bề mặt ngoài của lốp và áp suất lốp theo tiêu chuẩn. Bơm bổ sung nếu không đủ. (Hoặc các guốc xích, bánh căng, bánh sao và các con lăn đối với máy công trình)', 'Kiểm tra tình trạng bề mặt ngoài của lốp và áp suất lốp theo tiêu chuẩn. Bơm bổ sung nếu không đủ. (Hoặc các guốc xích, bánh căng, bánh sao và các con lăn đối với máy công trình)', '4', '1', 10, NULL, 1),
(304, 0, 'Kiểm tra tình trạng bề mặt ngoài của lốp và áp suất lốp theo tiêu chuẩn. Bơm bổ sung nếu không đủ. (Hoặc các guốc xích, bánh căng, bánh sao và các con lăn đối với máy công trình)', 'Kiểm tra tình trạng bề mặt ngoài của lốp và áp suất lốp theo tiêu chuẩn. Bơm bổ sung nếu không đủ. (Hoặc các guốc xích, bánh căng, bánh sao và các con lăn đối với máy công trình)', '4', '1', 8, NULL, 1),
(305, 0, 'Kiểm tra tình trạng bề mặt ngoài của lốp và áp suất lốp theo tiêu chuẩn. Bơm bổ sung nếu không đủ. (Hoặc các guốc xích, bánh căng, bánh sao và các con lăn đối với máy công trình)', 'Kiểm tra tình trạng bề mặt ngoài của lốp và áp suất lốp theo tiêu chuẩn. Bơm bổ sung nếu không đủ. (Hoặc các guốc xích, bánh căng, bánh sao và các con lăn đối với máy công trình)', '4', '0.5', 14, NULL, 1),
(306, 0, 'Kiểm tra tình trạng bề mặt ngoài của lốp và áp suất lốp theo tiêu chuẩn. Bơm bổ sung nếu không đủ. (Hoặc các guốc xích, bánh căng, bánh sao và các con lăn đối với máy công trình)', 'Kiểm tra tình trạng bề mặt ngoài của lốp và áp suất lốp theo tiêu chuẩn. Bơm bổ sung nếu không đủ. (Hoặc các guốc xích, bánh căng, bánh sao và các con lăn đối với máy công trình)', '4', '0.5', 16, NULL, 1),
(307, 0, 'Kiểm tra tình trạng bề mặt ngoài của lốp và áp suất lốp theo tiêu chuẩn. Bơm bổ sung nếu không đủ. (Hoặc các guốc xích, bánh căng, bánh sao và các con lăn đối với máy công trình)', 'Kiểm tra tình trạng bề mặt ngoài của lốp và áp suất lốp theo tiêu chuẩn. Bơm bổ sung nếu không đủ. (Hoặc các guốc xích, bánh căng, bánh sao và các con lăn đối với máy công trình)', '4', '0.5', 6, NULL, 1),
(308, 0, 'Kiểm tra tình trạng bề mặt ngoài của lốp và áp suất lốp theo tiêu chuẩn. Bơm bổ sung nếu không đủ. (Hoặc các guốc xích, bánh căng, bánh sao và các con lăn đối với máy công trình)', 'Kiểm tra tình trạng bề mặt ngoài của lốp và áp suất lốp theo tiêu chuẩn. Bơm bổ sung nếu không đủ. (Hoặc các guốc xích, bánh căng, bánh sao và các con lăn đối với máy công trình)', '4', '0.84', 4, NULL, 1),
(309, 0, 'Kiểm tra tình trạng bề mặt ngoài của lốp và áp suất lốp theo tiêu chuẩn. Bơm bổ sung nếu không đủ. (Hoặc các guốc xích, bánh căng, bánh sao và các con lăn đối với máy công trình)', 'Kiểm tra tình trạng bề mặt ngoài của lốp và áp suất lốp theo tiêu chuẩn. Bơm bổ sung nếu không đủ. (Hoặc các guốc xích, bánh căng, bánh sao và các con lăn đối với máy công trình)', '4', '1', 2, NULL, 1),
(310, 0, 'Kiểm tra các khớp chuyển động (kể cả phần chuyên dùng). Bơm mỡ và các điểm có vú mỡ theo qui định', 'Kiểm tra các khớp chuyển động (kể cả phần chuyên dùng). Bơm mỡ và các điểm có vú mỡ theo qui định', '4', '3', 12, NULL, 1),
(311, 0, 'Kiểm tra các khớp chuyển động (kể cả phần chuyên dùng). Bơm mỡ và các điểm có vú mỡ theo qui định', 'Kiểm tra các khớp chuyển động (kể cả phần chuyên dùng). Bơm mỡ và các điểm có vú mỡ theo qui định', '4', '3', 10, NULL, 1),
(312, 0, 'Kiểm tra các khớp chuyển động (kể cả phần chuyên dùng). Bơm mỡ và các điểm có vú mỡ theo qui định', 'Kiểm tra các khớp chuyển động (kể cả phần chuyên dùng). Bơm mỡ và các điểm có vú mỡ theo qui định', '4', '3', 8, NULL, 1),
(313, 0, 'Kiểm tra các khớp chuyển động (kể cả phần chuyên dùng). Bơm mỡ và các điểm có vú mỡ theo qui định', 'Kiểm tra các khớp chuyển động (kể cả phần chuyên dùng). Bơm mỡ và các điểm có vú mỡ theo qui định', '4', '0.5', 14, NULL, 1),
(314, 0, 'Kiểm tra các khớp chuyển động (kể cả phần chuyên dùng). Bơm mỡ và các điểm có vú mỡ theo qui định', 'Kiểm tra các khớp chuyển động (kể cả phần chuyên dùng). Bơm mỡ và các điểm có vú mỡ theo qui định', '4', '0.5', 16, NULL, 1),
(315, 0, 'Kiểm tra các khớp chuyển động (kể cả phần chuyên dùng). Bơm mỡ và các điểm có vú mỡ theo qui định', 'Kiểm tra các khớp chuyển động (kể cả phần chuyên dùng). Bơm mỡ và các điểm có vú mỡ theo qui định', '4', '2', 6, NULL, 1),
(316, 0, 'Kiểm tra các khớp chuyển động (kể cả phần chuyên dùng). Bơm mỡ và các điểm có vú mỡ theo qui định', 'Kiểm tra các khớp chuyển động (kể cả phần chuyên dùng). Bơm mỡ và các điểm có vú mỡ theo qui định', '4', '2.5', 4, NULL, 1),
(317, 0, 'Kiểm tra các khớp chuyển động (kể cả phần chuyên dùng). Bơm mỡ và các điểm có vú mỡ theo qui định', 'Kiểm tra các khớp chuyển động (kể cả phần chuyên dùng). Bơm mỡ và các điểm có vú mỡ theo qui định', '4', '3', 2, NULL, 1),
(318, 0, 'Kiểm tra, xiết chặt các mối ghép (kể cả phần chuyên dùng)', 'Kiểm tra, xiết chặt các mối ghép (kể cả phần chuyên dùng)', '4', '3.5', 12, NULL, 1),
(319, 0, 'Kiểm tra, xiết chặt các mối ghép (kể cả phần chuyên dùng)', 'Kiểm tra, xiết chặt các mối ghép (kể cả phần chuyên dùng)', '4', '3.5', 10, NULL, 1),
(320, 0, 'Kiểm tra, xiết chặt các mối ghép (kể cả phần chuyên dùng)', 'Kiểm tra, xiết chặt các mối ghép (kể cả phần chuyên dùng)', '4', '3.5', 8, NULL, 1),
(321, 0, 'Kiểm tra, xiết chặt các mối ghép (kể cả phần chuyên dùng)', 'Kiểm tra, xiết chặt các mối ghép (kể cả phần chuyên dùng)', '4', '0.5', 14, NULL, 1),
(322, 0, 'Kiểm tra, xiết chặt các mối ghép (kể cả phần chuyên dùng)', 'Kiểm tra, xiết chặt các mối ghép (kể cả phần chuyên dùng)', '4', '0.5', 16, NULL, 1),
(323, 0, 'Kiểm tra, xiết chặt các mối ghép (kể cả phần chuyên dùng)', 'Kiểm tra, xiết chặt các mối ghép (kể cả phần chuyên dùng)', '4', '2', 6, NULL, 1),
(324, 0, 'Kiểm tra, xiết chặt các mối ghép (kể cả phần chuyên dùng)', 'Kiểm tra, xiết chặt các mối ghép (kể cả phần chuyên dùng)', '4', '3', 4, NULL, 1),
(325, 0, 'Kiểm tra, xiết chặt các mối ghép (kể cả phần chuyên dùng)', 'Kiểm tra, xiết chặt các mối ghép (kể cả phần chuyên dùng)', '4', '3.5', 2, NULL, 1),
(326, 0, 'Vệ sinh, nghiệm thu xe, máy sau bảo dưỡng', 'Vệ sinh, nghiệm thu xe, máy sau bảo dưỡng', '4', '2', 12, NULL, 1),
(327, 0, 'Vệ sinh, nghiệm thu xe, máy sau bảo dưỡng', 'Vệ sinh, nghiệm thu xe, máy sau bảo dưỡng', '4', '2', 10, NULL, 1),
(328, 0, 'Vệ sinh, nghiệm thu xe, máy sau bảo dưỡng', 'Vệ sinh, nghiệm thu xe, máy sau bảo dưỡng', '4', '2', 8, NULL, 1),
(329, 0, 'Vệ sinh, nghiệm thu xe, máy sau bảo dưỡng', 'Vệ sinh, nghiệm thu xe, máy sau bảo dưỡng', '4', '0.33', 14, NULL, 1),
(330, 0, 'Vệ sinh, nghiệm thu xe, máy sau bảo dưỡng', 'Vệ sinh, nghiệm thu xe, máy sau bảo dưỡng', '4', '0.33', 16, NULL, 1),
(331, 0, 'Vệ sinh, nghiệm thu xe, máy sau bảo dưỡng', 'Vệ sinh, nghiệm thu xe, máy sau bảo dưỡng', '4', '1', 6, NULL, 1),
(332, 0, 'Vệ sinh, nghiệm thu xe, máy sau bảo dưỡng', 'Vệ sinh, nghiệm thu xe, máy sau bảo dưỡng', '4', '1.5', 4, NULL, 1),
(333, 0, 'Vệ sinh, nghiệm thu xe, máy sau bảo dưỡng', 'Vệ sinh, nghiệm thu xe, máy sau bảo dưỡng', '4', '2', 2, NULL, 1),
(334, NULL, '1', 'ĐỘNG CƠ', '5', NULL, NULL, NULL, 2),
(335, NULL, '2', 'PHẦN GẦM', '5', NULL, NULL, NULL, 2),
(336, NULL, '3', 'PHỤC VỤ HOÀN CHỈNH BÀN GIAO', '5', NULL, NULL, NULL, 2),
(337, NULL, '4', 'PHẦN ĐIỆN', '5', NULL, NULL, NULL, 2),
(338, NULL, '1', 'CƠ CẤU THỦY LỰC', '5', NULL, NULL, NULL, 2),
(339, NULL, '2', 'BƠM HÚT CHÂN KHÔNG', '5', NULL, NULL, NULL, 2),
(340, NULL, '3', 'TÉC BÙN', '5', NULL, NULL, NULL, 2),
(341, NULL, '4', 'BƠM NƯỚC ÁP LỰC CAO (JRX-750)', '5', NULL, NULL, NULL, 2),
(342, NULL, '5', 'TÉC NƯỚC', '5', NULL, NULL, NULL, 2),
(343, NULL, '6', 'CẨN TRỤC', '5', NULL, NULL, NULL, 2),
(344, NULL, '7', 'CƠ CẤU XÚC - ỦI', '5', NULL, NULL, NULL, 2),
(345, 334, 'Tháo lắp, xúc rửa ống dẫn, bầu lọc thô - tinh', 'Tháo lắp, xúc rửa ống dẫn, bầu lọc thô - tinh', '4', '3', 12, NULL, 2),
(346, 334, 'Tháo lắp, xúc rửa ống dẫn, bầu lọc thô - tinh', 'Tháo lắp, xúc rửa ống dẫn, bầu lọc thô - tinh', '4', '3', 10, NULL, 2),
(347, 334, 'Tháo lắp, xúc rửa ống dẫn, bầu lọc thô - tinh', 'Tháo lắp, xúc rửa ống dẫn, bầu lọc thô - tinh', '4', '3', 8, NULL, 2),
(348, 334, 'Tháo lắp, xúc rửa ống dẫn, bầu lọc thô - tinh', 'Tháo lắp, xúc rửa ống dẫn, bầu lọc thô - tinh', '4', '1', 14, NULL, 2),
(349, 334, 'Tháo lắp, xúc rửa ống dẫn, bầu lọc thô - tinh', 'Tháo lắp, xúc rửa ống dẫn, bầu lọc thô - tinh', '4', '1', 16, NULL, 2),
(350, 334, 'Tháo lắp, xúc rửa ống dẫn, bầu lọc thô - tinh', 'Tháo lắp, xúc rửa ống dẫn, bầu lọc thô - tinh', '4', '1.5', 6, NULL, 2),
(351, 334, 'Tháo lắp, xúc rửa ống dẫn, bầu lọc thô - tinh', 'Tháo lắp, xúc rửa ống dẫn, bầu lọc thô - tinh', '4', '2.5', 4, NULL, 2),
(352, 334, 'Tháo lắp, xúc rửa ống dẫn, bầu lọc thô - tinh', 'Tháo lắp, xúc rửa ống dẫn, bầu lọc thô - tinh', '4', '2.5', 2, NULL, 2),
(353, 334, 'Điều chỉnh độ nhạy chân ga', 'Điều chỉnh độ nhạy chân ga', '5', '0.5', 12, NULL, 2),
(354, 334, 'Điều chỉnh độ nhạy chân ga', 'Điều chỉnh độ nhạy chân ga', '5', '0.5', 10, NULL, 2),
(355, 334, 'Điều chỉnh độ nhạy chân ga', 'Điều chỉnh độ nhạy chân ga', '5', '0.5', 8, NULL, 2),
(356, 334, 'Điều chỉnh độ nhạy chân ga', 'Điều chỉnh độ nhạy chân ga', '5', '0', 14, NULL, 2),
(357, 334, 'Điều chỉnh độ nhạy chân ga', 'Điều chỉnh độ nhạy chân ga', '5', '0', 16, NULL, 2),
(358, 334, 'Điều chỉnh độ nhạy chân ga', 'Điều chỉnh độ nhạy chân ga', '5', '0.5', 6, NULL, 2),
(359, 334, 'Điều chỉnh độ nhạy chân ga', 'Điều chỉnh độ nhạy chân ga', '5', '0.5', 4, NULL, 2),
(360, 334, 'Điều chỉnh độ nhạy chân ga', 'Điều chỉnh độ nhạy chân ga', '5', '0.5', 2, NULL, 2),
(361, 334, 'Kiểm tra, bảo dưỡng bơm thấp áp (bơm tay)', 'Kiểm tra, bảo dưỡng bơm thấp áp (bơm tay)', '5', '1.5', 12, NULL, 2),
(362, 334, 'Kiểm tra, bảo dưỡng bơm thấp áp (bơm tay)', 'Kiểm tra, bảo dưỡng bơm thấp áp (bơm tay)', '5', '2', 10, NULL, 2),
(363, 334, 'Kiểm tra, bảo dưỡng bơm thấp áp (bơm tay)', 'Kiểm tra, bảo dưỡng bơm thấp áp (bơm tay)', '5', '2', 8, NULL, 2),
(364, 334, 'Kiểm tra, bảo dưỡng bơm thấp áp (bơm tay)', 'Kiểm tra, bảo dưỡng bơm thấp áp (bơm tay)', '5', '1', 14, NULL, 2),
(365, 334, 'Kiểm tra, bảo dưỡng bơm thấp áp (bơm tay)', 'Kiểm tra, bảo dưỡng bơm thấp áp (bơm tay)', '5', '1', 16, NULL, 2),
(366, 334, 'Kiểm tra, bảo dưỡng bơm thấp áp (bơm tay)', 'Kiểm tra, bảo dưỡng bơm thấp áp (bơm tay)', '5', '1', 6, NULL, 2),
(367, 334, 'Kiểm tra, bảo dưỡng bơm thấp áp (bơm tay)', 'Kiểm tra, bảo dưỡng bơm thấp áp (bơm tay)', '5', '1.5', 4, NULL, 2),
(368, 334, 'Kiểm tra, bảo dưỡng bơm thấp áp (bơm tay)', 'Kiểm tra, bảo dưỡng bơm thấp áp (bơm tay)', '5', '1.5', 2, NULL, 2),
(369, 334, 'Tháo lắp, kiểm tra và căn chỉnh kim phun', 'Tháo lắp, kiểm tra và căn chỉnh kim phun', '5', '4', 12, NULL, 2),
(370, 334, 'Tháo lắp, kiểm tra và căn chỉnh kim phun', 'Tháo lắp, kiểm tra và căn chỉnh kim phun', '5', '6', 10, NULL, 2),
(371, 334, 'Tháo lắp, kiểm tra và căn chỉnh kim phun', 'Tháo lắp, kiểm tra và căn chỉnh kim phun', '5', '6', 8, NULL, 2),
(372, 334, 'Tháo lắp, kiểm tra và căn chỉnh kim phun', 'Tháo lắp, kiểm tra và căn chỉnh kim phun', '5', '4', 14, NULL, 2),
(373, 334, 'Tháo lắp, kiểm tra và căn chỉnh kim phun', 'Tháo lắp, kiểm tra và căn chỉnh kim phun', '5', '4', 16, NULL, 2),
(374, 334, 'Tháo lắp, kiểm tra và căn chỉnh kim phun', 'Tháo lắp, kiểm tra và căn chỉnh kim phun', '5', '4', 6, NULL, 2),
(375, 334, 'Tháo lắp, kiểm tra và căn chỉnh kim phun', 'Tháo lắp, kiểm tra và căn chỉnh kim phun', '5', '6', 4, NULL, 2),
(376, 334, 'Tháo lắp, kiểm tra và căn chỉnh kim phun', 'Tháo lắp, kiểm tra và căn chỉnh kim phun', '5', '6', 2, NULL, 2),
(377, 334, 'Tháo lắp, xúc rửa thùng nhiên liệu', 'Tháo lắp, xúc rửa thùng nhiên liệu', '4', '4', 12, NULL, 2),
(378, 334, 'Tháo lắp, xúc rửa thùng nhiên liệu', 'Tháo lắp, xúc rửa thùng nhiên liệu', '4', '4', 10, NULL, 2),
(379, 334, 'Tháo lắp, xúc rửa thùng nhiên liệu', 'Tháo lắp, xúc rửa thùng nhiên liệu', '4', '4', 8, NULL, 2),
(380, 334, 'Tháo lắp, xúc rửa thùng nhiên liệu', 'Tháo lắp, xúc rửa thùng nhiên liệu', '4', '2', 14, NULL, 2),
(381, 334, 'Tháo lắp, xúc rửa thùng nhiên liệu', 'Tháo lắp, xúc rửa thùng nhiên liệu', '4', '2', 16, NULL, 2),
(382, 334, 'Tháo lắp, xúc rửa thùng nhiên liệu', 'Tháo lắp, xúc rửa thùng nhiên liệu', '4', '2.5', 6, NULL, 2),
(383, 334, 'Tháo lắp, xúc rửa thùng nhiên liệu', 'Tháo lắp, xúc rửa thùng nhiên liệu', '4', '3', 4, NULL, 2),
(384, 334, 'Tháo lắp, xúc rửa thùng nhiên liệu', 'Tháo lắp, xúc rửa thùng nhiên liệu', '4', '4', 2, NULL, 2),
(385, 334, 'Xúc rửa bầu lọc dầu. Thay mới theo chu kỳ', 'Xúc rửa bầu lọc dầu. Thay mới theo chu kỳ', '4', '4', 12, NULL, 2),
(386, 334, 'Xúc rửa bầu lọc dầu. Thay mới theo chu kỳ', 'Xúc rửa bầu lọc dầu. Thay mới theo chu kỳ', '4', '4', 10, NULL, 2),
(387, 334, 'Xúc rửa bầu lọc dầu. Thay mới theo chu kỳ', 'Xúc rửa bầu lọc dầu. Thay mới theo chu kỳ', '4', '4', 8, NULL, 2),
(388, 334, 'Xúc rửa bầu lọc dầu. Thay mới theo chu kỳ', 'Xúc rửa bầu lọc dầu. Thay mới theo chu kỳ', '4', '2', 14, NULL, 2),
(389, 334, 'Xúc rửa bầu lọc dầu. Thay mới theo chu kỳ', 'Xúc rửa bầu lọc dầu. Thay mới theo chu kỳ', '4', '2', 16, NULL, 2),
(390, 334, 'Xúc rửa bầu lọc dầu. Thay mới theo chu kỳ', 'Xúc rửa bầu lọc dầu. Thay mới theo chu kỳ', '4', '3', 6, NULL, 2),
(391, 334, 'Xúc rửa bầu lọc dầu. Thay mới theo chu kỳ', 'Xúc rửa bầu lọc dầu. Thay mới theo chu kỳ', '4', '4', 4, NULL, 2),
(392, 334, 'Xúc rửa bầu lọc dầu. Thay mới theo chu kỳ', 'Xúc rửa bầu lọc dầu. Thay mới theo chu kỳ', '4', '4', 2, NULL, 2),
(393, 334, 'Thông rửa các đường ống dầu bôi trơn', 'Thông rửa các đường ống dầu bôi trơn', '5', '1', 12, NULL, 2),
(394, 334, 'Thông rửa các đường ống dầu bôi trơn', 'Thông rửa các đường ống dầu bôi trơn', '5', '1', 10, NULL, 2),
(395, 334, 'Thông rửa các đường ống dầu bôi trơn', 'Thông rửa các đường ống dầu bôi trơn', '5', '1', 8, NULL, 2),
(396, 334, 'Thông rửa các đường ống dầu bôi trơn', 'Thông rửa các đường ống dầu bôi trơn', '5', '1', 14, NULL, 2),
(397, 334, 'Thông rửa các đường ống dầu bôi trơn', 'Thông rửa các đường ống dầu bôi trơn', '5', '1', 16, NULL, 2),
(398, 334, 'Thông rửa các đường ống dầu bôi trơn', 'Thông rửa các đường ống dầu bôi trơn', '5', '0.5', 6, NULL, 2),
(399, 334, 'Thông rửa các đường ống dầu bôi trơn', 'Thông rửa các đường ống dầu bôi trơn', '5', '1', 4, NULL, 2),
(400, 334, 'Thông rửa các đường ống dầu bôi trơn', 'Thông rửa các đường ống dầu bôi trơn', '5', '1', 2, NULL, 2),
(401, 334, 'Kiểm tra bảo dưỡng bơm dầu bôi trơn', 'Kiểm tra bảo dưỡng bơm dầu bôi trơn', '4', '3.5', 12, NULL, 2),
(402, 334, 'Kiểm tra bảo dưỡng bơm dầu bôi trơn', 'Kiểm tra bảo dưỡng bơm dầu bôi trơn', '4', '3.5', 10, NULL, 2),
(403, 334, 'Kiểm tra bảo dưỡng bơm dầu bôi trơn', 'Kiểm tra bảo dưỡng bơm dầu bôi trơn', '4', '3.5', 8, NULL, 2),
(404, 334, 'Kiểm tra bảo dưỡng bơm dầu bôi trơn', 'Kiểm tra bảo dưỡng bơm dầu bôi trơn', '4', '0.5', 14, NULL, 2),
(405, 334, 'Kiểm tra bảo dưỡng bơm dầu bôi trơn', 'Kiểm tra bảo dưỡng bơm dầu bôi trơn', '4', '0.5', 16, NULL, 2),
(406, 334, 'Kiểm tra bảo dưỡng bơm dầu bôi trơn', 'Kiểm tra bảo dưỡng bơm dầu bôi trơn', '4', '1', 6, NULL, 2),
(407, 334, 'Kiểm tra bảo dưỡng bơm dầu bôi trơn', 'Kiểm tra bảo dưỡng bơm dầu bôi trơn', '4', '2.5', 4, NULL, 2),
(408, 334, 'Kiểm tra bảo dưỡng bơm dầu bôi trơn', 'Kiểm tra bảo dưỡng bơm dầu bôi trơn', '4', '3.5', 2, NULL, 2),
(409, 334, 'Thay dầu mới (theo định kỳ)', 'Thay dầu mới (theo định kỳ)', '4', '1.5', 12, NULL, 2),
(410, 334, 'Thay dầu mới (theo định kỳ)', 'Thay dầu mới (theo định kỳ)', '4', '1.5', 10, NULL, 2),
(411, 334, 'Thay dầu mới (theo định kỳ)', 'Thay dầu mới (theo định kỳ)', '4', '1.5', 8, NULL, 2),
(412, 334, 'Thay dầu mới (theo định kỳ)', 'Thay dầu mới (theo định kỳ)', '4', '0.5', 14, NULL, 2),
(413, 334, 'Thay dầu mới (theo định kỳ)', 'Thay dầu mới (theo định kỳ)', '4', '0.5', 16, NULL, 2),
(414, 334, 'Thay dầu mới (theo định kỳ)', 'Thay dầu mới (theo định kỳ)', '4', '0.5', 6, NULL, 2),
(415, 334, 'Thay dầu mới (theo định kỳ)', 'Thay dầu mới (theo định kỳ)', '4', '1', 4, NULL, 2),
(416, 334, 'Thay dầu mới (theo định kỳ)', 'Thay dầu mới (theo định kỳ)', '4', '1.5', 2, NULL, 2),
(417, 334, 'Kiểm tra tình trạng và sự rò rỉ của két nước, hệ thống làm mát. Kiểm tra tác dụng của van hằng nhiệt, quạt gió', 'Kiểm tra tình trạng và sự rò rỉ của két nước, hệ thống làm mát. Kiểm tra tác dụng của van hằng nhiệt, quạt gió', '4', '1', 12, NULL, 2),
(418, 334, 'Kiểm tra tình trạng và sự rò rỉ của két nước, hệ thống làm mát. Kiểm tra tác dụng của van hằng nhiệt, quạt gió', 'Kiểm tra tình trạng và sự rò rỉ của két nước, hệ thống làm mát. Kiểm tra tác dụng của van hằng nhiệt, quạt gió', '4', '1', 10, NULL, 2),
(419, 334, 'Kiểm tra tình trạng và sự rò rỉ của két nước, hệ thống làm mát. Kiểm tra tác dụng của van hằng nhiệt, quạt gió', 'Kiểm tra tình trạng và sự rò rỉ của két nước, hệ thống làm mát. Kiểm tra tác dụng của van hằng nhiệt, quạt gió', '4', '1', 8, NULL, 2),
(420, 334, 'Kiểm tra tình trạng và sự rò rỉ của két nước, hệ thống làm mát. Kiểm tra tác dụng của van hằng nhiệt, quạt gió', 'Kiểm tra tình trạng và sự rò rỉ của két nước, hệ thống làm mát. Kiểm tra tác dụng của van hằng nhiệt, quạt gió', '4', '0.5', 14, NULL, 2),
(421, 334, 'Kiểm tra tình trạng và sự rò rỉ của két nước, hệ thống làm mát. Kiểm tra tác dụng của van hằng nhiệt, quạt gió', 'Kiểm tra tình trạng và sự rò rỉ của két nước, hệ thống làm mát. Kiểm tra tác dụng của van hằng nhiệt, quạt gió', '4', '0.5', 16, NULL, 2),
(422, 334, 'Kiểm tra tình trạng và sự rò rỉ của két nước, hệ thống làm mát. Kiểm tra tác dụng của van hằng nhiệt, quạt gió', 'Kiểm tra tình trạng và sự rò rỉ của két nước, hệ thống làm mát. Kiểm tra tác dụng của van hằng nhiệt, quạt gió', '4', '0.5', 6, NULL, 2),
(423, 334, 'Kiểm tra tình trạng và sự rò rỉ của két nước, hệ thống làm mát. Kiểm tra tác dụng của van hằng nhiệt, quạt gió', 'Kiểm tra tình trạng và sự rò rỉ của két nước, hệ thống làm mát. Kiểm tra tác dụng của van hằng nhiệt, quạt gió', '4', '1', 4, NULL, 2),
(424, 334, 'Kiểm tra tình trạng và sự rò rỉ của két nước, hệ thống làm mát. Kiểm tra tác dụng của van hằng nhiệt, quạt gió', 'Kiểm tra tình trạng và sự rò rỉ của két nước, hệ thống làm mát. Kiểm tra tác dụng của van hằng nhiệt, quạt gió', '4', '1', 2, NULL, 2),
(425, 334, 'Xúc rửa hệ thống làm mát sau 2 lần BD II', 'Xúc rửa hệ thống làm mát sau 2 lần BD II', '4', '3', 12, NULL, 2),
(426, 334, 'Xúc rửa hệ thống làm mát sau 2 lần BD II', 'Xúc rửa hệ thống làm mát sau 2 lần BD II', '4', '3', 10, NULL, 2),
(427, 334, 'Xúc rửa hệ thống làm mát sau 2 lần BD II', 'Xúc rửa hệ thống làm mát sau 2 lần BD II', '4', '3', 8, NULL, 2),
(428, 334, 'Xúc rửa hệ thống làm mát sau 2 lần BD II', 'Xúc rửa hệ thống làm mát sau 2 lần BD II', '4', '2', 14, NULL, 2),
(429, 334, 'Xúc rửa hệ thống làm mát sau 2 lần BD II', 'Xúc rửa hệ thống làm mát sau 2 lần BD II', '4', '2', 16, NULL, 2),
(430, 334, 'Xúc rửa hệ thống làm mát sau 2 lần BD II', 'Xúc rửa hệ thống làm mát sau 2 lần BD II', '4', '2', 6, NULL, 2),
(431, 334, 'Xúc rửa hệ thống làm mát sau 2 lần BD II', 'Xúc rửa hệ thống làm mát sau 2 lần BD II', '4', '3', 4, NULL, 2),
(432, 334, 'Xúc rửa hệ thống làm mát sau 2 lần BD II', 'Xúc rửa hệ thống làm mát sau 2 lần BD II', '4', '4', 2, NULL, 2),
(433, 334, 'Kiểm tra siết chặt các giá đỡ két nước, các mối nối', 'Kiểm tra siết chặt các giá đỡ két nước, các mối nối', '4', '1', 12, NULL, 2),
(434, 334, 'Kiểm tra siết chặt các giá đỡ két nước, các mối nối', 'Kiểm tra siết chặt các giá đỡ két nước, các mối nối', '4', '1', 10, NULL, 2),
(435, 334, 'Kiểm tra siết chặt các giá đỡ két nước, các mối nối', 'Kiểm tra siết chặt các giá đỡ két nước, các mối nối', '4', '1', 8, NULL, 2),
(436, 334, 'Kiểm tra siết chặt các giá đỡ két nước, các mối nối', 'Kiểm tra siết chặt các giá đỡ két nước, các mối nối', '4', '0.5', 14, NULL, 2),
(437, 334, 'Kiểm tra siết chặt các giá đỡ két nước, các mối nối', 'Kiểm tra siết chặt các giá đỡ két nước, các mối nối', '4', '0.5', 16, NULL, 2),
(438, 334, 'Kiểm tra siết chặt các giá đỡ két nước, các mối nối', 'Kiểm tra siết chặt các giá đỡ két nước, các mối nối', '4', '0.5', 6, NULL, 2),
(439, 334, 'Kiểm tra siết chặt các giá đỡ két nước, các mối nối', 'Kiểm tra siết chặt các giá đỡ két nước, các mối nối', '4', '1', 4, NULL, 2),
(440, 334, 'Kiểm tra siết chặt các giá đỡ két nước, các mối nối', 'Kiểm tra siết chặt các giá đỡ két nước, các mối nối', '4', '1.5', 2, NULL, 2),
(441, 334, 'Kiểm tra độ rơ trục bơm nước, quạt gió', 'Kiểm tra độ rơ trục bơm nước, quạt gió', '4', '1', 12, NULL, 2),
(442, 334, 'Kiểm tra độ rơ trục bơm nước, quạt gió', 'Kiểm tra độ rơ trục bơm nước, quạt gió', '4', '1', 10, NULL, 2),
(443, 334, 'Kiểm tra độ rơ trục bơm nước, quạt gió', 'Kiểm tra độ rơ trục bơm nước, quạt gió', '4', '1', 8, NULL, 2),
(444, 334, 'Kiểm tra độ rơ trục bơm nước, quạt gió', 'Kiểm tra độ rơ trục bơm nước, quạt gió', '4', '0.5', 14, NULL, 2),
(445, 334, 'Kiểm tra độ rơ trục bơm nước, quạt gió', 'Kiểm tra độ rơ trục bơm nước, quạt gió', '4', '0.5', 16, NULL, 2),
(446, 334, 'Kiểm tra độ rơ trục bơm nước, quạt gió', 'Kiểm tra độ rơ trục bơm nước, quạt gió', '4', '0.5', 6, NULL, 2),
(447, 334, 'Kiểm tra độ rơ trục bơm nước, quạt gió', 'Kiểm tra độ rơ trục bơm nước, quạt gió', '4', '1', 4, NULL, 2),
(448, 334, 'Kiểm tra độ rơ trục bơm nước, quạt gió', 'Kiểm tra độ rơ trục bơm nước, quạt gió', '4', '1.5', 2, NULL, 2),
(449, 334, 'Kiểm tra tình trạng của bánh đai truyền, dây đai truyền. Điều chỉnh độ căng dây đai', 'Kiểm tra tình trạng của bánh đai truyền, dây đai truyền. Điều chỉnh độ căng dây đai', '4', '2', 12, NULL, 2),
(450, 334, 'Kiểm tra tình trạng của bánh đai truyền, dây đai truyền. Điều chỉnh độ căng dây đai', 'Kiểm tra tình trạng của bánh đai truyền, dây đai truyền. Điều chỉnh độ căng dây đai', '4', '2', 10, NULL, 2),
(451, 334, 'Kiểm tra tình trạng của bánh đai truyền, dây đai truyền. Điều chỉnh độ căng dây đai', 'Kiểm tra tình trạng của bánh đai truyền, dây đai truyền. Điều chỉnh độ căng dây đai', '4', '2', 8, NULL, 2),
(452, 334, 'Kiểm tra tình trạng của bánh đai truyền, dây đai truyền. Điều chỉnh độ căng dây đai', 'Kiểm tra tình trạng của bánh đai truyền, dây đai truyền. Điều chỉnh độ căng dây đai', '4', '1.5', 14, NULL, 2),
(453, 334, 'Kiểm tra tình trạng của bánh đai truyền, dây đai truyền. Điều chỉnh độ căng dây đai', 'Kiểm tra tình trạng của bánh đai truyền, dây đai truyền. Điều chỉnh độ căng dây đai', '4', '1.5', 16, NULL, 2),
(454, 334, 'Kiểm tra tình trạng của bánh đai truyền, dây đai truyền. Điều chỉnh độ căng dây đai', 'Kiểm tra tình trạng của bánh đai truyền, dây đai truyền. Điều chỉnh độ căng dây đai', '4', '1.5', 6, NULL, 2),
(455, 334, 'Kiểm tra tình trạng của bánh đai truyền, dây đai truyền. Điều chỉnh độ căng dây đai', 'Kiểm tra tình trạng của bánh đai truyền, dây đai truyền. Điều chỉnh độ căng dây đai', '4', '2', 4, NULL, 2),
(456, 334, 'Kiểm tra tình trạng của bánh đai truyền, dây đai truyền. Điều chỉnh độ căng dây đai', 'Kiểm tra tình trạng của bánh đai truyền, dây đai truyền. Điều chỉnh độ căng dây đai', '4', '2', 2, NULL, 2),
(457, 334, 'Tháo lắp bảo dưỡng máy nén khí/ máy hút CK', 'Tháo lắp bảo dưỡng máy nén khí/ máy hút CK', '5', '7', 12, NULL, 2),
(458, 334, 'Tháo lắp bảo dưỡng máy nén khí/ máy hút CK', 'Tháo lắp bảo dưỡng máy nén khí/ máy hút CK', '5', '0', 10, NULL, 2),
(459, 334, 'Tháo lắp bảo dưỡng máy nén khí/ máy hút CK', 'Tháo lắp bảo dưỡng máy nén khí/ máy hút CK', '5', '0', 8, NULL, 2),
(460, 334, 'Tháo lắp bảo dưỡng máy nén khí/ máy hút CK', 'Tháo lắp bảo dưỡng máy nén khí/ máy hút CK', '5', '0', 14, NULL, 2),
(461, 334, 'Tháo lắp bảo dưỡng máy nén khí/ máy hút CK', 'Tháo lắp bảo dưỡng máy nén khí/ máy hút CK', '5', '0', 16, NULL, 2),
(462, 334, 'Tháo lắp bảo dưỡng máy nén khí/ máy hút CK', 'Tháo lắp bảo dưỡng máy nén khí/ máy hút CK', '5', '0', 6, NULL, 2),
(463, 334, 'Tháo lắp bảo dưỡng máy nén khí/ máy hút CK', 'Tháo lắp bảo dưỡng máy nén khí/ máy hút CK', '5', '7', 4, NULL, 2),
(464, 334, 'Tháo lắp bảo dưỡng máy nén khí/ máy hút CK', 'Tháo lắp bảo dưỡng máy nén khí/ máy hút CK', '5', '7.5', 2, NULL, 2),
(465, 334, 'Kiểm tra bảo dưỡng các van điều chỉnh áp suất, van CK, cụm phân phối hơi', 'Kiểm tra bảo dưỡng các van điều chỉnh áp suất, van CK, cụm phân phối hơi', '5', '3', 12, NULL, 2),
(466, 334, 'Kiểm tra bảo dưỡng các van điều chỉnh áp suất, van CK, cụm phân phối hơi', 'Kiểm tra bảo dưỡng các van điều chỉnh áp suất, van CK, cụm phân phối hơi', '5', '0', 10, NULL, 2),
(467, 334, 'Kiểm tra bảo dưỡng các van điều chỉnh áp suất, van CK, cụm phân phối hơi', 'Kiểm tra bảo dưỡng các van điều chỉnh áp suất, van CK, cụm phân phối hơi', '5', '0', 8, NULL, 2),
(468, 334, 'Kiểm tra bảo dưỡng các van điều chỉnh áp suất, van CK, cụm phân phối hơi', 'Kiểm tra bảo dưỡng các van điều chỉnh áp suất, van CK, cụm phân phối hơi', '5', '0', 14, NULL, 2),
(469, 334, 'Kiểm tra bảo dưỡng các van điều chỉnh áp suất, van CK, cụm phân phối hơi', 'Kiểm tra bảo dưỡng các van điều chỉnh áp suất, van CK, cụm phân phối hơi', '5', '0', 16, NULL, 2),
(470, 334, 'Kiểm tra bảo dưỡng các van điều chỉnh áp suất, van CK, cụm phân phối hơi', 'Kiểm tra bảo dưỡng các van điều chỉnh áp suất, van CK, cụm phân phối hơi', '5', '0', 6, NULL, 2),
(471, 334, 'Kiểm tra bảo dưỡng các van điều chỉnh áp suất, van CK, cụm phân phối hơi', 'Kiểm tra bảo dưỡng các van điều chỉnh áp suất, van CK, cụm phân phối hơi', '5', '3', 4, NULL, 2);
INSERT INTO `c_repair_labor` (`C_REPAIR_LABOR_ID`, `PARENT_ID`, `CODE`, `NAME`, `LEVEL_LABOR`, `QUOTA`, `C_REPAIR_TYPE_ID`, `DECREASE_RATE`, `MAINTAIN_TYPE`) VALUES
(472, 334, 'Kiểm tra bảo dưỡng các van điều chỉnh áp suất, van CK, cụm phân phối hơi', 'Kiểm tra bảo dưỡng các van điều chỉnh áp suất, van CK, cụm phân phối hơi', '5', '4', 2, NULL, 2),
(473, 334, 'Thông rửa đường ống dẫn hơi, phục hồi hoặc thay mới các ống dẫn bị bẹp, bình chứa hơi, bình CK', 'Thông rửa đường ống dẫn hơi, phục hồi hoặc thay mới các ống dẫn bị bẹp, bình chứa hơi, bình CK', '4', '3', 12, NULL, 2),
(474, 334, 'Thông rửa đường ống dẫn hơi, phục hồi hoặc thay mới các ống dẫn bị bẹp, bình chứa hơi, bình CK', 'Thông rửa đường ống dẫn hơi, phục hồi hoặc thay mới các ống dẫn bị bẹp, bình chứa hơi, bình CK', '4', '0', 10, NULL, 2),
(475, 334, 'Thông rửa đường ống dẫn hơi, phục hồi hoặc thay mới các ống dẫn bị bẹp, bình chứa hơi, bình CK', 'Thông rửa đường ống dẫn hơi, phục hồi hoặc thay mới các ống dẫn bị bẹp, bình chứa hơi, bình CK', '4', '0', 8, NULL, 2),
(476, 334, 'Thông rửa đường ống dẫn hơi, phục hồi hoặc thay mới các ống dẫn bị bẹp, bình chứa hơi, bình CK', 'Thông rửa đường ống dẫn hơi, phục hồi hoặc thay mới các ống dẫn bị bẹp, bình chứa hơi, bình CK', '4', '0', 14, NULL, 2),
(477, 334, 'Thông rửa đường ống dẫn hơi, phục hồi hoặc thay mới các ống dẫn bị bẹp, bình chứa hơi, bình CK', 'Thông rửa đường ống dẫn hơi, phục hồi hoặc thay mới các ống dẫn bị bẹp, bình chứa hơi, bình CK', '4', '0', 16, NULL, 2),
(478, 334, 'Thông rửa đường ống dẫn hơi, phục hồi hoặc thay mới các ống dẫn bị bẹp, bình chứa hơi, bình CK', 'Thông rửa đường ống dẫn hơi, phục hồi hoặc thay mới các ống dẫn bị bẹp, bình chứa hơi, bình CK', '4', '0', 6, NULL, 2),
(479, 334, 'Thông rửa đường ống dẫn hơi, phục hồi hoặc thay mới các ống dẫn bị bẹp, bình chứa hơi, bình CK', 'Thông rửa đường ống dẫn hơi, phục hồi hoặc thay mới các ống dẫn bị bẹp, bình chứa hơi, bình CK', '4', '3', 4, NULL, 2),
(480, 334, 'Thông rửa đường ống dẫn hơi, phục hồi hoặc thay mới các ống dẫn bị bẹp, bình chứa hơi, bình CK', 'Thông rửa đường ống dẫn hơi, phục hồi hoặc thay mới các ống dẫn bị bẹp, bình chứa hơi, bình CK', '4', '3.5', 2, NULL, 2),
(481, 334, 'Tháo lắp, vệ sinh nắp đậy giàn cò', 'Tháo lắp, vệ sinh nắp đậy giàn cò', '5', '2', 12, NULL, 2),
(482, 334, 'Tháo lắp, vệ sinh nắp đậy giàn cò', 'Tháo lắp, vệ sinh nắp đậy giàn cò', '5', '2', 10, NULL, 2),
(483, 334, 'Tháo lắp, vệ sinh nắp đậy giàn cò', 'Tháo lắp, vệ sinh nắp đậy giàn cò', '5', '2', 8, NULL, 2),
(484, 334, 'Tháo lắp, vệ sinh nắp đậy giàn cò', 'Tháo lắp, vệ sinh nắp đậy giàn cò', '5', '1.5', 14, NULL, 2),
(485, 334, 'Tháo lắp, vệ sinh nắp đậy giàn cò', 'Tháo lắp, vệ sinh nắp đậy giàn cò', '5', '1.5', 16, NULL, 2),
(486, 334, 'Tháo lắp, vệ sinh nắp đậy giàn cò', 'Tháo lắp, vệ sinh nắp đậy giàn cò', '5', '1.5', 6, NULL, 2),
(487, 334, 'Tháo lắp, vệ sinh nắp đậy giàn cò', 'Tháo lắp, vệ sinh nắp đậy giàn cò', '5', '1.5', 4, NULL, 2),
(488, 334, 'Tháo lắp, vệ sinh nắp đậy giàn cò', 'Tháo lắp, vệ sinh nắp đậy giàn cò', '5', '2', 2, NULL, 2),
(489, 334, 'Kiểm tra, siết chặt toàn bộ bu lông mặt qui lát bằng cờ lê lực', 'Kiểm tra, siết chặt toàn bộ bu lông mặt qui lát bằng cờ lê lực', '5', '8', 12, NULL, 2),
(490, 334, 'Kiểm tra, siết chặt toàn bộ bu lông mặt qui lát bằng cờ lê lực', 'Kiểm tra, siết chặt toàn bộ bu lông mặt qui lát bằng cờ lê lực', '5', '8', 10, NULL, 2),
(491, 334, 'Kiểm tra, siết chặt toàn bộ bu lông mặt qui lát bằng cờ lê lực', 'Kiểm tra, siết chặt toàn bộ bu lông mặt qui lát bằng cờ lê lực', '5', '8', 8, NULL, 2),
(492, 334, 'Kiểm tra, siết chặt toàn bộ bu lông mặt qui lát bằng cờ lê lực', 'Kiểm tra, siết chặt toàn bộ bu lông mặt qui lát bằng cờ lê lực', '5', '5', 14, NULL, 2),
(493, 334, 'Kiểm tra, siết chặt toàn bộ bu lông mặt qui lát bằng cờ lê lực', 'Kiểm tra, siết chặt toàn bộ bu lông mặt qui lát bằng cờ lê lực', '5', '5', 16, NULL, 2),
(494, 334, 'Kiểm tra, siết chặt toàn bộ bu lông mặt qui lát bằng cờ lê lực', 'Kiểm tra, siết chặt toàn bộ bu lông mặt qui lát bằng cờ lê lực', '5', '5', 6, NULL, 2),
(495, 334, 'Kiểm tra, siết chặt toàn bộ bu lông mặt qui lát bằng cờ lê lực', 'Kiểm tra, siết chặt toàn bộ bu lông mặt qui lát bằng cờ lê lực', '5', '7', 4, NULL, 2),
(496, 334, 'Kiểm tra, siết chặt toàn bộ bu lông mặt qui lát bằng cờ lê lực', 'Kiểm tra, siết chặt toàn bộ bu lông mặt qui lát bằng cờ lê lực', '5', '8', 2, NULL, 2),
(497, 334, 'Vệ sinh supap, lò xo', 'Vệ sinh supap, lò xo', '5', '4', 12, NULL, 2),
(498, 334, 'Vệ sinh supap, lò xo', 'Vệ sinh supap, lò xo', '5', '4', 10, NULL, 2),
(499, 334, 'Vệ sinh supap, lò xo', 'Vệ sinh supap, lò xo', '5', '4', 8, NULL, 2),
(500, 334, 'Vệ sinh supap, lò xo', 'Vệ sinh supap, lò xo', '5', '2.5', 14, NULL, 2),
(501, 334, 'Vệ sinh supap, lò xo', 'Vệ sinh supap, lò xo', '5', '2.5', 16, NULL, 2),
(502, 334, 'Vệ sinh supap, lò xo', 'Vệ sinh supap, lò xo', '5', '2.5', 6, NULL, 2),
(503, 334, 'Vệ sinh supap, lò xo', 'Vệ sinh supap, lò xo', '5', '3', 4, NULL, 2),
(504, 334, 'Vệ sinh supap, lò xo', 'Vệ sinh supap, lò xo', '5', '4', 2, NULL, 2),
(505, 334, 'Kiểm tra, căn chỉnh khe hở nhiệt', 'Kiểm tra, căn chỉnh khe hở nhiệt', '5', '4', 12, NULL, 2),
(506, 334, 'Kiểm tra, căn chỉnh khe hở nhiệt', 'Kiểm tra, căn chỉnh khe hở nhiệt', '5', '4', 10, NULL, 2),
(507, 334, 'Kiểm tra, căn chỉnh khe hở nhiệt', 'Kiểm tra, căn chỉnh khe hở nhiệt', '5', '4', 8, NULL, 2),
(508, 334, 'Kiểm tra, căn chỉnh khe hở nhiệt', 'Kiểm tra, căn chỉnh khe hở nhiệt', '5', '2.5', 14, NULL, 2),
(509, 334, 'Kiểm tra, căn chỉnh khe hở nhiệt', 'Kiểm tra, căn chỉnh khe hở nhiệt', '5', '2.5', 16, NULL, 2),
(510, 334, 'Kiểm tra, căn chỉnh khe hở nhiệt', 'Kiểm tra, căn chỉnh khe hở nhiệt', '5', '2.5', 6, NULL, 2),
(511, 334, 'Kiểm tra, căn chỉnh khe hở nhiệt', 'Kiểm tra, căn chỉnh khe hở nhiệt', '5', '3', 4, NULL, 2),
(512, 334, 'Kiểm tra, căn chỉnh khe hở nhiệt', 'Kiểm tra, căn chỉnh khe hở nhiệt', '5', '4', 2, NULL, 2),
(513, 334, 'Kiểm tra, vệ sinh cụm hút xả', 'Kiểm tra, vệ sinh cụm hút xả', '4', '8', 12, NULL, 2),
(514, 334, 'Kiểm tra, vệ sinh cụm hút xả', 'Kiểm tra, vệ sinh cụm hút xả', '4', '8', 10, NULL, 2),
(515, 334, 'Kiểm tra, vệ sinh cụm hút xả', 'Kiểm tra, vệ sinh cụm hút xả', '4', '8', 8, NULL, 2),
(516, 334, 'Kiểm tra, vệ sinh cụm hút xả', 'Kiểm tra, vệ sinh cụm hút xả', '4', '5', 14, NULL, 2),
(517, 334, 'Kiểm tra, vệ sinh cụm hút xả', 'Kiểm tra, vệ sinh cụm hút xả', '4', '5', 16, NULL, 2),
(518, 334, 'Kiểm tra, vệ sinh cụm hút xả', 'Kiểm tra, vệ sinh cụm hút xả', '4', '5', 6, NULL, 2),
(519, 334, 'Kiểm tra, vệ sinh cụm hút xả', 'Kiểm tra, vệ sinh cụm hút xả', '4', '7', 4, NULL, 2),
(520, 334, 'Kiểm tra, vệ sinh cụm hút xả', 'Kiểm tra, vệ sinh cụm hút xả', '4', '8', 2, NULL, 2),
(521, 334, 'Tháo vệ sinh bầu lọc gió, thay mới theo chu kỳ', 'Tháo vệ sinh bầu lọc gió, thay mới theo chu kỳ', '4', '0.5', 12, NULL, 2),
(522, 334, 'Tháo vệ sinh bầu lọc gió, thay mới theo chu kỳ', 'Tháo vệ sinh bầu lọc gió, thay mới theo chu kỳ', '4', '0.5', 10, NULL, 2),
(523, 334, 'Tháo vệ sinh bầu lọc gió, thay mới theo chu kỳ', 'Tháo vệ sinh bầu lọc gió, thay mới theo chu kỳ', '4', '0.5', 8, NULL, 2),
(524, 334, 'Tháo vệ sinh bầu lọc gió, thay mới theo chu kỳ', 'Tháo vệ sinh bầu lọc gió, thay mới theo chu kỳ', '4', '0.5', 14, NULL, 2),
(525, 334, 'Tháo vệ sinh bầu lọc gió, thay mới theo chu kỳ', 'Tháo vệ sinh bầu lọc gió, thay mới theo chu kỳ', '4', '0.5', 16, NULL, 2),
(526, 334, 'Tháo vệ sinh bầu lọc gió, thay mới theo chu kỳ', 'Tháo vệ sinh bầu lọc gió, thay mới theo chu kỳ', '4', '0.5', 6, NULL, 2),
(527, 334, 'Tháo vệ sinh bầu lọc gió, thay mới theo chu kỳ', 'Tháo vệ sinh bầu lọc gió, thay mới theo chu kỳ', '4', '0.5', 4, NULL, 2),
(528, 334, 'Tháo vệ sinh bầu lọc gió, thay mới theo chu kỳ', 'Tháo vệ sinh bầu lọc gió, thay mới theo chu kỳ', '4', '0.5', 2, NULL, 2),
(529, 335, 'Kê kích cầu trước, tháo lắp các lốp', 'Kê kích cầu trước, tháo lắp các lốp', '4', '5', 12, NULL, 2),
(530, 335, 'Kê kích cầu trước, tháo lắp các lốp', 'Kê kích cầu trước, tháo lắp các lốp', '4', '5', 10, NULL, 2),
(531, 335, 'Kê kích cầu trước, tháo lắp các lốp', 'Kê kích cầu trước, tháo lắp các lốp', '4', '5', 8, NULL, 2),
(532, 335, 'Kê kích cầu trước, tháo lắp các lốp', 'Kê kích cầu trước, tháo lắp các lốp', '4', '0', 14, NULL, 2),
(533, 335, 'Kê kích cầu trước, tháo lắp các lốp', 'Kê kích cầu trước, tháo lắp các lốp', '4', '0', 16, NULL, 2),
(534, 335, 'Kê kích cầu trước, tháo lắp các lốp', 'Kê kích cầu trước, tháo lắp các lốp', '4', '3', 6, NULL, 2),
(535, 335, 'Kê kích cầu trước, tháo lắp các lốp', 'Kê kích cầu trước, tháo lắp các lốp', '4', '4.5', 4, NULL, 2),
(536, 335, 'Kê kích cầu trước, tháo lắp các lốp', 'Kê kích cầu trước, tháo lắp các lốp', '4', '5', 2, NULL, 2),
(537, 335, 'Tháo kiểm tra may ơ, tăm bua (bánh căng đối với máy  bánh xích)', 'Tháo kiểm tra may ơ, tăm bua (bánh căng đối với máy  bánh xích)', '5', '4', 12, NULL, 2),
(538, 335, 'Tháo kiểm tra may ơ, tăm bua (bánh căng đối với máy  bánh xích)', 'Tháo kiểm tra may ơ, tăm bua (bánh căng đối với máy  bánh xích)', '5', '4', 10, NULL, 2),
(539, 335, 'Tháo kiểm tra may ơ, tăm bua (bánh căng đối với máy  bánh xích)', 'Tháo kiểm tra may ơ, tăm bua (bánh căng đối với máy  bánh xích)', '5', '4', 8, NULL, 2),
(540, 335, 'Tháo kiểm tra may ơ, tăm bua (bánh căng đối với máy  bánh xích)', 'Tháo kiểm tra may ơ, tăm bua (bánh căng đối với máy  bánh xích)', '5', '0', 14, NULL, 2),
(541, 335, 'Tháo kiểm tra may ơ, tăm bua (bánh căng đối với máy  bánh xích)', 'Tháo kiểm tra may ơ, tăm bua (bánh căng đối với máy  bánh xích)', '5', '0', 16, NULL, 2),
(542, 335, 'Tháo kiểm tra may ơ, tăm bua (bánh căng đối với máy  bánh xích)', 'Tháo kiểm tra may ơ, tăm bua (bánh căng đối với máy  bánh xích)', '5', '2.5', 6, NULL, 2),
(543, 335, 'Tháo kiểm tra may ơ, tăm bua (bánh căng đối với máy  bánh xích)', 'Tháo kiểm tra may ơ, tăm bua (bánh căng đối với máy  bánh xích)', '5', '3.5', 4, NULL, 2),
(544, 335, 'Tháo kiểm tra may ơ, tăm bua (bánh căng đối với máy  bánh xích)', 'Tháo kiểm tra may ơ, tăm bua (bánh căng đối với máy  bánh xích)', '5', '4', 2, NULL, 2),
(545, 335, 'Tháo lắp, kiểm tra trục quả đào, bát phanh/xy lanh thủy lực', 'Tháo lắp, kiểm tra trục quả đào, bát phanh/xy lanh thủy lực', '5', '0', 12, NULL, 2),
(546, 335, 'Tháo lắp, kiểm tra trục quả đào, bát phanh/xy lanh thủy lực', 'Tháo lắp, kiểm tra trục quả đào, bát phanh/xy lanh thủy lực', '5', '0', 10, NULL, 2),
(547, 335, 'Tháo lắp, kiểm tra trục quả đào, bát phanh/xy lanh thủy lực', 'Tháo lắp, kiểm tra trục quả đào, bát phanh/xy lanh thủy lực', '5', '0', 8, NULL, 2),
(548, 335, 'Tháo lắp, kiểm tra trục quả đào, bát phanh/xy lanh thủy lực', 'Tháo lắp, kiểm tra trục quả đào, bát phanh/xy lanh thủy lực', '5', '0', 14, NULL, 2),
(549, 335, 'Tháo lắp, kiểm tra trục quả đào, bát phanh/xy lanh thủy lực', 'Tháo lắp, kiểm tra trục quả đào, bát phanh/xy lanh thủy lực', '5', '0', 16, NULL, 2),
(550, 335, 'Tháo lắp, kiểm tra trục quả đào, bát phanh/xy lanh thủy lực', 'Tháo lắp, kiểm tra trục quả đào, bát phanh/xy lanh thủy lực', '5', '6', 6, NULL, 2),
(551, 335, 'Tháo lắp, kiểm tra trục quả đào, bát phanh/xy lanh thủy lực', 'Tháo lắp, kiểm tra trục quả đào, bát phanh/xy lanh thủy lực', '5', '8', 4, NULL, 2),
(552, 335, 'Tháo lắp, kiểm tra trục quả đào, bát phanh/xy lanh thủy lực', 'Tháo lắp, kiểm tra trục quả đào, bát phanh/xy lanh thủy lực', '5', '12', 2, NULL, 2),
(553, 335, 'Căn chỉnh, căn chỉnh, rà má phanh', 'Căn chỉnh, căn chỉnh, rà má phanh', '5', '0', 12, NULL, 2),
(554, 335, 'Căn chỉnh, căn chỉnh, rà má phanh', 'Căn chỉnh, căn chỉnh, rà má phanh', '5', '0', 10, NULL, 2),
(555, 335, 'Căn chỉnh, căn chỉnh, rà má phanh', 'Căn chỉnh, căn chỉnh, rà má phanh', '5', '0', 8, NULL, 2),
(556, 335, 'Căn chỉnh, căn chỉnh, rà má phanh', 'Căn chỉnh, căn chỉnh, rà má phanh', '5', '0', 14, NULL, 2),
(557, 335, 'Căn chỉnh, căn chỉnh, rà má phanh', 'Căn chỉnh, căn chỉnh, rà má phanh', '5', '0', 16, NULL, 2),
(558, 335, 'Căn chỉnh, căn chỉnh, rà má phanh', 'Căn chỉnh, căn chỉnh, rà má phanh', '5', '2', 6, NULL, 2),
(559, 335, 'Căn chỉnh, căn chỉnh, rà má phanh', 'Căn chỉnh, căn chỉnh, rà má phanh', '5', '3', 4, NULL, 2),
(560, 335, 'Căn chỉnh, căn chỉnh, rà má phanh', 'Căn chỉnh, căn chỉnh, rà má phanh', '5', '4', 2, NULL, 2),
(561, 335, 'Kê kích cầu sau, tháo lắp bánh xe', 'Kê kích cầu sau, tháo lắp bánh xe', '4', '7', 12, NULL, 2),
(562, 335, 'Kê kích cầu sau, tháo lắp bánh xe', 'Kê kích cầu sau, tháo lắp bánh xe', '4', '7', 10, NULL, 2),
(563, 335, 'Kê kích cầu sau, tháo lắp bánh xe', 'Kê kích cầu sau, tháo lắp bánh xe', '4', '7', 8, NULL, 2),
(564, 335, 'Kê kích cầu sau, tháo lắp bánh xe', 'Kê kích cầu sau, tháo lắp bánh xe', '4', '0', 14, NULL, 2),
(565, 335, 'Kê kích cầu sau, tháo lắp bánh xe', 'Kê kích cầu sau, tháo lắp bánh xe', '4', '0', 16, NULL, 2),
(566, 335, 'Kê kích cầu sau, tháo lắp bánh xe', 'Kê kích cầu sau, tháo lắp bánh xe', '4', '4.5', 6, NULL, 2),
(567, 335, 'Kê kích cầu sau, tháo lắp bánh xe', 'Kê kích cầu sau, tháo lắp bánh xe', '4', '6', 4, NULL, 2),
(568, 335, 'Kê kích cầu sau, tháo lắp bánh xe', 'Kê kích cầu sau, tháo lắp bánh xe', '4', '7', 2, NULL, 2),
(569, 335, 'Tháo kiểm tra may ơ, phớt chặn dầu, các bánh răng ăn khớp (bánh chủ động đối với máy  bánh xích)', 'Tháo kiểm tra may ơ, phớt chặn dầu, các bánh răng ăn khớp (bánh chủ động đối với máy  bánh xích)', '5', '12', 12, NULL, 2),
(570, 335, 'Tháo kiểm tra may ơ, phớt chặn dầu, các bánh răng ăn khớp (bánh chủ động đối với máy  bánh xích)', 'Tháo kiểm tra may ơ, phớt chặn dầu, các bánh răng ăn khớp (bánh chủ động đối với máy  bánh xích)', '5', '12', 10, NULL, 2),
(571, 335, 'Tháo kiểm tra may ơ, phớt chặn dầu, các bánh răng ăn khớp (bánh chủ động đối với máy  bánh xích)', 'Tháo kiểm tra may ơ, phớt chặn dầu, các bánh răng ăn khớp (bánh chủ động đối với máy  bánh xích)', '5', '12', 8, NULL, 2),
(572, 335, 'Tháo kiểm tra may ơ, phớt chặn dầu, các bánh răng ăn khớp (bánh chủ động đối với máy  bánh xích)', 'Tháo kiểm tra may ơ, phớt chặn dầu, các bánh răng ăn khớp (bánh chủ động đối với máy  bánh xích)', '5', '0', 14, NULL, 2),
(573, 335, 'Tháo kiểm tra may ơ, phớt chặn dầu, các bánh răng ăn khớp (bánh chủ động đối với máy  bánh xích)', 'Tháo kiểm tra may ơ, phớt chặn dầu, các bánh răng ăn khớp (bánh chủ động đối với máy  bánh xích)', '5', '0', 16, NULL, 2),
(574, 335, 'Tháo kiểm tra may ơ, phớt chặn dầu, các bánh răng ăn khớp (bánh chủ động đối với máy  bánh xích)', 'Tháo kiểm tra may ơ, phớt chặn dầu, các bánh răng ăn khớp (bánh chủ động đối với máy  bánh xích)', '5', '6', 6, NULL, 2),
(575, 335, 'Tháo kiểm tra may ơ, phớt chặn dầu, các bánh răng ăn khớp (bánh chủ động đối với máy  bánh xích)', 'Tháo kiểm tra may ơ, phớt chặn dầu, các bánh răng ăn khớp (bánh chủ động đối với máy  bánh xích)', '5', '10', 4, NULL, 2),
(576, 335, 'Tháo kiểm tra may ơ, phớt chặn dầu, các bánh răng ăn khớp (bánh chủ động đối với máy  bánh xích)', 'Tháo kiểm tra may ơ, phớt chặn dầu, các bánh răng ăn khớp (bánh chủ động đối với máy  bánh xích)', '5', '12', 2, NULL, 2),
(577, 335, 'Tháo lắp, kiểm tra trục quả đào, bát phanh/xy lanh thủy lực', 'Tháo lắp, kiểm tra trục quả đào, bát phanh/xy lanh thủy lực', '5', '0', 12, NULL, 2),
(578, 335, 'Tháo lắp, kiểm tra trục quả đào, bát phanh/xy lanh thủy lực', 'Tháo lắp, kiểm tra trục quả đào, bát phanh/xy lanh thủy lực', '5', '0', 10, NULL, 2),
(579, 335, 'Tháo lắp, kiểm tra trục quả đào, bát phanh/xy lanh thủy lực', 'Tháo lắp, kiểm tra trục quả đào, bát phanh/xy lanh thủy lực', '5', '0', 8, NULL, 2),
(580, 335, 'Tháo lắp, kiểm tra trục quả đào, bát phanh/xy lanh thủy lực', 'Tháo lắp, kiểm tra trục quả đào, bát phanh/xy lanh thủy lực', '5', '0', 14, NULL, 2),
(581, 335, 'Tháo lắp, kiểm tra trục quả đào, bát phanh/xy lanh thủy lực', 'Tháo lắp, kiểm tra trục quả đào, bát phanh/xy lanh thủy lực', '5', '0', 16, NULL, 2),
(582, 335, 'Tháo lắp, kiểm tra trục quả đào, bát phanh/xy lanh thủy lực', 'Tháo lắp, kiểm tra trục quả đào, bát phanh/xy lanh thủy lực', '5', '3', 6, NULL, 2),
(583, 335, 'Tháo lắp, kiểm tra trục quả đào, bát phanh/xy lanh thủy lực', 'Tháo lắp, kiểm tra trục quả đào, bát phanh/xy lanh thủy lực', '5', '3', 4, NULL, 2),
(584, 335, 'Tháo lắp, kiểm tra trục quả đào, bát phanh/xy lanh thủy lực', 'Tháo lắp, kiểm tra trục quả đào, bát phanh/xy lanh thủy lực', '5', '4', 2, NULL, 2),
(585, 335, 'Tháo lắp, căn chỉnh, kiểm tra trục láp (kiểm tra các bánh tỳ đối với máy bánh xích)', 'Tháo lắp, căn chỉnh, kiểm tra trục láp (kiểm tra các bánh tỳ đối với máy bánh xích)', '4', '0', 12, NULL, 2),
(586, 335, 'Tháo lắp, căn chỉnh, kiểm tra trục láp (kiểm tra các bánh tỳ đối với máy bánh xích)', 'Tháo lắp, căn chỉnh, kiểm tra trục láp (kiểm tra các bánh tỳ đối với máy bánh xích)', '4', '0', 10, NULL, 2),
(587, 335, 'Tháo lắp, căn chỉnh, kiểm tra trục láp (kiểm tra các bánh tỳ đối với máy bánh xích)', 'Tháo lắp, căn chỉnh, kiểm tra trục láp (kiểm tra các bánh tỳ đối với máy bánh xích)', '4', '0', 8, NULL, 2),
(588, 335, 'Tháo lắp, căn chỉnh, kiểm tra trục láp (kiểm tra các bánh tỳ đối với máy bánh xích)', 'Tháo lắp, căn chỉnh, kiểm tra trục láp (kiểm tra các bánh tỳ đối với máy bánh xích)', '4', '0', 14, NULL, 2),
(589, 335, 'Tháo lắp, căn chỉnh, kiểm tra trục láp (kiểm tra các bánh tỳ đối với máy bánh xích)', 'Tháo lắp, căn chỉnh, kiểm tra trục láp (kiểm tra các bánh tỳ đối với máy bánh xích)', '4', '0', 16, NULL, 2),
(590, 335, 'Tháo lắp, căn chỉnh, kiểm tra trục láp (kiểm tra các bánh tỳ đối với máy bánh xích)', 'Tháo lắp, căn chỉnh, kiểm tra trục láp (kiểm tra các bánh tỳ đối với máy bánh xích)', '4', '2', 6, NULL, 2),
(591, 335, 'Tháo lắp, căn chỉnh, kiểm tra trục láp (kiểm tra các bánh tỳ đối với máy bánh xích)', 'Tháo lắp, căn chỉnh, kiểm tra trục láp (kiểm tra các bánh tỳ đối với máy bánh xích)', '4', '2.5', 4, NULL, 2),
(592, 335, 'Tháo lắp, căn chỉnh, kiểm tra trục láp (kiểm tra các bánh tỳ đối với máy bánh xích)', 'Tháo lắp, căn chỉnh, kiểm tra trục láp (kiểm tra các bánh tỳ đối với máy bánh xích)', '4', '3', 2, NULL, 2),
(593, 335, 'Kiểm tra, căn chỉnh, rà má phanh', 'Kiểm tra, căn chỉnh, rà má phanh', '5', '0', 12, NULL, 2),
(594, 335, 'Kiểm tra, căn chỉnh, rà má phanh', 'Kiểm tra, căn chỉnh, rà má phanh', '5', '0', 10, NULL, 2),
(595, 335, 'Kiểm tra, căn chỉnh, rà má phanh', 'Kiểm tra, căn chỉnh, rà má phanh', '5', '0', 8, NULL, 2),
(596, 335, 'Kiểm tra, căn chỉnh, rà má phanh', 'Kiểm tra, căn chỉnh, rà má phanh', '5', '0', 14, NULL, 2),
(597, 335, 'Kiểm tra, căn chỉnh, rà má phanh', 'Kiểm tra, căn chỉnh, rà má phanh', '5', '0', 16, NULL, 2),
(598, 335, 'Kiểm tra, căn chỉnh, rà má phanh', 'Kiểm tra, căn chỉnh, rà má phanh', '5', '3', 6, NULL, 2),
(599, 335, 'Kiểm tra, căn chỉnh, rà má phanh', 'Kiểm tra, căn chỉnh, rà má phanh', '5', '5', 4, NULL, 2),
(600, 335, 'Kiểm tra, căn chỉnh, rà má phanh', 'Kiểm tra, căn chỉnh, rà má phanh', '5', '7', 2, NULL, 2),
(601, 335, 'Kiểm tra sự xô lệch của nhíp, xiết chặt quang nhíp, quai nhíp, bu lông tâm nhíp, ổ đỡ chốt nhíp, bu lông giữ chốt nhíp, mỏ nhíp.', 'Kiểm tra sự xô lệch của nhíp, xiết chặt quang nhíp, quai nhíp, bu lông tâm nhíp, ổ đỡ chốt nhíp, bu lông giữ chốt nhíp, mỏ nhíp.', '4', '0', 12, NULL, 2),
(602, 335, 'Kiểm tra sự xô lệch của nhíp, xiết chặt quang nhíp, quai nhíp, bu lông tâm nhíp, ổ đỡ chốt nhíp, bu lông giữ chốt nhíp, mỏ nhíp.', 'Kiểm tra sự xô lệch của nhíp, xiết chặt quang nhíp, quai nhíp, bu lông tâm nhíp, ổ đỡ chốt nhíp, bu lông giữ chốt nhíp, mỏ nhíp.', '4', '0', 10, NULL, 2),
(603, 335, 'Kiểm tra sự xô lệch của nhíp, xiết chặt quang nhíp, quai nhíp, bu lông tâm nhíp, ổ đỡ chốt nhíp, bu lông giữ chốt nhíp, mỏ nhíp.', 'Kiểm tra sự xô lệch của nhíp, xiết chặt quang nhíp, quai nhíp, bu lông tâm nhíp, ổ đỡ chốt nhíp, bu lông giữ chốt nhíp, mỏ nhíp.', '4', '0', 8, NULL, 2),
(604, 335, 'Kiểm tra sự xô lệch của nhíp, xiết chặt quang nhíp, quai nhíp, bu lông tâm nhíp, ổ đỡ chốt nhíp, bu lông giữ chốt nhíp, mỏ nhíp.', 'Kiểm tra sự xô lệch của nhíp, xiết chặt quang nhíp, quai nhíp, bu lông tâm nhíp, ổ đỡ chốt nhíp, bu lông giữ chốt nhíp, mỏ nhíp.', '4', '0', 14, NULL, 2),
(605, 335, 'Kiểm tra sự xô lệch của nhíp, xiết chặt quang nhíp, quai nhíp, bu lông tâm nhíp, ổ đỡ chốt nhíp, bu lông giữ chốt nhíp, mỏ nhíp.', 'Kiểm tra sự xô lệch của nhíp, xiết chặt quang nhíp, quai nhíp, bu lông tâm nhíp, ổ đỡ chốt nhíp, bu lông giữ chốt nhíp, mỏ nhíp.', '4', '0', 16, NULL, 2),
(606, 335, 'Kiểm tra sự xô lệch của nhíp, xiết chặt quang nhíp, quai nhíp, bu lông tâm nhíp, ổ đỡ chốt nhíp, bu lông giữ chốt nhíp, mỏ nhíp.', 'Kiểm tra sự xô lệch của nhíp, xiết chặt quang nhíp, quai nhíp, bu lông tâm nhíp, ổ đỡ chốt nhíp, bu lông giữ chốt nhíp, mỏ nhíp.', '4', '0', 6, NULL, 2),
(607, 335, 'Kiểm tra sự xô lệch của nhíp, xiết chặt quang nhíp, quai nhíp, bu lông tâm nhíp, ổ đỡ chốt nhíp, bu lông giữ chốt nhíp, mỏ nhíp.', 'Kiểm tra sự xô lệch của nhíp, xiết chặt quang nhíp, quai nhíp, bu lông tâm nhíp, ổ đỡ chốt nhíp, bu lông giữ chốt nhíp, mỏ nhíp.', '4', '2', 4, NULL, 2),
(608, 335, 'Kiểm tra sự xô lệch của nhíp, xiết chặt quang nhíp, quai nhíp, bu lông tâm nhíp, ổ đỡ chốt nhíp, bu lông giữ chốt nhíp, mỏ nhíp.', 'Kiểm tra sự xô lệch của nhíp, xiết chặt quang nhíp, quai nhíp, bu lông tâm nhíp, ổ đỡ chốt nhíp, bu lông giữ chốt nhíp, mỏ nhíp.', '4', '2.5', 2, NULL, 2),
(609, 335, 'Kiểm tra xử lý độ kín và tác dụng của giảm sóc, siết chặt bu lông giữ giảm sóc.', 'Kiểm tra xử lý độ kín và tác dụng của giảm sóc, siết chặt bu lông giữ giảm sóc.', '4', '0', 12, NULL, 2),
(610, 335, 'Kiểm tra xử lý độ kín và tác dụng của giảm sóc, siết chặt bu lông giữ giảm sóc.', 'Kiểm tra xử lý độ kín và tác dụng của giảm sóc, siết chặt bu lông giữ giảm sóc.', '4', '0', 10, NULL, 2),
(611, 335, 'Kiểm tra xử lý độ kín và tác dụng của giảm sóc, siết chặt bu lông giữ giảm sóc.', 'Kiểm tra xử lý độ kín và tác dụng của giảm sóc, siết chặt bu lông giữ giảm sóc.', '4', '0', 8, NULL, 2),
(612, 335, 'Kiểm tra xử lý độ kín và tác dụng của giảm sóc, siết chặt bu lông giữ giảm sóc.', 'Kiểm tra xử lý độ kín và tác dụng của giảm sóc, siết chặt bu lông giữ giảm sóc.', '4', '0', 14, NULL, 2),
(613, 335, 'Kiểm tra xử lý độ kín và tác dụng của giảm sóc, siết chặt bu lông giữ giảm sóc.', 'Kiểm tra xử lý độ kín và tác dụng của giảm sóc, siết chặt bu lông giữ giảm sóc.', '4', '0', 16, NULL, 2),
(614, 335, 'Kiểm tra xử lý độ kín và tác dụng của giảm sóc, siết chặt bu lông giữ giảm sóc.', 'Kiểm tra xử lý độ kín và tác dụng của giảm sóc, siết chặt bu lông giữ giảm sóc.', '4', '0.5', 6, NULL, 2),
(615, 335, 'Kiểm tra xử lý độ kín và tác dụng của giảm sóc, siết chặt bu lông giữ giảm sóc.', 'Kiểm tra xử lý độ kín và tác dụng của giảm sóc, siết chặt bu lông giữ giảm sóc.', '4', '1', 4, NULL, 2),
(616, 335, 'Kiểm tra xử lý độ kín và tác dụng của giảm sóc, siết chặt bu lông giữ giảm sóc.', 'Kiểm tra xử lý độ kín và tác dụng của giảm sóc, siết chặt bu lông giữ giảm sóc.', '4', '1', 2, NULL, 2),
(617, 335, 'Kiểm tra sự xô lệch của nhíp, xiết chặt quang nhíp, quai nhíp, bu lông tâm nhíp, ổ đỡ chốt nhíp, bu lông giữ chốt nhíp, mỏ nhíp.', 'Kiểm tra sự xô lệch của nhíp, xiết chặt quang nhíp, quai nhíp, bu lông tâm nhíp, ổ đỡ chốt nhíp, bu lông giữ chốt nhíp, mỏ nhíp.', '4', '0', 12, NULL, 2),
(618, 335, 'Kiểm tra sự xô lệch của nhíp, xiết chặt quang nhíp, quai nhíp, bu lông tâm nhíp, ổ đỡ chốt nhíp, bu lông giữ chốt nhíp, mỏ nhíp.', 'Kiểm tra sự xô lệch của nhíp, xiết chặt quang nhíp, quai nhíp, bu lông tâm nhíp, ổ đỡ chốt nhíp, bu lông giữ chốt nhíp, mỏ nhíp.', '4', '0', 10, NULL, 2),
(619, 335, 'Kiểm tra sự xô lệch của nhíp, xiết chặt quang nhíp, quai nhíp, bu lông tâm nhíp, ổ đỡ chốt nhíp, bu lông giữ chốt nhíp, mỏ nhíp.', 'Kiểm tra sự xô lệch của nhíp, xiết chặt quang nhíp, quai nhíp, bu lông tâm nhíp, ổ đỡ chốt nhíp, bu lông giữ chốt nhíp, mỏ nhíp.', '4', '0', 8, NULL, 2),
(620, 335, 'Kiểm tra sự xô lệch của nhíp, xiết chặt quang nhíp, quai nhíp, bu lông tâm nhíp, ổ đỡ chốt nhíp, bu lông giữ chốt nhíp, mỏ nhíp.', 'Kiểm tra sự xô lệch của nhíp, xiết chặt quang nhíp, quai nhíp, bu lông tâm nhíp, ổ đỡ chốt nhíp, bu lông giữ chốt nhíp, mỏ nhíp.', '4', '0', 14, NULL, 2),
(621, 335, 'Kiểm tra sự xô lệch của nhíp, xiết chặt quang nhíp, quai nhíp, bu lông tâm nhíp, ổ đỡ chốt nhíp, bu lông giữ chốt nhíp, mỏ nhíp.', 'Kiểm tra sự xô lệch của nhíp, xiết chặt quang nhíp, quai nhíp, bu lông tâm nhíp, ổ đỡ chốt nhíp, bu lông giữ chốt nhíp, mỏ nhíp.', '4', '0', 16, NULL, 2),
(622, 335, 'Kiểm tra sự xô lệch của nhíp, xiết chặt quang nhíp, quai nhíp, bu lông tâm nhíp, ổ đỡ chốt nhíp, bu lông giữ chốt nhíp, mỏ nhíp.', 'Kiểm tra sự xô lệch của nhíp, xiết chặt quang nhíp, quai nhíp, bu lông tâm nhíp, ổ đỡ chốt nhíp, bu lông giữ chốt nhíp, mỏ nhíp.', '4', '2', 6, NULL, 2),
(623, 335, 'Kiểm tra sự xô lệch của nhíp, xiết chặt quang nhíp, quai nhíp, bu lông tâm nhíp, ổ đỡ chốt nhíp, bu lông giữ chốt nhíp, mỏ nhíp.', 'Kiểm tra sự xô lệch của nhíp, xiết chặt quang nhíp, quai nhíp, bu lông tâm nhíp, ổ đỡ chốt nhíp, bu lông giữ chốt nhíp, mỏ nhíp.', '4', '2.5', 4, NULL, 2),
(624, 335, 'Kiểm tra sự xô lệch của nhíp, xiết chặt quang nhíp, quai nhíp, bu lông tâm nhíp, ổ đỡ chốt nhíp, bu lông giữ chốt nhíp, mỏ nhíp.', 'Kiểm tra sự xô lệch của nhíp, xiết chặt quang nhíp, quai nhíp, bu lông tâm nhíp, ổ đỡ chốt nhíp, bu lông giữ chốt nhíp, mỏ nhíp.', '4', '3', 2, NULL, 2),
(625, 335, 'Kiểm tra xử lý độ kín và tác dụng của giảm sóc, siết chặt bu lông giữ giảm sóc.', 'Kiểm tra xử lý độ kín và tác dụng của giảm sóc, siết chặt bu lông giữ giảm sóc.', '4', '0', 12, NULL, 2),
(626, 335, 'Kiểm tra xử lý độ kín và tác dụng của giảm sóc, siết chặt bu lông giữ giảm sóc.', 'Kiểm tra xử lý độ kín và tác dụng của giảm sóc, siết chặt bu lông giữ giảm sóc.', '4', '0', 10, NULL, 2),
(627, 335, 'Kiểm tra xử lý độ kín và tác dụng của giảm sóc, siết chặt bu lông giữ giảm sóc.', 'Kiểm tra xử lý độ kín và tác dụng của giảm sóc, siết chặt bu lông giữ giảm sóc.', '4', '0', 8, NULL, 2),
(628, 335, 'Kiểm tra xử lý độ kín và tác dụng của giảm sóc, siết chặt bu lông giữ giảm sóc.', 'Kiểm tra xử lý độ kín và tác dụng của giảm sóc, siết chặt bu lông giữ giảm sóc.', '4', '0', 14, NULL, 2),
(629, 335, 'Kiểm tra xử lý độ kín và tác dụng của giảm sóc, siết chặt bu lông giữ giảm sóc.', 'Kiểm tra xử lý độ kín và tác dụng của giảm sóc, siết chặt bu lông giữ giảm sóc.', '4', '0', 16, NULL, 2),
(630, 335, 'Kiểm tra xử lý độ kín và tác dụng của giảm sóc, siết chặt bu lông giữ giảm sóc.', 'Kiểm tra xử lý độ kín và tác dụng của giảm sóc, siết chặt bu lông giữ giảm sóc.', '4', '0.5', 6, NULL, 2),
(631, 335, 'Kiểm tra xử lý độ kín và tác dụng của giảm sóc, siết chặt bu lông giữ giảm sóc.', 'Kiểm tra xử lý độ kín và tác dụng của giảm sóc, siết chặt bu lông giữ giảm sóc.', '4', '0', 4, NULL, 2),
(632, 335, 'Kiểm tra xử lý độ kín và tác dụng của giảm sóc, siết chặt bu lông giữ giảm sóc.', 'Kiểm tra xử lý độ kín và tác dụng của giảm sóc, siết chặt bu lông giữ giảm sóc.', '4', '0', 2, NULL, 2),
(633, 335, 'Kiểm tra tình trạng trục các đăng, độ dơ ổ trục , vòng bi chữ thập, ổ đỡ trung gian. Thay vòng bi chữ thập khi độ dơ quá giới hạn cho phép. Xiết chặt các bu lông mặt bích các đăng, ổ đỡ.', 'Kiểm tra tình trạng trục các đăng, độ dơ ổ trục , vòng bi chữ thập, ổ đỡ trung gian. Thay vòng bi chữ thập khi độ dơ quá giới hạn cho phép. Xiết chặt các bu lông mặt bích các đăng, ổ đỡ.', '5', '3.5', 12, NULL, 2),
(634, 335, 'Kiểm tra tình trạng trục các đăng, độ dơ ổ trục , vòng bi chữ thập, ổ đỡ trung gian. Thay vòng bi chữ thập khi độ dơ quá giới hạn cho phép. Xiết chặt các bu lông mặt bích các đăng, ổ đỡ.', 'Kiểm tra tình trạng trục các đăng, độ dơ ổ trục , vòng bi chữ thập, ổ đỡ trung gian. Thay vòng bi chữ thập khi độ dơ quá giới hạn cho phép. Xiết chặt các bu lông mặt bích các đăng, ổ đỡ.', '5', '3.5', 10, NULL, 2),
(635, 335, 'Kiểm tra tình trạng trục các đăng, độ dơ ổ trục , vòng bi chữ thập, ổ đỡ trung gian. Thay vòng bi chữ thập khi độ dơ quá giới hạn cho phép. Xiết chặt các bu lông mặt bích các đăng, ổ đỡ.', 'Kiểm tra tình trạng trục các đăng, độ dơ ổ trục , vòng bi chữ thập, ổ đỡ trung gian. Thay vòng bi chữ thập khi độ dơ quá giới hạn cho phép. Xiết chặt các bu lông mặt bích các đăng, ổ đỡ.', '5', '3.5', 8, NULL, 2),
(636, 335, 'Kiểm tra tình trạng trục các đăng, độ dơ ổ trục , vòng bi chữ thập, ổ đỡ trung gian. Thay vòng bi chữ thập khi độ dơ quá giới hạn cho phép. Xiết chặt các bu lông mặt bích các đăng, ổ đỡ.', 'Kiểm tra tình trạng trục các đăng, độ dơ ổ trục , vòng bi chữ thập, ổ đỡ trung gian. Thay vòng bi chữ thập khi độ dơ quá giới hạn cho phép. Xiết chặt các bu lông mặt bích các đăng, ổ đỡ.', '5', '0', 14, NULL, 2),
(637, 335, 'Kiểm tra tình trạng trục các đăng, độ dơ ổ trục , vòng bi chữ thập, ổ đỡ trung gian. Thay vòng bi chữ thập khi độ dơ quá giới hạn cho phép. Xiết chặt các bu lông mặt bích các đăng, ổ đỡ.', 'Kiểm tra tình trạng trục các đăng, độ dơ ổ trục , vòng bi chữ thập, ổ đỡ trung gian. Thay vòng bi chữ thập khi độ dơ quá giới hạn cho phép. Xiết chặt các bu lông mặt bích các đăng, ổ đỡ.', '5', '2', 16, NULL, 2),
(638, 335, 'Kiểm tra tình trạng trục các đăng, độ dơ ổ trục , vòng bi chữ thập, ổ đỡ trung gian. Thay vòng bi chữ thập khi độ dơ quá giới hạn cho phép. Xiết chặt các bu lông mặt bích các đăng, ổ đỡ.', 'Kiểm tra tình trạng trục các đăng, độ dơ ổ trục , vòng bi chữ thập, ổ đỡ trung gian. Thay vòng bi chữ thập khi độ dơ quá giới hạn cho phép. Xiết chặt các bu lông mặt bích các đăng, ổ đỡ.', '5', '2', 6, NULL, 2),
(639, 335, 'Kiểm tra tình trạng trục các đăng, độ dơ ổ trục , vòng bi chữ thập, ổ đỡ trung gian. Thay vòng bi chữ thập khi độ dơ quá giới hạn cho phép. Xiết chặt các bu lông mặt bích các đăng, ổ đỡ.', 'Kiểm tra tình trạng trục các đăng, độ dơ ổ trục , vòng bi chữ thập, ổ đỡ trung gian. Thay vòng bi chữ thập khi độ dơ quá giới hạn cho phép. Xiết chặt các bu lông mặt bích các đăng, ổ đỡ.', '5', '2.5', 4, NULL, 2),
(640, 335, 'Kiểm tra tình trạng trục các đăng, độ dơ ổ trục , vòng bi chữ thập, ổ đỡ trung gian. Thay vòng bi chữ thập khi độ dơ quá giới hạn cho phép. Xiết chặt các bu lông mặt bích các đăng, ổ đỡ.', 'Kiểm tra tình trạng trục các đăng, độ dơ ổ trục , vòng bi chữ thập, ổ đỡ trung gian. Thay vòng bi chữ thập khi độ dơ quá giới hạn cho phép. Xiết chặt các bu lông mặt bích các đăng, ổ đỡ.', '5', '3.5', 2, NULL, 2),
(641, 335, 'Kiểm tra tác dụng của lò xo kép, bàn đạp ly hợp, tác dụng của bộ ly hợp và hành trình tự do của chân côn (Nếu cần thiết phải kiểm tra và điều chỉnh toàn bộ ly hợp)', 'Kiểm tra tác dụng của lò xo kép, bàn đạp ly hợp, tác dụng của bộ ly hợp và hành trình tự do của chân côn (Nếu cần thiết phải kiểm tra và điều chỉnh toàn bộ ly hợp)', '5', '2', 12, NULL, 2),
(642, 335, 'Kiểm tra tác dụng của lò xo kép, bàn đạp ly hợp, tác dụng của bộ ly hợp và hành trình tự do của chân côn (Nếu cần thiết phải kiểm tra và điều chỉnh toàn bộ ly hợp)', 'Kiểm tra tác dụng của lò xo kép, bàn đạp ly hợp, tác dụng của bộ ly hợp và hành trình tự do của chân côn (Nếu cần thiết phải kiểm tra và điều chỉnh toàn bộ ly hợp)', '5', '2', 10, NULL, 2),
(643, 335, 'Kiểm tra tác dụng của lò xo kép, bàn đạp ly hợp, tác dụng của bộ ly hợp và hành trình tự do của chân côn (Nếu cần thiết phải kiểm tra và điều chỉnh toàn bộ ly hợp)', 'Kiểm tra tác dụng của lò xo kép, bàn đạp ly hợp, tác dụng của bộ ly hợp và hành trình tự do của chân côn (Nếu cần thiết phải kiểm tra và điều chỉnh toàn bộ ly hợp)', '5', '2', 8, NULL, 2),
(644, 335, 'Kiểm tra tác dụng của lò xo kép, bàn đạp ly hợp, tác dụng của bộ ly hợp và hành trình tự do của chân côn (Nếu cần thiết phải kiểm tra và điều chỉnh toàn bộ ly hợp)', 'Kiểm tra tác dụng của lò xo kép, bàn đạp ly hợp, tác dụng của bộ ly hợp và hành trình tự do của chân côn (Nếu cần thiết phải kiểm tra và điều chỉnh toàn bộ ly hợp)', '5', '0', 14, NULL, 2),
(645, 335, 'Kiểm tra tác dụng của lò xo kép, bàn đạp ly hợp, tác dụng của bộ ly hợp và hành trình tự do của chân côn (Nếu cần thiết phải kiểm tra và điều chỉnh toàn bộ ly hợp)', 'Kiểm tra tác dụng của lò xo kép, bàn đạp ly hợp, tác dụng của bộ ly hợp và hành trình tự do của chân côn (Nếu cần thiết phải kiểm tra và điều chỉnh toàn bộ ly hợp)', '5', '1', 16, NULL, 2),
(646, 335, 'Kiểm tra tác dụng của lò xo kép, bàn đạp ly hợp, tác dụng của bộ ly hợp và hành trình tự do của chân côn (Nếu cần thiết phải kiểm tra và điều chỉnh toàn bộ ly hợp)', 'Kiểm tra tác dụng của lò xo kép, bàn đạp ly hợp, tác dụng của bộ ly hợp và hành trình tự do của chân côn (Nếu cần thiết phải kiểm tra và điều chỉnh toàn bộ ly hợp)', '5', '1', 6, NULL, 2),
(647, 335, 'Kiểm tra tác dụng của lò xo kép, bàn đạp ly hợp, tác dụng của bộ ly hợp và hành trình tự do của chân côn (Nếu cần thiết phải kiểm tra và điều chỉnh toàn bộ ly hợp)', 'Kiểm tra tác dụng của lò xo kép, bàn đạp ly hợp, tác dụng của bộ ly hợp và hành trình tự do của chân côn (Nếu cần thiết phải kiểm tra và điều chỉnh toàn bộ ly hợp)', '5', '1.5', 4, NULL, 2),
(648, 335, 'Kiểm tra tác dụng của lò xo kép, bàn đạp ly hợp, tác dụng của bộ ly hợp và hành trình tự do của chân côn (Nếu cần thiết phải kiểm tra và điều chỉnh toàn bộ ly hợp)', 'Kiểm tra tác dụng của lò xo kép, bàn đạp ly hợp, tác dụng của bộ ly hợp và hành trình tự do của chân côn (Nếu cần thiết phải kiểm tra và điều chỉnh toàn bộ ly hợp)', '5', '2', 2, NULL, 2),
(649, 335, 'Kiểm tra các liên kết và hệ truyền dẫn bộ ly hợp.  Đối với ly hợp có trợ lực thủy lực- kiểm tra độ kín của hệ thủy lực và tác dụng của hệ thống truyền, bổ sung dầu nếu thiếu. (Nếu cần thiết phải kiểm tra và điều chỉnh lại toàn bộ ly hợp).', 'Kiểm tra các liên kết và hệ truyền dẫn bộ ly hợp.  Đối với ly hợp có trợ lực thủy lực- kiểm tra độ kín của hệ thủy lực và tác dụng của hệ thống truyền, bổ sung dầu nếu thiếu. (Nếu cần thiết phải kiểm tra và điều chỉnh lại toàn bộ ly hợp).', '5', '2', 12, NULL, 2),
(650, 335, 'Kiểm tra các liên kết và hệ truyền dẫn bộ ly hợp.  Đối với ly hợp có trợ lực thủy lực- kiểm tra độ kín của hệ thủy lực và tác dụng của hệ thống truyền, bổ sung dầu nếu thiếu. (Nếu cần thiết phải kiểm tra và điều chỉnh lại toàn bộ ly hợp).', 'Kiểm tra các liên kết và hệ truyền dẫn bộ ly hợp.  Đối với ly hợp có trợ lực thủy lực- kiểm tra độ kín của hệ thủy lực và tác dụng của hệ thống truyền, bổ sung dầu nếu thiếu. (Nếu cần thiết phải kiểm tra và điều chỉnh lại toàn bộ ly hợp).', '5', '2', 10, NULL, 2),
(651, 335, 'Kiểm tra các liên kết và hệ truyền dẫn bộ ly hợp.  Đối với ly hợp có trợ lực thủy lực- kiểm tra độ kín của hệ thủy lực và tác dụng của hệ thống truyền, bổ sung dầu nếu thiếu. (Nếu cần thiết phải kiểm tra và điều chỉnh lại toàn bộ ly hợp).', 'Kiểm tra các liên kết và hệ truyền dẫn bộ ly hợp.  Đối với ly hợp có trợ lực thủy lực- kiểm tra độ kín của hệ thủy lực và tác dụng của hệ thống truyền, bổ sung dầu nếu thiếu. (Nếu cần thiết phải kiểm tra và điều chỉnh lại toàn bộ ly hợp).', '5', '2', 8, NULL, 2),
(652, 335, 'Kiểm tra các liên kết và hệ truyền dẫn bộ ly hợp.  Đối với ly hợp có trợ lực thủy lực- kiểm tra độ kín của hệ thủy lực và tác dụng của hệ thống truyền, bổ sung dầu nếu thiếu. (Nếu cần thiết phải kiểm tra và điều chỉnh lại toàn bộ ly hợp).', 'Kiểm tra các liên kết và hệ truyền dẫn bộ ly hợp.  Đối với ly hợp có trợ lực thủy lực- kiểm tra độ kín của hệ thủy lực và tác dụng của hệ thống truyền, bổ sung dầu nếu thiếu. (Nếu cần thiết phải kiểm tra và điều chỉnh lại toàn bộ ly hợp).', '5', '0', 14, NULL, 2),
(653, 335, 'Kiểm tra các liên kết và hệ truyền dẫn bộ ly hợp.  Đối với ly hợp có trợ lực thủy lực- kiểm tra độ kín của hệ thủy lực và tác dụng của hệ thống truyền, bổ sung dầu nếu thiếu. (Nếu cần thiết phải kiểm tra và điều chỉnh lại toàn bộ ly hợp).', 'Kiểm tra các liên kết và hệ truyền dẫn bộ ly hợp.  Đối với ly hợp có trợ lực thủy lực- kiểm tra độ kín của hệ thủy lực và tác dụng của hệ thống truyền, bổ sung dầu nếu thiếu. (Nếu cần thiết phải kiểm tra và điều chỉnh lại toàn bộ ly hợp).', '5', '1', 16, NULL, 2),
(654, 335, 'Kiểm tra các liên kết và hệ truyền dẫn bộ ly hợp.  Đối với ly hợp có trợ lực thủy lực- kiểm tra độ kín của hệ thủy lực và tác dụng của hệ thống truyền, bổ sung dầu nếu thiếu. (Nếu cần thiết phải kiểm tra và điều chỉnh lại toàn bộ ly hợp).', 'Kiểm tra các liên kết và hệ truyền dẫn bộ ly hợp.  Đối với ly hợp có trợ lực thủy lực- kiểm tra độ kín của hệ thủy lực và tác dụng của hệ thống truyền, bổ sung dầu nếu thiếu. (Nếu cần thiết phải kiểm tra và điều chỉnh lại toàn bộ ly hợp).', '5', '1', 6, NULL, 2),
(655, 335, 'Kiểm tra các liên kết và hệ truyền dẫn bộ ly hợp.  Đối với ly hợp có trợ lực thủy lực- kiểm tra độ kín của hệ thủy lực và tác dụng của hệ thống truyền, bổ sung dầu nếu thiếu. (Nếu cần thiết phải kiểm tra và điều chỉnh lại toàn bộ ly hợp).', 'Kiểm tra các liên kết và hệ truyền dẫn bộ ly hợp.  Đối với ly hợp có trợ lực thủy lực- kiểm tra độ kín của hệ thủy lực và tác dụng của hệ thống truyền, bổ sung dầu nếu thiếu. (Nếu cần thiết phải kiểm tra và điều chỉnh lại toàn bộ ly hợp).', '5', '1.5', 4, NULL, 2),
(656, 335, 'Kiểm tra các liên kết và hệ truyền dẫn bộ ly hợp.  Đối với ly hợp có trợ lực thủy lực- kiểm tra độ kín của hệ thủy lực và tác dụng của hệ thống truyền, bổ sung dầu nếu thiếu. (Nếu cần thiết phải kiểm tra và điều chỉnh lại toàn bộ ly hợp).', 'Kiểm tra các liên kết và hệ truyền dẫn bộ ly hợp.  Đối với ly hợp có trợ lực thủy lực- kiểm tra độ kín của hệ thủy lực và tác dụng của hệ thống truyền, bổ sung dầu nếu thiếu. (Nếu cần thiết phải kiểm tra và điều chỉnh lại toàn bộ ly hợp).', '5', '2', 2, NULL, 2),
(657, 335, 'Kiểm tra tình trạng và sự rò rỉ của vỏ hộp số, nắp vòng chắn dầu. Kiểm tra xiết chặt bu lông bắt giữ hộp số và cơ cấu cần đổi số.', 'Kiểm tra tình trạng và sự rò rỉ của vỏ hộp số, nắp vòng chắn dầu. Kiểm tra xiết chặt bu lông bắt giữ hộp số và cơ cấu cần đổi số.', '5', '1.5', 12, NULL, 2),
(658, 335, 'Kiểm tra tình trạng và sự rò rỉ của vỏ hộp số, nắp vòng chắn dầu. Kiểm tra xiết chặt bu lông bắt giữ hộp số và cơ cấu cần đổi số.', 'Kiểm tra tình trạng và sự rò rỉ của vỏ hộp số, nắp vòng chắn dầu. Kiểm tra xiết chặt bu lông bắt giữ hộp số và cơ cấu cần đổi số.', '5', '1.5', 10, NULL, 2),
(659, 335, 'Kiểm tra tình trạng và sự rò rỉ của vỏ hộp số, nắp vòng chắn dầu. Kiểm tra xiết chặt bu lông bắt giữ hộp số và cơ cấu cần đổi số.', 'Kiểm tra tình trạng và sự rò rỉ của vỏ hộp số, nắp vòng chắn dầu. Kiểm tra xiết chặt bu lông bắt giữ hộp số và cơ cấu cần đổi số.', '5', '1.5', 8, NULL, 2),
(660, 335, 'Kiểm tra tình trạng và sự rò rỉ của vỏ hộp số, nắp vòng chắn dầu. Kiểm tra xiết chặt bu lông bắt giữ hộp số và cơ cấu cần đổi số.', 'Kiểm tra tình trạng và sự rò rỉ của vỏ hộp số, nắp vòng chắn dầu. Kiểm tra xiết chặt bu lông bắt giữ hộp số và cơ cấu cần đổi số.', '5', '0', 14, NULL, 2),
(661, 335, 'Kiểm tra tình trạng và sự rò rỉ của vỏ hộp số, nắp vòng chắn dầu. Kiểm tra xiết chặt bu lông bắt giữ hộp số và cơ cấu cần đổi số.', 'Kiểm tra tình trạng và sự rò rỉ của vỏ hộp số, nắp vòng chắn dầu. Kiểm tra xiết chặt bu lông bắt giữ hộp số và cơ cấu cần đổi số.', '5', '1', 16, NULL, 2),
(662, 335, 'Kiểm tra tình trạng và sự rò rỉ của vỏ hộp số, nắp vòng chắn dầu. Kiểm tra xiết chặt bu lông bắt giữ hộp số và cơ cấu cần đổi số.', 'Kiểm tra tình trạng và sự rò rỉ của vỏ hộp số, nắp vòng chắn dầu. Kiểm tra xiết chặt bu lông bắt giữ hộp số và cơ cấu cần đổi số.', '5', '1', 6, NULL, 2),
(663, 335, 'Kiểm tra tình trạng và sự rò rỉ của vỏ hộp số, nắp vòng chắn dầu. Kiểm tra xiết chặt bu lông bắt giữ hộp số và cơ cấu cần đổi số.', 'Kiểm tra tình trạng và sự rò rỉ của vỏ hộp số, nắp vòng chắn dầu. Kiểm tra xiết chặt bu lông bắt giữ hộp số và cơ cấu cần đổi số.', '5', '1', 4, NULL, 2),
(664, 335, 'Kiểm tra tình trạng và sự rò rỉ của vỏ hộp số, nắp vòng chắn dầu. Kiểm tra xiết chặt bu lông bắt giữ hộp số và cơ cấu cần đổi số.', 'Kiểm tra tình trạng và sự rò rỉ của vỏ hộp số, nắp vòng chắn dầu. Kiểm tra xiết chặt bu lông bắt giữ hộp số và cơ cấu cần đổi số.', '5', '1.5', 2, NULL, 2),
(665, 335, 'Kiểm tra tình trạng và tác dụng của cơ cấu đổi số, tình trạng làm việc của hộp số', 'Kiểm tra tình trạng và tác dụng của cơ cấu đổi số, tình trạng làm việc của hộp số', '5', '1', 12, NULL, 2),
(666, 335, 'Kiểm tra tình trạng và tác dụng của cơ cấu đổi số, tình trạng làm việc của hộp số', 'Kiểm tra tình trạng và tác dụng của cơ cấu đổi số, tình trạng làm việc của hộp số', '5', '1', 10, NULL, 2),
(667, 335, 'Kiểm tra tình trạng và tác dụng của cơ cấu đổi số, tình trạng làm việc của hộp số', 'Kiểm tra tình trạng và tác dụng của cơ cấu đổi số, tình trạng làm việc của hộp số', '5', '1', 8, NULL, 2),
(668, 335, 'Kiểm tra tình trạng và tác dụng của cơ cấu đổi số, tình trạng làm việc của hộp số', 'Kiểm tra tình trạng và tác dụng của cơ cấu đổi số, tình trạng làm việc của hộp số', '5', '0', 14, NULL, 2),
(669, 335, 'Kiểm tra tình trạng và tác dụng của cơ cấu đổi số, tình trạng làm việc của hộp số', 'Kiểm tra tình trạng và tác dụng của cơ cấu đổi số, tình trạng làm việc của hộp số', '5', '0.5', 16, NULL, 2),
(670, 335, 'Kiểm tra tình trạng và tác dụng của cơ cấu đổi số, tình trạng làm việc của hộp số', 'Kiểm tra tình trạng và tác dụng của cơ cấu đổi số, tình trạng làm việc của hộp số', '5', '0.5', 6, NULL, 2),
(671, 335, 'Kiểm tra tình trạng và tác dụng của cơ cấu đổi số, tình trạng làm việc của hộp số', 'Kiểm tra tình trạng và tác dụng của cơ cấu đổi số, tình trạng làm việc của hộp số', '5', '1', 4, NULL, 2),
(672, 335, 'Kiểm tra tình trạng và tác dụng của cơ cấu đổi số, tình trạng làm việc của hộp số', 'Kiểm tra tình trạng và tác dụng của cơ cấu đổi số, tình trạng làm việc của hộp số', '5', '1', 2, NULL, 2),
(673, 335, 'Kiểm tra điều chỉnh áp suất làm việc của bơm dầu. Kiểm tra xiết chặt các bộ phận của cơ cấu thủy lực hộp số (Đối với hộp số cơ khí thủy lực).', 'Kiểm tra điều chỉnh áp suất làm việc của bơm dầu. Kiểm tra xiết chặt các bộ phận của cơ cấu thủy lực hộp số (Đối với hộp số cơ khí thủy lực).', '5', '3', 12, NULL, 2),
(674, 335, 'Kiểm tra điều chỉnh áp suất làm việc của bơm dầu. Kiểm tra xiết chặt các bộ phận của cơ cấu thủy lực hộp số (Đối với hộp số cơ khí thủy lực).', 'Kiểm tra điều chỉnh áp suất làm việc của bơm dầu. Kiểm tra xiết chặt các bộ phận của cơ cấu thủy lực hộp số (Đối với hộp số cơ khí thủy lực).', '5', '3', 10, NULL, 2),
(675, 335, 'Kiểm tra điều chỉnh áp suất làm việc của bơm dầu. Kiểm tra xiết chặt các bộ phận của cơ cấu thủy lực hộp số (Đối với hộp số cơ khí thủy lực).', 'Kiểm tra điều chỉnh áp suất làm việc của bơm dầu. Kiểm tra xiết chặt các bộ phận của cơ cấu thủy lực hộp số (Đối với hộp số cơ khí thủy lực).', '5', '3', 8, NULL, 2),
(676, 335, 'Kiểm tra điều chỉnh áp suất làm việc của bơm dầu. Kiểm tra xiết chặt các bộ phận của cơ cấu thủy lực hộp số (Đối với hộp số cơ khí thủy lực).', 'Kiểm tra điều chỉnh áp suất làm việc của bơm dầu. Kiểm tra xiết chặt các bộ phận của cơ cấu thủy lực hộp số (Đối với hộp số cơ khí thủy lực).', '5', '0', 14, NULL, 2),
(677, 335, 'Kiểm tra điều chỉnh áp suất làm việc của bơm dầu. Kiểm tra xiết chặt các bộ phận của cơ cấu thủy lực hộp số (Đối với hộp số cơ khí thủy lực).', 'Kiểm tra điều chỉnh áp suất làm việc của bơm dầu. Kiểm tra xiết chặt các bộ phận của cơ cấu thủy lực hộp số (Đối với hộp số cơ khí thủy lực).', '5', '2', 16, NULL, 2),
(678, 335, 'Kiểm tra điều chỉnh áp suất làm việc của bơm dầu. Kiểm tra xiết chặt các bộ phận của cơ cấu thủy lực hộp số (Đối với hộp số cơ khí thủy lực).', 'Kiểm tra điều chỉnh áp suất làm việc của bơm dầu. Kiểm tra xiết chặt các bộ phận của cơ cấu thủy lực hộp số (Đối với hộp số cơ khí thủy lực).', '5', '2', 6, NULL, 2),
(679, 335, 'Kiểm tra điều chỉnh áp suất làm việc của bơm dầu. Kiểm tra xiết chặt các bộ phận của cơ cấu thủy lực hộp số (Đối với hộp số cơ khí thủy lực).', 'Kiểm tra điều chỉnh áp suất làm việc của bơm dầu. Kiểm tra xiết chặt các bộ phận của cơ cấu thủy lực hộp số (Đối với hộp số cơ khí thủy lực).', '5', '2.5', 4, NULL, 2),
(680, 335, 'Kiểm tra điều chỉnh áp suất làm việc của bơm dầu. Kiểm tra xiết chặt các bộ phận của cơ cấu thủy lực hộp số (Đối với hộp số cơ khí thủy lực).', 'Kiểm tra điều chỉnh áp suất làm việc của bơm dầu. Kiểm tra xiết chặt các bộ phận của cơ cấu thủy lực hộp số (Đối với hộp số cơ khí thủy lực).', '5', '3', 2, NULL, 2),
(681, 335, 'Kiểm tra tác dụng và điều chỉnh phanh tay. Xiết chặt các bu lông giá đỡ phanh tay.', 'Kiểm tra tác dụng và điều chỉnh phanh tay. Xiết chặt các bu lông giá đỡ phanh tay.', '5', '6', 12, NULL, 2),
(682, 335, 'Kiểm tra tác dụng và điều chỉnh phanh tay. Xiết chặt các bu lông giá đỡ phanh tay.', 'Kiểm tra tác dụng và điều chỉnh phanh tay. Xiết chặt các bu lông giá đỡ phanh tay.', '5', '6', 10, NULL, 2),
(683, 335, 'Kiểm tra tác dụng và điều chỉnh phanh tay. Xiết chặt các bu lông giá đỡ phanh tay.', 'Kiểm tra tác dụng và điều chỉnh phanh tay. Xiết chặt các bu lông giá đỡ phanh tay.', '5', '6', 8, NULL, 2),
(684, 335, 'Kiểm tra tác dụng và điều chỉnh phanh tay. Xiết chặt các bu lông giá đỡ phanh tay.', 'Kiểm tra tác dụng và điều chỉnh phanh tay. Xiết chặt các bu lông giá đỡ phanh tay.', '5', '0', 14, NULL, 2),
(685, 335, 'Kiểm tra tác dụng và điều chỉnh phanh tay. Xiết chặt các bu lông giá đỡ phanh tay.', 'Kiểm tra tác dụng và điều chỉnh phanh tay. Xiết chặt các bu lông giá đỡ phanh tay.', '5', '4', 16, NULL, 2),
(686, 335, 'Kiểm tra tác dụng và điều chỉnh phanh tay. Xiết chặt các bu lông giá đỡ phanh tay.', 'Kiểm tra tác dụng và điều chỉnh phanh tay. Xiết chặt các bu lông giá đỡ phanh tay.', '5', '4', 6, NULL, 2),
(687, 335, 'Kiểm tra tác dụng và điều chỉnh phanh tay. Xiết chặt các bu lông giá đỡ phanh tay.', 'Kiểm tra tác dụng và điều chỉnh phanh tay. Xiết chặt các bu lông giá đỡ phanh tay.', '5', '5', 4, NULL, 2),
(688, 335, 'Kiểm tra tác dụng và điều chỉnh phanh tay. Xiết chặt các bu lông giá đỡ phanh tay.', 'Kiểm tra tác dụng và điều chỉnh phanh tay. Xiết chặt các bu lông giá đỡ phanh tay.', '5', '6', 2, NULL, 2),
(689, 335, 'Xả dầu, vệ sinh thay mới', 'Xả dầu, vệ sinh thay mới', '4', '0', 12, NULL, 2),
(690, 335, 'Xả dầu, vệ sinh thay mới', 'Xả dầu, vệ sinh thay mới', '4', '0', 10, NULL, 2),
(691, 335, 'Xả dầu, vệ sinh thay mới', 'Xả dầu, vệ sinh thay mới', '4', '0', 8, NULL, 2),
(692, 335, 'Xả dầu, vệ sinh thay mới', 'Xả dầu, vệ sinh thay mới', '4', '0', 14, NULL, 2),
(693, 335, 'Xả dầu, vệ sinh thay mới', 'Xả dầu, vệ sinh thay mới', '4', '0', 16, NULL, 2),
(694, 335, 'Xả dầu, vệ sinh thay mới', 'Xả dầu, vệ sinh thay mới', '4', '0.5', 6, NULL, 2),
(695, 335, 'Xả dầu, vệ sinh thay mới', 'Xả dầu, vệ sinh thay mới', '4', '0.5', 4, NULL, 2),
(696, 335, 'Xả dầu, vệ sinh thay mới', 'Xả dầu, vệ sinh thay mới', '4', '0.5', 2, NULL, 2),
(697, 335, 'Kiểm tra bảo dưỡng toàn bộ ruột cầu', 'Kiểm tra bảo dưỡng toàn bộ ruột cầu', '4', '0', 12, NULL, 2),
(698, 335, 'Kiểm tra bảo dưỡng toàn bộ ruột cầu', 'Kiểm tra bảo dưỡng toàn bộ ruột cầu', '4', '0', 10, NULL, 2),
(699, 335, 'Kiểm tra bảo dưỡng toàn bộ ruột cầu', 'Kiểm tra bảo dưỡng toàn bộ ruột cầu', '4', '0', 8, NULL, 2),
(700, 335, 'Kiểm tra bảo dưỡng toàn bộ ruột cầu', 'Kiểm tra bảo dưỡng toàn bộ ruột cầu', '4', '0', 14, NULL, 2),
(701, 335, 'Kiểm tra bảo dưỡng toàn bộ ruột cầu', 'Kiểm tra bảo dưỡng toàn bộ ruột cầu', '4', '0', 16, NULL, 2),
(702, 335, 'Kiểm tra bảo dưỡng toàn bộ ruột cầu', 'Kiểm tra bảo dưỡng toàn bộ ruột cầu', '4', '4', 6, NULL, 2),
(703, 335, 'Kiểm tra bảo dưỡng toàn bộ ruột cầu', 'Kiểm tra bảo dưỡng toàn bộ ruột cầu', '4', '6', 4, NULL, 2),
(704, 335, 'Kiểm tra bảo dưỡng toàn bộ ruột cầu', 'Kiểm tra bảo dưỡng toàn bộ ruột cầu', '4', '8', 2, NULL, 2),
(705, 335, 'Kiểm tra điều chỉnh độ dơ của các cặp bánh răng ăn khớp.', 'Kiểm tra điều chỉnh độ dơ của các cặp bánh răng ăn khớp.', '5', '0', 12, NULL, 2),
(706, 335, 'Kiểm tra điều chỉnh độ dơ của các cặp bánh răng ăn khớp.', 'Kiểm tra điều chỉnh độ dơ của các cặp bánh răng ăn khớp.', '5', '0', 10, NULL, 2),
(707, 335, 'Kiểm tra điều chỉnh độ dơ của các cặp bánh răng ăn khớp.', 'Kiểm tra điều chỉnh độ dơ của các cặp bánh răng ăn khớp.', '5', '0', 8, NULL, 2),
(708, 335, 'Kiểm tra điều chỉnh độ dơ của các cặp bánh răng ăn khớp.', 'Kiểm tra điều chỉnh độ dơ của các cặp bánh răng ăn khớp.', '5', '0', 14, NULL, 2),
(709, 335, 'Kiểm tra điều chỉnh độ dơ của các cặp bánh răng ăn khớp.', 'Kiểm tra điều chỉnh độ dơ của các cặp bánh răng ăn khớp.', '5', '0', 16, NULL, 2),
(710, 335, 'Kiểm tra điều chỉnh độ dơ của các cặp bánh răng ăn khớp.', 'Kiểm tra điều chỉnh độ dơ của các cặp bánh răng ăn khớp.', '5', '4', 6, NULL, 2),
(711, 335, 'Kiểm tra điều chỉnh độ dơ của các cặp bánh răng ăn khớp.', 'Kiểm tra điều chỉnh độ dơ của các cặp bánh răng ăn khớp.', '5', '6', 4, NULL, 2),
(712, 335, 'Kiểm tra điều chỉnh độ dơ của các cặp bánh răng ăn khớp.', 'Kiểm tra điều chỉnh độ dơ của các cặp bánh răng ăn khớp.', '5', '8', 2, NULL, 2),
(713, 335, 'Điều chỉnh độ dơ dọc trục', 'Điều chỉnh độ dơ dọc trục', '5', '0', 12, NULL, 2),
(714, 335, 'Điều chỉnh độ dơ dọc trục', 'Điều chỉnh độ dơ dọc trục', '5', '0', 10, NULL, 2),
(715, 335, 'Điều chỉnh độ dơ dọc trục', 'Điều chỉnh độ dơ dọc trục', '5', '0', 8, NULL, 2),
(716, 335, 'Điều chỉnh độ dơ dọc trục', 'Điều chỉnh độ dơ dọc trục', '5', '0', 14, NULL, 2),
(717, 335, 'Điều chỉnh độ dơ dọc trục', 'Điều chỉnh độ dơ dọc trục', '5', '0', 16, NULL, 2),
(718, 335, 'Điều chỉnh độ dơ dọc trục', 'Điều chỉnh độ dơ dọc trục', '5', '4', 6, NULL, 2),
(719, 335, 'Điều chỉnh độ dơ dọc trục', 'Điều chỉnh độ dơ dọc trục', '5', '6', 4, NULL, 2),
(720, 335, 'Điều chỉnh độ dơ dọc trục', 'Điều chỉnh độ dơ dọc trục', '5', '8', 2, NULL, 2),
(721, 335, 'Kiểm tra tình trạng dầm trục trước, kiểm tra điều chỉnh độ chụm bánh xe.', 'Kiểm tra tình trạng dầm trục trước, kiểm tra điều chỉnh độ chụm bánh xe.', '5', '2', 12, NULL, 2),
(722, 335, 'Kiểm tra tình trạng dầm trục trước, kiểm tra điều chỉnh độ chụm bánh xe.', 'Kiểm tra tình trạng dầm trục trước, kiểm tra điều chỉnh độ chụm bánh xe.', '5', '2', 10, NULL, 2),
(723, 335, 'Kiểm tra tình trạng dầm trục trước, kiểm tra điều chỉnh độ chụm bánh xe.', 'Kiểm tra tình trạng dầm trục trước, kiểm tra điều chỉnh độ chụm bánh xe.', '5', '2.5', 8, NULL, 2),
(724, 335, 'Kiểm tra tình trạng dầm trục trước, kiểm tra điều chỉnh độ chụm bánh xe.', 'Kiểm tra tình trạng dầm trục trước, kiểm tra điều chỉnh độ chụm bánh xe.', '5', '0', 14, NULL, 2),
(725, 335, 'Kiểm tra tình trạng dầm trục trước, kiểm tra điều chỉnh độ chụm bánh xe.', 'Kiểm tra tình trạng dầm trục trước, kiểm tra điều chỉnh độ chụm bánh xe.', '5', '0', 16, NULL, 2),
(726, 335, 'Kiểm tra tình trạng dầm trục trước, kiểm tra điều chỉnh độ chụm bánh xe.', 'Kiểm tra tình trạng dầm trục trước, kiểm tra điều chỉnh độ chụm bánh xe.', '5', '1.5', 6, NULL, 2),
(727, 335, 'Kiểm tra tình trạng dầm trục trước, kiểm tra điều chỉnh độ chụm bánh xe.', 'Kiểm tra tình trạng dầm trục trước, kiểm tra điều chỉnh độ chụm bánh xe.', '5', '2', 4, NULL, 2);
INSERT INTO `c_repair_labor` (`C_REPAIR_LABOR_ID`, `PARENT_ID`, `CODE`, `NAME`, `LEVEL_LABOR`, `QUOTA`, `C_REPAIR_TYPE_ID`, `DECREASE_RATE`, `MAINTAIN_TYPE`) VALUES
(728, 335, 'Kiểm tra tình trạng dầm trục trước, kiểm tra điều chỉnh độ chụm bánh xe.', 'Kiểm tra tình trạng dầm trục trước, kiểm tra điều chỉnh độ chụm bánh xe.', '5', '2.5', 2, NULL, 2),
(729, 335, 'Kiểm tra tình trạng và sự rò rỉ hộp tay lái, trợ lực lái, bơm dầu trợ lực lái.', 'Kiểm tra tình trạng và sự rò rỉ hộp tay lái, trợ lực lái, bơm dầu trợ lực lái.', '4', '1', 12, NULL, 2),
(730, 335, 'Kiểm tra tình trạng và sự rò rỉ hộp tay lái, trợ lực lái, bơm dầu trợ lực lái.', 'Kiểm tra tình trạng và sự rò rỉ hộp tay lái, trợ lực lái, bơm dầu trợ lực lái.', '4', '1', 10, NULL, 2),
(731, 335, 'Kiểm tra tình trạng và sự rò rỉ hộp tay lái, trợ lực lái, bơm dầu trợ lực lái.', 'Kiểm tra tình trạng và sự rò rỉ hộp tay lái, trợ lực lái, bơm dầu trợ lực lái.', '4', '1.5', 8, NULL, 2),
(732, 335, 'Kiểm tra tình trạng và sự rò rỉ hộp tay lái, trợ lực lái, bơm dầu trợ lực lái.', 'Kiểm tra tình trạng và sự rò rỉ hộp tay lái, trợ lực lái, bơm dầu trợ lực lái.', '4', '0', 14, NULL, 2),
(733, 335, 'Kiểm tra tình trạng và sự rò rỉ hộp tay lái, trợ lực lái, bơm dầu trợ lực lái.', 'Kiểm tra tình trạng và sự rò rỉ hộp tay lái, trợ lực lái, bơm dầu trợ lực lái.', '4', '0', 16, NULL, 2),
(734, 335, 'Kiểm tra tình trạng và sự rò rỉ hộp tay lái, trợ lực lái, bơm dầu trợ lực lái.', 'Kiểm tra tình trạng và sự rò rỉ hộp tay lái, trợ lực lái, bơm dầu trợ lực lái.', '4', '0.5', 6, NULL, 2),
(735, 335, 'Kiểm tra tình trạng và sự rò rỉ hộp tay lái, trợ lực lái, bơm dầu trợ lực lái.', 'Kiểm tra tình trạng và sự rò rỉ hộp tay lái, trợ lực lái, bơm dầu trợ lực lái.', '4', '1', 4, NULL, 2),
(736, 335, 'Kiểm tra tình trạng và sự rò rỉ hộp tay lái, trợ lực lái, bơm dầu trợ lực lái.', 'Kiểm tra tình trạng và sự rò rỉ hộp tay lái, trợ lực lái, bơm dầu trợ lực lái.', '4', '1.5', 2, NULL, 2),
(737, 335, 'Kiểm tra xiết chặt ê cu, bu lông bắt vành tay lái, giá đỡ trục tay lái, hộp tay lái, bơm dầu trợ lực, tuy ô ắc phi dê và lơ via tay lái', 'Kiểm tra xiết chặt ê cu, bu lông bắt vành tay lái, giá đỡ trục tay lái, hộp tay lái, bơm dầu trợ lực, tuy ô ắc phi dê và lơ via tay lái', '4', '4', 12, NULL, 2),
(738, 335, 'Kiểm tra xiết chặt ê cu, bu lông bắt vành tay lái, giá đỡ trục tay lái, hộp tay lái, bơm dầu trợ lực, tuy ô ắc phi dê và lơ via tay lái', 'Kiểm tra xiết chặt ê cu, bu lông bắt vành tay lái, giá đỡ trục tay lái, hộp tay lái, bơm dầu trợ lực, tuy ô ắc phi dê và lơ via tay lái', '4', '0', 10, NULL, 2),
(739, 335, 'Kiểm tra xiết chặt ê cu, bu lông bắt vành tay lái, giá đỡ trục tay lái, hộp tay lái, bơm dầu trợ lực, tuy ô ắc phi dê và lơ via tay lái', 'Kiểm tra xiết chặt ê cu, bu lông bắt vành tay lái, giá đỡ trục tay lái, hộp tay lái, bơm dầu trợ lực, tuy ô ắc phi dê và lơ via tay lái', '4', '5', 8, NULL, 2),
(740, 335, 'Kiểm tra xiết chặt ê cu, bu lông bắt vành tay lái, giá đỡ trục tay lái, hộp tay lái, bơm dầu trợ lực, tuy ô ắc phi dê và lơ via tay lái', 'Kiểm tra xiết chặt ê cu, bu lông bắt vành tay lái, giá đỡ trục tay lái, hộp tay lái, bơm dầu trợ lực, tuy ô ắc phi dê và lơ via tay lái', '4', '0', 14, NULL, 2),
(741, 335, 'Kiểm tra xiết chặt ê cu, bu lông bắt vành tay lái, giá đỡ trục tay lái, hộp tay lái, bơm dầu trợ lực, tuy ô ắc phi dê và lơ via tay lái', 'Kiểm tra xiết chặt ê cu, bu lông bắt vành tay lái, giá đỡ trục tay lái, hộp tay lái, bơm dầu trợ lực, tuy ô ắc phi dê và lơ via tay lái', '4', '0', 16, NULL, 2),
(742, 335, 'Kiểm tra xiết chặt ê cu, bu lông bắt vành tay lái, giá đỡ trục tay lái, hộp tay lái, bơm dầu trợ lực, tuy ô ắc phi dê và lơ via tay lái', 'Kiểm tra xiết chặt ê cu, bu lông bắt vành tay lái, giá đỡ trục tay lái, hộp tay lái, bơm dầu trợ lực, tuy ô ắc phi dê và lơ via tay lái', '4', '3.5', 6, NULL, 2),
(743, 335, 'Kiểm tra xiết chặt ê cu, bu lông bắt vành tay lái, giá đỡ trục tay lái, hộp tay lái, bơm dầu trợ lực, tuy ô ắc phi dê và lơ via tay lái', 'Kiểm tra xiết chặt ê cu, bu lông bắt vành tay lái, giá đỡ trục tay lái, hộp tay lái, bơm dầu trợ lực, tuy ô ắc phi dê và lơ via tay lái', '4', '4', 4, NULL, 2),
(744, 335, 'Kiểm tra xiết chặt ê cu, bu lông bắt vành tay lái, giá đỡ trục tay lái, hộp tay lái, bơm dầu trợ lực, tuy ô ắc phi dê và lơ via tay lái', 'Kiểm tra xiết chặt ê cu, bu lông bắt vành tay lái, giá đỡ trục tay lái, hộp tay lái, bơm dầu trợ lực, tuy ô ắc phi dê và lơ via tay lái', '4', '5', 2, NULL, 2),
(745, 335, 'Kiểm tra tình trạng các đòn dọc, đòn ngang của hệ thống lái, rô tuyn, ba ngang, ba dọc.', 'Kiểm tra tình trạng các đòn dọc, đòn ngang của hệ thống lái, rô tuyn, ba ngang, ba dọc.', '5', '1.5', 12, NULL, 2),
(746, 335, 'Kiểm tra tình trạng các đòn dọc, đòn ngang của hệ thống lái, rô tuyn, ba ngang, ba dọc.', 'Kiểm tra tình trạng các đòn dọc, đòn ngang của hệ thống lái, rô tuyn, ba ngang, ba dọc.', '5', '0', 10, NULL, 2),
(747, 335, 'Kiểm tra tình trạng các đòn dọc, đòn ngang của hệ thống lái, rô tuyn, ba ngang, ba dọc.', 'Kiểm tra tình trạng các đòn dọc, đòn ngang của hệ thống lái, rô tuyn, ba ngang, ba dọc.', '5', '2', 8, NULL, 2),
(748, 335, 'Kiểm tra tình trạng các đòn dọc, đòn ngang của hệ thống lái, rô tuyn, ba ngang, ba dọc.', 'Kiểm tra tình trạng các đòn dọc, đòn ngang của hệ thống lái, rô tuyn, ba ngang, ba dọc.', '5', '0', 14, NULL, 2),
(749, 335, 'Kiểm tra tình trạng các đòn dọc, đòn ngang của hệ thống lái, rô tuyn, ba ngang, ba dọc.', 'Kiểm tra tình trạng các đòn dọc, đòn ngang của hệ thống lái, rô tuyn, ba ngang, ba dọc.', '5', '0', 16, NULL, 2),
(750, 335, 'Kiểm tra tình trạng các đòn dọc, đòn ngang của hệ thống lái, rô tuyn, ba ngang, ba dọc.', 'Kiểm tra tình trạng các đòn dọc, đòn ngang của hệ thống lái, rô tuyn, ba ngang, ba dọc.', '5', '1', 6, NULL, 2),
(751, 335, 'Kiểm tra tình trạng các đòn dọc, đòn ngang của hệ thống lái, rô tuyn, ba ngang, ba dọc.', 'Kiểm tra tình trạng các đòn dọc, đòn ngang của hệ thống lái, rô tuyn, ba ngang, ba dọc.', '5', '1.5', 4, NULL, 2),
(752, 335, 'Kiểm tra tình trạng các đòn dọc, đòn ngang của hệ thống lái, rô tuyn, ba ngang, ba dọc.', 'Kiểm tra tình trạng các đòn dọc, đòn ngang của hệ thống lái, rô tuyn, ba ngang, ba dọc.', '5', '2', 2, NULL, 2),
(753, 335, 'Kiểm tra và điều chỉnh hành trình tự do vành tay lái, độ ro khớp nối rô tuyn và ắc phi dê, góc quay tay lái và độ an toàn của hệ thống lái./Cơ cấu lái đối với máy bánh xích', 'Kiểm tra và điều chỉnh hành trình tự do vành tay lái, độ ro khớp nối rô tuyn và ắc phi dê, góc quay tay lái và độ an toàn của hệ thống lái./Cơ cấu lái đối với máy bánh xích', '5', '2.5', 12, NULL, 2),
(754, 335, 'Kiểm tra và điều chỉnh hành trình tự do vành tay lái, độ ro khớp nối rô tuyn và ắc phi dê, góc quay tay lái và độ an toàn của hệ thống lái./Cơ cấu lái đối với máy bánh xích', 'Kiểm tra và điều chỉnh hành trình tự do vành tay lái, độ ro khớp nối rô tuyn và ắc phi dê, góc quay tay lái và độ an toàn của hệ thống lái./Cơ cấu lái đối với máy bánh xích', '5', '2.5', 10, NULL, 2),
(755, 335, 'Kiểm tra và điều chỉnh hành trình tự do vành tay lái, độ ro khớp nối rô tuyn và ắc phi dê, góc quay tay lái và độ an toàn của hệ thống lái./Cơ cấu lái đối với máy bánh xích', 'Kiểm tra và điều chỉnh hành trình tự do vành tay lái, độ ro khớp nối rô tuyn và ắc phi dê, góc quay tay lái và độ an toàn của hệ thống lái./Cơ cấu lái đối với máy bánh xích', '5', '3', 8, NULL, 2),
(756, 335, 'Kiểm tra và điều chỉnh hành trình tự do vành tay lái, độ ro khớp nối rô tuyn và ắc phi dê, góc quay tay lái và độ an toàn của hệ thống lái./Cơ cấu lái đối với máy bánh xích', 'Kiểm tra và điều chỉnh hành trình tự do vành tay lái, độ ro khớp nối rô tuyn và ắc phi dê, góc quay tay lái và độ an toàn của hệ thống lái./Cơ cấu lái đối với máy bánh xích', '5', '0', 14, NULL, 2),
(757, 335, 'Kiểm tra và điều chỉnh hành trình tự do vành tay lái, độ ro khớp nối rô tuyn và ắc phi dê, góc quay tay lái và độ an toàn của hệ thống lái./Cơ cấu lái đối với máy bánh xích', 'Kiểm tra và điều chỉnh hành trình tự do vành tay lái, độ ro khớp nối rô tuyn và ắc phi dê, góc quay tay lái và độ an toàn của hệ thống lái./Cơ cấu lái đối với máy bánh xích', '5', '0', 16, NULL, 2),
(758, 335, 'Kiểm tra và điều chỉnh hành trình tự do vành tay lái, độ ro khớp nối rô tuyn và ắc phi dê, góc quay tay lái và độ an toàn của hệ thống lái./Cơ cấu lái đối với máy bánh xích', 'Kiểm tra và điều chỉnh hành trình tự do vành tay lái, độ ro khớp nối rô tuyn và ắc phi dê, góc quay tay lái và độ an toàn của hệ thống lái./Cơ cấu lái đối với máy bánh xích', '5', '2', 6, NULL, 2),
(759, 335, 'Kiểm tra và điều chỉnh hành trình tự do vành tay lái, độ ro khớp nối rô tuyn và ắc phi dê, góc quay tay lái và độ an toàn của hệ thống lái./Cơ cấu lái đối với máy bánh xích', 'Kiểm tra và điều chỉnh hành trình tự do vành tay lái, độ ro khớp nối rô tuyn và ắc phi dê, góc quay tay lái và độ an toàn của hệ thống lái./Cơ cấu lái đối với máy bánh xích', '5', '2.5', 4, NULL, 2),
(760, 335, 'Kiểm tra và điều chỉnh hành trình tự do vành tay lái, độ ro khớp nối rô tuyn và ắc phi dê, góc quay tay lái và độ an toàn của hệ thống lái./Cơ cấu lái đối với máy bánh xích', 'Kiểm tra và điều chỉnh hành trình tự do vành tay lái, độ ro khớp nối rô tuyn và ắc phi dê, góc quay tay lái và độ an toàn của hệ thống lái./Cơ cấu lái đối với máy bánh xích', '5', '3', 2, NULL, 2),
(761, 335, 'Kiểm tra sự làm việc của cơ cấu trợ lực lái, bổ sung dầu và hộp tay lái hoặc bình chứa dầu của hệ thống trợ lực lái nếu thiếu. Bơm mỡ vào các khớp chuyển động của hệ thống lái.', 'Kiểm tra sự làm việc của cơ cấu trợ lực lái, bổ sung dầu và hộp tay lái hoặc bình chứa dầu của hệ thống trợ lực lái nếu thiếu. Bơm mỡ vào các khớp chuyển động của hệ thống lái.', '4', '3', 12, NULL, 2),
(762, 335, 'Kiểm tra sự làm việc của cơ cấu trợ lực lái, bổ sung dầu và hộp tay lái hoặc bình chứa dầu của hệ thống trợ lực lái nếu thiếu. Bơm mỡ vào các khớp chuyển động của hệ thống lái.', 'Kiểm tra sự làm việc của cơ cấu trợ lực lái, bổ sung dầu và hộp tay lái hoặc bình chứa dầu của hệ thống trợ lực lái nếu thiếu. Bơm mỡ vào các khớp chuyển động của hệ thống lái.', '4', '3', 10, NULL, 2),
(763, 335, 'Kiểm tra sự làm việc của cơ cấu trợ lực lái, bổ sung dầu và hộp tay lái hoặc bình chứa dầu của hệ thống trợ lực lái nếu thiếu. Bơm mỡ vào các khớp chuyển động của hệ thống lái.', 'Kiểm tra sự làm việc của cơ cấu trợ lực lái, bổ sung dầu và hộp tay lái hoặc bình chứa dầu của hệ thống trợ lực lái nếu thiếu. Bơm mỡ vào các khớp chuyển động của hệ thống lái.', '4', '4', 8, NULL, 2),
(764, 335, 'Kiểm tra sự làm việc của cơ cấu trợ lực lái, bổ sung dầu và hộp tay lái hoặc bình chứa dầu của hệ thống trợ lực lái nếu thiếu. Bơm mỡ vào các khớp chuyển động của hệ thống lái.', 'Kiểm tra sự làm việc của cơ cấu trợ lực lái, bổ sung dầu và hộp tay lái hoặc bình chứa dầu của hệ thống trợ lực lái nếu thiếu. Bơm mỡ vào các khớp chuyển động của hệ thống lái.', '4', '0', 14, NULL, 2),
(765, 335, 'Kiểm tra sự làm việc của cơ cấu trợ lực lái, bổ sung dầu và hộp tay lái hoặc bình chứa dầu của hệ thống trợ lực lái nếu thiếu. Bơm mỡ vào các khớp chuyển động của hệ thống lái.', 'Kiểm tra sự làm việc của cơ cấu trợ lực lái, bổ sung dầu và hộp tay lái hoặc bình chứa dầu của hệ thống trợ lực lái nếu thiếu. Bơm mỡ vào các khớp chuyển động của hệ thống lái.', '4', '0', 16, NULL, 2),
(766, 335, 'Kiểm tra sự làm việc của cơ cấu trợ lực lái, bổ sung dầu và hộp tay lái hoặc bình chứa dầu của hệ thống trợ lực lái nếu thiếu. Bơm mỡ vào các khớp chuyển động của hệ thống lái.', 'Kiểm tra sự làm việc của cơ cấu trợ lực lái, bổ sung dầu và hộp tay lái hoặc bình chứa dầu của hệ thống trợ lực lái nếu thiếu. Bơm mỡ vào các khớp chuyển động của hệ thống lái.', '4', '2.5', 6, NULL, 2),
(767, 335, 'Kiểm tra sự làm việc của cơ cấu trợ lực lái, bổ sung dầu và hộp tay lái hoặc bình chứa dầu của hệ thống trợ lực lái nếu thiếu. Bơm mỡ vào các khớp chuyển động của hệ thống lái.', 'Kiểm tra sự làm việc của cơ cấu trợ lực lái, bổ sung dầu và hộp tay lái hoặc bình chứa dầu của hệ thống trợ lực lái nếu thiếu. Bơm mỡ vào các khớp chuyển động của hệ thống lái.', '4', '3', 4, NULL, 2),
(768, 335, 'Kiểm tra sự làm việc của cơ cấu trợ lực lái, bổ sung dầu và hộp tay lái hoặc bình chứa dầu của hệ thống trợ lực lái nếu thiếu. Bơm mỡ vào các khớp chuyển động của hệ thống lái.', 'Kiểm tra sự làm việc của cơ cấu trợ lực lái, bổ sung dầu và hộp tay lái hoặc bình chứa dầu của hệ thống trợ lực lái nếu thiếu. Bơm mỡ vào các khớp chuyển động của hệ thống lái.', '4', '4', 2, NULL, 2),
(769, 337, 'Kiểm tra toàn bộ hệ thống điện', 'Kiểm tra toàn bộ hệ thống điện', '4', '4', 12, NULL, 2),
(770, 337, 'Kiểm tra toàn bộ hệ thống điện', 'Kiểm tra toàn bộ hệ thống điện', '4', '5', 10, NULL, 2),
(771, 337, 'Kiểm tra toàn bộ hệ thống điện', 'Kiểm tra toàn bộ hệ thống điện', '4', '5', 8, NULL, 2),
(772, 337, 'Kiểm tra toàn bộ hệ thống điện', 'Kiểm tra toàn bộ hệ thống điện', '4', '3', 14, NULL, 2),
(773, 337, 'Kiểm tra toàn bộ hệ thống điện', 'Kiểm tra toàn bộ hệ thống điện', '4', '0', 16, NULL, 2),
(774, 337, 'Kiểm tra toàn bộ hệ thống điện', 'Kiểm tra toàn bộ hệ thống điện', '4', '3', 6, NULL, 2),
(775, 337, 'Kiểm tra toàn bộ hệ thống điện', 'Kiểm tra toàn bộ hệ thống điện', '4', '4', 4, NULL, 2),
(776, 337, 'Kiểm tra toàn bộ hệ thống điện', 'Kiểm tra toàn bộ hệ thống điện', '4', '5', 2, NULL, 2),
(777, 337, 'Kiểm tra bảo dưỡng máy đề, rơ le đề', 'Kiểm tra bảo dưỡng máy đề, rơ le đề', '5', '5', 12, NULL, 2),
(778, 337, 'Kiểm tra bảo dưỡng máy đề, rơ le đề', 'Kiểm tra bảo dưỡng máy đề, rơ le đề', '5', '6', 10, NULL, 2),
(779, 337, 'Kiểm tra bảo dưỡng máy đề, rơ le đề', 'Kiểm tra bảo dưỡng máy đề, rơ le đề', '5', '6', 8, NULL, 2),
(780, 337, 'Kiểm tra bảo dưỡng máy đề, rơ le đề', 'Kiểm tra bảo dưỡng máy đề, rơ le đề', '5', '3', 14, NULL, 2),
(781, 337, 'Kiểm tra bảo dưỡng máy đề, rơ le đề', 'Kiểm tra bảo dưỡng máy đề, rơ le đề', '5', '2', 16, NULL, 2),
(782, 337, 'Kiểm tra bảo dưỡng máy đề, rơ le đề', 'Kiểm tra bảo dưỡng máy đề, rơ le đề', '5', '3', 6, NULL, 2),
(783, 337, 'Kiểm tra bảo dưỡng máy đề, rơ le đề', 'Kiểm tra bảo dưỡng máy đề, rơ le đề', '5', '5', 4, NULL, 2),
(784, 337, 'Kiểm tra bảo dưỡng máy đề, rơ le đề', 'Kiểm tra bảo dưỡng máy đề, rơ le đề', '5', '6', 2, NULL, 2),
(785, 337, 'Kiểm tra bảo dưỡng mô tơ cần gạt nước', 'Kiểm tra bảo dưỡng mô tơ cần gạt nước', '5', '2.5', 12, NULL, 2),
(786, 337, 'Kiểm tra bảo dưỡng mô tơ cần gạt nước', 'Kiểm tra bảo dưỡng mô tơ cần gạt nước', '5', '3', 10, NULL, 2),
(787, 337, 'Kiểm tra bảo dưỡng mô tơ cần gạt nước', 'Kiểm tra bảo dưỡng mô tơ cần gạt nước', '5', '3', 8, NULL, 2),
(788, 337, 'Kiểm tra bảo dưỡng mô tơ cần gạt nước', 'Kiểm tra bảo dưỡng mô tơ cần gạt nước', '5', '3', 14, NULL, 2),
(789, 337, 'Kiểm tra bảo dưỡng mô tơ cần gạt nước', 'Kiểm tra bảo dưỡng mô tơ cần gạt nước', '5', '0', 16, NULL, 2),
(790, 337, 'Kiểm tra bảo dưỡng mô tơ cần gạt nước', 'Kiểm tra bảo dưỡng mô tơ cần gạt nước', '5', '3', 6, NULL, 2),
(791, 337, 'Kiểm tra bảo dưỡng mô tơ cần gạt nước', 'Kiểm tra bảo dưỡng mô tơ cần gạt nước', '5', '2.5', 4, NULL, 2),
(792, 337, 'Kiểm tra bảo dưỡng mô tơ cần gạt nước', 'Kiểm tra bảo dưỡng mô tơ cần gạt nước', '5', '3', 2, NULL, 2),
(793, 337, 'Kiểm tra bảo dưỡng máy phát', 'Kiểm tra bảo dưỡng máy phát', '5', '3', 12, NULL, 2),
(794, 337, 'Kiểm tra bảo dưỡng máy phát', 'Kiểm tra bảo dưỡng máy phát', '5', '4', 10, NULL, 2),
(795, 337, 'Kiểm tra bảo dưỡng máy phát', 'Kiểm tra bảo dưỡng máy phát', '5', '4', 8, NULL, 2),
(796, 337, 'Kiểm tra bảo dưỡng máy phát', 'Kiểm tra bảo dưỡng máy phát', '5', '3', 14, NULL, 2),
(797, 337, 'Kiểm tra bảo dưỡng máy phát', 'Kiểm tra bảo dưỡng máy phát', '5', '2', 16, NULL, 2),
(798, 337, 'Kiểm tra bảo dưỡng máy phát', 'Kiểm tra bảo dưỡng máy phát', '5', '3', 6, NULL, 2),
(799, 337, 'Kiểm tra bảo dưỡng máy phát', 'Kiểm tra bảo dưỡng máy phát', '5', '3', 4, NULL, 2),
(800, 337, 'Kiểm tra bảo dưỡng máy phát', 'Kiểm tra bảo dưỡng máy phát', '5', '4', 2, NULL, 2),
(801, 337, 'Bảo dưỡng, bổ sung dung dịch và nạp bổ sung bình điện', 'Bảo dưỡng, bổ sung dung dịch và nạp bổ sung bình điện', '4', '7', 12, NULL, 2),
(802, 337, 'Bảo dưỡng, bổ sung dung dịch và nạp bổ sung bình điện', 'Bảo dưỡng, bổ sung dung dịch và nạp bổ sung bình điện', '4', '8', 10, NULL, 2),
(803, 337, 'Bảo dưỡng, bổ sung dung dịch và nạp bổ sung bình điện', 'Bảo dưỡng, bổ sung dung dịch và nạp bổ sung bình điện', '4', '8', 8, NULL, 2),
(804, 337, 'Bảo dưỡng, bổ sung dung dịch và nạp bổ sung bình điện', 'Bảo dưỡng, bổ sung dung dịch và nạp bổ sung bình điện', '4', '6', 14, NULL, 2),
(805, 337, 'Bảo dưỡng, bổ sung dung dịch và nạp bổ sung bình điện', 'Bảo dưỡng, bổ sung dung dịch và nạp bổ sung bình điện', '4', '3', 16, NULL, 2),
(806, 337, 'Bảo dưỡng, bổ sung dung dịch và nạp bổ sung bình điện', 'Bảo dưỡng, bổ sung dung dịch và nạp bổ sung bình điện', '4', '6', 6, NULL, 2),
(807, 337, 'Bảo dưỡng, bổ sung dung dịch và nạp bổ sung bình điện', 'Bảo dưỡng, bổ sung dung dịch và nạp bổ sung bình điện', '4', '7', 4, NULL, 2),
(808, 337, 'Bảo dưỡng, bổ sung dung dịch và nạp bổ sung bình điện', 'Bảo dưỡng, bổ sung dung dịch và nạp bổ sung bình điện', '4', '8', 2, NULL, 2),
(809, 337, 'Kiểm tra điều chỉnh hệ thống đèn chiếu sáng và đèn tín hiệu', 'Kiểm tra điều chỉnh hệ thống đèn chiếu sáng và đèn tín hiệu', '4', '2.5', 12, NULL, 2),
(810, 337, 'Kiểm tra điều chỉnh hệ thống đèn chiếu sáng và đèn tín hiệu', 'Kiểm tra điều chỉnh hệ thống đèn chiếu sáng và đèn tín hiệu', '4', '2.5', 10, NULL, 2),
(811, 337, 'Kiểm tra điều chỉnh hệ thống đèn chiếu sáng và đèn tín hiệu', 'Kiểm tra điều chỉnh hệ thống đèn chiếu sáng và đèn tín hiệu', '4', '2.5', 8, NULL, 2),
(812, 337, 'Kiểm tra điều chỉnh hệ thống đèn chiếu sáng và đèn tín hiệu', 'Kiểm tra điều chỉnh hệ thống đèn chiếu sáng và đèn tín hiệu', '4', '2', 14, NULL, 2),
(813, 337, 'Kiểm tra điều chỉnh hệ thống đèn chiếu sáng và đèn tín hiệu', 'Kiểm tra điều chỉnh hệ thống đèn chiếu sáng và đèn tín hiệu', '4', '0', 16, NULL, 2),
(814, 337, 'Kiểm tra điều chỉnh hệ thống đèn chiếu sáng và đèn tín hiệu', 'Kiểm tra điều chỉnh hệ thống đèn chiếu sáng và đèn tín hiệu', '4', '2', 6, NULL, 2),
(815, 337, 'Kiểm tra điều chỉnh hệ thống đèn chiếu sáng và đèn tín hiệu', 'Kiểm tra điều chỉnh hệ thống đèn chiếu sáng và đèn tín hiệu', '4', '2.5', 4, NULL, 2),
(816, 337, 'Kiểm tra điều chỉnh hệ thống đèn chiếu sáng và đèn tín hiệu', 'Kiểm tra điều chỉnh hệ thống đèn chiếu sáng và đèn tín hiệu', '4', '2.5', 2, NULL, 2),
(817, 336, 'Rửa, vệ sinh toàn bộ xe', 'Rửa, vệ sinh toàn bộ xe', '4', '4', 12, NULL, 2),
(818, 336, 'Rửa, vệ sinh toàn bộ xe', 'Rửa, vệ sinh toàn bộ xe', '4', '4', 10, NULL, 2),
(819, 336, 'Rửa, vệ sinh toàn bộ xe', 'Rửa, vệ sinh toàn bộ xe', '4', '4', 8, NULL, 2),
(820, 336, 'Rửa, vệ sinh toàn bộ xe', 'Rửa, vệ sinh toàn bộ xe', '4', '2', 14, NULL, 2),
(821, 336, 'Rửa, vệ sinh toàn bộ xe', 'Rửa, vệ sinh toàn bộ xe', '4', '2', 16, NULL, 2),
(822, 336, 'Rửa, vệ sinh toàn bộ xe', 'Rửa, vệ sinh toàn bộ xe', '4', '2', 6, NULL, 2),
(823, 336, 'Rửa, vệ sinh toàn bộ xe', 'Rửa, vệ sinh toàn bộ xe', '4', '3', 4, NULL, 2),
(824, 336, 'Rửa, vệ sinh toàn bộ xe', 'Rửa, vệ sinh toàn bộ xe', '4', '4', 2, NULL, 2),
(825, 336, 'Kiểm tra bơm mỡ, bổ sung dầu toàn bộ, xiết chặt', 'Kiểm tra bơm mỡ, bổ sung dầu toàn bộ, xiết chặt', '4', '4', 12, NULL, 2),
(826, 336, 'Kiểm tra bơm mỡ, bổ sung dầu toàn bộ, xiết chặt', 'Kiểm tra bơm mỡ, bổ sung dầu toàn bộ, xiết chặt', '4', '4', 10, NULL, 2),
(827, 336, 'Kiểm tra bơm mỡ, bổ sung dầu toàn bộ, xiết chặt', 'Kiểm tra bơm mỡ, bổ sung dầu toàn bộ, xiết chặt', '4', '4', 8, NULL, 2),
(828, 336, 'Kiểm tra bơm mỡ, bổ sung dầu toàn bộ, xiết chặt', 'Kiểm tra bơm mỡ, bổ sung dầu toàn bộ, xiết chặt', '4', '3', 14, NULL, 2),
(829, 336, 'Kiểm tra bơm mỡ, bổ sung dầu toàn bộ, xiết chặt', 'Kiểm tra bơm mỡ, bổ sung dầu toàn bộ, xiết chặt', '4', '3', 16, NULL, 2),
(830, 336, 'Kiểm tra bơm mỡ, bổ sung dầu toàn bộ, xiết chặt', 'Kiểm tra bơm mỡ, bổ sung dầu toàn bộ, xiết chặt', '4', '3', 6, NULL, 2),
(831, 336, 'Kiểm tra bơm mỡ, bổ sung dầu toàn bộ, xiết chặt', 'Kiểm tra bơm mỡ, bổ sung dầu toàn bộ, xiết chặt', '4', '3', 4, NULL, 2),
(832, 336, 'Kiểm tra bơm mỡ, bổ sung dầu toàn bộ, xiết chặt', 'Kiểm tra bơm mỡ, bổ sung dầu toàn bộ, xiết chặt', '4', '4', 2, NULL, 2),
(833, 336, 'Kiểm tra hiệu chỉnh, chạy thử xe', 'Kiểm tra hiệu chỉnh, chạy thử xe', '5', '4', 12, NULL, 2),
(834, 336, 'Kiểm tra hiệu chỉnh, chạy thử xe', 'Kiểm tra hiệu chỉnh, chạy thử xe', '5', '4', 10, NULL, 2),
(835, 336, 'Kiểm tra hiệu chỉnh, chạy thử xe', 'Kiểm tra hiệu chỉnh, chạy thử xe', '5', '4', 8, NULL, 2),
(836, 336, 'Kiểm tra hiệu chỉnh, chạy thử xe', 'Kiểm tra hiệu chỉnh, chạy thử xe', '5', '2', 14, NULL, 2),
(837, 336, 'Kiểm tra hiệu chỉnh, chạy thử xe', 'Kiểm tra hiệu chỉnh, chạy thử xe', '5', '2', 16, NULL, 2),
(838, 336, 'Kiểm tra hiệu chỉnh, chạy thử xe', 'Kiểm tra hiệu chỉnh, chạy thử xe', '5', '2', 6, NULL, 2),
(839, 336, 'Kiểm tra hiệu chỉnh, chạy thử xe', 'Kiểm tra hiệu chỉnh, chạy thử xe', '5', '3', 4, NULL, 2),
(840, 336, 'Kiểm tra hiệu chỉnh, chạy thử xe', 'Kiểm tra hiệu chỉnh, chạy thử xe', '5', '4', 2, NULL, 2),
(841, 336, 'Phục vụ kiểm tra toàn bộ', 'Phục vụ kiểm tra toàn bộ', '4', '3', 12, NULL, 2),
(842, 336, 'Phục vụ kiểm tra toàn bộ', 'Phục vụ kiểm tra toàn bộ', '4', '3', 10, NULL, 2),
(843, 336, 'Phục vụ kiểm tra toàn bộ', 'Phục vụ kiểm tra toàn bộ', '4', '3', 8, NULL, 2),
(844, 336, 'Phục vụ kiểm tra toàn bộ', 'Phục vụ kiểm tra toàn bộ', '4', '2', 14, NULL, 2),
(845, 336, 'Phục vụ kiểm tra toàn bộ', 'Phục vụ kiểm tra toàn bộ', '4', '2', 16, NULL, 2),
(846, 336, 'Phục vụ kiểm tra toàn bộ', 'Phục vụ kiểm tra toàn bộ', '4', '2', 6, NULL, 2),
(847, 336, 'Phục vụ kiểm tra toàn bộ', 'Phục vụ kiểm tra toàn bộ', '4', '3', 4, NULL, 2),
(848, 336, 'Phục vụ kiểm tra toàn bộ', 'Phục vụ kiểm tra toàn bộ', '4', '3', 2, NULL, 2),
(849, 336, 'Bàn giao xe vào xưởng', 'Bàn giao xe vào xưởng', '5', '3', 12, NULL, 2),
(850, 336, 'Bàn giao xe vào xưởng', 'Bàn giao xe vào xưởng', '5', '3', 10, NULL, 2),
(851, 336, 'Bàn giao xe vào xưởng', 'Bàn giao xe vào xưởng', '5', '3', 8, NULL, 2),
(852, 336, 'Bàn giao xe vào xưởng', 'Bàn giao xe vào xưởng', '5', '2', 14, NULL, 2),
(853, 336, 'Bàn giao xe vào xưởng', 'Bàn giao xe vào xưởng', '5', '2', 16, NULL, 2),
(854, 336, 'Bàn giao xe vào xưởng', 'Bàn giao xe vào xưởng', '5', '2', 6, NULL, 2),
(855, 336, 'Bàn giao xe vào xưởng', 'Bàn giao xe vào xưởng', '5', '3', 4, NULL, 2),
(856, 336, 'Bàn giao xe vào xưởng', 'Bàn giao xe vào xưởng', '5', '3', 2, NULL, 2),
(857, 336, 'Bàn giao xe ra xưởng', 'Bàn giao xe ra xưởng', '5', '3', 12, NULL, 2),
(858, 336, 'Bàn giao xe ra xưởng', 'Bàn giao xe ra xưởng', '5', '3', 10, NULL, 2),
(859, 336, 'Bàn giao xe ra xưởng', 'Bàn giao xe ra xưởng', '5', '3', 8, NULL, 2),
(860, 336, 'Bàn giao xe ra xưởng', 'Bàn giao xe ra xưởng', '5', '2', 14, NULL, 2),
(861, 336, 'Bàn giao xe ra xưởng', 'Bàn giao xe ra xưởng', '5', '2', 16, NULL, 2),
(862, 336, 'Bàn giao xe ra xưởng', 'Bàn giao xe ra xưởng', '5', '2', 6, NULL, 2),
(863, 336, 'Bàn giao xe ra xưởng', 'Bàn giao xe ra xưởng', '5', '3', 4, NULL, 2),
(864, 336, 'Bàn giao xe ra xưởng', 'Bàn giao xe ra xưởng', '5', '3', 2, NULL, 2),
(865, 336, 'Lĩnh hoặc thu mua vật tư', 'Lĩnh hoặc thu mua vật tư', '4', '8', 12, NULL, 2),
(866, 336, 'Lĩnh hoặc thu mua vật tư', 'Lĩnh hoặc thu mua vật tư', '4', '8', 10, NULL, 2),
(867, 336, 'Lĩnh hoặc thu mua vật tư', 'Lĩnh hoặc thu mua vật tư', '4', '8', 8, NULL, 2),
(868, 336, 'Lĩnh hoặc thu mua vật tư', 'Lĩnh hoặc thu mua vật tư', '4', '4', 14, NULL, 2),
(869, 336, 'Lĩnh hoặc thu mua vật tư', 'Lĩnh hoặc thu mua vật tư', '4', '4', 16, NULL, 2),
(870, 336, 'Lĩnh hoặc thu mua vật tư', 'Lĩnh hoặc thu mua vật tư', '4', '4', 6, NULL, 2),
(871, 336, 'Lĩnh hoặc thu mua vật tư', 'Lĩnh hoặc thu mua vật tư', '4', '6', 4, NULL, 2),
(872, 336, 'Lĩnh hoặc thu mua vật tư', 'Lĩnh hoặc thu mua vật tư', '4', '8', 2, NULL, 2),
(873, 338, 'Tháo, bảo dưỡng, xúc rửa bầu lọc thủy lực, thùng dầu thủy lực', 'Tháo, bảo dưỡng, xúc rửa bầu lọc thủy lực, thùng dầu thủy lực', '4', '10', 12, NULL, 2),
(874, 338, 'Tháo, bảo dưỡng, xúc rửa bầu lọc thủy lực, thùng dầu thủy lực', 'Tháo, bảo dưỡng, xúc rửa bầu lọc thủy lực, thùng dầu thủy lực', '4', '10', 10, NULL, 2),
(875, 338, 'Tháo, bảo dưỡng, xúc rửa bầu lọc thủy lực, thùng dầu thủy lực', 'Tháo, bảo dưỡng, xúc rửa bầu lọc thủy lực, thùng dầu thủy lực', '4', '10', 8, NULL, 2),
(876, 338, 'Tháo, bảo dưỡng, xúc rửa bầu lọc thủy lực, thùng dầu thủy lực', 'Tháo, bảo dưỡng, xúc rửa bầu lọc thủy lực, thùng dầu thủy lực', '4', '0', 14, NULL, 2),
(877, 338, 'Tháo, bảo dưỡng, xúc rửa bầu lọc thủy lực, thùng dầu thủy lực', 'Tháo, bảo dưỡng, xúc rửa bầu lọc thủy lực, thùng dầu thủy lực', '4', '0', 16, NULL, 2),
(878, 338, 'Tháo, bảo dưỡng, xúc rửa bầu lọc thủy lực, thùng dầu thủy lực', 'Tháo, bảo dưỡng, xúc rửa bầu lọc thủy lực, thùng dầu thủy lực', '4', '6', 6, NULL, 2),
(879, 338, 'Tháo, bảo dưỡng, xúc rửa bầu lọc thủy lực, thùng dầu thủy lực', 'Tháo, bảo dưỡng, xúc rửa bầu lọc thủy lực, thùng dầu thủy lực', '4', '6', 4, NULL, 2),
(880, 338, 'Tháo, bảo dưỡng, xúc rửa bầu lọc thủy lực, thùng dầu thủy lực', 'Tháo, bảo dưỡng, xúc rửa bầu lọc thủy lực, thùng dầu thủy lực', '4', '10', 2, NULL, 2),
(881, 338, 'Thông sạch các đường ống thủy lực, kiểm tra độ kín khít, siết chặt các đầu nối', 'Thông sạch các đường ống thủy lực, kiểm tra độ kín khít, siết chặt các đầu nối', '5', '3', 12, NULL, 2),
(882, 338, 'Thông sạch các đường ống thủy lực, kiểm tra độ kín khít, siết chặt các đầu nối', 'Thông sạch các đường ống thủy lực, kiểm tra độ kín khít, siết chặt các đầu nối', '5', '3', 10, NULL, 2),
(883, 338, 'Thông sạch các đường ống thủy lực, kiểm tra độ kín khít, siết chặt các đầu nối', 'Thông sạch các đường ống thủy lực, kiểm tra độ kín khít, siết chặt các đầu nối', '5', '3', 8, NULL, 2),
(884, 338, 'Thông sạch các đường ống thủy lực, kiểm tra độ kín khít, siết chặt các đầu nối', 'Thông sạch các đường ống thủy lực, kiểm tra độ kín khít, siết chặt các đầu nối', '5', '0', 14, NULL, 2),
(885, 338, 'Thông sạch các đường ống thủy lực, kiểm tra độ kín khít, siết chặt các đầu nối', 'Thông sạch các đường ống thủy lực, kiểm tra độ kín khít, siết chặt các đầu nối', '5', '0', 16, NULL, 2),
(886, 338, 'Thông sạch các đường ống thủy lực, kiểm tra độ kín khít, siết chặt các đầu nối', 'Thông sạch các đường ống thủy lực, kiểm tra độ kín khít, siết chặt các đầu nối', '5', '1', 6, NULL, 2),
(887, 338, 'Thông sạch các đường ống thủy lực, kiểm tra độ kín khít, siết chặt các đầu nối', 'Thông sạch các đường ống thủy lực, kiểm tra độ kín khít, siết chặt các đầu nối', '5', '3', 4, NULL, 2),
(888, 338, 'Thông sạch các đường ống thủy lực, kiểm tra độ kín khít, siết chặt các đầu nối', 'Thông sạch các đường ống thủy lực, kiểm tra độ kín khít, siết chặt các đầu nối', '5', '3', 2, NULL, 2),
(889, 338, 'Thay dầu thủy lực mới (theo qui định)', 'Thay dầu thủy lực mới (theo qui định)', '4', '3', 12, NULL, 2),
(890, 338, 'Thay dầu thủy lực mới (theo qui định)', 'Thay dầu thủy lực mới (theo qui định)', '4', '3', 10, NULL, 2),
(891, 338, 'Thay dầu thủy lực mới (theo qui định)', 'Thay dầu thủy lực mới (theo qui định)', '4', '3', 8, NULL, 2),
(892, 338, 'Thay dầu thủy lực mới (theo qui định)', 'Thay dầu thủy lực mới (theo qui định)', '4', '0', 14, NULL, 2),
(893, 338, 'Thay dầu thủy lực mới (theo qui định)', 'Thay dầu thủy lực mới (theo qui định)', '4', '0', 16, NULL, 2),
(894, 338, 'Thay dầu thủy lực mới (theo qui định)', 'Thay dầu thủy lực mới (theo qui định)', '4', '3', 6, NULL, 2),
(895, 338, 'Thay dầu thủy lực mới (theo qui định)', 'Thay dầu thủy lực mới (theo qui định)', '4', '3', 4, NULL, 2),
(896, 338, 'Thay dầu thủy lực mới (theo qui định)', 'Thay dầu thủy lực mới (theo qui định)', '4', '3', 2, NULL, 2),
(897, 338, 'Kiểm tra bảo dưỡng bơm dầu thủy lực', 'Kiểm tra bảo dưỡng bơm dầu thủy lực', '5', '3', 12, NULL, 2),
(898, 338, 'Kiểm tra bảo dưỡng bơm dầu thủy lực', 'Kiểm tra bảo dưỡng bơm dầu thủy lực', '5', '3', 10, NULL, 2),
(899, 338, 'Kiểm tra bảo dưỡng bơm dầu thủy lực', 'Kiểm tra bảo dưỡng bơm dầu thủy lực', '5', '3', 8, NULL, 2),
(900, 338, 'Kiểm tra bảo dưỡng bơm dầu thủy lực', 'Kiểm tra bảo dưỡng bơm dầu thủy lực', '5', '0', 14, NULL, 2),
(901, 338, 'Kiểm tra bảo dưỡng bơm dầu thủy lực', 'Kiểm tra bảo dưỡng bơm dầu thủy lực', '5', '0', 16, NULL, 2),
(902, 338, 'Kiểm tra bảo dưỡng bơm dầu thủy lực', 'Kiểm tra bảo dưỡng bơm dầu thủy lực', '5', '3', 6, NULL, 2),
(903, 338, 'Kiểm tra bảo dưỡng bơm dầu thủy lực', 'Kiểm tra bảo dưỡng bơm dầu thủy lực', '5', '3', 4, NULL, 2),
(904, 338, 'Kiểm tra bảo dưỡng bơm dầu thủy lực', 'Kiểm tra bảo dưỡng bơm dầu thủy lực', '5', '3', 2, NULL, 2),
(905, 338, 'Kiểm tra bảo dưỡng khung đỡ thùng bùn, cáp, pu ly dẫn hướng/Thùng ben/Kiểm tra điều chỉnh hệ thống tang cuốn ống áp lực cao/cơ cấu cần thu gom, ép rác', 'Kiểm tra bảo dưỡng khung đỡ thùng bùn, cáp, pu ly dẫn hướng/Thùng ben/Kiểm tra điều chỉnh hệ thống tang cuốn ống áp lực cao/cơ cấu cần thu gom, ép rác', '5', '0', 12, NULL, 2),
(906, 338, 'Kiểm tra bảo dưỡng khung đỡ thùng bùn, cáp, pu ly dẫn hướng/Thùng ben/Kiểm tra điều chỉnh hệ thống tang cuốn ống áp lực cao/cơ cấu cần thu gom, ép rác', 'Kiểm tra bảo dưỡng khung đỡ thùng bùn, cáp, pu ly dẫn hướng/Thùng ben/Kiểm tra điều chỉnh hệ thống tang cuốn ống áp lực cao/cơ cấu cần thu gom, ép rác', '5', '0', 10, NULL, 2),
(907, 338, 'Kiểm tra bảo dưỡng khung đỡ thùng bùn, cáp, pu ly dẫn hướng/Thùng ben/Kiểm tra điều chỉnh hệ thống tang cuốn ống áp lực cao/cơ cấu cần thu gom, ép rác', 'Kiểm tra bảo dưỡng khung đỡ thùng bùn, cáp, pu ly dẫn hướng/Thùng ben/Kiểm tra điều chỉnh hệ thống tang cuốn ống áp lực cao/cơ cấu cần thu gom, ép rác', '5', '0', 8, NULL, 2),
(908, 338, 'Kiểm tra bảo dưỡng khung đỡ thùng bùn, cáp, pu ly dẫn hướng/Thùng ben/Kiểm tra điều chỉnh hệ thống tang cuốn ống áp lực cao/cơ cấu cần thu gom, ép rác', 'Kiểm tra bảo dưỡng khung đỡ thùng bùn, cáp, pu ly dẫn hướng/Thùng ben/Kiểm tra điều chỉnh hệ thống tang cuốn ống áp lực cao/cơ cấu cần thu gom, ép rác', '5', '0', 14, NULL, 2),
(909, 338, 'Kiểm tra bảo dưỡng khung đỡ thùng bùn, cáp, pu ly dẫn hướng/Thùng ben/Kiểm tra điều chỉnh hệ thống tang cuốn ống áp lực cao/cơ cấu cần thu gom, ép rác', 'Kiểm tra bảo dưỡng khung đỡ thùng bùn, cáp, pu ly dẫn hướng/Thùng ben/Kiểm tra điều chỉnh hệ thống tang cuốn ống áp lực cao/cơ cấu cần thu gom, ép rác', '5', '0', 16, NULL, 2),
(910, 338, 'Kiểm tra bảo dưỡng khung đỡ thùng bùn, cáp, pu ly dẫn hướng/Thùng ben/Kiểm tra điều chỉnh hệ thống tang cuốn ống áp lực cao/cơ cấu cần thu gom, ép rác', 'Kiểm tra bảo dưỡng khung đỡ thùng bùn, cáp, pu ly dẫn hướng/Thùng ben/Kiểm tra điều chỉnh hệ thống tang cuốn ống áp lực cao/cơ cấu cần thu gom, ép rác', '5', '0', 6, NULL, 2),
(911, 338, 'Kiểm tra bảo dưỡng khung đỡ thùng bùn, cáp, pu ly dẫn hướng/Thùng ben/Kiểm tra điều chỉnh hệ thống tang cuốn ống áp lực cao/cơ cấu cần thu gom, ép rác', 'Kiểm tra bảo dưỡng khung đỡ thùng bùn, cáp, pu ly dẫn hướng/Thùng ben/Kiểm tra điều chỉnh hệ thống tang cuốn ống áp lực cao/cơ cấu cần thu gom, ép rác', '5', '3', 4, NULL, 2),
(912, 338, 'Kiểm tra bảo dưỡng khung đỡ thùng bùn, cáp, pu ly dẫn hướng/Thùng ben/Kiểm tra điều chỉnh hệ thống tang cuốn ống áp lực cao/cơ cấu cần thu gom, ép rác', 'Kiểm tra bảo dưỡng khung đỡ thùng bùn, cáp, pu ly dẫn hướng/Thùng ben/Kiểm tra điều chỉnh hệ thống tang cuốn ống áp lực cao/cơ cấu cần thu gom, ép rác', '5', '4', 2, NULL, 2),
(913, 338, 'Kiểm tra, xiết chặt các xi lanh thủy lực nâng hạ thùng bùn, téc bùn, chân chống, xy lanh nâng ben.', 'Kiểm tra, xiết chặt các xi lanh thủy lực nâng hạ thùng bùn, téc bùn, chân chống, xy lanh nâng ben.', '5', '8', 12, NULL, 2),
(914, 338, 'Kiểm tra, xiết chặt các xi lanh thủy lực nâng hạ thùng bùn, téc bùn, chân chống, xy lanh nâng ben.', 'Kiểm tra, xiết chặt các xi lanh thủy lực nâng hạ thùng bùn, téc bùn, chân chống, xy lanh nâng ben.', '5', '8', 10, NULL, 2),
(915, 338, 'Kiểm tra, xiết chặt các xi lanh thủy lực nâng hạ thùng bùn, téc bùn, chân chống, xy lanh nâng ben.', 'Kiểm tra, xiết chặt các xi lanh thủy lực nâng hạ thùng bùn, téc bùn, chân chống, xy lanh nâng ben.', '5', '8', 8, NULL, 2),
(916, 338, 'Kiểm tra, xiết chặt các xi lanh thủy lực nâng hạ thùng bùn, téc bùn, chân chống, xy lanh nâng ben.', 'Kiểm tra, xiết chặt các xi lanh thủy lực nâng hạ thùng bùn, téc bùn, chân chống, xy lanh nâng ben.', '5', '0', 14, NULL, 2),
(917, 338, 'Kiểm tra, xiết chặt các xi lanh thủy lực nâng hạ thùng bùn, téc bùn, chân chống, xy lanh nâng ben.', 'Kiểm tra, xiết chặt các xi lanh thủy lực nâng hạ thùng bùn, téc bùn, chân chống, xy lanh nâng ben.', '5', '0', 16, NULL, 2),
(918, 338, 'Kiểm tra, xiết chặt các xi lanh thủy lực nâng hạ thùng bùn, téc bùn, chân chống, xy lanh nâng ben.', 'Kiểm tra, xiết chặt các xi lanh thủy lực nâng hạ thùng bùn, téc bùn, chân chống, xy lanh nâng ben.', '5', '4', 6, NULL, 2),
(919, 338, 'Kiểm tra, xiết chặt các xi lanh thủy lực nâng hạ thùng bùn, téc bùn, chân chống, xy lanh nâng ben.', 'Kiểm tra, xiết chặt các xi lanh thủy lực nâng hạ thùng bùn, téc bùn, chân chống, xy lanh nâng ben.', '5', '8', 4, NULL, 2),
(920, 338, 'Kiểm tra, xiết chặt các xi lanh thủy lực nâng hạ thùng bùn, téc bùn, chân chống, xy lanh nâng ben.', 'Kiểm tra, xiết chặt các xi lanh thủy lực nâng hạ thùng bùn, téc bùn, chân chống, xy lanh nâng ben.', '5', '8', 2, NULL, 2),
(921, 338, 'Kiểm tra cụm PTO (bộ trích lực)', 'Kiểm tra cụm PTO (bộ trích lực)', '5', '0', 12, NULL, 2),
(922, 338, 'Kiểm tra cụm PTO (bộ trích lực)', 'Kiểm tra cụm PTO (bộ trích lực)', '5', '0', 10, NULL, 2),
(923, 338, 'Kiểm tra cụm PTO (bộ trích lực)', 'Kiểm tra cụm PTO (bộ trích lực)', '5', '0', 8, NULL, 2),
(924, 338, 'Kiểm tra cụm PTO (bộ trích lực)', 'Kiểm tra cụm PTO (bộ trích lực)', '5', '0', 14, NULL, 2),
(925, 338, 'Kiểm tra cụm PTO (bộ trích lực)', 'Kiểm tra cụm PTO (bộ trích lực)', '5', '0', 16, NULL, 2),
(926, 338, 'Kiểm tra cụm PTO (bộ trích lực)', 'Kiểm tra cụm PTO (bộ trích lực)', '5', '0.5', 6, NULL, 2),
(927, 338, 'Kiểm tra cụm PTO (bộ trích lực)', 'Kiểm tra cụm PTO (bộ trích lực)', '5', '0.5', 4, NULL, 2),
(928, 338, 'Kiểm tra cụm PTO (bộ trích lực)', 'Kiểm tra cụm PTO (bộ trích lực)', '5', '0.5', 2, NULL, 2),
(929, 338, 'Kiểm tra cụm van điều khiển', 'Kiểm tra cụm van điều khiển', '5', '4', 12, NULL, 2),
(930, 338, 'Kiểm tra cụm van điều khiển', 'Kiểm tra cụm van điều khiển', '5', '4', 10, NULL, 2),
(931, 338, 'Kiểm tra cụm van điều khiển', 'Kiểm tra cụm van điều khiển', '5', '4', 8, NULL, 2),
(932, 338, 'Kiểm tra cụm van điều khiển', 'Kiểm tra cụm van điều khiển', '5', '0', 14, NULL, 2),
(933, 338, 'Kiểm tra cụm van điều khiển', 'Kiểm tra cụm van điều khiển', '5', '0', 16, NULL, 2),
(934, 338, 'Kiểm tra cụm van điều khiển', 'Kiểm tra cụm van điều khiển', '5', '1', 6, NULL, 2),
(935, 338, 'Kiểm tra cụm van điều khiển', 'Kiểm tra cụm van điều khiển', '5', '2', 4, NULL, 2),
(936, 338, 'Kiểm tra cụm van điều khiển', 'Kiểm tra cụm van điều khiển', '5', '2', 2, NULL, 2),
(937, 339, 'Kiểm tra bảo dưỡng vòng bi đầu trục bơm', 'Kiểm tra bảo dưỡng vòng bi đầu trục bơm', '5', '0', 12, NULL, 2),
(938, 339, 'Kiểm tra bảo dưỡng vòng bi đầu trục bơm', 'Kiểm tra bảo dưỡng vòng bi đầu trục bơm', '5', '0', 10, NULL, 2),
(939, 339, 'Kiểm tra bảo dưỡng vòng bi đầu trục bơm', 'Kiểm tra bảo dưỡng vòng bi đầu trục bơm', '5', '0', 8, NULL, 2),
(940, 339, 'Kiểm tra bảo dưỡng vòng bi đầu trục bơm', 'Kiểm tra bảo dưỡng vòng bi đầu trục bơm', '5', '0', 14, NULL, 2),
(941, 339, 'Kiểm tra bảo dưỡng vòng bi đầu trục bơm', 'Kiểm tra bảo dưỡng vòng bi đầu trục bơm', '5', '0', 16, NULL, 2),
(942, 339, 'Kiểm tra bảo dưỡng vòng bi đầu trục bơm', 'Kiểm tra bảo dưỡng vòng bi đầu trục bơm', '5', '0', 6, NULL, 2),
(943, 339, 'Kiểm tra bảo dưỡng vòng bi đầu trục bơm', 'Kiểm tra bảo dưỡng vòng bi đầu trục bơm', '5', '8', 4, NULL, 2),
(944, 339, 'Kiểm tra bảo dưỡng vòng bi đầu trục bơm', 'Kiểm tra bảo dưỡng vòng bi đầu trục bơm', '5', '8', 2, NULL, 2),
(945, 339, 'Kiểm tra bảo dưỡng hệ thống cung cấp nước bôi trơn, làm kín cho bơm', 'Kiểm tra bảo dưỡng hệ thống cung cấp nước bôi trơn, làm kín cho bơm', '5', '0', 12, NULL, 2),
(946, 339, 'Kiểm tra bảo dưỡng hệ thống cung cấp nước bôi trơn, làm kín cho bơm', 'Kiểm tra bảo dưỡng hệ thống cung cấp nước bôi trơn, làm kín cho bơm', '5', '0', 10, NULL, 2),
(947, 339, 'Kiểm tra bảo dưỡng hệ thống cung cấp nước bôi trơn, làm kín cho bơm', 'Kiểm tra bảo dưỡng hệ thống cung cấp nước bôi trơn, làm kín cho bơm', '5', '0', 8, NULL, 2),
(948, 339, 'Kiểm tra bảo dưỡng hệ thống cung cấp nước bôi trơn, làm kín cho bơm', 'Kiểm tra bảo dưỡng hệ thống cung cấp nước bôi trơn, làm kín cho bơm', '5', '0', 14, NULL, 2),
(949, 339, 'Kiểm tra bảo dưỡng hệ thống cung cấp nước bôi trơn, làm kín cho bơm', 'Kiểm tra bảo dưỡng hệ thống cung cấp nước bôi trơn, làm kín cho bơm', '5', '0', 16, NULL, 2),
(950, 339, 'Kiểm tra bảo dưỡng hệ thống cung cấp nước bôi trơn, làm kín cho bơm', 'Kiểm tra bảo dưỡng hệ thống cung cấp nước bôi trơn, làm kín cho bơm', '5', '0', 6, NULL, 2),
(951, 339, 'Kiểm tra bảo dưỡng hệ thống cung cấp nước bôi trơn, làm kín cho bơm', 'Kiểm tra bảo dưỡng hệ thống cung cấp nước bôi trơn, làm kín cho bơm', '5', '2', 4, NULL, 2),
(952, 339, 'Kiểm tra bảo dưỡng hệ thống cung cấp nước bôi trơn, làm kín cho bơm', 'Kiểm tra bảo dưỡng hệ thống cung cấp nước bôi trơn, làm kín cho bơm', '5', '2', 2, NULL, 2),
(953, 339, 'Bảo dưỡng, vệ sinh téc nước phần hút, tách nước, phần xả, bộ lọc, van làm kín, van tách nước', 'Bảo dưỡng, vệ sinh téc nước phần hút, tách nước, phần xả, bộ lọc, van làm kín, van tách nước', '5', '0', 12, NULL, 2),
(954, 339, 'Bảo dưỡng, vệ sinh téc nước phần hút, tách nước, phần xả, bộ lọc, van làm kín, van tách nước', 'Bảo dưỡng, vệ sinh téc nước phần hút, tách nước, phần xả, bộ lọc, van làm kín, van tách nước', '5', '0', 10, NULL, 2),
(955, 339, 'Bảo dưỡng, vệ sinh téc nước phần hút, tách nước, phần xả, bộ lọc, van làm kín, van tách nước', 'Bảo dưỡng, vệ sinh téc nước phần hút, tách nước, phần xả, bộ lọc, van làm kín, van tách nước', '5', '0', 8, NULL, 2),
(956, 339, 'Bảo dưỡng, vệ sinh téc nước phần hút, tách nước, phần xả, bộ lọc, van làm kín, van tách nước', 'Bảo dưỡng, vệ sinh téc nước phần hút, tách nước, phần xả, bộ lọc, van làm kín, van tách nước', '5', '0', 14, NULL, 2),
(957, 339, 'Bảo dưỡng, vệ sinh téc nước phần hút, tách nước, phần xả, bộ lọc, van làm kín, van tách nước', 'Bảo dưỡng, vệ sinh téc nước phần hút, tách nước, phần xả, bộ lọc, van làm kín, van tách nước', '5', '0', 16, NULL, 2),
(958, 339, 'Bảo dưỡng, vệ sinh téc nước phần hút, tách nước, phần xả, bộ lọc, van làm kín, van tách nước', 'Bảo dưỡng, vệ sinh téc nước phần hút, tách nước, phần xả, bộ lọc, van làm kín, van tách nước', '5', '0', 6, NULL, 2),
(959, 339, 'Bảo dưỡng, vệ sinh téc nước phần hút, tách nước, phần xả, bộ lọc, van làm kín, van tách nước', 'Bảo dưỡng, vệ sinh téc nước phần hút, tách nước, phần xả, bộ lọc, van làm kín, van tách nước', '5', '3', 4, NULL, 2),
(960, 339, 'Bảo dưỡng, vệ sinh téc nước phần hút, tách nước, phần xả, bộ lọc, van làm kín, van tách nước', 'Bảo dưỡng, vệ sinh téc nước phần hút, tách nước, phần xả, bộ lọc, van làm kín, van tách nước', '5', '3', 2, NULL, 2),
(961, 339, 'Tháo kiểm tra bảo dưỡng van 4 chiều', 'Tháo kiểm tra bảo dưỡng van 4 chiều', '5', '0', 12, NULL, 2),
(962, 339, 'Tháo kiểm tra bảo dưỡng van 4 chiều', 'Tháo kiểm tra bảo dưỡng van 4 chiều', '5', '0', 10, NULL, 2),
(963, 339, 'Tháo kiểm tra bảo dưỡng van 4 chiều', 'Tháo kiểm tra bảo dưỡng van 4 chiều', '5', '0', 8, NULL, 2),
(964, 339, 'Tháo kiểm tra bảo dưỡng van 4 chiều', 'Tháo kiểm tra bảo dưỡng van 4 chiều', '5', '0', 14, NULL, 2),
(965, 339, 'Tháo kiểm tra bảo dưỡng van 4 chiều', 'Tháo kiểm tra bảo dưỡng van 4 chiều', '5', '0', 16, NULL, 2),
(966, 339, 'Tháo kiểm tra bảo dưỡng van 4 chiều', 'Tháo kiểm tra bảo dưỡng van 4 chiều', '5', '0', 6, NULL, 2),
(967, 339, 'Tháo kiểm tra bảo dưỡng van 4 chiều', 'Tháo kiểm tra bảo dưỡng van 4 chiều', '5', '4', 4, NULL, 2),
(968, 339, 'Tháo kiểm tra bảo dưỡng van 4 chiều', 'Tháo kiểm tra bảo dưỡng van 4 chiều', '5', '4', 2, NULL, 2),
(969, 339, 'Kiểm tra bảo dưỡng, điều chỉnh van an toàn, van xả', 'Kiểm tra bảo dưỡng, điều chỉnh van an toàn, van xả', '5', '0', 12, NULL, 2),
(970, 339, 'Kiểm tra bảo dưỡng, điều chỉnh van an toàn, van xả', 'Kiểm tra bảo dưỡng, điều chỉnh van an toàn, van xả', '5', '0', 10, NULL, 2),
(971, 339, 'Kiểm tra bảo dưỡng, điều chỉnh van an toàn, van xả', 'Kiểm tra bảo dưỡng, điều chỉnh van an toàn, van xả', '5', '0', 8, NULL, 2),
(972, 339, 'Kiểm tra bảo dưỡng, điều chỉnh van an toàn, van xả', 'Kiểm tra bảo dưỡng, điều chỉnh van an toàn, van xả', '5', '0', 14, NULL, 2),
(973, 339, 'Kiểm tra bảo dưỡng, điều chỉnh van an toàn, van xả', 'Kiểm tra bảo dưỡng, điều chỉnh van an toàn, van xả', '5', '0', 16, NULL, 2),
(974, 339, 'Kiểm tra bảo dưỡng, điều chỉnh van an toàn, van xả', 'Kiểm tra bảo dưỡng, điều chỉnh van an toàn, van xả', '5', '0', 6, NULL, 2),
(975, 339, 'Kiểm tra bảo dưỡng, điều chỉnh van an toàn, van xả', 'Kiểm tra bảo dưỡng, điều chỉnh van an toàn, van xả', '5', '3', 4, NULL, 2),
(976, 339, 'Kiểm tra bảo dưỡng, điều chỉnh van an toàn, van xả', 'Kiểm tra bảo dưỡng, điều chỉnh van an toàn, van xả', '5', '3', 2, NULL, 2),
(977, 339, 'Kiểm tra, điều chỉnh độ căng dây curoa lai bơm', 'Kiểm tra, điều chỉnh độ căng dây curoa lai bơm', '5', '0', 12, NULL, 2),
(978, 339, 'Kiểm tra, điều chỉnh độ căng dây curoa lai bơm', 'Kiểm tra, điều chỉnh độ căng dây curoa lai bơm', '5', '0', 10, NULL, 2),
(979, 339, 'Kiểm tra, điều chỉnh độ căng dây curoa lai bơm', 'Kiểm tra, điều chỉnh độ căng dây curoa lai bơm', '5', '0', 8, NULL, 2),
(980, 339, 'Kiểm tra, điều chỉnh độ căng dây curoa lai bơm', 'Kiểm tra, điều chỉnh độ căng dây curoa lai bơm', '5', '0', 14, NULL, 2),
(981, 339, 'Kiểm tra, điều chỉnh độ căng dây curoa lai bơm', 'Kiểm tra, điều chỉnh độ căng dây curoa lai bơm', '5', '0', 16, NULL, 2),
(982, 339, 'Kiểm tra, điều chỉnh độ căng dây curoa lai bơm', 'Kiểm tra, điều chỉnh độ căng dây curoa lai bơm', '5', '0', 6, NULL, 2),
(983, 339, 'Kiểm tra, điều chỉnh độ căng dây curoa lai bơm', 'Kiểm tra, điều chỉnh độ căng dây curoa lai bơm', '5', '3', 4, NULL, 2),
(984, 339, 'Kiểm tra, điều chỉnh độ căng dây curoa lai bơm', 'Kiểm tra, điều chỉnh độ căng dây curoa lai bơm', '5', '3', 2, NULL, 2),
(985, 340, 'Tháo bảo dưỡng, vệ sinh van hút, van xả', 'Tháo bảo dưỡng, vệ sinh van hút, van xả', '5', '0', 12, NULL, 2),
(986, 340, 'Tháo bảo dưỡng, vệ sinh van hút, van xả', 'Tháo bảo dưỡng, vệ sinh van hút, van xả', '5', '0', 10, NULL, 2),
(987, 340, 'Tháo bảo dưỡng, vệ sinh van hút, van xả', 'Tháo bảo dưỡng, vệ sinh van hút, van xả', '5', '0', 8, NULL, 2),
(988, 340, 'Tháo bảo dưỡng, vệ sinh van hút, van xả', 'Tháo bảo dưỡng, vệ sinh van hút, van xả', '5', '0', 14, NULL, 2),
(989, 340, 'Tháo bảo dưỡng, vệ sinh van hút, van xả', 'Tháo bảo dưỡng, vệ sinh van hút, van xả', '5', '0', 16, NULL, 2),
(990, 340, 'Tháo bảo dưỡng, vệ sinh van hút, van xả', 'Tháo bảo dưỡng, vệ sinh van hút, van xả', '5', '0', 6, NULL, 2),
(991, 340, 'Tháo bảo dưỡng, vệ sinh van hút, van xả', 'Tháo bảo dưỡng, vệ sinh van hút, van xả', '5', '3', 4, NULL, 2),
(992, 340, 'Tháo bảo dưỡng, vệ sinh van hút, van xả', 'Tháo bảo dưỡng, vệ sinh van hút, van xả', '5', '3', 2, NULL, 2),
(993, 340, 'Tháo bảo dưỡng, vệ sinh lưới tách nước, mắt thăm bùn', 'Tháo bảo dưỡng, vệ sinh lưới tách nước, mắt thăm bùn', '5', '0', 12, NULL, 2),
(994, 340, 'Tháo bảo dưỡng, vệ sinh lưới tách nước, mắt thăm bùn', 'Tháo bảo dưỡng, vệ sinh lưới tách nước, mắt thăm bùn', '5', '0', 10, NULL, 2),
(995, 340, 'Tháo bảo dưỡng, vệ sinh lưới tách nước, mắt thăm bùn', 'Tháo bảo dưỡng, vệ sinh lưới tách nước, mắt thăm bùn', '5', '0', 8, NULL, 2),
(996, 340, 'Tháo bảo dưỡng, vệ sinh lưới tách nước, mắt thăm bùn', 'Tháo bảo dưỡng, vệ sinh lưới tách nước, mắt thăm bùn', '5', '0', 14, NULL, 2),
(997, 340, 'Tháo bảo dưỡng, vệ sinh lưới tách nước, mắt thăm bùn', 'Tháo bảo dưỡng, vệ sinh lưới tách nước, mắt thăm bùn', '5', '0', 16, NULL, 2),
(998, 340, 'Tháo bảo dưỡng, vệ sinh lưới tách nước, mắt thăm bùn', 'Tháo bảo dưỡng, vệ sinh lưới tách nước, mắt thăm bùn', '5', '0', 6, NULL, 2),
(999, 340, 'Tháo bảo dưỡng, vệ sinh lưới tách nước, mắt thăm bùn', 'Tháo bảo dưỡng, vệ sinh lưới tách nước, mắt thăm bùn', '5', '2', 4, NULL, 2),
(1000, 340, 'Tháo bảo dưỡng, vệ sinh lưới tách nước, mắt thăm bùn', 'Tháo bảo dưỡng, vệ sinh lưới tách nước, mắt thăm bùn', '5', '2', 2, NULL, 2),
(1001, 340, 'Tháo bảo dưỡng van chống tràn, hệ thống báo tràn', 'Tháo bảo dưỡng van chống tràn, hệ thống báo tràn', '5', '0', 12, NULL, 2),
(1002, 340, 'Tháo bảo dưỡng van chống tràn, hệ thống báo tràn', 'Tháo bảo dưỡng van chống tràn, hệ thống báo tràn', '5', '0', 10, NULL, 2),
(1003, 340, 'Tháo bảo dưỡng van chống tràn, hệ thống báo tràn', 'Tháo bảo dưỡng van chống tràn, hệ thống báo tràn', '5', '0', 8, NULL, 2),
(1004, 340, 'Tháo bảo dưỡng van chống tràn, hệ thống báo tràn', 'Tháo bảo dưỡng van chống tràn, hệ thống báo tràn', '5', '0', 14, NULL, 2),
(1005, 340, 'Tháo bảo dưỡng van chống tràn, hệ thống báo tràn', 'Tháo bảo dưỡng van chống tràn, hệ thống báo tràn', '5', '0', 16, NULL, 2),
(1006, 340, 'Tháo bảo dưỡng van chống tràn, hệ thống báo tràn', 'Tháo bảo dưỡng van chống tràn, hệ thống báo tràn', '5', '0', 6, NULL, 2),
(1007, 340, 'Tháo bảo dưỡng van chống tràn, hệ thống báo tràn', 'Tháo bảo dưỡng van chống tràn, hệ thống báo tràn', '5', '3', 4, NULL, 2),
(1008, 340, 'Tháo bảo dưỡng van chống tràn, hệ thống báo tràn', 'Tháo bảo dưỡng van chống tràn, hệ thống báo tràn', '5', '3', 2, NULL, 2),
(1009, 340, 'Tháo kiểm tra, thay thế (nếu cần) tấm chắn bảo vệ đầu hút téc bùn, vệ sinh làm kín gioăng cao su đáy téc bùn, cửa thăm', 'Tháo kiểm tra, thay thế (nếu cần) tấm chắn bảo vệ đầu hút téc bùn, vệ sinh làm kín gioăng cao su đáy téc bùn, cửa thăm', '5', '0', 12, NULL, 2),
(1010, 340, 'Tháo kiểm tra, thay thế (nếu cần) tấm chắn bảo vệ đầu hút téc bùn, vệ sinh làm kín gioăng cao su đáy téc bùn, cửa thăm', 'Tháo kiểm tra, thay thế (nếu cần) tấm chắn bảo vệ đầu hút téc bùn, vệ sinh làm kín gioăng cao su đáy téc bùn, cửa thăm', '5', '0', 10, NULL, 2),
(1011, 340, 'Tháo kiểm tra, thay thế (nếu cần) tấm chắn bảo vệ đầu hút téc bùn, vệ sinh làm kín gioăng cao su đáy téc bùn, cửa thăm', 'Tháo kiểm tra, thay thế (nếu cần) tấm chắn bảo vệ đầu hút téc bùn, vệ sinh làm kín gioăng cao su đáy téc bùn, cửa thăm', '5', '0', 8, NULL, 2),
(1012, 340, 'Tháo kiểm tra, thay thế (nếu cần) tấm chắn bảo vệ đầu hút téc bùn, vệ sinh làm kín gioăng cao su đáy téc bùn, cửa thăm', 'Tháo kiểm tra, thay thế (nếu cần) tấm chắn bảo vệ đầu hút téc bùn, vệ sinh làm kín gioăng cao su đáy téc bùn, cửa thăm', '5', '0', 14, NULL, 2),
(1013, 340, 'Tháo kiểm tra, thay thế (nếu cần) tấm chắn bảo vệ đầu hút téc bùn, vệ sinh làm kín gioăng cao su đáy téc bùn, cửa thăm', 'Tháo kiểm tra, thay thế (nếu cần) tấm chắn bảo vệ đầu hút téc bùn, vệ sinh làm kín gioăng cao su đáy téc bùn, cửa thăm', '5', '0', 16, NULL, 2),
(1014, 340, 'Tháo kiểm tra, thay thế (nếu cần) tấm chắn bảo vệ đầu hút téc bùn, vệ sinh làm kín gioăng cao su đáy téc bùn, cửa thăm', 'Tháo kiểm tra, thay thế (nếu cần) tấm chắn bảo vệ đầu hút téc bùn, vệ sinh làm kín gioăng cao su đáy téc bùn, cửa thăm', '5', '0', 6, NULL, 2),
(1015, 340, 'Tháo kiểm tra, thay thế (nếu cần) tấm chắn bảo vệ đầu hút téc bùn, vệ sinh làm kín gioăng cao su đáy téc bùn, cửa thăm', 'Tháo kiểm tra, thay thế (nếu cần) tấm chắn bảo vệ đầu hút téc bùn, vệ sinh làm kín gioăng cao su đáy téc bùn, cửa thăm', '5', '3', 4, NULL, 2),
(1016, 340, 'Tháo kiểm tra, thay thế (nếu cần) tấm chắn bảo vệ đầu hút téc bùn, vệ sinh làm kín gioăng cao su đáy téc bùn, cửa thăm', 'Tháo kiểm tra, thay thế (nếu cần) tấm chắn bảo vệ đầu hút téc bùn, vệ sinh làm kín gioăng cao su đáy téc bùn, cửa thăm', '5', '3', 2, NULL, 2),
(1017, 340, 'Kiểm tra bên trong téc bùn, phát hiện các điểm mọt rỉ để sửa chữa.', 'Kiểm tra bên trong téc bùn, phát hiện các điểm mọt rỉ để sửa chữa.', '5', '0', 12, NULL, 2),
(1018, 340, 'Kiểm tra bên trong téc bùn, phát hiện các điểm mọt rỉ để sửa chữa.', 'Kiểm tra bên trong téc bùn, phát hiện các điểm mọt rỉ để sửa chữa.', '5', '0', 10, NULL, 2),
(1019, 340, 'Kiểm tra bên trong téc bùn, phát hiện các điểm mọt rỉ để sửa chữa.', 'Kiểm tra bên trong téc bùn, phát hiện các điểm mọt rỉ để sửa chữa.', '5', '0', 8, NULL, 2),
(1020, 340, 'Kiểm tra bên trong téc bùn, phát hiện các điểm mọt rỉ để sửa chữa.', 'Kiểm tra bên trong téc bùn, phát hiện các điểm mọt rỉ để sửa chữa.', '5', '0', 14, NULL, 2),
(1021, 340, 'Kiểm tra bên trong téc bùn, phát hiện các điểm mọt rỉ để sửa chữa.', 'Kiểm tra bên trong téc bùn, phát hiện các điểm mọt rỉ để sửa chữa.', '5', '0', 16, NULL, 2),
(1022, 340, 'Kiểm tra bên trong téc bùn, phát hiện các điểm mọt rỉ để sửa chữa.', 'Kiểm tra bên trong téc bùn, phát hiện các điểm mọt rỉ để sửa chữa.', '5', '0', 6, NULL, 2),
(1023, 340, 'Kiểm tra bên trong téc bùn, phát hiện các điểm mọt rỉ để sửa chữa.', 'Kiểm tra bên trong téc bùn, phát hiện các điểm mọt rỉ để sửa chữa.', '5', '1', 4, NULL, 2),
(1024, 340, 'Kiểm tra bên trong téc bùn, phát hiện các điểm mọt rỉ để sửa chữa.', 'Kiểm tra bên trong téc bùn, phát hiện các điểm mọt rỉ để sửa chữa.', '5', '1', 2, NULL, 2),
(1025, 340, 'Kiểm tra, bảo dưỡng điều chỉnh cơ cấu khóa đáy téc bùn', 'Kiểm tra, bảo dưỡng điều chỉnh cơ cấu khóa đáy téc bùn', '5', '0', 12, NULL, 2),
(1026, 340, 'Kiểm tra, bảo dưỡng điều chỉnh cơ cấu khóa đáy téc bùn', 'Kiểm tra, bảo dưỡng điều chỉnh cơ cấu khóa đáy téc bùn', '5', '0', 10, NULL, 2),
(1027, 340, 'Kiểm tra, bảo dưỡng điều chỉnh cơ cấu khóa đáy téc bùn', 'Kiểm tra, bảo dưỡng điều chỉnh cơ cấu khóa đáy téc bùn', '5', '0', 8, NULL, 2),
(1028, 340, 'Kiểm tra, bảo dưỡng điều chỉnh cơ cấu khóa đáy téc bùn', 'Kiểm tra, bảo dưỡng điều chỉnh cơ cấu khóa đáy téc bùn', '5', '0', 14, NULL, 2),
(1029, 340, 'Kiểm tra, bảo dưỡng điều chỉnh cơ cấu khóa đáy téc bùn', 'Kiểm tra, bảo dưỡng điều chỉnh cơ cấu khóa đáy téc bùn', '5', '0', 16, NULL, 2),
(1030, 340, 'Kiểm tra, bảo dưỡng điều chỉnh cơ cấu khóa đáy téc bùn', 'Kiểm tra, bảo dưỡng điều chỉnh cơ cấu khóa đáy téc bùn', '5', '0', 6, NULL, 2),
(1031, 340, 'Kiểm tra, bảo dưỡng điều chỉnh cơ cấu khóa đáy téc bùn', 'Kiểm tra, bảo dưỡng điều chỉnh cơ cấu khóa đáy téc bùn', '5', '2', 4, NULL, 2),
(1032, 340, 'Kiểm tra, bảo dưỡng điều chỉnh cơ cấu khóa đáy téc bùn', 'Kiểm tra, bảo dưỡng điều chỉnh cơ cấu khóa đáy téc bùn', '5', '2', 2, NULL, 2),
(1033, 341, 'Tháo kiểm tra dầu bôi trơn, bổ sung hoặc thay thế theo qui định', 'Tháo kiểm tra dầu bôi trơn, bổ sung hoặc thay thế theo qui định', '5', '0', 12, NULL, 2),
(1034, 341, 'Tháo kiểm tra dầu bôi trơn, bổ sung hoặc thay thế theo qui định', 'Tháo kiểm tra dầu bôi trơn, bổ sung hoặc thay thế theo qui định', '5', '0', 10, NULL, 2);
INSERT INTO `c_repair_labor` (`C_REPAIR_LABOR_ID`, `PARENT_ID`, `CODE`, `NAME`, `LEVEL_LABOR`, `QUOTA`, `C_REPAIR_TYPE_ID`, `DECREASE_RATE`, `MAINTAIN_TYPE`) VALUES
(1035, 341, 'Tháo kiểm tra dầu bôi trơn, bổ sung hoặc thay thế theo qui định', 'Tháo kiểm tra dầu bôi trơn, bổ sung hoặc thay thế theo qui định', '5', '0', 8, NULL, 2),
(1036, 341, 'Tháo kiểm tra dầu bôi trơn, bổ sung hoặc thay thế theo qui định', 'Tháo kiểm tra dầu bôi trơn, bổ sung hoặc thay thế theo qui định', '5', '0', 14, NULL, 2),
(1037, 341, 'Tháo kiểm tra dầu bôi trơn, bổ sung hoặc thay thế theo qui định', 'Tháo kiểm tra dầu bôi trơn, bổ sung hoặc thay thế theo qui định', '5', '0', 16, NULL, 2),
(1038, 341, 'Tháo kiểm tra dầu bôi trơn, bổ sung hoặc thay thế theo qui định', 'Tháo kiểm tra dầu bôi trơn, bổ sung hoặc thay thế theo qui định', '5', '0', 6, NULL, 2),
(1039, 341, 'Tháo kiểm tra dầu bôi trơn, bổ sung hoặc thay thế theo qui định', 'Tháo kiểm tra dầu bôi trơn, bổ sung hoặc thay thế theo qui định', '5', '3', 4, NULL, 2),
(1040, 341, 'Tháo kiểm tra dầu bôi trơn, bổ sung hoặc thay thế theo qui định', 'Tháo kiểm tra dầu bôi trơn, bổ sung hoặc thay thế theo qui định', '5', '0', 2, NULL, 2),
(1041, 341, 'Kiểm tra bổ sung dầu bôi trơn của vòng bít, điều chỉnh lưu lượng dầu tại mức 6-7 giọt/phút', 'Kiểm tra bổ sung dầu bôi trơn của vòng bít, điều chỉnh lưu lượng dầu tại mức 6-7 giọt/phút', '5', '0', 12, NULL, 2),
(1042, 341, 'Kiểm tra bổ sung dầu bôi trơn của vòng bít, điều chỉnh lưu lượng dầu tại mức 6-7 giọt/phút', 'Kiểm tra bổ sung dầu bôi trơn của vòng bít, điều chỉnh lưu lượng dầu tại mức 6-7 giọt/phút', '5', '0', 10, NULL, 2),
(1043, 341, 'Kiểm tra bổ sung dầu bôi trơn của vòng bít, điều chỉnh lưu lượng dầu tại mức 6-7 giọt/phút', 'Kiểm tra bổ sung dầu bôi trơn của vòng bít, điều chỉnh lưu lượng dầu tại mức 6-7 giọt/phút', '5', '0', 8, NULL, 2),
(1044, 341, 'Kiểm tra bổ sung dầu bôi trơn của vòng bít, điều chỉnh lưu lượng dầu tại mức 6-7 giọt/phút', 'Kiểm tra bổ sung dầu bôi trơn của vòng bít, điều chỉnh lưu lượng dầu tại mức 6-7 giọt/phút', '5', '0', 14, NULL, 2),
(1045, 341, 'Kiểm tra bổ sung dầu bôi trơn của vòng bít, điều chỉnh lưu lượng dầu tại mức 6-7 giọt/phút', 'Kiểm tra bổ sung dầu bôi trơn của vòng bít, điều chỉnh lưu lượng dầu tại mức 6-7 giọt/phút', '5', '0', 16, NULL, 2),
(1046, 341, 'Kiểm tra bổ sung dầu bôi trơn của vòng bít, điều chỉnh lưu lượng dầu tại mức 6-7 giọt/phút', 'Kiểm tra bổ sung dầu bôi trơn của vòng bít, điều chỉnh lưu lượng dầu tại mức 6-7 giọt/phút', '5', '0', 6, NULL, 2),
(1047, 341, 'Kiểm tra bổ sung dầu bôi trơn của vòng bít, điều chỉnh lưu lượng dầu tại mức 6-7 giọt/phút', 'Kiểm tra bổ sung dầu bôi trơn của vòng bít, điều chỉnh lưu lượng dầu tại mức 6-7 giọt/phút', '5', '2', 4, NULL, 2),
(1048, 341, 'Kiểm tra bổ sung dầu bôi trơn của vòng bít, điều chỉnh lưu lượng dầu tại mức 6-7 giọt/phút', 'Kiểm tra bổ sung dầu bôi trơn của vòng bít, điều chỉnh lưu lượng dầu tại mức 6-7 giọt/phút', '5', '0', 2, NULL, 2),
(1049, 341, 'Kiểm tra, hiệu chỉnh van điều chỉnh áp suất bơm, van an toàn', 'Kiểm tra, hiệu chỉnh van điều chỉnh áp suất bơm, van an toàn', '5', '0', 12, NULL, 2),
(1050, 341, 'Kiểm tra, hiệu chỉnh van điều chỉnh áp suất bơm, van an toàn', 'Kiểm tra, hiệu chỉnh van điều chỉnh áp suất bơm, van an toàn', '5', '0', 10, NULL, 2),
(1051, 341, 'Kiểm tra, hiệu chỉnh van điều chỉnh áp suất bơm, van an toàn', 'Kiểm tra, hiệu chỉnh van điều chỉnh áp suất bơm, van an toàn', '5', '0', 8, NULL, 2),
(1052, 341, 'Kiểm tra, hiệu chỉnh van điều chỉnh áp suất bơm, van an toàn', 'Kiểm tra, hiệu chỉnh van điều chỉnh áp suất bơm, van an toàn', '5', '0', 14, NULL, 2),
(1053, 341, 'Kiểm tra, hiệu chỉnh van điều chỉnh áp suất bơm, van an toàn', 'Kiểm tra, hiệu chỉnh van điều chỉnh áp suất bơm, van an toàn', '5', '0', 16, NULL, 2),
(1054, 341, 'Kiểm tra, hiệu chỉnh van điều chỉnh áp suất bơm, van an toàn', 'Kiểm tra, hiệu chỉnh van điều chỉnh áp suất bơm, van an toàn', '5', '0', 6, NULL, 2),
(1055, 341, 'Kiểm tra, hiệu chỉnh van điều chỉnh áp suất bơm, van an toàn', 'Kiểm tra, hiệu chỉnh van điều chỉnh áp suất bơm, van an toàn', '5', '4', 4, NULL, 2),
(1056, 341, 'Kiểm tra, hiệu chỉnh van điều chỉnh áp suất bơm, van an toàn', 'Kiểm tra, hiệu chỉnh van điều chỉnh áp suất bơm, van an toàn', '5', '0', 2, NULL, 2),
(1057, 341, 'Kiểm tra bảo dưỡng hệ thống điện điều khiển bơm', 'Kiểm tra bảo dưỡng hệ thống điện điều khiển bơm', '5', '0', 12, NULL, 2),
(1058, 341, 'Kiểm tra bảo dưỡng hệ thống điện điều khiển bơm', 'Kiểm tra bảo dưỡng hệ thống điện điều khiển bơm', '5', '0', 10, NULL, 2),
(1059, 341, 'Kiểm tra bảo dưỡng hệ thống điện điều khiển bơm', 'Kiểm tra bảo dưỡng hệ thống điện điều khiển bơm', '5', '0', 8, NULL, 2),
(1060, 341, 'Kiểm tra bảo dưỡng hệ thống điện điều khiển bơm', 'Kiểm tra bảo dưỡng hệ thống điện điều khiển bơm', '5', '0', 14, NULL, 2),
(1061, 341, 'Kiểm tra bảo dưỡng hệ thống điện điều khiển bơm', 'Kiểm tra bảo dưỡng hệ thống điện điều khiển bơm', '5', '0', 16, NULL, 2),
(1062, 341, 'Kiểm tra bảo dưỡng hệ thống điện điều khiển bơm', 'Kiểm tra bảo dưỡng hệ thống điện điều khiển bơm', '5', '0', 6, NULL, 2),
(1063, 341, 'Kiểm tra bảo dưỡng hệ thống điện điều khiển bơm', 'Kiểm tra bảo dưỡng hệ thống điện điều khiển bơm', '5', '2', 4, NULL, 2),
(1064, 341, 'Kiểm tra bảo dưỡng hệ thống điện điều khiển bơm', 'Kiểm tra bảo dưỡng hệ thống điện điều khiển bơm', '5', '0', 2, NULL, 2),
(1065, 341, 'Kiểm tra điều chỉnh dây đai truyền động bơm', 'Kiểm tra điều chỉnh dây đai truyền động bơm', '5', '0', 12, NULL, 2),
(1066, 341, 'Kiểm tra điều chỉnh dây đai truyền động bơm', 'Kiểm tra điều chỉnh dây đai truyền động bơm', '5', '0', 10, NULL, 2),
(1067, 341, 'Kiểm tra điều chỉnh dây đai truyền động bơm', 'Kiểm tra điều chỉnh dây đai truyền động bơm', '5', '0', 8, NULL, 2),
(1068, 341, 'Kiểm tra điều chỉnh dây đai truyền động bơm', 'Kiểm tra điều chỉnh dây đai truyền động bơm', '5', '0', 14, NULL, 2),
(1069, 341, 'Kiểm tra điều chỉnh dây đai truyền động bơm', 'Kiểm tra điều chỉnh dây đai truyền động bơm', '5', '0', 16, NULL, 2),
(1070, 341, 'Kiểm tra điều chỉnh dây đai truyền động bơm', 'Kiểm tra điều chỉnh dây đai truyền động bơm', '5', '0', 6, NULL, 2),
(1071, 341, 'Kiểm tra điều chỉnh dây đai truyền động bơm', 'Kiểm tra điều chỉnh dây đai truyền động bơm', '5', '4', 4, NULL, 2),
(1072, 341, 'Kiểm tra điều chỉnh dây đai truyền động bơm', 'Kiểm tra điều chỉnh dây đai truyền động bơm', '5', '0', 2, NULL, 2),
(1073, 341, 'Kiểm tra điều chỉnh độ cân bằng đế bơm', 'Kiểm tra điều chỉnh độ cân bằng đế bơm', '5', '0', 12, NULL, 2),
(1074, 341, 'Kiểm tra điều chỉnh độ cân bằng đế bơm', 'Kiểm tra điều chỉnh độ cân bằng đế bơm', '5', '0', 10, NULL, 2),
(1075, 341, 'Kiểm tra điều chỉnh độ cân bằng đế bơm', 'Kiểm tra điều chỉnh độ cân bằng đế bơm', '5', '0', 8, NULL, 2),
(1076, 341, 'Kiểm tra điều chỉnh độ cân bằng đế bơm', 'Kiểm tra điều chỉnh độ cân bằng đế bơm', '5', '0', 14, NULL, 2),
(1077, 341, 'Kiểm tra điều chỉnh độ cân bằng đế bơm', 'Kiểm tra điều chỉnh độ cân bằng đế bơm', '5', '0', 16, NULL, 2),
(1078, 341, 'Kiểm tra điều chỉnh độ cân bằng đế bơm', 'Kiểm tra điều chỉnh độ cân bằng đế bơm', '5', '0', 6, NULL, 2),
(1079, 341, 'Kiểm tra điều chỉnh độ cân bằng đế bơm', 'Kiểm tra điều chỉnh độ cân bằng đế bơm', '5', '2', 4, NULL, 2),
(1080, 341, 'Kiểm tra điều chỉnh độ cân bằng đế bơm', 'Kiểm tra điều chỉnh độ cân bằng đế bơm', '5', '0', 2, NULL, 2),
(1081, 341, 'Kiểm tra téc nước', 'Kiểm tra téc nước', '5', '0', 12, NULL, 2),
(1082, 341, 'Kiểm tra téc nước', 'Kiểm tra téc nước', '5', '0', 10, NULL, 2),
(1083, 341, 'Kiểm tra téc nước', 'Kiểm tra téc nước', '5', '0', 8, NULL, 2),
(1084, 341, 'Kiểm tra téc nước', 'Kiểm tra téc nước', '5', '0', 14, NULL, 2),
(1085, 341, 'Kiểm tra téc nước', 'Kiểm tra téc nước', '5', '0', 16, NULL, 2),
(1086, 341, 'Kiểm tra téc nước', 'Kiểm tra téc nước', '5', '0', 6, NULL, 2),
(1087, 341, 'Kiểm tra téc nước', 'Kiểm tra téc nước', '5', '1', 4, NULL, 2),
(1088, 341, 'Kiểm tra téc nước', 'Kiểm tra téc nước', '5', '0', 2, NULL, 2),
(1089, 341, 'Tháo vệ sinh lưới lọc, bình lọc nước', 'Tháo vệ sinh lưới lọc, bình lọc nước', '5', '0', 12, NULL, 2),
(1090, 341, 'Tháo vệ sinh lưới lọc, bình lọc nước', 'Tháo vệ sinh lưới lọc, bình lọc nước', '5', '0', 10, NULL, 2),
(1091, 341, 'Tháo vệ sinh lưới lọc, bình lọc nước', 'Tháo vệ sinh lưới lọc, bình lọc nước', '5', '0', 8, NULL, 2),
(1092, 341, 'Tháo vệ sinh lưới lọc, bình lọc nước', 'Tháo vệ sinh lưới lọc, bình lọc nước', '5', '0', 14, NULL, 2),
(1093, 341, 'Tháo vệ sinh lưới lọc, bình lọc nước', 'Tháo vệ sinh lưới lọc, bình lọc nước', '5', '0', 16, NULL, 2),
(1094, 341, 'Tháo vệ sinh lưới lọc, bình lọc nước', 'Tháo vệ sinh lưới lọc, bình lọc nước', '5', '0', 6, NULL, 2),
(1095, 341, 'Tháo vệ sinh lưới lọc, bình lọc nước', 'Tháo vệ sinh lưới lọc, bình lọc nước', '5', '3', 4, NULL, 2),
(1096, 341, 'Tháo vệ sinh lưới lọc, bình lọc nước', 'Tháo vệ sinh lưới lọc, bình lọc nước', '5', '0', 2, NULL, 2),
(1097, 341, 'Kiểm tra siết chặt các mối nối, điều chỉnh áp suất nươc vào bơm', 'Kiểm tra siết chặt các mối nối, điều chỉnh áp suất nươc vào bơm', '5', '0', 12, NULL, 2),
(1098, 341, 'Kiểm tra siết chặt các mối nối, điều chỉnh áp suất nươc vào bơm', 'Kiểm tra siết chặt các mối nối, điều chỉnh áp suất nươc vào bơm', '5', '0', 10, NULL, 2),
(1099, 341, 'Kiểm tra siết chặt các mối nối, điều chỉnh áp suất nươc vào bơm', 'Kiểm tra siết chặt các mối nối, điều chỉnh áp suất nươc vào bơm', '5', '0', 8, NULL, 2),
(1100, 341, 'Kiểm tra siết chặt các mối nối, điều chỉnh áp suất nươc vào bơm', 'Kiểm tra siết chặt các mối nối, điều chỉnh áp suất nươc vào bơm', '5', '0', 14, NULL, 2),
(1101, 341, 'Kiểm tra siết chặt các mối nối, điều chỉnh áp suất nươc vào bơm', 'Kiểm tra siết chặt các mối nối, điều chỉnh áp suất nươc vào bơm', '5', '0', 16, NULL, 2),
(1102, 341, 'Kiểm tra siết chặt các mối nối, điều chỉnh áp suất nươc vào bơm', 'Kiểm tra siết chặt các mối nối, điều chỉnh áp suất nươc vào bơm', '5', '0', 6, NULL, 2),
(1103, 341, 'Kiểm tra siết chặt các mối nối, điều chỉnh áp suất nươc vào bơm', 'Kiểm tra siết chặt các mối nối, điều chỉnh áp suất nươc vào bơm', '5', '6', 4, NULL, 2),
(1104, 341, 'Kiểm tra siết chặt các mối nối, điều chỉnh áp suất nươc vào bơm', 'Kiểm tra siết chặt các mối nối, điều chỉnh áp suất nươc vào bơm', '5', '0', 2, NULL, 2),
(1105, 341, 'Kiểm tra, bảo dưỡng bổ xung dầu bôi trơn hộp số lai bơm CK', 'Kiểm tra, bảo dưỡng bổ xung dầu bôi trơn hộp số lai bơm CK', '5', '0', 12, NULL, 2),
(1106, 341, 'Kiểm tra, bảo dưỡng bổ xung dầu bôi trơn hộp số lai bơm CK', 'Kiểm tra, bảo dưỡng bổ xung dầu bôi trơn hộp số lai bơm CK', '5', '0', 10, NULL, 2),
(1107, 341, 'Kiểm tra, bảo dưỡng bổ xung dầu bôi trơn hộp số lai bơm CK', 'Kiểm tra, bảo dưỡng bổ xung dầu bôi trơn hộp số lai bơm CK', '5', '0', 8, NULL, 2),
(1108, 341, 'Kiểm tra, bảo dưỡng bổ xung dầu bôi trơn hộp số lai bơm CK', 'Kiểm tra, bảo dưỡng bổ xung dầu bôi trơn hộp số lai bơm CK', '5', '0', 14, NULL, 2),
(1109, 341, 'Kiểm tra, bảo dưỡng bổ xung dầu bôi trơn hộp số lai bơm CK', 'Kiểm tra, bảo dưỡng bổ xung dầu bôi trơn hộp số lai bơm CK', '5', '0', 16, NULL, 2),
(1110, 341, 'Kiểm tra, bảo dưỡng bổ xung dầu bôi trơn hộp số lai bơm CK', 'Kiểm tra, bảo dưỡng bổ xung dầu bôi trơn hộp số lai bơm CK', '5', '0', 6, NULL, 2),
(1111, 341, 'Kiểm tra, bảo dưỡng bổ xung dầu bôi trơn hộp số lai bơm CK', 'Kiểm tra, bảo dưỡng bổ xung dầu bôi trơn hộp số lai bơm CK', '5', '3', 4, NULL, 2),
(1112, 341, 'Kiểm tra, bảo dưỡng bổ xung dầu bôi trơn hộp số lai bơm CK', 'Kiểm tra, bảo dưỡng bổ xung dầu bôi trơn hộp số lai bơm CK', '5', '0', 2, NULL, 2),
(1113, 342, 'Tháo kiểm tra, bảo dưỡng, thay mỡ bôi trơn các vòng bi đỡ trục bơm nước', 'Tháo kiểm tra, bảo dưỡng, thay mỡ bôi trơn các vòng bi đỡ trục bơm nước', '5', '0', 12, NULL, 2),
(1114, 342, 'Tháo kiểm tra, bảo dưỡng, thay mỡ bôi trơn các vòng bi đỡ trục bơm nước', 'Tháo kiểm tra, bảo dưỡng, thay mỡ bôi trơn các vòng bi đỡ trục bơm nước', '5', '0', 10, NULL, 2),
(1115, 342, 'Tháo kiểm tra, bảo dưỡng, thay mỡ bôi trơn các vòng bi đỡ trục bơm nước', 'Tháo kiểm tra, bảo dưỡng, thay mỡ bôi trơn các vòng bi đỡ trục bơm nước', '5', '0', 8, NULL, 2),
(1116, 342, 'Tháo kiểm tra, bảo dưỡng, thay mỡ bôi trơn các vòng bi đỡ trục bơm nước', 'Tháo kiểm tra, bảo dưỡng, thay mỡ bôi trơn các vòng bi đỡ trục bơm nước', '5', '0', 14, NULL, 2),
(1117, 342, 'Tháo kiểm tra, bảo dưỡng, thay mỡ bôi trơn các vòng bi đỡ trục bơm nước', 'Tháo kiểm tra, bảo dưỡng, thay mỡ bôi trơn các vòng bi đỡ trục bơm nước', '5', '0', 16, NULL, 2),
(1118, 342, 'Tháo kiểm tra, bảo dưỡng, thay mỡ bôi trơn các vòng bi đỡ trục bơm nước', 'Tháo kiểm tra, bảo dưỡng, thay mỡ bôi trơn các vòng bi đỡ trục bơm nước', '5', '0', 6, NULL, 2),
(1119, 342, 'Tháo kiểm tra, bảo dưỡng, thay mỡ bôi trơn các vòng bi đỡ trục bơm nước', 'Tháo kiểm tra, bảo dưỡng, thay mỡ bôi trơn các vòng bi đỡ trục bơm nước', '5', '4', 4, NULL, 2),
(1120, 342, 'Tháo kiểm tra, bảo dưỡng, thay mỡ bôi trơn các vòng bi đỡ trục bơm nước', 'Tháo kiểm tra, bảo dưỡng, thay mỡ bôi trơn các vòng bi đỡ trục bơm nước', '5', '0', 2, NULL, 2),
(1121, 342, 'Kiểm tra, xiết chặt làm kín bơm nước và các ống dẫn', 'Kiểm tra, xiết chặt làm kín bơm nước và các ống dẫn', '5', '0', 12, NULL, 2),
(1122, 342, 'Kiểm tra, xiết chặt làm kín bơm nước và các ống dẫn', 'Kiểm tra, xiết chặt làm kín bơm nước và các ống dẫn', '5', '0', 10, NULL, 2),
(1123, 342, 'Kiểm tra, xiết chặt làm kín bơm nước và các ống dẫn', 'Kiểm tra, xiết chặt làm kín bơm nước và các ống dẫn', '5', '0', 8, NULL, 2),
(1124, 342, 'Kiểm tra, xiết chặt làm kín bơm nước và các ống dẫn', 'Kiểm tra, xiết chặt làm kín bơm nước và các ống dẫn', '5', '0', 14, NULL, 2),
(1125, 342, 'Kiểm tra, xiết chặt làm kín bơm nước và các ống dẫn', 'Kiểm tra, xiết chặt làm kín bơm nước và các ống dẫn', '5', '0', 16, NULL, 2),
(1126, 342, 'Kiểm tra, xiết chặt làm kín bơm nước và các ống dẫn', 'Kiểm tra, xiết chặt làm kín bơm nước và các ống dẫn', '5', '0', 6, NULL, 2),
(1127, 342, 'Kiểm tra, xiết chặt làm kín bơm nước và các ống dẫn', 'Kiểm tra, xiết chặt làm kín bơm nước và các ống dẫn', '5', '2', 4, NULL, 2),
(1128, 342, 'Kiểm tra, xiết chặt làm kín bơm nước và các ống dẫn', 'Kiểm tra, xiết chặt làm kín bơm nước và các ống dẫn', '5', '0', 2, NULL, 2),
(1129, 342, 'Kiểm tra, làm vệ sinh thân bơm, cánh bơm, khoang công suất', 'Kiểm tra, làm vệ sinh thân bơm, cánh bơm, khoang công suất', '5', '0', 12, NULL, 2),
(1130, 342, 'Kiểm tra, làm vệ sinh thân bơm, cánh bơm, khoang công suất', 'Kiểm tra, làm vệ sinh thân bơm, cánh bơm, khoang công suất', '5', '0', 10, NULL, 2),
(1131, 342, 'Kiểm tra, làm vệ sinh thân bơm, cánh bơm, khoang công suất', 'Kiểm tra, làm vệ sinh thân bơm, cánh bơm, khoang công suất', '5', '0', 8, NULL, 2),
(1132, 342, 'Kiểm tra, làm vệ sinh thân bơm, cánh bơm, khoang công suất', 'Kiểm tra, làm vệ sinh thân bơm, cánh bơm, khoang công suất', '5', '0', 14, NULL, 2),
(1133, 342, 'Kiểm tra, làm vệ sinh thân bơm, cánh bơm, khoang công suất', 'Kiểm tra, làm vệ sinh thân bơm, cánh bơm, khoang công suất', '5', '0', 16, NULL, 2),
(1134, 342, 'Kiểm tra, làm vệ sinh thân bơm, cánh bơm, khoang công suất', 'Kiểm tra, làm vệ sinh thân bơm, cánh bơm, khoang công suất', '5', '0', 6, NULL, 2),
(1135, 342, 'Kiểm tra, làm vệ sinh thân bơm, cánh bơm, khoang công suất', 'Kiểm tra, làm vệ sinh thân bơm, cánh bơm, khoang công suất', '5', '1', 4, NULL, 2),
(1136, 342, 'Kiểm tra, làm vệ sinh thân bơm, cánh bơm, khoang công suất', 'Kiểm tra, làm vệ sinh thân bơm, cánh bơm, khoang công suất', '5', '0', 2, NULL, 2),
(1137, 342, 'Kiểm tra, bảo dưỡng trục truyền động từ động cơ sang bơm, dây điều chỉnh tốc độ bơm', 'Kiểm tra, bảo dưỡng trục truyền động từ động cơ sang bơm, dây điều chỉnh tốc độ bơm', '5', '0', 12, NULL, 2),
(1138, 342, 'Kiểm tra, bảo dưỡng trục truyền động từ động cơ sang bơm, dây điều chỉnh tốc độ bơm', 'Kiểm tra, bảo dưỡng trục truyền động từ động cơ sang bơm, dây điều chỉnh tốc độ bơm', '5', '0', 10, NULL, 2),
(1139, 342, 'Kiểm tra, bảo dưỡng trục truyền động từ động cơ sang bơm, dây điều chỉnh tốc độ bơm', 'Kiểm tra, bảo dưỡng trục truyền động từ động cơ sang bơm, dây điều chỉnh tốc độ bơm', '5', '0', 8, NULL, 2),
(1140, 342, 'Kiểm tra, bảo dưỡng trục truyền động từ động cơ sang bơm, dây điều chỉnh tốc độ bơm', 'Kiểm tra, bảo dưỡng trục truyền động từ động cơ sang bơm, dây điều chỉnh tốc độ bơm', '5', '0', 14, NULL, 2),
(1141, 342, 'Kiểm tra, bảo dưỡng trục truyền động từ động cơ sang bơm, dây điều chỉnh tốc độ bơm', 'Kiểm tra, bảo dưỡng trục truyền động từ động cơ sang bơm, dây điều chỉnh tốc độ bơm', '5', '0', 16, NULL, 2),
(1142, 342, 'Kiểm tra, bảo dưỡng trục truyền động từ động cơ sang bơm, dây điều chỉnh tốc độ bơm', 'Kiểm tra, bảo dưỡng trục truyền động từ động cơ sang bơm, dây điều chỉnh tốc độ bơm', '5', '0', 6, NULL, 2),
(1143, 342, 'Kiểm tra, bảo dưỡng trục truyền động từ động cơ sang bơm, dây điều chỉnh tốc độ bơm', 'Kiểm tra, bảo dưỡng trục truyền động từ động cơ sang bơm, dây điều chỉnh tốc độ bơm', '5', '2', 4, NULL, 2),
(1144, 342, 'Kiểm tra, bảo dưỡng trục truyền động từ động cơ sang bơm, dây điều chỉnh tốc độ bơm', 'Kiểm tra, bảo dưỡng trục truyền động từ động cơ sang bơm, dây điều chỉnh tốc độ bơm', '5', '0', 2, NULL, 2),
(1145, 342, 'Kiểm tra, điều chỉnh độ căng dây curoa lai bơm', 'Kiểm tra, điều chỉnh độ căng dây curoa lai bơm', '5', '0', 12, NULL, 2),
(1146, 342, 'Kiểm tra, điều chỉnh độ căng dây curoa lai bơm', 'Kiểm tra, điều chỉnh độ căng dây curoa lai bơm', '5', '0', 10, NULL, 2),
(1147, 342, 'Kiểm tra, điều chỉnh độ căng dây curoa lai bơm', 'Kiểm tra, điều chỉnh độ căng dây curoa lai bơm', '5', '0', 8, NULL, 2),
(1148, 342, 'Kiểm tra, điều chỉnh độ căng dây curoa lai bơm', 'Kiểm tra, điều chỉnh độ căng dây curoa lai bơm', '5', '0', 14, NULL, 2),
(1149, 342, 'Kiểm tra, điều chỉnh độ căng dây curoa lai bơm', 'Kiểm tra, điều chỉnh độ căng dây curoa lai bơm', '5', '0', 16, NULL, 2),
(1150, 342, 'Kiểm tra, điều chỉnh độ căng dây curoa lai bơm', 'Kiểm tra, điều chỉnh độ căng dây curoa lai bơm', '5', '0', 6, NULL, 2),
(1151, 342, 'Kiểm tra, điều chỉnh độ căng dây curoa lai bơm', 'Kiểm tra, điều chỉnh độ căng dây curoa lai bơm', '5', '2', 4, NULL, 2),
(1152, 342, 'Kiểm tra, điều chỉnh độ căng dây curoa lai bơm', 'Kiểm tra, điều chỉnh độ căng dây curoa lai bơm', '5', '0', 2, NULL, 2),
(1153, 342, 'Kiểm tra, vệ sinh van khóa đáy téc nước', 'Kiểm tra, vệ sinh van khóa đáy téc nước', '5', '0', 12, NULL, 2),
(1154, 342, 'Kiểm tra, vệ sinh van khóa đáy téc nước', 'Kiểm tra, vệ sinh van khóa đáy téc nước', '5', '0', 10, NULL, 2),
(1155, 342, 'Kiểm tra, vệ sinh van khóa đáy téc nước', 'Kiểm tra, vệ sinh van khóa đáy téc nước', '5', '0', 8, NULL, 2),
(1156, 342, 'Kiểm tra, vệ sinh van khóa đáy téc nước', 'Kiểm tra, vệ sinh van khóa đáy téc nước', '5', '0', 14, NULL, 2),
(1157, 342, 'Kiểm tra, vệ sinh van khóa đáy téc nước', 'Kiểm tra, vệ sinh van khóa đáy téc nước', '5', '0', 16, NULL, 2),
(1158, 342, 'Kiểm tra, vệ sinh van khóa đáy téc nước', 'Kiểm tra, vệ sinh van khóa đáy téc nước', '5', '0', 6, NULL, 2),
(1159, 342, 'Kiểm tra, vệ sinh van khóa đáy téc nước', 'Kiểm tra, vệ sinh van khóa đáy téc nước', '5', '3', 4, NULL, 2),
(1160, 342, 'Kiểm tra, vệ sinh van khóa đáy téc nước', 'Kiểm tra, vệ sinh van khóa đáy téc nước', '5', '0', 2, NULL, 2),
(1161, 342, 'Tháo bảo dưỡng van 4 chiều, 2 chiều', 'Tháo bảo dưỡng van 4 chiều, 2 chiều', '5', '0', 12, NULL, 2),
(1162, 342, 'Tháo bảo dưỡng van 4 chiều, 2 chiều', 'Tháo bảo dưỡng van 4 chiều, 2 chiều', '5', '0', 10, NULL, 2),
(1163, 342, 'Tháo bảo dưỡng van 4 chiều, 2 chiều', 'Tháo bảo dưỡng van 4 chiều, 2 chiều', '5', '0', 8, NULL, 2),
(1164, 342, 'Tháo bảo dưỡng van 4 chiều, 2 chiều', 'Tháo bảo dưỡng van 4 chiều, 2 chiều', '5', '0', 14, NULL, 2),
(1165, 342, 'Tháo bảo dưỡng van 4 chiều, 2 chiều', 'Tháo bảo dưỡng van 4 chiều, 2 chiều', '5', '0', 16, NULL, 2),
(1166, 342, 'Tháo bảo dưỡng van 4 chiều, 2 chiều', 'Tháo bảo dưỡng van 4 chiều, 2 chiều', '5', '0', 6, NULL, 2),
(1167, 342, 'Tháo bảo dưỡng van 4 chiều, 2 chiều', 'Tháo bảo dưỡng van 4 chiều, 2 chiều', '5', '2', 4, NULL, 2),
(1168, 342, 'Tháo bảo dưỡng van 4 chiều, 2 chiều', 'Tháo bảo dưỡng van 4 chiều, 2 chiều', '5', '0', 2, NULL, 2),
(1169, 342, 'Kiểm tra, làm vệ sinh bên trong, bên ngoài téc nước', 'Kiểm tra, làm vệ sinh bên trong, bên ngoài téc nước', '5', '0', 12, NULL, 2),
(1170, 342, 'Kiểm tra, làm vệ sinh bên trong, bên ngoài téc nước', 'Kiểm tra, làm vệ sinh bên trong, bên ngoài téc nước', '5', '0', 10, NULL, 2),
(1171, 342, 'Kiểm tra, làm vệ sinh bên trong, bên ngoài téc nước', 'Kiểm tra, làm vệ sinh bên trong, bên ngoài téc nước', '5', '0', 8, NULL, 2),
(1172, 342, 'Kiểm tra, làm vệ sinh bên trong, bên ngoài téc nước', 'Kiểm tra, làm vệ sinh bên trong, bên ngoài téc nước', '5', '0', 14, NULL, 2),
(1173, 342, 'Kiểm tra, làm vệ sinh bên trong, bên ngoài téc nước', 'Kiểm tra, làm vệ sinh bên trong, bên ngoài téc nước', '5', '0', 16, NULL, 2),
(1174, 342, 'Kiểm tra, làm vệ sinh bên trong, bên ngoài téc nước', 'Kiểm tra, làm vệ sinh bên trong, bên ngoài téc nước', '5', '0', 6, NULL, 2),
(1175, 342, 'Kiểm tra, làm vệ sinh bên trong, bên ngoài téc nước', 'Kiểm tra, làm vệ sinh bên trong, bên ngoài téc nước', '5', '1', 4, NULL, 2),
(1176, 342, 'Kiểm tra, làm vệ sinh bên trong, bên ngoài téc nước', 'Kiểm tra, làm vệ sinh bên trong, bên ngoài téc nước', '5', '0', 2, NULL, 2),
(1177, 342, 'Kiểm tra, siết chặt các bu lông liên kết téc nước với sắc xi.', 'Kiểm tra, siết chặt các bu lông liên kết téc nước với sắc xi.', '5', '0', 12, NULL, 2),
(1178, 342, 'Kiểm tra, siết chặt các bu lông liên kết téc nước với sắc xi.', 'Kiểm tra, siết chặt các bu lông liên kết téc nước với sắc xi.', '5', '0', 10, NULL, 2),
(1179, 342, 'Kiểm tra, siết chặt các bu lông liên kết téc nước với sắc xi.', 'Kiểm tra, siết chặt các bu lông liên kết téc nước với sắc xi.', '5', '0', 8, NULL, 2),
(1180, 342, 'Kiểm tra, siết chặt các bu lông liên kết téc nước với sắc xi.', 'Kiểm tra, siết chặt các bu lông liên kết téc nước với sắc xi.', '5', '0', 14, NULL, 2),
(1181, 342, 'Kiểm tra, siết chặt các bu lông liên kết téc nước với sắc xi.', 'Kiểm tra, siết chặt các bu lông liên kết téc nước với sắc xi.', '5', '0', 16, NULL, 2),
(1182, 342, 'Kiểm tra, siết chặt các bu lông liên kết téc nước với sắc xi.', 'Kiểm tra, siết chặt các bu lông liên kết téc nước với sắc xi.', '5', '0', 6, NULL, 2),
(1183, 342, 'Kiểm tra, siết chặt các bu lông liên kết téc nước với sắc xi.', 'Kiểm tra, siết chặt các bu lông liên kết téc nước với sắc xi.', '5', '1', 4, NULL, 2),
(1184, 342, 'Kiểm tra, siết chặt các bu lông liên kết téc nước với sắc xi.', 'Kiểm tra, siết chặt các bu lông liên kết téc nước với sắc xi.', '5', '0', 2, NULL, 2),
(1185, 342, 'Tháo kiểm tra, làm sạch bộ phận thông hơi téc nước, thước đo mực nước', 'Tháo kiểm tra, làm sạch bộ phận thông hơi téc nước, thước đo mực nước', '5', '0', 12, NULL, 2),
(1186, 342, 'Tháo kiểm tra, làm sạch bộ phận thông hơi téc nước, thước đo mực nước', 'Tháo kiểm tra, làm sạch bộ phận thông hơi téc nước, thước đo mực nước', '5', '0', 10, NULL, 2),
(1187, 342, 'Tháo kiểm tra, làm sạch bộ phận thông hơi téc nước, thước đo mực nước', 'Tháo kiểm tra, làm sạch bộ phận thông hơi téc nước, thước đo mực nước', '5', '0', 8, NULL, 2),
(1188, 342, 'Tháo kiểm tra, làm sạch bộ phận thông hơi téc nước, thước đo mực nước', 'Tháo kiểm tra, làm sạch bộ phận thông hơi téc nước, thước đo mực nước', '5', '0', 14, NULL, 2),
(1189, 342, 'Tháo kiểm tra, làm sạch bộ phận thông hơi téc nước, thước đo mực nước', 'Tháo kiểm tra, làm sạch bộ phận thông hơi téc nước, thước đo mực nước', '5', '0', 16, NULL, 2),
(1190, 342, 'Tháo kiểm tra, làm sạch bộ phận thông hơi téc nước, thước đo mực nước', 'Tháo kiểm tra, làm sạch bộ phận thông hơi téc nước, thước đo mực nước', '5', '0', 6, NULL, 2),
(1191, 342, 'Tháo kiểm tra, làm sạch bộ phận thông hơi téc nước, thước đo mực nước', 'Tháo kiểm tra, làm sạch bộ phận thông hơi téc nước, thước đo mực nước', '5', '2', 4, NULL, 2),
(1192, 342, 'Tháo kiểm tra, làm sạch bộ phận thông hơi téc nước, thước đo mực nước', 'Tháo kiểm tra, làm sạch bộ phận thông hơi téc nước, thước đo mực nước', '5', '0', 2, NULL, 2),
(1193, 343, 'Kiểm tra, bảo dưỡng, bơm mỡ vòng răng và  bánh răng chủ động của toa quay', 'Kiểm tra, bảo dưỡng, bơm mỡ vòng răng và  bánh răng chủ động của toa quay', '5', '0', 12, NULL, 2),
(1194, 343, 'Kiểm tra, bảo dưỡng, bơm mỡ vòng răng và  bánh răng chủ động của toa quay', 'Kiểm tra, bảo dưỡng, bơm mỡ vòng răng và  bánh răng chủ động của toa quay', '5', '0', 10, NULL, 2),
(1195, 343, 'Kiểm tra, bảo dưỡng, bơm mỡ vòng răng và  bánh răng chủ động của toa quay', 'Kiểm tra, bảo dưỡng, bơm mỡ vòng răng và  bánh răng chủ động của toa quay', '5', '6', 8, NULL, 2),
(1196, 343, 'Kiểm tra, bảo dưỡng, bơm mỡ vòng răng và  bánh răng chủ động của toa quay', 'Kiểm tra, bảo dưỡng, bơm mỡ vòng răng và  bánh răng chủ động của toa quay', '5', '0', 14, NULL, 2),
(1197, 343, 'Kiểm tra, bảo dưỡng, bơm mỡ vòng răng và  bánh răng chủ động của toa quay', 'Kiểm tra, bảo dưỡng, bơm mỡ vòng răng và  bánh răng chủ động của toa quay', '5', '0', 16, NULL, 2),
(1198, 343, 'Kiểm tra, bảo dưỡng, bơm mỡ vòng răng và  bánh răng chủ động của toa quay', 'Kiểm tra, bảo dưỡng, bơm mỡ vòng răng và  bánh răng chủ động của toa quay', '5', '3', 6, NULL, 2),
(1199, 343, 'Kiểm tra, bảo dưỡng, bơm mỡ vòng răng và  bánh răng chủ động của toa quay', 'Kiểm tra, bảo dưỡng, bơm mỡ vòng răng và  bánh răng chủ động của toa quay', '5', '3', 4, NULL, 2),
(1200, 343, 'Kiểm tra, bảo dưỡng, bơm mỡ vòng răng và  bánh răng chủ động của toa quay', 'Kiểm tra, bảo dưỡng, bơm mỡ vòng răng và  bánh răng chủ động của toa quay', '5', '0', 2, NULL, 2),
(1201, 343, 'Kiểm tra sự rò rỉ dầu, vệ sinh bảo dưỡng hộp giảm tốc của tang quay, phanh tang quay', 'Kiểm tra sự rò rỉ dầu, vệ sinh bảo dưỡng hộp giảm tốc của tang quay, phanh tang quay', '5', '0', 12, NULL, 2),
(1202, 343, 'Kiểm tra sự rò rỉ dầu, vệ sinh bảo dưỡng hộp giảm tốc của tang quay, phanh tang quay', 'Kiểm tra sự rò rỉ dầu, vệ sinh bảo dưỡng hộp giảm tốc của tang quay, phanh tang quay', '5', '0', 10, NULL, 2),
(1203, 343, 'Kiểm tra sự rò rỉ dầu, vệ sinh bảo dưỡng hộp giảm tốc của tang quay, phanh tang quay', 'Kiểm tra sự rò rỉ dầu, vệ sinh bảo dưỡng hộp giảm tốc của tang quay, phanh tang quay', '5', '6', 8, NULL, 2),
(1204, 343, 'Kiểm tra sự rò rỉ dầu, vệ sinh bảo dưỡng hộp giảm tốc của tang quay, phanh tang quay', 'Kiểm tra sự rò rỉ dầu, vệ sinh bảo dưỡng hộp giảm tốc của tang quay, phanh tang quay', '5', '0', 14, NULL, 2),
(1205, 343, 'Kiểm tra sự rò rỉ dầu, vệ sinh bảo dưỡng hộp giảm tốc của tang quay, phanh tang quay', 'Kiểm tra sự rò rỉ dầu, vệ sinh bảo dưỡng hộp giảm tốc của tang quay, phanh tang quay', '5', '0', 16, NULL, 2),
(1206, 343, 'Kiểm tra sự rò rỉ dầu, vệ sinh bảo dưỡng hộp giảm tốc của tang quay, phanh tang quay', 'Kiểm tra sự rò rỉ dầu, vệ sinh bảo dưỡng hộp giảm tốc của tang quay, phanh tang quay', '5', '3', 6, NULL, 2),
(1207, 343, 'Kiểm tra sự rò rỉ dầu, vệ sinh bảo dưỡng hộp giảm tốc của tang quay, phanh tang quay', 'Kiểm tra sự rò rỉ dầu, vệ sinh bảo dưỡng hộp giảm tốc của tang quay, phanh tang quay', '5', '3', 4, NULL, 2),
(1208, 343, 'Kiểm tra sự rò rỉ dầu, vệ sinh bảo dưỡng hộp giảm tốc của tang quay, phanh tang quay', 'Kiểm tra sự rò rỉ dầu, vệ sinh bảo dưỡng hộp giảm tốc của tang quay, phanh tang quay', '5', '0', 2, NULL, 2),
(1209, 343, 'Kiểm tra, bảo dưỡng hệ thống ròng rọc dẫn cáp, móc cáp, xoay móc cáp', 'Kiểm tra, bảo dưỡng hệ thống ròng rọc dẫn cáp, móc cáp, xoay móc cáp', '5', '0', 12, NULL, 2),
(1210, 343, 'Kiểm tra, bảo dưỡng hệ thống ròng rọc dẫn cáp, móc cáp, xoay móc cáp', 'Kiểm tra, bảo dưỡng hệ thống ròng rọc dẫn cáp, móc cáp, xoay móc cáp', '5', '0', 10, NULL, 2),
(1211, 343, 'Kiểm tra, bảo dưỡng hệ thống ròng rọc dẫn cáp, móc cáp, xoay móc cáp', 'Kiểm tra, bảo dưỡng hệ thống ròng rọc dẫn cáp, móc cáp, xoay móc cáp', '5', '4', 8, NULL, 2),
(1212, 343, 'Kiểm tra, bảo dưỡng hệ thống ròng rọc dẫn cáp, móc cáp, xoay móc cáp', 'Kiểm tra, bảo dưỡng hệ thống ròng rọc dẫn cáp, móc cáp, xoay móc cáp', '5', '0', 14, NULL, 2),
(1213, 343, 'Kiểm tra, bảo dưỡng hệ thống ròng rọc dẫn cáp, móc cáp, xoay móc cáp', 'Kiểm tra, bảo dưỡng hệ thống ròng rọc dẫn cáp, móc cáp, xoay móc cáp', '5', '0', 16, NULL, 2),
(1214, 343, 'Kiểm tra, bảo dưỡng hệ thống ròng rọc dẫn cáp, móc cáp, xoay móc cáp', 'Kiểm tra, bảo dưỡng hệ thống ròng rọc dẫn cáp, móc cáp, xoay móc cáp', '5', '2', 6, NULL, 2),
(1215, 343, 'Kiểm tra, bảo dưỡng hệ thống ròng rọc dẫn cáp, móc cáp, xoay móc cáp', 'Kiểm tra, bảo dưỡng hệ thống ròng rọc dẫn cáp, móc cáp, xoay móc cáp', '5', '2', 4, NULL, 2),
(1216, 343, 'Kiểm tra, bảo dưỡng hệ thống ròng rọc dẫn cáp, móc cáp, xoay móc cáp', 'Kiểm tra, bảo dưỡng hệ thống ròng rọc dẫn cáp, móc cáp, xoay móc cáp', '5', '0', 2, NULL, 2),
(1217, 343, 'Kiểm tra, bôi trơn toàn bộ hệ thống dây cáp tời (thay thế cáp nếu cần)', 'Kiểm tra, bôi trơn toàn bộ hệ thống dây cáp tời (thay thế cáp nếu cần)', '5', '0', 12, NULL, 2),
(1218, 343, 'Kiểm tra, bôi trơn toàn bộ hệ thống dây cáp tời (thay thế cáp nếu cần)', 'Kiểm tra, bôi trơn toàn bộ hệ thống dây cáp tời (thay thế cáp nếu cần)', '5', '0', 10, NULL, 2),
(1219, 343, 'Kiểm tra, bôi trơn toàn bộ hệ thống dây cáp tời (thay thế cáp nếu cần)', 'Kiểm tra, bôi trơn toàn bộ hệ thống dây cáp tời (thay thế cáp nếu cần)', '5', '4', 8, NULL, 2),
(1220, 343, 'Kiểm tra, bôi trơn toàn bộ hệ thống dây cáp tời (thay thế cáp nếu cần)', 'Kiểm tra, bôi trơn toàn bộ hệ thống dây cáp tời (thay thế cáp nếu cần)', '5', '0', 14, NULL, 2),
(1221, 343, 'Kiểm tra, bôi trơn toàn bộ hệ thống dây cáp tời (thay thế cáp nếu cần)', 'Kiểm tra, bôi trơn toàn bộ hệ thống dây cáp tời (thay thế cáp nếu cần)', '5', '0', 16, NULL, 2),
(1222, 343, 'Kiểm tra, bôi trơn toàn bộ hệ thống dây cáp tời (thay thế cáp nếu cần)', 'Kiểm tra, bôi trơn toàn bộ hệ thống dây cáp tời (thay thế cáp nếu cần)', '5', '2', 6, NULL, 2),
(1223, 343, 'Kiểm tra, bôi trơn toàn bộ hệ thống dây cáp tời (thay thế cáp nếu cần)', 'Kiểm tra, bôi trơn toàn bộ hệ thống dây cáp tời (thay thế cáp nếu cần)', '5', '2', 4, NULL, 2),
(1224, 343, 'Kiểm tra, bôi trơn toàn bộ hệ thống dây cáp tời (thay thế cáp nếu cần)', 'Kiểm tra, bôi trơn toàn bộ hệ thống dây cáp tời (thay thế cáp nếu cần)', '5', '0', 2, NULL, 2),
(1225, 343, 'Kiểm tra các đốt cần trục, các bu lông kẹp giá đỡ cần', 'Kiểm tra các đốt cần trục, các bu lông kẹp giá đỡ cần', '5', '0', 12, NULL, 2),
(1226, 343, 'Kiểm tra các đốt cần trục, các bu lông kẹp giá đỡ cần', 'Kiểm tra các đốt cần trục, các bu lông kẹp giá đỡ cần', '5', '0', 10, NULL, 2),
(1227, 343, 'Kiểm tra các đốt cần trục, các bu lông kẹp giá đỡ cần', 'Kiểm tra các đốt cần trục, các bu lông kẹp giá đỡ cần', '5', '4', 8, NULL, 2),
(1228, 343, 'Kiểm tra các đốt cần trục, các bu lông kẹp giá đỡ cần', 'Kiểm tra các đốt cần trục, các bu lông kẹp giá đỡ cần', '5', '0', 14, NULL, 2),
(1229, 343, 'Kiểm tra các đốt cần trục, các bu lông kẹp giá đỡ cần', 'Kiểm tra các đốt cần trục, các bu lông kẹp giá đỡ cần', '5', '0', 16, NULL, 2),
(1230, 343, 'Kiểm tra các đốt cần trục, các bu lông kẹp giá đỡ cần', 'Kiểm tra các đốt cần trục, các bu lông kẹp giá đỡ cần', '5', '2', 6, NULL, 2),
(1231, 343, 'Kiểm tra các đốt cần trục, các bu lông kẹp giá đỡ cần', 'Kiểm tra các đốt cần trục, các bu lông kẹp giá đỡ cần', '5', '2', 4, NULL, 2),
(1232, 343, 'Kiểm tra các đốt cần trục, các bu lông kẹp giá đỡ cần', 'Kiểm tra các đốt cần trục, các bu lông kẹp giá đỡ cần', '5', '0', 2, NULL, 2),
(1233, 343, 'Kiểm tra, bảo dưỡng hệ  thống điều khiển cẩu', 'Kiểm tra, bảo dưỡng hệ  thống điều khiển cẩu', '5', '0', 12, NULL, 2),
(1234, 343, 'Kiểm tra, bảo dưỡng hệ  thống điều khiển cẩu', 'Kiểm tra, bảo dưỡng hệ  thống điều khiển cẩu', '5', '0', 10, NULL, 2),
(1235, 343, 'Kiểm tra, bảo dưỡng hệ  thống điều khiển cẩu', 'Kiểm tra, bảo dưỡng hệ  thống điều khiển cẩu', '5', '2', 8, NULL, 2),
(1236, 343, 'Kiểm tra, bảo dưỡng hệ  thống điều khiển cẩu', 'Kiểm tra, bảo dưỡng hệ  thống điều khiển cẩu', '5', '0', 14, NULL, 2),
(1237, 343, 'Kiểm tra, bảo dưỡng hệ  thống điều khiển cẩu', 'Kiểm tra, bảo dưỡng hệ  thống điều khiển cẩu', '5', '0', 16, NULL, 2),
(1238, 343, 'Kiểm tra, bảo dưỡng hệ  thống điều khiển cẩu', 'Kiểm tra, bảo dưỡng hệ  thống điều khiển cẩu', '5', '1', 6, NULL, 2),
(1239, 343, 'Kiểm tra, bảo dưỡng hệ  thống điều khiển cẩu', 'Kiểm tra, bảo dưỡng hệ  thống điều khiển cẩu', '5', '1', 4, NULL, 2),
(1240, 343, 'Kiểm tra, bảo dưỡng hệ  thống điều khiển cẩu', 'Kiểm tra, bảo dưỡng hệ  thống điều khiển cẩu', '5', '0', 2, NULL, 2),
(1241, 343, 'Kiểm tra, bảo dưỡng hệ thống an toàn, cảnh báo, đo tải', 'Kiểm tra, bảo dưỡng hệ thống an toàn, cảnh báo, đo tải', '5', '0', 12, NULL, 2),
(1242, 343, 'Kiểm tra, bảo dưỡng hệ thống an toàn, cảnh báo, đo tải', 'Kiểm tra, bảo dưỡng hệ thống an toàn, cảnh báo, đo tải', '5', '0', 10, NULL, 2),
(1243, 343, 'Kiểm tra, bảo dưỡng hệ thống an toàn, cảnh báo, đo tải', 'Kiểm tra, bảo dưỡng hệ thống an toàn, cảnh báo, đo tải', '5', '2', 8, NULL, 2),
(1244, 343, 'Kiểm tra, bảo dưỡng hệ thống an toàn, cảnh báo, đo tải', 'Kiểm tra, bảo dưỡng hệ thống an toàn, cảnh báo, đo tải', '5', '0', 14, NULL, 2),
(1245, 343, 'Kiểm tra, bảo dưỡng hệ thống an toàn, cảnh báo, đo tải', 'Kiểm tra, bảo dưỡng hệ thống an toàn, cảnh báo, đo tải', '5', '0', 16, NULL, 2),
(1246, 343, 'Kiểm tra, bảo dưỡng hệ thống an toàn, cảnh báo, đo tải', 'Kiểm tra, bảo dưỡng hệ thống an toàn, cảnh báo, đo tải', '5', '1', 6, NULL, 2),
(1247, 343, 'Kiểm tra, bảo dưỡng hệ thống an toàn, cảnh báo, đo tải', 'Kiểm tra, bảo dưỡng hệ thống an toàn, cảnh báo, đo tải', '5', '1', 4, NULL, 2),
(1248, 343, 'Kiểm tra, bảo dưỡng hệ thống an toàn, cảnh báo, đo tải', 'Kiểm tra, bảo dưỡng hệ thống an toàn, cảnh báo, đo tải', '5', '0', 2, NULL, 2),
(1249, 344, 'Kiểm tra ben, lưỡi ủi, càng ben, tay gầu, răng gầu... Để phát hiện khuyết tật (nứt, rách...)', 'Kiểm tra ben, lưỡi ủi, càng ben, tay gầu, răng gầu... Để phát hiện khuyết tật (nứt, rách...)', '4', '3', 12, NULL, 2),
(1250, 344, 'Kiểm tra ben, lưỡi ủi, càng ben, tay gầu, răng gầu... Để phát hiện khuyết tật (nứt, rách...)', 'Kiểm tra ben, lưỡi ủi, càng ben, tay gầu, răng gầu... Để phát hiện khuyết tật (nứt, rách...)', '4', '4', 10, NULL, 2),
(1251, 344, 'Kiểm tra ben, lưỡi ủi, càng ben, tay gầu, răng gầu... Để phát hiện khuyết tật (nứt, rách...)', 'Kiểm tra ben, lưỡi ủi, càng ben, tay gầu, răng gầu... Để phát hiện khuyết tật (nứt, rách...)', '4', '0', 8, NULL, 2),
(1252, 344, 'Kiểm tra ben, lưỡi ủi, càng ben, tay gầu, răng gầu... Để phát hiện khuyết tật (nứt, rách...)', 'Kiểm tra ben, lưỡi ủi, càng ben, tay gầu, răng gầu... Để phát hiện khuyết tật (nứt, rách...)', '4', '0', 14, NULL, 2),
(1253, 344, 'Kiểm tra ben, lưỡi ủi, càng ben, tay gầu, răng gầu... Để phát hiện khuyết tật (nứt, rách...)', 'Kiểm tra ben, lưỡi ủi, càng ben, tay gầu, răng gầu... Để phát hiện khuyết tật (nứt, rách...)', '4', '0', 16, NULL, 2),
(1254, 344, 'Kiểm tra ben, lưỡi ủi, càng ben, tay gầu, răng gầu... Để phát hiện khuyết tật (nứt, rách...)', 'Kiểm tra ben, lưỡi ủi, càng ben, tay gầu, răng gầu... Để phát hiện khuyết tật (nứt, rách...)', '4', '0', 6, NULL, 2),
(1255, 344, 'Kiểm tra ben, lưỡi ủi, càng ben, tay gầu, răng gầu... Để phát hiện khuyết tật (nứt, rách...)', 'Kiểm tra ben, lưỡi ủi, càng ben, tay gầu, răng gầu... Để phát hiện khuyết tật (nứt, rách...)', '4', '0', 4, NULL, 2),
(1256, 344, 'Kiểm tra ben, lưỡi ủi, càng ben, tay gầu, răng gầu... Để phát hiện khuyết tật (nứt, rách...)', 'Kiểm tra ben, lưỡi ủi, càng ben, tay gầu, răng gầu... Để phát hiện khuyết tật (nứt, rách...)', '4', '0', 2, NULL, 2),
(1257, 344, 'Kiểm tra các chốt gầu, các khớp liên kết, điều chỉnh khe hở khi cần', 'Kiểm tra các chốt gầu, các khớp liên kết, điều chỉnh khe hở khi cần', '4', '3', 12, NULL, 2),
(1258, 344, 'Kiểm tra các chốt gầu, các khớp liên kết, điều chỉnh khe hở khi cần', 'Kiểm tra các chốt gầu, các khớp liên kết, điều chỉnh khe hở khi cần', '4', '4', 10, NULL, 2),
(1259, 344, 'Kiểm tra các chốt gầu, các khớp liên kết, điều chỉnh khe hở khi cần', 'Kiểm tra các chốt gầu, các khớp liên kết, điều chỉnh khe hở khi cần', '4', '0', 8, NULL, 2),
(1260, 344, 'Kiểm tra các chốt gầu, các khớp liên kết, điều chỉnh khe hở khi cần', 'Kiểm tra các chốt gầu, các khớp liên kết, điều chỉnh khe hở khi cần', '4', '0', 14, NULL, 2),
(1261, 344, 'Kiểm tra các chốt gầu, các khớp liên kết, điều chỉnh khe hở khi cần', 'Kiểm tra các chốt gầu, các khớp liên kết, điều chỉnh khe hở khi cần', '4', '0', 16, NULL, 2),
(1262, 344, 'Kiểm tra các chốt gầu, các khớp liên kết, điều chỉnh khe hở khi cần', 'Kiểm tra các chốt gầu, các khớp liên kết, điều chỉnh khe hở khi cần', '4', '0', 6, NULL, 2),
(1263, 344, 'Kiểm tra các chốt gầu, các khớp liên kết, điều chỉnh khe hở khi cần', 'Kiểm tra các chốt gầu, các khớp liên kết, điều chỉnh khe hở khi cần', '4', '0', 4, NULL, 2),
(1264, 344, 'Kiểm tra các chốt gầu, các khớp liên kết, điều chỉnh khe hở khi cần', 'Kiểm tra các chốt gầu, các khớp liên kết, điều chỉnh khe hở khi cần', '4', '0', 2, NULL, 2);

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
-- Table structure for table `c_stock_supply`
--

CREATE TABLE `c_stock_supply` (
  `id` int(11) NOT NULL,
  `code` text CHARACTER SET utf8 COLLATE utf8_vietnamese_ci,
  `name` text CHARACTER SET utf8 COLLATE utf8_vietnamese_ci,
  `contract_code` text CHARACTER SET utf8 COLLATE utf8_vietnamese_ci,
  `price` text,
  `quantity` text,
  `unit` text CHARACTER SET utf8 COLLATE utf8_vietnamese_ci,
  `updated_time` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `c_stock_supply`
--

INSERT INTO `c_stock_supply` (`id`, `code`, `name`, `contract_code`, `price`, `quantity`, `unit`, `updated_time`) VALUES
(2, 'A1', 'Côn', 'HĐ1', '10000', '2', 'cái', '2018-05-08 05:23:53'),
(3, 'A2', 'Lốp', 'HĐ2', '20000', '5', 'cái', '2018-05-08 05:23:54');

--
-- Triggers `c_stock_supply`
--
DELIMITER $$
CREATE TRIGGER `stock_supply_update_time` BEFORE UPDATE ON `c_stock_supply` FOR EACH ROW BEGIN  
        SET NEW.updated_time = CURRENT_TIMESTAMP;   
END
$$
DELIMITER ;

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
-- Indexes for table `c_maintain_sup`
--
ALTER TABLE `c_maintain_sup`
  ADD PRIMARY KEY (`c_maintain_sup_id`);

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
-- Indexes for table `c_stock_supply`
--
ALTER TABLE `c_stock_supply`
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
-- AUTO_INCREMENT for table `c_maintain_sup`
--
ALTER TABLE `c_maintain_sup`
  MODIFY `c_maintain_sup_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
  MODIFY `C_PROFILE_MACHINE_ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1017;

--
-- AUTO_INCREMENT for table `c_provider`
--
ALTER TABLE `c_provider`
  MODIFY `C_PROVIDER_ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `c_repair_labor`
--
ALTER TABLE `c_repair_labor`
  MODIFY `C_REPAIR_LABOR_ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1265;

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
-- AUTO_INCREMENT for table `c_stock_supply`
--
ALTER TABLE `c_stock_supply`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
