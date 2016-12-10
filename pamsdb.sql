-- phpMyAdmin SQL Dump
-- version 3.4.10.1deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 11, 2015 at 05:51 PM
-- Server version: 5.5.41
-- PHP Version: 5.5.23-1+deb.sury.org~precise+2

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `pamsdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_6340c63c` (`user_id`),
  KEY `django_admin_log_37ef4eb4` (`content_type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=115 ;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `user_id`, `content_type_id`, `object_id`, `object_repr`, `action_flag`, `change_message`) VALUES
(1, '2015-03-21 04:54:12', 1, 6, '2', 'patient1', 1, ''),
(2, '2015-03-21 04:57:36', 1, 11, '1', 'Notifiable object', 1, ''),
(3, '2015-03-21 18:00:49', 1, 13, '1', 'Patient object', 1, ''),
(4, '2015-03-21 18:03:31', 1, 13, '1', 'Patient object', 2, 'Changed notification.'),
(5, '2015-03-21 18:06:38', 1, 11, '1', 'patient1 chose Email', 3, ''),
(6, '2015-03-21 18:10:35', 1, 13, '2', 'Patient object', 1, ''),
(7, '2015-03-21 18:11:04', 1, 11, '2', 'Email to chen0892@e.ntu.edu.sg', 1, ''),
(8, '2015-03-21 18:11:21', 1, 13, '2', 'Patient object', 2, 'Changed notification.'),
(9, '2015-03-22 06:32:19', 1, 7, '1', 'TimeSlot object', 1, ''),
(10, '2015-03-22 06:32:27', 1, 7, '2', 'TimeSlot object', 1, ''),
(11, '2015-03-22 06:32:32', 1, 7, '3', 'TimeSlot object', 1, ''),
(12, '2015-03-22 06:32:42', 1, 7, '4', 'TimeSlot object', 1, ''),
(13, '2015-03-22 06:32:55', 1, 7, '5', 'TimeSlot object', 1, ''),
(14, '2015-03-22 06:33:01', 1, 7, '6', 'TimeSlot object', 1, ''),
(15, '2015-03-22 06:33:09', 1, 7, '7', 'TimeSlot object', 1, ''),
(16, '2015-03-22 06:33:14', 1, 7, '8', 'TimeSlot object', 1, ''),
(17, '2015-03-22 06:33:18', 1, 7, '9', 'TimeSlot object', 1, ''),
(18, '2015-03-22 06:33:23', 1, 7, '10', 'TimeSlot object', 1, ''),
(19, '2015-03-22 06:33:29', 1, 7, '11', 'TimeSlot object', 1, ''),
(20, '2015-03-22 06:33:34', 1, 7, '12', 'TimeSlot object', 1, ''),
(21, '2015-03-22 06:33:38', 1, 7, '13', 'TimeSlot object', 1, ''),
(22, '2015-03-22 06:33:44', 1, 7, '14', 'TimeSlot object', 1, ''),
(23, '2015-03-22 06:51:42', 1, 10, '1', 'Treatment object', 1, ''),
(24, '2015-03-22 06:52:03', 1, 10, '1', 'Treatment object', 2, 'No fields changed.'),
(25, '2015-03-22 07:06:38', 1, 10, '2', 'Treatment object', 1, ''),
(26, '2015-03-22 07:08:46', 1, 10, '3', 'Treatment object', 1, ''),
(27, '2015-03-22 07:19:24', 1, 6, '2', 'patient1', 2, 'Changed password.'),
(28, '2015-03-22 09:39:57', 1, 6, '3', 'ningshuang', 1, ''),
(29, '2015-03-22 09:40:07', 1, 6, '4', 'chuqiao', 1, ''),
(30, '2015-03-22 09:42:11', 1, 9, '1', 'Clinic object', 1, ''),
(31, '2015-03-22 09:42:36', 1, 9, '2', 'Clinic object', 1, ''),
(32, '2015-03-22 09:42:52', 1, 5, '1', 'Doctor object', 1, ''),
(33, '2015-03-22 09:42:59', 1, 5, '2', 'Doctor object', 1, ''),
(34, '2015-03-22 10:01:53', 1, 5, '1', 'Doctor Li Chuqiao', 2, 'Changed clinic.'),
(35, '2015-03-23 00:32:22', 1, 6, '3', 'ningshuang', 2, 'Changed password.'),
(36, '2015-03-23 00:34:44', 1, 6, '3', 'ningshuang', 2, 'Changed is_doctor.'),
(37, '2015-03-23 01:02:39', 1, 6, '4', 'chuqiao', 2, 'Changed is_doctor.'),
(38, '2015-03-23 01:02:47', 1, 6, '1', 'admin', 2, 'Changed is_doctor.'),
(39, '2015-03-23 15:12:56', 1, 9, '3', 'Testing A+', 1, ''),
(40, '2015-03-24 13:36:02', 1, 6, '2', 'patient1', 2, 'Changed name.'),
(41, '2015-03-27 14:03:32', 1, 9, '2', 'Malaysia A Plus', 2, 'Changed name.'),
(42, '2015-03-27 14:03:37', 1, 9, '1', 'Singapore A Plus', 2, 'Changed name.'),
(43, '2015-03-28 10:55:11', 1, 6, '11', 'patient8', 2, 'Changed name.'),
(44, '2015-03-28 10:56:18', 1, 6, '11', 'patient8', 2, 'Changed name.'),
(45, '2015-03-29 02:38:02', 1, 10, '4', 'Dental Braces', 1, ''),
(46, '2015-04-05 01:53:19', 1, 11, '3', 'SMS to jack@gmail.com', 2, 'Changed method.'),
(47, '2015-04-05 01:53:27', 1, 11, '9', 'SMS to sssss@qq.com', 2, 'Changed contact and method.'),
(48, '2015-04-05 01:53:33', 1, 11, '10', 'SMS to yuxinhuan', 2, 'Changed method.'),
(49, '2015-04-06 01:54:14', 1, 6, '12', 'yuxin', 2, 'Changed is_doctor.'),
(50, '2015-04-06 01:54:29', 1, 5, '3', 'Doctor yuxin', 1, ''),
(51, '2015-04-06 01:54:37', 1, 5, '3', 'Doctor yuxin', 2, 'Changed clinic.'),
(52, '2015-04-06 01:54:49', 1, 6, '12', 'yuxin', 2, 'Changed name.'),
(53, '2015-04-06 02:19:42', 1, 6, '11', 'weiyumou', 2, 'Changed username and name.'),
(54, '2015-04-06 02:19:50', 1, 6, '11', 'weiyumou', 2, 'Changed password.'),
(55, '2015-04-06 02:28:57', 1, 9, '3', 'Testing A+', 3, ''),
(56, '2015-04-06 02:29:33', 1, 9, '4', 'Thailand A+', 1, ''),
(57, '2015-04-06 02:30:05', 1, 6, '9', 'test', 2, 'Changed username and name.'),
(58, '2015-04-06 02:30:15', 1, 6, '9', 'test', 2, 'Changed password.'),
(59, '2015-04-06 02:30:26', 1, 6, '9', 'test', 2, 'Changed is_doctor.'),
(60, '2015-04-06 02:31:03', 1, 5, '4', 'Doctor Steve Jobs', 1, ''),
(61, '2015-04-06 02:38:53', 1, 5, '3', 'Doctor Ng Yu Xin', 3, ''),
(62, '2015-04-06 02:39:18', 1, 5, '5', 'Doctor Ng Yu Xin', 1, ''),
(63, '2015-04-06 02:39:26', 1, 5, '5', 'Doctor Ng Yu Xin', 2, 'No fields changed.'),
(64, '2015-04-06 02:39:34', 1, 5, '1', 'Doctor Li Chuqiao', 2, 'Changed clinic.'),
(65, '2015-04-06 02:40:11', 1, 14, '3', 'WeChat', 1, ''),
(66, '2015-04-06 02:41:41', 1, 5, '5', 'Doctor Ng Yu Xin', 3, ''),
(67, '2015-04-06 02:42:51', 1, 14, '3', 'WeChat', 3, ''),
(68, '2015-04-06 02:43:20', 1, 13, '10', 'Patient yuxin', 3, ''),
(69, '2015-04-06 02:45:12', 1, 5, '1', 'Doctor Li Chuqiao', 2, 'Changed clinic.'),
(70, '2015-04-06 02:47:15', 1, 4, '58', 'Appointment object', 3, ''),
(71, '2015-04-06 02:48:12', 1, 4, '56', 'Appointment object', 2, 'Changed record and timeSlot.'),
(72, '2015-04-06 02:54:01', 1, 13, '5', 'Patient nchen003', 3, ''),
(73, '2015-04-06 02:54:11', 1, 13, '12', 'Patient nchen003', 1, ''),
(74, '2015-04-06 02:56:55', 1, 4, '59', 'Appointment object', 2, 'Changed record.'),
(75, '2015-04-06 05:52:44', 1, 4, '61', 'Appointment object', 3, ''),
(76, '2015-04-06 05:52:44', 1, 4, '60', 'Appointment object', 3, ''),
(77, '2015-04-06 05:52:58', 1, 4, '59', 'Appointment object', 2, 'Changed date.'),
(78, '2015-04-06 05:54:04', 1, 4, '59', 'Appointment object', 2, 'Changed date.'),
(79, '2015-04-06 05:55:08', 1, 4, '62', 'Appointment object', 3, ''),
(80, '2015-04-06 05:55:16', 1, 4, '59', 'Appointment object', 2, 'Changed date.'),
(81, '2015-04-06 05:55:34', 1, 4, '63', 'Appointment object', 3, ''),
(82, '2015-04-06 07:43:14', 1, 5, '1', 'Doctor Li Chuqiao', 2, 'Changed clinic.'),
(83, '2015-04-06 07:43:44', 1, 5, '6', 'Doctor Ng Yu Xin', 1, ''),
(84, '2015-04-06 07:44:16', 1, 14, '4', 'WeChat', 1, ''),
(85, '2015-04-06 08:10:06', 1, 4, '66', 'Appointment object', 3, ''),
(86, '2015-04-06 08:10:06', 1, 4, '65', 'Appointment object', 3, ''),
(87, '2015-04-06 08:10:21', 1, 13, '9', 'Patient weiyumou', 3, ''),
(88, '2015-04-06 08:10:36', 1, 13, '14', 'Patient weiyumou', 1, ''),
(89, '2015-04-08 01:19:52', 1, 14, '4', 'WeChat', 3, ''),
(90, '2015-04-08 01:21:53', 1, 11, '11', 'SMS to xxx@e.com', 2, 'Changed method.'),
(91, '2015-04-08 01:21:59', 1, 11, '12', 'SMS to c130863.ent', 2, 'Changed method.'),
(92, '2015-04-08 01:22:10', 1, 11, '6', 'SMS to qxiang002@e.ntu.edu.sg', 2, 'Changed method.'),
(93, '2015-04-11 05:44:28', 1, 4, '75', 'Appointment object', 3, ''),
(94, '2015-04-11 06:16:23', 1, 6, '18', 'SuperGaoxu', 1, ''),
(95, '2015-04-11 06:39:52', 1, 6, '19', 'C130063', 1, ''),
(96, '2015-04-11 06:47:35', 1, 6, '19', 'C130063', 2, 'Changed is_admin and is_doctor.'),
(97, '2015-04-11 06:48:54', 1, 10, '5', 'ENT2 (Requires ENT)', 1, ''),
(98, '2015-04-11 06:48:56', 1, 10, '5', 'ENT2 (Requires ENT)', 2, 'No fields changed.'),
(99, '2015-04-11 06:48:59', 1, 10, '5', 'ENT2 (Requires ENT)', 2, 'No fields changed.'),
(100, '2015-04-11 06:54:11', 1, 6, '20', 'shijie', 1, ''),
(101, '2015-04-11 06:54:46', 1, 6, '20', 'shijie', 2, 'No fields changed.'),
(102, '2015-04-11 06:58:01', 1, 6, '21', 'mulan', 1, ''),
(103, '2015-04-11 06:58:15', 1, 6, '21', 'mulan', 2, 'Changed is_doctor.'),
(104, '2015-04-11 07:00:26', 1, 5, '7', 'Doctor Aw Mu Lan', 1, ''),
(105, '2015-04-11 07:03:04', 1, 5, '6', 'Doctor Ng Yu Xin', 2, 'No fields changed.'),
(106, '2015-04-11 07:05:19', 1, 10, '6', 'X-ray', 1, ''),
(107, '2015-04-11 07:05:27', 1, 10, '6', 'X-ray', 2, 'No fields changed.'),
(108, '2015-04-11 07:06:22', 1, 10, '7', 'Urine Test (Requires Women''s Health Service)', 1, ''),
(109, '2015-04-11 07:30:04', 1, 4, '77', 'Appointment object', 2, 'Changed date, treatmentType and referrer.'),
(110, '2015-04-11 07:38:53', 1, 5, '6', 'Doctor Ng Yu Xin', 2, 'Changed clinic.'),
(111, '2015-04-11 07:39:40', 1, 10, '8', 'CT Scan', 1, ''),
(112, '2015-04-11 07:40:24', 1, 6, '22', 'gaoxu2', 1, ''),
(113, '2015-04-11 07:40:31', 1, 6, '22', 'gaoxu2', 2, 'Changed is_doctor.'),
(114, '2015-04-11 07:40:43', 1, 5, '8', 'Doctor Cao Gaoxu', 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_label` (`app_label`,`model`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `name`, `app_label`, `model`) VALUES
(1, 'log entry', 'admin', 'logentry'),
(2, 'content type', 'contenttypes', 'contenttype'),
(3, 'session', 'sessions', 'session'),
(4, 'appointment', 'pams_web', 'appointment'),
(5, 'doctor', 'pams_web', 'doctor'),
(6, 'my user', 'pams_web', 'myuser'),
(7, 'time slot', 'pams_web', 'timeslot'),
(8, 'record', 'pams_web', 'record'),
(9, 'clinic', 'pams_web', 'clinic'),
(10, 'treatment', 'pams_web', 'treatment'),
(11, 'notifiable', 'pams_web', 'notifiable'),
(12, 'notification_ method', 'pams_web', 'notification_method'),
(13, 'patient', 'pams_web', 'patient'),
(14, 'notification method', 'pams_web', 'notificationmethod');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_b7b81f0c` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('0roc6u38bpy6k5v804fu1ic5pzdxjx59', 'MGM2MmU5ZjhhNTM2YjNiMTI1Njk1YjM5ZTFjMjc1YTJjMzk2ZDViZTp7ImRvY3Rvcl9pZCI6MSwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjo0fQ==', '2015-04-09 14:51:41'),
('1lzrqfoh2mpo19qpzhroy29zifamq2yg', 'MmFhOGU1MmE4YjIyMDZhZGE0YmVkMTAyYmE4YzBjNzIwNjRiZDk1NDp7ImRvY3Rvcl9pZCI6MiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjozfQ==', '2015-04-08 02:13:46'),
('42sg94gaxq5x0ub049b0hykki6wwth6c', 'MmFhOGU1MmE4YjIyMDZhZGE0YmVkMTAyYmE4YzBjNzIwNjRiZDk1NDp7ImRvY3Rvcl9pZCI6MiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjozfQ==', '2015-04-20 01:25:12'),
('5h1rl4snls3sgyikncf50jynn18f05qn', 'ZTc5NmE2MzNiMjE3NTM5ODEwYzM4NWJiZTU1NzIyZDVhMmE2ZmIwZDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=', '2015-04-19 01:52:58'),
('7jm0z8ev64joil9amll3r7ojljrhlptl', 'NGY0MTZhZWEwY2U1MTE4MzM3MTU0M2ZmNTkyZDc1MWM3MTdhNWI0ODp7fQ==', '2015-04-18 14:28:39'),
('cdc23eiumthn4m9p5rwml3h6gm9ozvyl', 'MGM2MmU5ZjhhNTM2YjNiMTI1Njk1YjM5ZTFjMjc1YTJjMzk2ZDViZTp7ImRvY3Rvcl9pZCI6MSwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjo0fQ==', '2015-04-25 07:27:50'),
('dtmnivxwt7ai8rd1y6z5aqdiefma3i9i', 'NGY0MTZhZWEwY2U1MTE4MzM3MTU0M2ZmNTkyZDc1MWM3MTdhNWI0ODp7fQ==', '2015-04-18 15:29:12'),
('emweqb9m74eidyc7vxqx2t01v9lc1otu', 'NGY0MTZhZWEwY2U1MTE4MzM3MTU0M2ZmNTkyZDc1MWM3MTdhNWI0ODp7fQ==', '2015-04-21 17:25:53'),
('g8e06gbqb9zmth3zn84mhkvlmqzgmbox', 'ZTc5NmE2MzNiMjE3NTM5ODEwYzM4NWJiZTU1NzIyZDVhMmE2ZmIwZDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=', '2015-04-25 06:32:13'),
('gh2onooulqewpb1u8iesmqbm4yb2mz5q', 'NGY0MTZhZWEwY2U1MTE4MzM3MTU0M2ZmNTkyZDc1MWM3MTdhNWI0ODp7fQ==', '2015-04-11 13:33:55'),
('gpcugpov6celvmx9civye8p4cdwl72uh', 'NGY0MTZhZWEwY2U1MTE4MzM3MTU0M2ZmNTkyZDc1MWM3MTdhNWI0ODp7fQ==', '2015-04-07 13:22:43'),
('hw9vz47zl7nlo2fbuc2h32libk3p9uq0', 'NGY0MTZhZWEwY2U1MTE4MzM3MTU0M2ZmNTkyZDc1MWM3MTdhNWI0ODp7fQ==', '2015-04-11 13:34:04'),
('jj20jcxz68gxxfuccdgr13pfixzt76h2', 'ZTc5NmE2MzNiMjE3NTM5ODEwYzM4NWJiZTU1NzIyZDVhMmE2ZmIwZDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=', '2015-04-25 06:11:59'),
('p6moozft6rn915gxgc5p0ttb40k97va0', 'ZTc5NmE2MzNiMjE3NTM5ODEwYzM4NWJiZTU1NzIyZDVhMmE2ZmIwZDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=', '2015-04-22 01:19:39'),
('pwyy5a0lggopdowisxzf9sch40uqar3y', 'ZTc5NmE2MzNiMjE3NTM5ODEwYzM4NWJiZTU1NzIyZDVhMmE2ZmIwZDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=', '2015-04-25 05:55:08'),
('s6ojpkenattb0vr2ln63sfhdwxolypnc', 'MmFhOGU1MmE4YjIyMDZhZGE0YmVkMTAyYmE4YzBjNzIwNjRiZDk1NDp7ImRvY3Rvcl9pZCI6MiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjozfQ==', '2015-04-18 12:36:57'),
('sbx7w1p1ksw35h6rgu76ct02tdsjhri4', 'MmFhOGU1MmE4YjIyMDZhZGE0YmVkMTAyYmE4YzBjNzIwNjRiZDk1NDp7ImRvY3Rvcl9pZCI6MiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjozfQ==', '2015-04-12 04:01:26'),
('sh41aeodrmdzi5bwcb81hae0dguu482o', 'NGY0MTZhZWEwY2U1MTE4MzM3MTU0M2ZmNTkyZDc1MWM3MTdhNWI0ODp7fQ==', '2015-04-20 04:58:12'),
('uypd0g1wr6gbge548g9xuqipz38k99n5', 'ZTc5NmE2MzNiMjE3NTM5ODEwYzM4NWJiZTU1NzIyZDVhMmE2ZmIwZDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=', '2015-04-19 07:28:11'),
('vmsdklhcd55y5dow6mz332dhly7bpow8', 'NGY0MTZhZWEwY2U1MTE4MzM3MTU0M2ZmNTkyZDc1MWM3MTdhNWI0ODp7fQ==', '2015-04-07 13:22:35'),
('x8vbsrq1j3w6narovfj4a4f7a38lf7m1', 'MmFhOGU1MmE4YjIyMDZhZGE0YmVkMTAyYmE4YzBjNzIwNjRiZDk1NDp7ImRvY3Rvcl9pZCI6MiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjozfQ==', '2015-04-07 07:50:48'),
('xkxodoxb1bovk4ovw7hyhhdcd6rdzkzr', 'ZTc5NmE2MzNiMjE3NTM5ODEwYzM4NWJiZTU1NzIyZDVhMmE2ZmIwZDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=', '2015-04-25 07:48:13'),
('yogysmasz1jud5ctb6ukz1ivk8leapox', 'MmFhOGU1MmE4YjIyMDZhZGE0YmVkMTAyYmE4YzBjNzIwNjRiZDk1NDp7ImRvY3Rvcl9pZCI6MiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjozfQ==', '2015-04-11 13:28:50');

-- --------------------------------------------------------

--
-- Table structure for table `pams_web_appointment`
--

CREATE TABLE IF NOT EXISTS `pams_web_appointment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id` int(11) NOT NULL,
  `doctor_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `record_id` int(11) DEFAULT NULL,
  `treatmentType_id` int(11) NOT NULL,
  `referrer_id` int(11) DEFAULT NULL,
  `timeSlot_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pams_web_appointment_1fe1df59` (`patient_id`),
  KEY `pams_web_appointment_72821be1` (`doctor_id`),
  KEY `pams_web_appointment_52103e4c` (`record_id`),
  KEY `pams_web_appointment_e3194a79` (`treatmentType_id`),
  KEY `pams_web_appointment_531bec5a` (`referrer_id`),
  KEY `pams_web_appointment_d210bda7` (`timeSlot_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=87 ;

--
-- Dumping data for table `pams_web_appointment`
--

INSERT INTO `pams_web_appointment` (`id`, `patient_id`, `doctor_id`, `date`, `record_id`, `treatmentType_id`, `referrer_id`, `timeSlot_id`) VALUES
(3, 2, 2, '2015-03-25', 1, 2, 1, 5),
(6, 2, 1, '2015-03-25', NULL, 3, NULL, 13),
(7, 2, 2, '2015-03-25', 3, 1, NULL, 1),
(8, 2, 2, '2015-03-27', NULL, 1, NULL, 8),
(9, 2, 2, '2015-03-28', NULL, 1, NULL, 1),
(11, 2, 2, '2015-03-26', NULL, 1, NULL, 1),
(12, 3, 2, '2015-03-26', NULL, 1, NULL, 6),
(13, 2, 2, '2015-04-01', 2, 1, NULL, 1),
(14, 2, 1, '2015-03-26', NULL, 2, NULL, 10),
(15, 2, 1, '2015-04-09', NULL, 3, 2, 12),
(18, 2, 1, '2015-03-27', NULL, 2, 2, 10),
(20, 2, 1, '2015-03-31', 6, 3, NULL, 3),
(22, 6, 1, '2015-03-26', NULL, 3, NULL, 14),
(23, 6, 2, '2015-03-26', NULL, 3, NULL, 7),
(30, 8, 1, '2015-04-01', NULL, 2, NULL, 6),
(31, 2, 2, '2015-03-29', NULL, 1, NULL, 1),
(32, 2, 2, '2015-03-29', NULL, 1, NULL, 3),
(33, 2, 1, '2015-03-30', NULL, 1, NULL, 1),
(34, 2, 2, '2015-03-29', NULL, 1, NULL, 2),
(51, 2, 2, '2015-03-29', NULL, 3, NULL, 6),
(52, 2, 2, '2015-03-29', NULL, 3, NULL, 11),
(54, 2, 1, '2015-03-30', NULL, 1, NULL, 11),
(57, 11, 2, '2015-04-07', NULL, 2, NULL, 10),
(59, 12, 2, '2015-04-07', 3, 3, NULL, 1),
(68, 14, 1, '2015-04-08', NULL, 1, NULL, 1),
(69, 14, 1, '2015-04-09', NULL, 1, NULL, 1),
(71, 2, 1, '2015-04-12', NULL, 1, NULL, 10),
(72, 2, 2, '2016-09-21', NULL, 2, 1, 2),
(73, 6, 2, '2016-05-03', NULL, 1, 1, 1),
(76, 12, 2, '2015-04-14', NULL, 1, NULL, 1),
(77, 12, 2, '2015-04-11', 11, 2, 1, 4),
(78, 15, 2, '2015-04-30', NULL, 1, NULL, 1),
(79, 14, 2, '2015-04-30', NULL, 1, 1, 2),
(80, 15, 2, '2015-04-29', NULL, 1, NULL, 1),
(81, 2, 1, '2015-04-30', NULL, 1, NULL, 1),
(83, 14, 1, '2015-05-28', NULL, 3, 2, 10),
(86, 12, 1, '2015-05-16', NULL, 7, NULL, 7);

-- --------------------------------------------------------

--
-- Table structure for table `pams_web_clinic`
--

CREATE TABLE IF NOT EXISTS `pams_web_clinic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `website` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `pams_web_clinic`
--

INSERT INTO `pams_web_clinic` (`id`, `name`, `website`) VALUES
(1, 'Singapore A Plus', 'https://aplus.sg'),
(2, 'Malaysia A Plus', 'https://aplus.my'),
(4, 'Thailand A+', 'test');

-- --------------------------------------------------------

--
-- Table structure for table `pams_web_doctor`
--

CREATE TABLE IF NOT EXISTS `pams_web_doctor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `clinic_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `pams_web_doctor_329e2f11` (`clinic_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `pams_web_doctor`
--

INSERT INTO `pams_web_doctor` (`id`, `user_id`, `clinic_id`) VALUES
(1, 4, 1),
(2, 3, 1),
(4, 9, 4),
(6, 12, 1),
(7, 21, 2),
(8, 22, 2);

-- --------------------------------------------------------

--
-- Table structure for table `pams_web_myuser`
--

CREATE TABLE IF NOT EXISTS `pams_web_myuser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime NOT NULL,
  `username` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `is_admin` tinyint(1) NOT NULL,
  `is_doctor` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=24 ;

--
-- Dumping data for table `pams_web_myuser`
--

INSERT INTO `pams_web_myuser` (`id`, `password`, `last_login`, `username`, `name`, `is_admin`, `is_doctor`) VALUES
(1, 'pbkdf2_sha256$12000$oWZGuTM2NaSY$bbgDSP4QwjeHewGui1ePeSbJHntN7tfPI4RUGWAK3DM=', '2015-04-11 07:48:13', 'admin', 'Administrator', 1, 0),
(2, 'pbkdf2_sha256$12000$HVLPjoOTbyqU$JHGXSZySV0K13qzrzwIDjkvV1qTgqtq5X2CgGGlqF8M=', '2015-03-23 11:48:32', 'patient1', 'John Appleseed', 0, 0),
(3, 'pbkdf2_sha256$12000$rt9MeZPbt8Ny$43m0DjV4Cqy7dcv4YNOSyrFZCkK8PCP4o2Ox0fFNtVU=', '2015-04-11 07:34:45', 'ningshuang', 'Chen Ningshuang', 0, 1),
(4, 'pbkdf2_sha256$12000$sdqrtgTj2GXL$O3gxdXVWUfdU4vG7PCeU+zxTKNHZekZ75DEgF2gnoWU=', '2015-04-11 07:27:50', 'chuqiao', 'Li Chuqiao', 0, 1),
(5, 'pbkdf2_sha256$12000$ayAAuCpv4BPk$uNyGl6hPj5mbPrlkZGpBhQowMDB+UeqmGhZI9U0ntEw=', '2015-03-24 13:26:54', 'patient2', 'Jack', 0, 0),
(6, 'pbkdf2_sha256$12000$AtqldhKzCI0O$G4ZDIo1FJyyRSfhMx49LEF8Bxiox+nVMkihdMfm08yY=', '2015-03-24 13:36:37', 'patient3', 'Tom', 0, 0),
(7, 'pbkdf2_sha256$12000$Jmlf7KTqK5rk$fueQbLqai+nQ4etUrltTBlZB5T3KZ32QRLjotXPLnmo=', '2015-03-24 16:36:05', 'nchen003', 'CNS', 0, 0),
(8, 'pbkdf2_sha256$12000$fv7DuoDmeqOI$ryGitp/yR37V7+/hzLrbrTKS84wgJRIT8+Pro+WfrUY=', '2015-03-25 05:52:55', 'qxian', 'ql', 0, 0),
(9, 'pbkdf2_sha256$12000$YQAGd7Wh1AnN$IhEy9M89vuEj02gY0X2mjVNVQpq3hhxABPLpkkAeq7s=', '2015-03-26 14:58:09', 'test', 'Steve Jobs', 0, 1),
(10, 'pbkdf2_sha256$12000$TdyvLHuJi7fM$4vMUDDmoY73+EZca8Of8z1h7WKmYnMSYsg1G0/Bxo54=', '2015-03-26 15:59:29', 'caicai', 'caicai', 0, 0),
(11, 'pbkdf2_sha256$12000$pgx92RW6ifTj$RzwmV52Dz5pfsjDmWk1FMLfB/yYNyvaf6BSTpy1YhOw=', '2015-03-28 09:04:29', 'weiyumou', 'Wei Yumou', 0, 0),
(12, 'pbkdf2_sha256$12000$WwGEcDFNVDpD$vJwS9gcuNtnMwzGlSdzV789Vf6wfgHZoU4b2uenjRic=', '2015-04-11 05:38:33', 'yuxin', 'Ng Yu Xin', 0, 1),
(13, 'pbkdf2_sha256$12000$jfVwILKAHvro$qUn8W84k/46CKLKDowdj/ssDONR4/1dEgt51Psc2YbM=', '2015-04-06 02:27:18', 'patient11', 'haha', 0, 0),
(14, 'pbkdf2_sha256$12000$AvnC0rEoQik1$lWG1MDpgGMUc+QOquQbvW7dBR2d9YdS/Aq5t8a1sZWw=', '2015-04-06 07:34:10', 'gaoxu', 'gaoxu', 0, 0),
(15, 'pbkdf2_sha256$12000$MFBKbjJcai09$0KcUhJXGzxcpuCPdrlp7qYabo9M3iIhLoFZHnJYMoCg=', '2015-04-11 05:23:25', 'user1', 'Li Chuqiao', 0, 0),
(16, 'pbkdf2_sha256$12000$0sdwB8UNOsJ2$Y3q/i/WxBoa6hdD8jOZ4OX++Dk9WzhVFZWwjsePQ+JU=', '2015-04-11 05:31:03', 'user5', 'Li Chuqiao', 0, 0),
(17, 'pbkdf2_sha256$12000$m5LcWLDxhFi0$DM8v2NkqsxI7qg1S8q6kwrEjXV54aGeqOBnE5KAhMW0=', '2015-04-11 05:31:58', 'user6', 'Li Chuqiao', 0, 0),
(18, 'pbkdf2_sha256$12000$TXfsaMS47eLx$gUo6VxM/95mgEDpFbFXxT67/ouY9wK2d8R5CT03HJjE=', '2015-04-11 06:16:22', 'SuperGaoxu', 'Cao Gaoxu', 0, 0),
(19, 'pbkdf2_sha256$12000$tom1RJg1iebt$ZS+N+4rlO9yR05Gdo6JXW94AeVGkz1Go1cu76v6QkV4=', '2015-04-11 06:39:52', 'C130063', 'Zhe', 1, 1),
(20, 'pbkdf2_sha256$12000$3In678O3GCoS$YatizBBdR8algjY5anXDjXxudFEP+//AQbSdeEWXN90=', '2015-04-11 06:54:11', 'shijie', 'Lim Shi Jie', 0, 0),
(21, 'pbkdf2_sha256$12000$HxlbBuVkB59B$YsXv4LHZ7OPD82P40FJe0c52RZEWbtstKSf62sQAcYI=', '2015-04-11 06:58:01', 'mulan', 'Aw Mu Lan', 0, 1),
(22, 'pbkdf2_sha256$12000$hk8Rq5XXy6aa$GnJYmfyQnVIIaMvQcrhhiCjWmdGq5OnJB7Mb+iXiAzY=', '2015-04-11 07:40:53', 'gaoxu2', 'Cao Gaoxu', 0, 1),
(23, 'pbkdf2_sha256$12000$IiSbYXDZcvQS$nTqwy6nq4LXb+6DN4BW1q3Q9mQeGMMPHgsQTdwSdU64=', '2015-04-11 08:10:41', 'user12', 'Jack', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `pams_web_notifiable`
--

CREATE TABLE IF NOT EXISTS `pams_web_notifiable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contact` varchar(100) NOT NULL,
  `method_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pams_web_notifiable_357939b5` (`method_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `pams_web_notifiable`
--

INSERT INTO `pams_web_notifiable` (`id`, `contact`, `method_id`) VALUES
(2, 'chen0892@e.ntu.edu.sg', 1),
(3, 'jack@gmail.com', 2),
(4, '12345678', 2),
(5, 'nchen003@e.ntu.edu.sg', 1),
(6, 'qxiang002@e.ntu.edu.sg', 2),
(7, '97796648', 2),
(8, '12345678', 2),
(9, 'sssss@qq.com', 2),
(10, 'yuxinhuan', 2),
(11, 'xxx@e.com', 2),
(12, 'c130863.ent', 2),
(13, '1@mail.com', 1),
(14, '1@mail.com', 1),
(15, '123456', 1),
(16, 'jack@qq.com', 1);

-- --------------------------------------------------------

--
-- Table structure for table `pams_web_notificationmethod`
--

CREATE TABLE IF NOT EXISTS `pams_web_notificationmethod` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `pams_web_notificationmethod`
--

INSERT INTO `pams_web_notificationmethod` (`id`, `name`) VALUES
(1, 'Email'),
(2, 'SMS');

-- --------------------------------------------------------

--
-- Table structure for table `pams_web_patient`
--

CREATE TABLE IF NOT EXISTS `pams_web_patient` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `notification_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `pams_web_patient_ed7f6c22` (`notification_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=19 ;

--
-- Dumping data for table `pams_web_patient`
--

INSERT INTO `pams_web_patient` (`id`, `user_id`, `notification_id`) VALUES
(2, 2, 2),
(3, 5, 3),
(4, 6, 4),
(6, 8, 6),
(7, 9, 7),
(8, 10, 8),
(11, 13, 11),
(12, 7, 5),
(13, 14, 12),
(14, 11, 3),
(15, 15, 13),
(16, 16, 14),
(17, 17, 15),
(18, 23, 16);

-- --------------------------------------------------------

--
-- Table structure for table `pams_web_record`
--

CREATE TABLE IF NOT EXISTS `pams_web_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `age` int(3) NOT NULL,
  `height` int(6) NOT NULL,
  `weight` int(6) NOT NULL,
  `medication` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `pams_web_record`
--

INSERT INTO `pams_web_record` (`id`, `age`, `height`, `weight`, `medication`) VALUES
(1, 32, 170, 12, 'dahsahns'),
(2, 38, 120, 121, 'hello world\r\ntesting'),
(3, 20, 180, 60, 'testing'),
(4, 19, 199, 50, 'Time for medicine!'),
(5, 19, 199, 50, '~~~~'),
(6, 11, 111, 111, '.......'),
(7, 20, 180, 75, 'testing'),
(8, 20, 175, 65, 'twsdaddakjadhniadhy'),
(9, 20, 175, 70, 'Tooth brace'),
(10, 20, 175, 70, 'okay to wear tooth braces'),
(11, 22, 150, 50, 'testing');

-- --------------------------------------------------------

--
-- Table structure for table `pams_web_timeslot`
--

CREATE TABLE IF NOT EXISTS `pams_web_timeslot` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `range` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `pams_web_timeslot`
--

INSERT INTO `pams_web_timeslot` (`id`, `range`) VALUES
(1, '9:00 - 9:30'),
(2, '9:30 - 10:00'),
(3, '10:00 - 10:30'),
(4, '10:30 - 11:00'),
(5, '11:00 - 11:30'),
(6, '11:30 - 12:00'),
(7, '13:00 - 13:30'),
(8, '13:30 - 14:00'),
(9, '14:00 - 14:30'),
(10, '14:30 - 15:00'),
(11, '15:00 - 15:30'),
(12, '15:30 - 16:00'),
(13, '16:00 - 16:30'),
(14, '16:30 - 17:00');

-- --------------------------------------------------------

--
-- Table structure for table `pams_web_treatment`
--

CREATE TABLE IF NOT EXISTS `pams_web_treatment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `message` longtext NOT NULL,
  `prerequisiteId_id` int(11) DEFAULT NULL,
  `duration` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pams_web_treatment_8364df28` (`prerequisiteId_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `pams_web_treatment`
--

INSERT INTO `pams_web_treatment` (`id`, `name`, `message`, `prerequisiteId_id`, `duration`) VALUES
(1, 'Dental', 'Your appointment of dental treatment is just around the corner! Please brush your teeth before come to the appointment tomorrow! Have a good day. :)', NULL, 0),
(2, 'ENT', 'Your appointment of ENT treatment is just around the corner! Please do not hurt your injured part before the appointment and trust our doctor. Have a nice day. :)', NULL, 0),
(3, 'Women''s Health Service', 'Your appointment of Women''s Health Service Treatment is just around the corner! Please drink more water and try not to go to toilet before the appointment. Have a nice day. :)', NULL, 0),
(4, 'Dental Braces', 'Please remember to come and make your dental braces', 1, 1),
(5, 'ENT2', 'sssss', 2, 2),
(6, 'X-ray', 'Please do not wear any ear ring and necklace.', NULL, 1),
(7, 'Urine Test', 'Do not drink too much water before testing', 3, 1),
(8, 'CT Scan', 'Please don''t drink any water before the treatment.', NULL, 4);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `content_type_id_refs_id_93d2d1f8` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `user_id_refs_id_36dcd10d` FOREIGN KEY (`user_id`) REFERENCES `pams_web_myuser` (`id`);

--
-- Constraints for table `pams_web_appointment`
--
ALTER TABLE `pams_web_appointment`
  ADD CONSTRAINT `doctor_id_refs_id_a0abc1ab` FOREIGN KEY (`doctor_id`) REFERENCES `pams_web_doctor` (`id`),
  ADD CONSTRAINT `patient_id_refs_id_8816346e` FOREIGN KEY (`patient_id`) REFERENCES `pams_web_patient` (`id`),
  ADD CONSTRAINT `record_id_refs_id_a951c51f` FOREIGN KEY (`record_id`) REFERENCES `pams_web_record` (`id`),
  ADD CONSTRAINT `referrer_id_refs_id_a0abc1ab` FOREIGN KEY (`referrer_id`) REFERENCES `pams_web_doctor` (`id`),
  ADD CONSTRAINT `timeSlot_id_refs_id_06c122af` FOREIGN KEY (`timeSlot_id`) REFERENCES `pams_web_timeslot` (`id`),
  ADD CONSTRAINT `treatmentType_id_refs_id_53639ca1` FOREIGN KEY (`treatmentType_id`) REFERENCES `pams_web_treatment` (`id`);

--
-- Constraints for table `pams_web_doctor`
--
ALTER TABLE `pams_web_doctor`
  ADD CONSTRAINT `clinic_id_refs_id_b9d9cd6a` FOREIGN KEY (`clinic_id`) REFERENCES `pams_web_clinic` (`id`),
  ADD CONSTRAINT `user_id_refs_id_96394ea6` FOREIGN KEY (`user_id`) REFERENCES `pams_web_myuser` (`id`);

--
-- Constraints for table `pams_web_notifiable`
--
ALTER TABLE `pams_web_notifiable`
  ADD CONSTRAINT `method_id_refs_id_fdc2eecb` FOREIGN KEY (`method_id`) REFERENCES `pams_web_notificationmethod` (`id`);

--
-- Constraints for table `pams_web_patient`
--
ALTER TABLE `pams_web_patient`
  ADD CONSTRAINT `notification_id_refs_id_68d9ccec` FOREIGN KEY (`notification_id`) REFERENCES `pams_web_notifiable` (`id`),
  ADD CONSTRAINT `user_id_refs_id_10269606` FOREIGN KEY (`user_id`) REFERENCES `pams_web_myuser` (`id`);

--
-- Constraints for table `pams_web_treatment`
--
ALTER TABLE `pams_web_treatment`
  ADD CONSTRAINT `prerequisiteId_id_refs_id_da423619` FOREIGN KEY (`prerequisiteId_id`) REFERENCES `pams_web_treatment` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
