-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.1.31-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win32
-- HeidiSQL Version:             9.5.0.5196
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for bidyaan_fakmsc
CREATE DATABASE IF NOT EXISTS `bidyaan_fakmsc` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;
USE `bidyaan_fakmsc`;

-- Dumping structure for table bidyaan_fakmsc.gibbonaction
CREATE TABLE IF NOT EXISTS `gibbonaction` (
  `gibbonActionID` int(7) unsigned zerofill NOT NULL,
  `gibbonModuleID` int(4) unsigned zerofill NOT NULL,
  `name` varchar(50) NOT NULL COMMENT 'The action name should be unqiue to the module that it is related to',
  `precedence` int(2) NOT NULL,
  `category` varchar(20) NOT NULL,
  `description` varchar(255) NOT NULL,
  `URLList` text NOT NULL COMMENT 'Comma seperated list of all URLs that make up this action',
  `entryURL` varchar(255) NOT NULL,
  `entrySidebar` enum('Y','N') NOT NULL DEFAULT 'Y',
  `menuShow` enum('Y','N') NOT NULL DEFAULT 'Y',
  `defaultPermissionAdmin` enum('N','Y') NOT NULL DEFAULT 'N',
  `defaultPermissionTeacher` enum('N','Y') NOT NULL DEFAULT 'N',
  `defaultPermissionStudent` enum('N','Y') NOT NULL DEFAULT 'N',
  `defaultPermissionParent` enum('N','Y') NOT NULL DEFAULT 'N',
  `defaultPermissionSupport` enum('N','Y') NOT NULL DEFAULT 'N',
  `categoryPermissionStaff` enum('Y','N') NOT NULL DEFAULT 'Y',
  `categoryPermissionStudent` enum('Y','N') NOT NULL DEFAULT 'Y',
  `categoryPermissionParent` enum('Y','N') NOT NULL DEFAULT 'Y',
  `categoryPermissionOther` enum('Y','N') NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`gibbonActionID`),
  UNIQUE KEY `moduleActionName` (`name`,`gibbonModuleID`),
  KEY `gibbonModuleID` (`gibbonModuleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibbonaction: ~326 rows (approximately)
/*!40000 ALTER TABLE `gibbonaction` DISABLE KEYS */;
INSERT INTO `gibbonaction` (`gibbonActionID`, `gibbonModuleID`, `name`, `precedence`, `category`, `description`, `URLList`, `entryURL`, `entrySidebar`, `menuShow`, `defaultPermissionAdmin`, `defaultPermissionTeacher`, `defaultPermissionStudent`, `defaultPermissionParent`, `defaultPermissionSupport`, `categoryPermissionStaff`, `categoryPermissionStudent`, `categoryPermissionParent`, `categoryPermissionOther`) VALUES
	(0000001, 0002, 'Application Form Settings', 0, 'Student Management', 'Allows admins to control the application form', 'applicationFormSettings.php', 'applicationFormSettings.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000002, 0002, 'Manage Users_editDelete', 1, 'User Management', 'Edit any user within the system', 'user_manage.php, user_manage_add.php, user_manage_edit.php, user_manage_delete.php, user_manage_password.php', 'user_manage.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000003, 0001, 'Manage School Years', 0, 'Years, Days & Times', 'Allows user to control the definition of academic years within the system', 'schoolYear_manage.php,schoolYear_manage_edit.php,schoolYear_manage_delete.php,schoolYear_manage_add.php', 'schoolYear_manage.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000004, 0005, 'Student Enrolment', 0, 'Admissions', 'Allows user to control student enrolment in the current year', 'studentEnrolment_manage.php,studentEnrolment_manage_add.php,studentEnrolment_manage_edit.php,studentEnrolment_manage_delete.php', 'studentEnrolment_manage.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000005, 0003, 'System Settings', 0, 'Settings', 'Main system settings', 'systemSettings.php', 'systemSettings.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000006, 0001, 'Manage Year Groups', 0, 'Groupings', '', 'yearGroup_manage.php,yearGroup_manage_edit.php,yearGroup_manage_add.php,yearGroup_manage_delete.php', 'yearGroup_manage.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000007, 0001, 'Manage Roll Groups', 0, 'Groupings', '', 'rollGroup_manage.php,rollGroup_manage_edit.php,rollGroup_manage_add.php,rollGroup_manage_delete.php', 'rollGroup_manage.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000008, 0001, 'Manage Houses', 0, 'Groupings', '', 'house_manage.php,house_manage_edit.php,house_manage_add.php,house_manage_delete.php,house_manage_assign.php', 'house_manage.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000009, 0002, 'Manage Roles_all', 1, 'User Management', '', 'role_manage.php,role_manage_add.php,role_manage_edit.php,role_manage_delete.php,role_manage_duplicate.php,role_manage_view.php', 'role_manage.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000010, 0003, 'Manage Modules', 0, 'Extend & Update', '', 'module_manage.php,module_manage_install.php,module_manage_edit.php,module_manage_uninstall.php,module_manage_update.php', 'module_manage.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000011, 0005, 'Emergency SMS by Year Group', 0, 'Reports', 'Output all parental first mobile numbers by year group: if there are no details, then show emergency details.', 'report_emergencySMS_byYearGroup.php', 'report_emergencySMS_byYearGroup.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'Y', 'Y', 'Y'),
	(0000012, 0002, 'Manage Permissions', 0, 'User Management', '', 'permission_manage.php,permission_manage_edit.php', 'permission_manage.php', 'N', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000013, 0001, 'Days of the Week', 0, 'Years, Days & Times', '', 'daysOfWeek_manage.php', 'daysOfWeek_manage.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000014, 0008, 'Update Personal Data_family', 0, 'Request Updates', 'Allows users to update personal information for themselves and their family members', 'data_personal.php', 'data_personal.php', 'Y', 'Y', 'N', 'Y', 'N', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y'),
	(0000015, 0001, 'Manage Terms', 0, 'Years, Days & Times', '', 'schoolYearTerm_manage.php,schoolYearTerm_manage_add.php,schoolYearTerm_manage_edit.php,schoolYearTerm_manage_delete.php', 'schoolYearTerm_manage.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000016, 0001, 'Manage Special Days', 0, 'Years, Days & Times', '', 'schoolYearSpecialDay_manage.php,schoolYearSpecialDay_manage_add.php,schoolYearSpecialDay_manage_edit.php,schoolYearSpecialDay_manage_delete.php', 'schoolYearSpecialDay_manage.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000017, 0013, 'Manage Courses & Classes', 0, 'Courses & Classes', '', 'course_manage.php,course_manage_add.php,course_manage_edit.php,course_manage_delete.php,course_manage_class_add.php,course_manage_class_edit.phpcourse_manage_class_delete.php', 'course_manage.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000018, 0013, 'Course Enrolment by Class', 0, 'Courses & Classes', '', 'courseEnrolment_manage.php,courseEnrolment_manage_class_edit.php,courseEnrolment_manage_class_edit_edit.php,courseEnrolment_manage_class_edit_delete.php', 'courseEnrolment_manage.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000019, 0002, 'Manage Families', 0, 'User Management', '', 'family_manage.php,family_manage_add.php,family_manage_edit.php,family_manage_delete.php,family_manage_edit_editChild.php,family_manage_edit_deleteChild.php,family_manage_edit_editAdult.php,family_manage_edit_deleteAdult.php', 'family_manage.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000020, 0003, 'Manage Themes', 0, 'Extend & Update', '', 'theme_manage.php,theme_manage_install.php,theme_manage_edit.php,theme_manage_uninstall.php', 'theme_manage.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000021, 0005, 'Manage Medical Forms', 0, 'Medical', 'Manage medical form information for users', 'medicalForm_manage.php,medicalForm_manage_add.php,medicalForm_manage_edit.php,medicalForm_manage_delete.php,medicalForm_manage_condition_add.php,medicalForm_manage_condition_edit.php,medicalForm_manage_condition_delete.php', 'medicalForm_manage.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000022, 0004, 'View Departments', 0, 'Departments', 'Allows uers to view all department details.', 'departments.php, department.php, department_course.php, department_course_class.php, department_course_class_full.php, department_course_unit_add.php, department_course_unit_edit.php, department_course_unit_delete.php, department_course_unit_duplicate.php, department_edit.php, department_course_edit.php', 'departments.php', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y'),
	(0000023, 0005, 'View Student Profile_brief', 0, 'Profiles', 'View brief profile of any student in the school.', 'student_view.php,student_view_details.php', 'student_view.php', 'Y', 'Y', 'N', 'N', 'Y', 'N', 'N', 'Y', 'Y', 'Y', 'Y'),
	(0000024, 0005, 'View Student Profile_full', 3, 'Profiles', 'View full profile of any student in the school.', 'student_view.php,student_view_details.php,student_view_details_notes_add.php,student_view_details_notes_edit.php', 'student_view.php', 'Y', 'Y', 'Y', 'Y', 'N', 'N', 'Y', 'Y', 'N', 'N', 'N'),
	(0000025, 0001, 'Manage Facilities', 0, 'Other', 'Allows users to create a list of spaces and rooms in the school', 'space_manage.php, space_manage_add.php, space_manage_edit.php, space_manage_delete.php', 'space_manage.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000026, 0006, 'Attendance By Person', 0, 'Take Attendance', 'Take attendance, one person at a time', 'attendance_take_byPerson.php', 'attendance_take_byPerson.php', 'Y', 'Y', 'Y', 'Y', 'N', 'N', 'Y', 'Y', 'N', 'N', 'Y'),
	(0000027, 0006, 'Attendance By Roll Group_all', 1, 'Take Attendance', 'Take attendance, one roll group at a time', 'attendance_take_byRollGroup.php', 'attendance_take_byRollGroup.php', 'Y', 'Y', 'Y', 'Y', 'N', 'N', 'Y', 'Y', 'N', 'N', 'Y'),
	(0000028, 0006, 'Set Future Absence', 0, 'Future Information', 'Set future absences one student at a time', 'attendance_future_byPerson.php', 'attendance_future_byPerson.php', 'Y', 'Y', 'Y', 'Y', 'N', 'N', 'Y', 'Y', 'N', 'N', 'Y'),
	(0000029, 0006, 'Students Not Present', 0, 'Reports', 'Print a report of students who are not present on a given day', 'report_studentsNotPresent_byDate.php,report_studentsNotPresent_byDate_print.php', 'report_studentsNotPresent_byDate.php', 'Y', 'Y', 'Y', 'Y', 'N', 'N', 'Y', 'Y', 'N', 'N', 'Y'),
	(0000030, 0006, 'Roll Groups Not Registered', 0, 'Reports', 'Print a report of roll groups who have not been registered on a given day', 'report_rollGroupsNotRegistered_byDate.php,report_rollGroupsNotRegistered_byDate_print.php', 'report_rollGroupsNotRegistered_byDate.php', 'Y', 'Y', 'Y', 'Y', 'N', 'N', 'Y', 'Y', 'N', 'N', 'Y'),
	(0000031, 0006, 'Student History_all', 2, 'Reports', 'Print a report of all attendance data in the current school year for a student', 'report_studentHistory.php,report_studentHistory_print.php', 'report_studentHistory.php', 'Y', 'Y', 'Y', 'Y', 'N', 'N', 'Y', 'Y', 'N', 'N', 'Y'),
	(0000032, 0136, 'Manage Staff_general', 0, 'Staff Management', 'Edit general information on members of staff.', 'staff_manage.php, staff_manage_add.php, staff_manage_edit.php, staff_manage_delete.php, staff_manage_edit_facility_add.php, staff_manage_edit_facility_delete.php', 'staff_manage.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000033, 0007, 'View Markbook_allClassesAllData', 4, 'Markbook', 'View all markbook information for all users', 'markbook_view.php, markbook_view_full.php', 'markbook_view.php', 'N', 'Y', 'Y', 'Y', 'N', 'N', 'Y', 'Y', 'Y', 'Y', 'Y'),
	(0000034, 0007, 'Edit Markbook_singleClass', 0, 'Markbook', 'Edit columns and grades for a single class at a time.', 'markbook_edit.php, markbook_edit_add.php, markbook_edit_edit.php, markbook_edit_delete.php,markbook_edit_data.php,markbook_edit_targets.php,markbook_edit_copy.php', 'markbook_edit.php', 'Y', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'Y', 'Y', 'Y', 'Y'),
	(0000035, 0009, 'Lesson Planner_viewMyClasses', 1, 'Planning', 'View all planner information for classes user is in', 'planner.php, planner_view_full.php, planner_deadlines.php, planner_view_full_post.php, planner_unitOverview.php', 'planner.php', 'Y', 'Y', 'Y', 'Y', 'Y', 'N', 'N', 'Y', 'Y', 'Y', 'Y'),
	(0000036, 0009, 'Lesson Planner_viewAllEditMyClasses', 3, 'Planning', 'View all planner information and edit all planner information for classes user is in', 'planner.php, planner_view_full.php, planner_add.php, planner_edit.php, planner_delete.php, planner_deadlines.php, planner_duplicate.php, planner_view_full_post.php, planner_view_full_submit_edit.php, planner_bump.php, planner_unitOverview.php', 'planner.php', 'Y', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'Y', 'N', 'N', 'Y'),
	(0000038, 0009, 'Lesson Planner_viewEditAllClasses', 4, 'Planning', 'View and edit all planner information for all classes', 'planner.php, planner_view_full.php, planner_add.php, planner_edit.php, planner_delete.php, planner_deadlines.php, planner_duplicate.php, planner_view_full_post.php, planner_view_full_submit_edit.php, planner_bump.php, planner_unitOverview.php', 'planner.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000039, 0007, 'View Markbook_myMarks', 2, 'Markbook', 'View your own marks', 'markbook_view.php', 'markbook_view.php', 'N', 'Y', 'N', 'N', 'Y', 'N', 'N', 'Y', 'Y', 'Y', 'Y'),
	(0000040, 0009, 'Lesson Planner_viewMyChildrensClasses', 0, 'Planning', 'Allows parents to view their children\'s classes', 'planner.php, planner_view_full.php, planner_deadlines.php, planner_view_full_post.php, planner_unitOverview.php', 'planner.php', 'Y', 'Y', 'N', 'N', 'N', 'Y', 'N', 'N', 'N', 'Y', 'N'),
	(0000041, 0007, 'View Markbook_viewMyChildrensClasses', 1, '', 'Allows parents to view their children\'s classes', 'markbook_view.php', 'markbook_view.php', 'Y', 'Y', 'N', 'N', 'N', 'Y', 'N', 'N', 'N', 'Y', 'N'),
	(0000042, 0005, 'View Student Profile_myChildren', 1, 'Profiles', 'Allows parents to view their student\'s information', 'student_view.php, student_view_details.php', 'student_view.php', 'Y', 'Y', 'N', 'N', 'N', 'Y', 'N', 'N', 'N', 'Y', 'N'),
	(0000043, 0005, 'Students by Roll Group', 0, 'Reports', 'Print student roll group lists', 'report_students_byRollGroup.php, report_students_byRollGroup_print.php', 'report_students_byRollGroup.php', 'N', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'Y', 'Y', 'Y'),
	(0000044, 0006, 'Students Not Onsite', 0, 'Reports', 'Print a report of students who are not physically on the school campus on a given day', 'report_studentsNotOnsite_byDate.php,report_studentsNotOnsite_byDate_print.php', 'report_studentsNotOnsite_byDate.php', 'Y', 'Y', 'Y', 'Y', 'N', 'N', 'Y', 'Y', 'N', 'N', 'Y'),
	(0000045, 0011, 'Individual Needs Records_view', 0, 'Individual Needs', 'Allows user to view IN records for all students', 'in_view.php, in_edit.php', 'in_view.php', 'Y', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000046, 0011, 'Individual Needs Records_viewEdit', 2, 'Individual Needs', 'Allows users to edit IN records for all students', 'in_view.php, in_edit.php', 'in_view.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000047, 0012, 'Assess', 0, 'Crowd Assessment', 'Allows users to assess each other\'s work', 'crowdAssess.php,crowdAssess_view.php,crowdAssess_view_discuss.php, crowdAssess_view_discuss_post.php', 'crowdAssess.php', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y'),
	(0000048, 0013, 'Manage Timetables', 0, 'Timetable', 'Allow admins to create and manage timetables', 'tt.php, tt_add.php, tt_edit.php, tt_delete.php, tt_import.php, tt_edit_day_add.php, tt_edit_day_edit.php, tt_edit_day_delete.php, tt_edit_day_edit_class.php, tt_edit_day_edit_class_delete.php, tt_edit_day_edit_class_add.php, tt_edit_day_edit_class_edit.php, tt_edit_day_edit_class_exception.php, tt_edit_day_edit_class_exception_add.php, tt_edit_day_edit_class_exception_delete.php', 'tt.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000049, 0013, 'Manage Columns', 0, 'Timetable', 'Allow admins to manage timetable columns', 'ttColumn.php, ttColumn_add.php, ttColumn_edit.php, ttColumn_delete.php, ttColumn_edit_row_add.php, ttColumn_edit_row_edit.php, ttColumn_edit_row_delete.php', 'ttColumn.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000050, 0013, 'Tie Days To Dates', 0, 'Timetable', 'Allows admins to place timetable days into the school calendar', 'ttDates.php, ttDates_edit.php, ttDates_edit_add.php, ttDates_edit_delete.php', 'ttDates.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000051, 0014, 'View Timetable by Person', 2, 'View Timetables', 'Allows users to view timetables', 'tt.php, tt_view.php', 'tt.php', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y'),
	(0000052, 0015, 'View Activities_view', 0, 'Activities', 'Allows users to view activities', 'activities_view.php, activities_view_full.php', 'activities_view.php', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y'),
	(0000053, 0015, 'View Activities_studentRegister', 1, 'Activities', 'Allows students to view activities and register', 'activities_view.php, activities_view_full.php, activities_view_register.php', 'activities_view.php', 'Y', 'Y', 'N', 'N', 'Y', 'N', 'N', 'N', 'Y', 'N', 'N'),
	(0000054, 0001, 'Activity Settings', 0, 'Learn', 'Control activity settings', 'activitySettings.php', 'activitySettings.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000055, 0015, 'Manage Activities', 0, 'Administration', 'Allows managers to build activity program', 'activities_manage.php, activities_manage_add.php, activities_manage_edit.php, activities_manage_delete.php,activities_manage_enrolment.php,activities_manage_enrolment_add.php,activities_manage_enrolment_edit.php,activities_manage_enrolment_delete.php', 'activities_manage.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000056, 0015, 'My Activities', 0, 'Activities', 'Allows a user to view the activities they are involved in', 'activities_my.php, activities_my_full.php', 'activities_my.php', 'Y', 'Y', 'Y', 'Y', 'Y', 'N', 'N', 'Y', 'Y', 'Y', 'Y'),
	(0000057, 0015, 'Participants by Activity', 0, 'Reports', 'Print participant lists', 'report_participants.php, report_participants_print.php', 'report_participants.php', 'Y', 'Y', 'Y', 'Y', 'N', 'N', 'Y', 'Y', 'Y', 'Y', 'Y'),
	(0000058, 0015, 'Attendance History by Activity', 0, 'Attendance', 'Print attendance lists', 'report_attendance.php, report_attendanceExport.php', 'report_attendance.php', 'Y', 'Y', 'Y', 'Y', 'N', 'N', 'Y', 'Y', 'Y', 'Y', 'Y'),
	(0000059, 0015, 'Generate Invoices', 0, 'Administration', 'Print payment list', 'activities_payment.php', 'activities_payment.php', 'Y', 'Y', 'Y', 'Y', 'N', 'N', 'Y', 'Y', 'Y', 'Y', 'Y'),
	(0000060, 0006, 'Student History_myChildren', 0, 'Reports', 'Print a report of all attendance data in the current school yearfor my children', 'report_studentHistory.php', 'report_studentHistory.php', 'Y', 'Y', 'N', 'N', 'N', 'Y', 'N', 'N', 'N', 'Y', 'N'),
	(0000061, 0009, 'Work Summary by Roll Group', 0, 'Reports', 'Print work summary statistical data by roll group', 'report_workSummary_byRollGroup.php', 'report_workSummary_byRollGroup.php', 'Y', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'Y', 'Y', 'Y', 'Y'),
	(0000062, 0001, 'Manage Departments', 0, 'Groupings', 'Allows admins to create learning areas and administrative groups.', 'department_manage.php,department_manage_add.php,department_manage_edit.php,department_manage_delete.php', 'department_manage.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000063, 0008, 'Personal Data Updates', 0, 'Manage Updates', 'Allows admins to process data update requests for personal data', 'data_personal_manage.php, data_personal_manage_edit.php, data_personal_manage_delete.php', 'data_personal_manage.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000064, 0008, 'Update Medical Form_family', 0, 'Request Updates', 'Allows users to update medical information for themselves and their family members', 'data_medical.php', 'data_medical.php', 'Y', 'Y', 'N', 'N', 'N', 'Y', 'N', 'Y', 'Y', 'Y', 'Y'),
	(0000065, 0008, 'Medical Form Updates', 0, 'Manage Updates', 'Allows admins to process data update requests for medical data', 'data_medical_manage.php, data_medical_manage_edit.php, data_medical_manage_delete.php', 'data_medical_manage.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000066, 0013, 'Class Enrolment by Roll Group', 0, 'Reports', 'Shows the number of classes students are enroled in, organised by roll group', 'report_classEnrolment_byRollGroup.php', 'report_classEnrolment_byRollGroup.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'Y', 'Y', 'Y'),
	(0000067, 0015, 'Activity Type by Roll Group', 0, 'Reports', 'Print roll group lists showing count of various activity types', 'report_activityType_rollGroup.php', 'report_activityType_rollGroup.php', 'Y', 'Y', 'Y', 'Y', 'N', 'N', 'Y', 'Y', 'N', 'N', 'N'),
	(0000068, 0016, 'External Assessment Data_view', 0, 'External Assessment', 'Allow users to view assessment data for all students', 'externalAssessment.php, externalAssessment_details.php', 'externalAssessment.php', 'Y', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000069, 0016, 'External Assessment Data_manage', 1, 'External Assessment', 'Allows users to manage external assessment data', 'externalAssessment.php, externalAssessment_details.php, externalAssessment_manage_details_add.php, externalAssessment_manage_details_edit.php, externalAssessment_manage_details_delete.php', 'externalAssessment.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000070, 0002, 'Rollover', 0, 'Student Management', 'Allows admins to kick the school forward one year', 'rollover.php', 'rollover.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000072, 0005, 'Student Transport', 0, 'Reports', 'Shows student transport details', 'report_transport_student.php', 'report_transport_student.php', 'Y', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000073, 0008, 'Student Data Updater History', 0, 'Reports', 'Allows users to check, for a group of students, how recently they have been updated', 'report_student_dataUpdaterHistory.php', 'report_student_dataUpdaterHistory.php', 'Y', 'Y', 'Y', 'Y', 'N', 'N', 'Y', 'Y', 'N', 'N', 'N'),
	(0000074, 0005, 'Application Form', 0, 'Admissions', 'Allows users, with or without an account, to apply for student place.', 'applicationForm.php', 'applicationForm.php', 'Y', 'Y', 'Y', 'Y', 'N', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y'),
	(0000075, 0005, 'Medical Data Summary', 0, 'Reports', 'Allows users to show a summary of medical data for a group of students.', 'report_student_medicalSummary.php, report_student_medicalSummary_print.php', 'report_student_medicalSummary.php', 'Y', 'Y', 'Y', 'Y', 'N', 'N', 'Y', 'Y', 'N', 'N', 'N'),
	(0000077, 0005, 'Emergency Data Summary', 0, 'Reports', 'Allows users to show a summary of emergency contact data for a group of students.', 'report_student_emergencySummary.php, report_student_emergencySummary_print.php', 'report_student_emergencySummary.php', 'Y', 'Y', 'Y', 'Y', 'N', 'N', 'Y', 'Y', 'N', 'N', 'N'),
	(0000078, 0005, 'Manage Applications_editDelete', 1, 'Admissions', 'Allows admins to view and action applications', 'applicationForm_manage.php, applicationForm_manage_edit.php, applicationForm_manage_delete.php, applicationForm_manage_accept.php, applicationForm_manage_reject.php, applicationForm_manage_add.php', 'applicationForm_manage.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000585, 0008, 'Update Personal Data_any', 1, 'Request Updates', 'Create personal data update request for any user', 'data_personal.php', 'data_personal.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000586, 0008, 'Update Medical Data_any', 1, 'Request Updates', 'Create medical data update request for any user', 'data_medical.php', 'data_medical.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000605, 0001, 'Behaviour Settings', 0, 'People', 'Manage settings for the Behaviour module', 'behaviourSettings.php', 'behaviourSettings.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000606, 0119, 'Manage Behaviour Records_all', 1, 'Behaviour Records', 'Manage all behaviour records', 'behaviour_manage.php, behaviour_manage_add.php, behaviour_manage_edit.php, behaviour_manage_delete.php', 'behaviour_manage.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000607, 0119, 'Manage Behaviour Records_my', 0, 'Behaviour Records', 'Manage behaviour records create by the user', 'behaviour_manage.php, behaviour_manage_add.php, behaviour_manage_edit.php, behaviour_manage_delete.php', 'behaviour_manage.php', 'Y', 'Y', 'N', 'Y', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000608, 0119, 'View Behaviour Records_all', 1, 'Behaviour Records', 'View behaviour records by student', 'behaviour_view.php,behaviour_view_details.php', 'behaviour_view.php', 'Y', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000609, 0005, 'Emergency SMS by Transport', 0, 'Reports', 'Show SMS emergency details by transport route', 'report_emergencySMS_byTransport.php', 'report_emergencySMS_byTransport.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000610, 0001, 'Resource Settings', 0, 'Learn', 'Manage settings for the resources module', 'resourceSettings.php', 'resourceSettings.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000611, 0009, 'Manage Resources_all', 1, 'Resources', 'Manage all resources', 'resources_manage.php, resources_manage_add.php, resources_manage_edit.php, resources_manage_delete.php', 'resources_manage.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000612, 0009, 'Manage Resources_my', 0, 'Resources', 'Manage resources created by the user', 'resources_manage.php, resources_manage_add.php, resources_manage_edit.php, resources_manage_delete.php', 'resources_manage.php', 'Y', 'Y', 'N', 'Y', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000613, 0009, 'View Resources', 0, 'Resources', 'View resources', 'resources_view.php,resources_view_details.php,resources_view_full.php', 'resources_view.php', 'Y', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'Y', 'Y', 'Y', 'Y'),
	(0000614, 0121, 'New Message_classes_my', 1, 'Manage Messages', 'Bulk email to any of my classes', 'messenger_post.php', 'messenger_post.php', 'Y', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'Y', 'Y', 'Y', 'N'),
	(0000615, 0121, 'New Message_classes_any', 9, 'Manage Messages', 'Bulk email to any class', 'messenger_post.php', 'messenger_post.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'Y', 'Y', 'N'),
	(0000616, 0121, 'New Message_classes_parents', 5, 'Manage Messages', 'Include parents in messages posted to classes', 'messenger_post.php', 'messenger_post.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'Y', 'Y', 'N'),
	(0000617, 0121, 'New Message_courses_my', 3, 'Manage Messages', 'Bulk email to any of my courses', 'messenger_post.php', 'messenger_post.php', 'Y', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'Y', 'Y', 'Y', 'N'),
	(0000618, 0121, 'New Message_courses_any', 11, 'Manage Messages', 'Bulk email to any courses', 'messenger_post.php', 'messenger_post.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'Y', 'Y', 'N'),
	(0000619, 0121, 'New Message_courses_parents', 7, 'Manage Messages', 'Include parents in messages posted to courses', 'messenger_post.php', 'messenger_post.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'Y', 'Y', 'N'),
	(0000620, 0121, 'New Message_rollGroups_my', 2, 'Manage Messages', 'Bulk email to any of my roll groups', 'messenger_post.php', 'messenger_post.php', 'Y', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'Y', 'Y', 'Y', 'N'),
	(0000621, 0121, 'New Message_rollGroups_any', 10, 'Manage Messages', 'Bulk email to any roll group', 'messenger_post.php', 'messenger_post.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'Y', 'Y', 'N'),
	(0000622, 0121, 'New Message_rollGroups_parents', 6, 'Manage Messages', 'Include parents in messages posted to parents', 'messenger_post.php', 'messenger_post.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'Y', 'Y', 'N'),
	(0000623, 0121, 'New Message_activities_my', 0, 'Manage Messages', 'Bulk email to any of my activities', 'messenger_post.php', 'messenger_post.php', 'Y', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'Y', 'Y', 'Y', 'N'),
	(0000624, 0121, 'New Message_activities_any', 8, 'Manage Messages', 'Bulk email to any activity', 'messenger_post.php', 'messenger_post.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'Y', 'Y', 'N'),
	(0000625, 0121, 'New Message_activities_parents', 4, 'Manage Messages', 'Include parents in messages posted to activities', 'messenger_post.php', 'messenger_post.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'Y', 'Y', 'N'),
	(0000626, 0121, 'New Message_yearGroups_any', 8, 'Manage Messages', 'Bulk email to any year group', 'messenger_post.php', 'messenger_post.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'Y', 'Y', 'N'),
	(0000627, 0121, 'New Message_yearGroups_parents', 4, 'Manage Messages', 'Include parents in messages posted to year group', 'messenger_post.php', 'messenger_post.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'Y', 'Y', 'N'),
	(0000628, 0121, 'New Message_role', 8, 'Manage Messages', 'Bulk email to a particular role', 'messenger_post.php', 'messenger_post.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'Y', 'Y', 'N'),
	(0000629, 0121, 'Manage Messages_my', 0, 'Manage Messages', 'Edit all messages created by the user', 'messenger_manage.php,messenger_manage_delete.php,messenger_manage_edit.php,messenger_manage_report.php', 'messenger_manage.php', 'N', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'Y', 'Y', 'Y', 'N'),
	(0000630, 0121, 'Manage Messages_all', 1, 'Manage Messages', 'Edit all messages', 'messenger_manage.php,messenger_manage_delete.php,messenger_manage_edit.php,messenger_manage_report.php', 'messenger_manage.php', 'N', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'Y', 'N'),
	(0000631, 0003, 'Update', 0, 'Extend & Update', 'Update Gibbon to a new version', 'update.php', 'update.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000632, 0121, 'New Message_fromSchool', 0, 'Manage Messages', 'Bulk email from the school\'s email address', 'messenger_post.php', 'messenger_post.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'Y', 'Y', 'N'),
	(0000655, 0014, 'View Timetable by Facility', 0, 'View Timetables', 'View space usage according to the timetable', 'tt_space.php,tt_space_view.php', 'tt_space.php', 'Y', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000656, 0013, 'Course Enrolment by Person', 0, 'Courses & Classes', 'Manage course enrolment for a single user', 'courseEnrolment_manage_byPerson.php, courseEnrolment_manage_byPerson_edit.php, courseEnrolment_manage_byPerson_edit_edit.php, courseEnrolment_manage_byPerson_edit_delete.php', 'courseEnrolment_manage_byPerson.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000657, 0121, 'New Message_applicants', 12, 'Manage Messages', 'Bulk email to applicants by intended school year of entry', 'messenger_post.php', 'messenger_post.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'Y', 'N'),
	(0000658, 0121, 'New Message_individuals', 13, 'Manage Messages', 'Bulk email to indvidual users', 'messenger_post.php', 'messenger_post.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'Y', 'Y', 'N'),
	(0000659, 0121, 'New Message_houses_my', 14, 'Manage Messages', 'Bulk email to members of my house', 'messenger_post.php', 'messenger_post.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'Y', 'Y', 'N'),
	(0000660, 0121, 'New Message_houses_all', 15, 'Manage Messages', 'Bulk email to members of all houses', 'messenger_post.php', 'messenger_post.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'Y', 'Y', 'N'),
	(0000661, 0009, 'Unit Planner_all', 1, 'Planning', 'Manage all units within the school', 'units.php, units_add.php, units_delete.php, units_edit.php, units_duplicate.php, units_edit_deploy.php, units_edit_working.php, units_edit_working_copyback.php, units_edit_working_add.php, units_edit_copyBack.php, units_edit_copyForward.php, units_dump.php,units_edit_smartBlockify.php', 'units.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000662, 0009, 'Unit Planner_learningAreas', 0, 'Planning', 'Manage all units within the learning areas I have appropriate permission', 'units.php, units_add.php, units_delete.php, units_edit.php, units_duplicate.php, units_edit_deploy.php, units_edit_working.php, units_edit_working_copyback.php, units_edit_working_add.php, units_edit_copyBack.php, units_edit_copyForward.php, units_dump.php,units_edit_smartBlockify.php', 'units.php', 'Y', 'Y', 'N', 'Y', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000673, 0015, 'Activity Spread by Roll Group', 0, 'Reports', 'View spread of enrolment over terms and days by roll group', 'report_activitySpread_rollGroup.php', 'report_activitySpread_rollGroup.php', 'Y', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000674, 0001, 'Planner Settings', 0, 'Learn', 'Edit settings for the planner', 'plannerSettings.php', 'plannerSettings.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000675, 0009, 'Manage Outcomes_viewAllEditLearningArea', 1, 'Outcomes', 'View all outcomes in the school, edit any from Learning Areas where you are Coordinator or Teacher (Curriculum)', 'outcomes.php, outcomes_add.php, outcomes_edit.php, outcomes_delete.php', 'outcomes.php', 'Y', 'Y', 'N', 'Y', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000676, 0009, 'Manage Outcomes_viewEditAll', 2, 'Outcomes', 'Manage all outcomes in the school', 'outcomes.php, outcomes_add.php, outcomes_edit.php, outcomes_delete.php', 'outcomes.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000677, 0009, 'Manage Outcomes_viewAll', 0, 'Outcomes', 'View all outcomes in the school', 'outcomes.php', 'outcomes.php', 'Y', 'Y', 'N', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000678, 0126, 'Manage Rubrics_viewAllEditLearningArea', 0, 'Rubrics', 'View all rubrics in the school, edit any from Learning Areas where you are Coordinator or Teacher (Curriculum)', 'rubrics.php, rubrics_add.php, rubrics_edit.php, rubrics_delete.php, rubrics_edit_editRowsColumns.php, rubrics_duplicate.php', 'rubrics.php', 'Y', 'Y', 'N', 'Y', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000679, 0126, 'Manage Rubrics_viewEditAll', 1, 'Rubrics', 'Manage all rubrics in the school', 'rubrics.php, rubrics_add.php, rubrics_edit.php, rubrics_delete.php, rubrics_edit_editRowsColumns.php, rubrics_duplicate.php', 'rubrics.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000705, 0015, 'Activity Choices by Student', 1, 'Reports', 'View all student activity choices in the current year for a given student', 'report_activityChoices_byStudent.php', 'report_activityChoices_byStudent.php', 'Y', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000706, 0001, 'Manage Grade Scales', 1, 'Assess', 'Manage all aspects of grade scales, which are used throughout ARR to control grade input.', 'gradeScales_manage.php, gradeScales_manage_add.php, gradeScales_manage_edit.php, gradeScales_manage_delete.php, gradeScales_manage_edit_grade_add.php, gradeScales_manage_edit_grade_edit.php, gradeScales_manage_edit_grade_delete.php', 'gradeScales_manage.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000707, 0005, 'New Students', 1, 'Reports', 'A report showing all new students in the current school year.', 'report_students_new.php', 'report_students_new.php', 'Y', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000708, 0126, 'View Rubrics', 0, 'Rubrics', 'View all rubrics in the school, except students who can only view those for own year group.', 'rubrics_view.php, rubrics_view_full.php', 'rubrics_view.php', 'Y', 'Y', 'N', 'N', 'Y', 'N', 'N', 'Y', 'Y', 'Y', 'N'),
	(0000709, 0015, 'Activity Enrolment Summary', 0, 'Reports', 'View summary enrolment information for all activities in the current year.', 'report_activityEnrollmentSummary.php', 'report_activityEnrollmentSummary.php', 'Y', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000710, 0130, 'Manage Catalog', 0, 'Catalog', 'Control all items in the school library catalog', 'library_manage_catalog.php, library_manage_catalog_add.php, library_manage_catalog_edit.php, library_manage_catalog_delete.php, library_manage_catalog_duplicate.php', 'library_manage_catalog.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000711, 0130, 'Lending & Activity Log', 0, 'Catalog', 'Manage lending, returns, reservations, repairs, decommissioning, etc.', 'library_lending.php, library_lending_item.php,library_lending_item_signout.php,library_lending_item_return.php,library_lending_item_edit.php,library_lending_item_renew.php', 'library_lending.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000712, 0001, 'Library Settings', 0, 'Learn', 'Manage settings for the Library module', 'librarySettings.php', 'librarySettings.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000713, 0005, 'Age & Gender Summary', 0, 'Reports', 'Summarises gender, age and school year', 'report_students_ageGenderSummary.php', 'report_students_ageGenderSummary.php', 'N', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000714, 0005, 'Roll Group Summary', 0, 'Reports', 'Summarises gender and number of students across all roll groups.', 'report_rollGroupSummary.php', 'report_rollGroupSummary.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000715, 0001, 'Manage Alert Levels', 0, 'People', 'Manage the alert levels which are used throughout the school to flag problems.', 'alertLevelSettings.php', 'alertLevelSettings.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000716, 0011, 'Individual Needs Records_viewContribute', 1, 'Individual Needs', 'Allows users to contribute teaching strategies to IN records for all students', 'in_view.php, in_edit.php', 'in_view.php', 'Y', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000717, 0001, 'Individual Needs Settings', 0, 'People', 'Allows admins to control the descriptors available for use in the Individual Needs module.', 'inSettings.php, inSettings_add.php, inSettings_edit.php, inSettings_delete.php', 'inSettings.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000718, 0011, 'Individual Needs Summary', 0, 'Individual Needs', 'Allows user to see a flexible summary of IN data.', 'in_summary.php', 'in_summary.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000719, 0119, 'Find Behaviour Patterns', 0, 'Behaviour Tracking', 'Allows user to spot students who are repeat or regular offenders.', 'behaviour_pattern.php', 'behaviour_pattern.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000720, 0130, 'Browse The Library', 0, 'Catalog', 'Search and view all borrowable items maintained by the library', 'library_browse.php', 'library_browse.php', 'N', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y'),
	(0000721, 0130, 'View Overdue Items', 0, 'Reports', 'View items which are on loan and have exceeded their due date.', 'report_viewOverdueItems.php', 'report_viewOverdueItems.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'Y', 'Y', 'N'),
	(0000722, 0130, 'Student Borrowing Record', 0, 'Reports', 'View items borrowed by an individual student.', 'report_studentBorrowingRecord.php', 'report_studentBorrowingRecord.php', 'Y', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000723, 0002, 'User Settings', 0, 'User Settings', 'Configure settings relating to user management.', 'userSettings.php', 'userSettings.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000724, 0005, 'Family Address by Student', 0, 'Reports', 'View family addresses by student', 'report_familyAddress_byStudent.php', 'report_familyAddress_byStudent.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000725, 0002, 'Data Updater Settings', 0, 'User Settings', 'Configure options for the Data Updater module', 'dataUpdaterSettings.php', 'dataUpdaterSettings.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000726, 0001, 'Formal Assessment Settings', 0, 'Assess', 'Configure External Assessment module options', 'formalAssessmentSettings.php', 'formalAssessmentSettings.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000727, 0001, 'Markbook Settings', 0, 'Assess', 'Configure options for the Markbook module', 'markbookSettings.php', 'markbookSettings.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000741, 0015, 'View Activities_studentRegisterByParent', 2, 'Activities', 'Allows parents to register their children for activities', 'activities_view.php, activities_view_full.php, activities_view_register.php', 'activities_view.php', 'Y', 'Y', 'N', 'N', 'N', 'Y', 'N', 'N', 'N', 'Y', 'N'),
	(0000742, 0002, 'Students Settings', 0, 'User Settings', 'Manage settings for the Student module', 'studentsSettings.php,studentsSettings_noteCategory_add.php,studentsSettings_noteCategory_edit.php,studentsSettings_noteCategory_delete.php', 'studentsSettings.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000743, 0121, 'New Message_byEmail', 0, 'Manage Messages', 'Send messages by email.', 'messenger_post.php', 'messenger_post.php', 'Y', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'Y', 'Y', 'Y', 'N'),
	(0000744, 0121, 'New Message_byMessageWall', 0, 'Manage Messages', 'Send messages by message wall.', 'messenger_post.php', 'messenger_post.php', 'Y', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'Y', 'Y', 'Y', 'N'),
	(0000745, 0121, 'New Message_bySMS', 0, 'Manage Messages', 'Send messages by SMS.', 'messenger_post.php', 'messenger_post.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'Y', 'Y', 'N'),
	(0000746, 0121, 'View Message Wall', 0, 'View Messages', 'Allows users to view all messages posted on their message wall.', 'messageWall_view.php,messageWall_view_full.php', 'messageWall_view.php', 'Y', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'Y', 'Y', 'Y', 'Y'),
	(0000747, 0001, 'Messenger Settings', 0, 'Other', 'Manage gateway settings for outgoing SMS messages.', 'messengerSettings.php', 'messengerSettings.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000748, 0130, 'Catalog Summary', 0, 'Reports', 'Provides an summary overview of items in the catalog.', 'report_catalogSummary.php', 'report_catalogSummary.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'Y', 'Y', 'N'),
	(0000755, 0005, 'Left Students', 1, 'Reports', 'A report showing all the students who have left within a specified date range.', 'report_students_left.php', 'report_students_left.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000756, 0001, 'Manage File Extensions', 0, 'Other', 'Manage file extensions allowed across the system', 'fileExtensions_manage.php,fileExtensions_manage_add.php,fileExtensions_manage_edit.php,fileExtensions_manage_delete.php', 'fileExtensions_manage.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000757, 0005, 'Student ID Cards', 1, 'Reports', 'A report for bulk creation of student ID cards.', 'report_students_IDCards.php', 'report_students_IDCards.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000758, 0007, 'Edit Markbook_multipleClassesInDepartment', 1, 'Markbook', 'Edit columns and grades for a single class belonging to the user, or multiple classes within departments.', 'markbook_edit.php, markbook_edit_add.php, markbook_edit_edit.php, markbook_edit_delete.php,markbook_edit_data.php,markbook_edit_targets.php,markbook_edit_copy.php,markbook_edit_addMulti.php', 'markbook_edit.php', 'Y', 'Y', 'N', 'Y', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000759, 0007, 'Edit Markbook_multipleClassesAcrossSchool', 2, 'Markbook', 'Edit columns and grades for a single class belonging to the user, or multiple classes across the whole school.', 'markbook_edit.php, markbook_edit_add.php, markbook_edit_edit.php, markbook_edit_delete.php,markbook_edit_data.php,markbook_edit_targets.php,markbook_edit_copy.php,markbook_edit_addMulti.php', 'markbook_edit.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000760, 0014, 'View Available Facilities', 0, 'Reports', 'View unassigned rooms by timetable.', 'report_viewAvailableSpaces.php', 'report_viewAvailableSpaces.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'Y', 'Y', 'Y'),
	(0000764, 0008, 'Update Family Data_any', 1, 'Request Updates', 'Create family data update request for any user', 'data_family.php', 'data_family.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000765, 0008, 'Update Family Data_family', 0, 'Request Updates', 'Allows adults in a family to create data update request for their family.', 'data_family.php', 'data_family.php', 'Y', 'Y', 'Y', 'Y', 'N', 'Y', 'Y', 'Y', 'N', 'Y', 'N'),
	(0000766, 0008, 'Family Data Updates', 0, 'Manage Updates', 'Manage requests for updates to family data.', 'data_family_manage.php,data_family_manage_edit.php,data_family_manage_delete.php', 'data_family_manage.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000767, 0135, 'Manage Fee Categories', 0, 'Billing', 'Allows users to create, edit and delete fee categories.', 'feeCategories_manage.php,feeCategories_manage_add.php,feeCategories_manage_edit.php,feeCategories_manage_delete.php', 'feeCategories_manage.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000768, 0135, 'Manage Invoicees', 0, 'Billing', 'Allows users to view and edit invoice recipients.', 'invoicees_manage.php,invoicees_manage_edit.php', 'invoicees_manage.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000769, 0135, 'Manage Fees', 0, 'Billing', 'Allows users to create, view and edit fees.', 'fees_manage.php,fees_manage_edit.php,fees_manage_add.php', 'fees_manage.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000770, 0135, 'Manage Billing Schedule', 0, 'Billing', 'Allows users to create, view and edit billing windows.', 'billingSchedule_manage.php,billingSchedule_manage_edit.php,billingSchedule_manage_add.php', 'billingSchedule_manage.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000771, 0135, 'Manage Invoices', 0, 'Billing', 'Allows users to generate, view, delete and edit invoices.', 'invoices_manage.php,invoices_manage_edit.php,invoices_manage_add.php,invoices_manage_delete.php,invoices_manage_view.php,invoices_manage_issue.php,invoices_manage_print.php', 'invoices_manage.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000772, 0001, 'Finance Settings', 0, 'Other', 'Allows users to edit the text that appears in invoices and receipts.', 'financeSettings.php', 'financeSettings.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000773, 0008, 'Update Finance Data_any', 1, 'Request Updates', 'Create finance data update request for any user', 'data_finance.php', 'data_finance.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000774, 0008, 'Update Finance Data_family', 0, 'Request Updates', 'Allows adults in a family to create finance data update request for their family.', 'data_finance.php', 'data_finance.php', 'Y', 'Y', 'Y', 'Y', 'N', 'Y', 'Y', 'Y', 'N', 'Y', 'N'),
	(0000775, 0008, 'Finance Data Updates', 0, 'Manage Updates', 'Manage requests for updates to finance data.', 'data_finance_manage.php,data_finance_manage_edit.php,data_finance_manage_delete.php', 'data_finance_manage.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000779, 0136, 'Staff Directory_brief', 1, 'Profiles', 'View brief profile of any staff member in the school.', 'staff_view.php,staff_view_details.php', 'staff_view.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'Y', 'Y', 'Y'),
	(0000780, 0136, 'Staff Directory_full', 2, 'Profiles', 'View full profile of any staff member in the school.', 'staff_view.php,staff_view_details.php', 'staff_view.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'Y', 'Y', 'Y'),
	(0000781, 0137, 'View Roll Groups', 1, 'Roll Groups', 'View a brief profile of roll groups in school.', 'rollGroups.php,rollGroups_details.php', 'rollGroups.php', 'Y', 'Y', 'Y', 'Y', 'Y', 'N', 'Y', 'Y', 'Y', 'Y', 'Y'),
	(0000796, 0001, 'Manage External Assessments', 1, 'Assess', 'Add, edit and delete external assessments.', 'externalAssessments_manage.php,externalAssessments_manage_edit.php,externalAssessments_manage_edit_field_add.php,externalAssessments_manage_edit_field_edit.php,externalAssessments_manage_edit_field_delete.php, externalAssessments_manage_add.php, externalAssessments_manage_delete.php', 'externalAssessments_manage.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000803, 0007, 'Edit Markbook_everything', 4, 'Markbook', 'Allows editing of any column in any class.', 'markbook_edit.php, markbook_edit_add.php, markbook_edit_edit.php, markbook_edit_delete.php,markbook_edit_data.php,markbook_edit_targets.php,markbook_edit_copy.php', 'markbook_edit.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000804, 0002, 'Manage Districts', 0, 'User Management', 'Manage a list of districts for address autocomplete.', 'district_manage.php, district_manage_add.php, district_manage_edit.php, district_manage_delete.php', 'district_manage.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000805, 0005, 'Letters Home by Roll Group', 0, 'Reports', 'Show students in roll group, less those with an older sibling, so that letters can be carried home by oldest in family.', 'report_lettersHome_byRollGroup.php', 'report_lettersHome_byRollGroup.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000806, 0003, 'Manage Languages', 0, 'Extend & Update', 'Allows administrators to control system-wide language and localisation settings.', 'i18n_manage.php', 'i18n_manage.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000807, 0005, 'Privacy Choices by Student', 0, 'Reports', 'Shows privacy options selected, for those students with a selection made.', 'report_privacy_student.php', 'report_privacy_student.php', 'N', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000808, 0014, 'View Available Teachers', 0, 'Reports', 'View unassigned teachers by timetable.', 'report_viewAvailableTeachers.php', 'report_viewAvailableTeachers.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'Y', 'Y', 'Y'),
	(0000810, 0009, 'Parent Weekly Email Summary', 0, 'Reports', 'This report shows responses to the weekly summary email, organised by calendar week and role group.', 'report_parentWeeklyEmailSummaryConfirmation.php', 'report_parentWeeklyEmailSummaryConfirmation.php', 'Y', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000812, 0014, 'Manage Facility Changes_allClasses', 2, 'Facilities', 'Allows a user to create and manage one-off location changes for all classes within the timetable.', 'spaceChange_manage.php,spaceChange_manage_add.php,spaceChange_manage_edit.php,spaceChange_manage_delete.php', 'spaceChange_manage.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000813, 0014, 'Manage Facility Changes_myClasses', 0, 'Facilities', 'Allows a user to create and manage one-off location changes for their own classes within the timetable.', 'spaceChange_manage.php,spaceChange_manage_add.php,spaceChange_manage_edit.php,spaceChange_manage_delete.php', 'spaceChange_manage.php', 'Y', 'Y', 'N', 'Y', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000814, 0014, 'Manage Facility Bookings_allBookings', 0, 'Facilities', 'Allows a user to book a room for on-off use, and manage bookings made by all other users.', 'spaceBooking_manage.php,spaceBooking_manage_add.php,spaceBooking_manage_edit.php,spaceBooking_manage_delete.php', 'spaceBooking_manage.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000815, 0014, 'Manage Facility Bookings_myBookings', 0, 'Facilities', 'Allows a user to book a room for on-off use, and manage their own bookings.', 'spaceBooking_manage.php,spaceBooking_manage_add.php,spaceBooking_manage_edit.php,spaceBooking_manage_delete.php', 'spaceBooking_manage.php', 'Y', 'Y', 'N', 'Y', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000817, 0009, 'Outcomes By Course', 0, 'Outcomes', 'This view gives an overview of which whole school and learning area outcomes are covered by classes in a given course, allowing for curriculum mapping by outcome and course.', 'curriculumMapping_outcomesByCourse.php', 'curriculumMapping_outcomesByCourse.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'Y', 'Y', 'N'),
	(0000818, 0121, 'New Quick Wall Message', 0, 'Manage Messages', 'Allows for the quick posting of a Message Wall message to all users.', 'messenger_postQuickWall.php', 'messenger_postQuickWall.php', 'Y', 'Y', 'Y', 'Y', 'N', 'N', 'Y', 'Y', 'Y', 'Y', 'N'),
	(0000820, 0121, 'New Message_transport_any', 0, 'Manage Messages', 'Send messages users by transport field.', 'messenger_post.php', 'messenger_post.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'Y', 'N', 'N'),
	(0000821, 0121, 'New Message_transport_parents', 0, 'Manage Messages', 'Send messages parents of users by transport field.', 'messenger_post.php', 'messenger_post.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'Y', 'N', 'N'),
	(0000822, 0011, 'Archive Records', 0, 'Other', 'Allows for current records to be archived for viewing in the future.', 'in_archive.php', 'in_archive.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000823, 0014, 'View Timetable by Person_allYears', 3, 'View Timetables', 'Allows users to view timetables in all school years.', 'tt.php, tt_view.php', 'tt.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'Y', 'Y', 'N'),
	(0000824, 0135, 'Manage Budgets', 0, 'Expenses', 'Allows users to create, edit and delete budgets.', 'budgets_manage.php,budgets_manage_add.php,budgets_manage_edit.php,budgets_manage_delete.php', 'budgets_manage.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000825, 0135, 'Manage Expense Approvers', 0, 'Expenses', 'Determines who can approve expense requests, in accordance to the Expense Approval Type setting in School Admin.', 'expenseApprovers_manage.php,expenseApprovers_manage_add.php,expenseApprovers_manage_edit.php,expenseApprovers_manage_delete.php', 'expenseApprovers_manage.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000826, 0135, 'Manage Budget Cycles', 0, 'Expenses', 'Allows a sufficiently priviledged user to create and manage budget cycles.', 'budgetCycles_manage.php,budgetCycles_manage_add.php,budgetCycles_manage_edit.php,budgetCycles_manage_delete.php', 'budgetCycles_manage.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000827, 0135, 'My Expense Requests', 0, 'Expenses', 'Allows a user to request expenses from budgets they have access to.', 'expenseRequest_manage.php,expenseRequest_manage_add.php,expenseRequest_manage_view.php,expenseRequest_manage_reimburse.php', 'expenseRequest_manage.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000828, 0135, 'Manage Expenses_all', 0, 'Expenses', 'Gives access to full control all expenses across all budgets.', 'expenses_manage.php, expenses_manage_add.php, expenses_manage_edit.php, expenses_manage_print.php, expenses_manage_approve.php, expenses_manage_view.php', 'expenses_manage.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000829, 0135, 'Manage Expenses_myBudgets', 0, 'Expenses', 'Gives access to control expenses, according to budget-level access rights.', 'expenses_manage.php, expenses_manage_edit.php, expenses_manage_print.php, expenses_manage_approve.php, expenses_manage_view.php', 'expenses_manage.php', 'Y', 'Y', 'N', 'Y', 'N', 'N', 'Y', 'Y', 'N', 'N', 'N'),
	(0000830, 0003, 'Third Party Settings', 0, 'Settings', 'Allows administrators to configure and make use of third party services.', 'thirdPartySettings.php', 'thirdPartySettings.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000831, 0002, 'Public Registration Settings', 0, 'Student Management', 'Gives access to enable and configure public registration.', 'publicRegistrationSettings.php', 'publicRegistrationSettings.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000832, 0003, 'Sound Alarm', 0, 'Alarm', 'Allows user to issue a system-wide audio alert to all staff.', 'alarm.php', 'alarm.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000833, 0016, 'Manage Internal Assessments', 0, 'Internal Assessment', 'Allows privileged users to create and manage Internal Assessment columns.', 'internalAssessment_manage.php, internalAssessment_manage_add.php, internalAssessment_manage_edit.php, internalAssessment_manage_delete.php', 'internalAssessment_manage.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000834, 0016, 'Write Internal Assessments_myClasses', 0, 'Internal Assessment', 'Allows teachers to enter Internal Assessment assessment data to columns in their classes.', 'internalAssessment_write.php, internalAssessment_write_data.php', 'internalAssessment_write.php', 'Y', 'Y', 'N', 'Y', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000835, 0016, 'Write Internal Assessments_all', 1, 'Internal Assessment', 'Allows privileged users to enter Internal Assessment assessment data to columns in all classes.', 'internalAssessment_write.php, internalAssessment_write_data.php', 'internalAssessment_write.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000836, 0016, 'View Internal Assessments_mine', 0, 'Internal Assessment', 'Allows students to view their own Internal Assessment results.', 'internalAssessment_view.php', 'internalAssessment_view.php', 'Y', 'Y', 'N', 'N', 'Y', 'N', 'N', 'N', 'Y', 'N', 'N'),
	(0000837, 0016, 'View Internal Assessments_myChildrens', 1, 'Internal Assessment', 'Allows parents to view their childrens\' Internal Assessment results.', 'internalAssessment_view.php', 'internalAssessment_view.php', 'Y', 'Y', 'N', 'N', 'N', 'Y', 'N', 'N', 'N', 'Y', 'N'),
	(0000838, 0016, 'View Internal Assessments_all', 2, 'Internal Assessment', 'Allows staff to see Internal Assessment results for all children.', 'internalAssessment_view.php', 'internalAssessment_view.php', 'Y', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000839, 0001, 'Facility Settings', 0, 'Other', 'Allows privileged users to manage settings for spaces.', 'spaceSettings.php', 'spaceSettings.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000840, 0119, 'View Behaviour Records_myChildren', 0, 'Behaviour Records', 'View behaviour records for students within a family.', 'behaviour_view.php,behaviour_view_details.php', 'behaviour_view.php', 'Y', 'Y', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'Y', 'N'),
	(0000841, 0014, 'View Master Timetable', 0, 'View Timetables', 'Allows a user to see all days, periods, teachers and rooms in a timetable.', 'tt_master.php', 'tt_master.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000842, 0141, 'Graphing_all', 2, 'Visualise', 'Allows a user to see progress tracking graphs for all students in school.', 'graphing.php', 'graphing.php', 'N', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000843, 0013, 'Course Enrolment Rollover', 0, 'Courses & Classes', 'Allows privileged users to move enrolments from the current year to the next year.', 'course_rollover.php', 'course_rollover.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000844, 0002, 'Manage Custom Fields', 0, 'User Management', 'Allows a user to create, edit and delete custom fields for users.', 'userFields.php, userFields_add.php, userFields_edit.php, userFields_delete.php', 'userFields.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000845, 0014, 'Manage Student Enrolment', 0, 'Edit Timetables', 'Allows a departmental Coordinator or Assistant Coordinator to manage student enrolment within their department.', 'studentEnrolment_manage.php, studentEnrolment_manage_edit.php, studentEnrolment_manage_edit_edit.php', 'studentEnrolment_manage.php', 'Y', 'Y', 'N', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000846, 0001, 'Tracking Settings', 0, 'Assess', 'Allows a user to manage settings for the Tracking module.', 'trackingSettings.php', 'trackingSettings.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000847, 0141, 'Data Points', 0, 'Analyse', 'Allows a user to export certain key assessment data points to a spreadsheet.', 'dataPoints.php', 'dataPoints.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000848, 0119, 'View Behaviour Letters', 0, 'Behaviour Tracking', 'Allows a user to view automated behaviour letters sent out by the system.', 'behaviour_letters.php', 'behaviour_letters.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000849, 0135, 'View Invoices_myChildren', 1, 'Billing', 'Allows parents to view invoices issued to members of their family.', 'invoices_view.php, invoices_view_print.php', 'invoices_view.php', 'Y', 'Y', 'N', 'N', 'N', 'Y', 'N', 'N', 'N', 'Y', 'N'),
	(0000850, 0011, 'View Individual Education Plans_myChildren', 0, 'Individual Needs', 'Allows parents to view individual needs plans for members of their family.', 'iep_view_myChildren.php', 'iep_view_myChildren.php', 'Y', 'Y', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'Y', 'N'),
	(0000851, 0003, 'String Replacement', 0, 'Settings', 'Allows for interface strings to be replaced with custom values.', 'stringReplacement_manage.php, stringReplacement_manage_add.php, stringReplacement_manage_edit.php, stringReplacement_manage_delete.php', 'stringReplacement_manage.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000852, 0002, 'Import User Photos', 0, 'Import', 'Allows bulk import of user photos based on a ZIP file.', 'import_userPhotos.php', 'import_userPhotos.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000853, 0121, 'Canned Response', 0, 'Manage Messages', 'Allows for the creation of message templates.', 'cannedResponse_manage.php, cannedResponse_manage_add.php, cannedResponse_manage_edit.php, cannedResponse_manage_delete.php', 'cannedResponse_manage.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000854, 0136, 'Job Openings', 0, 'Staff Management', 'Allows for the creation of job openings, which can be used in the job application form.', 'jobOpenings_manage.php, jobOpenings_manage_add.php, jobOpenings_manage_edit.php, jobOpenings_manage_delete.php', 'jobOpenings_manage.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000855, 0002, 'Staff Settings', 0, 'User Settings', 'Controls settings for users with role category Staff.', 'staffSettings.php,staffSettings_manage_add.php,staffSettings_manage_edit.php,staffSettings_manage_delete.php', 'staffSettings.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000856, 0136, 'Application Form', 0, 'Staff Management', 'Allows prospective staff to apply for job openings.', 'applicationForm.php, applicationForm_jobOpenings_view.php', 'applicationForm.php', 'Y', 'Y', 'Y', 'Y', 'N', 'N', 'Y', 'Y', 'Y', 'Y', 'Y'),
	(0000857, 0002, 'Staff Application Form Settings', 0, 'Staff Management', 'Allows admins to control the staff application form.', 'staffApplicationFormSettings.php', 'staffApplicationFormSettings.php', 'Y', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000858, 0136, 'Manage Applications', 0, 'Staff Management', 'Allows administrators to view and action staff applications.', 'applicationForm_manage.php, applicationForm_manage_edit.php, applicationForm_manage_delete.php, applicationForm_manage_accept.php, applicationForm_manage_reject.php', 'applicationForm_manage.php', 'Y', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000859, 0136, 'Manage Staff_confidential', 1, 'Staff Management', 'Edit general and confidential information on members of staff.', 'staff_manage.php, staff_manage_add.php, staff_manage_edit.php, staff_manage_delete.php, staff_manage_edit_contract_add.php, staff_manage_edit_contract_edit.php, staff_manage_edit_facility_add.php, staff_manage_edit_facility_delete.php', 'staff_manage.php', 'Y', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000860, 0015, 'Enter Activity Attendance', 1, 'Attendance', 'Record student attendance for activities.', 'activities_attendance.php,activities_attendanceProcess.php', 'activities_attendance.php', 'Y', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000861, 0015, 'Printable Attendance Sheet', 1, 'Attendance', 'Generate a printable attendance sheet for activities.', 'activities_attendance_sheet.php,activities_attendance_sheetPrint.php', 'activities_attendance_sheet.php', 'Y', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000862, 0016, 'View External Assessments_mine', 0, 'External Assessment', 'Allows a student to view their own external assessment records.', 'externalAssessment_view.php', 'externalAssessment_view.php', 'Y', 'Y', 'N', 'N', 'N', 'N', 'N', 'N', 'Y', 'N', 'N'),
	(0000863, 0016, 'View External Assessments_myChildrens', 1, 'External Assessment', 'Allows a parent to view external assessment records for their children.', 'externalAssessment_view.php', 'externalAssessment_view.php', 'Y', 'Y', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'Y', 'N'),
	(0000864, 0135, 'View Invoices_mine', 0, 'Billing', 'Allows a student to view their own invoices.', 'invoices_view.php, invoices_view_print.php', 'invoices_view.php', 'Y', 'Y', 'N', 'N', 'N', 'N', 'N', 'N', 'Y', 'N', 'N'),
	(0000865, 0014, 'Manage Facility Changes_myDepartment', 1, 'Facilities', 'Allows a department coordinator to manage changes for all classes in their department.', 'spaceChange_manage.php,spaceChange_manage_add.php,spaceChange_manage_edit.php,spaceChange_manage_delete.php', 'spaceChange_manage.php', 'Y', 'Y', 'N', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000866, 0121, 'New Message_attendance', 0, 'Manage Messages', 'Bulk email by student attendance.', 'messenger_post.php', 'messenger_post.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000868, 0007, 'Manage Weightings_everything', 1, 'Markbook', 'Manage markbook weightings for any class.', 'weighting_manage.php,weighting_manage_add.php,weighting_manage_edit.php,weighting_manage_delete.php', 'weighting_manage.php', 'Y', 'N', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000869, 0007, 'Manage Weightings_singleClass', 0, 'Markbook', 'Manage markbook weightings for a single class at a time.', 'weighting_manage.php,weighting_manage_add.php,weighting_manage_edit.php,weighting_manage_delete.php', 'weighting_manage.php', 'Y', 'N', 'Y', 'Y', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000870, 0001, 'Dashboard Settings', 0, 'Other', 'Manage settings that control Staff, Student and Parent dashboards.', 'dashboardSettings.php', 'dashboardSettings.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000872, 0003, 'Display Settings', 0, 'Settings', 'Allows administrators to configure the system display settings.', 'displaySettings.php', 'displaySettings.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000873, 0009, 'Scope & Sequence', 0, 'Curriculum Overview', 'Allows users to generate scope and sequence documentation for individual courses, based on the Unit Planner.', 'scopeAndSequence.php', 'scopeAndSequence.php', 'N', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000874, 0009, 'Concept Explorer', 0, 'Curriculum Overview', 'Allows users to browse and explore concepts and keywords, based on the Unit Planner.', 'conceptExplorer.php', 'conceptExplorer.php', 'N', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000875, 0006, 'Attendance By Class', 0, 'Take Attendance', 'Take attendance, one class at a time', 'attendance_take_byCourseClass.php', 'attendance_take_byCourseClass.php', 'Y', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000876, 0006, 'View Daily Attendance', 0, 'Take Attendance', 'View attendance, by roll group and class', 'attendance.php', 'attendance.php', 'Y', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000877, 0001, 'Attendance Settings', 0, 'People', 'Allows administrators to configure the attendance module.', 'attendanceSettings.php,attendanceSettings_manage_add.php,attendanceSettings_manage_edit.php,attendanceSettings_manage_delete.php', 'attendanceSettings.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000878, 0006, 'Classes Not Registered', 0, 'Reports', 'Print a report of classes who have not been registered on a given day', 'report_courseClassesNotRegistered_byDate.php,report_courseClassesNotRegistered_byDate_print.php', 'report_courseClassesNotRegistered_byDate.php', 'Y', 'Y', 'Y', 'Y', 'N', 'N', 'Y', 'Y', 'N', 'N', 'Y'),
	(0000879, 0006, 'Manage Attendance Logs', 0, 'Take Attendance', 'Edit student attendance logs.', 'attendance_take_byPerson_edit.php,attendance_take_byPerson_delete.php', 'attendance_take_byPerson_edit.php', 'Y', 'N', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000880, 0006, 'Attendance Summary by Date', 0, 'Reports', 'Print a report of student attendace in a given date range', 'report_summary_byDate.php,report_summary_byDate_print.php', 'report_summary_byDate.php', 'Y', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'Y', 'N', 'N', 'Y'),
	(0000881, 0006, 'Attendance Trends', 0, 'Reports', 'Display a graph of student attendance types over time', 'report_graph_byType.php', 'report_graph_byType.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'Y'),
	(0000882, 0121, 'New Message_cannedResponse', 0, 'Manage Messages', 'Allows user to use pre-defined Canned Responses.', 'messenger_post.php', 'messenger_post.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000883, 0121, 'New Message_readReceipts', 0, 'Manage Messages', 'Allows users to include read receipts in emails.', 'messenger_post.php', 'messenger_post.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000884, 0005, 'First Aid Record', 0, 'Medical', 'Allows user to record first aid visits and actions.', 'firstAidRecord.php, firstAidRecord_add.php, firstAidRecord_edit.php', 'firstAidRecord.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'Y', 'Y', 'Y'),
	(0000885, 0005, 'View Student Profile_fullNoNotes', 2, 'Profiles', 'View full profile of any student in the school, without access to Notes.', 'student_view.php,student_view_details.php', 'student_view.php', 'Y', 'Y', 'N', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000886, 0003, 'System Check', 0, 'Extend & Update', 'Check system versions and extensions installed.', 'systemCheck.php', 'systemCheck.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000887, 0006, 'Student Self Registration', 0, 'Take Attendance', 'Allows students to self register as Present, provided they are within a certain range of IP addresses.', 'attendance_studentSelfRegister.php', 'attendance_studentSelfRegister.php', 'Y', 'Y', 'N', 'N', 'N', 'N', 'N', 'N', 'Y', 'N', 'N'),
	(0000888, 0015, 'My Activities_viewEditEnrolment', 0, 'Activities', 'Allows an activity organizer to manage enrolment for their activities.', 'activities_my.php,activities_my_full.php,activities_manage_enrolment.php,activities_manage_enrolment_add.php,activities_manage_enrolment_edit.php,activities_manage_enrolment_delete.php', 'activities_my.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000889, 0015, 'Enter Activity Attendance_leader', 0, 'Attendance', 'Record student attendance for activities you organise, coach or assist in.', 'activities_attendance.php,activities_attendanceProcess.php', 'activities_attendance.php', 'Y', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'Y', 'Y', 'N', 'N'),
	(0000890, 0015, 'Activity Attendance by Date', 0, 'Reports', 'Record student attendance for activities.', 'report_attendance_byDate.php,report_attendance_byDate_print.php', 'report_attendance_byDate.php', 'Y', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000891, 0003, 'Notification Settings', 0, 'Settings', 'Manage settings for system notifications.', 'notificationSettings.php,notificationSettings_manage_edit.php', 'notificationSettings.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000892, 0005, 'Manage Applications_edit', 0, 'Admissions', 'Allows admins to view and action applications, but not to delete them', 'applicationForm_manage.php, applicationForm_manage_edit.php, applicationForm_manage_accept.php, applicationForm_manage_reject.php, applicationForm_manage_add.php', 'applicationForm_manage.php', 'Y', 'Y', 'N', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000893, 0006, 'Attendance By Roll Group_myGroups', 0, 'Take Attendance', 'Take attendance for a teacher\'s own roll groups', 'attendance_take_byRollGroup.php', 'attendance_take_byRollGroup.php', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'Y', 'N', 'N', 'Y'),
	(0000894, 0014, 'View Timetable by Person_my', 1, 'View Timetables', 'Allows users to view their own timetable', 'tt.php, tt_view.php', 'tt.php', 'Y', 'Y', 'N', 'N', 'Y', 'N', 'N', 'Y', 'Y', 'N', 'Y'),
	(0000895, 0014, 'View Timetable by Person_myChildren', 0, 'View Timetables', 'Allows parents to view their children\'s timetable', 'tt.php, tt_view.php', 'tt.php', 'Y', 'Y', 'N', 'N', 'N', 'Y', 'N', 'N', 'N', 'Y', 'N'),
	(0000896, 0005, 'View Student Profile_my', 1, 'Profiles', 'Allows students to view their own information', 'student_view.php, student_view_details.php', 'student_view.php', 'Y', 'Y', 'N', 'N', 'Y', 'N', 'N', 'N', 'Y', 'N', 'N'),
	(0000897, 0007, 'View Markbook_myClasses', 3, 'Profiles', 'Allows teachers to view their own markbook information', 'markbook_view.php, markbook_view_full.php', 'markbook_view.php', 'Y', 'Y', 'N', 'Y', 'N', 'N', 'N', 'Y', 'N', 'N', 'Y'),
	(0000898, 0005, 'Student Enrolment Trends', 0, 'Visualise', 'Provides a visual graph of student enrolment over a range of time.', 'report_graph_studentEnrolment.php', 'report_graph_studentEnrolment.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000899, 0005, 'Students by House', 0, 'Reports', 'View a report of student houses by year group.', 'report_students_byHouse.php', 'report_students_byHouse.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000900, 0013, 'Sync Course Enrolment', 0, 'Courses & Classes', 'Allows users to map enrolments from homerooms to classes.', 'courseEnrolment_sync.php,courseEnrolment_sync_add.php,courseEnrolment_sync_edit.php,courseEnrolment_sync_delete.php,courseEnrolment_sync_run.php', 'courseEnrolment_sync.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000901, 0006, 'Student History_my', 1, 'Reports', 'Allows a student to print a report of their attendance data in the current school year.', 'report_studentHistory.php', 'report_studentHistory.php', 'Y', 'Y', 'N', 'N', 'N', 'N', 'N', 'N', 'Y', 'N', 'N'),
	(0000903, 0015, 'Activity Choices by Roll Group', 0, 'Reports', 'View all student activity choices in the current year for a given roll group.', 'report_activityChoices_byRollGroup.php', 'report_activityChoices_byRollGroup.php', 'Y', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000904, 0008, 'My Data Updates', 0, 'Request Updates', 'Provides an overview of any required data updates for a user, including family data if applicable.', 'data_updates.php', 'data_updates.php', 'Y', 'Y', 'Y', 'Y', 'N', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y'),
	(0000905, 0121, 'Manage Groups_all', 1, 'Targets', 'Allows management of custom groups for message targetting', 'groups_manage.php,groups_manage_add.php,groups_manage_edit.php,groups_manage_delete.php', 'groups_manage.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'Y', 'Y', 'Y'),
	(0000906, 0121, 'Manage Groups_my', 0, 'Targets', 'Allows management of custom groups for message targetting', 'groups_manage.php,groups_manage_add.php,groups_manage_edit.php,groups_manage_delete.php', 'groups_manage.php', 'Y', 'Y', 'N', 'Y', 'N', 'N', 'N', 'Y', 'Y', 'Y', 'Y'),
	(0000907, 0121, 'New Message_groups_any', 1, 'Manage Messages', 'Bulk email to any group', 'messenger_post.php', 'messenger_post.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'Y', 'Y', 'Y'),
	(0000908, 0121, 'New Message_groups_my', 0, 'Manage Messages', 'Bulk email to any group a user owns or is a member of', 'messenger_post.php', 'messenger_post.php', 'Y', 'Y', 'N', 'Y', 'N', 'N', 'N', 'Y', 'Y', 'Y', 'Y'),
	(0000909, 0121, 'New Message_groups_parents', 1, 'Manage Messages', 'Include parents in messages posted to groups', 'messenger_post.php', 'messenger_post.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'Y', 'Y', 'Y'),
	(0000910, 0008, 'Family Data Updater History', 0, 'Reports', 'Allows users to check, for active families, how recently they have been updated.', 'report_family_dataUpdaterHistory.php', 'report_family_dataUpdaterHistory.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'Y'),
	(0000911, 0002, 'Manage Users_edit', 0, 'User Management', 'Allows admin to edit any user within the system, but not to delete them.', 'user_manage.php, user_manage_add.php, user_manage_edit.php, user_manage_password.php', 'user_manage.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000912, 0003, 'Import From File', 0, 'Data', 'Allows a user to view and run available imports.', 'import_manage.php,import_run.php,export_run.php,import_history.php,import_history_view.php', 'import_manage.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000914, 0136, 'Manage Substitutes', 0, 'Staff Management', 'Edit information for users who can provide staff coverage.', 'substitutes_manage.php,substitutes_manage_add.php,substitutes_manage_edit.php,substitutes_manage_delete.php,coverage_availability.php', 'substitutes_manage.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'Y'),
	(0000915, 0136, 'New Absence_mine', 0, 'Absences', 'Allows a user to submit their own staff absences.', 'absences_add.php', 'absences_add.php', 'Y', 'Y', 'Y', 'Y', 'N', 'N', 'Y', 'Y', 'N', 'N', 'Y'),
	(0000916, 0136, 'New Absence_any', 2, 'Absences', 'Submit staff absences for any user.', 'absences_add.php', 'absences_add.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000917, 0136, 'View Absences_mine', 0, 'Absences', 'Provides an overview of staff absences for the selected user.', 'absences_view_byPerson.php,absences_view_details.php', 'absences_view_byPerson.php', 'Y', 'Y', 'Y', 'Y', 'N', 'N', 'Y', 'Y', 'N', 'N', 'Y'),
	(0000918, 0136, 'View Absences_any', 2, 'Absences', 'Provides an overview of staff absences for the selected user.', 'absences_view_byPerson.php,absences_view_details.php', 'absences_view_byPerson.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'Y'),
	(0000919, 0136, 'Approve Staff Absences', 0, 'Absences', 'Allows users to approve or decline staff absences.', 'absences_approval.php,absences_approval_action.php', 'absences_approval.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'Y'),
	(0000920, 0136, 'Manage Staff Absences', 0, 'Absences', 'Allows administrators to edit and delete staff absences.', 'absences_manage.php,absences_manage_edit.php,absences_manage_edit_edit.php,absences_manage_delete.php', 'absences_manage.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000921, 0011, 'Individual Needs Overview', 1, 'Reports', 'Provides a visual graph of individual needs school-wide.', 'report_graph_overview.php', 'report_graph_overview.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'Y'),
	(0000922, 0136, 'Request Coverage', 0, 'Coverage', 'Allows a staff member to request coverage for their absences.', 'coverage_request.php,coverage_view_details.php', 'coverage_request.php', 'Y', 'N', 'Y', 'Y', 'N', 'N', 'Y', 'Y', 'N', 'N', 'Y'),
	(0000923, 0136, 'My Coverage', 0, 'Coverage', 'Provides an overview of coverage for staff absences.', 'coverage_my.php,coverage_view_details.php,coverage_availability.php,coverage_view_cancel.php,coverage_view_edit.php', 'coverage_my.php', 'Y', 'Y', 'Y', 'Y', 'N', 'N', 'Y', 'Y', 'N', 'N', 'Y'),
	(0000924, 0136, 'Open Requests', 0, 'Coverage', 'Users can view and accept any available coverage requests.', 'coverage_view.php,coverage_view_accept.php,coverage_view_decline.php', 'coverage_view.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'Y', 'Y', 'N', 'N', 'Y'),
	(0000925, 0136, 'Manage Staff Coverage', 0, 'Coverage', 'Allows administrators to manage coverage requests.', 'coverage_manage.php,coverage_manage_add.php,coverage_manage_edit.php,coverage_manage_delete.php,coverage_view_details.php', 'coverage_manage.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'Y'),
	(0000926, 0136, 'Staff Absence Summary', 0, 'Reports', 'Provides an overview of staff absences for the school year.', 'report_absences_summary.php', 'report_absences_summary.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'Y'),
	(0000927, 0136, 'Weekly Absences', 0, 'Reports', 'A week-by-week overview of staff absences.', 'report_absences_weekly.php', 'report_absences_weekly.php', 'Y', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'Y', 'N', 'N', 'Y'),
	(0000928, 0136, 'Substitute Availability', 0, 'Coverage', 'Allows users to view the availability of subs by date.', 'report_subs_availability.php', 'report_subs_availability.php', 'Y', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'Y', 'N', 'N', 'Y'),
	(0000929, 0005, 'View Student Profile_fullEditAllNotes', 4, 'Profiles', 'View full profile of any student in the school, with access to edit and delete notes.', 'student_view.php,student_view_details.php,student_view_details_notes_add.php,student_view_details_notes_edit.php,student_view_details_notes_delete.php', 'student_view.php', 'Y', 'Y', 'N', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000930, 0006, 'Consecutive Absences', 0, 'Reports', 'Returns a list of students who have had a specified number of consecutive days absent.', 'report_consecutiveAbsences.php', 'report_consecutiveAbsences.php', 'Y', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'Y', 'N', 'N', 'Y'),
	(0000931, 0002, 'Manage Roles_viewOnly', 0, 'User Management', 'Allows a user to view roles but not change them.', 'role_manage.php,role_manage_view.php', 'role_manage.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000932, 0009, 'Lesson Planner_viewOnly', 2, 'Planning', 'View all planner information for all classes.', 'planner.php,planner_view_full.php,planner_unitOverview.php,planner_deadlines.php', 'planner.php', 'Y', 'Y', 'N', 'N', 'N', 'N', 'N', 'Y', 'Y', 'Y', 'Y'),
	(0000933, 0006, 'Students Not In Class', 0, 'Reports', 'Generate a report of students who are not present in class on a given day.', 'report_studentsNotInClass_byDate.php', 'report_studentsNotInClass_byDate.php', 'Y', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'Y', 'N', 'N', 'Y'),
	(0000934, 0136, 'Staff Coverage Summary', 0, 'Reports', 'Provides an overview of staff coverage for the school year.', 'report_coverage_summary.php', 'report_coverage_summary.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'Y'),
	(0000935, 0011, 'Manage Investigations_all', 1, 'Investigation', 'Allow a user to manage all Indiviudal Needs investigations.', 'investigations_manage.php,investigations_manage_add.php,investigations_manage_edit.php,investigations_manage_delete.php', 'investigations_manage.php', 'Y', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000936, 0011, 'Manage Investigations_my', 0, 'Investigation', 'Allow a user to manage their own Indiviudal Needs investigations.', 'investigations_manage.php,investigations_manage_add.php,investigations_manage_edit.php', 'investigations_manage.php', 'Y', 'Y', 'Y', 'N', 'Y', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000937, 0011, 'Submit Contributions', 0, 'Investigation', 'Allows Class Teachers and Heads of Year to contribute to investigations.', 'investigations_submit.php,investigations_submit_detail.php', 'investigations_submit.php', 'Y', 'Y', 'Y', 'Y', 'Y', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000938, 0144, 'Manage Reporting Cycles', 0, 'Administration', 'Manage the names, dates and scopes of reporting cycles.', 'reporting_cycles_manage.php,reporting_cycles_manage_add.php,reporting_cycles_manage_edit.php,reporting_cycles_manage_delete.php,reporting_cycles_manage_duplicate.php,reporting_scopes_manage.php,reporting_scopes_manage_add.php,reporting_scopes_manage_edit.php,reporting_scopes_manage_delete.php', 'reporting_cycles_manage.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000939, 0144, 'Manage Criteria', 0, 'Administration', 'Manage the types of data which are recorded per reporting cycle.', 'reporting_criteria_manage.php,reporting_criteria_manage_add.php,reporting_criteria_manage_addMultiple.php,reporting_criteria_manage_edit.php,reporting_criteria_manage_delete.php,criteriaTypes_manage.php,criteriaTypes_manage_add.php,criteriaTypes_manage_edit.php,criteriaTypes_manage_delete.php', 'reporting_criteria_manage.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000940, 0144, 'Manage Access', 0, 'Administration', 'Manage when and how users can access active reporting cycles.', 'reporting_access_manage.php,reporting_access_manage_add.php,reporting_access_manage_edit.php,reporting_access_manage_delete.php', 'reporting_access_manage.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000941, 0144, 'Report Settings', 0, 'Administration', '', 'settings.php', 'settings.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000942, 0144, 'Manage Archives', 0, 'Archive', 'Manage the filesystem locations for saving PDF reports.', 'archive_manage.php,archive_manage_add.php,archive_manage_edit.php,archive_manage_delete.php,archive_manage_migrate.php', 'archive_manage.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000943, 0144, 'View by Student', 2, 'Archive', 'Allows users to view and download a student\'s report PDFs.', 'archive_byStudent.php,archive_byStudent_view.php,archive_byStudent_download.php', 'archive_byStudent.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000944, 0144, 'View by Report', 2, 'Archive', 'Allows users to view and download batched report PDFs.', 'archive_byReport.php,archive_byReport_view.php,archive_byReport_download.php', 'archive_byReport.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000945, 0144, 'View Reports_myChildren', 1, 'Archive', 'Allows parents to view their children\'s report archive.', 'archive_byFamily.php,archive_byStudent_view.php,archive_byStudent_download.php', 'archive_byFamily.php', 'Y', 'Y', 'N', 'N', 'N', 'Y', 'N', 'N', 'N', 'Y', 'Y'),
	(0000946, 0144, 'View Reports_mine', 0, 'Archive', 'Allows students to view their own report archive.', 'archive_byStudent_view.php,archive_byStudent_download.php', 'archive_byStudent_view.php', 'Y', 'Y', 'N', 'N', 'Y', 'N', 'N', 'N', 'Y', 'N', 'N'),
	(0000947, 0144, 'View Draft Reports', 0, 'Archive', 'Allows users to view draft reports in the archive.', 'archive_byReport.php,archive_byReport_view.php', 'archive_byReport.php', 'Y', 'N', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000948, 0144, 'View Past Reports', 0, 'Archive', 'Allows users to view past reports in the archive.', 'archive_byReport.php,archive_byReport_view.php,archive_byStudent_view.php', 'archive_byReport.php', 'Y', 'N', 'Y', 'N', 'N', 'N', 'N', 'Y', 'Y', 'Y', 'Y'),
	(0000949, 0144, 'My Reporting', 0, 'Contribute', 'Provides a progress view of any active reports for this user.', 'reporting_my.php', 'reporting_my.php', 'Y', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000950, 0144, 'Generate Reports', 0, 'Publish', 'Allows users to generate PDF reports in batches or one at a time.', 'reports_generate.php,reports_generate_batch.php,reports_generate_single.php', 'reports_generate.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000951, 0144, 'Manage Reports', 0, 'Publish', 'Allows users to manage the types of reports that can be generated.', 'reports_manage.php,reports_manage_add.php,reports_manage_edit.php,reports_manage_delete.php', 'reports_manage.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000952, 0144, 'Template Builder', 0, 'Publish', 'Design report templates using a set of components.', 'templates_preview.php,templates_manage.php,templates_manage_add.php,templates_manage_edit.php,templates_manage_delete.php,templates_manage_section_add.php,templates_manage_section_edit.php,templates_manage_section_delete.php,templates_assets.php,templates_assets_components_preview.php,templates_assets_components_add.php,templates_assets_components_edit.php,templates_assets_components_delete.php,templates_assets_components_duplicate.php,templates_assets_fonts_preview.php,templates_assets_fonts_edit.php', 'templates_manage.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000953, 0144, 'Proof Read_all', 0, 'Contribute', 'Allows users to proof-read reporting comments for any active reporting cycle.', 'reporting_proofread.php', 'reporting_proofread.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000954, 0144, 'Proof Read_mine', 0, 'Contribute', 'Allows users to proof-read reporting comments for reports they have access to.', 'reporting_proofread.php', 'reporting_proofread.php', 'Y', 'Y', 'N', 'Y', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000955, 0144, 'Send Notifications', 0, 'Administration', 'Allows users to select and send a pre-defined notification to other users.', 'notification_send.php', 'notification_send.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000956, 0144, 'Progress by Reporting Cycle', 0, 'Progress', 'View report writing progress by reporting cycle.', 'progress_byReportingCycle.php', 'progress_byReportingCycle.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000957, 0144, 'Progress by Person', 0, 'Progress', 'View report writing progress by person.', 'progress_byPerson.php', 'progress_byPerson.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000958, 0144, 'Proof Reading Progress', 0, 'Progress', 'View proof-reading completion by reporting cycle.', 'progress_byProofReading.php', 'progress_byProofReading.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000959, 0144, 'Write Reports_editAll', 2, 'Contribute', 'View and edit all reports, even after they are closed.', 'reporting_write.php,reporting_write_byStudent.php', 'reporting_write.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000960, 0144, 'Write Reports_mine', 1, 'Contribute', 'View and edit only the reports this user has access to.', 'reporting_write.php,reporting_write_byStudent.php', 'reporting_write.php', 'Y', 'Y', 'N', 'Y', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000961, 0005, 'Withdraw Student', 0, 'Admissions', 'Enables admin to set a student to left and notify other users.', 'student_withdraw.php', 'student_withdraw.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000962, 0144, 'Upload Reports', 0, 'Archive', 'Enables users to upload reports from a ZIP archive.', 'archive_manage_upload.php,archive_manage_uploadPreview.php', 'archive_manage_upload.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
	(0000963, 0003, 'View Logs', 0, 'Data', 'Enables users to browse Gibbon\'s event log.', 'logs_view.php', 'logs_view.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N');
/*!40000 ALTER TABLE `gibbonaction` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibbonactivity
CREATE TABLE IF NOT EXISTS `gibbonactivity` (
  `gibbonActivityID` int(8) unsigned zerofill NOT NULL,
  `gibbonSchoolYearID` int(3) unsigned zerofill NOT NULL DEFAULT '000',
  `active` enum('Y','N') NOT NULL DEFAULT 'Y',
  `registration` enum('Y','N') NOT NULL DEFAULT 'Y' COMMENT 'Can a parent/student select this for registration?',
  `name` varchar(40) NOT NULL DEFAULT '',
  `provider` enum('School','External') NOT NULL DEFAULT 'School',
  `type` varchar(255) NOT NULL,
  `gibbonSchoolYearTermIDList` text NOT NULL,
  `listingStart` date DEFAULT NULL,
  `listingEnd` date DEFAULT NULL,
  `programStart` date DEFAULT NULL,
  `programEnd` date DEFAULT NULL,
  `gibbonYearGroupIDList` varchar(255) NOT NULL DEFAULT '',
  `maxParticipants` int(3) NOT NULL DEFAULT '0',
  `description` text,
  `payment` decimal(8,2) DEFAULT NULL,
  `paymentType` enum('Entire Programme','Per Session','Per Week','Per Term') DEFAULT 'Entire Programme',
  `paymentFirmness` enum('Finalised','Estimated') DEFAULT 'Finalised',
  PRIMARY KEY (`gibbonActivityID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibbonactivity: ~0 rows (approximately)
/*!40000 ALTER TABLE `gibbonactivity` DISABLE KEYS */;
/*!40000 ALTER TABLE `gibbonactivity` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibbonactivityattendance
CREATE TABLE IF NOT EXISTS `gibbonactivityattendance` (
  `gibbonActivityAttendanceID` int(10) unsigned zerofill NOT NULL,
  `gibbonActivityID` int(8) unsigned zerofill NOT NULL,
  `gibbonPersonIDTaker` int(10) unsigned zerofill NOT NULL,
  `attendance` text NOT NULL,
  `date` date DEFAULT NULL,
  `timestampTaken` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`gibbonActivityAttendanceID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibbonactivityattendance: ~0 rows (approximately)
/*!40000 ALTER TABLE `gibbonactivityattendance` DISABLE KEYS */;
/*!40000 ALTER TABLE `gibbonactivityattendance` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibbonactivityslot
CREATE TABLE IF NOT EXISTS `gibbonactivityslot` (
  `gibbonActivitySlotID` int(10) unsigned zerofill NOT NULL,
  `gibbonActivityID` int(8) unsigned zerofill NOT NULL,
  `gibbonSpaceID` int(5) unsigned zerofill DEFAULT NULL,
  `locationExternal` varchar(50) NOT NULL,
  `gibbonDaysOfWeekID` int(2) unsigned zerofill NOT NULL,
  `timeStart` time NOT NULL,
  `timeEnd` time NOT NULL,
  PRIMARY KEY (`gibbonActivitySlotID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibbonactivityslot: ~0 rows (approximately)
/*!40000 ALTER TABLE `gibbonactivityslot` DISABLE KEYS */;
/*!40000 ALTER TABLE `gibbonactivityslot` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibbonactivitystaff
CREATE TABLE IF NOT EXISTS `gibbonactivitystaff` (
  `gibbonActivityStaffID` int(8) unsigned zerofill NOT NULL,
  `gibbonActivityID` int(8) unsigned zerofill NOT NULL DEFAULT '00000000',
  `gibbonPersonID` int(10) unsigned zerofill NOT NULL DEFAULT '0000000000',
  `role` enum('Organiser','Coach','Assistant','Other') NOT NULL DEFAULT 'Organiser',
  PRIMARY KEY (`gibbonActivityStaffID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibbonactivitystaff: ~0 rows (approximately)
/*!40000 ALTER TABLE `gibbonactivitystaff` DISABLE KEYS */;
/*!40000 ALTER TABLE `gibbonactivitystaff` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibbonactivitystudent
CREATE TABLE IF NOT EXISTS `gibbonactivitystudent` (
  `gibbonActivityStudentID` int(10) unsigned zerofill NOT NULL,
  `gibbonActivityID` int(8) unsigned zerofill NOT NULL DEFAULT '00000000',
  `gibbonPersonID` int(10) unsigned zerofill NOT NULL DEFAULT '0000000000',
  `status` enum('Accepted','Pending','Waiting List','Not Accepted') NOT NULL DEFAULT 'Pending',
  `timestamp` datetime NOT NULL,
  `gibbonActivityIDBackup` int(8) unsigned zerofill DEFAULT NULL,
  `invoiceGenerated` enum('N','Y') NOT NULL DEFAULT 'N',
  `gibbonFinanceInvoiceID` int(14) unsigned zerofill DEFAULT NULL,
  PRIMARY KEY (`gibbonActivityStudentID`),
  KEY `gibbonActivityID` (`gibbonActivityID`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibbonactivitystudent: ~0 rows (approximately)
/*!40000 ALTER TABLE `gibbonactivitystudent` DISABLE KEYS */;
/*!40000 ALTER TABLE `gibbonactivitystudent` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibbonalarm
CREATE TABLE IF NOT EXISTS `gibbonalarm` (
  `gibbonAlarmID` int(5) unsigned zerofill NOT NULL,
  `type` enum('General','Lockdown','Custom') DEFAULT NULL,
  `status` enum('Current','Past') NOT NULL DEFAULT 'Past',
  `gibbonPersonID` int(10) unsigned zerofill NOT NULL,
  `timestampStart` timestamp NULL DEFAULT NULL,
  `timestampEnd` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`gibbonAlarmID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibbonalarm: ~0 rows (approximately)
/*!40000 ALTER TABLE `gibbonalarm` DISABLE KEYS */;
/*!40000 ALTER TABLE `gibbonalarm` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibbonalarmconfirm
CREATE TABLE IF NOT EXISTS `gibbonalarmconfirm` (
  `gibbonAlarmConfirmID` int(8) unsigned zerofill NOT NULL,
  `gibbonAlarmID` int(5) unsigned zerofill NOT NULL,
  `gibbonPersonID` int(10) unsigned zerofill NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`gibbonAlarmConfirmID`),
  UNIQUE KEY `gibbonAlarmID` (`gibbonAlarmID`,`gibbonPersonID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibbonalarmconfirm: ~0 rows (approximately)
/*!40000 ALTER TABLE `gibbonalarmconfirm` DISABLE KEYS */;
/*!40000 ALTER TABLE `gibbonalarmconfirm` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibbonalertlevel
CREATE TABLE IF NOT EXISTS `gibbonalertlevel` (
  `gibbonAlertLevelID` int(3) unsigned zerofill NOT NULL,
  `name` varchar(50) NOT NULL,
  `nameShort` varchar(4) NOT NULL,
  `color` varchar(6) NOT NULL COMMENT 'RGB Hex, no leading #',
  `colorBG` varchar(6) NOT NULL COMMENT 'RGB Hex, no leading #',
  `description` text NOT NULL,
  `sequenceNumber` int(3) NOT NULL,
  PRIMARY KEY (`gibbonAlertLevelID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibbonalertlevel: ~3 rows (approximately)
/*!40000 ALTER TABLE `gibbonalertlevel` DISABLE KEYS */;
INSERT INTO `gibbonalertlevel` (`gibbonAlertLevelID`, `name`, `nameShort`, `color`, `colorBG`, `description`, `sequenceNumber`) VALUES
	(001, 'High', 'H', 'CC0000', 'F6CECB', 'Highest level of severity, requiring intense and immediate readiness, action, individual support or differentiation.', 3),
	(002, 'Medium', 'M', 'FF7414', 'FFD2A9', 'Moderate severity, requiring intermediate level of readiness, action, individual support or differentiation.', 2),
	(003, 'Low', 'L', '939090', 'dddddd', 'Low severity, requiring little to no readiness, action, individual support or differentiation.', 1);
/*!40000 ALTER TABLE `gibbonalertlevel` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibbonapplicationform
CREATE TABLE IF NOT EXISTS `gibbonapplicationform` (
  `gibbonApplicationFormID` int(12) unsigned zerofill NOT NULL,
  `gibbonApplicationFormHash` varchar(40) DEFAULT NULL,
  `surname` varchar(60) NOT NULL DEFAULT '',
  `firstName` varchar(60) NOT NULL DEFAULT '',
  `preferredName` varchar(60) NOT NULL DEFAULT '',
  `officialName` varchar(150) NOT NULL,
  `nameInCharacters` varchar(20) NOT NULL,
  `gender` enum('M','F') NOT NULL DEFAULT 'M',
  `username` varchar(20) DEFAULT NULL,
  `status` enum('Pending','Waiting List','Accepted','Rejected','Withdrawn') NOT NULL DEFAULT 'Pending',
  `dob` date DEFAULT NULL,
  `email` varchar(75) DEFAULT NULL,
  `homeAddress` mediumtext,
  `homeAddressDistrict` varchar(255) DEFAULT NULL,
  `homeAddressCountry` varchar(255) DEFAULT NULL,
  `phone1Type` enum('','Mobile','Home','Work','Fax','Pager','Other') NOT NULL DEFAULT '',
  `phone1CountryCode` varchar(7) NOT NULL,
  `phone1` varchar(20) NOT NULL,
  `phone2Type` enum('','Mobile','Home','Work','Fax','Pager','Other') NOT NULL DEFAULT '',
  `phone2CountryCode` varchar(7) NOT NULL,
  `phone2` varchar(20) NOT NULL,
  `countryOfBirth` varchar(30) NOT NULL,
  `citizenship1` varchar(255) NOT NULL,
  `citizenship1Passport` varchar(30) NOT NULL,
  `citizenship1PassportExpiry` date DEFAULT NULL,
  `nationalIDCardNumber` varchar(30) NOT NULL,
  `residencyStatus` varchar(255) NOT NULL,
  `visaExpiryDate` date DEFAULT NULL,
  `gibbonSchoolYearIDEntry` int(3) unsigned zerofill NOT NULL,
  `gibbonYearGroupIDEntry` int(3) unsigned zerofill NOT NULL,
  `dayType` varchar(255) DEFAULT NULL,
  `referenceEmail` varchar(100) DEFAULT NULL,
  `schoolName1` varchar(50) NOT NULL,
  `schoolAddress1` varchar(255) NOT NULL,
  `schoolGrades1` varchar(20) NOT NULL,
  `schoolLanguage1` varchar(50) NOT NULL,
  `schoolDate1` date DEFAULT NULL,
  `schoolName2` varchar(50) NOT NULL,
  `schoolAddress2` varchar(255) NOT NULL,
  `schoolGrades2` varchar(20) NOT NULL,
  `schoolLanguage2` varchar(50) NOT NULL,
  `schoolDate2` date DEFAULT NULL,
  `gibbonFamilyID` int(7) unsigned zerofill DEFAULT NULL,
  `siblingName1` varchar(50) NOT NULL,
  `siblingDOB1` date DEFAULT NULL,
  `siblingSchool1` varchar(50) NOT NULL,
  `siblingSchoolJoiningDate1` date DEFAULT NULL,
  `siblingName2` varchar(50) NOT NULL,
  `siblingDOB2` date DEFAULT NULL,
  `siblingSchool2` varchar(50) NOT NULL,
  `siblingSchoolJoiningDate2` date DEFAULT NULL,
  `siblingName3` varchar(50) NOT NULL,
  `siblingDOB3` date DEFAULT NULL,
  `siblingSchool3` varchar(50) NOT NULL,
  `siblingSchoolJoiningDate3` date DEFAULT NULL,
  `languageHomePrimary` varchar(30) NOT NULL,
  `languageHomeSecondary` varchar(30) NOT NULL,
  `languageFirst` varchar(30) NOT NULL,
  `languageSecond` varchar(30) NOT NULL,
  `languageThird` varchar(30) NOT NULL,
  `medicalInformation` text NOT NULL,
  `sen` enum('N','Y') DEFAULT NULL,
  `senDetails` text NOT NULL,
  `languageChoice` varchar(100) DEFAULT NULL,
  `languageChoiceExperience` text,
  `scholarshipInterest` enum('N','Y') NOT NULL DEFAULT 'N',
  `scholarshipRequired` enum('N','Y') NOT NULL DEFAULT 'N',
  `payment` enum('Family','Company') NOT NULL DEFAULT 'Family',
  `companyName` varchar(100) DEFAULT NULL,
  `companyContact` varchar(100) DEFAULT NULL,
  `companyAddress` varchar(255) DEFAULT NULL,
  `companyEmail` text,
  `companyCCFamily` enum('N','Y') DEFAULT NULL COMMENT 'When company is billed, should family receive a copy?',
  `companyPhone` varchar(20) DEFAULT NULL,
  `companyAll` enum('Y','N') DEFAULT NULL,
  `gibbonFinanceFeeCategoryIDList` text,
  `agreement` enum('N','Y') DEFAULT NULL,
  `parent1gibbonPersonID` int(10) unsigned zerofill DEFAULT NULL,
  `parent1title` varchar(5) DEFAULT NULL,
  `parent1surname` varchar(60) DEFAULT '',
  `parent1firstName` varchar(60) DEFAULT '',
  `parent1preferredName` varchar(60) DEFAULT '',
  `parent1officialName` varchar(150) DEFAULT NULL,
  `parent1nameInCharacters` varchar(20) DEFAULT NULL,
  `parent1gender` enum('M','F','Other','Unspecified') DEFAULT 'Unspecified',
  `parent1relationship` varchar(50) DEFAULT NULL,
  `parent1languageFirst` varchar(30) DEFAULT NULL,
  `parent1languageSecond` varchar(30) DEFAULT NULL,
  `parent1citizenship1` varchar(255) DEFAULT NULL,
  `parent1nationalIDCardNumber` varchar(30) DEFAULT NULL,
  `parent1residencyStatus` varchar(255) DEFAULT NULL,
  `parent1visaExpiryDate` date DEFAULT NULL,
  `parent1email` varchar(75) DEFAULT NULL,
  `parent1phone1Type` enum('','Mobile','Home','Work','Fax','Pager','Other') DEFAULT '',
  `parent1phone1CountryCode` varchar(7) DEFAULT NULL,
  `parent1phone1` varchar(20) DEFAULT NULL,
  `parent1phone2Type` enum('','Mobile','Home','Work','Fax','Pager','Other') DEFAULT '',
  `parent1phone2CountryCode` varchar(7) DEFAULT NULL,
  `parent1phone2` varchar(20) DEFAULT NULL,
  `parent1profession` varchar(30) DEFAULT NULL,
  `parent1employer` varchar(30) DEFAULT NULL,
  `parent2title` varchar(5) DEFAULT NULL,
  `parent2surname` varchar(60) DEFAULT '',
  `parent2firstName` varchar(60) DEFAULT '',
  `parent2preferredName` varchar(60) DEFAULT '',
  `parent2officialName` varchar(150) DEFAULT NULL,
  `parent2nameInCharacters` varchar(20) DEFAULT NULL,
  `parent2gender` enum('M','F','Other','Unspecified') DEFAULT 'Unspecified',
  `parent2relationship` varchar(50) DEFAULT NULL,
  `parent2languageFirst` varchar(30) DEFAULT NULL,
  `parent2languageSecond` varchar(30) DEFAULT NULL,
  `parent2citizenship1` varchar(255) DEFAULT NULL,
  `parent2nationalIDCardNumber` varchar(30) DEFAULT NULL,
  `parent2residencyStatus` varchar(255) DEFAULT NULL,
  `parent2visaExpiryDate` date DEFAULT NULL,
  `parent2email` varchar(75) DEFAULT NULL,
  `parent2phone1Type` enum('','Mobile','Home','Work','Fax','Pager','Other') DEFAULT '',
  `parent2phone1CountryCode` varchar(7) DEFAULT NULL,
  `parent2phone1` varchar(20) DEFAULT NULL,
  `parent2phone2Type` enum('','Mobile','Home','Work','Fax','Pager','Other') DEFAULT '',
  `parent2phone2CountryCode` varchar(7) DEFAULT NULL,
  `parent2phone2` varchar(20) DEFAULT NULL,
  `parent2profession` varchar(30) DEFAULT NULL,
  `parent2employer` varchar(30) DEFAULT NULL,
  `timestamp` timestamp NULL DEFAULT NULL,
  `priority` int(1) NOT NULL DEFAULT '0',
  `milestones` text NOT NULL,
  `notes` text NOT NULL,
  `dateStart` date DEFAULT NULL,
  `gibbonRollGroupID` int(5) unsigned zerofill DEFAULT NULL,
  `howDidYouHear` varchar(255) DEFAULT NULL,
  `howDidYouHearMore` varchar(255) DEFAULT NULL,
  `paymentMade` enum('N','Y','Exemption') NOT NULL DEFAULT 'N',
  `gibbonPaymentID` int(14) unsigned zerofill DEFAULT NULL,
  `studentID` varchar(10) DEFAULT NULL,
  `privacy` text,
  `fields` text NOT NULL COMMENT 'Serialised array of custom field values',
  `parent1fields` text NOT NULL COMMENT 'Serialised array of custom field values',
  `parent2fields` text NOT NULL COMMENT 'Serialised array of custom field values',
  PRIMARY KEY (`gibbonApplicationFormID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibbonapplicationform: ~310 rows (approximately)
/*!40000 ALTER TABLE `gibbonapplicationform` DISABLE KEYS */;
INSERT INTO `gibbonapplicationform` (`gibbonApplicationFormID`, `gibbonApplicationFormHash`, `surname`, `firstName`, `preferredName`, `officialName`, `nameInCharacters`, `gender`, `username`, `status`, `dob`, `email`, `homeAddress`, `homeAddressDistrict`, `homeAddressCountry`, `phone1Type`, `phone1CountryCode`, `phone1`, `phone2Type`, `phone2CountryCode`, `phone2`, `countryOfBirth`, `citizenship1`, `citizenship1Passport`, `citizenship1PassportExpiry`, `nationalIDCardNumber`, `residencyStatus`, `visaExpiryDate`, `gibbonSchoolYearIDEntry`, `gibbonYearGroupIDEntry`, `dayType`, `referenceEmail`, `schoolName1`, `schoolAddress1`, `schoolGrades1`, `schoolLanguage1`, `schoolDate1`, `schoolName2`, `schoolAddress2`, `schoolGrades2`, `schoolLanguage2`, `schoolDate2`, `gibbonFamilyID`, `siblingName1`, `siblingDOB1`, `siblingSchool1`, `siblingSchoolJoiningDate1`, `siblingName2`, `siblingDOB2`, `siblingSchool2`, `siblingSchoolJoiningDate2`, `siblingName3`, `siblingDOB3`, `siblingSchool3`, `siblingSchoolJoiningDate3`, `languageHomePrimary`, `languageHomeSecondary`, `languageFirst`, `languageSecond`, `languageThird`, `medicalInformation`, `sen`, `senDetails`, `languageChoice`, `languageChoiceExperience`, `scholarshipInterest`, `scholarshipRequired`, `payment`, `companyName`, `companyContact`, `companyAddress`, `companyEmail`, `companyCCFamily`, `companyPhone`, `companyAll`, `gibbonFinanceFeeCategoryIDList`, `agreement`, `parent1gibbonPersonID`, `parent1title`, `parent1surname`, `parent1firstName`, `parent1preferredName`, `parent1officialName`, `parent1nameInCharacters`, `parent1gender`, `parent1relationship`, `parent1languageFirst`, `parent1languageSecond`, `parent1citizenship1`, `parent1nationalIDCardNumber`, `parent1residencyStatus`, `parent1visaExpiryDate`, `parent1email`, `parent1phone1Type`, `parent1phone1CountryCode`, `parent1phone1`, `parent1phone2Type`, `parent1phone2CountryCode`, `parent1phone2`, `parent1profession`, `parent1employer`, `parent2title`, `parent2surname`, `parent2firstName`, `parent2preferredName`, `parent2officialName`, `parent2nameInCharacters`, `parent2gender`, `parent2relationship`, `parent2languageFirst`, `parent2languageSecond`, `parent2citizenship1`, `parent2nationalIDCardNumber`, `parent2residencyStatus`, `parent2visaExpiryDate`, `parent2email`, `parent2phone1Type`, `parent2phone1CountryCode`, `parent2phone1`, `parent2phone2Type`, `parent2phone2CountryCode`, `parent2phone2`, `parent2profession`, `parent2employer`, `timestamp`, `priority`, `milestones`, `notes`, `dateStart`, `gibbonRollGroupID`, `howDidYouHear`, `howDidYouHearMore`, `paymentMade`, `gibbonPaymentID`, `studentID`, `privacy`, `fields`, `parent1fields`, `parent2fields`) VALUES
	(000000000001, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Muntaha Oishwin Shera', '', 'Muntaha Oishwin Shera', 'Muntaha Oishwin Sher', 'F', NULL, 'Accepted', '2002-08-18', NULL, 'Uttar Basudebpur , Bangla-Hili, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1729519683', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Muntaha Oishwin Shera', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2027-04-20 08:29:00', 0, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000002, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'M.H Zarin Tasnim', '', 'M.H Zarin Tasnim', 'M.H Zarin Tasnim', 'F', NULL, 'Accepted', '2014-07-15', NULL, 'Moddha Basudebpur, Bangla-Hili, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1732440550', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'M.H Zarin Tasnim', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2002-02-20 05:10:00', 1, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000003, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md. Shoaib Mahdi', '', 'Md. Shoaib Mahdi', 'Md. Shoaib Mahdi', 'M', NULL, 'Accepted', '2031-08-14', NULL, 'Moddha Basudebpur, Bangla-Hili, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1714803838', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md. Shoaib Mahdi', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2002-02-20 05:17:00', 2, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000004, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md. Reduan Hosen Nil', '', 'Md. Reduan Hosen Nil', 'Md. Reduan Hosen Nil', 'M', NULL, 'Accepted', '2018-04-14', NULL, 'Kuto Hara, Bagzana, Panchbibi, Joypurhat', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1912611236', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md. Reduan Hosen Nil', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2002-02-20 05:23:00', 3, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000005, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md. Mahmud Nafis', '', 'Md. Mahmud Nafis', 'Md. Mahmud Nafis', 'M', NULL, 'Accepted', '2005-12-15', NULL, 'Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1853328734', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md. Mahmud Nafis', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2002-02-20 06:33:00', 4, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000006, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Maria Rahman Mahin', '', 'Maria Rahman Mahin', 'Maria Rahman Mahin', 'F', NULL, 'Accepted', '2002-03-16', NULL, 'Dakshin Basudebpur, Bangla-hili, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1902060804', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Maria Rahman Mahin', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2002-02-20 07:23:00', 5, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000007, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Satowat Hossain Saif ', '', 'Satowat Hossain Saif ', 'Satowat Hossain Saif', 'M', NULL, 'Accepted', '2013-10-13', NULL, 'Moddho Basudebpur, Bangla-hili, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1933529061', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Satowat Hossain Saif ', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2002-02-20 07:29:00', 6, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000008, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Shakil Ahmed khan', '', 'Shakil Ahmed khan', 'Shakil Ahmed khan', 'M', NULL, 'Accepted', '2026-03-15', NULL, 'Dhornoda, Bangla-hili, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1912268942', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Shakil Ahmed khan', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2002-02-20 07:32:00', 7, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000009, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Mst. Anika Nawar Nimu', '', 'Mst. Anika Nawar Nimu', 'Mst. Anika Nawar Nim', 'F', NULL, 'Accepted', '2031-05-14', NULL, 'Modddho Basudebpur, Bangla-hili, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1742192899', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Mst. Anika Nawar Nimu', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2002-02-20 07:48:00', 8, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000010, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Abdullah Al Muhit', '', 'Abdullah Al Muhit', 'Abdullah Al Muhit', 'M', NULL, 'Accepted', '2009-08-13', NULL, 'Village: Hatkhola, Post: Dhoronji, Upazilla: Panchbibi, District: Joypurhat', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1782924027', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Abdullah Al Muhit', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2002-02-20 08:57:00', 9, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000011, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Muntasim Ishrak Lam', '', 'Muntasim Ishrak Lam', 'Muntasim Ishrak Lam', 'M', NULL, 'Accepted', '2019-08-13', NULL, 'Dhoronda, Bangla-hili, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1746722265', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Muntasim Ishrak Lam', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2003-02-20 06:00:00', 10, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000012, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Arafat Rahman', '', 'Arafat Rahman', 'Arafat Rahman', 'M', NULL, 'Accepted', '2015-02-15', NULL, 'Uttor Basudebpur, Bangla-hili, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1714383438', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Arafat Rahman', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2003-02-20 06:05:00', 11, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000013, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Purnota Chokrabarty ', '', 'Purnota Chokrabarty ', 'Purnota Chokrabarty ', 'F', NULL, 'Accepted', '2016-06-14', NULL, 'Dhoronda, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1724678258', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Purnota Chokrabarty ', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2003-02-20 06:10:00', 12, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000014, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md. Faheem Faisal Sadaaf', '', 'Md. Faheem Faisal Sadaaf', 'Md. Faheem Faisal Sa', 'M', NULL, 'Accepted', '2028-08-14', NULL, 'Bangla-Hili, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1710432681', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md. Faheem Faisal Sadaaf', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2003-02-20 06:26:00', 13, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000015, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md. Samin  Ahanaf', '', 'Md. Samin  Ahanaf', 'Md. Samin  Ahanaf', 'M', NULL, 'Accepted', '2011-11-14', NULL, 'Bangla-Hili, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1765087928', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md. Samin  Ahanaf', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2003-02-20 06:39:00', 14, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000016, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md. Ibnul Enan', '', 'Md. Ibnul Enan', 'Md. Ibnul Enan', 'M', NULL, 'Accepted', '2013-04-15', NULL, 'Bowaldar, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1716749366', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md. Ibnul Enan', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2003-02-20 06:45:00', 15, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000017, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Tanjib ul munif ', '', 'Tanjib ul munif ', 'Tanjib ul munif ', 'M', NULL, 'Accepted', '2031-01-15', NULL, 'Uttar krishnopur, Bagzana, Panchbibi, Joypurhat', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1717424234', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Tanjib ul munif ', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2004-02-20 06:02:00', 16, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000018, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md.Abir Uddin ', '', 'Md.Abir Uddin ', 'Md.Abir Uddin ', 'M', NULL, 'Accepted', '2010-03-13', NULL, 'Uttar Basudebpur, Bangla-hili, hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1712883078', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md.Abir Uddin ', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2004-02-20 06:17:00', 17, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000019, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Mst. Mehzabin Muskan ', '', 'Mst. Mehzabin Muskan ', 'Mst. Mehzabin Muskan', 'F', NULL, 'Accepted', '2020-12-15', NULL, 'Dakshin basudebpur, bangla-hili, hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1712874325', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Mst. Mehzabin Muskan ', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2004-02-20 06:21:00', 18, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000020, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md. Shahriar rahat Shourov', '', 'Md. Shahriar rahat Shourov', 'Md. Shahriar rahat S', 'M', NULL, 'Accepted', '2003-09-14', NULL, 'Dakshin basudebpur, bangla-hili, hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1716674879', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md. Shahriar rahat Shourov', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2004-02-20 06:24:00', 19, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000021, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md. Abu talha Fuad', '', 'Md. Abu talha Fuad', 'Md. Abu talha Fuad', 'M', NULL, 'Accepted', '2028-06-14', NULL, 'Mathpara, bangla-hili, hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1905902642', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md. Abu talha Fuad', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2004-02-20 06:28:00', 20, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000022, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Disha Poddar', '', 'Disha Poddar', 'Disha Poddar', 'F', NULL, 'Accepted', '2012-03-15', NULL, 'Dhoronda, Fokirpara,bangla-Hili, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1716332386', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Disha Poddar', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2005-02-20 06:07:00', 21, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000023, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md. Mottashin Billah', '', 'Md. Mottashin Billah', 'Md. Mottashin Billah', 'M', NULL, 'Accepted', '2005-05-14', NULL, 'Devkhonda, Dangapara, Hakimpur , Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1744793055', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md. Mottashin Billah', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2005-02-20 06:45:00', 22, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000024, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md. Yamin Shakh Pritom', '', 'Md. Yamin Shakh Pritom', 'Md. Yamin Shakh Prit', 'M', NULL, 'Accepted', '2020-11-17', NULL, 'Uttar Bashudebpur, Bangla-hili, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1912838117', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md. Yamin Shakh Pritom', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2005-02-20 06:52:00', 23, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000025, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md. Mostakim', '', 'Md. Mostakim', 'Md. Mostakim', 'M', NULL, 'Accepted', '2026-03-15', NULL, 'Mohorapara, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1717167282', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md. Mostakim', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2005-02-20 06:58:00', 24, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000026, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Tiyas Das', '', 'Tiyas Das', 'Tiyas Das', 'M', NULL, 'Accepted', '2024-07-16', NULL, 'Uttar, basudebpur, Banglahili, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1728980910', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Tiyas Das', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-02-20 06:18:00', 25, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000027, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md. Yasin Arafat Adib', '', 'Md. Yasin Arafat Adib', 'Md. Yasin Arafat Adi', 'M', NULL, 'Accepted', '2012-07-15', NULL, 'Dakshin Basudebpur, Bangla-Hili, hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1716488937', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md. Yasin Arafat Adib', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-02-20 06:38:00', 26, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000028, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md. Sinad Arian Saud', '', 'Md. Sinad Arian Saud', 'Md. Sinad Arian Saud', 'M', NULL, 'Accepted', '2009-01-15', NULL, 'MonglaPara, Dangapara, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1756769721', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md. Sinad Arian Saud', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-02-20 06:44:00', 27, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000029, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Mst. Asifa Akter', '', 'Mst. Asifa Akter', 'Mst. Asifa Akter', 'F', NULL, 'Accepted', '2029-07-12', NULL, 'NowdaPara, Dangapara, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1922828557', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Mst. Asifa Akter', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-02-20 06:47:00', 28, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000030, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md. Tahmid Rahman', '', 'Md. Tahmid Rahman', 'Md. Tahmid Rahman', 'M', NULL, 'Accepted', '2024-01-15', NULL, 'Monoshapur, Alihat, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1725245519', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md. Tahmid Rahman', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-02-20 06:52:00', 29, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000031, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md. Abid Ur Rahman Abir', '', 'Md. Abid Ur Rahman Abir', 'Md. Abid Ur Rahman A', 'M', NULL, 'Accepted', '2007-09-15', NULL, 'Atapara, Uttar Krishnopur, Bagzana, Panchbibi, Joypurhat', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1714751610', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md. Abid Ur Rahman Abir', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015-02-20 07:40:00', 30, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000032, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md. Safayet Islam Shaikat', '', 'Md. Safayet Islam Shaikat', 'Md. Safayet Islam Sh', 'M', NULL, 'Accepted', '2004-02-15', NULL, 'NowdaPara, Dangapara, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1724443494', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md. Safayet Islam Shaikat', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-02-20 06:58:00', 31, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000033, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md. Soyat Ali ', '', 'Md. Soyat Ali ', 'Md. Soyat Ali ', 'M', NULL, 'Accepted', '2008-02-15', NULL, 'Dakshin Bashudebpur , Bangla-Hili, hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1405547416', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md. Soyat Ali ', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-02-20 07:01:00', 32, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000034, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md. Nahin Munkar Sarker ', '', 'Md. Nahin Munkar Sarker ', 'Md. Nahin Munkar Sar', 'M', NULL, 'Accepted', '2004-09-15', NULL, 'Mohorapara , Bangla-Hili, hakimpur , Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1774731475', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md. Nahin Munkar Sarker ', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-02-20 07:05:00', 33, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000035, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Mst. Anabiya Islam Toha ', '', 'Mst. Anabiya Islam Toha ', 'Mst. Anabiya Islam T', 'F', NULL, 'Accepted', '2010-05-16', NULL, 'Moddho Basudebpur , Bangla-Hili, hakimpur , Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1913365075', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Mst. Anabiya Islam Toha ', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-02-20 07:08:00', 34, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000036, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md. Apon Hossain Arju', '', 'Md. Apon Hossain Arju', 'Md. Apon Hossain Arj', 'M', NULL, 'Accepted', '2023-08-14', NULL, 'Uttar Gopal pur, Bagzana, Panchbibi , joypurhat', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1739260720', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md. Apon Hossain Arju', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-02-20 07:11:00', 35, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000037, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Mst. Nishat Nabila Roja ', '', 'Mst. Nishat Nabila Roja ', 'Mst. Nishat Nabila R', 'F', NULL, 'Accepted', '2004-11-14', NULL, 'Moddho Basudebpur, Bangla-hili, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1716400123', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Mst. Nishat Nabila Roja ', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-02-20 07:14:00', 36, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000038, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Mst. Samaira Priyantika ', '', 'Mst. Samaira Priyantika ', 'Mst. Samaira Priyant', 'F', NULL, 'Accepted', '2018-08-14', NULL, 'UIttar Basudebpur, Bangla-hili, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1636012599', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Mst. Samaira Priyantika ', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-02-20 07:17:00', 37, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000039, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md. Yamin Morsalin ', '', 'Md. Yamin Morsalin ', 'Md. Yamin Morsalin ', 'M', NULL, 'Accepted', '2002-02-17', NULL, 'PalPara, Bangla-hili, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1712015162', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md. Yamin Morsalin ', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-02-20 07:20:00', 38, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000040, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md. Mithila Zannat Shanjida', '', 'Md. Mithila Zannat Shanjida', 'Md. Mithila Zannat S', 'F', NULL, 'Accepted', '2006-09-15', NULL, 'Dakshin Basudebpur, Bangla-hili, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1960537230', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md. Mithila Zannat Shanjida', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-02-20 07:24:00', 39, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000041, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md. Abid Shahriar', '', 'Md. Abid Shahriar', 'Md. Abid Shahriar', 'M', NULL, 'Accepted', '2031-12-15', NULL, 'Jangoi, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1774711354', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md. Abid Shahriar', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-02-20 07:41:00', 40, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000042, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md. Kazi Safayetul Islam ', '', 'Md. Kazi Safayetul Islam ', 'Md. Kazi Safayetul I', 'M', NULL, 'Accepted', '2012-10-15', NULL, 'Dakshin Basudebpur, Bangla-Hili, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1717728272', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md. Kazi Safayetul Islam ', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-02-20 07:44:00', 41, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000043, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md. Umar Faruq Fahad', '', 'Md. Umar Faruq Fahad', 'Md. Umar Faruq Fahad', 'M', NULL, 'Accepted', '2003-06-16', NULL, 'Shonapur, Panchbibi, Joypurhat', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1776679929', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md. Umar Faruq Fahad', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-02-20 07:46:00', 42, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000044, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md. Nirob Hossain ', '', 'Md. Nirob Hossain ', 'Md. Nirob Hossain ', 'M', NULL, 'Accepted', '2006-09-15', NULL, 'Boro Dangapara, Hakimpur , Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1759044423', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md. Nirob Hossain ', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-02-20 07:48:00', 43, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000045, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md. Jayed Al Rohan ', '', 'Md. Jayed Al Rohan ', 'Md. Jayed Al Rohan ', 'M', NULL, 'Accepted', '2027-04-16', NULL, 'Bowaldar, Hakimpur, Dinajpur ', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1732012838', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md. Jayed Al Rohan ', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-02-20 07:51:00', 44, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000046, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Sanaya More', '', 'Sanaya More', 'Sanaya More', 'F', NULL, 'Accepted', '2011-06-16', NULL, 'Dhoronda, Bangla-Hili, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1716887021', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Sanaya More', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-02-20 07:53:00', 45, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000047, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md. Mahi', '', 'Md. Mahi', 'Md. Mahi', 'M', NULL, 'Accepted', '2025-11-09', NULL, 'Check Post Road, Bangla-Hili, Hakimpur, Dinajpur,', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1935237177', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md. Mahi', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-02-20 05:12:00', 46, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000048, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md. Shahidul Islam Shahid', '', 'Md. Shahidul Islam Shahid', 'Md. Shahidul Islam S', 'M', NULL, 'Accepted', '2027-06-08', NULL, 'Uttar Gopalpur, Bagzana, Panchbibi, Joypurhat', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1953773874', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md. Shahidul Islam Shahid', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-02-20 05:15:00', 47, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000049, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md. mahmuj Hossain Lemon ', '', 'Md. mahmuj Hossain Lemon ', 'Md. mahmuj Hossain L', 'M', NULL, 'Accepted', '2025-04-07', NULL, 'Nowapara, Bowaldar, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1753488653', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md. mahmuj Hossain Lemon ', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015-02-20 03:31:00', 48, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000050, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Mst. Ulmin Nuzaita Subah  ', '', 'Mst. Ulmin Nuzaita Subah  ', 'Mst. Ulmin Nuzaita S', 'F', NULL, 'Accepted', '2018-01-08', NULL, 'Badehorina, Putimara, Nobabgonj, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1717570311', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Mst. Ulmin Nuzaita Subah  ', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-02-20 05:22:00', 49, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000051, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md. Sadiq Hossain Rafi', '', 'Md. Sadiq Hossain Rafi', 'Md. Sadiq Hossain Ra', 'M', NULL, 'Accepted', '2001-12-07', NULL, 'Dhoronda, Bangla-Hili, Hakimpur, dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '170046660', 'Other', '', '880000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md. Sadiq Hossain Rafi', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-02-20 05:25:00', 50, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000052, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Mst. Mayeesha Afrose', '', 'Mst. Mayeesha Afrose', 'Mst. Mayeesha Afrose', 'F', NULL, 'Accepted', '2012-11-07', NULL, 'Chintamon, Madila Hat, Fulbari, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1731031144', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Mst. Mayeesha Afrose', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-02-20 05:29:00', 51, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000053, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Mst. Sumaiya Akter', '', 'Mst. Sumaiya Akter', 'Mst. Sumaiya Akter', 'F', NULL, 'Accepted', '2005-12-16', NULL, 'DhoronDa, Bangla-Hili, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1712470312', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Mst. Sumaiya Akter', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-02-20 05:33:00', 52, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000054, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Mst Fahmida Akter Oishi', '', 'Mst Fahmida Akter Oishi', 'Mst Fahmida Akter Oi', 'F', NULL, 'Accepted', '2014-10-06', NULL, 'Satni, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1729408324', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Mst Fahmida Akter Oishi', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-02-20 05:38:00', 53, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000055, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Mst. Zerin Sultana ', '', 'Mst. Zerin Sultana ', 'Mst. Zerin Sultana ', 'F', NULL, 'Accepted', '2011-06-07', NULL, 'Chondipur, Bangla-hili, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1911184910', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Mst. Zerin Sultana ', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-02-20 05:41:00', 54, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000056, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md. Al Shahriar Shuvro', '', 'Md. Al Shahriar Shuvro', 'Md. Al Shahriar Shuv', 'M', NULL, 'Accepted', '2004-02-08', NULL, 'Palpara, Bangla-Hili, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1719205559', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md. Al Shahriar Shuvro', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-02-20 05:44:00', 55, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000057, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md. Rishad Chowdhury', '', 'Md. Rishad Chowdhury', 'Md. Rishad Chowdhury', 'M', NULL, 'Accepted', '2029-01-08', NULL, 'Dhoronda, Bangla-Hili, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1717890131', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md. Rishad Chowdhury', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-02-20 05:47:00', 56, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000058, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Mst. Risha Akter Mim ', '', 'Mst. Risha Akter Mim ', 'Mst. Risha Akter Mim', 'M', NULL, 'Accepted', '2021-04-07', NULL, 'Vimpur, Bagzana, Panchbibi, Joypurhat', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1784884877', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Mst. Risha Akter Mim ', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-02-20 05:49:00', 57, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000059, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md. Mazedul Islam ', '', 'Md. Mazedul Islam ', 'Md. Mazedul Islam ', 'M', NULL, 'Accepted', '2020-01-06', NULL, 'Monirampur, Dhelupara, Birampur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1738343088', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md. Mazedul Islam ', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-02-20 08:11:00', 58, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000060, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md. Nafiz Iqbal', '', 'Md. Nafiz Iqbal', 'Md. Nafiz Iqbal', 'M', NULL, 'Accepted', '2013-04-07', NULL, 'Chondipur, Bangla-Hili, Hakimpur , Dinajpur ', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1722413409', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md. Nafiz Iqbal', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-02-20 08:13:00', 59, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000061, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Mst. Afrina Aktar Dola', '', 'Mst. Afrina Aktar Dola', 'Mst. Afrina Aktar Do', 'F', NULL, 'Accepted', '2005-08-08', NULL, 'Muhara Para, Bangla-Hili, Hakimpur, Dinajpur ', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1717167282', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Mst. Afrina Aktar Dola', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-02-20 08:17:00', 60, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000062, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Mst. Nishat Tasrin ', '', 'Mst. Nishat Tasrin ', 'Mst. Nishat Tasrin ', 'F', NULL, 'Accepted', '2004-03-08', NULL, 'Ramvodropur, Bagzana, Panchbibi, Joypurhat', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1983823632', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Mst. Nishat Tasrin ', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-02-20 08:20:00', 61, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000063, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Mst. Sangita Akter Dina ', '', 'Mst. Sangita Akter Dina ', 'Mst. Sangita Akter D', 'F', NULL, 'Accepted', '2030-12-08', NULL, 'Horiharpur, Monshapur, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1714495259', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Mst. Sangita Akter Dina ', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-02-20 08:24:00', 62, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000064, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Mst. Ononnya', '', 'Mst. Ononnya', 'Mst. Ononnya', 'F', NULL, 'Accepted', '2028-10-09', NULL, 'Ramvodropur, Bagzana, Panchbibi, Joypurhat', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1920611851', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Mst. Ononnya', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-02-20 08:30:00', 63, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000065, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md. Islamul Hoque', '', 'Md. Islamul Hoque', 'Md. Islamul Hoque', 'M', NULL, 'Accepted', '2001-09-06', NULL, 'Dangapara,  Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1712639221', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md. Islamul Hoque', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-02-20 08:49:00', 64, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000066, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md. Asadullah Al Galib', '', 'Md. Asadullah Al Galib', 'Md. Asadullah Al Gal', 'M', NULL, 'Accepted', '2012-09-06', NULL, 'Sonapur, Panchbibi, Joypurhat', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1718881033', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md. Asadullah Al Galib', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-02-20 08:54:00', 65, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000067, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Mst. Humayra Akter Himu', '', 'Mst. Humayra Akter Himu', 'Mst. Humayra Akter H', 'F', NULL, 'Accepted', '2009-08-06', NULL, 'Moddho basudebpur, Bnagla-Hili, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1992373108', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Mst. Humayra Akter Himu', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-02-20 08:58:00', 66, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000068, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md. Rafiul Hossain Ratul', '', 'Md. Rafiul Hossain Ratul', 'Md. Rafiul Hossain R', 'M', NULL, 'Accepted', '2027-08-09', NULL, 'Dakshin Basudebpur, Bangla-Hili, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1774248908', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md. Rafiul Hossain Ratul', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-02-20 09:02:00', 67, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000069, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Mst. Shimla', '', 'Mst. Shimla', 'Mst. Shimla', 'F', NULL, 'Accepted', '2028-10-06', NULL, 'Dakshin Basudebpur, Bangla-Hili, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1761453942', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Mst. Shimla', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-02-20 09:06:00', 68, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000070, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Mst. Maria Akter Sanju', '', 'Mst. Maria Akter Sanju', 'Mst. Maria Akter San', 'F', NULL, 'Accepted', '2001-08-08', NULL, 'Moddho Basudebpur, Bangla-Hili, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1713787351', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Mst. Maria Akter Sanju', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-02-20 09:14:00', 69, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000071, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Mst. Ebnat Tanisha Arna', '', 'Mst. Ebnat Tanisha Arna', 'Mst. Ebnat Tanisha A', 'F', NULL, 'Accepted', '2020-08-08', NULL, 'Moddho Basudebpur, Bangla-Hili, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1960170280', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Mst. Ebnat Tanisha Arna', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-02-20 09:17:00', 70, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000072, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md. Rifat Hasan Shuvo', '', 'Md. Rifat Hasan Shuvo', 'Md. Rifat Hasan Shuv', 'M', NULL, 'Accepted', '2023-03-09', NULL, 'monirampur, Dhelupara, Birampur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1753041978', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md. Rifat Hasan Shuvo', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-02-20 09:22:00', 71, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000073, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md. Zerin Tasnim Lubna', '', 'Md. Zerin Tasnim Lubna', 'Md. Zerin Tasnim Lub', 'F', NULL, 'Accepted', '2024-12-06', NULL, 'Uttor Bashudebpur, Bangla-Hili, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1716015992', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md. Zerin Tasnim Lubna', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-02-20 09:29:00', 72, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000074, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Ariful Islam Sweet', '', 'Ariful Islam Sweet', 'Ariful Islam Sweet', 'M', NULL, 'Accepted', '2015-09-07', NULL, 'Dakshin Basudebpur, Bangla-Hili, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1734174077', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Ariful Islam Sweet', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-02-20 09:33:00', 73, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000075, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md. Zahin Morshed Labib', '', 'Md. Zahin Morshed Labib', 'Md. Zahin Morshed La', 'M', NULL, 'Accepted', '2021-06-08', NULL, 'Mangni para, Bel Amla, Joypurhat', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1871289786', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md. Zahin Morshed Labib', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-02-20 09:38:00', 74, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000076, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Mst. Tamima Toma Sajuti', '', 'Mst. Tamima Toma Sajuti', 'Mst. Tamima Toma Saj', 'F', NULL, 'Accepted', '2015-01-08', NULL, 'Jogodishpur, Majhina, Panchbibi, Joypurhat', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1734416279', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Mst. Tamima Toma Sajuti', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-02-20 09:42:00', 75, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000077, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md. Shoaib Ali Rahul', '', 'Md. Shoaib Ali Rahul', 'Md. Shoaib Ali Rahul', 'M', NULL, 'Accepted', '2008-07-05', NULL, 'MOddho Basudebpur, Bangla-Hili, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1922831637', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md. Shoaib Ali Rahul', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-02-20 09:47:00', 76, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000078, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Mst. Anika Zahin Ananya', '', 'Mst. Anika Zahin Ananya', 'Mst. Anika Zahin Ana', 'F', NULL, 'Accepted', '2021-09-08', NULL, 'Uttar Basudebpur, Bangla-Hili, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1712038014', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Mst. Anika Zahin Ananya', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-02-20 09:50:00', 77, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000079, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md. Parvez Rahman', '', 'Md. Parvez Rahman', 'Md. Parvez Rahman', 'M', NULL, 'Accepted', '2016-07-07', NULL, 'Kakra, Khatta Usna, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1710719734', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md. Parvez Rahman', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-02-20 09:55:00', 78, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000080, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md. Durjoy', '', 'Md. Durjoy', 'Md. Durjoy', 'M', NULL, 'Accepted', '2023-09-05', NULL, 'Moddho Basudebpur, Bangla-Hili, hakimpur, Dinajpur ', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1714691020', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md. Durjoy', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-02-20 09:58:00', 79, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000081, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md. Mahfuz Ahmed Shimul ', '', 'Md. Mahfuz Ahmed Shimul ', 'Md. Mahfuz Ahmed Shi', 'M', NULL, 'Accepted', '2027-05-07', NULL, 'Tubby, Jangoi, Hakimpur, Dinajpur ', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1717216839', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md. Mahfuz Ahmed Shimul ', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-02-20 10:02:00', 80, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000082, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md. Tanvir Ahnaf', '', 'Md. Tanvir Ahnaf', 'Md. Tanvir Ahnaf', 'M', NULL, 'Accepted', '2029-12-07', NULL, 'Rangamatiya, Satni, HAkimpur, Dinajpur ', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1777545215', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md. Tanvir Ahnaf', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-02-20 10:06:00', 81, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000083, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Mst. Afrin Akter Aurin ', '', 'Mst. Afrin Akter Aurin ', 'Mst. Afrin Akter Aur', 'F', NULL, 'Accepted', '2009-06-07', NULL, 'Ramvadrapur, Bagzana, Joypurhat', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1915633488', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Mst. Afrin Akter Aurin ', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-02-20 10:08:00', 82, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000084, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md. Abdur Rafi', '', 'Md. Abdur Rafi', 'Md. Abdur Rafi', 'M', NULL, 'Accepted', '2026-05-07', NULL, 'Nowpara, Bowaldar, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1993173714', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md. Abdur Rafi', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-02-20 10:14:00', 83, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000085, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md. Shojib Shahriar Nafiz', '', 'Md. Shojib Shahriar Nafiz', 'Md. Shojib Shahriar ', 'M', NULL, 'Accepted', '2031-10-08', NULL, 'Mathpara, Bangla-hili, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1787989998', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md. Shojib Shahriar Nafiz', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-02-20 10:18:00', 84, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000086, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md. Ahsan Habib Riyad ', '', 'Md. Ahsan Habib Riyad ', 'Md. Ahsan Habib Riya', 'M', NULL, 'Accepted', '2020-07-07', NULL, 'Dakshin Basudebpur, Bangla-Hili, HAkimpur , Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1719666853', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md. Ahsan Habib Riyad ', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-02-20 10:20:00', 85, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000087, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Mst. Moumita Akter Mou ', '', 'Mst. Moumita Akter Mou ', 'Mst. Moumita Akter M', 'F', NULL, 'Accepted', '2020-11-06', NULL, 'Chandipur, Bangla-Hili, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1912842684', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Mst. Moumita Akter Mou ', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-02-20 10:23:00', 86, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000088, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Mst. Touhida Mehzabin ', '', 'Mst. Touhida Mehzabin ', 'Mst. Touhida Mehzabi', 'F', NULL, 'Accepted', '2020-12-06', NULL, 'Shingrapara, Satni, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1784942626', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Mst. Touhida Mehzabin ', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-02-20 10:25:00', 87, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000089, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md. Tanvir Rasul Shihab', '', 'Md. Tanvir Rasul Shihab', 'Md. Tanvir Rasul Shi', 'M', NULL, 'Accepted', '2026-10-05', NULL, 'PalPara, Bangla-Hili, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1712165224', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md. Tanvir Rasul Shihab', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-02-20 10:28:00', 88, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000090, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Mst. Adiba Afrin ', '', 'Mst. Adiba Afrin ', 'Mst. Adiba Afrin ', 'F', NULL, 'Accepted', '2007-08-09', NULL, 'Purbo Ram Vodro Pur, Bagzana, Panchbibi, Joypurhat', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1715804875', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Mst. Adiba Afrin ', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-02-20 10:32:00', 89, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000091, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md. Masum Billah', '', 'Md. Masum Billah', 'Md. Masum Billah', 'M', NULL, 'Accepted', '2001-01-08', NULL, 'Hore krishtopur, Dangapara, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1744923241', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md. Masum Billah', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-02-20 10:35:00', 90, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000092, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Mst.Fabiha Bushra', '', 'Mst.Fabiha Bushra', 'Mst.Fabiha Bushra', 'F', NULL, 'Accepted', '2014-11-07', NULL, 'Debkhonda, Dangapara, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1718637497', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Mst.Fabiha Bushra', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-02-20 10:37:00', 91, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000093, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Mst. Sanjida Anjum Badhon', '', 'Mst. Sanjida Anjum Badhon', 'Mst. Sanjida Anjum B', 'F', NULL, 'Accepted', '2019-11-07', NULL, 'Mohorapara, Bangla-Hili, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1716456355', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Mst. Sanjida Anjum Badhon', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-02-20 10:39:00', 92, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000094, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md.Mahadi Hasan ', '', 'Md.Mahadi Hasan ', 'Md.Mahadi Hasan ', 'M', NULL, 'Accepted', '2029-05-06', NULL, 'Uttar Basudebpur, Bangla-Hili, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1959214744', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md.Mahadi Hasan ', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2008-02-20 07:12:00', 93, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000095, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md. Rahat Hasan Sadiq ', '', 'Md. Rahat Hasan Sadiq ', 'Md. Rahat Hasan Sadi', 'M', NULL, 'Accepted', '2014-05-09', NULL, 'Charmatha mor, Bangla-Hili, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1730180482', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md. Rahat Hasan Sadiq ', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2008-02-20 07:14:00', 94, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000096, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md.Mohammad Mushfiqur Rahman', '', 'Md.Mohammad Mushfiqur Rahman', 'Md.Mohammad Mushfiqu', 'M', NULL, 'Accepted', '2015-02-09', NULL, 'Dhoronda, Ward-02, Bangla-Hili, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1713202288', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md.Mohammad Mushfiqur Rahman', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2008-02-20 08:23:00', 95, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000097, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md. Rakibul Hasan', '', 'Md. Rakibul Hasan', 'Md. Rakibul Hasan', 'M', NULL, 'Accepted', '2006-03-08', NULL, 'Sreemontopur, Dharanji, Panchbibi, Joypurhat', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1930441847', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md. Rakibul Hasan', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2008-02-20 08:28:00', 96, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000098, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md. Nafis Fuad', '', 'Md. Nafis Fuad', 'Md. Nafis Fuad', 'M', NULL, 'Accepted', '2020-12-09', NULL, 'Moddho Basudebpur , Bangla-Hili, Hakimpur , Dinajpur ', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1714941284', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md. Nafis Fuad', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2008-02-20 08:33:00', 97, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000099, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md. Mehedi Hasan Poddo', '', 'Md. Mehedi Hasan Poddo', 'Md. Mehedi Hasan Pod', 'M', NULL, 'Accepted', '2008-09-08', NULL, 'Moddho Basudebpur,Bangla-Hili, Hakimpur, Dinajpur ', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1734560251', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md. Mehedi Hasan Poddo', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2008-02-20 09:04:00', 98, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000100, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md.Al Amin Zowardar ', '', 'Md.Al Amin Zowardar ', 'Md.Al Amin Zowardar ', 'M', NULL, 'Accepted', '2019-07-07', NULL, 'Moddho Basudebpur, Bangla Hili, hakimpur , Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1712015177', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md.Al Amin Zowardar ', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2008-02-20 09:16:00', 99, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000101, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md.Ebabot Ali Ankon', '', 'Md.Ebabot Ali Ankon', 'Md.Ebabot Ali Ankon', 'M', NULL, 'Accepted', '2004-08-07', NULL, 'Dharanda,  Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1706589776', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md.Ebabot Ali Ankon', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2008-02-20 09:21:00', 100, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000102, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md.Abida Islam Fima ', '', 'Md.Abida Islam Fima ', 'Md.Abida Islam Fima ', 'F', NULL, 'Accepted', '2007-03-09', NULL, 'Moddho Basudebpur, Bangla-Hili,Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1716486191', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md.Abida Islam Fima ', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2008-02-20 09:30:00', 101, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000103, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Mst. Nuraiya Akter Jhumu', '', 'Mst. Nuraiya Akter Jhumu', 'Mst. Nuraiya Akter J', 'F', NULL, 'Accepted', '2028-02-10', NULL, 'Kutahara, Bagzana, Panchbibi, Joypurhat', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1796793855', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Mst. Nuraiya Akter Jhumu', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2008-02-20 09:34:00', 102, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000104, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md. Ovinobo Mani', '', 'Md. Ovinobo Mani', 'Md. Ovinobo Mani', 'M', NULL, 'Accepted', '2003-05-10', NULL, 'Uttar Basudebpur, Bangla-HIli, Hakimpurm, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1719241879', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md. Ovinobo Mani', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2008-02-20 09:37:00', 103, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000105, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Mst. Nafisa Tabassum ', '', 'Mst. Nafisa Tabassum ', 'Mst. Nafisa Tabassum', 'F', NULL, 'Accepted', '2003-02-09', NULL, 'Moddho Basudebpur, Bangla-Hili, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1712144292', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Mst. Nafisa Tabassum ', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2008-02-20 09:40:00', 104, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000106, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Mst. Saiadatun Nisa Mayisha ', '', 'Mst. Saiadatun Nisa Mayisha ', 'Mst. Saiadatun Nisa ', 'F', NULL, 'Accepted', '2014-08-19', NULL, 'Mohorapara, Bangla-Hili, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1717799739', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Mst. Saiadatun Nisa Mayisha ', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2009-02-20 10:15:00', 105, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000107, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Mst. Shabdika Waziha ', '', 'Mst. Shabdika Waziha ', 'Mst. Shabdika Waziha', 'F', NULL, 'Accepted', '2031-07-10', NULL, 'Moddho Basudebpur, Bangla-Hili, Hakimpur, Dinajpur ', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1718484126', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Mst. Shabdika Waziha ', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2008-02-20 09:48:00', 106, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000108, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md. Shoham', '', 'Md. Shoham', 'Md. Shoham', 'M', NULL, 'Accepted', '2020-12-09', NULL, 'MohoraPara, Bangla-Hili, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1928609306', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md. Shoham', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2008-02-20 09:50:00', 107, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000109, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md. Fahim Al Rafi ', '', 'Md. Fahim Al Rafi ', 'Md. Fahim Al Rafi ', 'M', NULL, 'Accepted', '2017-08-09', NULL, 'Moddho Basudebpur, bangla-hili, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1712083785', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md. Fahim Al Rafi ', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2008-02-20 09:52:00', 108, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000110, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Mst. Shumona Rayhan Lopa ', '', 'Mst. Shumona Rayhan Lopa ', 'Mst. Shumona Rayhan ', 'F', NULL, 'Accepted', '2014-10-07', NULL, 'Moddho Basudebpur, Bangla-Hili, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1724225511', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Mst. Shumona Rayhan Lopa ', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2008-02-20 09:54:00', 109, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000111, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Mst. Sabiha Islam Saba', '', 'Mst. Sabiha Islam Saba', 'Mst. Sabiha Islam Sa', 'F', NULL, 'Accepted', '2020-05-10', NULL, 'Moddho Basudebpur, Bangla-Hili, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1789305624', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Mst. Sabiha Islam Saba', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2008-02-20 09:56:00', 110, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000112, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md. Siyam Hasan ', '', 'Md. Siyam Hasan ', 'Md. Siyam Hasan ', 'M', NULL, 'Accepted', '2025-10-07', NULL, 'Moddho Basudebpur, Bangla-Hili, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1647223444', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md. Siyam Hasan ', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2008-02-20 10:00:00', 111, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000113, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md. Mukim Sarker Mahi', '', 'Md. Mukim Sarker Mahi', 'Md. Mukim Sarker Mah', 'M', NULL, 'Accepted', '2012-10-10', NULL, 'Dhoronda, Bangla-HILI, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1719454475', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md. Mukim Sarker Mahi', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2008-02-20 10:04:00', 112, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000114, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md. Nafiz Islam Showrov ', '', 'Md. Nafiz Islam Showrov ', 'Md. Nafiz Islam Show', 'M', NULL, 'Accepted', '2022-11-07', NULL, 'Moddho Basudebpur, Bangla-HILI, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1774801037', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md. Nafiz Islam Showrov ', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2008-02-20 10:07:00', 113, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000115, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md. Rahimujjaman Riyad', '', 'Md. Rahimujjaman Riyad', 'Md. Rahimujjaman Riy', 'M', NULL, 'Accepted', '2025-09-08', NULL, 'Shonapur, Panchbibi, Joypurhat', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1715786947', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md. Rahimujjaman Riyad', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015-02-20 04:23:00', 114, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000116, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Mst. Yeasmin Jannat Sinthia', '', 'Mst. Yeasmin Jannat Sinthia', 'Mst. Yeasmin Jannat ', 'F', NULL, 'Accepted', '2003-01-08', NULL, 'Moddho Basudebpur, Bangla-Hili, hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1712246929', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Mst. Yeasmin Jannat Sinthia', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2008-02-20 10:15:00', 115, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000117, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Mst. Fariha Farzana ', '', 'Mst. Fariha Farzana ', 'Mst. Fariha Farzana ', 'F', NULL, 'Accepted', '2029-08-09', NULL, 'Rotonpur, Panchbibi, Joypurhat', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1718934420', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Mst. Fariha Farzana ', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2008-02-20 10:19:00', 116, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000118, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md. Iqbal mahmud Oshim', '', 'Md. Iqbal mahmud Oshim', 'Md. Iqbal mahmud Osh', 'M', NULL, 'Accepted', '2022-11-09', NULL, 'Koktara, Monshapur, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1738514116', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md. Iqbal mahmud Oshim', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015-02-20 03:59:00', 117, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000119, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Mst. Sadia Afrin Shikha', '', 'Mst. Sadia Afrin Shikha', 'Mst. Sadia Afrin Shi', 'F', NULL, 'Accepted', '2024-05-09', NULL, 'Dakshin Basudebpur, Bangla-Hili, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1736553045', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Mst. Sadia Afrin Shikha', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015-02-20 03:59:00', 118, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000120, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md. Israt Jahan Zim ', '', 'Md. Israt Jahan Zim ', 'Md. Israt Jahan Zim ', 'F', NULL, 'Accepted', '2026-05-07', NULL, 'Dhelupara, Dangapara,  hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1739162719', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md. Israt Jahan Zim ', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2009-02-20 05:41:00', 119, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000121, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md. Tahmid Hasan Reza ', '', 'Md. Tahmid Hasan Reza ', 'Md. Tahmid Hasan Rez', 'M', NULL, 'Accepted', '2031-12-08', NULL, 'Ziibonpur, Shonapur, panchbibi, joypurhat ', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1718095710', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md. Tahmid Hasan Reza ', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2009-02-20 05:45:00', 120, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000122, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md. Abu Sufian ', '', 'Md. Abu Sufian ', 'Md. Abu Sufian ', 'M', NULL, 'Accepted', '2004-12-08', NULL, 'Beramaliam, Shal Khuria , Nowabgonj, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1733263019', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md. Abu Sufian ', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2009-02-20 05:47:00', 121, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000123, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md. Amir Hamza ', '', 'Md. Amir Hamza ', 'Md. Amir Hamza ', 'M', NULL, 'Accepted', '2009-10-10', NULL, 'Dakshin Basudebpur, bangla-Hili, Hakimpur, Dinajpur ', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1712101220', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md. Amir Hamza ', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2009-02-20 05:53:00', 122, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000124, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Mst. Sabrina Mera ', '', 'Mst. Sabrina Mera ', 'Mst. Sabrina Mera ', 'F', NULL, 'Accepted', '2024-05-09', NULL, 'Chechra, Bagzana, Panchbibi, Joypurhat ', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1738266597', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Mst. Sabrina Mera ', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2009-02-20 05:56:00', 123, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000125, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Mst. Nusrat Jahan Surmila', '', 'Mst. Nusrat Jahan Surmila', 'Mst. Nusrat Jahan Su', 'F', NULL, 'Accepted', '2019-12-06', NULL, 'Dakshin Basudebpur, Bangla-Hili, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1929309380', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Mst. Nusrat Jahan Surmila', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015-02-20 03:57:00', 124, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000126, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'MD. Shahadat Anjum ', '', 'MD. Shahadat Anjum ', 'MD. Shahadat Anjum ', 'M', NULL, 'Accepted', '2031-12-10', NULL, 'Poshchim Ramchandrapur, Bagzana, Panchbibi, Joypurhat', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1758010661', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'MD. Shahadat Anjum ', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2009-02-20 06:05:00', 125, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000127, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md. Asaduzzaman Alif', '', 'Md. Asaduzzaman Alif', 'Md. Asaduzzaman Alif', 'M', NULL, 'Accepted', '2021-01-07', NULL, 'Khatta Usna, HAkimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1736096627', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md. Asaduzzaman Alif', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2009-02-20 06:07:00', 126, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000128, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md. Anarul Islam ', '', 'Md. Anarul Islam ', 'Md. Anarul Islam ', 'M', NULL, 'Accepted', '2012-04-08', NULL, 'Khatta Usna, HAkimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1736096627', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md. Anarul Islam ', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2009-02-20 06:12:00', 127, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000129, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md. Shuvo Zisan', '', 'Md. Shuvo Zisan', 'Md. Shuvo Zisan', 'M', NULL, 'Accepted', '2020-03-09', NULL, 'Uttar GopalPur, Bagzana Panchbibi, joypurhat', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1938346507', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md. Shuvo Zisan', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2009-02-20 06:17:00', 128, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000130, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md. Rafid Hasan Reza', '', 'Md. Rafid Hasan Reza', 'Md. Rafid Hasan Reza', 'M', NULL, 'Accepted', '2023-10-08', NULL, 'Moddho Basudebpur, bangla-Hili, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1724035016', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md. Rafid Hasan Reza', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015-02-20 04:16:00', 129, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000131, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md. Mishrat Jahan Era', '', 'Md. Mishrat Jahan Era', 'Md. Mishrat Jahan Er', 'F', NULL, 'Accepted', '2022-05-09', NULL, 'Mongla Bazar, Dangapara, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1786953865', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md. Mishrat Jahan Era', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2009-02-20 06:24:00', 130, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000132, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Mst. Farzana Akter Asha', '', 'Mst. Farzana Akter Asha', 'Mst. Farzana Akter A', 'F', NULL, 'Accepted', '2028-11-18', NULL, 'Jangoi, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1723110766', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Mst. Farzana Akter Asha', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2009-02-20 06:31:00', 131, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000133, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Mst. Halima ', '', 'Mst. Halima ', 'Mst. Halima ', 'F', NULL, 'Accepted', '2001-01-08', NULL, 'Uttar Krishnopur, Bagzana, Panchbibi, Joypurhat ', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1732570046', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Mst. Halima ', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2009-02-20 06:34:00', 132, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000134, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md. Sadikur Rahman ', '', 'Md. Sadikur Rahman ', 'Md. Sadikur Rahman ', 'M', NULL, 'Accepted', '2005-03-07', NULL, 'Kakra, Narayonpur, Khatta Usna ,hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1737897953', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md. Sadikur Rahman ', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015-02-20 04:06:00', 133, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000135, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'MSt. Shabzida Yesmin Monalisa ', '', 'MSt. Shabzida Yesmin Monalisa ', 'MSt. Shabzida Yesmin', 'F', NULL, 'Accepted', '2010-05-09', NULL, 'Boro Bail Shira, Bijul Madrasha, Birampur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1774396516', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'MSt. Shabzida Yesmin Monalisa ', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015-02-20 04:05:00', 134, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000136, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Sri. Protik Chandra Mondol ', '', 'Sri. Protik Chandra Mondol ', 'Sri. Protik Chandra ', 'M', NULL, 'Accepted', '2009-03-09', NULL, 'Shaduria, Monoshapur, hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1747088626', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Sri. Protik Chandra Mondol ', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015-02-20 04:05:00', 135, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000137, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md. Mortuza Ali ', '', 'Md. Mortuza Ali ', 'Md. Mortuza Ali ', 'M', NULL, 'Accepted', '2004-02-08', NULL, 'Banial, Bowaldar, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1774478304', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md. Mortuza Ali ', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015-02-20 04:04:00', 136, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000138, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Mst. Karina Akter Kemi', '', 'Mst. Karina Akter Kemi', 'Mst. Karina Akter Ke', 'F', NULL, 'Accepted', '2007-08-08', NULL, 'Chechra, Atapara, Bagzana, Joypurhat', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1738559854', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Mst. Karina Akter Kemi', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015-02-20 04:03:00', 137, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000139, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md. Mahim Hossain', '', 'Md. Mahim Hossain', 'Md. Mahim Hossain', 'M', NULL, 'Accepted', '2030-01-09', NULL, 'Hathkhola, Dhoronji, Panchbibi, Joypurhat', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1782928027', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md. Mahim Hossain', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2009-02-20 06:53:00', 138, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000140, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Mst. Anika Tabassum ', '', 'Mst. Anika Tabassum ', 'Mst. Anika Tabassum ', 'F', NULL, 'Accepted', '2002-05-08', NULL, 'Ramvodropur,  Panchbibi, Joypurhat', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1917912283', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Mst. Anika Tabassum ', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015-02-20 04:01:00', 139, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000141, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md. Rohan Jowarder', '', 'Md. Rohan Jowarder', 'Md. Rohan Jowarder', 'M', NULL, 'Accepted', '2012-12-09', NULL, 'Ramvodropur,  Panchbibi, Joypurhat', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1999948310', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md. Rohan Jowarder', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2009-02-20 06:58:00', 140, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000142, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md. Shakhawat Hossain Arnob', '', 'Md. Shakhawat Hossain Arnob', 'Md. Shakhawat Hossai', 'M', NULL, 'Accepted', '2028-10-07', NULL, 'Moddho Basudebpur, Mathpara, Bangla-Hili, Hakimpur Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1921515917', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md. Shakhawat Hossain Arnob', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015-02-20 04:00:00', 141, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000143, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md. Fuad Hasan ', '', 'Md. Fuad Hasan ', 'Md. Fuad Hasan ', 'M', NULL, 'Accepted', '2016-07-14', NULL, 'Uttor Krishnopur, Atapara, Bagzana, Panchbibi, Joypurhat ', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1734355788', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md. Fuad Hasan ', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015-02-20 07:03:00', 142, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000144, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Mst. Fatiha Biswas Towa', '', 'Mst. Fatiha Biswas Towa', 'Mst. Fatiha Biswas T', 'F', NULL, 'Accepted', '2026-01-15', NULL, 'Uttar Basudebpur, Bangla-Hili, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1712111188', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Mst. Fatiha Biswas Towa', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2009-02-20 10:01:00', 143, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000145, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Mst. Afroja Akter Mim', '', 'Mst. Afroja Akter Mim', 'Mst. Afroja Akter Mi', 'F', NULL, 'Accepted', '2002-03-13', NULL, 'Satkuri, Dangapara, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1743787449', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Mst. Afroja Akter Mim', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015-02-20 07:02:00', 144, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000146, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md. Muttakin Ibne Tamim', '', 'Md. Muttakin Ibne Tamim', 'Md. Muttakin Ibne Ta', 'M', NULL, 'Accepted', '2006-09-12', NULL, 'Muharapara, Bangla-Hili, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1717799739', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md. Muttakin Ibne Tamim', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015-02-20 07:01:00', 145, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000147, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Mst. Bushra Akter Niha', '', 'Mst. Bushra Akter Niha', 'Mst. Bushra Akter Ni', 'F', NULL, 'Accepted', '2026-12-16', NULL, 'Moddho Basudebpur, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1827446127', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Mst. Bushra Akter Niha', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015-02-20 07:00:00', 146, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000148, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md. Abir Mahmud Turjo', '', 'Md. Abir Mahmud Turjo', 'Md. Abir Mahmud Turj', 'M', NULL, 'Accepted', '2004-11-13', NULL, 'Kutahara, Bagzana, Panchbibi, Joypurhat', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1709201044', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md. Abir Mahmud Turjo', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015-02-20 07:14:00', 147, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000149, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md. Al Razzak Bin Rohan ', '', 'Md. Al Razzak Bin Rohan ', 'Md. Al Razzak Bin Ro', 'M', NULL, 'Accepted', '2018-09-14', NULL, 'Uttar Basudebpur, Bangla-Hili, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1420437374', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md. Al Razzak Bin Rohan ', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015-02-20 07:13:00', 148, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000150, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Mst. Iffat Shajida Hiya', '', 'Mst. Iffat Shajida Hiya', 'Mst. Iffat Shajida H', 'F', NULL, 'Accepted', '2023-02-13', NULL, 'Moddho Basudebpur, Bangla-Hili, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1737881315', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Mst. Iffat Shajida Hiya', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015-02-20 07:13:00', 149, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000151, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Mst. Mehzabin Tazrin  Lima', '', 'Mst. Mehzabin Tazrin  Lima', 'Mst. Mehzabin Tazrin', 'F', NULL, 'Accepted', '2018-06-13', NULL, 'Moddho Basudebpur, Bangla-Hili, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1997673915', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Mst. Mehzabin Tazrin  Lima', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015-02-20 07:12:00', 150, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000152, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md. Shahriar Hossain Rahik', '', 'Md. Shahriar Hossain Rahik', 'Md. Shahriar Hossain', 'M', NULL, 'Accepted', '2028-03-12', NULL, 'Satkuri, Dangapara, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1718843564', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md. Shahriar Hossain Rahik', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015-02-20 07:11:00', 151, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000153, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md. Sifat Hosen Himu', '', 'Md. Sifat Hosen Himu', 'Md. Sifat Hosen Himu', 'M', NULL, 'Accepted', '2014-03-13', NULL, 'Moddho Basudebpur, Bangla-Hili, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1710463069', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md. Sifat Hosen Himu', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015-02-20 07:11:00', 152, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000154, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Mst. Maria Mobasshira Mim ', '', 'Mst. Maria Mobasshira Mim ', 'Mst. Maria Mobasshir', 'F', NULL, 'Accepted', '2014-03-13', NULL, 'Lathipur, jangoi, hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1719041668', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Mst. Maria Mobasshira Mim ', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015-02-20 07:10:00', 153, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000155, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Mst. Prokity Monolina Binte Shams', '', 'Mst. Prokity Monolina Binte Shams', 'Mst. Prokity Monolin', 'F', NULL, 'Accepted', '2029-05-13', NULL, 'Shingrapara, ward-08, satni, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1745123033', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Mst. Prokity Monolina Binte Shams', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015-02-20 07:09:00', 154, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000156, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md.salsabil Bushra', '', 'Md.salsabil Bushra', 'Md.salsabil Bushra', 'F', NULL, 'Accepted', '2017-08-14', NULL, 'Chondipur, Bangla-Hili, hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1712112268', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md.salsabil Bushra', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2010-02-20 04:49:00', 155, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000157, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Mst. Mantasha Akter Toha', '', 'Mst. Mantasha Akter Toha', 'Mst. Mantasha Akter ', 'F', NULL, 'Accepted', '2030-03-13', NULL, 'Dakshin Basudebpur, Bangla-Hili, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1712410393', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Mst. Mantasha Akter Toha', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2010-02-20 05:02:00', 156, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000158, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md.Iftekhar Arafat Mishuk', '', 'Md.Iftekhar Arafat Mishuk', 'Md.Iftekhar Arafat M', 'M', NULL, 'Accepted', '2029-04-13', NULL, 'Moddho Basudebpur, Bangla-Hili, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1950777088', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md.Iftekhar Arafat Mishuk', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2010-02-20 05:06:00', 157, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000159, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md.Faisal Hossen Fahim ', '', 'Md.Faisal Hossen Fahim ', 'Md.Faisal Hossen Fah', 'M', NULL, 'Accepted', '2001-05-12', NULL, 'Dakshin Basudebpur, Bangla-Hili, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1786923427', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md.Faisal Hossen Fahim ', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2010-02-20 05:14:00', 158, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000160, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md. Al Mohimin Mahi', '', 'Md. Al Mohimin Mahi', 'Md. Al Mohimin Mahi', 'M', NULL, 'Accepted', '2031-12-13', NULL, 'Shundor, ward-04, 2 No Parul Union , Pirgasa, Rangpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1712668790', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md. Al Mohimin Mahi', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2010-02-20 05:19:00', 159, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000161, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Mst. Marjona Jannat Titly ', '', 'Mst. Marjona Jannat Titly ', 'Mst. Marjona Jannat ', 'F', NULL, 'Accepted', '2023-11-12', NULL, 'Uttar Basudebpur, Bangla-Hili, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1816521273', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Mst. Marjona Jannat Titly ', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015-02-20 07:08:00', 160, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000162, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md.Taihan Jarir Tahsan', '', 'Md.Taihan Jarir Tahsan', 'Md.Taihan Jarir Tahs', 'M', NULL, 'Accepted', '2005-08-13', NULL, 'Rajdhani Mor, bangla-Hili, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1808289142', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md.Taihan Jarir Tahsan', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015-02-20 07:07:00', 161, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000163, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Mst.Fariha Khondokar ', '', 'Mst.Fariha Khondokar ', 'Mst.Fariha Khondokar', 'F', NULL, 'Accepted', '2015-11-13', NULL, 'Dakshin Basudebpur, Bangla-Hili, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1999266052', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Mst.Fariha Khondokar ', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015-02-20 07:05:00', 162, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000164, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md. Sadika Afrin ', '', 'Md. Sadika Afrin ', 'Md. Sadika Afrin ', 'F', NULL, 'Accepted', '2001-08-14', NULL, 'Moddho Basudebpur, Bangla-Hill, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1789305626', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md. Sadika Afrin ', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015-02-20 06:49:00', 163, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000165, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md. Muhit', '', 'Md. Muhit', 'Md. Muhit', 'M', NULL, 'Accepted', '2020-03-14', NULL, 'CP Road, Bangla-Hili, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1718329541', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md. Muhit', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015-02-20 06:48:00', 164, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000166, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Afra Muntaha Roza', '', 'Afra Muntaha Roza', 'Afra Muntaha Roza', 'F', NULL, 'Accepted', '2018-11-13', NULL, 'Poshchim Kutahara, Bagzana, Panchbibi, joypurhat ', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1716385575', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Afra Muntaha Roza', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015-02-20 06:48:00', 165, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000167, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Mst. Abida Korim Nubha', '', 'Mst. Abida Korim Nubha', 'Mst. Abida Korim Nub', 'F', NULL, 'Accepted', '2022-09-12', NULL, 'Bangla-Hili, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1712189796', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Mst. Abida Korim Nubha', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015-02-20 06:47:00', 166, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000168, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md. Mazharul Islam', '', 'Md. Mazharul Islam', 'Md. Mazharul Islam', 'M', NULL, 'Accepted', '2026-07-12', NULL, 'Nondipur, Dangapara, hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1708577267', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md. Mazharul Islam', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015-02-20 06:46:00', 167, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000169, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md. Ifaz Hossain Shishir ', '', 'Md. Ifaz Hossain Shishir ', 'Md. Ifaz Hossain Shi', 'M', NULL, 'Accepted', '2021-08-12', NULL, 'Bagmara, Dangapara, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1725234723', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md. Ifaz Hossain Shishir ', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015-02-20 06:45:00', 168, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000170, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md. Ismail Mollik', '', 'Md. Ismail Mollik', 'Md. Ismail Mollik', 'M', NULL, 'Accepted', '2007-07-11', NULL, 'HatiShow, Khatta Usna, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1314171716', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md. Ismail Mollik', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015-02-20 06:44:00', 169, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000171, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md. Arif Shahriar Ayon', '', 'Md. Arif Shahriar Ayon', 'Md. Arif Shahriar Ay', 'M', NULL, 'Accepted', '2025-05-14', NULL, 'Mohorapara, Bangla-Hili, Hakimpur, Dinanjpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1794812869', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md. Arif Shahriar Ayon', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015-02-20 06:42:00', 170, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000172, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md. mafi Hossain', '', 'Md. mafi Hossain', 'Md. mafi Hossain', 'M', NULL, 'Accepted', '2008-05-14', NULL, 'Uttar Basudebpur, Bangla-Hili, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1710202902', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md. mafi Hossain', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015-02-20 06:41:00', 171, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000173, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md. Shoroar Shafayet Riyan', '', 'Md. Shoroar Shafayet Riyan', 'Md. Shoroar Shafayet', 'M', NULL, 'Accepted', '2027-04-13', NULL, 'Boaldar, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1732012838', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md. Shoroar Shafayet Riyan', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2010-02-20 09:20:00', 172, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000174, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md. Shah Sultan Shehab ', '', 'Md. Shah Sultan Shehab ', 'Md. Shah Sultan Sheh', 'M', NULL, 'Accepted', '2020-09-11', NULL, 'Nowdapara, Dangapara, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1719204669', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md. Shah Sultan Shehab ', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015-02-20 06:39:00', 173, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000175, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Mst. Nazifa Binte Zaman', '', 'Mst. Nazifa Binte Zaman', 'Mst. Nazifa Binte Za', 'F', NULL, 'Accepted', '2001-11-13', NULL, 'Birampur, T&T Road , Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1711379127', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Mst. Nazifa Binte Zaman', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015-02-20 06:33:00', 174, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000176, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md. Mujahid Islam Muhif', '', 'Md. Mujahid Islam Muhif', 'Md. Mujahid Islam Mu', 'M', NULL, 'Accepted', '2023-10-05', NULL, 'Boro Jalalpur, Chatni, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1729188226', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md. Mujahid Islam Muhif', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011-02-20 04:31:00', 175, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000177, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md. Yasin Arafat', '', 'Md. Yasin Arafat', 'Md. Yasin Arafat', 'M', NULL, 'Accepted', '2018-12-06', NULL, 'Khatta Usna, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1712076170', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md. Yasin Arafat', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2014-02-20 12:56:00', 176, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000178, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Mst.  Sadia Afrin Sormi', '', 'Mst.  Sadia Afrin Sormi', 'Mst.  Sadia Afrin So', 'F', NULL, 'Accepted', '2004-02-06', NULL, 'Islam pur, Birampur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1716057968', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Mst.  Sadia Afrin Sormi', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2014-02-20 13:16:00', 177, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000179, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md. Al Shafin Shahriar', '', 'Md. Al Shafin Shahriar', 'Md. Al Shafin Shahri', 'M', NULL, 'Accepted', '2003-09-06', NULL, 'Birampur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1755305664', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md. Al Shafin Shahriar', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2014-02-20 13:14:00', 178, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000180, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Mst. Nowrin Jahan ', '', 'Mst. Nowrin Jahan ', 'Mst. Nowrin Jahan ', 'M', NULL, 'Accepted', '2025-11-06', NULL, 'Ghorapara, Bagzana, Panchbibi, Joypurhat', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1714596591', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Mst. Nowrin Jahan ', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2014-02-20 13:14:00', 179, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000181, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Mst.Sraboni Akter Kona', '', 'Mst.Sraboni Akter Kona', 'Mst.Sraboni Akter Ko', 'F', NULL, 'Accepted', '2009-12-06', NULL, 'Modhho basudebpur, Bangla-hili, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1981112812', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Mst.Sraboni Akter Kona', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2014-02-20 13:13:00', 180, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000182, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md. Wasik Al Raji', '', 'Md. Wasik Al Raji', 'Md. Wasik Al Raji', 'M', NULL, 'Accepted', '2009-04-05', NULL, 'Chandipur, Bangla-Hili, hakimpur , Dinajpur ', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1711068592', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md. Wasik Al Raji', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011-02-20 05:21:00', 181, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000183, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md. mahfuzur Rahman Rifat', '', 'Md. mahfuzur Rahman Rifat', 'Md. mahfuzur Rahman ', 'M', NULL, 'Accepted', '2005-10-05', NULL, 'Rawtara, Satni, hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1725734820', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md. mahfuzur Rahman Rifat', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2014-02-20 13:08:00', 182, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000184, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md. Junaid Hossain ', '', 'Md. Junaid Hossain ', 'Md. Junaid Hossain ', 'M', NULL, 'Accepted', '2010-12-03', NULL, 'Moddho Basudebpur, bangla-Hili, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1748165180', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md. Junaid Hossain ', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2014-02-20 13:06:00', 183, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000185, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Mst. Parvin Afroj Parsha', '', 'Mst. Parvin Afroj Parsha', 'Mst. Parvin Afroj Pa', 'F', NULL, 'Accepted', '2019-12-04', NULL, 'Uttar Basudebpur, Bangla-hili, hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1749707227', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Mst. Parvin Afroj Parsha', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011-02-20 05:36:00', 184, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000186, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md. Sifat Jahan ', '', 'Md. Sifat Jahan ', 'Md. Sifat Jahan ', 'M', NULL, 'Accepted', '2005-10-06', NULL, 'Paik Para, Bowaldar, hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1728638146', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md. Sifat Jahan ', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011-02-20 05:39:00', 185, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000187, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md. Mostakim Mondol', '', 'Md. Mostakim Mondol', 'Md. Mostakim Mondol', 'M', NULL, 'Accepted', '2029-04-04', NULL, 'Moddho basudebpur, bangla-Hili, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1756637321', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md. Mostakim Mondol', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015-02-20 06:38:00', 186, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000188, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Mohammad Ali Naim Shah', '', 'Mohammad Ali Naim Shah', 'Mohammad Ali Naim Sh', 'M', NULL, 'Accepted', '2029-12-06', NULL, 'Moddho Bari, Porsha, nowgaon', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1719420164', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Mohammad Ali Naim Shah', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011-02-20 05:53:00', 187, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000189, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md. Shakil ALi ', '', 'Md. Shakil ALi ', 'Md. Shakil ALi ', 'M', NULL, 'Accepted', '2005-07-03', NULL, 'Moddho basudebpur, bangla-Hili, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1777492422', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md. Shakil ALi ', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011-02-20 05:55:00', 188, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000190, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Mst. Ashrafia Tahsin Nowrin', '', 'Mst. Ashrafia Tahsin Nowrin', 'Mst. Ashrafia Tahsin', 'F', NULL, 'Accepted', '2004-03-07', NULL, 'Dugdugir HAt , Ghoraghat, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1717119832', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Mst. Ashrafia Tahsin Nowrin', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011-02-20 05:58:00', 189, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000191, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Mst. Mehnaj Jahin Nuha', '', 'Mst. Mehnaj Jahin Nuha', 'Mst. Mehnaj Jahin Nu', 'F', NULL, 'Accepted', '2031-12-05', NULL, 'Nowpara, Bowaldar, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1710719765', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Mst. Mehnaj Jahin Nuha', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011-02-20 06:02:00', 190, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000192, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Mst. Moumita', '', 'Mst. Moumita', 'Mst. Moumita', 'F', NULL, 'Accepted', '2011-06-06', NULL, 'Dhornda, Bangla-hili, hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1717817434', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Mst. Moumita', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011-02-20 06:09:00', 191, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000193, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Nusrat Jahan Jemi', '', 'Nusrat Jahan Jemi', 'Nusrat Jahan Jemi', 'F', NULL, 'Accepted', '2028-04-05', NULL, 'Dhelupara, Dangapara, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1739162719', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Nusrat Jahan Jemi', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011-02-20 06:17:00', 192, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000194, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md. Shajib Hossain', '', 'Md. Shajib Hossain', 'Md. Shajib Hossain', 'M', NULL, 'Accepted', '2011-06-06', NULL, 'Moddho Basudebpur, Bangla-Hili, hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1907300616', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md. Shajib Hossain', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011-02-20 06:20:00', 193, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000195, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md. Amir Hamza ', '', 'Md. Amir Hamza ', 'Md. Amir Hamza ', 'M', NULL, 'Accepted', '2017-10-03', NULL, 'Utaar Basudebpur, Bangla-Hili, hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1718409160', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md. Amir Hamza ', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011-02-20 06:21:00', 194, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000196, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md. Rakib Hossain', '', 'Md. Rakib Hossain', 'Md. Rakib Hossain', 'M', NULL, 'Accepted', '2002-02-06', NULL, 'Uttar Basudebpur, bangla-hili, hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1991291078', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md. Rakib Hossain', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011-02-20 06:24:00', 195, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000197, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md. Iqbal Hossain', '', 'Md. Iqbal Hossain', 'Md. Iqbal Hossain', 'M', NULL, 'Accepted', '2014-03-05', NULL, 'Uttar Basudebpur, bangla-hili, hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1962889679', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md. Iqbal Hossain', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011-02-20 06:26:00', 196, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000198, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md. mohatasim Hossain Shojib', '', 'Md. mohatasim Hossain Shojib', 'Md. mohatasim Hossai', 'M', NULL, 'Accepted', '2029-01-05', NULL, 'Hossain Pur, birampur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1718710879', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md. mohatasim Hossain Shojib', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011-02-20 06:33:00', 197, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000199, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Mst. Taslima Akter Laboni', '', 'Mst. Taslima Akter Laboni', 'Mst. Taslima Akter L', 'F', NULL, 'Accepted', '2017-09-05', NULL, 'Jangoi, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1750982603', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Mst. Taslima Akter Laboni', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011-02-20 06:35:00', 198, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000200, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md. Erfanur Talukdar', '', 'Md. Erfanur Talukdar', 'Md. Erfanur Talukdar', 'M', NULL, 'Accepted', '2019-12-05', NULL, 'Hore krishnopur, Dangapara, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1776395629', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md. Erfanur Talukdar', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011-02-20 06:37:00', 199, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000201, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md. Ahnaf Tahmid Mithun ', '', 'Md. Ahnaf Tahmid Mithun ', 'Md. Ahnaf Tahmid Mit', 'M', NULL, 'Accepted', '2031-12-05', NULL, 'Chokbirbhan, Dangapara, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1772905113', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md. Ahnaf Tahmid Mithun ', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011-02-20 06:39:00', 200, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000202, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md. S.M Roni Ahmed ', '', 'Md. S.M Roni Ahmed ', 'Md. S.M Roni Ahmed ', 'M', NULL, 'Accepted', '2021-05-06', NULL, 'Dugdugi Bazar, Ghoraghat, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1723444483', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md. S.M Roni Ahmed ', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2014-02-20 12:58:00', 201, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000203, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md. Jobayer Ali ', '', 'Md. Jobayer Ali ', 'Md. Jobayer Ali ', 'M', NULL, 'Accepted', '2006-08-06', NULL, 'Islampara, Birampur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1712767124', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md. Jobayer Ali ', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011-02-20 06:43:00', 202, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000204, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Mst. Rifa Shanjida Azmi', '', 'Mst. Rifa Shanjida Azmi', 'Mst. Rifa Shanjida A', 'F', NULL, 'Accepted', '2017-05-06', NULL, 'Beramalia, Shalkhuria, Nowabgonj, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1733263019', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Mst. Rifa Shanjida Azmi', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011-02-20 07:05:00', 203, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000205, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Mst. Labiba Islam Neha ', '', 'Mst. Labiba Islam Neha ', 'Mst. Labiba Islam Ne', 'F', NULL, 'Accepted', '2009-10-06', NULL, 'Moddho basudebpur, Bangla-Hili, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1913365075', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Mst. Labiba Islam Neha ', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011-02-20 09:14:00', 204, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000206, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Mst. Halima Khatun Shiju', '', 'Mst. Halima Khatun Shiju', 'Mst. Halima Khatun S', 'F', NULL, 'Accepted', '2010-11-05', NULL, 'Bangla-Hili, Hakimpur,Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1718176798', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Mst. Halima Khatun Shiju', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011-02-20 11:07:00', 205, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000207, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md. Sanjana Islam Risha ', '', 'Md. Sanjana Islam Risha ', 'Md. Sanjana Islam Ri', 'F', NULL, 'Accepted', '2005-08-04', NULL, 'Bangla-Hili, Cp Road, Munshipara, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1731534847', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md. Sanjana Islam Risha ', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011-02-20 09:12:00', 206, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000208, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Mst. Maisha maliha Bonna', '', 'Mst. Maisha maliha Bonna', 'Mst. Maisha maliha B', 'F', NULL, 'Accepted', '2014-10-06', NULL, 'Dhoronda, Bangla-Hili, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1712126493', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Mst. Maisha maliha Bonna', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011-02-20 11:06:00', 207, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000209, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Mst. Nazifa Anzum Anu', '', 'Mst. Nazifa Anzum Anu', 'Mst. Nazifa Anzum An', 'F', NULL, 'Accepted', '2010-11-07', NULL, 'Moddho Basudebpur, Bangla-Hili, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1712095552', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Mst. Nazifa Anzum Anu', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011-02-20 11:06:00', 208, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000210, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Mst. Sadia Afroj Prova ', '', 'Mst. Sadia Afroj Prova ', 'Mst. Sadia Afroj Pro', 'F', NULL, 'Accepted', '2018-12-05', NULL, 'Dhelupara, Birampur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1750731131', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Mst. Sadia Afroj Prova ', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011-02-20 11:05:00', 209, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000211, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'test', '', 'test', 'test', 'M', NULL, 'Accepted', '2011-02-20', NULL, 'test', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '234345345', 'Other', '', '880000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'test', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011-02-20 10:18:00', 210, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000212, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'test1', '', 'test1', 'test1', 'M', NULL, 'Accepted', '2011-02-20', NULL, 'asdf', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '234345345', 'Other', '', '880000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'test1', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011-02-20 10:16:00', 211, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000213, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md. Sayed Rabbi Hassan ', '', 'Md. Sayed Rabbi Hassan ', 'Md. Sayed Rabbi Hass', 'M', NULL, 'Accepted', '2019-10-07', NULL, 'Tripura, Bagzana, Joypurhat', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1908053203', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md. Sayed Rabbi Hassan ', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011-02-20 10:05:00', 212, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000214, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md. Shohanur Rahman ', '', 'Md. Shohanur Rahman ', 'Md. Shohanur Rahman ', 'M', NULL, 'Accepted', '2030-09-07', NULL, 'Purbo Ramchandrapur, bagzana, joypurhat, ', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1875425353', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md. Shohanur Rahman ', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011-02-20 11:04:00', 213, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000215, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md. Zinedin Zidan', '', 'Md. Zinedin Zidan', 'Md. Zinedin Zidan', 'M', NULL, 'Accepted', '2012-11-05', NULL, 'Rajdhani mor, Banglahili, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1712577472', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md. Zinedin Zidan', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011-02-20 11:03:00', 214, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000216, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md. tanjil Kabir ', '', 'Md. tanjil Kabir ', 'Md. tanjil Kabir ', 'M', NULL, 'Accepted', '2027-10-07', NULL, 'Chandipur, Ward-1, Bangla-Hili, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1712932068', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md. tanjil Kabir ', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011-02-20 10:08:00', 215, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000217, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Mst. Fabiha Nawshin Medha ', '', 'Mst. Fabiha Nawshin Medha ', 'Mst. Fabiha Nawshin ', 'F', NULL, 'Accepted', '2004-09-06', NULL, 'Uttar Basudebpur, bangla-Hili, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1713013480', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Mst. Fabiha Nawshin Medha ', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011-02-20 11:03:00', 216, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000218, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'test1', '', 'test1', 'test1', 'F', NULL, 'Accepted', '2011-02-20', NULL, 'test', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '234345345', 'Other', '', '880000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'test1', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011-02-20 10:52:00', 217, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000219, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md. Rashidul Islam ', '', 'Md. Rashidul Islam ', 'Md. Rashidul Islam ', 'M', NULL, 'Accepted', '2017-01-06', NULL, 'Ramvodropur, bagzana, panchbibi, joypurhat', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1983823632', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md. Rashidul Islam ', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011-02-20 10:18:00', 218, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000220, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'test', '', 'test', 'test', 'F', NULL, 'Accepted', '2011-02-20', NULL, 'ddad', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '234345345', 'Other', '', '880000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'test', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011-02-20 10:52:00', 219, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000221, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'test1', '', 'test1', 'test1', 'F', NULL, 'Accepted', '2011-02-20', NULL, 'rrwr', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '234345345', 'Other', '', '880000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'test1', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011-02-20 10:52:00', 220, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000222, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md. Rakib Hosen', '', 'Md. Rakib Hosen', 'Md. Rakib Hosen', 'M', NULL, 'Accepted', '2019-05-06', NULL, 'Bagicapara, Khattausna, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1739823417', 'Other', '', '881000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md. Rakib Hosen', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011-02-20 10:46:00', 221, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000223, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Roman Hasan ', '', 'Roman Hasan ', 'Roman Hasan ', 'M', NULL, 'Accepted', '2005-10-06', NULL, 'Dhoronda, bangla-Hili,Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1760207782', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Roman Hasan ', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011-02-20 10:46:00', 222, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000224, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Mst. Ayesha Siddiqa ', '', 'Mst. Ayesha Siddiqa ', 'Mst. Ayesha Siddiqa ', 'M', NULL, 'Accepted', '2006-10-05', NULL, 'Moddho Basudebpur, bangla-Hili, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1773206259', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Mst. Ayesha Siddiqa ', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011-02-20 10:51:00', 223, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000225, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md. Mostak Alam Adib', '', 'Md. Mostak Alam Adib', 'Md. Mostak Alam Adib', 'M', NULL, 'Accepted', '2012-01-06', NULL, 'Moddho Basudebpur, bangla-hili, Hakimpur, Dinajpur ', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1719088372', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md. Mostak Alam Adib', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011-02-20 10:57:00', 224, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000226, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Israt Jahan ', '', 'Israt Jahan ', 'Israt Jahan ', 'F', NULL, 'Accepted', '2016-11-06', NULL, 'Ratanpur, panchbibi, Joypurhat ', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1836296797', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Israt Jahan ', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011-02-20 10:59:00', 225, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000227, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Mst.Shumona Akter Mimu', '', 'Mst.Shumona Akter Mimu', 'Mst.Shumona Akter Mi', 'F', NULL, 'Accepted', '2001-08-07', NULL, 'Uttar Basudebpur, bangla-Hili, hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1308391637', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Mst.Shumona Akter Mimu', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011-02-20 11:02:00', 226, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000228, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md. Samiuzzaman Nisan', '', 'Md. Samiuzzaman Nisan', 'Md. Samiuzzaman Nisa', 'M', NULL, 'Accepted', '2007-10-07', NULL, 'Chandpur, Collegepara, Birampur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1717191086', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md. Samiuzzaman Nisan', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015-02-20 03:11:00', 227, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000229, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Niloy Koiri Dip', '', 'Niloy Koiri Dip', 'Niloy Koiri Dip', 'M', NULL, 'Accepted', '2006-06-14', NULL, 'Majhina, Panchbibi, Joypurhat', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1719794455', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Niloy Koiri Dip', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011-02-20 12:22:00', 228, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000230, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Mst. Rafia Anzum ', '', 'Mst. Rafia Anzum ', 'Mst. Rafia Anzum ', 'F', NULL, 'Accepted', '2007-12-12', NULL, 'Moheshpur, Monoshapur, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1751275777', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Mst. Rafia Anzum ', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011-02-20 12:24:00', 229, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000231, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Tonoy Das', '', 'Tonoy Das', 'Tonoy Das', 'M', NULL, 'Accepted', '2011-11-13', NULL, 'Uttar Basudebpur, Bangla-Hili, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1738980910', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Tonoy Das', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011-02-20 12:26:00', 230, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000232, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md. Abdul Rahman ', '', 'Md. Abdul Rahman ', 'Md. Abdul Rahman ', 'M', NULL, 'Accepted', '2026-05-11', NULL, 'Dakshin Katipur, Monshapur, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1772840798', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md. Abdul Rahman ', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011-02-20 12:28:00', 231, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000233, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md. Rahat Mubtasin', '', 'Md. Rahat Mubtasin', 'Md. Rahat Mubtasin', 'M', NULL, 'Accepted', '2016-11-13', NULL, 'Mohorapara, BanglaHili, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1716456355', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md. Rahat Mubtasin', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011-02-20 12:31:00', 232, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000234, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Noman Rafid ', '', 'Noman Rafid ', 'Noman Rafid ', 'M', NULL, 'Accepted', '2001-11-12', NULL, 'Dhoronda, Bangla-Hili, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1737332652', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Noman Rafid ', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011-02-20 12:34:00', 233, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000235, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Mst. Maliha Mahafuz', '', 'Mst. Maliha Mahafuz', 'Mst. Maliha Mahafuz', 'F', NULL, 'Accepted', '2011-09-14', NULL, 'Khordo mohashul, Sonapur, Pachbibi, Joypurhat', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1751453366', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Mst. Maliha Mahafuz', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011-02-20 12:37:00', 234, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000236, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Mst. Julia Jannat Sneha', '', 'Mst. Julia Jannat Sneha', 'Mst. Julia Jannat Sn', 'F', NULL, 'Accepted', '2011-02-13', NULL, 'Uttor Basudebpur, Bangla-Hili, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1716015992', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Mst. Julia Jannat Sneha', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011-02-20 12:40:00', 235, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000237, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md. Abdur Rouf ', '', 'Md. Abdur Rouf ', 'Md. Abdur Rouf ', 'M', NULL, 'Accepted', '2030-10-13', NULL, 'Moddho Basudebpur, Bangla-Hili, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1925640226', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md. Abdur Rouf ', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011-02-20 12:41:00', 236, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000238, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md. Rejwan Tahmid', '', 'Md. Rejwan Tahmid', 'Md. Rejwan Tahmid', 'M', NULL, 'Accepted', '2014-10-14', NULL, 'Moddho Basudebpur, Bangla-Hili, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1717884222', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md. Rejwan Tahmid', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011-02-20 12:44:00', 237, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000239, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md. Ibtishamul Haque ', '', 'Md. Ibtishamul Haque ', 'Md. Ibtishamul Haque', 'M', NULL, 'Accepted', '2022-04-10', NULL, 'Delupara, Dangapara, Birampur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1739162719', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md. Ibtishamul Haque ', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-02-20 05:16:00', 238, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000240, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', ' Protik Chakroborty', '', ' Protik Chakroborty', ' Protik Chakroborty', 'M', NULL, 'Accepted', '2023-10-11', NULL, 'Majhina, Upazilla, Panchbibi, Joypurhat', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1714601220', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, ' Protik Chakroborty', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-02-20 05:20:00', 239, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000241, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Mst. Hafsa Akter Dola', '', 'Mst. Hafsa Akter Dola', 'Mst. Hafsa Akter Dol', 'F', NULL, 'Accepted', '2004-04-12', NULL, 'Dakshin Basudebpur, Bangla-Hili, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1711329089', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Mst. Hafsa Akter Dola', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-02-20 05:25:00', 240, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000242, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md. Jolil arian ', '', 'Md. Jolil arian ', 'Md. Jolil arian ', 'M', NULL, 'Accepted', '2003-08-12', NULL, 'Moddho Basudebpur, Bangla-Hili, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1788441744', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md. Jolil arian ', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-02-20 05:28:00', 241, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000243, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md. Sadman Ahmed Noman', '', 'Md. Sadman Ahmed Noman', 'Md. Sadman Ahmed Nom', 'M', NULL, 'Accepted', '2004-10-10', NULL, 'Moddho Basudebpur, Bangla-Hili, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1716400123', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md. Sadman Ahmed Noman', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-02-20 05:44:00', 242, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000244, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Mst. Moufia Moni', '', 'Mst. Moufia Moni', 'Mst. Moufia Moni', 'F', NULL, 'Accepted', '2005-11-10', NULL, 'Uttar Basudebpur,  Bangla-Hili, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1912838117', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Mst. Moufia Moni', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-02-20 05:46:00', 243, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000245, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Mst. Shahanaz Akter Ria', '', 'Mst. Shahanaz Akter Ria', 'Mst. Shahanaz Akter ', 'F', NULL, 'Accepted', '2009-07-10', NULL, 'Uttar Basudebpur,  Bangla-Hili, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1912838117', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Mst. Shahanaz Akter Ria', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-02-20 06:03:00', 244, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000246, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Mst. Jidni Chowdhury ', '', 'Mst. Jidni Chowdhury ', 'Mst. Jidni Chowdhury', 'F', NULL, 'Accepted', '2015-03-12', NULL, 'Uttar Basudebpur,  Bangla-Hili, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1716347417', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Mst. Jidni Chowdhury ', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-02-20 06:35:00', 245, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000247, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md. Intekhap Sheikh Pial', '', 'Md. Intekhap Sheikh Pial', 'Md. Intekhap Sheikh ', 'M', NULL, 'Accepted', '2005-09-10', NULL, 'Uttar Basudebpur,  Bangla-Hili, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1912838117', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md. Intekhap Sheikh Pial', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-02-20 06:39:00', 246, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000248, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Nibir Kanti Sarker', '', 'Nibir Kanti Sarker', 'Nibir Kanti Sarker', 'M', NULL, 'Accepted', '2011-01-11', NULL, 'Uttar Basudebpur,  Bangla-Hili, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '178297651', 'Other', '', '880000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Nibir Kanti Sarker', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-02-20 06:42:00', 247, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000249, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Mst. Mridula Rahman ', '', 'Mst. Mridula Rahman ', 'Mst. Mridula Rahman ', '', NULL, 'Accepted', '2013-05-10', NULL, 'Atapara, Bagzana, panchbibi, Joypurhat', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1719737497', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Mst. Mridula Rahman ', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-02-20 06:45:00', 248, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000250, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Likhon Joy soyal ', '', 'Likhon Joy soyal ', 'Likhon Joy soyal ', 'M', NULL, 'Accepted', '2008-08-10', NULL, 'Dhoronda , Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1710098919', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Likhon Joy soyal ', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-02-20 07:07:00', 249, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000251, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Mst. Anika Anzum Dina', '', 'Mst. Anika Anzum Dina', 'Mst. Anika Anzum Din', 'F', NULL, 'Accepted', '2003-05-11', NULL, 'Shonapur, Panchbibi, Joypurhat', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1712175815', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Mst. Anika Anzum Dina', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-02-20 07:09:00', 250, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000252, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Mst. Farzana Akter Rose', '', 'Mst. Farzana Akter Rose', 'Mst. Farzana Akter R', 'F', NULL, 'Accepted', '2001-09-11', NULL, 'Uttar Gopalpur, Bagzana, Panchbibi, joypurhat', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1760282212', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Mst. Farzana Akter Rose', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-02-20 07:13:00', 251, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000253, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'MD. Sagir Abtahi Nuhan', '', 'MD. Sagir Abtahi Nuhan', 'MD. Sagir Abtahi Nuh', 'M', NULL, 'Accepted', '2030-06-12', NULL, 'Shekta, Shonapur, Panchbibi, Joypurhat', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1733039804', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'MD. Sagir Abtahi Nuhan', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-02-20 07:17:00', 252, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000254, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md. Mubtasim Fahim', '', 'Md. Mubtasim Fahim', 'Md. Mubtasim Fahim', 'M', NULL, 'Accepted', '2029-06-10', NULL, 'Soto Dangapara, Bangla-Hili, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1714803827', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md. Mubtasim Fahim', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-02-20 07:21:00', 253, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000255, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Mst. Meftahul zannat Pranti', '', 'Mst. Meftahul zannat Pranti', 'Mst. Meftahul zannat', 'F', NULL, 'Accepted', '2001-07-11', NULL, 'Ratanpur, Panchbibi, Joypurhat', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1758843003', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Mst. Meftahul zannat Pranti', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015-02-20 05:48:00', 254, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000256, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Mst. Afrida Tasin Ishana', '', 'Mst. Afrida Tasin Ishana', 'Mst. Afrida Tasin Is', 'F', NULL, 'Accepted', '2022-01-11', NULL, 'Basudebpur, Hili, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1796936112', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Mst. Afrida Tasin Ishana', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-02-20 07:28:00', 255, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000257, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md. Wali Faisal Rahman', '', 'Md. Wali Faisal Rahman', 'Md. Wali Faisal Rahm', 'M', NULL, 'Accepted', '2030-01-11', NULL, 'Kakra, narayanpur, Khattausna, hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1710719734', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md. Wali Faisal Rahman', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-02-20 07:32:00', 256, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000258, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md. Shahriar Kabir Mahi', '', 'Md. Shahriar Kabir Mahi', 'Md. Shahriar Kabir M', 'M', NULL, 'Accepted', '2017-06-11', NULL, 'Devkhonda, Dangapara, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1719024121', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md. Shahriar Kabir Mahi', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-02-20 07:35:00', 257, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000259, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md. Al Mahmud ', '', 'Md. Al Mahmud ', 'Md. Al Mahmud ', 'M', NULL, 'Accepted', '2029-10-14', NULL, 'Mohorapara, Bangla-Hili, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1750904416', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md. Al Mahmud ', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-02-20 07:37:00', 258, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000260, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Akik Mohammad ', '', 'Akik Mohammad ', 'Akik Mohammad ', 'M', NULL, 'Accepted', '2016-09-11', NULL, 'Chandipur, Bangla-Hilio, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '171840379', 'Other', '', '880000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Akik Mohammad ', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-02-20 07:40:00', 259, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000261, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Mst. Nasita Islam Lyric', '', 'Mst. Nasita Islam Lyric', 'Mst. Nasita Islam Ly', 'F', NULL, 'Accepted', '2015-01-10', NULL, 'Chandipur, Bangla-Hilio, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1710618110', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Mst. Nasita Islam Lyric', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-02-20 07:42:00', 260, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000262, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md. Fahim Shahriar', '', 'Md. Fahim Shahriar', 'Md. Fahim Shahriar', 'M', NULL, 'Accepted', '2027-08-09', NULL, 'Chandipur, Bangla-Hili, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1866963751', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md. Fahim Shahriar', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-02-20 07:44:00', 261, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000263, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md. Sayem Al Din', '', 'Md. Sayem Al Din', 'Md. Sayem Al Din', 'M', NULL, 'Accepted', '2025-10-10', NULL, 'Jangoi, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1750982603', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md. Sayem Al Din', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-02-20 07:47:00', 262, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000264, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Mst. Snia Afrin', '', 'Mst. Snia Afrin', 'Mst. Snia Afrin', 'F', NULL, 'Accepted', '2016-03-11', NULL, 'Ratanpur, Panchbibi, Joypurhat', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1715412064', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Mst. Snia Afrin', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-02-20 07:49:00', 263, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000265, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Mst. Shabnam Mostarin Modina ', '', 'Mst. Shabnam Mostarin Modina ', 'Mst. Shabnam Mostari', 'F', NULL, 'Accepted', '2027-11-09', NULL, 'Chandipur, Banglahili, hakimpur, Dinajpur ', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1718166746', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Mst. Shabnam Mostarin Modina ', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-02-20 07:50:00', 264, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000266, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md. Shuayib Hossain Roshan', '', 'Md. Shuayib Hossain Roshan', 'Md. Shuayib Hossain ', 'M', NULL, 'Accepted', '2018-06-11', NULL, 'Moddho Basudebpur, bangla-Hili, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1717798725', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md. Shuayib Hossain Roshan', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-02-20 10:00:00', 265, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000267, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md. Samir Hossain Shafi', '', 'Md. Samir Hossain Shafi', 'Md. Samir Hossain Sh', 'M', NULL, 'Accepted', '2009-12-12', NULL, 'Moddho Basudebpur, bangla-Hili, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1755380350', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md. Samir Hossain Shafi', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-02-20 10:03:00', 266, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000268, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Mst. Fakihatun jannat fiha', '', 'Mst. Fakihatun jannat fiha', 'Mst. Fakihatun janna', 'F', NULL, 'Accepted', '2012-10-20', NULL, 'Moddho Basudebpur, bangla-Hili, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1716854811', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Mst. Fakihatun jannat fiha', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-02-20 10:05:00', 267, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000269, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Mst. Kamrunnahar Kona ', '', 'Mst. Kamrunnahar Kona ', 'Mst. Kamrunnahar Kon', 'F', NULL, 'Accepted', '2016-08-08', NULL, 'Moddho Basudebpur, bangla-Hili, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1718421835', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Mst. Kamrunnahar Kona ', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-02-20 10:08:00', 268, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000270, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Mst. Fariha Israt', '', 'Mst. Fariha Israt', 'Mst. Fariha Israt', 'F', NULL, 'Accepted', '2024-12-11', NULL, 'Uttar Basudebpur, bangla-Hili, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1792367135', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Mst. Fariha Israt', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-02-20 10:13:00', 269, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000271, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md. Azmayin Tishar Ankon', '', 'Md. Azmayin Tishar Ankon', 'Md. Azmayin Tishar A', 'M', NULL, 'Accepted', '2007-05-11', NULL, 'Bangla-Hili, Charmatha, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1748222978', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md. Azmayin Tishar Ankon', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-02-20 10:22:00', 270, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000272, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md. Ishtiaq Chowdhury ', '', 'Md. Ishtiaq Chowdhury ', 'Md. Ishtiaq Chowdhur', 'M', NULL, 'Accepted', '2015-01-13', NULL, 'Thana road, Chandipur  Bangla-Hili, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1712094312', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md. Ishtiaq Chowdhury ', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-02-20 10:25:00', 271, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000273, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'M. Abrar Faisal', '', 'M. Abrar Faisal', 'M. Abrar Faisal', 'M', NULL, 'Accepted', '2006-11-09', NULL, 'Gumra, Monoshapur, hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1717912088', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'M. Abrar Faisal', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-02-20 10:32:00', 272, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000274, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md. Shahed Prodhan ', '', 'Md. Shahed Prodhan ', 'Md. Shahed Prodhan ', 'M', NULL, 'Accepted', '2008-06-11', NULL, 'Zibonpur, Shonapur, Panchbibi, Joypurhat', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1704992244', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md. Shahed Prodhan ', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-02-20 10:34:00', 273, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000275, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Shanjida Akter Jemi', '', 'Shanjida Akter Jemi', 'Shanjida Akter Jemi', 'F', NULL, 'Accepted', '2006-05-11', NULL, 'Chandipur, SBL Hili Branch, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1712484474', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Shanjida Akter Jemi', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-02-20 10:37:00', 274, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000276, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md. Afridi Hossain Anurag', '', 'Md. Afridi Hossain Anurag', 'Md. Afridi Hossain A', 'M', NULL, 'Accepted', '2009-07-13', NULL, 'Bhuidoba, Bagzana, Panchbibi, joypurhat', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1916711886', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md. Afridi Hossain Anurag', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-02-20 10:39:00', 275, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000277, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md. Junaid ', '', 'Md. Junaid ', 'Md. Junaid ', 'M', NULL, 'Accepted', '2008-03-11', NULL, 'Nilta, Majhina , Panchbibi, Joypurhat', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1720145686', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md. Junaid ', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-02-20 10:41:00', 276, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000278, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Mst. Umme habiba ', '', 'Mst. Umme habiba ', 'Mst. Umme habiba ', 'F', NULL, 'Accepted', '2029-09-10', NULL, 'Kutahara, bagzana, panchbibi, joypurhat', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1737094010', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Mst. Umme habiba ', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-02-20 10:43:00', 277, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000279, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Tasnim Jahan Meshkat', '', 'Tasnim Jahan Meshkat', 'Tasnim Jahan Meshkat', 'F', NULL, 'Accepted', '2030-09-13', NULL, 'Shonapur, Shonapur, Panchbibi, joypurhat', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1739295504', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Tasnim Jahan Meshkat', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-02-20 10:46:00', 278, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000280, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Ray sri Datta ', '', 'Ray sri Datta ', 'Ray sri Datta ', 'M', NULL, 'Accepted', '2024-10-11', NULL, 'Dhoronda, Bangla-Hili, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1711413307', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Ray sri Datta ', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-02-20 10:50:00', 279, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000281, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Mst. Zakia Tabassum Zim', '', 'Mst. Zakia Tabassum Zim', 'Mst. Zakia Tabassum ', 'F', NULL, 'Accepted', '2002-10-12', NULL, 'Hakimpur Thana, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1734408808', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Mst. Zakia Tabassum Zim', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-02-20 10:53:00', 280, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000282, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Mst. Nahida Afrin Moli', '', 'Mst. Nahida Afrin Moli', 'Mst. Nahida Afrin Mo', 'F', NULL, 'Accepted', '2017-11-19', NULL, 'Bolorampur, Dangapara, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '174706737', 'Other', '', '880000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Mst. Nahida Afrin Moli', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-02-20 10:56:00', 281, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000283, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md. Umar Faruq ', '', 'Md. Umar Faruq ', 'Md. Umar Faruq ', 'M', NULL, 'Accepted', '2027-01-13', NULL, 'Kutahara, Bagzana, Panchbibi, joypurhat,', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1761937710', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md. Umar Faruq ', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-02-20 10:59:00', 282, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000284, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md. Nafiul Islam Nafis', '', 'Md. Nafiul Islam Nafis', 'Md. Nafiul Islam Naf', 'M', NULL, 'Accepted', '2019-09-11', NULL, 'Bhimpur, Shonapur, Panchbibi, Joypurhat', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1710368765', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md. Nafiul Islam Nafis', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-02-20 11:02:00', 283, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000285, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md. Tahmid Hasan Tanim', '', 'Md. Tahmid Hasan Tanim', 'Md. Tahmid Hasan Tan', 'M', NULL, 'Accepted', '2019-05-08', NULL, 'Dharanda, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1646416600', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md. Tahmid Hasan Tanim', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-02-20 11:33:00', 284, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000286, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Mst. Shuha Safinaz Rupkotha ', '', 'Mst. Shuha Safinaz Rupkotha ', 'Mst. Shuha Safinaz R', 'F', NULL, 'Accepted', '2020-08-11', NULL, 'Dangapara, Bangla-Hili, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1734805963', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Mst. Shuha Safinaz Rupkotha ', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-02-20 11:35:00', 285, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000287, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md. Abu Hurayra Khan ', '', 'Md. Abu Hurayra Khan ', 'Md. Abu Hurayra Khan', 'M', NULL, 'Accepted', '2022-04-11', NULL, 'Chandipur, Bangla-Hili, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1712074787', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md. Abu Hurayra Khan ', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-02-20 11:37:00', 286, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000288, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Mst. Tasnur Zahan ', '', 'Mst. Tasnur Zahan ', 'Mst. Tasnur Zahan ', 'F', NULL, 'Accepted', '2006-08-10', NULL, 'Moddho BAsudebpur, Bangla-Hili, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1712565894', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Mst. Tasnur Zahan ', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-02-20 11:39:00', 287, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000289, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md. Jihan', '', 'Md. Jihan', 'Md. Jihan', 'M', NULL, 'Accepted', '2020-11-07', NULL, 'Moddho BAsudebpur, Bangla-Hili, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1712883078', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md. Jihan', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-02-20 11:42:00', 288, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000290, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md. Faysal Ahmed ', '', 'Md. Faysal Ahmed ', 'Md. Faysal Ahmed ', 'M', NULL, 'Accepted', '2005-07-10', NULL, 'Uttam Kutial para, Uttam Hajir Hat, Kotowali Rangpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1739216602', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md. Faysal Ahmed ', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-02-20 11:46:00', 289, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000291, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md. Sadman Tanvir ', '', 'Md. Sadman Tanvir ', 'Md. Sadman Tanvir ', 'M', NULL, 'Accepted', '2027-11-08', NULL, 'Moddho Basudebpur, Bangla-Hili, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1969231753', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md. Sadman Tanvir ', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-02-20 11:48:00', 290, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000292, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Mst. Nilima Akter Merin ', '', 'Mst. Nilima Akter Merin ', 'Mst. Nilima Akter Me', 'F', NULL, 'Accepted', '2010-07-09', NULL, 'Moddho Basudebpur, Bangla-Hili, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1737996883', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Mst. Nilima Akter Merin ', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-02-20 11:51:00', 291, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000293, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md. Mushfik Shariar Muhin', '', 'Md. Mushfik Shariar Muhin', 'Md. Mushfik Shariar ', 'M', NULL, 'Accepted', '2015-02-10', NULL, 'Kanusgari, Birampur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1761859330', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md. Mushfik Shariar Muhin', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-02-20 11:55:00', 292, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000294, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Mst.Dilshat Jahan Tuhina', '', 'Mst.Dilshat Jahan Tuhina', 'Mst.Dilshat Jahan Tu', 'F', NULL, 'Accepted', '2004-02-10', NULL, 'Mohorapara, Bangla-Hili, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1717167282', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Mst.Dilshat Jahan Tuhina', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-02-20 11:59:00', 293, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000295, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Mst. Ishita Akter', '', 'Mst. Ishita Akter', 'Mst. Ishita Akter', 'F', NULL, 'Accepted', '2005-10-09', NULL, 'Vimpur, Shonapur, Panchbibi, joypurhat', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1736869314', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Mst. Ishita Akter', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-02-20 12:00:00', 294, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000296, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Shonjid Lakra', '', 'Shonjid Lakra', 'Shonjid Lakra', 'M', NULL, 'Accepted', '2023-01-09', NULL, 'Horihorpur, Monshapur, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1743107711', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Shonjid Lakra', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-02-20 12:02:00', 295, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000297, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md. Al Muhy Shaikat ', '', 'Md. Al Muhy Shaikat ', 'Md. Al Muhy Shaikat ', 'M', NULL, 'Accepted', '2012-07-10', NULL, 'Hakimpur Thana, bangla-Hili, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1712668790', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md. Al Muhy Shaikat ', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-02-20 12:04:00', 296, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000298, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Nahian Munkar Nizhum', '', 'Nahian Munkar Nizhum', 'Nahian Munkar Nizhum', 'M', NULL, 'Accepted', '2030-12-10', NULL, 'Bagzana, Atapara, Panchbibi, Joypurhat', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1716899862', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Nahian Munkar Nizhum', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-02-20 12:06:00', 297, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000299, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md. Arafat Hossain', '', 'Md. Arafat Hossain', 'Md. Arafat Hossain', 'M', NULL, 'Accepted', '2020-09-09', NULL, 'Dakshin Kadipur, Monshapur, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1721461579', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md. Arafat Hossain', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-02-20 12:09:00', 298, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000300, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Tur Mohammad ', '', 'Tur Mohammad ', 'Tur Mohammad ', 'M', NULL, 'Accepted', '2026-08-06', NULL, 'Dhoronda, Bangla-Hili, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1780971016', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Tur Mohammad ', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015-02-20 03:51:00', 299, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000301, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md. Shoyeb Ahmed', '', 'Md. Shoyeb Ahmed', 'Md. Shoyeb Ahmed', 'M', NULL, 'Accepted', '2006-12-06', NULL, 'Rawtara, Satni, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', 'N/A', 'Other', '', '880N/A', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md. Shoyeb Ahmed', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015-02-20 03:53:00', 300, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000302, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md. Safayet Hossain', '', 'Md. Safayet Hossain', 'Md. Safayet Hossain', 'M', NULL, 'Accepted', '2031-10-11', NULL, 'Belkhuria, Bijul Madrasha, Birampur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', 'N/A', 'Other', '', '880N/A', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md. Safayet Hossain', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015-02-20 04:09:00', 301, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000303, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Mst. Ramisa fariha rafa', '', 'Mst. Ramisa fariha rafa', 'Mst. Ramisa fariha r', 'F', NULL, 'Accepted', '2005-08-08', NULL, 'Hakimpur Police Station, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1733859395', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Mst. Ramisa fariha rafa', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015-02-20 04:12:00', 302, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000304, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Shahriar Rahman Niyad', '', 'Shahriar Rahman Niyad', 'Shahriar Rahman Niya', 'M', NULL, 'Accepted', '2011-04-20', NULL, 'pora gram, Dakshin Shahabazpuul, Birampur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1722808888', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Shahriar Rahman Niyad', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015-02-20 04:40:00', 303, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000305, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md.Shakil Ahmed', '', 'Md.Shakil Ahmed', 'Md.Shakil Ahmed', 'M', NULL, 'Accepted', '2012-02-11', NULL, 'Khatta Usna, hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1739823900', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md.Shakil Ahmed', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015-02-20 04:48:00', 304, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000306, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Mst. Shamima Akter Sifa ', '', 'Mst. Shamima Akter Sifa ', 'Mst. Shamima Akter S', 'F', NULL, 'Accepted', '2010-07-12', NULL, 'Dakshin Basudebpur, Bangla-Hili, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', 'N/A', 'Other', '', '880N/A', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Mst. Shamima Akter Sifa ', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015-02-20 05:55:00', 305, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000307, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md. Tanvir anjum Mishuk', '', 'Md. Tanvir anjum Mishuk', 'Md. Tanvir anjum Mis', 'M', NULL, 'Accepted', '2019-12-12', NULL, 'Satni Grameen Bank, Bangla-Hili, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1713711806', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md. Tanvir anjum Mishuk', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015-02-20 06:22:00', 306, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000308, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Md. Afikur Rahman Afib', '', 'Md. Afikur Rahman Afib', 'Md. Afikur Rahman Af', 'M', NULL, 'Accepted', '2018-11-13', NULL, 'Dakshin basudebpur, Bangla-Hili, Hakimpur, Dinajpur', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1977604963', 'Other', '', '8800000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Md. Afikur Rahman Afib', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015-02-20 06:55:00', 307, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000309, '3fc0a87eca32ed6ae0ecb9f297fecea34821b1cd', '', 'Montasir For Test', '', 'Montasir For Test', 'Montasir For Test', 'M', NULL, 'Accepted', '0000-00-00', NULL, 'SSSSSSSSSSSSSSSSSSSSSSSSSSSS', 'Dinajpur', 'Bangladesh', 'Mobile', '880', '1112220000000', 'Other', '', '8800000000000000', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 004, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, 'Montasir For Test', NULL, NULL, NULL, 'Father', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-20 08:04:00', 308, '', '', '2001-01-20', NULL, 'Personal Recommendation', '', 'N', NULL, NULL, NULL, '', '', ''),
	(000000000310, '2ea0c4c36837c7a5819239a7936dd63de0ccad56', 'Islam', 'Nabiul', 'Noyon', 'Nabiul Islam', '', 'M', NULL, 'Rejected', '2014-02-01', '', NULL, NULL, NULL, '', '', '', '', '', '', 'Bangladesh', 'Bangladesh', '', NULL, '', '', NULL, 025, 001, NULL, NULL, '', '', '', '', NULL, '', '', '', '', NULL, 0000001, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Bengali', 'English', 'Bengali', 'English', '', '', 'N', '', NULL, NULL, 'N', 'N', 'Family', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-08-13 14:04:11', 0, '', '', '2020-01-01', NULL, 'Personal Recommendation', 'Karim', 'N', NULL, NULL, NULL, 'a:0:{}', '', '');
/*!40000 ALTER TABLE `gibbonapplicationform` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibbonapplicationformfile
CREATE TABLE IF NOT EXISTS `gibbonapplicationformfile` (
  `gibbonApplicationFormFileID` int(14) unsigned zerofill NOT NULL,
  `gibbonApplicationFormID` int(12) unsigned zerofill NOT NULL,
  `name` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  PRIMARY KEY (`gibbonApplicationFormFileID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibbonapplicationformfile: ~0 rows (approximately)
/*!40000 ALTER TABLE `gibbonapplicationformfile` DISABLE KEYS */;
/*!40000 ALTER TABLE `gibbonapplicationformfile` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibbonapplicationformlink
CREATE TABLE IF NOT EXISTS `gibbonapplicationformlink` (
  `gibbonApplicationFormLinkID` int(12) unsigned NOT NULL,
  `gibbonApplicationFormID1` int(12) unsigned zerofill NOT NULL,
  `gibbonApplicationFormID2` int(12) unsigned zerofill NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`gibbonApplicationFormLinkID`),
  UNIQUE KEY `link` (`gibbonApplicationFormID1`,`gibbonApplicationFormID2`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibbonapplicationformlink: ~0 rows (approximately)
/*!40000 ALTER TABLE `gibbonapplicationformlink` DISABLE KEYS */;
/*!40000 ALTER TABLE `gibbonapplicationformlink` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibbonapplicationformrelationship
CREATE TABLE IF NOT EXISTS `gibbonapplicationformrelationship` (
  `gibbonApplicationFormRelationshipID` int(14) unsigned zerofill NOT NULL,
  `gibbonApplicationFormID` int(12) unsigned zerofill NOT NULL,
  `gibbonPersonID` int(10) unsigned zerofill NOT NULL,
  `relationship` varchar(50) NOT NULL,
  PRIMARY KEY (`gibbonApplicationFormRelationshipID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibbonapplicationformrelationship: ~1 rows (approximately)
/*!40000 ALTER TABLE `gibbonapplicationformrelationship` DISABLE KEYS */;
INSERT INTO `gibbonapplicationformrelationship` (`gibbonApplicationFormRelationshipID`, `gibbonApplicationFormID`, `gibbonPersonID`, `relationship`) VALUES
	(00000000000001, 000000000310, 0000000001, 'Other');
/*!40000 ALTER TABLE `gibbonapplicationformrelationship` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibbonattendancecode
CREATE TABLE IF NOT EXISTS `gibbonattendancecode` (
  `gibbonAttendanceCodeID` int(3) unsigned zerofill NOT NULL,
  `name` varchar(30) NOT NULL,
  `nameShort` varchar(4) NOT NULL,
  `type` enum('Core','Additional') NOT NULL,
  `direction` enum('In','Out') NOT NULL,
  `scope` enum('Onsite','Onsite - Late','Offsite','Offsite - Left') NOT NULL,
  `active` enum('Y','N') NOT NULL,
  `reportable` enum('Y','N') NOT NULL,
  `future` enum('Y','N') NOT NULL,
  `prefill` enum('Y','N') NOT NULL DEFAULT 'Y',
  `gibbonRoleIDAll` varchar(90) NOT NULL,
  `sequenceNumber` int(3) NOT NULL,
  PRIMARY KEY (`gibbonAttendanceCodeID`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `nameShort` (`nameShort`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibbonattendancecode: ~6 rows (approximately)
/*!40000 ALTER TABLE `gibbonattendancecode` DISABLE KEYS */;
INSERT INTO `gibbonattendancecode` (`gibbonAttendanceCodeID`, `name`, `nameShort`, `type`, `direction`, `scope`, `active`, `reportable`, `future`, `prefill`, `gibbonRoleIDAll`, `sequenceNumber`) VALUES
	(001, 'Present', 'P', 'Core', 'In', 'Onsite', 'Y', 'Y', 'N', 'Y', '001,002,006', 1),
	(002, 'Present - Late', 'PL', 'Core', 'In', 'Onsite - Late', 'Y', 'Y', 'N', 'N', '001,002,006', 2),
	(003, 'Present - Offsite', 'PS', 'Core', 'In', 'Offsite', 'Y', 'Y', 'Y', 'Y', '001,002,006', 3),
	(004, 'Absent', 'A', 'Core', 'Out', 'Offsite', 'Y', 'Y', 'Y', 'Y', '001,002,006', 4),
	(005, 'Left', 'L', 'Core', 'Out', 'Offsite - Left', 'Y', 'Y', 'N', 'Y', '001,002,006', 5),
	(006, 'Left - Early', 'LE', 'Core', 'Out', 'Offsite - Left', 'Y', 'Y', 'N', 'Y', '001,002,006', 6);
/*!40000 ALTER TABLE `gibbonattendancecode` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibbonattendancelogcourseclass
CREATE TABLE IF NOT EXISTS `gibbonattendancelogcourseclass` (
  `gibbonAttendanceLogCourseClassID` int(14) unsigned zerofill NOT NULL,
  `gibbonCourseClassID` int(8) unsigned zerofill NOT NULL,
  `gibbonPersonIDTaker` int(10) unsigned zerofill NOT NULL,
  `date` date DEFAULT NULL,
  `timestampTaken` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`gibbonAttendanceLogCourseClassID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibbonattendancelogcourseclass: ~0 rows (approximately)
/*!40000 ALTER TABLE `gibbonattendancelogcourseclass` DISABLE KEYS */;
/*!40000 ALTER TABLE `gibbonattendancelogcourseclass` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibbonattendancelogperson
CREATE TABLE IF NOT EXISTS `gibbonattendancelogperson` (
  `gibbonAttendanceLogPersonID` int(14) unsigned zerofill NOT NULL,
  `gibbonAttendanceCodeID` int(3) unsigned zerofill DEFAULT NULL,
  `gibbonPersonID` int(10) unsigned zerofill NOT NULL,
  `direction` enum('In','Out') NOT NULL,
  `type` varchar(30) NOT NULL DEFAULT '',
  `reason` varchar(30) NOT NULL DEFAULT '',
  `context` enum('Roll Group','Class','Person','Future','Self Registration') DEFAULT NULL,
  `comment` varchar(255) NOT NULL,
  `date` date DEFAULT NULL,
  `gibbonPersonIDTaker` int(10) unsigned zerofill NOT NULL,
  `gibbonRollGroupID` int(5) unsigned zerofill DEFAULT NULL,
  `gibbonCourseClassID` int(8) unsigned zerofill DEFAULT NULL,
  `timestampTaken` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`gibbonAttendanceLogPersonID`),
  KEY `date` (`date`),
  KEY `gibbonPersonID` (`gibbonPersonID`),
  KEY `dateAndPerson` (`date`,`gibbonPersonID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibbonattendancelogperson: ~0 rows (approximately)
/*!40000 ALTER TABLE `gibbonattendancelogperson` DISABLE KEYS */;
/*!40000 ALTER TABLE `gibbonattendancelogperson` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibbonattendancelogrollgroup
CREATE TABLE IF NOT EXISTS `gibbonattendancelogrollgroup` (
  `gibbonAttendanceLogRollGroupID` int(14) unsigned zerofill NOT NULL,
  `gibbonRollGroupID` int(5) unsigned zerofill NOT NULL,
  `gibbonPersonIDTaker` int(10) unsigned zerofill NOT NULL,
  `date` date DEFAULT NULL,
  `timestampTaken` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`gibbonAttendanceLogRollGroupID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibbonattendancelogrollgroup: ~0 rows (approximately)
/*!40000 ALTER TABLE `gibbonattendancelogrollgroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `gibbonattendancelogrollgroup` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibbonbehaviour
CREATE TABLE IF NOT EXISTS `gibbonbehaviour` (
  `gibbonBehaviourID` int(12) unsigned zerofill NOT NULL,
  `gibbonSchoolYearID` int(3) unsigned zerofill NOT NULL,
  `date` date NOT NULL,
  `gibbonPersonID` int(10) unsigned zerofill NOT NULL,
  `type` enum('Positive','Negative') CHARACTER SET utf8 NOT NULL,
  `descriptor` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `level` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `comment` text CHARACTER SET utf8 NOT NULL,
  `followup` text COLLATE utf8_unicode_ci NOT NULL,
  `gibbonPlannerEntryID` int(14) unsigned zerofill DEFAULT NULL,
  `gibbonPersonIDCreator` int(10) unsigned zerofill NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`gibbonBehaviourID`),
  KEY `gibbonPersonID` (`gibbonPersonID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table bidyaan_fakmsc.gibbonbehaviour: ~0 rows (approximately)
/*!40000 ALTER TABLE `gibbonbehaviour` DISABLE KEYS */;
/*!40000 ALTER TABLE `gibbonbehaviour` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibbonbehaviourletter
CREATE TABLE IF NOT EXISTS `gibbonbehaviourletter` (
  `gibbonBehaviourLetterID` int(10) unsigned zerofill NOT NULL,
  `gibbonSchoolYearID` int(3) unsigned zerofill NOT NULL,
  `gibbonPersonID` int(10) unsigned zerofill NOT NULL,
  `letterLevel` enum('1','2','3') NOT NULL,
  `status` enum('Warning','Issued') NOT NULL,
  `recordCountAtCreation` int(3) NOT NULL,
  `body` text NOT NULL,
  `recipientList` text NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`gibbonBehaviourLetterID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibbonbehaviourletter: ~0 rows (approximately)
/*!40000 ALTER TABLE `gibbonbehaviourletter` DISABLE KEYS */;
/*!40000 ALTER TABLE `gibbonbehaviourletter` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibboncountry
CREATE TABLE IF NOT EXISTS `gibboncountry` (
  `printable_name` varchar(80) NOT NULL,
  `iddCountryCode` varchar(7) NOT NULL,
  PRIMARY KEY (`printable_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibboncountry: ~239 rows (approximately)
/*!40000 ALTER TABLE `gibboncountry` DISABLE KEYS */;
INSERT INTO `gibboncountry` (`printable_name`, `iddCountryCode`) VALUES
	('Afghanistan', '93'),
	('Albania', '355'),
	('Algeria', '213'),
	('American Samoa', '1 684'),
	('Andorra', '376'),
	('Angola', '244'),
	('Anguilla', '1 264'),
	('Antarctica', '672'),
	('Antigua and Barbuda', '1 268'),
	('Argentina', '54'),
	('Armenia', '374'),
	('Aruba', '297'),
	('Australia', '61'),
	('Austria', '43'),
	('Azerbaijan', '994'),
	('Bahamas', '1 242'),
	('Bahrain', '973'),
	('Bangladesh', '880'),
	('Barbados', '1 246'),
	('Belarus', '375'),
	('Belgium', '32'),
	('Belize', '501'),
	('Benin', '229'),
	('Bermuda', '1 441'),
	('Bhutan', '975'),
	('Bolivia', '591'),
	('Bosnia and Herzegovina', '387'),
	('Botswana', '267'),
	('Bouvet Island', ''),
	('Brazil', '55'),
	('British Indian Ocean Territory', ''),
	('Brunei Darussalam', ''),
	('Bulgaria', '359'),
	('Burkina Faso', '226'),
	('Burundi', '257'),
	('Cambodia', '855'),
	('Cameroon', '237'),
	('Canada', '1'),
	('Cape Verde', '238'),
	('Cayman Islands', '1 345'),
	('Central African Republic', '236'),
	('Chad', '235'),
	('Chile', '56'),
	('China', '86'),
	('Christmas Island', '61'),
	('Cocos (Keeling) Islands', '61'),
	('Colombia', '57'),
	('Comoros', '269'),
	('Congo', ''),
	('Congo, the Democratic Republic of the', ''),
	('Cook Islands', '682'),
	('Costa Rica', '506'),
	('Cote D\'Ivoire', ''),
	('Croatia', '385'),
	('Cuba', '53'),
	('Cyprus', '357'),
	('Czech Republic', '420'),
	('Denmark', '45'),
	('Djibouti', '253'),
	('Dominica', '1 767'),
	('Dominican Republic', '1 809'),
	('Ecuador', '593'),
	('Egypt', '20'),
	('El Salvador', '503'),
	('Equatorial Guinea', '240'),
	('Eritrea', '291'),
	('Estonia', '372'),
	('Ethiopia', '251'),
	('Falkland Islands (Malvinas)', ''),
	('Faroe Islands', '298'),
	('Fiji', '679'),
	('Finland', '358'),
	('France', '33'),
	('French Guiana', ''),
	('French Polynesia', '689'),
	('French Southern Territories', ''),
	('Gabon', '241'),
	('Gambia', '220'),
	('Georgia', '995'),
	('Germany', '49'),
	('Ghana', '233'),
	('Gibraltar', '350'),
	('Greece', '30'),
	('Greenland', '299'),
	('Grenada', '1 473'),
	('Guadeloupe', ''),
	('Guam', '1 671'),
	('Guatemala', '502'),
	('Guinea', '224'),
	('Guinea-Bissau', '245'),
	('Guyana', '592'),
	('Haiti', '509'),
	('Heard Island and Mcdonald Islands', ''),
	('Holy See (Vatican City State)', ''),
	('Honduras', '504'),
	('Hong Kong', '852'),
	('Hungary', '36'),
	('Iceland', '354'),
	('India', '91'),
	('Indonesia', '62'),
	('Iran, Islamic Republic of', ''),
	('Iraq', '964'),
	('Ireland', '353'),
	('Israel', '972'),
	('Italy', '39'),
	('Jamaica', '1 876'),
	('Japan', '81'),
	('Jordan', '962'),
	('Kazakhstan', '7'),
	('Kenya', '254'),
	('Kiribati', '686'),
	('Korea, Democratic People\'s Republic of', ''),
	('Korea, Republic of', ''),
	('Kuwait', '965'),
	('Kyrgyzstan', '996'),
	('Lao People\'s Democratic Republic', ''),
	('Latvia', '371'),
	('Lebanon', '961'),
	('Lesotho', '266'),
	('Liberia', '231'),
	('Libyan Arab Jamahiriya', ''),
	('Liechtenstein', '423'),
	('Lithuania', '370'),
	('Luxembourg', '352'),
	('Macao', '853'),
	('Macedonia, the Former Yugoslav Republic of', ''),
	('Madagascar', '261'),
	('Malawi', '265'),
	('Malaysia', '60'),
	('Maldives', '960'),
	('Mali', '223'),
	('Malta', '356'),
	('Marshall Islands', '692'),
	('Martinique', ''),
	('Mauritania', '222'),
	('Mauritius', '230'),
	('Mayotte', '262'),
	('Mexico', '52'),
	('Micronesia, Federated States of', ''),
	('Moldova, Republic of', ''),
	('Monaco', '377'),
	('Mongolia', '976'),
	('Montserrat', '1 664'),
	('Morocco', '212'),
	('Mozambique', '258'),
	('Myanmar', '95'),
	('Namibia', '264'),
	('Nauru', '674'),
	('Nepal', '977'),
	('Netherlands', '31'),
	('Netherlands Antilles', '599'),
	('New Caledonia', '687'),
	('New Zealand', '64'),
	('Nicaragua', '505'),
	('Niger', '227'),
	('Nigeria', '234'),
	('Niue', '683'),
	('Norfolk Island', '672'),
	('Northern Mariana Islands', '1 670'),
	('Norway', '47'),
	('Oman', '968'),
	('Pakistan', '92'),
	('Palau', '680'),
	('Palestinian Territory, Occupied', ''),
	('Panama', '507'),
	('Papua New Guinea', '675'),
	('Paraguay', '595'),
	('Peru', '51'),
	('Philippines', '63'),
	('Pitcairn', ''),
	('Poland', '48'),
	('Portugal', '351'),
	('Puerto Rico', '1'),
	('Qatar', '974'),
	('Reunion', ''),
	('Romania', '40'),
	('Russia', '7'),
	('Rwanda', '250'),
	('Saint Helena', '290'),
	('Saint Kitts and Nevis', '1 869'),
	('Saint Lucia', '1 758'),
	('Saint Pierre and Miquelon', '508'),
	('Saint Vincent and the Grenadines', '1 784'),
	('Samoa', '685'),
	('San Marino', '378'),
	('Sao Tome and Principe', '239'),
	('Saudi Arabia', '966'),
	('Senegal', '221'),
	('Serbia and Montenegro', ''),
	('Seychelles', '248'),
	('Sierra Leone', '232'),
	('Singapore', '65'),
	('Slovakia', '421'),
	('Slovenia', '386'),
	('Solomon Islands', '677'),
	('Somalia', '252'),
	('South Africa', '27'),
	('South Georgia and the South Sandwich Islands', ''),
	('Spain', '34'),
	('Sri Lanka', '94'),
	('Sudan', '249'),
	('Suriname', '597'),
	('Svalbard and Jan Mayen', ''),
	('Swaziland', '268'),
	('Sweden', '46'),
	('Switzerland', '41'),
	('Syrian Arab Republic', ''),
	('Taiwan', '886'),
	('Tajikistan', '992'),
	('Tanzania, United Republic of', ''),
	('Thailand', '66'),
	('Timor-Leste', '670'),
	('Togo', '228'),
	('Tokelau', '690'),
	('Tonga', '676'),
	('Trinidad and Tobago', '1 868'),
	('Tunisia', '216'),
	('Turkey', '90'),
	('Turkmenistan', '993'),
	('Turks and Caicos Islands', '1 649'),
	('Tuvalu', '688'),
	('Uganda', '256'),
	('Ukraine', '380'),
	('United Arab Emirates', '971'),
	('United Kingdom', '44'),
	('United States', '1'),
	('United States Minor Outlying Islands', ''),
	('Uruguay', '598'),
	('Uzbekistan', '998'),
	('Vanuatu', '678'),
	('Venezuela', '58'),
	('Vietnam', '84'),
	('Virgin Islands, British', ''),
	('Virgin Islands, U.s.', ''),
	('Wallis and Futuna', '681'),
	('Western Sahara', ''),
	('Yemen', '967'),
	('Zambia', '260'),
	('Zimbabwe', '263');
/*!40000 ALTER TABLE `gibboncountry` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibboncourse
CREATE TABLE IF NOT EXISTS `gibboncourse` (
  `gibbonCourseID` int(8) unsigned zerofill NOT NULL,
  `gibbonSchoolYearID` int(3) unsigned zerofill NOT NULL,
  `gibbonDepartmentID` int(4) unsigned zerofill DEFAULT NULL,
  `name` varchar(60) NOT NULL,
  `nameShort` varchar(12) NOT NULL,
  `description` text NOT NULL,
  `map` enum('Y','N') NOT NULL DEFAULT 'Y' COMMENT 'Should this course be included in curriculum maps and other summaries?',
  `gibbonYearGroupIDList` varchar(255) NOT NULL,
  `orderBy` int(3) NOT NULL,
  PRIMARY KEY (`gibbonCourseID`),
  UNIQUE KEY `nameYear` (`gibbonSchoolYearID`,`name`),
  KEY `gibbonSchoolYearID` (`gibbonSchoolYearID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibboncourse: ~0 rows (approximately)
/*!40000 ALTER TABLE `gibboncourse` DISABLE KEYS */;
/*!40000 ALTER TABLE `gibboncourse` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibboncourseclass
CREATE TABLE IF NOT EXISTS `gibboncourseclass` (
  `gibbonCourseClassID` int(8) unsigned zerofill NOT NULL,
  `gibbonCourseID` int(8) unsigned zerofill NOT NULL,
  `name` varchar(30) NOT NULL DEFAULT '',
  `nameShort` varchar(8) NOT NULL,
  `reportable` enum('Y','N') NOT NULL DEFAULT 'Y',
  `attendance` enum('Y','N') NOT NULL DEFAULT 'Y',
  `gibbonScaleIDTarget` int(5) unsigned zerofill DEFAULT NULL,
  PRIMARY KEY (`gibbonCourseClassID`),
  KEY `gibbonCourseID` (`gibbonCourseID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibboncourseclass: ~0 rows (approximately)
/*!40000 ALTER TABLE `gibboncourseclass` DISABLE KEYS */;
/*!40000 ALTER TABLE `gibboncourseclass` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibboncourseclassmap
CREATE TABLE IF NOT EXISTS `gibboncourseclassmap` (
  `gibbonCourseClassMapID` int(8) unsigned zerofill NOT NULL,
  `gibbonCourseClassID` int(8) unsigned zerofill DEFAULT NULL,
  `gibbonRollGroupID` int(5) unsigned zerofill DEFAULT NULL,
  `gibbonYearGroupID` int(3) unsigned zerofill DEFAULT NULL,
  PRIMARY KEY (`gibbonCourseClassMapID`),
  UNIQUE KEY `gibbonCourseClassID` (`gibbonCourseClassID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table bidyaan_fakmsc.gibboncourseclassmap: ~0 rows (approximately)
/*!40000 ALTER TABLE `gibboncourseclassmap` DISABLE KEYS */;
/*!40000 ALTER TABLE `gibboncourseclassmap` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibboncourseclassperson
CREATE TABLE IF NOT EXISTS `gibboncourseclassperson` (
  `gibbonCourseClassPersonID` int(10) unsigned zerofill NOT NULL,
  `gibbonCourseClassID` int(8) unsigned zerofill NOT NULL,
  `gibbonPersonID` int(10) unsigned zerofill NOT NULL,
  `role` enum('Student','Teacher','Assistant','Technician','Parent','Student - Left','Teacher - Left') NOT NULL,
  `reportable` enum('Y','N') NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`gibbonCourseClassPersonID`),
  KEY `gibbonCourseClassID` (`gibbonCourseClassID`),
  KEY `gibbonPersonID` (`gibbonPersonID`,`role`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibboncourseclassperson: ~0 rows (approximately)
/*!40000 ALTER TABLE `gibboncourseclassperson` DISABLE KEYS */;
/*!40000 ALTER TABLE `gibboncourseclassperson` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibboncrowdassessdiscuss
CREATE TABLE IF NOT EXISTS `gibboncrowdassessdiscuss` (
  `gibbonCrowdAssessDiscussID` int(16) unsigned zerofill NOT NULL,
  `gibbonPlannerEntryHomeworkID` int(16) unsigned zerofill NOT NULL,
  `gibbonPersonID` int(10) unsigned zerofill NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `comment` text NOT NULL,
  `gibbonCrowdAssessDiscussIDReplyTo` int(16) unsigned zerofill DEFAULT NULL,
  PRIMARY KEY (`gibbonCrowdAssessDiscussID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibboncrowdassessdiscuss: ~0 rows (approximately)
/*!40000 ALTER TABLE `gibboncrowdassessdiscuss` DISABLE KEYS */;
/*!40000 ALTER TABLE `gibboncrowdassessdiscuss` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibbondaysofweek
CREATE TABLE IF NOT EXISTS `gibbondaysofweek` (
  `gibbonDaysOfWeekID` int(2) unsigned zerofill NOT NULL,
  `name` varchar(10) NOT NULL,
  `nameShort` varchar(4) NOT NULL,
  `sequenceNumber` int(2) NOT NULL,
  `schoolDay` enum('Y','N') NOT NULL DEFAULT 'Y',
  `schoolOpen` time DEFAULT NULL,
  `schoolStart` time DEFAULT NULL,
  `schoolEnd` time DEFAULT NULL,
  `schoolClose` time DEFAULT NULL,
  PRIMARY KEY (`gibbonDaysOfWeekID`),
  UNIQUE KEY `name` (`name`,`nameShort`),
  UNIQUE KEY `sequenceNumber` (`sequenceNumber`),
  UNIQUE KEY `nameShort` (`nameShort`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibbondaysofweek: ~7 rows (approximately)
/*!40000 ALTER TABLE `gibbondaysofweek` DISABLE KEYS */;
INSERT INTO `gibbondaysofweek` (`gibbonDaysOfWeekID`, `name`, `nameShort`, `sequenceNumber`, `schoolDay`, `schoolOpen`, `schoolStart`, `schoolEnd`, `schoolClose`) VALUES
	(01, 'Monday', 'Mon', 1, 'Y', '07:45:00', '08:30:00', '15:30:00', '17:00:00'),
	(02, 'Tuesday', 'Tue', 2, 'Y', '07:45:00', '08:30:00', '15:30:00', '17:00:00'),
	(03, 'Wednesday', 'Wed', 3, 'Y', '07:45:00', '08:30:00', '15:30:00', '17:00:00'),
	(04, 'Thursday', 'Thu', 4, 'Y', '07:45:00', '08:30:00', '15:30:00', '17:00:00'),
	(05, 'Friday', 'Fri', 5, 'Y', '07:45:00', '08:30:00', '15:30:00', '17:00:00'),
	(06, 'Saturday', 'Sat', 6, 'N', NULL, NULL, NULL, NULL),
	(07, 'Sunday', 'Sun', 7, 'N', NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `gibbondaysofweek` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibbondepartment
CREATE TABLE IF NOT EXISTS `gibbondepartment` (
  `gibbonDepartmentID` int(4) unsigned zerofill NOT NULL,
  `type` enum('Learning Area','Administration') NOT NULL DEFAULT 'Learning Area',
  `name` varchar(40) NOT NULL,
  `nameShort` varchar(4) NOT NULL,
  `subjectListing` varchar(255) NOT NULL,
  `blurb` text NOT NULL,
  `logo` varchar(255) NOT NULL,
  `sequenceNumber` int(4) unsigned DEFAULT NULL,
  PRIMARY KEY (`gibbonDepartmentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibbondepartment: ~0 rows (approximately)
/*!40000 ALTER TABLE `gibbondepartment` DISABLE KEYS */;
/*!40000 ALTER TABLE `gibbondepartment` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibbondepartmentresource
CREATE TABLE IF NOT EXISTS `gibbondepartmentresource` (
  `gibbonDepartmentResourceID` int(8) unsigned zerofill NOT NULL,
  `gibbonDepartmentID` int(4) unsigned zerofill NOT NULL,
  `type` enum('Link','File') NOT NULL,
  `name` varchar(100) NOT NULL,
  `url` varchar(255) NOT NULL,
  PRIMARY KEY (`gibbonDepartmentResourceID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibbondepartmentresource: ~0 rows (approximately)
/*!40000 ALTER TABLE `gibbondepartmentresource` DISABLE KEYS */;
/*!40000 ALTER TABLE `gibbondepartmentresource` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibbondepartmentstaff
CREATE TABLE IF NOT EXISTS `gibbondepartmentstaff` (
  `gibbonDepartmentStaffID` int(6) unsigned zerofill NOT NULL,
  `gibbonDepartmentID` int(4) unsigned zerofill NOT NULL,
  `gibbonPersonID` int(10) unsigned zerofill NOT NULL,
  `role` enum('Coordinator','Assistant Coordinator','Teacher (Curriculum)','Teacher','Director','Manager','Administrator','Other') NOT NULL,
  PRIMARY KEY (`gibbonDepartmentStaffID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibbondepartmentstaff: ~0 rows (approximately)
/*!40000 ALTER TABLE `gibbondepartmentstaff` DISABLE KEYS */;
/*!40000 ALTER TABLE `gibbondepartmentstaff` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibbondiscussion
CREATE TABLE IF NOT EXISTS `gibbondiscussion` (
  `gibbonDiscussionID` int(12) unsigned zerofill NOT NULL,
  `foreignTable` varchar(60) NOT NULL,
  `foreignTableID` int(14) unsigned zerofill NOT NULL,
  `gibbonModuleID` int(4) unsigned zerofill NOT NULL,
  `gibbonPersonID` int(10) unsigned zerofill NOT NULL,
  `type` varchar(60) DEFAULT NULL,
  `comment` text,
  `attachmentType` enum('File','Link') DEFAULT NULL,
  `attachmentLocation` text,
  `gibbonDiscussionIDReplyTo` int(12) unsigned zerofill DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`gibbonDiscussionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibbondiscussion: ~0 rows (approximately)
/*!40000 ALTER TABLE `gibbondiscussion` DISABLE KEYS */;
/*!40000 ALTER TABLE `gibbondiscussion` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibbondistrict
CREATE TABLE IF NOT EXISTS `gibbondistrict` (
  `gibbonDistrictID` int(6) unsigned zerofill NOT NULL,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`gibbonDistrictID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibbondistrict: ~0 rows (approximately)
/*!40000 ALTER TABLE `gibbondistrict` DISABLE KEYS */;
/*!40000 ALTER TABLE `gibbondistrict` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibbonexternalassessment
CREATE TABLE IF NOT EXISTS `gibbonexternalassessment` (
  `gibbonExternalAssessmentID` int(4) unsigned zerofill NOT NULL,
  `name` varchar(50) NOT NULL,
  `nameShort` varchar(10) NOT NULL,
  `description` varchar(255) NOT NULL,
  `website` text NOT NULL,
  `active` enum('Y','N') NOT NULL,
  `allowFileUpload` enum('Y','N') NOT NULL DEFAULT 'N',
  PRIMARY KEY (`gibbonExternalAssessmentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibbonexternalassessment: ~3 rows (approximately)
/*!40000 ALTER TABLE `gibbonexternalassessment` DISABLE KEYS */;
INSERT INTO `gibbonexternalassessment` (`gibbonExternalAssessmentID`, `name`, `nameShort`, `description`, `website`, `active`, `allowFileUpload`) VALUES
	(0001, 'Cognitive Abilities Test', 'CAT', 'UK-based standardised tests that provides scores in maths, verbal and non-verbal skills, as well as KS3 and GCSE predicted grades.', '', 'Y', 'N'),
	(0002, 'GCSE/iGCSE', 'GCSE', 'UK-based General Certificate of Secondary Education', '', 'Y', 'N'),
	(0003, 'IB Diploma', 'IB Diploma', 'International Baccalaureate Diploma', 'http://www.ibo.org/', 'Y', 'N');
/*!40000 ALTER TABLE `gibbonexternalassessment` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibbonexternalassessmentfield
CREATE TABLE IF NOT EXISTS `gibbonexternalassessmentfield` (
  `gibbonExternalAssessmentFieldID` int(6) unsigned zerofill NOT NULL,
  `gibbonExternalAssessmentID` int(4) unsigned zerofill NOT NULL,
  `name` varchar(50) NOT NULL,
  `category` varchar(50) NOT NULL,
  `order` int(4) NOT NULL,
  `gibbonScaleID` int(5) unsigned zerofill NOT NULL,
  `gibbonYearGroupIDList` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`gibbonExternalAssessmentFieldID`),
  KEY `gibbonExternalAssessmentID` (`gibbonExternalAssessmentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibbonexternalassessmentfield: ~128 rows (approximately)
/*!40000 ALTER TABLE `gibbonexternalassessmentfield` DISABLE KEYS */;
INSERT INTO `gibbonexternalassessmentfield` (`gibbonExternalAssessmentFieldID`, `gibbonExternalAssessmentID`, `name`, `category`, `order`, `gibbonScaleID`, `gibbonYearGroupIDList`) VALUES
	(000001, 0001, 'Maths', '1_Scores', 1, 00010, NULL),
	(000002, 0001, 'Non-Verbal', '1_Scores', 2, 00010, NULL),
	(000003, 0001, 'Verbal', '1_Scores', 3, 00010, NULL),
	(000004, 0001, 'English', '2_KS3 Target Grades', 3, 00011, '001,002,003'),
	(000005, 0001, 'Maths', '2_KS3 Target Grades', 7, 00011, '001,002,003'),
	(000006, 0001, 'Science', '2_KS3 Target Grades', 11, 00011, '001,002,003'),
	(000007, 0001, 'English Language', '3_GCSE Target Grades', 10, 00012, '004,005'),
	(000008, 0001, 'Mathematics', '3_GCSE Target Grades', 18, 00012, '004,005'),
	(000009, 0001, 'Science - Double Award', '3_GCSE Target Grades', 25, 00012, '004,005'),
	(000010, 0001, 'Art & Design', '2_KS3 Target Grades', 1, 00011, '001,002,003'),
	(000011, 0001, 'Design & Tech', '2_KS3 Target Grades', 2, 00011, '001,002,003'),
	(000012, 0001, 'Geography', '2_KS3 Target Grades', 4, 00011, '001,002,003'),
	(000013, 0001, 'History', '2_KS3 Target Grades', 5, 00011, '001,002,003'),
	(000014, 0001, 'ICT', '2_KS3 Target Grades', 6, 00011, '001,002,003'),
	(000015, 0001, 'MFL', '2_KS3 Target Grades', 8, 00011, '001,002,003'),
	(000016, 0001, 'Music', '2_KS3 Target Grades', 9, 00011, '001,002,003'),
	(000017, 0001, 'PE', '2_KS3 Target Grades', 10, 00011, '001,002,003'),
	(000018, 0001, 'Art & Design', '3_GCSE Target Grades', 1, 00012, '004,005'),
	(000019, 0001, 'Business Studies', '3_GCSE Target Grades', 2, 00012, '004,005'),
	(000020, 0001, 'D&T - Electronics', '3_GCSE Target Grades', 3, 00012, '004,005'),
	(000021, 0001, 'D&T - Food', '3_GCSE Target Grades', 4, 00012, '004,005'),
	(000022, 0001, 'D&T - Graphics', '3_GCSE Target Grades', 5, 00012, '004,005'),
	(000023, 0001, 'D&T - Resistant Materials', '3_GCSE Target Grades', 6, 00012, '004,005'),
	(000024, 0001, 'D&T - Systems Control', '3_GCSE Target Grades', 7, 00012, '004,005'),
	(000025, 0001, 'D&T - Textiles', '3_GCSE Target Grades', 8, 00012, '004,005'),
	(000026, 0001, 'Drama', '3_GCSE Target Grades', 9, 00012, '004,005'),
	(000027, 0001, 'English Literature', '3_GCSE Target Grades', 11, 00012, '004,005'),
	(000028, 0001, 'French', '3_GCSE Target Grades', 12, 00012, '004,005'),
	(000029, 0001, 'Geography', '3_GCSE Target Grades', 13, 00012, '004,005'),
	(000030, 0001, 'German', '3_GCSE Target Grades', 14, 00012, '004,005'),
	(000031, 0001, 'History', '3_GCSE Target Grades', 15, 00012, '004,005'),
	(000032, 0001, 'Home Economics', '3_GCSE Target Grades', 16, 00012, '004,005'),
	(000033, 0001, 'Information Technology', '3_GCSE Target Grades', 17, 00012, '004,005'),
	(000034, 0001, 'Media Studies', '3_GCSE Target Grades', 19, 00012, '004,005'),
	(000035, 0001, 'Music', '3_GCSE Target Grades', 20, 00012, '004,005'),
	(000036, 0001, 'Physical Education', '3_GCSE Target Grades', 21, 00012, '004,005'),
	(000037, 0001, 'Religious Education', '3_GCSE Target Grades', 22, 00012, '004,005'),
	(000038, 0001, 'Science - Biology', '3_GCSE Target Grades', 23, 00012, '004,005'),
	(000039, 0001, 'Science - Chemistry', '3_GCSE Target Grades', 24, 00012, '004,005'),
	(000040, 0001, 'Science - Physics', '3_GCSE Target Grades', 26, 00012, '004,005'),
	(000041, 0001, 'Science - Single Award', '3_GCSE Target Grades', 27, 00012, '004,005'),
	(000042, 0001, 'Sociology', '3_GCSE Target Grades', 28, 00012, '004,005'),
	(000043, 0001, 'Spanish', '3_GCSE Target Grades', 29, 00012, '004,005'),
	(000044, 0001, 'Statistics', '3_GCSE Target Grades', 30, 00012, '004,005'),
	(000045, 0002, 'Art & Design', '1_Final Grade', 1, 00003, '004,005'),
	(000046, 0002, 'Chinese (Mandarin)', '1_Final Grade', 2, 00003, '004,005'),
	(000047, 0002, 'Drama', '1_Final Grade', 3, 00003, '004,005'),
	(000048, 0002, 'Dutch', '1_Final Grade', 4, 00003, '004,005'),
	(000049, 0002, 'Economics', '1_Final Grade', 5, 00003, '004,005'),
	(000050, 0002, 'English Language', '1_Final Grade', 6, 00003, '004,005'),
	(000051, 0002, 'English Literature', '1_Final Grade', 7, 00003, '004,005'),
	(000052, 0002, 'Environmental Management', '1_Final Grade', 8, 00003, '004,005'),
	(000053, 0002, 'Mathematics', '1_Final Grade', 9, 00003, '004,005'),
	(000054, 0002, 'Media Studies', '1_Final Grade', 10, 00003, '004,005'),
	(000055, 0002, 'Physical Education', '1_Final Grade', 11, 00003, '004,005'),
	(000056, 0002, 'Science - Double Award', '1_Final Grade', 12, 00003, '004,005'),
	(000057, 0002, 'Spanish', '1_Final Grade', 13, 00003, '004,005'),
	(000058, 0002, 'Art & Design', '0_Target Grade', 1, 00012, '004,005'),
	(000059, 0002, 'Chinese (Mandarin)', '0_Target Grade', 2, 00012, '004,005'),
	(000060, 0002, 'Drama', '0_Target Grade', 3, 00012, '004,005'),
	(000061, 0002, 'Dutch', '0_Target Grade', 4, 00012, '004,005'),
	(000062, 0002, 'Economics', '0_Target Grade', 5, 00012, '004,005'),
	(000063, 0002, 'English Language', '0_Target Grade', 6, 00012, '004,005'),
	(000064, 0002, 'English Literature', '0_Target Grade', 7, 00012, '004,005'),
	(000065, 0002, 'Environmental Management', '0_Target Grade', 8, 00012, '004,005'),
	(000066, 0002, 'Mathematics', '0_Target Grade', 9, 00012, '004,005'),
	(000067, 0002, 'Media Studies', '0_Target Grade', 10, 00012, '004,005'),
	(000068, 0002, 'Physical Education', '0_Target Grade', 11, 00012, '004,005'),
	(000069, 0002, 'Science - Double Award', '0_Target Grade', 12, 00012, '004,005'),
	(000070, 0002, 'Spanish', '0_Target Grade', 13, 00012, '004,005'),
	(000071, 0003, 'IB Diploma Total', '0_Target Grade', 0, 00014, '006,007'),
	(000072, 0003, 'IB Diploma Total', '1_Final Grade', 0, 00014, '006,007'),
	(000073, 0003, 'Chinese A: Language and Literature HL', '0_Target Grade', 1, 00013, '006,007'),
	(000074, 0003, 'Chinese A: Language and Literature SL', '0_Target Grade', 2, 00013, '006,007'),
	(000075, 0003, 'English A: Language and Literature HL', '0_Target Grade', 3, 00013, '006,007'),
	(000076, 0003, 'English A: Language and Literature SL', '0_Target Grade', 4, 00013, '006,007'),
	(000077, 0003, 'English A: Literature HL', '0_Target Grade', 5, 00013, '006,007'),
	(000078, 0003, 'English A: Literature SL', '0_Target Grade', 6, 00013, '006,007'),
	(000079, 0003, 'Self-Taught Language SL', '0_Target Grade', 7, 00013, '006,007'),
	(000080, 0003, 'Chinese B HL', '0_Target Grade', 8, 00013, '006,007'),
	(000081, 0003, 'Chinese B SL', '0_Target Grade', 9, 00013, '006,007'),
	(000082, 0003, 'Spanish B HL', '0_Target Grade', 10, 00013, '006,007'),
	(000083, 0003, 'Spanish B SL', '0_Target Grade', 11, 00013, '006,007'),
	(000084, 0003, 'Italian ab initio SL', '0_Target Grade', 12, 00013, '006,007'),
	(000085, 0003, 'Economics HL', '0_Target Grade', 13, 00013, '006,007'),
	(000086, 0003, 'Economics SL', '0_Target Grade', 14, 00013, '006,007'),
	(000087, 0003, 'Psychology HL', '0_Target Grade', 15, 00013, '006,007'),
	(000088, 0003, 'Psychology SL', '0_Target Grade', 16, 00013, '006,007'),
	(000089, 0003, 'Environmental Systems and Society SL', '0_Target Grade', 17, 00013, '006,007'),
	(000090, 0003, 'Chemistry HL', '0_Target Grade', 18, 00013, '006,007'),
	(000091, 0003, 'Chemistry SL', '0_Target Grade', 19, 00013, '006,007'),
	(000092, 0003, 'Physics HL', '0_Target Grade', 20, 00013, '006,007'),
	(000093, 0003, 'Physics SL', '0_Target Grade', 21, 00013, '006,007'),
	(000094, 0003, 'Mathematics HL', '0_Target Grade', 22, 00013, '006,007'),
	(000095, 0003, 'Mathematics SL', '0_Target Grade', 23, 00013, '006,007'),
	(000096, 0003, 'Maths Studies SL', '0_Target Grade', 24, 00013, '006,007'),
	(000097, 0003, 'Theatre Arts HL', '0_Target Grade', 25, 00013, '006,007'),
	(000098, 0003, 'Theatre Arts SL', '0_Target Grade', 26, 00013, '006,007'),
	(000099, 0003, 'Visual Arts HL', '0_Target Grade', 27, 00013, '006,007'),
	(000100, 0003, 'Visual Arts SL', '0_Target Grade', 28, 00013, '006,007'),
	(000101, 0003, 'Chinese A: Language and Literature HL', '1_Final Grade', 1, 00013, '006,007'),
	(000102, 0003, 'Chinese A: Language and Literature SL', '1_Final Grade', 2, 00013, '006,007'),
	(000103, 0003, 'English A: Language and Literature HL', '1_Final Grade', 3, 00013, '006,007'),
	(000104, 0003, 'English A: Language and Literature SL', '1_Final Grade', 4, 00013, '006,007'),
	(000105, 0003, 'English A: Literature HL', '1_Final Grade', 5, 00013, '006,007'),
	(000106, 0003, 'English A: Literature SL', '1_Final Grade', 6, 00013, '006,007'),
	(000107, 0003, 'Self-Taught Language SL', '1_Final Grade', 7, 00013, '006,007'),
	(000108, 0003, 'Chinese B HL', '1_Final Grade', 8, 00013, '006,007'),
	(000109, 0003, 'Chinese B SL', '1_Final Grade', 9, 00013, '006,007'),
	(000110, 0003, 'Spanish B HL', '1_Final Grade', 10, 00013, '006,007'),
	(000111, 0003, 'Spanish B SL', '1_Final Grade', 11, 00013, '006,007'),
	(000112, 0003, 'Italian ab initio SL', '1_Final Grade', 12, 00013, '006,007'),
	(000113, 0003, 'Economics HL', '1_Final Grade', 13, 00013, '006,007'),
	(000114, 0003, 'Economics SL', '1_Final Grade', 14, 00013, '006,007'),
	(000115, 0003, 'Psychology HL', '1_Final Grade', 15, 00013, '006,007'),
	(000116, 0003, 'Psychology SL', '1_Final Grade', 16, 00013, '006,007'),
	(000117, 0003, 'Environmental Systems and Society SL', '1_Final Grade', 17, 00013, '006,007'),
	(000118, 0003, 'Chemistry HL', '1_Final Grade', 18, 00013, '006,007'),
	(000119, 0003, 'Chemistry SL', '1_Final Grade', 19, 00013, '006,007'),
	(000120, 0003, 'Physics HL', '1_Final Grade', 20, 00013, '006,007'),
	(000121, 0003, 'Physics SL', '1_Final Grade', 21, 00013, '006,007'),
	(000122, 0003, 'Mathematics HL', '1_Final Grade', 22, 00013, '006,007'),
	(000123, 0003, 'Mathematics SL', '1_Final Grade', 23, 00013, '006,007'),
	(000124, 0003, 'Maths Studies SL', '1_Final Grade', 24, 00013, '006,007'),
	(000125, 0003, 'Theatre Arts HL', '1_Final Grade', 25, 00013, '006,007'),
	(000126, 0003, 'Theatre Arts SL', '1_Final Grade', 26, 00013, '006,007'),
	(000127, 0003, 'Visual Arts HL', '1_Final Grade', 27, 00013, '006,007'),
	(000128, 0003, 'Visual Arts SL', '1_Final Grade', 28, 00013, '006,007');
/*!40000 ALTER TABLE `gibbonexternalassessmentfield` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibbonexternalassessmentstudent
CREATE TABLE IF NOT EXISTS `gibbonexternalassessmentstudent` (
  `gibbonExternalAssessmentStudentID` int(12) unsigned zerofill NOT NULL,
  `gibbonExternalAssessmentID` int(4) unsigned zerofill NOT NULL,
  `gibbonPersonID` int(10) unsigned zerofill NOT NULL,
  `date` date NOT NULL,
  `attachment` varchar(255) NOT NULL,
  PRIMARY KEY (`gibbonExternalAssessmentStudentID`),
  KEY `gibbonExternalAssessmentID` (`gibbonExternalAssessmentID`),
  KEY `gibbonPersonID` (`gibbonPersonID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibbonexternalassessmentstudent: ~0 rows (approximately)
/*!40000 ALTER TABLE `gibbonexternalassessmentstudent` DISABLE KEYS */;
/*!40000 ALTER TABLE `gibbonexternalassessmentstudent` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibbonexternalassessmentstudententry
CREATE TABLE IF NOT EXISTS `gibbonexternalassessmentstudententry` (
  `gibbonExternalAssessmentStudentEntryID` int(14) unsigned zerofill NOT NULL,
  `gibbonExternalAssessmentStudentID` int(12) unsigned zerofill NOT NULL,
  `gibbonExternalAssessmentFieldID` int(6) unsigned zerofill NOT NULL,
  `gibbonScaleGradeID` int(7) unsigned zerofill DEFAULT NULL COMMENT 'Key for the actual grade achieved',
  PRIMARY KEY (`gibbonExternalAssessmentStudentEntryID`),
  KEY `gibbonExternalAssessmentStudentID` (`gibbonExternalAssessmentStudentID`),
  KEY `gibbonExternalAssessmentFieldID` (`gibbonExternalAssessmentFieldID`),
  KEY `gibbonScaleGradeID` (`gibbonScaleGradeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibbonexternalassessmentstudententry: ~0 rows (approximately)
/*!40000 ALTER TABLE `gibbonexternalassessmentstudententry` DISABLE KEYS */;
/*!40000 ALTER TABLE `gibbonexternalassessmentstudententry` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibbonfamily
CREATE TABLE IF NOT EXISTS `gibbonfamily` (
  `gibbonFamilyID` int(7) unsigned zerofill NOT NULL,
  `name` varchar(100) NOT NULL,
  `nameAddress` varchar(100) NOT NULL COMMENT 'The formal name to be used for addressing the family (e.g. Mr. & Mrs. Smith)',
  `homeAddress` mediumtext NOT NULL,
  `homeAddressDistrict` varchar(255) NOT NULL,
  `homeAddressCountry` varchar(255) NOT NULL,
  `status` enum('Married','Separated','Divorced','De Facto','Other') NOT NULL,
  `languageHomePrimary` varchar(30) NOT NULL,
  `languageHomeSecondary` varchar(30) DEFAULT NULL,
  `familySync` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`gibbonFamilyID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibbonfamily: ~0 rows (approximately)
/*!40000 ALTER TABLE `gibbonfamily` DISABLE KEYS */;
/*!40000 ALTER TABLE `gibbonfamily` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibbonfamilyadult
CREATE TABLE IF NOT EXISTS `gibbonfamilyadult` (
  `gibbonFamilyAdultID` int(8) unsigned zerofill NOT NULL,
  `gibbonFamilyID` int(7) unsigned zerofill NOT NULL,
  `gibbonPersonID` int(10) unsigned zerofill NOT NULL,
  `comment` text NOT NULL,
  `childDataAccess` enum('Y','N') NOT NULL,
  `contactPriority` int(2) NOT NULL DEFAULT '1',
  `contactCall` enum('Y','N') NOT NULL,
  `contactSMS` enum('Y','N') NOT NULL,
  `contactEmail` enum('Y','N') NOT NULL,
  `contactMail` enum('Y','N') NOT NULL,
  PRIMARY KEY (`gibbonFamilyAdultID`),
  KEY `gibbonFamilyID` (`gibbonFamilyID`,`contactPriority`),
  KEY `gibbonPersonIndex` (`gibbonPersonID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibbonfamilyadult: ~1 rows (approximately)
/*!40000 ALTER TABLE `gibbonfamilyadult` DISABLE KEYS */;
INSERT INTO `gibbonfamilyadult` (`gibbonFamilyAdultID`, `gibbonFamilyID`, `gibbonPersonID`, `comment`, `childDataAccess`, `contactPriority`, `contactCall`, `contactSMS`, `contactEmail`, `contactMail`) VALUES
	(00000001, 0000001, 0000000001, '', 'Y', 1, 'Y', 'Y', 'Y', 'Y');
/*!40000 ALTER TABLE `gibbonfamilyadult` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibbonfamilychild
CREATE TABLE IF NOT EXISTS `gibbonfamilychild` (
  `gibbonFamilyChildID` int(8) unsigned zerofill NOT NULL,
  `gibbonFamilyID` int(7) unsigned zerofill NOT NULL,
  `gibbonPersonID` int(10) unsigned zerofill NOT NULL,
  `comment` text NOT NULL,
  PRIMARY KEY (`gibbonFamilyChildID`),
  KEY `gibbonPersonIndex` (`gibbonPersonID`),
  KEY `gibbonFamilyIndex` (`gibbonFamilyID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibbonfamilychild: ~1 rows (approximately)
/*!40000 ALTER TABLE `gibbonfamilychild` DISABLE KEYS */;
INSERT INTO `gibbonfamilychild` (`gibbonFamilyChildID`, `gibbonFamilyID`, `gibbonPersonID`, `comment`) VALUES
	(00000001, 0000001, 0000001099, '');
/*!40000 ALTER TABLE `gibbonfamilychild` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibbonfamilyrelationship
CREATE TABLE IF NOT EXISTS `gibbonfamilyrelationship` (
  `gibbonFamilyRelationshipID` int(9) unsigned zerofill NOT NULL,
  `gibbonFamilyID` int(7) unsigned zerofill NOT NULL,
  `gibbonPersonID1` int(10) unsigned zerofill NOT NULL,
  `gibbonPersonID2` int(10) unsigned zerofill NOT NULL,
  `relationship` varchar(50) NOT NULL,
  PRIMARY KEY (`gibbonFamilyRelationshipID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Person 1 is [relationship] to person 2?';

-- Dumping data for table bidyaan_fakmsc.gibbonfamilyrelationship: ~1 rows (approximately)
/*!40000 ALTER TABLE `gibbonfamilyrelationship` DISABLE KEYS */;
INSERT INTO `gibbonfamilyrelationship` (`gibbonFamilyRelationshipID`, `gibbonFamilyID`, `gibbonPersonID1`, `gibbonPersonID2`, `relationship`) VALUES
	(000000001, 0000001, 0000000001, 0000001099, 'Father');
/*!40000 ALTER TABLE `gibbonfamilyrelationship` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibbonfamilyupdate
CREATE TABLE IF NOT EXISTS `gibbonfamilyupdate` (
  `gibbonFamilyUpdateID` int(9) unsigned zerofill NOT NULL,
  `gibbonSchoolYearID` int(3) unsigned zerofill DEFAULT NULL,
  `status` enum('Pending','Complete') NOT NULL DEFAULT 'Pending',
  `gibbonFamilyID` int(7) unsigned zerofill NOT NULL,
  `nameAddress` varchar(100) NOT NULL DEFAULT '',
  `homeAddress` mediumtext NOT NULL,
  `homeAddressDistrict` varchar(255) NOT NULL DEFAULT '',
  `homeAddressCountry` varchar(255) NOT NULL DEFAULT '',
  `languageHomePrimary` varchar(30) NOT NULL,
  `languageHomeSecondary` varchar(30) NOT NULL,
  `gibbonPersonIDUpdater` int(10) unsigned zerofill NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`gibbonFamilyUpdateID`),
  KEY `gibbonFamilyIndex` (`gibbonFamilyID`,`gibbonSchoolYearID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibbonfamilyupdate: ~0 rows (approximately)
/*!40000 ALTER TABLE `gibbonfamilyupdate` DISABLE KEYS */;
/*!40000 ALTER TABLE `gibbonfamilyupdate` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibbonfileextension
CREATE TABLE IF NOT EXISTS `gibbonfileextension` (
  `gibbonFileExtensionID` int(4) unsigned zerofill NOT NULL,
  `type` enum('Document','Spreadsheet','Presentation','Graphics/Design','Video','Audio','Other') NOT NULL DEFAULT 'Other',
  `extension` varchar(7) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`gibbonFileExtensionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibbonfileextension: ~45 rows (approximately)
/*!40000 ALTER TABLE `gibbonfileextension` DISABLE KEYS */;
INSERT INTO `gibbonfileextension` (`gibbonFileExtensionID`, `type`, `extension`, `name`) VALUES
	(0001, 'Document', 'doc', 'Microsoft Word 97/2000/XP'),
	(0002, 'Document', 'docx', 'Microsoft Word 2007+'),
	(0003, 'Document', 'pages', 'Apple Pages'),
	(0004, 'Document', 'odt', 'OpenOffice Text'),
	(0005, 'Document', 'txt', 'Plain Text'),
	(0006, 'Document', 'rtf', 'Rich Text Format'),
	(0007, 'Spreadsheet', 'xls', 'Microsoft Excel 97/2000/XP'),
	(0008, 'Spreadsheet', 'xlsx', 'Microsoft Excel 2007+'),
	(0009, 'Spreadsheet', 'ods', 'OpenOffice SpreadSheet'),
	(0010, 'Spreadsheet', 'numbers', 'Apple Numbers'),
	(0011, 'Spreadsheet', 'csv', 'Comma Seperate Values'),
	(0012, 'Presentation', 'ppt', 'Microsoft PowerPoint 97/2000/XP'),
	(0013, 'Presentation', 'pptx', 'Microsoft PowerPoint 2007+'),
	(0014, 'Presentation', 'key', 'Apple Keynote'),
	(0015, 'Audio', 'mp3', 'MPEG Audio'),
	(0016, 'Audio', 'mp4', 'MPEG Audio'),
	(0017, 'Audio', 'm4a', 'MPEG Audio'),
	(0018, 'Audio', 'wma', 'Windows Media Audio'),
	(0019, 'Audio', 'ogg', 'Vorbis Ogg'),
	(0020, 'Audio', 'aac', 'MPEG Audio'),
	(0021, 'Graphics/Design', 'png', 'Portable Network Graphics'),
	(0022, 'Graphics/Design', 'jpg', 'Joint Picture Expert Group'),
	(0023, 'Graphics/Design', 'gif', 'Graphics Interchange Format'),
	(0024, 'Graphics/Design', 'acorn', 'Acorn'),
	(0025, 'Graphics/Design', 'ai', 'Adobe Illustrator'),
	(0026, 'Graphics/Design', 'psd', 'Adobe Photoshop'),
	(0028, 'Graphics/Design', 'xcf', 'GIMP eXperimental Computing Facility'),
	(0029, 'Video', 'avi', 'Audio Video Interleave'),
	(0030, 'Video', 'wmv', 'Windows Media Video'),
	(0031, 'Video', 'mpg', 'MPEG Video'),
	(0032, 'Video', 'mov', 'QuickTime Movie'),
	(0033, 'Video', 'flv', 'Adobe Flash Video'),
	(0034, 'Other', 'fla', 'Adobe Flash'),
	(0035, 'Video', 'swf', 'Adobe Flash'),
	(0036, 'Graphics/Design', 'skp', 'Google SketchUp'),
	(0037, 'Document', 'pdf', 'Portable Document Format'),
	(0038, 'Graphics/Design', 'jpeg', 'Joint Picture Expert Group'),
	(0039, 'Video', 'mpeg', 'MPEG Video'),
	(0040, 'Other', 'sb', 'Scratch'),
	(0041, 'Video', 'm4v', 'MPG Varient'),
	(0042, 'Other', 'zip', 'ZIP Compressed Archive'),
	(0043, 'Document', 'htm', 'HyperText Marrkup Language'),
	(0044, 'Document', 'html', 'HyperText Marrkup Language'),
	(0045, 'Video', '3gp', '3rd Generation Partnership Video'),
	(0046, 'Other', 'sb2', 'Scratch 2');
/*!40000 ALTER TABLE `gibbonfileextension` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibbonfinancebillingschedule
CREATE TABLE IF NOT EXISTS `gibbonfinancebillingschedule` (
  `gibbonFinanceBillingScheduleID` int(6) unsigned zerofill NOT NULL,
  `gibbonSchoolYearID` int(3) unsigned zerofill NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `active` enum('Y','N') NOT NULL DEFAULT 'Y',
  `invoiceIssueDate` date DEFAULT NULL,
  `invoiceDueDate` date DEFAULT NULL,
  `gibbonPersonIDCreator` int(10) unsigned zerofill NOT NULL,
  `timestampCreator` timestamp NULL DEFAULT NULL,
  `gibbonPersonIDUpdate` int(10) unsigned zerofill DEFAULT NULL,
  `timestampUpdate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`gibbonFinanceBillingScheduleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibbonfinancebillingschedule: ~0 rows (approximately)
/*!40000 ALTER TABLE `gibbonfinancebillingschedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `gibbonfinancebillingschedule` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibbonfinancebudget
CREATE TABLE IF NOT EXISTS `gibbonfinancebudget` (
  `gibbonFinanceBudgetID` int(4) unsigned zerofill NOT NULL,
  `name` varchar(30) NOT NULL,
  `nameShort` varchar(8) NOT NULL,
  `active` enum('Y','N') NOT NULL DEFAULT 'Y',
  `category` varchar(255) NOT NULL,
  `gibbonPersonIDCreator` int(10) unsigned zerofill NOT NULL,
  `timestampCreator` timestamp NULL DEFAULT NULL,
  `gibbonPersonIDUpdate` int(10) unsigned zerofill DEFAULT NULL,
  `timestampUpdate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`gibbonFinanceBudgetID`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `nameShort` (`nameShort`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibbonfinancebudget: ~0 rows (approximately)
/*!40000 ALTER TABLE `gibbonfinancebudget` DISABLE KEYS */;
/*!40000 ALTER TABLE `gibbonfinancebudget` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibbonfinancebudgetcycle
CREATE TABLE IF NOT EXISTS `gibbonfinancebudgetcycle` (
  `gibbonFinanceBudgetCycleID` int(6) unsigned zerofill NOT NULL,
  `name` varchar(7) NOT NULL,
  `status` enum('Past','Current','Upcoming') NOT NULL DEFAULT 'Upcoming',
  `dateStart` date NOT NULL,
  `dateEnd` date NOT NULL,
  `sequenceNumber` int(6) NOT NULL,
  `gibbonPersonIDCreator` int(10) unsigned zerofill NOT NULL,
  `timestampCreator` timestamp NULL DEFAULT NULL,
  `gibbonPersonIDUpdate` int(10) unsigned zerofill DEFAULT NULL,
  `timestampUpdate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`gibbonFinanceBudgetCycleID`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibbonfinancebudgetcycle: ~0 rows (approximately)
/*!40000 ALTER TABLE `gibbonfinancebudgetcycle` DISABLE KEYS */;
/*!40000 ALTER TABLE `gibbonfinancebudgetcycle` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibbonfinancebudgetcycleallocation
CREATE TABLE IF NOT EXISTS `gibbonfinancebudgetcycleallocation` (
  `gibbonFinanceBudgetCycleAllocationID` int(10) unsigned zerofill NOT NULL,
  `gibbonFinanceBudgetID` int(4) unsigned zerofill NOT NULL,
  `gibbonFinanceBudgetCycleID` int(6) unsigned zerofill NOT NULL,
  `value` decimal(14,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`gibbonFinanceBudgetCycleAllocationID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibbonfinancebudgetcycleallocation: ~0 rows (approximately)
/*!40000 ALTER TABLE `gibbonfinancebudgetcycleallocation` DISABLE KEYS */;
/*!40000 ALTER TABLE `gibbonfinancebudgetcycleallocation` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibbonfinancebudgetperson
CREATE TABLE IF NOT EXISTS `gibbonfinancebudgetperson` (
  `gibbonFinanceBudgetPersonID` int(8) unsigned zerofill NOT NULL,
  `gibbonFinanceBudgetID` int(4) unsigned zerofill NOT NULL,
  `gibbonPersonID` int(10) unsigned zerofill NOT NULL,
  `access` enum('Full','Write','Read') NOT NULL,
  PRIMARY KEY (`gibbonFinanceBudgetPersonID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibbonfinancebudgetperson: ~0 rows (approximately)
/*!40000 ALTER TABLE `gibbonfinancebudgetperson` DISABLE KEYS */;
/*!40000 ALTER TABLE `gibbonfinancebudgetperson` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibbonfinanceexpense
CREATE TABLE IF NOT EXISTS `gibbonfinanceexpense` (
  `gibbonFinanceExpenseID` int(14) unsigned zerofill NOT NULL,
  `gibbonFinanceBudgetID` int(4) unsigned zerofill NOT NULL,
  `gibbonFinanceBudgetCycleID` int(6) unsigned zerofill NOT NULL,
  `title` varchar(60) NOT NULL,
  `body` text NOT NULL,
  `status` enum('Requested','Approved','Rejected','Cancelled','Ordered','Paid') NOT NULL,
  `cost` decimal(12,2) NOT NULL,
  `countAgainstBudget` enum('Y','N') NOT NULL DEFAULT 'Y',
  `purchaseBy` enum('School','Self') NOT NULL DEFAULT 'School',
  `purchaseDetails` text NOT NULL,
  `paymentMethod` enum('Cash','Cheque','Credit Card','Bank Transfer','Other') DEFAULT NULL,
  `paymentDate` date DEFAULT NULL,
  `paymentAmount` decimal(12,2) DEFAULT NULL,
  `gibbonPersonIDPayment` int(10) unsigned zerofill DEFAULT NULL,
  `paymentID` varchar(100) DEFAULT NULL,
  `paymentReimbursementReceipt` varchar(255) NOT NULL,
  `paymentReimbursementStatus` enum('Requested','Complete') DEFAULT NULL,
  `gibbonPersonIDCreator` int(10) unsigned zerofill NOT NULL,
  `timestampCreator` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `statusApprovalBudgetCleared` enum('N','Y') NOT NULL DEFAULT 'N',
  PRIMARY KEY (`gibbonFinanceExpenseID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibbonfinanceexpense: ~0 rows (approximately)
/*!40000 ALTER TABLE `gibbonfinanceexpense` DISABLE KEYS */;
/*!40000 ALTER TABLE `gibbonfinanceexpense` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibbonfinanceexpenseapprover
CREATE TABLE IF NOT EXISTS `gibbonfinanceexpenseapprover` (
  `gibbonFinanceExpenseApproverID` int(4) unsigned zerofill NOT NULL,
  `gibbonPersonID` int(10) unsigned zerofill NOT NULL,
  `sequenceNumber` int(4) DEFAULT NULL,
  `gibbonPersonIDCreator` int(10) unsigned zerofill NOT NULL,
  `timestampCreator` timestamp NULL DEFAULT NULL,
  `gibbonPersonIDUpdate` int(10) unsigned zerofill DEFAULT NULL,
  `timestampUpdate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`gibbonFinanceExpenseApproverID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibbonfinanceexpenseapprover: ~0 rows (approximately)
/*!40000 ALTER TABLE `gibbonfinanceexpenseapprover` DISABLE KEYS */;
/*!40000 ALTER TABLE `gibbonfinanceexpenseapprover` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibbonfinanceexpenselog
CREATE TABLE IF NOT EXISTS `gibbonfinanceexpenselog` (
  `gibbonFinanceExpenseLogID` int(16) unsigned zerofill NOT NULL,
  `gibbonFinanceExpenseID` int(14) unsigned zerofill NOT NULL,
  `gibbonPersonID` int(10) unsigned zerofill NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `action` enum('Request','Approval - Partial - Budget','Approval - Partial - School','Approval - Final','Approval - Exempt','Rejection','Cancellation','Order','Payment','Reimbursement Request','Reimbursement Completion','Comment') NOT NULL,
  `comment` text NOT NULL,
  PRIMARY KEY (`gibbonFinanceExpenseLogID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibbonfinanceexpenselog: ~0 rows (approximately)
/*!40000 ALTER TABLE `gibbonfinanceexpenselog` DISABLE KEYS */;
/*!40000 ALTER TABLE `gibbonfinanceexpenselog` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibbonfinancefee
CREATE TABLE IF NOT EXISTS `gibbonfinancefee` (
  `gibbonFinanceFeeID` int(6) unsigned zerofill NOT NULL,
  `gibbonSchoolYearID` int(3) unsigned zerofill NOT NULL,
  `name` varchar(100) NOT NULL,
  `nameShort` varchar(6) NOT NULL,
  `description` text NOT NULL,
  `active` enum('Y','N') NOT NULL DEFAULT 'Y',
  `gibbonFinanceFeeCategoryID` int(4) unsigned zerofill NOT NULL,
  `fee` decimal(12,2) NOT NULL,
  `gibbonPersonIDCreator` int(10) unsigned zerofill NOT NULL,
  `timestampCreator` timestamp NULL DEFAULT NULL,
  `gibbonPersonIDUpdate` int(10) unsigned zerofill DEFAULT NULL,
  `timestampUpdate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`gibbonFinanceFeeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibbonfinancefee: ~0 rows (approximately)
/*!40000 ALTER TABLE `gibbonfinancefee` DISABLE KEYS */;
/*!40000 ALTER TABLE `gibbonfinancefee` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibbonfinancefeecategory
CREATE TABLE IF NOT EXISTS `gibbonfinancefeecategory` (
  `gibbonFinanceFeeCategoryID` int(4) unsigned zerofill NOT NULL,
  `name` varchar(100) NOT NULL,
  `nameShort` varchar(6) NOT NULL,
  `description` text NOT NULL,
  `active` enum('Y','N') NOT NULL,
  `gibbonPersonIDCreator` int(10) unsigned zerofill NOT NULL,
  `timestampCreator` timestamp NULL DEFAULT NULL,
  `gibbonPersonIDUpdate` int(10) unsigned zerofill DEFAULT NULL,
  `timestampUpdate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`gibbonFinanceFeeCategoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibbonfinancefeecategory: ~1 rows (approximately)
/*!40000 ALTER TABLE `gibbonfinancefeecategory` DISABLE KEYS */;
INSERT INTO `gibbonfinancefeecategory` (`gibbonFinanceFeeCategoryID`, `name`, `nameShort`, `description`, `active`, `gibbonPersonIDCreator`, `timestampCreator`, `gibbonPersonIDUpdate`, `timestampUpdate`) VALUES
	(0001, 'Other', 'OTHR', 'Category for fees not fitting into any other category.', 'Y', 0000000001, '2013-07-12 08:25:32', NULL, NULL);
/*!40000 ALTER TABLE `gibbonfinancefeecategory` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibbonfinanceinvoice
CREATE TABLE IF NOT EXISTS `gibbonfinanceinvoice` (
  `gibbonFinanceInvoiceID` int(14) unsigned zerofill NOT NULL,
  `gibbonSchoolYearID` int(3) unsigned zerofill NOT NULL,
  `gibbonFinanceInvoiceeID` int(10) unsigned zerofill NOT NULL,
  `invoiceTo` enum('Family','Company') NOT NULL DEFAULT 'Family',
  `billingScheduleType` enum('Scheduled','Ad Hoc') NOT NULL DEFAULT 'Ad Hoc',
  `separated` enum('N','Y') DEFAULT NULL COMMENT 'Has this invoice been separated from its schedule in gibbonFinanceBillingSchedule? Only applies to scheduled invoices. Separation takes place during invoice issueing.',
  `gibbonFinanceBillingScheduleID` int(6) unsigned zerofill DEFAULT NULL,
  `status` enum('Pending','Issued','Paid','Paid - Partial','Cancelled','Refunded') NOT NULL DEFAULT 'Pending',
  `gibbonFinanceFeeCategoryIDList` text,
  `invoiceIssueDate` date DEFAULT NULL,
  `invoiceDueDate` date DEFAULT NULL,
  `paidDate` date DEFAULT NULL,
  `paidAmount` decimal(13,2) DEFAULT NULL COMMENT 'The current running total amount paid to this invoice',
  `gibbonPaymentID` int(14) unsigned zerofill DEFAULT NULL,
  `reminderCount` int(3) NOT NULL DEFAULT '0',
  `notes` text NOT NULL,
  `key` varchar(40) NOT NULL,
  `gibbonPersonIDCreator` int(10) unsigned zerofill NOT NULL,
  `timestampCreator` timestamp NULL DEFAULT NULL,
  `gibbonPersonIDUpdate` int(10) unsigned zerofill DEFAULT NULL,
  `timestampUpdate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`gibbonFinanceInvoiceID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibbonfinanceinvoice: ~0 rows (approximately)
/*!40000 ALTER TABLE `gibbonfinanceinvoice` DISABLE KEYS */;
/*!40000 ALTER TABLE `gibbonfinanceinvoice` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibbonfinanceinvoicee
CREATE TABLE IF NOT EXISTS `gibbonfinanceinvoicee` (
  `gibbonFinanceInvoiceeID` int(10) unsigned zerofill NOT NULL,
  `gibbonPersonID` int(10) unsigned zerofill NOT NULL,
  `invoiceTo` enum('Family','Company') NOT NULL,
  `companyName` varchar(100) DEFAULT NULL,
  `companyContact` varchar(100) DEFAULT NULL,
  `companyAddress` varchar(255) DEFAULT NULL,
  `companyEmail` text,
  `companyCCFamily` enum('N','Y') DEFAULT NULL COMMENT 'When company is billed, should family receive a copy?',
  `companyPhone` varchar(20) DEFAULT NULL,
  `companyAll` enum('Y','N') DEFAULT NULL COMMENT 'Should company pay all invoices?.',
  `gibbonFinanceFeeCategoryIDList` text COMMENT 'If companyAll is N, list category IDs for campany to pay here.',
  PRIMARY KEY (`gibbonFinanceInvoiceeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibbonfinanceinvoicee: ~1 rows (approximately)
/*!40000 ALTER TABLE `gibbonfinanceinvoicee` DISABLE KEYS */;
INSERT INTO `gibbonfinanceinvoicee` (`gibbonFinanceInvoiceeID`, `gibbonPersonID`, `invoiceTo`, `companyName`, `companyContact`, `companyAddress`, `companyEmail`, `companyCCFamily`, `companyPhone`, `companyAll`, `gibbonFinanceFeeCategoryIDList`) VALUES
	(0000000001, 0000001099, 'Family', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `gibbonfinanceinvoicee` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibbonfinanceinvoiceeupdate
CREATE TABLE IF NOT EXISTS `gibbonfinanceinvoiceeupdate` (
  `gibbonFinanceInvoiceeUpdateID` int(12) unsigned zerofill NOT NULL,
  `gibbonSchoolYearID` int(3) unsigned zerofill DEFAULT NULL,
  `status` enum('Pending','Complete') NOT NULL DEFAULT 'Pending',
  `gibbonFinanceInvoiceeID` int(10) unsigned zerofill NOT NULL,
  `invoiceTo` enum('Family','Company') NOT NULL,
  `companyName` varchar(100) DEFAULT NULL,
  `companyContact` varchar(100) DEFAULT NULL,
  `companyAddress` varchar(255) DEFAULT NULL,
  `companyEmail` text,
  `companyCCFamily` enum('N','Y') DEFAULT NULL COMMENT 'When company is billed, should family receive a copy?',
  `companyPhone` varchar(20) DEFAULT NULL,
  `companyAll` enum('Y','N') DEFAULT NULL COMMENT 'Should company pay all invoices?.',
  `gibbonFinanceFeeCategoryIDList` text COMMENT 'If companyAll is N, list category IDs for campany to pay here.',
  `gibbonPersonIDUpdater` int(10) unsigned zerofill NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`gibbonFinanceInvoiceeUpdateID`),
  KEY `gibbonInvoiceeIndex` (`gibbonFinanceInvoiceeID`,`gibbonSchoolYearID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibbonfinanceinvoiceeupdate: ~0 rows (approximately)
/*!40000 ALTER TABLE `gibbonfinanceinvoiceeupdate` DISABLE KEYS */;
/*!40000 ALTER TABLE `gibbonfinanceinvoiceeupdate` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibbonfinanceinvoicefee
CREATE TABLE IF NOT EXISTS `gibbonfinanceinvoicefee` (
  `gibbonFinanceInvoiceFeeID` int(15) unsigned zerofill NOT NULL,
  `gibbonFinanceInvoiceID` int(14) unsigned zerofill NOT NULL,
  `feeType` enum('Standard','Ad Hoc') NOT NULL DEFAULT 'Ad Hoc',
  `gibbonFinanceFeeID` int(6) unsigned zerofill DEFAULT NULL,
  `separated` enum('N','Y') DEFAULT NULL COMMENT 'Has this fee been separated from its parent in gibbonFinanceFee? Only applies to Standard fees. Separation takes place during invoice issueing.',
  `name` varchar(100) DEFAULT NULL,
  `description` text,
  `gibbonFinanceFeeCategoryID` int(4) unsigned zerofill DEFAULT NULL,
  `fee` decimal(12,2) DEFAULT NULL,
  `sequenceNumber` int(10) DEFAULT NULL,
  PRIMARY KEY (`gibbonFinanceInvoiceFeeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibbonfinanceinvoicefee: ~0 rows (approximately)
/*!40000 ALTER TABLE `gibbonfinanceinvoicefee` DISABLE KEYS */;
/*!40000 ALTER TABLE `gibbonfinanceinvoicefee` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibbonfirstaid
CREATE TABLE IF NOT EXISTS `gibbonfirstaid` (
  `gibbonFirstAidID` int(10) unsigned zerofill NOT NULL,
  `gibbonPersonIDPatient` int(10) unsigned zerofill NOT NULL,
  `gibbonCourseClassID` int(8) unsigned zerofill DEFAULT NULL,
  `gibbonPersonIDFirstAider` int(10) unsigned zerofill NOT NULL,
  `gibbonSchoolYearID` int(3) unsigned zerofill NOT NULL,
  `description` text NOT NULL,
  `actionTaken` text NOT NULL,
  `followUp` text NOT NULL,
  `date` date NOT NULL,
  `timeIn` time NOT NULL,
  `timeOut` time DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`gibbonFirstAidID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibbonfirstaid: ~0 rows (approximately)
/*!40000 ALTER TABLE `gibbonfirstaid` DISABLE KEYS */;
/*!40000 ALTER TABLE `gibbonfirstaid` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibbonfirstaidfollowup
CREATE TABLE IF NOT EXISTS `gibbonfirstaidfollowup` (
  `gibbonFirstAidFollowUpID` int(11) unsigned zerofill NOT NULL,
  `gibbonFirstAidID` int(10) unsigned zerofill NOT NULL,
  `gibbonPersonID` int(10) unsigned zerofill NOT NULL,
  `followUp` text NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`gibbonFirstAidFollowUpID`),
  KEY `gibbonFirstAidID` (`gibbonFirstAidID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibbonfirstaidfollowup: ~0 rows (approximately)
/*!40000 ALTER TABLE `gibbonfirstaidfollowup` DISABLE KEYS */;
/*!40000 ALTER TABLE `gibbonfirstaidfollowup` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibbongroup
CREATE TABLE IF NOT EXISTS `gibbongroup` (
  `gibbonGroupID` int(8) unsigned zerofill NOT NULL,
  `gibbonPersonIDOwner` int(10) unsigned zerofill NOT NULL,
  `gibbonSchoolYearID` int(3) unsigned zerofill NOT NULL,
  `name` varchar(30) NOT NULL,
  `timestampCreated` timestamp NULL DEFAULT NULL,
  `timestampUpdated` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`gibbonGroupID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibbongroup: ~0 rows (approximately)
/*!40000 ALTER TABLE `gibbongroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `gibbongroup` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibbongroupperson
CREATE TABLE IF NOT EXISTS `gibbongroupperson` (
  `gibbonGroupPersonID` int(10) unsigned zerofill NOT NULL,
  `gibbonGroupID` int(8) unsigned zerofill NOT NULL,
  `gibbonPersonID` int(10) unsigned zerofill NOT NULL,
  PRIMARY KEY (`gibbonGroupPersonID`),
  UNIQUE KEY `gibbonGroupID` (`gibbonGroupID`,`gibbonPersonID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibbongroupperson: ~0 rows (approximately)
/*!40000 ALTER TABLE `gibbongroupperson` DISABLE KEYS */;
/*!40000 ALTER TABLE `gibbongroupperson` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibbonhook
CREATE TABLE IF NOT EXISTS `gibbonhook` (
  `gibbonHookID` int(4) unsigned zerofill NOT NULL,
  `name` varchar(50) NOT NULL,
  `type` enum('Public Home Page','Student Profile','Parental Dashboard','Staff Dashboard','Student Dashboard','Report Writing') DEFAULT NULL,
  `options` text NOT NULL,
  `gibbonModuleID` int(4) unsigned zerofill NOT NULL COMMENT 'The module which installed this hook.',
  PRIMARY KEY (`gibbonHookID`),
  UNIQUE KEY `name` (`name`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibbonhook: ~0 rows (approximately)
/*!40000 ALTER TABLE `gibbonhook` DISABLE KEYS */;
/*!40000 ALTER TABLE `gibbonhook` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibbonhouse
CREATE TABLE IF NOT EXISTS `gibbonhouse` (
  `gibbonHouseID` int(3) unsigned zerofill NOT NULL,
  `name` varchar(30) NOT NULL,
  `nameShort` varchar(10) NOT NULL,
  `logo` varchar(255) NOT NULL,
  PRIMARY KEY (`gibbonHouseID`),
  UNIQUE KEY `name` (`name`,`nameShort`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibbonhouse: ~0 rows (approximately)
/*!40000 ALTER TABLE `gibbonhouse` DISABLE KEYS */;
/*!40000 ALTER TABLE `gibbonhouse` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibboni18n
CREATE TABLE IF NOT EXISTS `gibboni18n` (
  `gibboni18nID` int(4) unsigned zerofill NOT NULL,
  `code` varchar(5) NOT NULL,
  `name` varchar(100) NOT NULL,
  `version` varchar(10) DEFAULT NULL,
  `active` enum('Y','N') NOT NULL DEFAULT 'Y',
  `installed` enum('Y','N') NOT NULL DEFAULT 'N',
  `systemDefault` enum('Y','N') NOT NULL DEFAULT 'N',
  `dateFormat` varchar(20) NOT NULL,
  `dateFormatRegEx` text NOT NULL,
  `dateFormatPHP` varchar(20) NOT NULL,
  `rtl` enum('Y','N') NOT NULL DEFAULT 'N',
  PRIMARY KEY (`gibboni18nID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibboni18n: ~42 rows (approximately)
/*!40000 ALTER TABLE `gibboni18n` DISABLE KEYS */;
INSERT INTO `gibboni18n` (`gibboni18nID`, `code`, `name`, `version`, `active`, `installed`, `systemDefault`, `dateFormat`, `dateFormatRegEx`, `dateFormatPHP`, `rtl`) VALUES
	(0001, 'en_GB', 'English - United Kingdom', '20.0.00', 'Y', 'Y', 'N', 'dd/mm/yyyy', '/^(0[1-9]|[12][0-9]|3[01])[- /.](0[1-9]|1[012])[- /.](19|20)\\d\\d$/i', 'd/m/Y', 'N'),
	(0002, 'en_US', 'English - United States', '20.0.00', 'Y', 'Y', 'Y', 'mm/dd/yyyy', '/(0[1-9]|1[012])[- /.](0[1-9]|[12][0-9]|3[01])[- /.](19|20\\d\\d)/', 'm/d/Y', 'N'),
	(0003, 'es_ES', 'Español - España', NULL, 'Y', 'N', 'N', 'dd/mm/yyyy', '/^(0[1-9]|[12][0-9]|3[01])[- /.](0[1-9]|1[012])[- /.](19|20)\\d\\d$/i', 'd/m/Y', 'N'),
	(0004, 'zh_CN', '汉语 - 中国', NULL, 'Y', 'N', 'N', 'yyyy-mm-dd', '/^[0-9]{4}-(0[1-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])$/', 'Y-m-d', 'N'),
	(0005, 'zh_HK', '體字 - 香港', NULL, 'Y', 'N', 'N', 'dd/mm/yyyy', '/^(0[1-9]|[12][0-9]|3[01])[- /.](0[1-9]|1[012])[- /.](19|20)\\d\\d$/i', 'd/m/Y', 'N'),
	(0007, 'pl_PL', 'Język polski - Polska', NULL, 'Y', 'N', 'N', 'dd/mm/yyyy', '/^(0[1-9]|[12][0-9]|3[01])[- /.](0[1-9]|1[012])[- /.](19|20)\\d\\d$/i', 'd/m/Y', 'N'),
	(0008, 'it_IT', 'Italiano - Italia', NULL, 'Y', 'N', 'N', 'dd/mm/yyyy', '/^(0[1-9]|[12][0-9]|3[01])[- /.](0[1-9]|1[012])[- /.](19|20)\\d\\d$/i', 'd/m/Y', 'N'),
	(0010, 'id_ID', 'Bahasa Indonesia - Indonesia', NULL, 'N', 'N', 'N', 'dd/mm/yyyy', '/^(0[1-9]|[12][0-9]|3[01])[- /.](0[1-9]|1[012])[- /.](19|20)\\d\\d$/i', 'd/m/Y', 'N'),
	(0011, 'ar_SA', 'العربية - المملكة العربية السعودية', NULL, 'Y', 'N', 'N', 'dd/mm/yyyy', '/^(0[1-9]|[12][0-9]|3[01])[- /.](0[1-9]|1[012])[- /.](19|20)\\d\\d$/i', 'd/m/Y', 'Y'),
	(0012, 'fr_FR', 'Français - France', NULL, 'Y', 'N', 'N', 'dd/mm/yyyy', '/^(0[1-9]|[12][0-9]|3[01])[- /.](0[1-9]|1[012])[- /.](19|20)\\d\\d$/i', 'd/m/Y', 'N'),
	(0013, 'ur_PK', 'پاکستان - اُردُو', NULL, 'Y', 'N', 'N', 'dd/mm/yyyy', '/^(0[1-9]|[12][0-9]|3[01])[- /.](0[1-9]|1[012])[- /.](19|20)\\d\\d$/i', 'd/m/Y', 'Y'),
	(0014, 'sw_KE', 'Swahili', NULL, 'N', 'N', 'N', 'dd/mm/yyyy', '/^(0[1-9]|[12][0-9]|3[01])[- /.](0[1-9]|1[012])[- /.](19|20)\\d\\d$/i', 'd/m/Y', 'N'),
	(0015, 'pt_PT', 'Português', NULL, 'N', 'N', 'N', 'dd/mm/yyyy', '/^(0[1-9]|[12][0-9]|3[01])[- /.](0[1-9]|1[012])[- /.](19|20)\\d\\d$/i', 'd/m/Y', 'N'),
	(0016, 'ro_RO', 'Română', NULL, 'Y', 'N', 'N', 'dd.mm.yyyy', '/^(0[1-9]|[12][0-9]|3[01])[- /.](0[1-9]|1[012])[- /.](19|20)\\d\\d$/i', 'd.m.Y', 'N'),
	(0017, 'ja_JP', '日本語', NULL, 'N', 'N', 'N', 'yyyy-mm-dd', '/^[0-9]{4}-(0[1-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])$/', 'Y-m-d', 'N'),
	(0018, 'ru_RU', 'ру́сский язы́к', NULL, 'N', 'N', 'N', 'dd.mm.yyyy', '/^(0[1-9]|[12][0-9]|3[01])[- /.](0[1-9]|1[012])[- /.](19|20)\\d\\d$/i', 'd.m.Y', 'N'),
	(0019, 'uk_UA', 'українська мова', NULL, 'N', 'N', 'N', 'dd.mm.yyyy', '/^(0[1-9]|[12][0-9]|3[01])[- /.](0[1-9]|1[012])[- /.](19|20)\\d\\d$/i', 'd.m.Y', 'N'),
	(0020, 'bn_BD', 'বাংলা', NULL, 'N', 'N', 'N', 'dd/mm/yyyy', '/^(0[1-9]|[12][0-9]|3[01])[- /.](0[1-9]|1[012])[- /.](19|20)\\d\\d$/i', 'd/m/Y', 'N'),
	(0021, 'da_DK', 'Dansk - Danmark', NULL, 'N', 'N', 'N', 'dd/mm/yyyy', '/^(0[1-9]|[12][0-9]|3[01])[- /.](0[1-9]|1[012])[- /.](19|20)\\d\\d$/i', 'd/m/Y', 'N'),
	(0022, 'fa_IR', 'فارسی', NULL, 'N', 'N', 'N', 'dd/mm/yyyy', '/^(0[1-9]|[12][0-9]|3[01])[- /.](0[1-9]|1[012])[- /.](19|20)\\d\\d$/i', 'd/m/Y', 'Y'),
	(0023, 'pt_BR', 'Português - Brasil', NULL, 'Y', 'N', 'N', 'dd/mm/yyyy', '/^(0[1-9]|[12][0-9]|3[01])[- /.](0[1-9]|1[012])[- /.](19|20)\\d\\d$/i', 'd/m/Y', 'N'),
	(0024, 'ka_GE', 'ქართული ენა', NULL, 'N', 'N', 'N', 'dd/mm/yyyy', '/^(0[1-9]|[12][0-9]|3[01])[- /.](0[1-9]|1[012])[- /.](19|20)\\d\\d$/i', 'd/m/Y', 'N'),
	(0025, 'nl_NL', 'Dutch - Nederland', NULL, 'Y', 'N', 'N', 'dd-mm-yyyy', '/^(0[1-9]|[12][0-9]|3[01])[-](0[1-9]|1[012])[-](19|20)\\d\\d$/i', 'd-m-Y', 'N'),
	(0026, 'hu_HU', 'Magyar - Magyarország', NULL, 'N', 'N', 'N', 'dd-mm-yyyy', '/^(0[1-9]|[12][0-9]|3[01])[-](0[1-9]|1[012])[-](19|20)\\d\\d$/i', 'd-m-Y', 'N'),
	(0027, 'bg_BG', 'български език', NULL, 'N', 'N', 'N', 'dd-mm-yyyy', '/^(0[1-9]|[12][0-9]|3[01])[-](0[1-9]|1[012])[-](19|20)\\d\\d$/i', 'd-m-Y', 'N'),
	(0028, 'ko_KP', '한국어 - 대한민국', NULL, 'N', 'N', 'N', 'dd-mm-yyyy', '/^(0[1-9]|[12][0-9]|3[01])[-](0[1-9]|1[012])[-](19|20)\\d\\d$/i', 'd-m-Y', 'N'),
	(0029, 'fi_FI', 'Suomen Kieli - Suomi', NULL, 'N', 'N', 'N', 'dd-mm-yyyy', '/^(0[1-9]|[12][0-9]|3[01])[-](0[1-9]|1[012])[-](19|20)\\d\\d$/i', 'd-m-Y', 'N'),
	(0030, 'de_DE', 'Deutsch - Deutschland', NULL, 'Y', 'N', 'N', 'dd.mm.yyyy', '/^(0[1-9]|[12][0-9]|3[01])[.](0[1-9]|1[012])[.](19|20)\\d\\d$/i', 'd.m.Y', 'N'),
	(0031, 'in_OR', 'ଓଡ଼ିଆ - इंडिया', NULL, 'N', 'N', 'N', 'dd-mm-yyyy', '/^(0[1-9]|[12][0-9]|3[01])[-](0[1-9]|1[012])[-](19|20)\\d\\d$/i', 'd-m-Y', 'N'),
	(0032, 'no_NO', 'Norsk - Norge', NULL, 'N', 'N', 'N', 'dd-mm-yyyy', '/^(0[1-9]|[12][0-9]|3[01])[-](0[1-9]|1[012])[-](19|20)\\d\\d$/i', 'd-m-Y', 'N'),
	(0033, 'vi_VN', 'Tiếng Việt - Việt Nam', NULL, 'Y', 'N', 'N', 'dd-mm-yyyy', '/^(0[1-9]|[12][0-9]|3[01])[-](0[1-9]|1[012])[-](19|20)\\d\\d$/i', 'd-m-Y', 'N'),
	(0034, 'sq_AL', 'Shqip - Shqipëri', NULL, 'Y', 'N', 'N', 'dd-mm-yyyy', '/^(0[1-9]|[12][0-9]|3[01])[-](0[1-9]|1[012])[-](19|20)\\d\\d$/i', 'd-m-Y', 'N'),
	(0035, 'th_TH', 'ภาษาไทย - ราชอาณาจักรไทย', NULL, 'Y', 'N', 'N', 'dd-mm-yyyy', '/^(0[1-9]|[12][0-9]|3[01])[-](0[1-9]|1[012])[-](19|20)\\d\\d$/i', 'd-m-Y', 'N'),
	(0036, 'el_GR', 'ελληνικά - Ελλάδα', NULL, 'N', 'N', 'N', 'dd-mm-yyyy', '/^(0[1-9]|[12][0-9]|3[01])[-](0[1-9]|1[012])[-](19|20)\\d\\d$/i', 'd-m-Y', 'N'),
	(0037, 'am_ET', 'አማርኛ - ኢትዮጵያ', NULL, 'N', 'N', 'N', 'dd/mm/yyyy', '/^(0[1-9]|[12][0-9]|3[01])[- /.](0[1-9]|1[012])[- /.](19|20)\\d\\d$/i', 'd/m/Y', 'N'),
	(0038, 'om_ET', 'Afaan Oromo - Ethiopia', NULL, 'N', 'N', 'N', 'dd/mm/yyyy', '/^(0[1-9]|[12][0-9]|3[01])[- /.](0[1-9]|1[012])[- /.](19|20)\\d\\d$/i', 'd/m/Y', 'N'),
	(0039, 'hr_HR', 'Hrvatski - Hrvatska', NULL, 'Y', 'N', 'N', 'dd/mm/yyyy', '/^(0[1-9]|[12][0-9]|3[01])[- /.](0[1-9]|1[012])[- /.](19|20)\\d\\d$/i', 'd/m/Y', 'N'),
	(0040, 'et_EE', 'Eesti Keel - Eesti', NULL, 'N', 'N', 'N', 'dd/mm/yyyy', '/^(0[1-9]|[12][0-9]|3[01])[- /.](0[1-9]|1[012])[- /.](19|20)\\d\\d$/i', 'd/m/Y', 'N'),
	(0041, 'he_IL', 'עברית - ישראל', NULL, 'Y', 'N', 'N', 'dd.mm.yyyy', '/^(0[1-9]|[12][0-9]|3[01])[- /.](0[1-9]|1[012])[- /.](19|20)\\d\\d$/i', 'd.m.Y', 'Y'),
	(0042, 'tr_TR', 'Türkçe - Türkiye', NULL, 'Y', 'N', 'N', 'dd.mm.yyyy', '/^(0[1-9]|[12][0-9]|3[01])[- /.](0[1-9]|1[012])[- /.](19|20)\\d\\d$/i', 'd.m.Y', 'N'),
	(0043, 'my_MM', 'မြန်မာ - မြန်မာ', NULL, 'N', 'N', 'N', 'dd-mm-yyyy', '/^(0[1-9]|[12][0-9]|3[01])[- /.](0[1-9]|1[012])[- /.](19|20)\\d\\d$/i', 'd-m-Y', 'N'),
	(0044, 'es_MX', 'Español - Mexico', NULL, 'Y', 'N', 'N', 'dd/mm/yyyy', '/^(0[1-9]|[12][0-9]|3[01])[- /.](0[1-9]|1[012])[- /.](19|20)\\d\\d$/i', 'd/m/Y', 'N');
/*!40000 ALTER TABLE `gibboni18n` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibbonin
CREATE TABLE IF NOT EXISTS `gibbonin` (
  `gibbonINID` int(10) unsigned zerofill NOT NULL,
  `gibbonPersonID` int(10) unsigned zerofill NOT NULL,
  `strategies` text NOT NULL,
  `targets` text NOT NULL,
  `notes` text NOT NULL,
  PRIMARY KEY (`gibbonINID`),
  UNIQUE KEY `gibbonPersonID` (`gibbonPersonID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibbonin: ~0 rows (approximately)
/*!40000 ALTER TABLE `gibbonin` DISABLE KEYS */;
/*!40000 ALTER TABLE `gibbonin` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibboninarchive
CREATE TABLE IF NOT EXISTS `gibboninarchive` (
  `gibbonINArchiveID` int(10) unsigned zerofill NOT NULL,
  `gibbonPersonID` int(10) unsigned zerofill NOT NULL,
  `strategies` text NOT NULL,
  `targets` text NOT NULL,
  `notes` text NOT NULL,
  `descriptors` text NOT NULL COMMENT 'Serialised array of descriptors.',
  `archiveTitle` varchar(50) NOT NULL,
  `archiveTimestamp` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`gibbonINArchiveID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibboninarchive: ~0 rows (approximately)
/*!40000 ALTER TABLE `gibboninarchive` DISABLE KEYS */;
/*!40000 ALTER TABLE `gibboninarchive` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibboninassistant
CREATE TABLE IF NOT EXISTS `gibboninassistant` (
  `gibbonINAssistantID` int(10) unsigned zerofill NOT NULL,
  `gibbonPersonIDStudent` int(10) unsigned zerofill NOT NULL,
  `gibbonPersonIDAssistant` int(10) unsigned zerofill NOT NULL,
  `comment` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`gibbonINAssistantID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table bidyaan_fakmsc.gibboninassistant: ~0 rows (approximately)
/*!40000 ALTER TABLE `gibboninassistant` DISABLE KEYS */;
/*!40000 ALTER TABLE `gibboninassistant` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibbonindescriptor
CREATE TABLE IF NOT EXISTS `gibbonindescriptor` (
  `gibbonINDescriptorID` int(3) unsigned zerofill NOT NULL,
  `name` varchar(50) NOT NULL,
  `nameShort` varchar(5) NOT NULL,
  `description` text NOT NULL,
  `sequenceNumber` int(3) NOT NULL,
  PRIMARY KEY (`gibbonINDescriptorID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibbonindescriptor: ~3 rows (approximately)
/*!40000 ALTER TABLE `gibbonindescriptor` DISABLE KEYS */;
INSERT INTO `gibbonindescriptor` (`gibbonINDescriptorID`, `name`, `nameShort`, `description`, `sequenceNumber`) VALUES
	(001, 'Special Education Needs', 'SEN', 'Official learning needs that have been professionally identified.', 1),
	(002, 'English as an Additional Language', 'EAL', 'Obvious language needs in English acquisition.', 2),
	(003, 'Other Needs', 'ON', 'Any other case. E.g. learning issues that have not been assessed, or ongoing home/family issues that should be known to staff and which may relate to teaching and learning.', 3);
/*!40000 ALTER TABLE `gibbonindescriptor` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibbonininvestigation
CREATE TABLE IF NOT EXISTS `gibbonininvestigation` (
  `gibbonINInvestigationID` int(11) unsigned zerofill NOT NULL,
  `gibbonSchoolYearID` int(3) unsigned zerofill NOT NULL,
  `gibbonPersonIDCreator` int(10) unsigned zerofill NOT NULL,
  `gibbonPersonIDStudent` int(10) unsigned zerofill NOT NULL,
  `status` enum('Referral','Resolved','Investigation','Investigation Complete') DEFAULT NULL,
  `date` date NOT NULL,
  `reason` text NOT NULL,
  `strategiesTried` text NOT NULL,
  `parentsInformed` enum('N','Y') NOT NULL DEFAULT 'N',
  `parentsResponse` text,
  `resolutionDetails` text,
  PRIMARY KEY (`gibbonINInvestigationID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibbonininvestigation: ~0 rows (approximately)
/*!40000 ALTER TABLE `gibbonininvestigation` DISABLE KEYS */;
/*!40000 ALTER TABLE `gibbonininvestigation` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibbonininvestigationcontribution
CREATE TABLE IF NOT EXISTS `gibbonininvestigationcontribution` (
  `gibbonINInvestigationContributionID` int(12) unsigned zerofill NOT NULL,
  `gibbonINInvestigationID` int(11) unsigned zerofill NOT NULL,
  `type` enum('Teacher','Head of Year') NOT NULL DEFAULT 'Teacher',
  `gibbonPersonID` int(10) unsigned zerofill NOT NULL,
  `gibbonCourseClassPersonID` int(10) unsigned zerofill DEFAULT NULL,
  `status` enum('Pending','Complete') NOT NULL DEFAULT 'Pending',
  `cognition` text,
  `memory` text,
  `selfManagement` text,
  `attention` text,
  `socialInteraction` text,
  `communication` text,
  `comment` text,
  PRIMARY KEY (`gibbonINInvestigationContributionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibbonininvestigationcontribution: ~0 rows (approximately)
/*!40000 ALTER TABLE `gibbonininvestigationcontribution` DISABLE KEYS */;
/*!40000 ALTER TABLE `gibbonininvestigationcontribution` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibboninpersondescriptor
CREATE TABLE IF NOT EXISTS `gibboninpersondescriptor` (
  `gibbonINPersonDescriptorID` int(12) unsigned zerofill NOT NULL,
  `gibbonPersonID` int(10) unsigned zerofill NOT NULL,
  `gibbonINDescriptorID` int(3) unsigned zerofill NOT NULL,
  `gibbonAlertLevelID` int(3) unsigned zerofill NOT NULL,
  PRIMARY KEY (`gibbonINPersonDescriptorID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibboninpersondescriptor: ~0 rows (approximately)
/*!40000 ALTER TABLE `gibboninpersondescriptor` DISABLE KEYS */;
/*!40000 ALTER TABLE `gibboninpersondescriptor` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibboninternalassessmentcolumn
CREATE TABLE IF NOT EXISTS `gibboninternalassessmentcolumn` (
  `gibbonInternalAssessmentColumnID` int(10) unsigned zerofill NOT NULL,
  `gibbonCourseClassID` int(8) unsigned zerofill NOT NULL,
  `groupingID` int(8) unsigned zerofill DEFAULT NULL COMMENT 'A value used to group multiple columns.',
  `name` varchar(20) NOT NULL,
  `description` text NOT NULL,
  `type` varchar(50) NOT NULL,
  `attachment` varchar(255) NOT NULL,
  `attainment` enum('Y','N') NOT NULL DEFAULT 'Y',
  `gibbonScaleIDAttainment` int(5) unsigned zerofill DEFAULT NULL,
  `effort` enum('Y','N') NOT NULL DEFAULT 'Y',
  `gibbonScaleIDEffort` int(5) unsigned zerofill DEFAULT NULL,
  `comment` enum('Y','N') NOT NULL DEFAULT 'Y',
  `uploadedResponse` enum('N','Y') NOT NULL DEFAULT 'N',
  `complete` enum('N','Y') NOT NULL,
  `completeDate` date DEFAULT NULL,
  `viewableStudents` enum('N','Y') NOT NULL,
  `viewableParents` enum('N','Y') NOT NULL,
  `gibbonPersonIDCreator` int(10) unsigned zerofill NOT NULL,
  `gibbonPersonIDLastEdit` int(10) unsigned zerofill NOT NULL,
  PRIMARY KEY (`gibbonInternalAssessmentColumnID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibboninternalassessmentcolumn: ~0 rows (approximately)
/*!40000 ALTER TABLE `gibboninternalassessmentcolumn` DISABLE KEYS */;
/*!40000 ALTER TABLE `gibboninternalassessmentcolumn` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibboninternalassessmententry
CREATE TABLE IF NOT EXISTS `gibboninternalassessmententry` (
  `gibbonInternalAssessmentEntryID` int(12) unsigned zerofill NOT NULL,
  `gibbonInternalAssessmentColumnID` int(10) unsigned zerofill NOT NULL,
  `gibbonPersonIDStudent` int(10) unsigned zerofill NOT NULL,
  `attainmentValue` varchar(10) DEFAULT NULL,
  `attainmentDescriptor` varchar(100) DEFAULT NULL,
  `effortValue` varchar(10) DEFAULT NULL,
  `effortDescriptor` varchar(100) DEFAULT NULL,
  `comment` text,
  `response` text,
  `gibbonPersonIDLastEdit` int(10) unsigned zerofill NOT NULL,
  PRIMARY KEY (`gibbonInternalAssessmentEntryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibboninternalassessmententry: ~0 rows (approximately)
/*!40000 ALTER TABLE `gibboninternalassessmententry` DISABLE KEYS */;
/*!40000 ALTER TABLE `gibboninternalassessmententry` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibbonlanguage
CREATE TABLE IF NOT EXISTS `gibbonlanguage` (
  `gibbonLanguageID` int(4) unsigned zerofill NOT NULL,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`gibbonLanguageID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibbonlanguage: ~80 rows (approximately)
/*!40000 ALTER TABLE `gibbonlanguage` DISABLE KEYS */;
INSERT INTO `gibbonlanguage` (`gibbonLanguageID`, `name`) VALUES
	(0001, 'Afrikaans'),
	(0002, 'Albanian'),
	(0003, 'Arabic'),
	(0004, 'Armenian'),
	(0005, 'Basque'),
	(0006, 'Bengali'),
	(0007, 'Bulgarian'),
	(0008, 'Catalan'),
	(0009, 'Cambodian'),
	(0010, 'Chinese (Mandarin)'),
	(0011, 'Chinese (Cantonese)'),
	(0012, 'Croatian'),
	(0013, 'Czech'),
	(0014, 'Danish'),
	(0015, 'Dutch'),
	(0016, 'English'),
	(0017, 'Estonian'),
	(0018, 'Fijian'),
	(0019, 'Finnish'),
	(0020, 'French'),
	(0021, 'Georgian'),
	(0022, 'German'),
	(0023, 'Greek'),
	(0024, 'Gujarati'),
	(0025, 'Hebrew'),
	(0026, 'Hindi'),
	(0027, 'Hungarian'),
	(0028, 'Icelandic'),
	(0029, 'Indonesian'),
	(0030, 'Irish'),
	(0031, 'Italian'),
	(0032, 'Japanese'),
	(0033, 'Javanese'),
	(0034, 'Korean'),
	(0035, 'Latin'),
	(0036, 'Latvian'),
	(0037, 'Lithuanian'),
	(0038, 'Macedonian'),
	(0039, 'Malay'),
	(0040, 'Malayalam'),
	(0041, 'Maltese'),
	(0042, 'Maori'),
	(0043, 'Marathi'),
	(0044, 'Mongolian'),
	(0045, 'Nepali'),
	(0046, 'Norwegian'),
	(0047, 'Persian'),
	(0048, 'Polish'),
	(0049, 'Portuguese'),
	(0050, 'Punjabi'),
	(0051, 'Quechua'),
	(0052, 'Romanian'),
	(0053, 'Russian'),
	(0054, 'Samoan'),
	(0055, 'Serbian'),
	(0056, 'Slovak'),
	(0057, 'Slovenian'),
	(0058, 'Spanish'),
	(0059, 'Swahili'),
	(0060, 'Swedish'),
	(0061, 'Tamil'),
	(0062, 'Tatar'),
	(0063, 'Telugu'),
	(0064, 'Thai'),
	(0065, 'Tibetan'),
	(0066, 'Tongan'),
	(0067, 'Turkish'),
	(0068, 'Ukrainian'),
	(0069, 'Urdu'),
	(0070, 'Uzbek'),
	(0071, 'Vietnamese'),
	(0072, 'Welsh'),
	(0073, 'Xhosa'),
	(0074, 'Odia'),
	(0075, 'Myanmar'),
	(0076, 'Burmese'),
	(0077, 'Filipino'),
	(0078, 'Sinhala'),
	(0079, 'Malagasy'),
	(0080, 'Maldivian');
/*!40000 ALTER TABLE `gibbonlanguage` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibbonlibraryitem
CREATE TABLE IF NOT EXISTS `gibbonlibraryitem` (
  `gibbonLibraryItemID` int(10) unsigned zerofill NOT NULL,
  `gibbonLibraryTypeID` int(5) unsigned zerofill NOT NULL,
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL COMMENT 'Name for book, model for computer, etc.',
  `producer` varchar(255) NOT NULL COMMENT 'Author for book, manufacturer for computer, etc',
  `fields` text NOT NULL,
  `vendor` varchar(100) NOT NULL,
  `purchaseDate` date DEFAULT NULL,
  `invoiceNumber` varchar(50) NOT NULL,
  `imageType` enum('','Link','File') NOT NULL DEFAULT '' COMMENT 'Type of image. Image should be 240px x 240px, or smaller.',
  `imageLocation` varchar(255) NOT NULL COMMENT 'URL or local FS path of image.',
  `comment` text NOT NULL,
  `gibbonSpaceID` int(5) unsigned zerofill DEFAULT NULL,
  `locationDetail` varchar(255) NOT NULL,
  `ownershipType` enum('School','Individual') NOT NULL DEFAULT 'School',
  `gibbonPersonIDOwnership` int(10) unsigned zerofill DEFAULT NULL COMMENT 'If owned by school, then this is the main user. If owned by individual, then this is that individual.',
  `gibbonDepartmentID` int(4) unsigned zerofill DEFAULT NULL COMMENT 'Who is responsible for managing this item? By default this will be the person who added the record, but it can be changed.',
  `replacement` enum('Y','N') NOT NULL DEFAULT 'Y',
  `replacementCost` decimal(10,2) DEFAULT NULL,
  `gibbonSchoolYearIDReplacement` int(3) unsigned zerofill DEFAULT NULL,
  `physicalCondition` enum('','As New','Lightly Worn','Moderately Worn','Damaged','Unusable') NOT NULL,
  `bookable` enum('N','Y') NOT NULL DEFAULT 'N',
  `borrowable` enum('Y','N') NOT NULL DEFAULT 'Y',
  `status` enum('Available','In Use','Decommissioned','Lost','On Loan','Repair','Reserved') NOT NULL DEFAULT 'Available' COMMENT 'The current status of the item.',
  `gibbonPersonIDStatusResponsible` int(10) unsigned zerofill DEFAULT NULL COMMENT 'The person who is responsible for the current status.',
  `gibbonPersonIDStatusRecorder` int(10) unsigned zerofill DEFAULT NULL COMMENT 'The person who recored the current status.',
  `timestampStatus` datetime DEFAULT NULL COMMENT 'The time the status was recorded',
  `returnExpected` date DEFAULT NULL COMMENT 'The time when the event expires.',
  `returnAction` enum('Make Available','Decommission','Repair','Reserve') DEFAULT NULL COMMENT 'What to do when the item is returned?',
  `gibbonPersonIDReturnAction` int(10) unsigned zerofill DEFAULT NULL,
  `gibbonPersonIDCreator` int(10) unsigned zerofill NOT NULL,
  `timestampCreator` datetime NOT NULL,
  `gibbonPersonIDUpdate` int(10) unsigned zerofill DEFAULT NULL,
  `timestampUpdate` datetime DEFAULT NULL,
  PRIMARY KEY (`gibbonLibraryItemID`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibbonlibraryitem: ~0 rows (approximately)
/*!40000 ALTER TABLE `gibbonlibraryitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `gibbonlibraryitem` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibbonlibraryitemevent
CREATE TABLE IF NOT EXISTS `gibbonlibraryitemevent` (
  `gibbonLibraryItemEventID` int(14) unsigned zerofill NOT NULL,
  `gibbonLibraryItemID` int(10) unsigned zerofill NOT NULL,
  `type` enum('Decommission','Loss','Loan','Repair','Reserve','Other') NOT NULL DEFAULT 'Other' COMMENT 'This is maintained even after the item is returned, so we know what type of event it was.',
  `status` enum('Available','Decommissioned','Lost','On Loan','Repair','Reserved','Returned') NOT NULL DEFAULT 'Available',
  `gibbonPersonIDStatusResponsible` int(10) unsigned zerofill DEFAULT NULL COMMENT 'The person who was responsible for the event.',
  `gibbonPersonIDOut` int(10) unsigned zerofill DEFAULT NULL COMMENT 'The person who recored the event.',
  `timestampOut` datetime DEFAULT NULL COMMENT 'The time the event was recorded',
  `returnExpected` date DEFAULT NULL COMMENT 'The time when the event expires.',
  `returnAction` enum('Make Available','Decommission','Repair','Reserve') DEFAULT NULL COMMENT 'What to do when the item is returned?',
  `gibbonPersonIDReturnAction` int(10) unsigned zerofill DEFAULT NULL,
  `timestampReturn` datetime DEFAULT NULL,
  `gibbonPersonIDIn` int(10) unsigned zerofill DEFAULT NULL,
  PRIMARY KEY (`gibbonLibraryItemEventID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibbonlibraryitemevent: ~0 rows (approximately)
/*!40000 ALTER TABLE `gibbonlibraryitemevent` DISABLE KEYS */;
/*!40000 ALTER TABLE `gibbonlibraryitemevent` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibbonlibrarytype
CREATE TABLE IF NOT EXISTS `gibbonlibrarytype` (
  `gibbonLibraryTypeID` int(5) unsigned zerofill NOT NULL,
  `name` varchar(30) NOT NULL,
  `active` enum('Y','N') NOT NULL DEFAULT 'Y',
  `fields` text NOT NULL,
  PRIMARY KEY (`gibbonLibraryTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibbonlibrarytype: ~7 rows (approximately)
/*!40000 ALTER TABLE `gibbonlibrarytype` DISABLE KEYS */;
INSERT INTO `gibbonlibrarytype` (`gibbonLibraryTypeID`, `name`, `active`, `fields`) VALUES
	(00004, 'Print Publication', 'Y', 'a:20:{i:0;a:6:{s:4:"name";s:6:"Format";s:11:"description";s:0:"";s:4:"type";s:6:"Select";s:7:"options";s:341:",Art - Original,Art - Reproduction,Book,Braille,Cartographic material,Chart,Diorama,Electronic Resource,Filmstrip,Flash Card,Game,Globe,Journal,Kit,Large print,Magazine,Manuscript,Microform,Microscope slide,Model,Motion Picture,Music,Picture,Realia,Resource,Serial,Slide,Sound Recording,Technical Drawing,Text,Toy,Transparency,Videorecording";s:7:"default";s:0:"";s:8:"required";s:1:"N";}i:1;a:6:{s:4:"name";s:9:"Publisher";s:11:"description";s:45:"Name of the company who published the volume.";s:4:"type";s:4:"Text";s:7:"options";s:3:"255";s:7:"default";s:0:"";s:8:"required";s:1:"N";}i:2;a:6:{s:4:"name";s:16:"Publication Date";s:11:"description";s:36:"Format: dd/mm/yyyy, mm/yyyy or yyyy.";s:4:"type";s:4:"Text";s:7:"options";s:2:"10";s:7:"default";s:0:"";s:8:"required";s:1:"N";}i:3;a:6:{s:4:"name";s:22:"Country of Publication";s:11:"description";s:0:"";s:4:"type";s:4:"Text";s:7:"options";s:2:"50";s:7:"default";s:0:"";s:8:"required";s:1:"N";}i:4;a:6:{s:4:"name";s:7:"Edition";s:11:"description";s:0:"";s:4:"type";s:4:"Text";s:7:"options";s:2:"50";s:7:"default";s:0:"";s:8:"required";s:1:"N";}i:5;a:6:{s:4:"name";s:6:"ISBN10";s:11:"description";s:28:"10-digit unique ISBN number.";s:4:"type";s:4:"Text";s:7:"options";s:2:"10";s:7:"default";s:0:"";s:8:"required";s:1:"N";}i:6;a:6:{s:4:"name";s:6:"ISBN13";s:11:"description";s:28:"13-digit unique ISBN number.";s:4:"type";s:4:"Text";s:7:"options";s:2:"13";s:7:"default";s:0:"";s:8:"required";s:1:"Y";}i:7;a:6:{s:4:"name";s:11:"Description";s:11:"description";s:36:"A brief blurb describing the volume.";s:4:"type";s:8:"Textarea";s:7:"options";s:2:"10";s:7:"default";s:0:"";s:8:"required";s:1:"N";}i:8;a:6:{s:4:"name";s:8:"Subjects";s:11:"description";s:33:"Comma separated list of subjects.";s:4:"type";s:8:"Textarea";s:7:"options";s:1:"2";s:7:"default";s:0:"";s:8:"required";s:1:"N";}i:9;a:6:{s:4:"name";s:10:"Collection";s:11:"description";s:0:"";s:4:"type";s:6:"Select";s:7:"options";s:230:",Fiction, Fiction - Best Sellers, Fiction - Classics, Fiction - Mystery, Fiction - Series, Fiction - Young Adult, Nonfiction, Nonfiction - College Prep, Nonfiction - Graphic Novels, Nonfiction - Life Skills, Nonfiction - Reference";s:7:"default";s:0:"";s:8:"required";s:1:"N";}i:10;a:6:{s:4:"name";s:14:"Control Number";s:11:"description";s:0:"";s:4:"type";s:4:"Text";s:7:"options";s:3:"255";s:7:"default";s:0:"";s:8:"required";s:1:"N";}i:11;a:6:{s:4:"name";s:20:"Cataloging Authority";s:11:"description";s:37:"Issuing authority for Control Number.";s:4:"type";s:4:"Text";s:7:"options";s:3:"255";s:7:"default";s:0:"";s:8:"required";s:1:"N";}i:12;a:6:{s:4:"name";s:21:"Reader Age (Youngest)";s:11:"description";s:50:"Age in years, youngest reading age recommendation.";s:4:"type";s:4:"Text";s:7:"options";s:1:"3";s:7:"default";s:0:"";s:8:"required";s:1:"N";}i:13;a:6:{s:4:"name";s:19:"Reader Age (Oldest)";s:11:"description";s:48:"Age in years, oldest reading age recommendation.";s:4:"type";s:4:"Text";s:7:"options";s:1:"3";s:7:"default";s:0:"";s:8:"required";s:1:"N";}i:14;a:6:{s:4:"name";s:10:"Page Count";s:11:"description";s:34:"The number of pages in the volume.";s:4:"type";s:4:"Text";s:7:"options";s:1:"4";s:7:"default";s:0:"";s:8:"required";s:1:"N";}i:15;a:6:{s:4:"name";s:6:"Height";s:11:"description";s:41:"The physical height of the volume, in cm.";s:4:"type";s:4:"Text";s:7:"options";s:1:"6";s:7:"default";s:0:"";s:8:"required";s:1:"N";}i:16;a:6:{s:4:"name";s:5:"Width";s:11:"description";s:40:"The physical width of the volume, in cm.";s:4:"type";s:4:"Text";s:7:"options";s:1:"6";s:7:"default";s:0:"";s:8:"required";s:1:"N";}i:17;a:6:{s:4:"name";s:9:"Thickness";s:11:"description";s:44:"The physical thickness of the volume, in cm.";s:4:"type";s:4:"Text";s:7:"options";s:1:"6";s:7:"default";s:0:"";s:8:"required";s:1:"N";}i:18;a:6:{s:4:"name";s:8:"Language";s:11:"description";s:35:"The primary language of the volume.";s:4:"type";s:4:"Text";s:7:"options";s:2:"50";s:7:"default";s:0:"";s:8:"required";s:1:"N";}i:19;a:6:{s:4:"name";s:4:"Link";s:11:"description";s:44:"Link to web-based information on the volume.";s:4:"type";s:3:"URL";s:7:"options";s:3:"255";s:7:"default";s:0:"";s:8:"required";s:1:"N";}}'),
	(00007, 'Computer', 'Y', 'a:17:{i:0;a:6:{s:4:"name";s:11:"Form Factor";s:11:"description";s:0:"";s:4:"type";s:6:"Select";s:7:"options";s:50:"Desktop, Laptop, Tablet, Phone, Set-Top Box, Other";s:7:"default";s:6:"Laptop";s:8:"required";s:1:"Y";}i:1;a:6:{s:4:"name";s:16:"Operating System";s:11:"description";s:0:"";s:4:"type";s:4:"Text";s:7:"options";s:2:"50";s:7:"default";s:0:"";s:8:"required";s:1:"N";}i:2;a:6:{s:4:"name";s:13:"Serial Number";s:11:"description";s:0:"";s:4:"type";s:4:"Text";s:7:"options";s:2:"50";s:7:"default";s:0:"";s:8:"required";s:1:"N";}i:3;a:6:{s:4:"name";s:10:"Model Name";s:11:"description";s:0:"";s:4:"type";s:4:"Text";s:7:"options";s:2:"50";s:7:"default";s:0:"";s:8:"required";s:1:"N";}i:4;a:6:{s:4:"name";s:8:"Model ID";s:11:"description";s:0:"";s:4:"type";s:4:"Text";s:7:"options";s:2:"50";s:7:"default";s:0:"";s:8:"required";s:1:"N";}i:5;a:6:{s:4:"name";s:8:"CPU Type";s:11:"description";s:0:"";s:4:"type";s:4:"Text";s:7:"options";s:2:"50";s:7:"default";s:0:"";s:8:"required";s:1:"N";}i:6;a:6:{s:4:"name";s:9:"CPU Speed";s:11:"description";s:7:"In GHz.";s:4:"type";s:4:"Text";s:7:"options";s:1:"6";s:7:"default";s:0:"";s:8:"required";s:1:"N";}i:7;a:6:{s:4:"name";s:6:"Memory";s:11:"description";s:17:"Total RAM, in GB.";s:4:"type";s:4:"Text";s:7:"options";s:1:"6";s:7:"default";s:0:"";s:8:"required";s:1:"N";}i:8;a:6:{s:4:"name";s:12:"Storage Type";s:11:"description";s:30:"Primary internal storage type.";s:4:"type";s:6:"Select";s:7:"options";s:24:",HDD, SSD, Hybrid, Other";s:7:"default";s:0:"";s:8:"required";s:1:"N";}i:9;a:6:{s:4:"name";s:7:"Storage";s:11:"description";s:30:"Total HDD/SDD capacity, in GB.";s:4:"type";s:4:"Text";s:7:"options";s:1:"6";s:7:"default";s:0:"";s:8:"required";s:1:"N";}i:10;a:6:{s:4:"name";s:20:"Wireless MAC Address";s:11:"description";s:0:"";s:4:"type";s:4:"Text";s:7:"options";s:2:"17";s:7:"default";s:0:"";s:8:"required";s:1:"N";}i:11;a:6:{s:4:"name";s:17:"Wired MAC Address";s:11:"description";s:0:"";s:4:"type";s:4:"Text";s:7:"options";s:2:"17";s:7:"default";s:0:"";s:8:"required";s:1:"N";}i:12;a:6:{s:4:"name";s:11:"Accessories";s:11:"description";s:43:"Any chargers, display dongles, remotes etc?";s:4:"type";s:4:"Text";s:7:"options";s:3:"255";s:7:"default";s:0:"";s:8:"required";s:1:"N";}i:13;a:6:{s:4:"name";s:15:"Warranty Number";s:11:"description";s:0:"";s:4:"type";s:4:"Text";s:7:"options";s:2:"50";s:7:"default";s:0:"";s:8:"required";s:1:"N";}i:14;a:6:{s:4:"name";s:15:"Warranty Expiry";s:11:"description";s:19:"Format: dd/mm/yyyy.";s:4:"type";s:4:"Date";s:7:"options";s:0:"";s:7:"default";s:0:"";s:8:"required";s:1:"N";}i:15;a:6:{s:4:"name";s:19:"Last Reinstall Date";s:11:"description";s:19:"Format: dd/mm/yyyy.";s:4:"type";s:4:"Date";s:7:"options";s:0:"";s:7:"default";s:0:"";s:8:"required";s:1:"N";}i:16;a:6:{s:4:"name";s:16:"Repair Log/Notes";s:11:"description";s:0:"";s:4:"type";s:8:"Textarea";s:7:"options";s:2:"10";s:7:"default";s:0:"";s:8:"required";s:1:"N";}}'),
	(00008, 'Electronics', 'Y', 'a:8:{i:0;a:6:{s:4:"name";s:4:"Type";s:11:"description";s:29:"What kind of product is this?";s:4:"type";s:4:"Text";s:7:"options";s:2:"50";s:7:"default";s:0:"";s:8:"required";s:1:"Y";}i:1;a:6:{s:4:"name";s:13:"Serial Number";s:11:"description";s:0:"";s:4:"type";s:4:"Text";s:7:"options";s:2:"50";s:7:"default";s:0:"";s:8:"required";s:1:"N";}i:2;a:6:{s:4:"name";s:10:"Model Name";s:11:"description";s:0:"";s:4:"type";s:4:"Text";s:7:"options";s:2:"50";s:7:"default";s:0:"";s:8:"required";s:1:"N";}i:3;a:6:{s:4:"name";s:8:"Model ID";s:11:"description";s:0:"";s:4:"type";s:4:"Text";s:7:"options";s:2:"50";s:7:"default";s:0:"";s:8:"required";s:1:"N";}i:4;a:6:{s:4:"name";s:11:"Accessories";s:11:"description";s:36:"Any chargers, remotes controls, etc?";s:4:"type";s:4:"Text";s:7:"options";s:3:"255";s:7:"default";s:0:"";s:8:"required";s:1:"N";}i:5;a:6:{s:4:"name";s:15:"Warranty Number";s:11:"description";s:0:"";s:4:"type";s:4:"Text";s:7:"options";s:2:"50";s:7:"default";s:0:"";s:8:"required";s:1:"N";}i:6;a:6:{s:4:"name";s:15:"Warranty Expiry";s:11:"description";s:19:"Format: dd/mm/yyyy.";s:4:"type";s:4:"Date";s:7:"options";s:0:"";s:7:"default";s:0:"";s:8:"required";s:1:"N";}i:7;a:6:{s:4:"name";s:16:"Repair Log/Notes";s:11:"description";s:0:"";s:4:"type";s:8:"Textarea";s:7:"options";s:2:"10";s:7:"default";s:0:"";s:8:"required";s:1:"N";}}'),
	(00009, 'Other', 'Y', 'a:1:{i:0;a:6:{s:4:"name";s:4:"Type";s:11:"description";s:29:"What kind of product is this?";s:4:"type";s:4:"Text";s:7:"options";s:2:"50";s:7:"default";s:0:"";s:8:"required";s:1:"Y";}}'),
	(00010, 'Software', 'Y', 'a:7:{i:0;a:6:{s:4:"name";s:7:"Version";s:11:"description";s:0:"";s:4:"type";s:4:"Text";s:7:"options";s:2:"50";s:7:"default";s:0:"";s:8:"required";s:1:"N";}i:1;a:6:{s:4:"name";s:16:"Operating System";s:11:"description";s:0:"";s:4:"type";s:4:"Text";s:7:"options";s:2:"50";s:7:"default";s:0:"";s:8:"required";s:1:"N";}i:2;a:6:{s:4:"name";s:12:"License Type";s:11:"description";s:48:"E.g. Open Source, Site License, number of users.";s:4:"type";s:4:"Text";s:7:"options";s:3:"255";s:7:"default";s:0:"";s:8:"required";s:1:"N";}i:3;a:6:{s:4:"name";s:12:"License Name";s:11:"description";s:55:"If the software is registered, who is it registered to?";s:4:"type";s:4:"Text";s:7:"options";s:3:"255";s:7:"default";s:0:"";s:8:"required";s:1:"N";}i:4;a:6:{s:4:"name";s:21:"License Serial Number";s:11:"description";s:0:"";s:4:"type";s:4:"Text";s:7:"options";s:3:"255";s:7:"default";s:0:"";s:8:"required";s:1:"N";}i:5;a:6:{s:4:"name";s:14:"License Expiry";s:11:"description";s:19:"Format: dd/mm/yyyy.";s:4:"type";s:4:"Date";s:7:"options";s:0:"";s:7:"default";s:0:"";s:8:"required";s:1:"N";}i:6;a:6:{s:4:"name";s:23:"License Management Link";s:11:"description";s:34:"Link to web-based management tool.";s:4:"type";s:3:"URL";s:7:"options";s:3:"255";s:7:"default";s:0:"";s:8:"required";s:1:"N";}}'),
	(00011, 'Audio/Visual Hardware', 'Y', 'a:8:{i:0;a:6:{s:4:"name";s:4:"Type";s:11:"description";s:29:"What kind of product is this?";s:4:"type";s:4:"Text";s:7:"options";s:2:"50";s:7:"default";s:0:"";s:8:"required";s:1:"Y";}i:1;a:6:{s:4:"name";s:13:"Serial Number";s:11:"description";s:0:"";s:4:"type";s:4:"Text";s:7:"options";s:2:"50";s:7:"default";s:0:"";s:8:"required";s:1:"N";}i:2;a:6:{s:4:"name";s:10:"Model Name";s:11:"description";s:0:"";s:4:"type";s:4:"Text";s:7:"options";s:2:"50";s:7:"default";s:0:"";s:8:"required";s:1:"N";}i:3;a:6:{s:4:"name";s:8:"Model ID";s:11:"description";s:0:"";s:4:"type";s:4:"Text";s:7:"options";s:2:"50";s:7:"default";s:0:"";s:8:"required";s:1:"N";}i:4;a:6:{s:4:"name";s:11:"Accessories";s:11:"description";s:36:"Any chargers, remotes controls, etc?";s:4:"type";s:4:"Text";s:7:"options";s:3:"255";s:7:"default";s:0:"";s:8:"required";s:1:"N";}i:5;a:6:{s:4:"name";s:15:"Warranty Number";s:11:"description";s:0:"";s:4:"type";s:4:"Text";s:7:"options";s:2:"50";s:7:"default";s:0:"";s:8:"required";s:1:"N";}i:6;a:6:{s:4:"name";s:15:"Warranty Expiry";s:11:"description";s:19:"Format: dd/mm/yyyy.";s:4:"type";s:4:"Date";s:7:"options";s:0:"";s:7:"default";s:0:"";s:8:"required";s:1:"N";}i:7;a:6:{s:4:"name";s:16:"Repair Log/Notes";s:11:"description";s:0:"";s:4:"type";s:8:"Textarea";s:7:"options";s:2:"10";s:7:"default";s:0:"";s:8:"required";s:1:"N";}}'),
	(00012, 'Optical Media', 'Y', 'a:10:{i:0;a:6:{s:4:"name";s:4:"Type";s:11:"description";s:35:"What type of optical media is this?";s:4:"type";s:6:"Select";s:7:"options";s:14:"CD,DVD,Blu-Ray";s:7:"default";s:0:"";s:8:"required";s:1:"Y";}i:1;a:6:{s:4:"name";s:6:"Format";s:11:"description";s:38:"Technical details of media formatting.";s:4:"type";s:4:"Text";s:7:"options";s:3:"255";s:7:"default";s:0:"";s:8:"required";s:1:"N";}i:2;a:6:{s:4:"name";s:8:"Language";s:11:"description";s:0:"";s:4:"type";s:4:"Text";s:7:"options";s:3:"255";s:7:"default";s:0:"";s:8:"required";s:1:"N";}i:3;a:6:{s:4:"name";s:9:"Subtitles";s:11:"description";s:0:"";s:4:"type";s:4:"Text";s:7:"options";s:3:"255";s:7:"default";s:0:"";s:8:"required";s:1:"N";}i:4;a:6:{s:4:"name";s:12:"Aspect Ratio";s:11:"description";s:0:"";s:4:"type";s:4:"Text";s:7:"options";s:2:"20";s:7:"default";s:0:"";s:8:"required";s:1:"N";}i:5;a:6:{s:4:"name";s:15:"Number of Discs";s:11:"description";s:0:"";s:4:"type";s:6:"Select";s:7:"options";s:10:",1,2,3,4,5";s:7:"default";s:0:"";s:8:"required";s:1:"N";}i:6;a:6:{s:4:"name";s:14:"Content Rating";s:11:"description";s:39:"Details of age guidance or retrictions.";s:4:"type";s:4:"Text";s:7:"options";s:3:"255";s:7:"default";s:0:"";s:8:"required";s:1:"N";}i:7;a:6:{s:4:"name";s:6:"Studio";s:11:"description";s:27:"Name of originating studio.";s:4:"type";s:4:"Text";s:7:"options";s:3:"255";s:7:"default";s:0:"";s:8:"required";s:1:"N";}i:8;a:6:{s:4:"name";s:12:"Release Date";s:11:"description";s:36:"Format: dd/mm/yyyy, mm/yyyy or yyyy.";s:4:"type";s:4:"Text";s:7:"options";s:2:"10";s:7:"default";s:0:"";s:8:"required";s:1:"N";}i:9;a:6:{s:4:"name";s:8:"Run Time";s:11:"description";s:11:"In minutes.";s:4:"type";s:4:"Text";s:7:"options";s:1:"3";s:7:"default";s:0:"";s:8:"required";s:1:"N";}}');
/*!40000 ALTER TABLE `gibbonlibrarytype` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibbonlog
CREATE TABLE IF NOT EXISTS `gibbonlog` (
  `gibbonLogID` int(16) unsigned zerofill NOT NULL,
  `gibbonModuleID` int(4) unsigned zerofill DEFAULT NULL,
  `gibbonPersonID` int(10) unsigned zerofill DEFAULT NULL,
  `gibbonSchoolYearID` int(3) unsigned zerofill NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `title` varchar(50) NOT NULL,
  `serialisedArray` text,
  `ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`gibbonLogID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibbonlog: ~12 rows (approximately)
/*!40000 ALTER TABLE `gibbonlog` DISABLE KEYS */;
INSERT INTO `gibbonlog` (`gibbonLogID`, `gibbonModuleID`, `gibbonPersonID`, `gibbonSchoolYearID`, `timestamp`, `title`, `serialisedArray`, `ip`) VALUES
	(0000000000000001, NULL, 0000000001, 025, '2020-07-12 14:49:46', 'Login - Success', 'a:1:{s:8:"username";s:7:"bidyaan";}', '::1'),
	(0000000000000002, NULL, 0000000001, 025, '2020-07-12 16:38:25', 'Login - Success', 'a:1:{s:8:"username";s:7:"bidyaan";}', '::1'),
	(0000000000000003, NULL, 0000000001, 025, '2020-07-15 16:24:23', 'Login - Success', 'a:1:{s:8:"username";s:7:"bidyaan";}', '::1'),
	(0000000000000004, NULL, 0000000001, 025, '2020-07-15 17:43:32', 'Login - Success', 'a:1:{s:8:"username";s:7:"bidyaan";}', '::1'),
	(0000000000000005, NULL, 0000000001, 025, '2020-07-15 18:25:23', 'Login - Success', 'a:1:{s:8:"username";s:7:"bidyaan";}', '::1'),
	(0000000000000006, NULL, 0000000001, 025, '2020-07-15 18:51:03', 'Login - Success', 'a:1:{s:8:"username";s:7:"bidyaan";}', '::1'),
	(0000000000000007, NULL, 0000000001, 025, '2020-07-16 04:22:26', 'Login - Success', 'a:1:{s:8:"username";s:7:"bidyaan";}', '::1'),
	(0000000000000008, NULL, 0000000001, 025, '2020-07-16 09:32:58', 'Login - Success', 'a:1:{s:8:"username";s:7:"bidyaan";}', '::1'),
	(0000000000000009, NULL, 0000000001, 025, '2020-07-19 06:30:12', 'Login - Success', 'a:1:{s:8:"username";s:7:"bidyaan";}', '::1'),
	(0000000000000010, NULL, 0000000001, 025, '2020-07-19 07:37:43', 'Login - Success', 'a:1:{s:8:"username";s:7:"bidyaan";}', '::1'),
	(0000000000000011, NULL, 0000000001, 025, '2020-07-29 08:21:47', 'Login - Success', 'a:1:{s:8:"username";s:7:"bidyaan";}', '::1'),
	(0000000000000012, NULL, 0000000001, 025, '2020-08-20 11:33:53', 'Login - Success', 'a:1:{s:8:"username";s:7:"bidyaan";}', '::1');
/*!40000 ALTER TABLE `gibbonlog` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibbonmarkbookcolumn
CREATE TABLE IF NOT EXISTS `gibbonmarkbookcolumn` (
  `gibbonMarkbookColumnID` int(10) unsigned zerofill NOT NULL,
  `gibbonCourseClassID` int(8) unsigned zerofill NOT NULL,
  `gibbonHookID` int(4) unsigned zerofill DEFAULT NULL,
  `gibbonUnitID` int(10) unsigned zerofill DEFAULT NULL,
  `gibbonPlannerEntryID` int(14) unsigned zerofill DEFAULT NULL,
  `gibbonSchoolYearTermID` int(5) unsigned zerofill DEFAULT NULL,
  `groupingID` int(8) unsigned zerofill DEFAULT NULL COMMENT 'A value used to group multiple markbook columns.',
  `type` varchar(50) NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` text NOT NULL,
  `date` date DEFAULT NULL,
  `sequenceNumber` int(3) unsigned NOT NULL DEFAULT '0',
  `attachment` varchar(255) NOT NULL,
  `attainment` enum('Y','N') NOT NULL DEFAULT 'Y',
  `gibbonScaleIDAttainment` int(5) unsigned zerofill DEFAULT NULL,
  `attainmentWeighting` decimal(5,2) DEFAULT NULL,
  `attainmentRaw` enum('Y','N') NOT NULL DEFAULT 'N',
  `attainmentRawMax` decimal(8,2) DEFAULT NULL,
  `effort` enum('Y','N') NOT NULL DEFAULT 'Y',
  `gibbonScaleIDEffort` int(5) unsigned zerofill DEFAULT NULL,
  `gibbonRubricIDAttainment` int(8) unsigned zerofill DEFAULT NULL,
  `gibbonRubricIDEffort` int(8) unsigned zerofill DEFAULT NULL,
  `comment` enum('Y','N') NOT NULL DEFAULT 'Y',
  `uploadedResponse` enum('Y','N') NOT NULL DEFAULT 'Y',
  `complete` enum('N','Y') NOT NULL,
  `completeDate` date DEFAULT NULL,
  `viewableStudents` enum('N','Y') NOT NULL,
  `viewableParents` enum('N','Y') NOT NULL,
  `gibbonPersonIDCreator` int(10) unsigned zerofill NOT NULL,
  `gibbonPersonIDLastEdit` int(10) unsigned zerofill NOT NULL,
  PRIMARY KEY (`gibbonMarkbookColumnID`),
  KEY `gibbonCourseClassID` (`gibbonCourseClassID`),
  KEY `completeDate` (`completeDate`),
  KEY `complete` (`complete`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibbonmarkbookcolumn: ~0 rows (approximately)
/*!40000 ALTER TABLE `gibbonmarkbookcolumn` DISABLE KEYS */;
/*!40000 ALTER TABLE `gibbonmarkbookcolumn` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibbonmarkbookentry
CREATE TABLE IF NOT EXISTS `gibbonmarkbookentry` (
  `gibbonMarkbookEntryID` int(12) unsigned zerofill NOT NULL,
  `gibbonMarkbookColumnID` int(10) unsigned zerofill NOT NULL,
  `gibbonPersonIDStudent` int(10) unsigned zerofill NOT NULL,
  `modifiedAssessment` enum('N','Y') DEFAULT NULL,
  `attainmentValue` varchar(10) DEFAULT NULL,
  `attainmentValueRaw` varchar(10) DEFAULT NULL,
  `attainmentDescriptor` varchar(100) DEFAULT NULL,
  `attainmentConcern` enum('N','Y','P') DEFAULT NULL COMMENT '''P'' denotes that student has exceed their personal target',
  `effortValue` varchar(10) DEFAULT NULL,
  `effortDescriptor` varchar(100) DEFAULT NULL,
  `effortConcern` enum('N','Y') DEFAULT NULL,
  `comment` text,
  `response` varchar(255) DEFAULT NULL,
  `gibbonPersonIDLastEdit` int(10) unsigned zerofill NOT NULL,
  PRIMARY KEY (`gibbonMarkbookEntryID`),
  KEY `gibbonPersonIDStudent` (`gibbonPersonIDStudent`),
  KEY `gibbonMarkbookColumnID` (`gibbonMarkbookColumnID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibbonmarkbookentry: ~0 rows (approximately)
/*!40000 ALTER TABLE `gibbonmarkbookentry` DISABLE KEYS */;
/*!40000 ALTER TABLE `gibbonmarkbookentry` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibbonmarkbooktarget
CREATE TABLE IF NOT EXISTS `gibbonmarkbooktarget` (
  `gibbonMarkbookTargetID` int(14) unsigned zerofill NOT NULL,
  `gibbonCourseClassID` int(8) unsigned zerofill NOT NULL,
  `gibbonPersonIDStudent` int(10) unsigned zerofill NOT NULL,
  `gibbonScaleGradeID` int(7) unsigned zerofill DEFAULT NULL,
  PRIMARY KEY (`gibbonMarkbookTargetID`),
  UNIQUE KEY `coursePerson` (`gibbonCourseClassID`,`gibbonPersonIDStudent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibbonmarkbooktarget: ~0 rows (approximately)
/*!40000 ALTER TABLE `gibbonmarkbooktarget` DISABLE KEYS */;
/*!40000 ALTER TABLE `gibbonmarkbooktarget` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibbonmedicalcondition
CREATE TABLE IF NOT EXISTS `gibbonmedicalcondition` (
  `gibbonMedicalConditionID` int(4) unsigned zerofill NOT NULL,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`gibbonMedicalConditionID`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibbonmedicalcondition: ~27 rows (approximately)
/*!40000 ALTER TABLE `gibbonmedicalcondition` DISABLE KEYS */;
INSERT INTO `gibbonmedicalcondition` (`gibbonMedicalConditionID`, `name`) VALUES
	(0004, 'Allergy - Animal'),
	(0003, 'Allergy - Drug'),
	(0001, 'Allergy - Food'),
	(0005, 'Allergy - Grass/Pollen'),
	(0002, 'Allergy - Insect'),
	(0006, 'Allergy - Other'),
	(0007, 'Asthma'),
	(0012, 'Convulsions/Epilepsy'),
	(0010, 'Diabetes'),
	(0018, 'Dizziness or Fainting spells'),
	(0020, 'Frequent Nose Bleeds'),
	(0008, 'G6PD Deficiency'),
	(0022, 'Hearing Impairment'),
	(0015, 'Heart Condition'),
	(0011, 'Hypertension'),
	(0009, 'Joint Problems'),
	(0013, 'Kidney Disease'),
	(0027, 'Other'),
	(0016, 'Previous Concussion or Head Injury'),
	(0017, 'Previous Serious Injury'),
	(0021, 'Psychological Condition'),
	(0014, 'Rare Blood Type'),
	(0019, 'Rheumatic Fever'),
	(0026, 'Travel Sickness'),
	(0023, 'Visual Impairment'),
	(0025, 'Visual Impairment - Colour Blindness'),
	(0024, 'Visual Impairment - Requiring Contact Lenses or Glasses');
/*!40000 ALTER TABLE `gibbonmedicalcondition` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibbonmessenger
CREATE TABLE IF NOT EXISTS `gibbonmessenger` (
  `gibbonMessengerID` int(12) unsigned zerofill NOT NULL,
  `email` enum('N','Y') NOT NULL DEFAULT 'N',
  `messageWall` enum('N','Y') NOT NULL DEFAULT 'N',
  `messageWallPin` enum('N','Y') NOT NULL DEFAULT 'N',
  `messageWall_date1` date DEFAULT NULL,
  `messageWall_date2` date DEFAULT NULL,
  `messageWall_date3` date DEFAULT NULL,
  `sms` enum('N','Y') NOT NULL DEFAULT 'N',
  `subject` varchar(60) NOT NULL,
  `body` text NOT NULL,
  `gibbonPersonID` int(10) unsigned zerofill NOT NULL,
  `timestamp` timestamp NULL DEFAULT NULL,
  `emailReport` text NOT NULL,
  `emailReceipt` enum('N','Y') DEFAULT NULL,
  `emailReceiptText` text,
  `smsReport` text NOT NULL,
  PRIMARY KEY (`gibbonMessengerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibbonmessenger: ~0 rows (approximately)
/*!40000 ALTER TABLE `gibbonmessenger` DISABLE KEYS */;
/*!40000 ALTER TABLE `gibbonmessenger` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibbonmessengercannedresponse
CREATE TABLE IF NOT EXISTS `gibbonmessengercannedresponse` (
  `gibbonMessengerCannedResponseID` int(10) unsigned zerofill NOT NULL,
  `subject` varchar(30) NOT NULL,
  `body` text NOT NULL,
  `timestampCreator` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gibbonPersonIDCreator` int(10) unsigned zerofill NOT NULL,
  PRIMARY KEY (`gibbonMessengerCannedResponseID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibbonmessengercannedresponse: ~0 rows (approximately)
/*!40000 ALTER TABLE `gibbonmessengercannedresponse` DISABLE KEYS */;
/*!40000 ALTER TABLE `gibbonmessengercannedresponse` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibbonmessengerreceipt
CREATE TABLE IF NOT EXISTS `gibbonmessengerreceipt` (
  `gibbonMessengerReceiptID` int(14) unsigned zerofill NOT NULL,
  `gibbonMessengerID` int(12) unsigned zerofill NOT NULL,
  `gibbonPersonID` int(10) unsigned zerofill DEFAULT NULL,
  `targetType` enum('Class','Course','Roll Group','Year Group','Activity','Role','Applicants','Individuals','Houses','Role Category','Transport','Attendance','Group') COLLATE utf8_unicode_ci NOT NULL,
  `targetID` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `contactType` enum('Email','SMS') COLLATE utf8_unicode_ci DEFAULT NULL,
  `contactDetail` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `key` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `confirmed` enum('N','Y') COLLATE utf8_unicode_ci DEFAULT NULL,
  `confirmedTimestamp` timestamp NULL DEFAULT NULL,
  `gibbonPersonIDListStudent` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`gibbonMessengerReceiptID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table bidyaan_fakmsc.gibbonmessengerreceipt: ~0 rows (approximately)
/*!40000 ALTER TABLE `gibbonmessengerreceipt` DISABLE KEYS */;
/*!40000 ALTER TABLE `gibbonmessengerreceipt` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibbonmessengertarget
CREATE TABLE IF NOT EXISTS `gibbonmessengertarget` (
  `gibbonMessengerTargetID` int(14) unsigned zerofill NOT NULL,
  `gibbonMessengerID` int(12) unsigned zerofill NOT NULL,
  `type` enum('Class','Course','Roll Group','Year Group','Activity','Role','Applicants','Individuals','Houses','Role Category','Transport','Attendance','Group') DEFAULT NULL,
  `id` varchar(30) NOT NULL,
  `parents` enum('N','Y') NOT NULL DEFAULT 'N',
  `students` enum('N','Y') NOT NULL DEFAULT 'N',
  `staff` enum('N','Y') NOT NULL DEFAULT 'N',
  PRIMARY KEY (`gibbonMessengerTargetID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibbonmessengertarget: ~0 rows (approximately)
/*!40000 ALTER TABLE `gibbonmessengertarget` DISABLE KEYS */;
/*!40000 ALTER TABLE `gibbonmessengertarget` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibbonmodule
CREATE TABLE IF NOT EXISTS `gibbonmodule` (
  `gibbonModuleID` int(4) unsigned zerofill NOT NULL COMMENT 'This number is assigned at install, and is only unique to the installation',
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT 'This name should be globally unique preferably, but certainly locally unique',
  `description` text NOT NULL,
  `entryURL` varchar(255) NOT NULL DEFAULT 'index.php',
  `type` enum('Core','Additional') NOT NULL DEFAULT 'Core',
  `active` enum('Y','N') NOT NULL DEFAULT 'Y',
  `category` varchar(10) NOT NULL,
  `version` varchar(6) NOT NULL,
  `author` varchar(40) NOT NULL,
  `url` varchar(255) NOT NULL,
  PRIMARY KEY (`gibbonModuleID`),
  UNIQUE KEY `gibbonModuleName` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibbonmodule: ~24 rows (approximately)
/*!40000 ALTER TABLE `gibbonmodule` DISABLE KEYS */;
INSERT INTO `gibbonmodule` (`gibbonModuleID`, `name`, `description`, `entryURL`, `type`, `active`, `category`, `version`, `author`, `url`) VALUES
	(0001, 'School Admin', 'Allows administrators to configure school settings.', 'schoolYear_manage.php', 'Core', 'Y', 'Admin', '', 'Ross Parker', 'http://rossparker.org'),
	(0002, 'User Admin', 'Allows administrators to manage users.', 'user_manage.php', 'Core', 'Y', 'Admin', '', 'Ross Parker', 'http://rossparker.org'),
	(0003, 'System Admin', 'Allows administrators to configure system settings.', 'systemSettings.php', 'Core', 'Y', 'Admin', '', 'Ross Parker', 'http://rossparker.org'),
	(0004, 'Departments', 'View details within a department', 'departments.php', 'Core', 'Y', 'Learn', '', 'Ross Parker', 'http://rossparker.org'),
	(0005, 'Students', 'Allows users to view student data', 'student_view.php', 'Core', 'Y', 'People', '', 'Ross Parker', 'http://rossparker.org'),
	(0006, 'Attendance', 'School attendance taking', 'attendance.php', 'Core', 'Y', 'People', '', 'Ross Parker', 'http://rossparker.org'),
	(0007, 'Markbook', 'A system for keeping track of marks', 'markbook_view.php', 'Core', 'Y', 'Assess', '', 'Ross Parker', 'http://rossparker.org'),
	(0008, 'Data Updater', 'Allow users to update their family\'s data', 'data_updates.php', 'Core', 'Y', 'People', '', 'Ross Parker', 'http://rossparker.org'),
	(0009, 'Planner', 'Supports lesson planning and information sharing for staff, student and parents', 'planner.php', 'Core', 'Y', 'Learn', '', 'Ross Parker', 'http://rossparker.org'),
	(0011, 'Individual Needs', 'Individual Needs', 'in_view.php', 'Core', 'Y', 'Learn', '', 'Ross Parker', 'http://rossparker.org'),
	(0012, 'Crowd Assessment', 'Allows users to assess each other\'s work', 'crowdAssess.php', 'Core', 'Y', 'Assess', '', 'Ross Parker', 'http://rossparker.org'),
	(0013, 'Timetable Admin', 'Timetable administration', 'tt.php', 'Core', 'Y', 'Admin', '', 'Ross Parker', 'http://rossparker.org'),
	(0014, 'Timetable', 'Allows users to view timetables', 'tt.php', 'Core', 'Y', 'Learn', '', 'Ross Parker', 'http://rossparker.org'),
	(0015, 'Activities', 'Run a school activities program', 'activities_view.php', 'Core', 'Y', 'Learn', '', 'Ross Parker', 'http://rossparker.org'),
	(0016, 'Formal Assessment', 'Facilitates tracking of student performance in external examinations.', 'externalAssessment.php', 'Core', 'Y', 'Assess', '', 'Ross Parker', 'http://rossparker.org'),
	(0119, 'Behaviour', 'Tracking Student Behaviour', 'behaviour_manage.php', 'Core', 'Y', 'People', '', 'Ross Parker', 'http://rossparker.org'),
	(0121, 'Messenger', 'Unified messenger for email, message wall and more.', 'messenger_manage.php', 'Core', 'Y', 'Other', '', 'Ross Parker', 'http://rossparker.org'),
	(0126, 'Rubrics', 'Allows users to create rubrics for assessment', 'rubrics.php', 'Core', 'Y', 'Assess', '', 'Ross Parker', 'http://rossparker.org'),
	(0130, 'Library', 'Allows the management of a catalog from which items can be borrowed.', 'library_manage_catalog.php', 'Core', 'Y', 'Learn', '', 'Ross Parker', 'http://rossparker.org'),
	(0135, 'Finance', 'Allows a school to issue invoices and track payments.', 'invoices_manage.php', 'Core', 'Y', 'Other', '', 'Ross Parker', 'http://rossparker.org'),
	(0136, 'Staff', 'Allows users to view staff information', 'staff_view.php', 'Core', 'Y', 'People', '', 'Ross Parker', 'http://rossparker.org'),
	(0137, 'Roll Groups', 'Allows users to view a listing of roll groups', 'rollGroups.php', 'Core', 'Y', 'People', '', 'Ross Parker', 'http://rossparker.org'),
	(0141, 'Tracking', 'Provides visual graphing of student progress, as recorded in the Markbook and Internal Assessment.', 'graphing.php', 'Core', 'Y', 'Assess', '', 'Ross Parker', 'https://rossparker.org'),
	(0144, 'Reports', 'Report writing and PDF generation', 'reporting_my.php', 'Core', 'Y', 'Assess', 'v19.0.', 'Sandra Kuipers', 'https://github.com/SKuipers');
/*!40000 ALTER TABLE `gibbonmodule` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibbonmrkbookweight
CREATE TABLE IF NOT EXISTS `gibbonmrkbookweight` (
  `gibbonMarkbookWeightID` int(10) unsigned zerofill NOT NULL,
  `gibbonCourseClassID` int(8) unsigned zerofill NOT NULL,
  `type` varchar(50) NOT NULL,
  `description` varchar(50) NOT NULL,
  `reportable` enum('Y','N') NOT NULL DEFAULT 'Y',
  `calculate` enum('term','year') NOT NULL DEFAULT 'year',
  `weighting` decimal(5,2) NOT NULL,
  PRIMARY KEY (`gibbonMarkbookWeightID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibbonmrkbookweight: ~0 rows (approximately)
/*!40000 ALTER TABLE `gibbonmrkbookweight` DISABLE KEYS */;
/*!40000 ALTER TABLE `gibbonmrkbookweight` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibbonnotification
CREATE TABLE IF NOT EXISTS `gibbonnotification` (
  `gibbonNotificationID` int(10) unsigned zerofill NOT NULL,
  `gibbonPersonID` int(10) unsigned zerofill NOT NULL,
  `status` enum('New','Archived') NOT NULL DEFAULT 'New',
  `gibbonModuleID` int(4) unsigned zerofill DEFAULT NULL,
  `count` int(4) NOT NULL DEFAULT '1',
  `text` text NOT NULL,
  `actionLink` varchar(255) NOT NULL COMMENT 'Relative to absoluteURL, start with a forward slash',
  `timestamp` datetime NOT NULL,
  PRIMARY KEY (`gibbonNotificationID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibbonnotification: ~3 rows (approximately)
/*!40000 ALTER TABLE `gibbonnotification` DISABLE KEYS */;
INSERT INTO `gibbonnotification` (`gibbonNotificationID`, `gibbonPersonID`, `status`, `gibbonModuleID`, `count`, `text`, `actionLink`, `timestamp`) VALUES
	(0000000001, 0000000001, 'New', 0005, 1, 'An application form has been submitted for Karim Khan.', '/index.php?q=/modules/Students/applicationForm_manage_edit.php&gibbonApplicationFormID=0000001&gibbonSchoolYearID=025&search=', '2020-07-15 23:59:26'),
	(0000000002, 0000000001, 'New', 0005, 1, 'An application form for Karim Khan (Year 10) has been accepted for the 2020-2021 school year. Student could not be enroled, so this will have to be done manually at a later date.', '/index.php?q=/modules/Students/applicationForm_manage_edit.php&gibbonApplicationFormID=000000000001&gibbonSchoolYearID=025&search=', '2020-07-16 00:51:57'),
	(0000000003, 0000000001, 'New', 0005, 1, 'An application form has been submitted for Noyon Islam.', '/index.php?q=/modules/Students/applicationForm_manage_edit.php&gibbonApplicationFormID=0000310&gibbonSchoolYearID=025&search=', '2020-08-13 20:04:11');
/*!40000 ALTER TABLE `gibbonnotification` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibbonnotificationevent
CREATE TABLE IF NOT EXISTS `gibbonnotificationevent` (
  `gibbonNotificationEventID` int(6) unsigned zerofill NOT NULL,
  `event` varchar(90) NOT NULL,
  `moduleName` varchar(30) NOT NULL,
  `actionName` varchar(50) NOT NULL,
  `type` enum('Core','Additional','CLI') NOT NULL DEFAULT 'Core',
  `scopes` varchar(255) NOT NULL DEFAULT 'All',
  `active` enum('Y','N') NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`gibbonNotificationEventID`),
  UNIQUE KEY `event` (`event`,`moduleName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibbonnotificationevent: ~28 rows (approximately)
/*!40000 ALTER TABLE `gibbonnotificationevent` DISABLE KEYS */;
INSERT INTO `gibbonnotificationevent` (`gibbonNotificationEventID`, `event`, `moduleName`, `actionName`, `type`, `scopes`, `active`) VALUES
	(000001, 'Daily Behaviour Summary', 'Behaviour', 'Find Behaviour Patterns', 'CLI', 'All', 'Y'),
	(000002, 'New Negative Record', 'Behaviour', 'View Behaviour Records_all', 'Core', 'All,gibbonPersonIDStudent,gibbonYearGroupID', 'Y'),
	(000003, 'New Positive Record', 'Behaviour', 'View Behaviour Records_all', 'Core', 'All,gibbonPersonIDStudent,gibbonYearGroupID', 'Y'),
	(000004, 'Family Data Updates', 'Data Updater', 'Family Data Updates', 'Core', 'All', 'Y'),
	(000005, 'Finance Data Updates', 'Data Updater', 'Finance Data Updates', 'Core', 'All', 'Y'),
	(000006, 'Medical Form Updates', 'Data Updater', 'Medical Form Updates', 'Core', 'All', 'Y'),
	(000007, 'Personal Data Updates', 'Data Updater', 'Personal Data Updates', 'Core', 'All', 'Y'),
	(000008, 'Login - Failed', 'User Admin', 'Manage Users', 'Core', 'All', 'Y'),
	(000009, 'New Public Registration', 'User Admin', 'Manage Users', 'Core', 'All', 'Y'),
	(000010, 'New Application Form', 'Students', 'View Student Profile_full', 'Core', 'All', 'Y'),
	(000011, 'New Application Form', 'Staff', 'Manage Applications', 'Core', 'All', 'Y'),
	(000012, 'Student Withdrawn', 'Activities', 'Manage Activities', 'Core', 'All,gibbonPersonIDStudent,gibbonYearGroupID', 'Y'),
	(000013, 'New Activity Registration', 'Activities', 'Manage Activities', 'Core', 'All,gibbonPersonIDStudent,gibbonYearGroupID', 'Y'),
	(000014, 'Updated Individual Needs', 'Individual Needs', 'Individual Needs Records_viewEdit', 'Core', 'All,gibbonPersonIDStudent,gibbonYearGroupID', 'Y'),
	(000015, 'New Student Note', 'Students', 'View Student Profile_full', 'Core', 'All,gibbonPersonIDStudent,gibbonYearGroupID', 'Y'),
	(000016, 'Updated Privacy Settings', 'Students', 'View Student Profile_full', 'Core', 'All,gibbonPersonIDStudent,gibbonYearGroupID', 'Y'),
	(000017, 'Daily Attendance Summary', 'Attendance', 'Roll Groups Not Registered', 'CLI', 'All', 'Y'),
	(000018, 'User Status Check and Fix', 'User Admin', 'Manage Users', 'CLI', 'All', 'Y'),
	(000019, 'Overdue Loan Items', 'Library', 'Lending & Activity Log', 'CLI', 'All', 'Y'),
	(000020, 'Behaviour Letters', 'Behaviour', 'View Behaviour Records_all', 'CLI', 'All', 'Y'),
	(000021, 'Parent Weekly Email Summary', 'Planner', 'Parent Weekly Email Summary', 'CLI', 'All', 'Y'),
	(000022, 'Application Form Accepted', 'Students', 'View Student Profile_full', 'Core', 'All,gibbonYearGroupID', 'Y'),
	(000023, 'Weekly Attendance Summary', 'Attendance', 'Attendance Summary by Date', 'CLI', 'All,gibbonYearGroupID', 'Y'),
	(000024, 'Student Bumped', 'Activities', 'Manage Activities', 'Core', 'All', 'Y'),
	(000025, 'Updated Behaviour Record', 'Behaviour', 'View Behaviour Records_all', 'Core', 'All,gibbonPersonIDStudent,gibbonYearGroupID', 'Y'),
	(000026, 'Student Withdrawn', 'Students', 'View Student Profile_full', 'Core', 'All,gibbonYearGroupID', 'Y'),
	(000027, 'New Staff', 'Staff', 'Staff Directory_full', 'Core', 'All', 'Y'),
	(000028, 'Staff Left', 'Staff', 'Staff Directory_full', 'Core', 'All', 'Y');
/*!40000 ALTER TABLE `gibbonnotificationevent` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibbonnotificationlistener
CREATE TABLE IF NOT EXISTS `gibbonnotificationlistener` (
  `gibbonNotificationListenerID` int(10) unsigned zerofill NOT NULL,
  `gibbonNotificationEventID` int(6) unsigned zerofill DEFAULT NULL,
  `gibbonPersonID` int(10) unsigned zerofill DEFAULT NULL,
  `scopeType` varchar(30) DEFAULT NULL,
  `scopeID` int(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`gibbonNotificationListenerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibbonnotificationlistener: ~0 rows (approximately)
/*!40000 ALTER TABLE `gibbonnotificationlistener` DISABLE KEYS */;
/*!40000 ALTER TABLE `gibbonnotificationlistener` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibbonoutcome
CREATE TABLE IF NOT EXISTS `gibbonoutcome` (
  `gibbonOutcomeID` int(8) unsigned zerofill NOT NULL,
  `name` varchar(100) NOT NULL,
  `nameShort` varchar(14) NOT NULL,
  `category` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `active` enum('Y','N') NOT NULL,
  `scope` enum('School','Learning Area') NOT NULL,
  `gibbonDepartmentID` int(4) unsigned zerofill DEFAULT NULL,
  `gibbonYearGroupIDList` varchar(255) NOT NULL,
  `gibbonPersonIDCreator` int(10) unsigned zerofill NOT NULL,
  PRIMARY KEY (`gibbonOutcomeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibbonoutcome: ~0 rows (approximately)
/*!40000 ALTER TABLE `gibbonoutcome` DISABLE KEYS */;
/*!40000 ALTER TABLE `gibbonoutcome` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibbonpayment
CREATE TABLE IF NOT EXISTS `gibbonpayment` (
  `gibbonPaymentID` int(14) unsigned zerofill NOT NULL,
  `foreignTable` varchar(50) NOT NULL,
  `foreignTableID` int(14) unsigned zerofill NOT NULL,
  `gibbonPersonID` int(10) unsigned zerofill DEFAULT NULL COMMENT 'Person recording the transaction',
  `type` enum('Online','Bank Transfer','Cash','Cheque','Other','Credit Card') NOT NULL DEFAULT 'Online',
  `status` enum('Complete','Partial','Final','Failure') NOT NULL DEFAULT 'Complete' COMMENT 'Complete means paid in one go, partial is part of a set of payments, and final is last in a set of payments.',
  `amount` decimal(13,2) NOT NULL,
  `gateway` enum('Paypal') DEFAULT NULL,
  `onlineTransactionStatus` enum('Success','Failure') DEFAULT NULL,
  `paymentToken` varchar(50) DEFAULT NULL,
  `paymentPayerID` varchar(50) DEFAULT NULL,
  `paymentTransactionID` varchar(50) DEFAULT NULL,
  `paymentReceiptID` varchar(50) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`gibbonPaymentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibbonpayment: ~0 rows (approximately)
/*!40000 ALTER TABLE `gibbonpayment` DISABLE KEYS */;
/*!40000 ALTER TABLE `gibbonpayment` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibbonpermission
CREATE TABLE IF NOT EXISTS `gibbonpermission` (
  `permissionID` int(10) unsigned zerofill NOT NULL,
  `gibbonRoleID` int(3) unsigned zerofill NOT NULL,
  `gibbonActionID` int(7) unsigned zerofill NOT NULL,
  PRIMARY KEY (`permissionID`),
  KEY `gibbonRoleID` (`gibbonRoleID`),
  KEY `gibbonActionID` (`gibbonActionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibbonpermission: ~453 rows (approximately)
/*!40000 ALTER TABLE `gibbonpermission` DISABLE KEYS */;
INSERT INTO `gibbonpermission` (`permissionID`, `gibbonRoleID`, `gibbonActionID`) VALUES
	(0000053554, 001, 0000705),
	(0000053555, 006, 0000705),
	(0000053556, 002, 0000705),
	(0000053557, 001, 0000709),
	(0000053558, 002, 0000709),
	(0000053559, 001, 0000673),
	(0000053560, 006, 0000673),
	(0000053561, 002, 0000673),
	(0000053562, 001, 0000067),
	(0000053563, 006, 0000067),
	(0000053564, 002, 0000067),
	(0000053565, 001, 0000058),
	(0000053566, 006, 0000058),
	(0000053567, 002, 0000058),
	(0000053568, 001, 0000055),
	(0000053569, 001, 0000056),
	(0000053570, 003, 0000056),
	(0000053571, 002, 0000056),
	(0000053572, 001, 0000057),
	(0000053573, 006, 0000057),
	(0000053574, 002, 0000057),
	(0000053575, 001, 0000059),
	(0000053576, 006, 0000059),
	(0000053578, 003, 0000053),
	(0000053579, 001, 0000052),
	(0000053580, 004, 0000052),
	(0000053581, 006, 0000052),
	(0000053582, 002, 0000052),
	(0000053583, 001, 0000074),
	(0000053584, 004, 0000074),
	(0000053585, 006, 0000074),
	(0000053586, 002, 0000074),
	(0000053587, 001, 0000026),
	(0000053588, 006, 0000026),
	(0000053589, 002, 0000026),
	(0000053590, 001, 0000027),
	(0000053591, 006, 0000027),
	(0000053592, 002, 0000027),
	(0000053593, 001, 0000030),
	(0000053594, 006, 0000030),
	(0000053595, 002, 0000030),
	(0000053596, 001, 0000028),
	(0000053597, 006, 0000028),
	(0000053598, 002, 0000028),
	(0000053599, 001, 0000031),
	(0000053600, 006, 0000031),
	(0000053601, 002, 0000031),
	(0000053602, 004, 0000060),
	(0000053603, 001, 0000044),
	(0000053604, 006, 0000044),
	(0000053605, 002, 0000044),
	(0000053606, 001, 0000029),
	(0000053607, 006, 0000029),
	(0000053608, 002, 0000029),
	(0000053609, 001, 0000719),
	(0000053610, 002, 0000719),
	(0000053611, 001, 0000606),
	(0000053612, 002, 0000607),
	(0000053613, 001, 0000608),
	(0000053614, 002, 0000608),
	(0000053615, 001, 0000047),
	(0000053616, 004, 0000047),
	(0000053617, 003, 0000047),
	(0000053618, 002, 0000047),
	(0000053619, 001, 0000764),
	(0000053620, 001, 0000765),
	(0000053621, 004, 0000765),
	(0000053622, 006, 0000765),
	(0000053623, 002, 0000765),
	(0000053624, 001, 0000773),
	(0000053625, 001, 0000774),
	(0000053626, 004, 0000774),
	(0000053627, 006, 0000774),
	(0000053628, 002, 0000774),
	(0000053629, 001, 0000586),
	(0000053630, 004, 0000064),
	(0000053631, 001, 0000585),
	(0000053632, 004, 0000014),
	(0000053633, 006, 0000014),
	(0000053634, 002, 0000014),
	(0000053635, 001, 0000022),
	(0000053636, 004, 0000022),
	(0000053637, 003, 0000022),
	(0000053638, 006, 0000022),
	(0000053639, 002, 0000022),
	(0000053640, 001, 0000069),
	(0000053641, 001, 0000068),
	(0000053642, 002, 0000068),
	(0000053643, 001, 0000772),
	(0000053644, 001, 0000770),
	(0000053645, 001, 0000767),
	(0000053646, 001, 0000769),
	(0000053647, 001, 0000768),
	(0000053648, 001, 0000771),
	(0000053649, 002, 0000716),
	(0000053650, 001, 0000046),
	(0000053651, 001, 0000718),
	(0000053652, 001, 0000720),
	(0000053653, 004, 0000720),
	(0000053654, 003, 0000720),
	(0000053655, 006, 0000720),
	(0000053656, 002, 0000720),
	(0000053657, 001, 0000748),
	(0000053658, 006, 0000748),
	(0000053659, 001, 0000711),
	(0000053660, 001, 0000710),
	(0000053661, 001, 0000722),
	(0000053662, 002, 0000722),
	(0000053663, 001, 0000721),
	(0000053664, 001, 0000759),
	(0000053665, 002, 0000758),
	(0000053666, 001, 0000034),
	(0000053667, 002, 0000034),
	(0000053668, 004, 0000041),
	(0000053669, 001, 0000033),
	(0000053670, 006, 0000033),
	(0000053671, 002, 0000033),
	(0000053672, 003, 0000039),
	(0000053673, 001, 0000630),
	(0000053674, 002, 0000629),
	(0000053675, 001, 0000624),
	(0000053676, 001, 0000623),
	(0000053677, 002, 0000623),
	(0000053678, 001, 0000625),
	(0000053679, 002, 0000625),
	(0000053680, 001, 0000657),
	(0000053681, 001, 0000743),
	(0000053682, 002, 0000743),
	(0000053683, 001, 0000744),
	(0000053684, 002, 0000744),
	(0000053685, 001, 0000745),
	(0000053686, 001, 0000615),
	(0000053687, 001, 0000614),
	(0000053688, 002, 0000614),
	(0000053689, 001, 0000616),
	(0000053690, 002, 0000616),
	(0000053691, 001, 0000618),
	(0000053692, 001, 0000617),
	(0000053693, 002, 0000617),
	(0000053694, 001, 0000619),
	(0000053695, 002, 0000619),
	(0000053696, 001, 0000632),
	(0000053697, 001, 0000660),
	(0000053698, 002, 0000660),
	(0000053699, 001, 0000658),
	(0000053700, 002, 0000658),
	(0000053701, 001, 0000628),
	(0000053702, 001, 0000621),
	(0000053703, 001, 0000620),
	(0000053704, 002, 0000620),
	(0000053705, 001, 0000622),
	(0000053706, 002, 0000622),
	(0000053707, 001, 0000626),
	(0000053708, 002, 0000626),
	(0000053709, 001, 0000627),
	(0000053710, 001, 0000746),
	(0000053711, 004, 0000746),
	(0000053712, 003, 0000746),
	(0000053713, 002, 0000746),
	(0000053714, 002, 0000036),
	(0000053715, 001, 0000038),
	(0000053716, 004, 0000040),
	(0000053717, 003, 0000035),
	(0000053718, 002, 0000675),
	(0000053719, 001, 0000676),
	(0000053720, 001, 0000661),
	(0000053721, 002, 0000662),
	(0000053722, 001, 0000061),
	(0000053723, 002, 0000061),
	(0000053724, 001, 0000611),
	(0000053725, 006, 0000612),
	(0000053726, 002, 0000612),
	(0000053727, 001, 0000613),
	(0000053728, 006, 0000613),
	(0000053729, 002, 0000613),
	(0000053730, 001, 0000781),
	(0000053731, 003, 0000781),
	(0000053732, 006, 0000781),
	(0000053733, 002, 0000781),
	(0000053734, 002, 0000678),
	(0000053735, 001, 0000679),
	(0000053736, 001, 0000708),
	(0000053737, 004, 0000708),
	(0000053738, 003, 0000708),
	(0000053739, 002, 0000708),
	(0000053740, 001, 0000726),
	(0000053741, 001, 0000054),
	(0000053742, 001, 0000715),
	(0000053743, 001, 0000605),
	(0000053744, 001, 0000013),
	(0000053745, 001, 0000062),
	(0000053746, 001, 0000756),
	(0000053747, 001, 0000706),
	(0000053748, 001, 0000008),
	(0000053749, 001, 0000717),
	(0000053750, 001, 0000712),
	(0000053751, 001, 0000674),
	(0000053752, 001, 0000610),
	(0000053753, 001, 0000007),
	(0000053754, 001, 0000003),
	(0000053755, 001, 0000747),
	(0000053756, 001, 0000025),
	(0000053757, 001, 0000016),
	(0000053758, 001, 0000742),
	(0000053759, 001, 0000015),
	(0000053760, 001, 0000006),
	(0000053761, 001, 0000727),
	(0000053762, 001, 0000779),
	(0000053763, 001, 0000780),
	(0000053764, 001, 0000713),
	(0000053765, 001, 0000077),
	(0000053766, 006, 0000077),
	(0000053767, 002, 0000077),
	(0000053768, 001, 0000724),
	(0000053769, 001, 0000755),
	(0000053770, 001, 0000075),
	(0000053771, 006, 0000075),
	(0000053772, 002, 0000075),
	(0000053773, 001, 0000707),
	(0000053774, 002, 0000707),
	(0000053775, 001, 0000714),
	(0000053776, 001, 0000073),
	(0000053777, 006, 0000073),
	(0000053778, 002, 0000073),
	(0000053779, 001, 0000757),
	(0000053780, 001, 0000072),
	(0000053781, 006, 0000072),
	(0000053782, 002, 0000072),
	(0000053783, 001, 0000043),
	(0000053784, 006, 0000043),
	(0000053785, 002, 0000043),
	(0000053786, 003, 0000023),
	(0000053787, 001, 0000024),
	(0000053788, 006, 0000024),
	(0000053789, 002, 0000024),
	(0000053790, 004, 0000042),
	(0000053791, 001, 0000010),
	(0000053792, 001, 0000020),
	(0000053793, 001, 0000005),
	(0000053794, 001, 0000631),
	(0000053795, 001, 0000760),
	(0000053796, 001, 0000051),
	(0000053797, 004, 0000051),
	(0000053798, 003, 0000051),
	(0000053799, 006, 0000051),
	(0000053800, 002, 0000051),
	(0000053801, 001, 0000655),
	(0000053802, 006, 0000655),
	(0000053803, 002, 0000655),
	(0000053804, 001, 0000066),
	(0000053805, 001, 0000018),
	(0000053806, 001, 0000656),
	(0000053807, 001, 0000049),
	(0000053808, 001, 0000017),
	(0000053809, 001, 0000048),
	(0000053810, 001, 0000050),
	(0000053811, 001, 0000001),
	(0000053812, 001, 0000725),
	(0000053813, 001, 0000766),
	(0000053814, 001, 0000775),
	(0000053815, 001, 0000078),
	(0000053816, 001, 0000019),
	(0000053817, 001, 0000021),
	(0000053818, 001, 0000012),
	(0000053819, 001, 0000009),
	(0000053820, 001, 0000032),
	(0000053821, 001, 0000723),
	(0000053822, 001, 0000002),
	(0000053823, 001, 0000065),
	(0000053824, 001, 0000063),
	(0000053825, 001, 0000070),
	(0000053826, 001, 0000004),
	(0000053827, 001, 0000778),
	(0000053828, 001, 0000777),
	(0000053829, 001, 0000776),
	(0000053842, 001, 0000796),
	(0000053851, 001, 0000802),
	(0000053852, 002, 0000802),
	(0000053853, 004, 0000781),
	(0000053854, 001, 0000803),
	(0000053855, 001, 0000804),
	(0000053856, 001, 0000805),
	(0000053857, 001, 0000804),
	(0000053858, 001, 0000806),
	(0000053859, 001, 0000807),
	(0000053860, 002, 0000807),
	(0000053861, 001, 0000808),
	(0000053862, 001, 0000809),
	(0000053863, 001, 0000810),
	(0000053864, 002, 0000810),
	(0000053865, 001, 0000811),
	(0000053866, 001, 0000812),
	(0000053867, 002, 0000813),
	(0000053868, 001, 0000814),
	(0000053869, 002, 0000815),
	(0000053870, 001, 0000816),
	(0000053871, 001, 0000817),
	(0000053872, 002, 0000817),
	(0000053873, 001, 0000818),
	(0000053874, 002, 0000818),
	(0000053875, 006, 0000818),
	(0000053876, 001, 0000819),
	(0000053878, 001, 0000820),
	(0000053879, 001, 0000821),
	(0000053880, 001, 0000822),
	(0000053881, 001, 0000823),
	(0000053882, 001, 0000824),
	(0000053883, 001, 0000825),
	(0000053884, 001, 0000826),
	(0000053885, 001, 0000827),
	(0000053886, 002, 0000827),
	(0000053887, 006, 0000827),
	(0000053888, 001, 0000828),
	(0000053889, 002, 0000829),
	(0000053890, 006, 0000829),
	(0000053891, 001, 0000830),
	(0000053892, 001, 0000831),
	(0000053893, 001, 0000832),
	(0000053894, 001, 0000833),
	(0000053895, 002, 0000834),
	(0000053896, 001, 0000835),
	(0000053897, 003, 0000836),
	(0000053898, 004, 0000837),
	(0000053899, 001, 0000838),
	(0000053900, 002, 0000838),
	(0000053901, 001, 0000839),
	(0000053902, 001, 0000841),
	(0000053903, 001, 0000842),
	(0000053904, 001, 0000843),
	(0000053905, 001, 0000844),
	(0000053906, 001, 0000846),
	(0000053907, 001, 0000847),
	(0000053908, 001, 0000848),
	(0000053909, 004, 0000849),
	(0000053910, 001, 0000851),
	(0000053911, 001, 0000852),
	(0000053912, 001, 0000853),
	(0000053913, 001, 0000854),
	(0000053914, 001, 0000855),
	(0000053915, 001, 0000856),
	(0000053916, 002, 0000856),
	(0000053917, 006, 0000856),
	(0000053918, 001, 0000857),
	(0000053919, 001, 0000858),
	(0000053920, 001, 0000859),
	(0000053921, 001, 0000860),
	(0000053922, 002, 0000860),
	(0000053923, 001, 0000861),
	(0000053924, 002, 0000861),
	(0000053925, 001, 0000866),
	(0000053926, 001, 0000867),
	(0000053927, 001, 0000868),
	(0000053928, 001, 0000869),
	(0000053929, 002, 0000869),
	(0000053930, 001, 0000870),
	(0000053931, 001, 0000871),
	(0000053932, 001, 0000872),
	(0000053933, 001, 0000873),
	(0000053934, 002, 0000873),
	(0000053935, 001, 0000874),
	(0000053936, 002, 0000874),
	(0000053937, 001, 0000875),
	(0000053938, 002, 0000875),
	(0000053939, 001, 0000876),
	(0000053940, 002, 0000876),
	(0000053941, 001, 0000877),
	(0000053942, 001, 0000878),
	(0000053943, 002, 0000878),
	(0000053944, 006, 0000878),
	(0000053945, 001, 0000879),
	(0000053946, 001, 0000880),
	(0000053947, 002, 0000880),
	(0000053948, 001, 0000881),
	(0000053949, 001, 0000882),
	(0000053950, 001, 0000883),
	(0000053951, 001, 0000884),
	(0000053952, 001, 0000886),
	(0000053953, 006, 0000746),
	(0000053954, 001, 0000888),
	(0000053955, 001, 0000889),
	(0000053956, 002, 0000889),
	(0000053957, 001, 0000890),
	(0000053958, 002, 0000890),
	(0000053959, 001, 0000891),
	(0000053960, 003, 0000894),
	(0000053961, 004, 0000895),
	(0000053962, 003, 0000896),
	(0000053963, 001, 0000898),
	(0000053964, 001, 0000899),
	(0000053965, 001, 0000900),
	(0000053966, 001, 0000902),
	(0000053967, 001, 0000903),
	(0000053968, 002, 0000903),
	(0000053969, 001, 0000904),
	(0000053970, 002, 0000904),
	(0000053971, 004, 0000904),
	(0000053972, 006, 0000904),
	(0000053973, 001, 0000905),
	(0000053974, 002, 0000906),
	(0000053975, 001, 0000907),
	(0000053976, 002, 0000908),
	(0000053977, 001, 0000909),
	(0000053978, 001, 0000910),
	(0000053979, 001, 0000912),
	(0000053980, 001, 0000913),
	(0000053981, 001, 0000914),
	(0000053982, 001, 0000916),
	(0000053983, 001, 0000918),
	(0000053984, 001, 0000919),
	(0000053985, 001, 0000920),
	(0000053986, 001, 0000921),
	(0000053987, 001, 0000922),
	(0000053988, 001, 0000923),
	(0000053989, 001, 0000924),
	(0000053990, 001, 0000925),
	(0000053991, 001, 0000926),
	(0000053992, 001, 0000927),
	(0000053993, 001, 0000928),
	(0000053994, 001, 0000930),
	(0000053995, 001, 0000933),
	(0000053996, 001, 0000934),
	(0000053997, 001, 0000935),
	(0000053998, 002, 0000936),
	(0000053999, 001, 0000937),
	(0000054000, 002, 0000937),
	(0000054001, 001, 0000938),
	(0000054002, 001, 0000939),
	(0000054003, 001, 0000940),
	(0000054004, 001, 0000941),
	(0000054005, 001, 0000942),
	(0000054006, 001, 0000943),
	(0000054007, 001, 0000944),
	(0000054008, 004, 0000945),
	(0000054009, 003, 0000946),
	(0000054010, 001, 0000947),
	(0000054011, 001, 0000948),
	(0000054012, 002, 0000948),
	(0000054013, 001, 0000949),
	(0000054014, 002, 0000949),
	(0000054015, 001, 0000950),
	(0000054016, 001, 0000951),
	(0000054017, 001, 0000952),
	(0000054018, 001, 0000953),
	(0000054019, 002, 0000954),
	(0000054020, 001, 0000955),
	(0000054021, 001, 0000956),
	(0000054022, 001, 0000957),
	(0000054023, 001, 0000958),
	(0000054024, 001, 0000959),
	(0000054025, 002, 0000960),
	(0000054026, 001, 0000961),
	(0000054027, 001, 0000962),
	(0000054028, 001, 0000963);
/*!40000 ALTER TABLE `gibbonpermission` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibbonperson
CREATE TABLE IF NOT EXISTS `gibbonperson` (
  `gibbonPersonID` int(10) unsigned zerofill NOT NULL,
  `title` varchar(5) NOT NULL,
  `surname` varchar(60) NOT NULL DEFAULT '',
  `firstName` varchar(60) NOT NULL DEFAULT '',
  `preferredName` varchar(60) NOT NULL DEFAULT '',
  `officialName` varchar(150) NOT NULL,
  `nameInCharacters` varchar(60) NOT NULL,
  `gender` enum('M','F','Other','Unspecified') NOT NULL DEFAULT 'Unspecified',
  `username` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL DEFAULT '',
  `passwordStrong` varchar(255) NOT NULL,
  `passwordStrongSalt` varchar(255) NOT NULL,
  `passwordForceReset` enum('N','Y') NOT NULL DEFAULT 'N' COMMENT 'Force user to reset password on next login.',
  `status` enum('Full','Expected','Left','Pending Approval') NOT NULL DEFAULT 'Full',
  `canLogin` enum('Y','N') NOT NULL DEFAULT 'Y',
  `gibbonRoleIDPrimary` int(3) unsigned zerofill NOT NULL,
  `gibbonRoleIDAll` varchar(255) NOT NULL,
  `dob` date DEFAULT NULL,
  `email` varchar(75) DEFAULT NULL,
  `emailAlternate` varchar(75) DEFAULT NULL,
  `image_240` varchar(255) DEFAULT NULL,
  `lastIPAddress` varchar(15) NOT NULL DEFAULT '',
  `lastTimestamp` timestamp NULL DEFAULT NULL,
  `lastFailIPAddress` varchar(15) DEFAULT NULL,
  `lastFailTimestamp` timestamp NULL DEFAULT NULL,
  `failCount` int(1) DEFAULT '0',
  `address1` mediumtext NOT NULL,
  `address1District` varchar(255) NOT NULL,
  `address1Country` varchar(255) NOT NULL,
  `address2` mediumtext NOT NULL,
  `address2District` varchar(255) NOT NULL,
  `address2Country` varchar(255) NOT NULL,
  `phone1Type` enum('','Mobile','Home','Work','Fax','Pager','Other') NOT NULL DEFAULT '',
  `phone1CountryCode` varchar(7) NOT NULL,
  `phone1` varchar(20) NOT NULL,
  `phone3Type` enum('','Mobile','Home','Work','Fax','Pager','Other') NOT NULL DEFAULT '',
  `phone3CountryCode` varchar(7) NOT NULL,
  `phone3` varchar(20) NOT NULL,
  `phone2Type` enum('','Mobile','Home','Work','Fax','Pager','Other') NOT NULL DEFAULT '',
  `phone2CountryCode` varchar(7) NOT NULL,
  `phone2` varchar(20) NOT NULL,
  `phone4Type` enum('','Mobile','Home','Work','Fax','Pager','Other') NOT NULL DEFAULT '',
  `phone4CountryCode` varchar(7) NOT NULL,
  `phone4` varchar(20) NOT NULL,
  `website` varchar(255) NOT NULL,
  `languageFirst` varchar(30) NOT NULL,
  `languageSecond` varchar(30) NOT NULL,
  `languageThird` varchar(30) NOT NULL,
  `countryOfBirth` varchar(30) NOT NULL,
  `birthCertificateScan` varchar(255) NOT NULL,
  `ethnicity` varchar(255) NOT NULL,
  `citizenship1` varchar(255) NOT NULL,
  `citizenship1Passport` varchar(30) NOT NULL,
  `citizenship1PassportExpiry` date DEFAULT NULL,
  `citizenship1PassportScan` varchar(255) NOT NULL,
  `citizenship2` varchar(255) NOT NULL,
  `citizenship2Passport` varchar(30) NOT NULL,
  `citizenship2PassportExpiry` date DEFAULT NULL,
  `religion` varchar(30) NOT NULL,
  `nationalIDCardNumber` varchar(30) NOT NULL,
  `nationalIDCardScan` varchar(255) NOT NULL,
  `residencyStatus` varchar(255) NOT NULL,
  `visaExpiryDate` date DEFAULT NULL,
  `profession` varchar(90) NOT NULL,
  `employer` varchar(90) NOT NULL,
  `jobTitle` varchar(90) NOT NULL,
  `emergency1Name` varchar(90) NOT NULL,
  `emergency1Number1` varchar(30) NOT NULL,
  `emergency1Number2` varchar(30) NOT NULL,
  `emergency1Relationship` varchar(30) NOT NULL,
  `emergency2Name` varchar(90) NOT NULL,
  `emergency2Number1` varchar(30) NOT NULL,
  `emergency2Number2` varchar(30) NOT NULL,
  `emergency2Relationship` varchar(30) NOT NULL,
  `gibbonHouseID` int(3) unsigned zerofill DEFAULT NULL,
  `studentID` varchar(15) NOT NULL,
  `dateStart` date DEFAULT NULL,
  `dateEnd` date DEFAULT NULL,
  `gibbonSchoolYearIDClassOf` int(3) unsigned zerofill DEFAULT NULL,
  `lastSchool` varchar(100) NOT NULL,
  `nextSchool` varchar(100) NOT NULL,
  `departureReason` varchar(50) NOT NULL,
  `transport` varchar(255) NOT NULL,
  `transportNotes` text NOT NULL,
  `calendarFeedPersonal` text NOT NULL,
  `viewCalendarSchool` enum('Y','N') NOT NULL DEFAULT 'Y',
  `viewCalendarPersonal` enum('Y','N') NOT NULL DEFAULT 'Y',
  `viewCalendarSpaceBooking` enum('Y','N') NOT NULL DEFAULT 'N',
  `gibbonApplicationFormID` int(12) unsigned zerofill DEFAULT NULL,
  `lockerNumber` varchar(20) NOT NULL,
  `vehicleRegistration` varchar(20) NOT NULL,
  `personalBackground` varchar(255) NOT NULL,
  `messengerLastBubble` date DEFAULT NULL,
  `privacy` text,
  `dayType` varchar(255) DEFAULT NULL COMMENT 'Student day type, as specified in the application form.',
  `gibbonThemeIDPersonal` int(4) unsigned zerofill DEFAULT NULL,
  `gibboni18nIDPersonal` int(4) unsigned zerofill DEFAULT NULL,
  `studentAgreements` text,
  `googleAPIRefreshToken` varchar(255) NOT NULL,
  `receiveNotificationEmails` enum('Y','N') NOT NULL DEFAULT 'Y',
  `fields` text NOT NULL COMMENT 'Serialised array of custom field values',
  PRIMARY KEY (`gibbonPersonID`),
  UNIQUE KEY `username` (`username`),
  KEY `username_2` (`username`,`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibbonperson: ~1 rows (approximately)
/*!40000 ALTER TABLE `gibbonperson` DISABLE KEYS */;
INSERT INTO `gibbonperson` (`gibbonPersonID`, `title`, `surname`, `firstName`, `preferredName`, `officialName`, `nameInCharacters`, `gender`, `username`, `password`, `passwordStrong`, `passwordStrongSalt`, `passwordForceReset`, `status`, `canLogin`, `gibbonRoleIDPrimary`, `gibbonRoleIDAll`, `dob`, `email`, `emailAlternate`, `image_240`, `lastIPAddress`, `lastTimestamp`, `lastFailIPAddress`, `lastFailTimestamp`, `failCount`, `address1`, `address1District`, `address1Country`, `address2`, `address2District`, `address2Country`, `phone1Type`, `phone1CountryCode`, `phone1`, `phone3Type`, `phone3CountryCode`, `phone3`, `phone2Type`, `phone2CountryCode`, `phone2`, `phone4Type`, `phone4CountryCode`, `phone4`, `website`, `languageFirst`, `languageSecond`, `languageThird`, `countryOfBirth`, `birthCertificateScan`, `ethnicity`, `citizenship1`, `citizenship1Passport`, `citizenship1PassportExpiry`, `citizenship1PassportScan`, `citizenship2`, `citizenship2Passport`, `citizenship2PassportExpiry`, `religion`, `nationalIDCardNumber`, `nationalIDCardScan`, `residencyStatus`, `visaExpiryDate`, `profession`, `employer`, `jobTitle`, `emergency1Name`, `emergency1Number1`, `emergency1Number2`, `emergency1Relationship`, `emergency2Name`, `emergency2Number1`, `emergency2Number2`, `emergency2Relationship`, `gibbonHouseID`, `studentID`, `dateStart`, `dateEnd`, `gibbonSchoolYearIDClassOf`, `lastSchool`, `nextSchool`, `departureReason`, `transport`, `transportNotes`, `calendarFeedPersonal`, `viewCalendarSchool`, `viewCalendarPersonal`, `viewCalendarSpaceBooking`, `gibbonApplicationFormID`, `lockerNumber`, `vehicleRegistration`, `personalBackground`, `messengerLastBubble`, `privacy`, `dayType`, `gibbonThemeIDPersonal`, `gibboni18nIDPersonal`, `studentAgreements`, `googleAPIRefreshToken`, `receiveNotificationEmails`, `fields`) VALUES
	(0000000001, 'Mr.', 'Karim', 'Md. Rejaul', 'Md. Rejaul', 'Md. Rejaul Karim', '', 'Unspecified', 'bidyaan', '', '6146764be0530e254c8d19941903090d35fc5cd41beb02c85d28c8288ccd3a0e', '/aABdFgMpQtVWXyz014578', 'N', 'Full', 'Y', 001, '001', NULL, 'rejaul.2005@gmail.com', NULL, NULL, '::1', '2020-08-20 11:33:53', NULL, NULL, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, '', '', '', NULL, '', '', '', '', NULL, '', '', '', '', '', '', '', '', '', '', '', NULL, '', NULL, NULL, NULL, '', '', '', '', '', '', 'Y', 'Y', 'N', NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, '', 'Y', '');
/*!40000 ALTER TABLE `gibbonperson` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibbonpersonfield
CREATE TABLE IF NOT EXISTS `gibbonpersonfield` (
  `gibbonPersonFieldID` int(3) unsigned zerofill NOT NULL,
  `name` varchar(50) NOT NULL,
  `active` enum('Y','N') NOT NULL DEFAULT 'Y',
  `description` varchar(255) NOT NULL,
  `type` enum('varchar','text','date','url','select','checkboxes') NOT NULL,
  `options` text NOT NULL COMMENT 'Field length for varchar, rows for text, comma-separate list for select/checkbox.',
  `required` enum('N','Y') NOT NULL DEFAULT 'N',
  `activePersonStudent` tinyint(1) NOT NULL DEFAULT '0',
  `activePersonStaff` tinyint(1) NOT NULL DEFAULT '0',
  `activePersonParent` tinyint(1) NOT NULL DEFAULT '0',
  `activePersonOther` tinyint(1) NOT NULL DEFAULT '0',
  `activeApplicationForm` tinyint(1) NOT NULL DEFAULT '0',
  `activeDataUpdater` tinyint(1) NOT NULL DEFAULT '0',
  `activePublicRegistration` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`gibbonPersonFieldID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibbonpersonfield: ~0 rows (approximately)
/*!40000 ALTER TABLE `gibbonpersonfield` DISABLE KEYS */;
/*!40000 ALTER TABLE `gibbonpersonfield` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibbonpersonmedical
CREATE TABLE IF NOT EXISTS `gibbonpersonmedical` (
  `gibbonPersonMedicalID` int(10) unsigned zerofill NOT NULL,
  `gibbonPersonID` int(10) unsigned zerofill NOT NULL,
  `bloodType` enum('','O+','A+','B+','AB+','O-','A-','B-','AB-') NOT NULL,
  `longTermMedication` enum('','Y','N') NOT NULL,
  `longTermMedicationDetails` text NOT NULL,
  `tetanusWithin10Years` enum('','Y','N') NOT NULL,
  `comment` text NOT NULL,
  PRIMARY KEY (`gibbonPersonMedicalID`),
  KEY `gibbonPersonID` (`gibbonPersonID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibbonpersonmedical: ~1 rows (approximately)
/*!40000 ALTER TABLE `gibbonpersonmedical` DISABLE KEYS */;
INSERT INTO `gibbonpersonmedical` (`gibbonPersonMedicalID`, `gibbonPersonID`, `bloodType`, `longTermMedication`, `longTermMedicationDetails`, `tetanusWithin10Years`, `comment`) VALUES
	(0000000001, 0000001099, '', '', '', '', '');
/*!40000 ALTER TABLE `gibbonpersonmedical` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibbonpersonmedicalcondition
CREATE TABLE IF NOT EXISTS `gibbonpersonmedicalcondition` (
  `gibbonPersonMedicalConditionID` int(12) unsigned zerofill NOT NULL,
  `gibbonPersonMedicalID` int(10) unsigned zerofill NOT NULL,
  `name` varchar(100) NOT NULL,
  `gibbonAlertLevelID` int(3) unsigned zerofill DEFAULT NULL,
  `triggers` varchar(255) NOT NULL,
  `reaction` varchar(255) NOT NULL,
  `response` varchar(255) NOT NULL,
  `medication` varchar(255) NOT NULL,
  `lastEpisode` date DEFAULT NULL,
  `lastEpisodeTreatment` varchar(255) NOT NULL,
  `comment` text NOT NULL,
  PRIMARY KEY (`gibbonPersonMedicalConditionID`),
  KEY `gibbonPersonMedicalID` (`gibbonPersonMedicalID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibbonpersonmedicalcondition: ~0 rows (approximately)
/*!40000 ALTER TABLE `gibbonpersonmedicalcondition` DISABLE KEYS */;
/*!40000 ALTER TABLE `gibbonpersonmedicalcondition` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibbonpersonmedicalconditionupdate
CREATE TABLE IF NOT EXISTS `gibbonpersonmedicalconditionupdate` (
  `gibbonPersonMedicalConditionUpdateID` int(14) unsigned zerofill NOT NULL,
  `gibbonPersonMedicalUpdateID` int(12) unsigned zerofill DEFAULT NULL,
  `gibbonPersonMedicalConditionID` int(12) unsigned zerofill DEFAULT NULL,
  `gibbonPersonMedicalID` int(10) unsigned zerofill DEFAULT NULL,
  `name` varchar(80) NOT NULL,
  `gibbonAlertLevelID` int(3) unsigned zerofill DEFAULT NULL,
  `triggers` varchar(255) NOT NULL,
  `reaction` varchar(255) NOT NULL,
  `response` varchar(255) NOT NULL,
  `medication` varchar(255) NOT NULL,
  `lastEpisode` date DEFAULT NULL,
  `lastEpisodeTreatment` varchar(255) NOT NULL,
  `comment` text NOT NULL,
  `gibbonPersonIDUpdater` int(10) unsigned zerofill NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`gibbonPersonMedicalConditionUpdateID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibbonpersonmedicalconditionupdate: ~0 rows (approximately)
/*!40000 ALTER TABLE `gibbonpersonmedicalconditionupdate` DISABLE KEYS */;
/*!40000 ALTER TABLE `gibbonpersonmedicalconditionupdate` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibbonpersonmedicalsymptoms
CREATE TABLE IF NOT EXISTS `gibbonpersonmedicalsymptoms` (
  `gibbonPersonMedicalSymptomsID` int(14) unsigned zerofill NOT NULL,
  `gibbonPersonID` int(10) unsigned zerofill NOT NULL,
  `symptoms` text NOT NULL,
  `date` date NOT NULL,
  `timestampTaken` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `gibbonPersonIDTaker` int(10) unsigned zerofill NOT NULL,
  PRIMARY KEY (`gibbonPersonMedicalSymptomsID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibbonpersonmedicalsymptoms: ~0 rows (approximately)
/*!40000 ALTER TABLE `gibbonpersonmedicalsymptoms` DISABLE KEYS */;
/*!40000 ALTER TABLE `gibbonpersonmedicalsymptoms` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibbonpersonmedicalupdate
CREATE TABLE IF NOT EXISTS `gibbonpersonmedicalupdate` (
  `gibbonPersonMedicalUpdateID` int(12) unsigned zerofill NOT NULL,
  `gibbonSchoolYearID` int(3) unsigned zerofill DEFAULT NULL,
  `status` enum('Pending','Complete') NOT NULL DEFAULT 'Pending',
  `gibbonPersonMedicalID` int(10) unsigned zerofill DEFAULT NULL,
  `gibbonPersonID` int(10) unsigned zerofill NOT NULL,
  `bloodType` enum('','O+','A+','B+','AB+','O-','A-','B-','AB-') NOT NULL,
  `longTermMedication` enum('','Y','N') NOT NULL,
  `longTermMedicationDetails` text NOT NULL,
  `tetanusWithin10Years` enum('','Y','N') NOT NULL,
  `comment` text NOT NULL,
  `gibbonPersonIDUpdater` int(10) unsigned zerofill NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`gibbonPersonMedicalUpdateID`),
  KEY `gibbonMedicalIndex` (`gibbonPersonID`,`gibbonPersonMedicalID`,`gibbonSchoolYearID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibbonpersonmedicalupdate: ~0 rows (approximately)
/*!40000 ALTER TABLE `gibbonpersonmedicalupdate` DISABLE KEYS */;
/*!40000 ALTER TABLE `gibbonpersonmedicalupdate` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibbonpersonreset
CREATE TABLE IF NOT EXISTS `gibbonpersonreset` (
  `gibbonPersonResetID` int(12) unsigned zerofill NOT NULL,
  `gibbonPersonID` int(10) unsigned zerofill NOT NULL,
  `key` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`gibbonPersonResetID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table bidyaan_fakmsc.gibbonpersonreset: ~0 rows (approximately)
/*!40000 ALTER TABLE `gibbonpersonreset` DISABLE KEYS */;
/*!40000 ALTER TABLE `gibbonpersonreset` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibbonpersonupdate
CREATE TABLE IF NOT EXISTS `gibbonpersonupdate` (
  `gibbonPersonUpdateID` int(12) unsigned zerofill NOT NULL,
  `gibbonSchoolYearID` int(3) unsigned zerofill DEFAULT NULL,
  `status` enum('Pending','Complete') NOT NULL DEFAULT 'Pending',
  `gibbonPersonID` int(10) unsigned zerofill NOT NULL,
  `title` varchar(5) NOT NULL,
  `surname` varchar(60) NOT NULL DEFAULT '',
  `firstName` varchar(60) NOT NULL DEFAULT '',
  `preferredName` varchar(60) NOT NULL DEFAULT '',
  `officialName` varchar(150) NOT NULL,
  `nameInCharacters` varchar(60) NOT NULL,
  `dob` date DEFAULT NULL,
  `email` varchar(75) DEFAULT NULL,
  `emailAlternate` varchar(75) DEFAULT NULL,
  `address1` mediumtext NOT NULL,
  `address1District` varchar(255) NOT NULL,
  `address1Country` varchar(255) NOT NULL,
  `address2` mediumtext NOT NULL,
  `address2District` varchar(255) NOT NULL,
  `address2Country` varchar(255) NOT NULL,
  `phone1Type` enum('','Mobile','Home','Work','Fax','Pager','Other') NOT NULL DEFAULT '',
  `phone1CountryCode` varchar(7) NOT NULL,
  `phone1` varchar(20) NOT NULL,
  `phone3Type` enum('','Mobile','Home','Work','Fax','Pager','Other') NOT NULL DEFAULT '',
  `phone3CountryCode` varchar(7) NOT NULL,
  `phone3` varchar(20) NOT NULL,
  `phone2Type` enum('','Mobile','Home','Work','Fax','Pager','Other') NOT NULL DEFAULT '',
  `phone2CountryCode` varchar(7) NOT NULL,
  `phone2` varchar(20) NOT NULL,
  `phone4Type` enum('','Mobile','Home','Work','Fax','Pager','Other') NOT NULL DEFAULT '',
  `phone4CountryCode` varchar(7) NOT NULL,
  `phone4` varchar(20) NOT NULL,
  `languageFirst` varchar(30) NOT NULL,
  `languageSecond` varchar(30) NOT NULL,
  `languageThird` varchar(30) NOT NULL,
  `countryOfBirth` varchar(30) NOT NULL,
  `ethnicity` varchar(255) NOT NULL,
  `citizenship1` varchar(255) NOT NULL,
  `citizenship1Passport` varchar(30) NOT NULL,
  `citizenship1PassportExpiry` date DEFAULT NULL,
  `citizenship2` varchar(255) NOT NULL,
  `citizenship2Passport` varchar(30) NOT NULL,
  `citizenship2PassportExpiry` date DEFAULT NULL,
  `religion` varchar(30) NOT NULL,
  `nationalIDCardCountry` varchar(30) NOT NULL,
  `nationalIDCardNumber` varchar(30) NOT NULL,
  `residencyStatus` varchar(255) NOT NULL,
  `visaExpiryDate` date DEFAULT NULL,
  `profession` varchar(90) DEFAULT NULL,
  `employer` varchar(90) DEFAULT NULL,
  `jobTitle` varchar(90) DEFAULT NULL,
  `emergency1Name` varchar(90) DEFAULT NULL,
  `emergency1Number1` varchar(30) DEFAULT NULL,
  `emergency1Number2` varchar(30) DEFAULT NULL,
  `emergency1Relationship` varchar(30) DEFAULT NULL,
  `emergency2Name` varchar(90) DEFAULT NULL,
  `emergency2Number1` varchar(30) DEFAULT NULL,
  `emergency2Number2` varchar(30) DEFAULT NULL,
  `emergency2Relationship` varchar(30) DEFAULT NULL,
  `vehicleRegistration` varchar(20) NOT NULL,
  `gibbonPersonIDUpdater` int(10) unsigned zerofill NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `privacy` text,
  `fields` text NOT NULL COMMENT 'Serialised array of custom field values',
  PRIMARY KEY (`gibbonPersonUpdateID`),
  KEY `gibbonPersonIndex` (`gibbonPersonID`,`gibbonSchoolYearID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibbonpersonupdate: ~0 rows (approximately)
/*!40000 ALTER TABLE `gibbonpersonupdate` DISABLE KEYS */;
/*!40000 ALTER TABLE `gibbonpersonupdate` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibbonplannerentry
CREATE TABLE IF NOT EXISTS `gibbonplannerentry` (
  `gibbonPlannerEntryID` int(14) unsigned zerofill NOT NULL,
  `gibbonCourseClassID` int(8) unsigned zerofill NOT NULL,
  `gibbonUnitID` int(10) unsigned zerofill DEFAULT NULL,
  `date` date DEFAULT NULL,
  `timeStart` time DEFAULT NULL,
  `timeEnd` time DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `summary` varchar(255) NOT NULL,
  `description` mediumtext NOT NULL,
  `teachersNotes` mediumtext NOT NULL,
  `homework` enum('N','Y') NOT NULL DEFAULT 'N',
  `homeworkDueDateTime` datetime DEFAULT NULL,
  `homeworkDetails` mediumtext NOT NULL,
  `homeworkSubmission` enum('N','Y') NOT NULL,
  `homeworkSubmissionDateOpen` date DEFAULT NULL,
  `homeworkSubmissionDrafts` varchar(1) DEFAULT NULL,
  `homeworkSubmissionType` enum('','Link','File','Link/File') NOT NULL,
  `homeworkSubmissionRequired` enum('Optional','Compulsory') DEFAULT 'Optional',
  `homeworkCrowdAssess` enum('N','Y') NOT NULL,
  `homeworkCrowdAssessOtherTeachersRead` enum('N','Y') NOT NULL,
  `homeworkCrowdAssessOtherParentsRead` enum('N','Y') NOT NULL,
  `homeworkCrowdAssessClassmatesParentsRead` enum('N','Y') NOT NULL,
  `homeworkCrowdAssessSubmitterParentsRead` enum('N','Y') NOT NULL,
  `homeworkCrowdAssessOtherStudentsRead` enum('N','Y') NOT NULL,
  `homeworkCrowdAssessClassmatesRead` enum('N','Y') NOT NULL,
  `viewableStudents` enum('Y','N') NOT NULL DEFAULT 'Y',
  `viewableParents` enum('Y','N') NOT NULL DEFAULT 'N',
  `gibbonPersonIDCreator` int(10) unsigned zerofill NOT NULL,
  `gibbonPersonIDLastEdit` int(10) unsigned zerofill NOT NULL,
  PRIMARY KEY (`gibbonPlannerEntryID`),
  KEY `gibbonCourseClassID` (`gibbonCourseClassID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibbonplannerentry: ~0 rows (approximately)
/*!40000 ALTER TABLE `gibbonplannerentry` DISABLE KEYS */;
/*!40000 ALTER TABLE `gibbonplannerentry` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibbonplannerentrydiscuss
CREATE TABLE IF NOT EXISTS `gibbonplannerentrydiscuss` (
  `gibbonPlannerEntryDiscussID` int(16) unsigned zerofill NOT NULL,
  `gibbonPlannerEntryID` int(14) unsigned zerofill NOT NULL,
  `gibbonPersonID` int(10) unsigned zerofill NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `comment` text NOT NULL,
  `gibbonPlannerEntryDiscussIDReplyTo` int(16) unsigned zerofill DEFAULT NULL,
  PRIMARY KEY (`gibbonPlannerEntryDiscussID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibbonplannerentrydiscuss: ~0 rows (approximately)
/*!40000 ALTER TABLE `gibbonplannerentrydiscuss` DISABLE KEYS */;
/*!40000 ALTER TABLE `gibbonplannerentrydiscuss` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibbonplannerentryguest
CREATE TABLE IF NOT EXISTS `gibbonplannerentryguest` (
  `gibbonPlannerEntryGuestID` int(16) unsigned zerofill NOT NULL,
  `gibbonPlannerEntryID` int(14) unsigned zerofill NOT NULL,
  `gibbonPersonID` int(10) unsigned zerofill NOT NULL,
  `role` enum('Guest Student','Guest Teacher','Guest Assistant','Guest Technician','Guest Parent','Other Guest') NOT NULL,
  PRIMARY KEY (`gibbonPlannerEntryGuestID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibbonplannerentryguest: ~0 rows (approximately)
/*!40000 ALTER TABLE `gibbonplannerentryguest` DISABLE KEYS */;
/*!40000 ALTER TABLE `gibbonplannerentryguest` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibbonplannerentryhomework
CREATE TABLE IF NOT EXISTS `gibbonplannerentryhomework` (
  `gibbonPlannerEntryHomeworkID` int(16) unsigned zerofill NOT NULL,
  `gibbonPlannerEntryID` int(14) unsigned zerofill NOT NULL,
  `gibbonPersonID` int(10) unsigned zerofill NOT NULL,
  `type` enum('Link','File') NOT NULL,
  `version` enum('Draft','Final') NOT NULL,
  `status` enum('On Time','Late','Exemption') NOT NULL,
  `location` varchar(255) DEFAULT NULL,
  `count` int(1) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`gibbonPlannerEntryHomeworkID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibbonplannerentryhomework: ~0 rows (approximately)
/*!40000 ALTER TABLE `gibbonplannerentryhomework` DISABLE KEYS */;
/*!40000 ALTER TABLE `gibbonplannerentryhomework` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibbonplannerentryoutcome
CREATE TABLE IF NOT EXISTS `gibbonplannerentryoutcome` (
  `gibbonPlannerEntryOutcomeID` int(16) unsigned zerofill NOT NULL,
  `gibbonPlannerEntryID` int(14) unsigned zerofill NOT NULL,
  `gibbonOutcomeID` int(8) unsigned zerofill NOT NULL,
  `sequenceNumber` int(4) NOT NULL,
  `content` text NOT NULL,
  PRIMARY KEY (`gibbonPlannerEntryOutcomeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibbonplannerentryoutcome: ~0 rows (approximately)
/*!40000 ALTER TABLE `gibbonplannerentryoutcome` DISABLE KEYS */;
/*!40000 ALTER TABLE `gibbonplannerentryoutcome` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibbonplannerentrystudenthomework
CREATE TABLE IF NOT EXISTS `gibbonplannerentrystudenthomework` (
  `gibbonPlannerEntryStudentHomeworkID` int(14) unsigned zerofill NOT NULL,
  `gibbonPlannerEntryID` int(14) unsigned zerofill NOT NULL,
  `gibbonPersonID` int(10) unsigned zerofill NOT NULL,
  `homeworkDueDateTime` datetime NOT NULL,
  `homeworkDetails` mediumtext NOT NULL,
  `homeworkComplete` enum('Y','N') NOT NULL DEFAULT 'N',
  PRIMARY KEY (`gibbonPlannerEntryStudentHomeworkID`),
  KEY `gibbonPlannerEntryID` (`gibbonPlannerEntryID`,`gibbonPersonID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Allows students to add homework deadlines themselves';

-- Dumping data for table bidyaan_fakmsc.gibbonplannerentrystudenthomework: ~0 rows (approximately)
/*!40000 ALTER TABLE `gibbonplannerentrystudenthomework` DISABLE KEYS */;
/*!40000 ALTER TABLE `gibbonplannerentrystudenthomework` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibbonplannerentrystudenttracker
CREATE TABLE IF NOT EXISTS `gibbonplannerentrystudenttracker` (
  `gibbonPlannerEntryStudentTrackerID` int(16) unsigned zerofill NOT NULL,
  `gibbonPlannerEntryID` int(14) unsigned zerofill NOT NULL,
  `gibbonPersonID` int(10) unsigned zerofill NOT NULL,
  `homeworkComplete` enum('Y','N') NOT NULL,
  PRIMARY KEY (`gibbonPlannerEntryStudentTrackerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibbonplannerentrystudenttracker: ~0 rows (approximately)
/*!40000 ALTER TABLE `gibbonplannerentrystudenttracker` DISABLE KEYS */;
/*!40000 ALTER TABLE `gibbonplannerentrystudenttracker` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibbonplannerparentweeklyemailsummary
CREATE TABLE IF NOT EXISTS `gibbonplannerparentweeklyemailsummary` (
  `gibbonPlannerParentWeeklyEmailSummaryID` int(14) unsigned zerofill NOT NULL,
  `gibbonSchoolYearID` int(3) unsigned zerofill NOT NULL,
  `gibbonPersonIDParent` int(10) unsigned zerofill NOT NULL,
  `gibbonPersonIDStudent` int(10) unsigned zerofill NOT NULL,
  `weekOfYear` int(2) NOT NULL,
  `key` varchar(40) NOT NULL,
  `confirmed` enum('N','Y') NOT NULL DEFAULT 'N',
  PRIMARY KEY (`gibbonPlannerParentWeeklyEmailSummaryID`),
  UNIQUE KEY `key` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibbonplannerparentweeklyemailsummary: ~0 rows (approximately)
/*!40000 ALTER TABLE `gibbonplannerparentweeklyemailsummary` DISABLE KEYS */;
/*!40000 ALTER TABLE `gibbonplannerparentweeklyemailsummary` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibbonreport
CREATE TABLE IF NOT EXISTS `gibbonreport` (
  `gibbonReportID` int(10) unsigned zerofill NOT NULL,
  `gibbonReportArchiveID` int(5) unsigned zerofill DEFAULT NULL,
  `gibbonReportTemplateID` int(10) unsigned zerofill DEFAULT NULL,
  `gibbonSchoolYearID` int(3) unsigned zerofill DEFAULT NULL,
  `name` varchar(90) DEFAULT NULL,
  `active` enum('Y','N') NOT NULL DEFAULT 'Y',
  `status` enum('None','Draft','Published') NOT NULL DEFAULT 'None',
  `gibbonReportingCycleID` int(10) unsigned zerofill DEFAULT NULL,
  `gibbonYearGroupIDList` varchar(255) DEFAULT NULL,
  `queryBuilderQueryID` int(10) unsigned zerofill DEFAULT NULL,
  `accessDate` datetime DEFAULT NULL,
  `timestampModified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `timestampGenerated` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`gibbonReportID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibbonreport: ~0 rows (approximately)
/*!40000 ALTER TABLE `gibbonreport` DISABLE KEYS */;
/*!40000 ALTER TABLE `gibbonreport` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibbonreportarchive
CREATE TABLE IF NOT EXISTS `gibbonreportarchive` (
  `gibbonReportArchiveID` int(5) unsigned zerofill NOT NULL,
  `name` varchar(90) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `readonly` enum('Y','N') NOT NULL DEFAULT 'N',
  `viewableStaff` enum('Y','N') NOT NULL DEFAULT 'N',
  `viewableStudents` enum('Y','N') NOT NULL DEFAULT 'N',
  `viewableParents` enum('Y','N') NOT NULL DEFAULT 'N',
  `viewableOther` enum('Y','N') NOT NULL DEFAULT 'N',
  PRIMARY KEY (`gibbonReportArchiveID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibbonreportarchive: ~1 rows (approximately)
/*!40000 ALTER TABLE `gibbonreportarchive` DISABLE KEYS */;
INSERT INTO `gibbonreportarchive` (`gibbonReportArchiveID`, `name`, `path`, `readonly`, `viewableStaff`, `viewableStudents`, `viewableParents`, `viewableOther`) VALUES
	(00001, 'Default Archive', '/uploads/reports', 'N', 'Y', 'N', 'N', 'N');
/*!40000 ALTER TABLE `gibbonreportarchive` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibbonreportarchiveentry
CREATE TABLE IF NOT EXISTS `gibbonreportarchiveentry` (
  `gibbonReportArchiveEntryID` int(12) unsigned zerofill NOT NULL,
  `gibbonReportArchiveID` int(5) unsigned zerofill DEFAULT NULL,
  `gibbonReportID` int(10) unsigned zerofill DEFAULT NULL,
  `gibbonSchoolYearID` int(3) unsigned zerofill DEFAULT NULL,
  `gibbonYearGroupID` int(3) unsigned zerofill DEFAULT NULL,
  `gibbonRollGroupID` int(5) unsigned zerofill DEFAULT NULL,
  `gibbonPersonID` int(10) unsigned zerofill NOT NULL,
  `type` enum('Single','Batch') NOT NULL DEFAULT 'Single',
  `status` enum('Draft','Final') NOT NULL DEFAULT 'Draft',
  `reportIdentifier` varchar(255) DEFAULT NULL,
  `filePath` varchar(255) DEFAULT NULL,
  `timestampCreated` timestamp NULL DEFAULT NULL,
  `timestampModified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gibbonPersonIDAccessed` int(10) unsigned zerofill DEFAULT NULL,
  `timestampAccessed` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`gibbonReportArchiveEntryID`),
  UNIQUE KEY `archiveEntry` (`gibbonReportArchiveID`,`gibbonSchoolYearID`,`reportIdentifier`,`type`,`gibbonYearGroupID`,`gibbonPersonID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibbonreportarchiveentry: ~0 rows (approximately)
/*!40000 ALTER TABLE `gibbonreportarchiveentry` DISABLE KEYS */;
/*!40000 ALTER TABLE `gibbonreportarchiveentry` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibbonreportingaccess
CREATE TABLE IF NOT EXISTS `gibbonreportingaccess` (
  `gibbonReportingAccessID` int(10) unsigned zerofill NOT NULL,
  `gibbonReportingCycleID` int(10) unsigned zerofill DEFAULT NULL,
  `gibbonReportingScopeIDList` varchar(255) DEFAULT NULL,
  `gibbonRoleIDList` varchar(255) DEFAULT NULL,
  `gibbonPersonIDList` varchar(255) DEFAULT NULL,
  `accessType` enum('Role','Person') NOT NULL DEFAULT 'Role',
  `dateStart` date DEFAULT NULL,
  `dateEnd` date DEFAULT NULL,
  `canWrite` enum('Y','N') NOT NULL DEFAULT 'N',
  `canProofRead` enum('Y','N') NOT NULL DEFAULT 'N',
  PRIMARY KEY (`gibbonReportingAccessID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibbonreportingaccess: ~0 rows (approximately)
/*!40000 ALTER TABLE `gibbonreportingaccess` DISABLE KEYS */;
/*!40000 ALTER TABLE `gibbonreportingaccess` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibbonreportingcriteria
CREATE TABLE IF NOT EXISTS `gibbonreportingcriteria` (
  `gibbonReportingCriteriaID` int(12) unsigned zerofill NOT NULL,
  `gibbonReportingCycleID` int(10) unsigned zerofill DEFAULT NULL,
  `gibbonReportingScopeID` int(10) unsigned zerofill DEFAULT NULL,
  `gibbonReportingCriteriaTypeID` int(10) unsigned zerofill DEFAULT NULL,
  `gibbonYearGroupID` int(3) unsigned zerofill DEFAULT NULL,
  `gibbonRollGroupID` int(5) unsigned zerofill DEFAULT NULL,
  `gibbonCourseID` int(8) unsigned zerofill DEFAULT NULL,
  `target` enum('Per Student','Per Group') NOT NULL DEFAULT 'Per Student',
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `category` varchar(255) DEFAULT NULL,
  `gibbonScaleID` int(5) unsigned zerofill DEFAULT NULL,
  `sequenceNumber` int(3) DEFAULT NULL,
  `groupID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`gibbonReportingCriteriaID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibbonreportingcriteria: ~0 rows (approximately)
/*!40000 ALTER TABLE `gibbonreportingcriteria` DISABLE KEYS */;
/*!40000 ALTER TABLE `gibbonreportingcriteria` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibbonreportingcriteriatype
CREATE TABLE IF NOT EXISTS `gibbonreportingcriteriatype` (
  `gibbonReportingCriteriaTypeID` int(10) unsigned zerofill NOT NULL,
  `name` varchar(90) DEFAULT NULL,
  `valueType` varchar(30) DEFAULT NULL,
  `active` enum('Y','N') NOT NULL DEFAULT 'Y',
  `characterLimit` int(6) DEFAULT NULL,
  `gibbonScaleID` int(5) unsigned zerofill DEFAULT NULL,
  PRIMARY KEY (`gibbonReportingCriteriaTypeID`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibbonreportingcriteriatype: ~2 rows (approximately)
/*!40000 ALTER TABLE `gibbonreportingcriteriatype` DISABLE KEYS */;
INSERT INTO `gibbonreportingcriteriatype` (`gibbonReportingCriteriaTypeID`, `name`, `valueType`, `active`, `characterLimit`, `gibbonScaleID`) VALUES
	(0000000001, 'Comment, Short', 'Comment', 'Y', 500, NULL),
	(0000000002, 'Comment, Long', 'Comment', 'Y', 1000, NULL);
/*!40000 ALTER TABLE `gibbonreportingcriteriatype` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibbonreportingcycle
CREATE TABLE IF NOT EXISTS `gibbonreportingcycle` (
  `gibbonReportingCycleID` int(10) unsigned zerofill NOT NULL,
  `gibbonSchoolYearID` int(3) unsigned zerofill DEFAULT NULL,
  `gibbonYearGroupIDList` varchar(255) DEFAULT NULL,
  `name` varchar(90) DEFAULT NULL,
  `nameShort` varchar(20) DEFAULT NULL,
  `sequenceNumber` int(3) DEFAULT NULL,
  `cycleNumber` int(3) DEFAULT NULL,
  `cycleTotal` int(3) DEFAULT NULL,
  `dateStart` date DEFAULT NULL,
  `dateEnd` date DEFAULT NULL,
  `milestones` text,
  `notes` text,
  PRIMARY KEY (`gibbonReportingCycleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibbonreportingcycle: ~0 rows (approximately)
/*!40000 ALTER TABLE `gibbonreportingcycle` DISABLE KEYS */;
/*!40000 ALTER TABLE `gibbonreportingcycle` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibbonreportingprogress
CREATE TABLE IF NOT EXISTS `gibbonreportingprogress` (
  `gibbonReportingProgressID` int(12) unsigned zerofill NOT NULL,
  `gibbonReportingScopeID` int(10) unsigned zerofill DEFAULT NULL,
  `gibbonYearGroupID` int(3) unsigned zerofill DEFAULT NULL,
  `gibbonRollGroupID` int(5) unsigned zerofill DEFAULT NULL,
  `gibbonCourseClassID` int(8) unsigned zerofill NOT NULL,
  `gibbonPersonIDStudent` int(10) unsigned zerofill NOT NULL,
  `status` enum('In Progress','Complete') NOT NULL DEFAULT 'In Progress',
  PRIMARY KEY (`gibbonReportingProgressID`),
  UNIQUE KEY `gibbonReportingScopeID` (`gibbonReportingScopeID`,`gibbonCourseClassID`,`gibbonPersonIDStudent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibbonreportingprogress: ~0 rows (approximately)
/*!40000 ALTER TABLE `gibbonreportingprogress` DISABLE KEYS */;
/*!40000 ALTER TABLE `gibbonreportingprogress` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibbonreportingproof
CREATE TABLE IF NOT EXISTS `gibbonreportingproof` (
  `gibbonReportingProofID` int(12) unsigned zerofill NOT NULL,
  `gibbonReportingValueID` int(12) unsigned zerofill DEFAULT NULL,
  `status` enum('Done','Edited','Accepted','Declined') NOT NULL DEFAULT 'Done',
  `reason` varchar(255) DEFAULT NULL,
  `comment` text,
  `gibbonPersonIDProofed` int(10) unsigned zerofill DEFAULT NULL,
  `timestampProofed` timestamp NULL DEFAULT NULL,
  `gibbonPersonIDActioned` int(10) unsigned zerofill DEFAULT NULL,
  `timestampActioned` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`gibbonReportingProofID`),
  UNIQUE KEY `gibbonReportingValueID` (`gibbonReportingValueID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibbonreportingproof: ~0 rows (approximately)
/*!40000 ALTER TABLE `gibbonreportingproof` DISABLE KEYS */;
/*!40000 ALTER TABLE `gibbonreportingproof` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibbonreportingscope
CREATE TABLE IF NOT EXISTS `gibbonreportingscope` (
  `gibbonReportingScopeID` int(10) unsigned zerofill NOT NULL,
  `gibbonReportingCycleID` int(10) unsigned zerofill DEFAULT NULL,
  `scopeType` enum('Year Group','Roll Group','Course') NOT NULL DEFAULT 'Year Group',
  `name` varchar(90) DEFAULT NULL,
  `sequenceNumber` int(3) DEFAULT NULL,
  PRIMARY KEY (`gibbonReportingScopeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibbonreportingscope: ~0 rows (approximately)
/*!40000 ALTER TABLE `gibbonreportingscope` DISABLE KEYS */;
/*!40000 ALTER TABLE `gibbonreportingscope` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibbonreportingvalue
CREATE TABLE IF NOT EXISTS `gibbonreportingvalue` (
  `gibbonReportingValueID` int(12) unsigned zerofill NOT NULL,
  `gibbonReportingCycleID` int(10) unsigned zerofill DEFAULT NULL,
  `gibbonReportingCriteriaID` int(12) unsigned zerofill DEFAULT NULL,
  `gibbonSchoolYearID` int(3) unsigned zerofill DEFAULT NULL,
  `gibbonCourseClassID` int(8) unsigned zerofill NOT NULL,
  `gibbonPersonIDStudent` int(10) unsigned zerofill NOT NULL,
  `gibbonScaleGradeID` int(7) unsigned zerofill DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `comment` text,
  `gibbonPersonIDCreated` int(10) unsigned zerofill DEFAULT NULL,
  `timestampCreated` timestamp NULL DEFAULT NULL,
  `gibbonPersonIDModified` int(10) unsigned zerofill DEFAULT NULL,
  `timestampModified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`gibbonReportingValueID`),
  UNIQUE KEY `gibbonReportingCriteriaID` (`gibbonReportingCriteriaID`,`gibbonPersonIDStudent`,`gibbonCourseClassID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibbonreportingvalue: ~0 rows (approximately)
/*!40000 ALTER TABLE `gibbonreportingvalue` DISABLE KEYS */;
/*!40000 ALTER TABLE `gibbonreportingvalue` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibbonreportprototypesection
CREATE TABLE IF NOT EXISTS `gibbonreportprototypesection` (
  `gibbonReportPrototypeSectionID` int(10) unsigned zerofill NOT NULL,
  `name` varchar(90) DEFAULT NULL,
  `type` enum('Core','Additional') NOT NULL DEFAULT 'Additional',
  `category` varchar(90) DEFAULT NULL,
  `types` varchar(60) DEFAULT NULL,
  `config` text,
  `templateParams` text,
  `templateFile` varchar(255) DEFAULT NULL,
  `dataSources` text,
  `icon` varchar(120) DEFAULT NULL,
  `fonts` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`gibbonReportPrototypeSectionID`),
  UNIQUE KEY `type` (`type`,`templateFile`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibbonreportprototypesection: ~0 rows (approximately)
/*!40000 ALTER TABLE `gibbonreportprototypesection` DISABLE KEYS */;
/*!40000 ALTER TABLE `gibbonreportprototypesection` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibbonreporttemplate
CREATE TABLE IF NOT EXISTS `gibbonreporttemplate` (
  `gibbonReportTemplateID` int(10) unsigned zerofill NOT NULL,
  `context` enum('Student Enrolment','Reporting Cycle','Custom Query') NOT NULL DEFAULT 'Student Enrolment',
  `name` varchar(90) DEFAULT NULL,
  `active` enum('Y','N') NOT NULL DEFAULT 'Y',
  `orientation` char(1) NOT NULL DEFAULT 'P',
  `pageSize` varchar(20) NOT NULL DEFAULT 'A4',
  `marginX` decimal(4,2) NOT NULL DEFAULT '10.00',
  `marginY` decimal(4,2) NOT NULL DEFAULT '10.00',
  `flags` int(10) unsigned zerofill DEFAULT NULL,
  `config` text,
  `stylesheet` varchar(120) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`gibbonReportTemplateID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibbonreporttemplate: ~0 rows (approximately)
/*!40000 ALTER TABLE `gibbonreporttemplate` DISABLE KEYS */;
/*!40000 ALTER TABLE `gibbonreporttemplate` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibbonreporttemplatefont
CREATE TABLE IF NOT EXISTS `gibbonreporttemplatefont` (
  `gibbonReportTemplateFontID` int(10) unsigned zerofill NOT NULL,
  `fontName` varchar(90) NOT NULL,
  `fontTCPDF` varchar(90) DEFAULT NULL,
  `fontPath` text,
  `fontType` enum('R','B','I','BI') NOT NULL DEFAULT 'R',
  `fontFamily` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`gibbonReportTemplateFontID`),
  UNIQUE KEY `fontTCPDF` (`fontTCPDF`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibbonreporttemplatefont: ~0 rows (approximately)
/*!40000 ALTER TABLE `gibbonreporttemplatefont` DISABLE KEYS */;
/*!40000 ALTER TABLE `gibbonreporttemplatefont` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibbonreporttemplatesection
CREATE TABLE IF NOT EXISTS `gibbonreporttemplatesection` (
  `gibbonReportTemplateSectionID` int(10) unsigned zerofill NOT NULL,
  `gibbonReportTemplateID` int(10) unsigned zerofill DEFAULT NULL,
  `gibbonReportPrototypeSectionID` int(10) unsigned zerofill DEFAULT NULL,
  `name` varchar(90) DEFAULT NULL,
  `type` enum('Body','Header','Footer') NOT NULL DEFAULT 'Body',
  `flags` int(10) unsigned zerofill DEFAULT NULL,
  `page` int(3) NOT NULL DEFAULT '0',
  `config` text,
  `sequenceNumber` int(3) unsigned DEFAULT NULL,
  `templateParams` text,
  `templateContent` text,
  PRIMARY KEY (`gibbonReportTemplateSectionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibbonreporttemplatesection: ~0 rows (approximately)
/*!40000 ALTER TABLE `gibbonreporttemplatesection` DISABLE KEYS */;
/*!40000 ALTER TABLE `gibbonreporttemplatesection` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibbonresource
CREATE TABLE IF NOT EXISTS `gibbonresource` (
  `gibbonResourceID` int(14) unsigned zerofill NOT NULL,
  `name` varchar(60) NOT NULL,
  `description` text NOT NULL,
  `gibbonYearGroupIDList` varchar(255) NOT NULL,
  `type` enum('File','HTML','Link') NOT NULL,
  `category` varchar(255) NOT NULL,
  `purpose` varchar(255) NOT NULL,
  `tags` text NOT NULL,
  `content` text NOT NULL,
  `gibbonPersonID` int(10) unsigned zerofill NOT NULL,
  `timestamp` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`gibbonResourceID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibbonresource: ~0 rows (approximately)
/*!40000 ALTER TABLE `gibbonresource` DISABLE KEYS */;
/*!40000 ALTER TABLE `gibbonresource` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibbonresourcetag
CREATE TABLE IF NOT EXISTS `gibbonresourcetag` (
  `gibbonResourceTagID` int(12) unsigned zerofill NOT NULL,
  `tag` varchar(100) NOT NULL,
  `count` int(6) NOT NULL,
  PRIMARY KEY (`gibbonResourceTagID`),
  UNIQUE KEY `tag` (`tag`),
  KEY `tag_2` (`tag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibbonresourcetag: ~0 rows (approximately)
/*!40000 ALTER TABLE `gibbonresourcetag` DISABLE KEYS */;
/*!40000 ALTER TABLE `gibbonresourcetag` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibbonrole
CREATE TABLE IF NOT EXISTS `gibbonrole` (
  `gibbonRoleID` int(3) unsigned zerofill NOT NULL,
  `category` enum('Staff','Student','Parent','Other') NOT NULL DEFAULT 'Staff',
  `name` varchar(20) NOT NULL,
  `nameShort` varchar(4) NOT NULL,
  `description` varchar(60) NOT NULL,
  `type` enum('Core','Additional') NOT NULL DEFAULT 'Core',
  `canLoginRole` enum('Y','N') NOT NULL DEFAULT 'Y',
  `futureYearsLogin` enum('Y','N') NOT NULL DEFAULT 'Y',
  `pastYearsLogin` enum('Y','N') NOT NULL DEFAULT 'Y',
  `restriction` enum('None','Same Role','Admin Only') NOT NULL DEFAULT 'None',
  PRIMARY KEY (`gibbonRoleID`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `nameShort` (`nameShort`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibbonrole: ~5 rows (approximately)
/*!40000 ALTER TABLE `gibbonrole` DISABLE KEYS */;
INSERT INTO `gibbonrole` (`gibbonRoleID`, `category`, `name`, `nameShort`, `description`, `type`, `canLoginRole`, `futureYearsLogin`, `pastYearsLogin`, `restriction`) VALUES
	(001, 'Staff', 'Administrator', 'Adm', 'Controls all aspects of the system', 'Core', 'Y', 'Y', 'Y', 'Admin Only'),
	(002, 'Staff', 'Teacher', 'Tcr', 'Regular, classroom teacher', 'Core', 'Y', 'Y', 'Y', 'None'),
	(003, 'Student', 'Student', 'Std', 'Person studying in the school', 'Core', 'Y', 'Y', 'Y', 'None'),
	(004, 'Parent', 'Parent', 'Prt', 'Parent or guardian of person studying in', 'Core', 'Y', 'Y', 'Y', 'None'),
	(006, 'Staff', 'Support Staff', 'SSt', 'Staff who support teaching and learning', 'Core', 'Y', 'Y', 'Y', 'None');
/*!40000 ALTER TABLE `gibbonrole` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibbonrollgroup
CREATE TABLE IF NOT EXISTS `gibbonrollgroup` (
  `gibbonRollGroupID` int(5) unsigned zerofill NOT NULL,
  `gibbonSchoolYearID` int(3) unsigned zerofill NOT NULL,
  `name` varchar(20) NOT NULL,
  `nameShort` varchar(8) NOT NULL,
  `gibbonPersonIDTutor` int(10) unsigned zerofill DEFAULT NULL,
  `gibbonPersonIDTutor2` int(10) unsigned zerofill DEFAULT NULL,
  `gibbonPersonIDTutor3` int(10) unsigned zerofill DEFAULT NULL,
  `gibbonPersonIDEA` int(10) unsigned zerofill DEFAULT NULL,
  `gibbonPersonIDEA2` int(10) unsigned zerofill DEFAULT NULL,
  `gibbonPersonIDEA3` int(10) unsigned zerofill DEFAULT NULL,
  `gibbonSpaceID` int(5) unsigned zerofill DEFAULT NULL,
  `gibbonRollGroupIDNext` int(5) unsigned zerofill DEFAULT NULL,
  `attendance` enum('Y','N') NOT NULL DEFAULT 'Y',
  `website` varchar(255) NOT NULL,
  PRIMARY KEY (`gibbonRollGroupID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibbonrollgroup: ~0 rows (approximately)
/*!40000 ALTER TABLE `gibbonrollgroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `gibbonrollgroup` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibbonrubric
CREATE TABLE IF NOT EXISTS `gibbonrubric` (
  `gibbonRubricID` int(8) unsigned zerofill NOT NULL,
  `name` varchar(50) NOT NULL,
  `category` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `active` enum('Y','N') NOT NULL,
  `scope` enum('School','Learning Area') NOT NULL,
  `gibbonDepartmentID` int(4) unsigned zerofill DEFAULT NULL,
  `gibbonYearGroupIDList` varchar(255) NOT NULL,
  `gibbonScaleID` int(5) unsigned zerofill DEFAULT NULL,
  `gibbonPersonIDCreator` int(10) unsigned zerofill NOT NULL,
  PRIMARY KEY (`gibbonRubricID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibbonrubric: ~0 rows (approximately)
/*!40000 ALTER TABLE `gibbonrubric` DISABLE KEYS */;
/*!40000 ALTER TABLE `gibbonrubric` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibbonrubriccell
CREATE TABLE IF NOT EXISTS `gibbonrubriccell` (
  `gibbonRubricCellID` int(11) unsigned zerofill NOT NULL,
  `gibbonRubricID` int(8) unsigned zerofill NOT NULL,
  `gibbonRubricColumnID` int(9) unsigned zerofill NOT NULL,
  `gibbonRubricRowID` int(9) unsigned zerofill NOT NULL,
  `contents` text NOT NULL,
  PRIMARY KEY (`gibbonRubricCellID`),
  KEY `gibbonRubricID` (`gibbonRubricID`),
  KEY `gibbonRubricColumnID` (`gibbonRubricColumnID`),
  KEY `gibbonRubricRowID` (`gibbonRubricRowID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibbonrubriccell: ~0 rows (approximately)
/*!40000 ALTER TABLE `gibbonrubriccell` DISABLE KEYS */;
/*!40000 ALTER TABLE `gibbonrubriccell` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibbonrubriccolumn
CREATE TABLE IF NOT EXISTS `gibbonrubriccolumn` (
  `gibbonRubricColumnID` int(9) unsigned zerofill NOT NULL,
  `gibbonRubricID` int(8) unsigned zerofill NOT NULL,
  `title` varchar(20) NOT NULL,
  `sequenceNumber` int(2) NOT NULL,
  `gibbonScaleGradeID` int(7) unsigned zerofill DEFAULT NULL,
  `visualise` enum('Y','N') NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`gibbonRubricColumnID`),
  KEY `gibbonRubricID` (`gibbonRubricID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibbonrubriccolumn: ~0 rows (approximately)
/*!40000 ALTER TABLE `gibbonrubriccolumn` DISABLE KEYS */;
/*!40000 ALTER TABLE `gibbonrubriccolumn` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibbonrubricentry
CREATE TABLE IF NOT EXISTS `gibbonrubricentry` (
  `gibbonRubricEntry` int(14) unsigned zerofill NOT NULL,
  `gibbonRubricID` int(8) unsigned zerofill NOT NULL,
  `gibbonPersonID` int(10) unsigned zerofill NOT NULL,
  `gibbonRubricCellID` int(11) unsigned zerofill NOT NULL,
  `contextDBTable` varchar(255) NOT NULL COMMENT 'Which database table is this entry related to?',
  `contextDBTableID` int(20) unsigned zerofill NOT NULL,
  PRIMARY KEY (`gibbonRubricEntry`),
  KEY `gibbonRubricID` (`gibbonRubricID`),
  KEY `gibbonPersonID` (`gibbonPersonID`),
  KEY `gibbonRubricCellID` (`gibbonRubricCellID`),
  KEY `contextDBTable` (`contextDBTable`),
  KEY `contextDBTableID` (`contextDBTableID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibbonrubricentry: ~0 rows (approximately)
/*!40000 ALTER TABLE `gibbonrubricentry` DISABLE KEYS */;
/*!40000 ALTER TABLE `gibbonrubricentry` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibbonrubricrow
CREATE TABLE IF NOT EXISTS `gibbonrubricrow` (
  `gibbonRubricRowID` int(9) unsigned zerofill NOT NULL,
  `gibbonRubricID` int(8) unsigned zerofill NOT NULL,
  `title` varchar(40) NOT NULL,
  `sequenceNumber` int(2) NOT NULL,
  `gibbonOutcomeID` int(8) unsigned zerofill DEFAULT NULL,
  PRIMARY KEY (`gibbonRubricRowID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibbonrubricrow: ~0 rows (approximately)
/*!40000 ALTER TABLE `gibbonrubricrow` DISABLE KEYS */;
/*!40000 ALTER TABLE `gibbonrubricrow` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibbonscale
CREATE TABLE IF NOT EXISTS `gibbonscale` (
  `gibbonScaleID` int(5) unsigned zerofill NOT NULL,
  `name` varchar(40) NOT NULL,
  `nameShort` varchar(5) NOT NULL,
  `usage` varchar(50) NOT NULL,
  `lowestAcceptable` varchar(5) DEFAULT NULL COMMENT 'This is the sequence number of the lowest grade a student can get without being unsatisfactory',
  `active` enum('Y','N') NOT NULL DEFAULT 'Y',
  `numeric` enum('N','Y') NOT NULL DEFAULT 'N',
  PRIMARY KEY (`gibbonScaleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibbonscale: ~14 rows (approximately)
/*!40000 ALTER TABLE `gibbonscale` DISABLE KEYS */;
INSERT INTO `gibbonscale` (`gibbonScaleID`, `name`, `nameShort`, `usage`, `lowestAcceptable`, `active`, `numeric`) VALUES
	(00001, 'International Baccalaureate', 'IB', '7 (highest) to 1 (lowest)', '', 'N', 'Y'),
	(00002, 'International Baccalaureate EE', 'IBEE', 'A (highest) to E (lowest)', '', 'N', 'N'),
	(00003, 'United Kingdom GCSE/iGCSE', 'GCSE', 'A* (highest) to U (lowest)', '', 'Y', 'N'),
	(00004, 'Percentage', '%', '100 (highest) to 0 (lowest)', '51', 'Y', 'Y'),
	(00005, 'Full Letter Grade', 'FLG', 'A+ (highest) to F (lowest)', '', 'N', 'N'),
	(00006, 'Simple Letter Grade', 'SLG', 'A (highest) to F (lowest)', '', 'N', 'N'),
	(00007, 'International College HK', 'ICHK', '7 (highest) to 1 (lowest)', '4', 'Y', 'Y'),
	(00009, 'Completion', 'Comp', 'Has task has been completed?', '1', 'Y', 'N'),
	(00010, 'Cognitive Abilities Test', 'CAT', '140 (highest) to 60 (lowest)', '70', 'Y', 'Y'),
	(00011, 'UK National Curriculum KS3', 'KS3', '8A (highest) to B3 (lowest)', '14', 'Y', 'N'),
	(00012, 'United Kingdom GCSE/iGCSE Predicted', 'GPrd', '8A (highest) to B3 (lowest)', '', 'Y', 'N'),
	(00013, 'IB Diploma (Subject)', 'IBDS', '7 (highest) to 1 (lowest)', '4', 'Y', 'Y'),
	(00014, 'IB Diploma (Total)', 'IBDT', '45 (highest) to 0', '22', 'Y', 'Y'),
	(00015, 'UK National Curriculum KS3 Simplified', 'KS3S', 'Level 8 (highest) to Level 3 (lowest)', '4', 'Y', 'N');
/*!40000 ALTER TABLE `gibbonscale` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibbonscalegrade
CREATE TABLE IF NOT EXISTS `gibbonscalegrade` (
  `gibbonScaleGradeID` int(7) unsigned zerofill NOT NULL,
  `gibbonScaleID` int(5) unsigned zerofill NOT NULL,
  `value` varchar(10) NOT NULL,
  `descriptor` varchar(50) NOT NULL,
  `sequenceNumber` int(5) NOT NULL,
  `isDefault` enum('N','Y') NOT NULL DEFAULT 'N',
  PRIMARY KEY (`gibbonScaleGradeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibbonscalegrade: ~329 rows (approximately)
/*!40000 ALTER TABLE `gibbonscalegrade` DISABLE KEYS */;
INSERT INTO `gibbonscalegrade` (`gibbonScaleGradeID`, `gibbonScaleID`, `value`, `descriptor`, `sequenceNumber`, `isDefault`) VALUES
	(0000001, 00001, '7', '7', 1, 'N'),
	(0000002, 00001, '6', '6', 2, 'N'),
	(0000003, 00001, '5', '5', 3, 'N'),
	(0000004, 00001, '4', '4', 4, 'N'),
	(0000005, 00001, '3', '3', 5, 'N'),
	(0000006, 00001, '2', '2', 6, 'N'),
	(0000007, 00001, '1', '1', 7, 'N'),
	(0000008, 00002, 'A', '49–60', 1, 'N'),
	(0000009, 00002, 'B', '40–48', 2, 'N'),
	(0000010, 00002, 'C', '32–39', 3, 'N'),
	(0000011, 00002, 'D', '22–31', 4, 'N'),
	(0000012, 00002, 'E', '0–21', 5, 'N'),
	(0000013, 00003, 'A*', 'A*', 1, 'N'),
	(0000014, 00003, 'A', 'A', 2, 'N'),
	(0000015, 00003, 'B', 'B', 3, 'N'),
	(0000016, 00003, 'C', 'C', 4, 'N'),
	(0000017, 00003, 'D', 'D', 5, 'N'),
	(0000018, 00003, 'E', 'E', 6, 'N'),
	(0000019, 00003, 'F', 'F', 7, 'N'),
	(0000020, 00003, 'G', 'G', 8, 'N'),
	(0000021, 00003, 'U', 'Unclassified', 9, 'N'),
	(0000022, 00004, '100%', '100%', 1, 'N'),
	(0000023, 00004, '99%', '99%', 2, 'N'),
	(0000024, 00004, '98%', '98%', 3, 'N'),
	(0000025, 00004, '97%', '97%', 4, 'N'),
	(0000026, 00004, '96%', '96%', 5, 'N'),
	(0000027, 00004, '95%', '95%', 6, 'N'),
	(0000028, 00004, '94%', '94%', 7, 'N'),
	(0000029, 00004, '93%', '93%', 8, 'N'),
	(0000030, 00004, '92%', '92%', 9, 'N'),
	(0000031, 00004, '91%', '91%', 10, 'N'),
	(0000032, 00004, '90%', '90%', 11, 'N'),
	(0000033, 00004, '89%', '89%', 12, 'N'),
	(0000034, 00004, '88%', '88%', 13, 'N'),
	(0000035, 00004, '87%', '87%', 14, 'N'),
	(0000036, 00004, '86%', '86%', 15, 'N'),
	(0000037, 00004, '85%', '85%', 16, 'N'),
	(0000038, 00004, '84%', '84%', 17, 'N'),
	(0000039, 00004, '83%', '83%', 18, 'N'),
	(0000040, 00004, '82%', '82%', 19, 'N'),
	(0000041, 00004, '81%', '81%', 20, 'N'),
	(0000042, 00004, '80%', '80%', 21, 'N'),
	(0000043, 00004, '79%', '79%', 22, 'N'),
	(0000044, 00004, '78%', '78%', 23, 'N'),
	(0000045, 00004, '77%', '77%', 24, 'N'),
	(0000046, 00004, '76%', '76%', 25, 'N'),
	(0000047, 00004, '75%', '75%', 26, 'N'),
	(0000048, 00004, '74%', '74%', 27, 'N'),
	(0000049, 00004, '73%', '73%', 28, 'N'),
	(0000050, 00004, '72%', '72%', 29, 'N'),
	(0000051, 00004, '71%', '71%', 30, 'N'),
	(0000052, 00004, '70%', '70%', 31, 'N'),
	(0000053, 00004, '69%', '69%', 32, 'N'),
	(0000054, 00004, '68%', '68%', 33, 'N'),
	(0000055, 00004, '67%', '67%', 34, 'N'),
	(0000056, 00004, '66%', '66%', 35, 'N'),
	(0000057, 00004, '65%', '65%', 36, 'N'),
	(0000058, 00004, '64%', '64%', 37, 'N'),
	(0000059, 00004, '63%', '63%', 38, 'N'),
	(0000060, 00004, '62%', '62%', 39, 'N'),
	(0000061, 00004, '61%', '61%', 40, 'N'),
	(0000062, 00004, '60%', '60%', 41, 'N'),
	(0000063, 00004, '59%', '59%', 42, 'N'),
	(0000064, 00004, '58%', '58%', 43, 'N'),
	(0000065, 00004, '57%', '57%', 44, 'N'),
	(0000066, 00004, '56%', '56%', 45, 'N'),
	(0000067, 00004, '55%', '55%', 46, 'N'),
	(0000068, 00004, '54%', '54%', 47, 'N'),
	(0000069, 00004, '53%', '53%', 48, 'N'),
	(0000070, 00004, '52%', '52%', 49, 'N'),
	(0000071, 00004, '51%', '51%', 50, 'N'),
	(0000072, 00004, '50%', '50%', 51, 'N'),
	(0000073, 00004, '49%', '49%', 52, 'N'),
	(0000074, 00004, '48%', '48%', 53, 'N'),
	(0000075, 00004, '47%', '47%', 54, 'N'),
	(0000076, 00004, '46%', '46%', 55, 'N'),
	(0000077, 00004, '45%', '45%', 56, 'N'),
	(0000078, 00004, '44%', '44%', 57, 'N'),
	(0000079, 00004, '43%', '43%', 58, 'N'),
	(0000080, 00004, '42%', '42%', 59, 'N'),
	(0000081, 00004, '41%', '41%', 60, 'N'),
	(0000082, 00004, '40%', '40%', 61, 'N'),
	(0000083, 00004, '39%', '39%', 62, 'N'),
	(0000084, 00004, '38%', '38%', 63, 'N'),
	(0000085, 00004, '37%', '37%', 64, 'N'),
	(0000086, 00004, '36%', '36%', 65, 'N'),
	(0000087, 00004, '35%', '35%', 66, 'N'),
	(0000088, 00004, '34%', '34%', 67, 'N'),
	(0000089, 00004, '33%', '33%', 68, 'N'),
	(0000090, 00004, '32%', '32%', 69, 'N'),
	(0000091, 00004, '31%', '31%', 70, 'N'),
	(0000092, 00004, '30%', '30%', 71, 'N'),
	(0000093, 00004, '29%', '29%', 72, 'N'),
	(0000094, 00004, '28%', '28%', 73, 'N'),
	(0000095, 00004, '27%', '27%', 74, 'N'),
	(0000096, 00004, '26%', '26%', 75, 'N'),
	(0000097, 00004, '25%', '25%', 76, 'N'),
	(0000098, 00004, '24%', '24%', 77, 'N'),
	(0000099, 00004, '23%', '23%', 78, 'N'),
	(0000100, 00004, '22%', '22%', 79, 'N'),
	(0000101, 00004, '21%', '21%', 80, 'N'),
	(0000102, 00004, '20%', '20%', 81, 'N'),
	(0000103, 00004, '19%', '19%', 82, 'N'),
	(0000104, 00004, '18%', '18%', 83, 'N'),
	(0000105, 00004, '17%', '17%', 84, 'N'),
	(0000106, 00004, '16%', '16%', 85, 'N'),
	(0000107, 00004, '15%', '15%', 86, 'N'),
	(0000108, 00004, '14%', '14%', 87, 'N'),
	(0000109, 00004, '13%', '13%', 88, 'N'),
	(0000110, 00004, '12%', '12%', 89, 'N'),
	(0000111, 00004, '11%', '11%', 90, 'N'),
	(0000112, 00004, '10%', '10%', 91, 'N'),
	(0000113, 00004, '9%', '9%', 92, 'N'),
	(0000114, 00004, '8%', '8%', 93, 'N'),
	(0000115, 00004, '7%', '7%', 94, 'N'),
	(0000116, 00004, '6%', '6%', 95, 'N'),
	(0000117, 00004, '5%', '5%', 96, 'N'),
	(0000118, 00004, '4%', '4%', 97, 'N'),
	(0000119, 00004, '3%', '3%', 98, 'N'),
	(0000120, 00004, '2%', '2%', 99, 'N'),
	(0000121, 00004, '1%', '1%', 100, 'N'),
	(0000122, 00004, '0%', '0%', 101, 'N'),
	(0000123, 00005, 'A+', 'A+', 1, 'N'),
	(0000124, 00005, 'A', 'A', 2, 'N'),
	(0000125, 00005, 'A-', 'A-', 3, 'N'),
	(0000126, 00005, 'B+', 'B+', 4, 'N'),
	(0000127, 00005, 'B', 'B', 5, 'N'),
	(0000128, 00005, 'B-', 'B-', 6, 'N'),
	(0000129, 00005, 'C+', 'C+', 7, 'N'),
	(0000130, 00005, 'C', 'C', 8, 'N'),
	(0000131, 00005, 'C-', 'C-', 9, 'N'),
	(0000132, 00005, 'D+', 'D+', 10, 'N'),
	(0000133, 00005, 'D', 'D', 11, 'N'),
	(0000134, 00005, 'D-', 'D-', 12, 'N'),
	(0000135, 00005, 'E+', 'E+', 13, 'N'),
	(0000136, 00005, 'E', 'E', 14, 'N'),
	(0000137, 00005, 'E-', 'E-', 15, 'N'),
	(0000138, 00005, 'F', 'F', 16, 'N'),
	(0000139, 00006, 'A', 'A', 1, 'N'),
	(0000140, 00006, 'B', 'B', 2, 'N'),
	(0000141, 00006, 'C', 'C', 3, 'N'),
	(0000142, 00006, 'D', 'D', 4, 'N'),
	(0000143, 00006, 'E', 'E', 5, 'N'),
	(0000144, 00006, 'F', 'F', 6, 'N'),
	(0000145, 00007, '7', 'Exceptional  Performance', 1, 'N'),
	(0000146, 00007, '6', 'Well Above Expected Level', 2, 'N'),
	(0000147, 00007, '5', 'Above Expected Level', 3, 'N'),
	(0000148, 00007, '4', 'At Expected Level', 4, 'N'),
	(0000149, 00007, '3', 'Below Expected Level', 5, 'N'),
	(0000150, 00007, '2', 'Well Below Expected Level', 6, 'N'),
	(0000151, 00007, '1', 'Cause For Concern', 7, 'N'),
	(0000152, 00009, 'Complete', 'Work complete', 1, 'N'),
	(0000153, 00009, 'Incomplete', 'Work incomplete', 3, 'N'),
	(0000154, 00009, 'Late', 'Work submitted late', 2, 'N'),
	(0000155, 00007, 'Incomplete', 'Work incomplete', 8, 'N'),
	(0000156, 00001, 'Incomplete', 'Work incomplete', 8, 'N'),
	(0000157, 00003, 'Incomplete', 'Work incomplete', 10, 'N'),
	(0000158, 00004, 'Incomplete', 'Work incomplete', 102, 'N'),
	(0000159, 00005, 'Incomplete', 'Work incomplete', 17, 'N'),
	(0000160, 00006, 'Incomplete', 'Work incomplete', 7, 'N'),
	(0000162, 00010, '60', '60', 110, 'N'),
	(0000163, 00010, '61', '61', 109, 'N'),
	(0000164, 00010, '62', '62', 108, 'N'),
	(0000165, 00010, '63', '63', 107, 'N'),
	(0000166, 00010, '64', '64', 106, 'N'),
	(0000167, 00010, '65', '65', 105, 'N'),
	(0000168, 00010, '66', '66', 104, 'N'),
	(0000169, 00010, '67', '67', 103, 'N'),
	(0000170, 00010, '68', '68', 102, 'N'),
	(0000171, 00010, '69', '69', 101, 'N'),
	(0000172, 00010, '70', '70', 100, 'N'),
	(0000173, 00010, '71', '71', 99, 'N'),
	(0000174, 00010, '72', '72', 98, 'N'),
	(0000175, 00010, '73', '73', 97, 'N'),
	(0000176, 00010, '74', '74', 96, 'N'),
	(0000177, 00010, '75', '75', 95, 'N'),
	(0000178, 00010, '76', '76', 94, 'N'),
	(0000179, 00010, '77', '77', 93, 'N'),
	(0000180, 00010, '78', '78', 92, 'N'),
	(0000181, 00010, '79', '79', 91, 'N'),
	(0000182, 00010, '80', '80', 90, 'N'),
	(0000183, 00010, '81', '81', 89, 'N'),
	(0000184, 00010, '82', '82', 88, 'N'),
	(0000185, 00010, '83', '83', 87, 'N'),
	(0000186, 00010, '84', '84', 86, 'N'),
	(0000187, 00010, '85', '85', 85, 'N'),
	(0000188, 00010, '86', '86', 84, 'N'),
	(0000189, 00010, '87', '87', 83, 'N'),
	(0000190, 00010, '88', '88', 82, 'N'),
	(0000191, 00010, '89', '89', 81, 'N'),
	(0000192, 00010, '90', '90', 80, 'N'),
	(0000193, 00010, '91', '91', 79, 'N'),
	(0000194, 00010, '92', '92', 78, 'N'),
	(0000195, 00010, '93', '93', 77, 'N'),
	(0000196, 00010, '94', '94', 76, 'N'),
	(0000197, 00010, '95', '95', 75, 'N'),
	(0000198, 00010, '96', '96', 74, 'N'),
	(0000199, 00010, '97', '97', 73, 'N'),
	(0000200, 00010, '98', '98', 72, 'N'),
	(0000201, 00010, '99', '99', 71, 'N'),
	(0000202, 00010, '100', '100', 70, 'N'),
	(0000203, 00010, '101', '101', 69, 'N'),
	(0000204, 00010, '102', '102', 68, 'N'),
	(0000205, 00010, '103', '103', 67, 'N'),
	(0000206, 00010, '104', '104', 66, 'N'),
	(0000207, 00010, '105', '105', 65, 'N'),
	(0000208, 00010, '106', '106', 64, 'N'),
	(0000209, 00010, '107', '107', 63, 'N'),
	(0000210, 00010, '108', '108', 62, 'N'),
	(0000211, 00010, '109', '109', 61, 'N'),
	(0000212, 00010, '110', '110', 60, 'N'),
	(0000213, 00010, '111', '111', 59, 'N'),
	(0000214, 00010, '112', '112', 58, 'N'),
	(0000215, 00010, '113', '113', 57, 'N'),
	(0000216, 00010, '114', '114', 56, 'N'),
	(0000217, 00010, '115', '115', 55, 'N'),
	(0000218, 00010, '116', '116', 54, 'N'),
	(0000219, 00010, '117', '117', 53, 'N'),
	(0000220, 00010, '118', '118', 52, 'N'),
	(0000221, 00010, '119', '119', 51, 'N'),
	(0000222, 00010, '120', '120', 50, 'N'),
	(0000223, 00010, '121', '121', 49, 'N'),
	(0000224, 00010, '122', '122', 48, 'N'),
	(0000225, 00010, '123', '123', 47, 'N'),
	(0000226, 00010, '124', '124', 46, 'N'),
	(0000227, 00010, '125', '125', 45, 'N'),
	(0000228, 00010, '126', '126', 44, 'N'),
	(0000229, 00010, '127', '127', 43, 'N'),
	(0000230, 00010, '128', '128', 42, 'N'),
	(0000231, 00010, '129', '129', 41, 'N'),
	(0000232, 00010, '130', '130', 40, 'N'),
	(0000233, 00010, '131', '131', 39, 'N'),
	(0000234, 00010, '132', '132', 38, 'N'),
	(0000235, 00010, '133', '133', 37, 'N'),
	(0000236, 00010, '134', '134', 36, 'N'),
	(0000237, 00010, '135', '135', 35, 'N'),
	(0000238, 00010, '136', '136', 34, 'N'),
	(0000239, 00010, '137', '137', 33, 'N'),
	(0000240, 00010, '138', '138', 32, 'N'),
	(0000241, 00010, '139', '139', 31, 'N'),
	(0000242, 00010, '140', '140', 30, 'N'),
	(0000243, 00011, '8A', '8A', 1, 'N'),
	(0000244, 00011, '8B', '8B', 2, 'N'),
	(0000245, 00011, '8C', '8C', 3, 'N'),
	(0000246, 00011, '7A', '7A', 4, 'N'),
	(0000247, 00011, '7B', '7B', 5, 'N'),
	(0000248, 00011, '7C', '7C', 6, 'N'),
	(0000249, 00011, '6A', '6A', 7, 'N'),
	(0000250, 00011, '6B', '6B', 8, 'N'),
	(0000251, 00011, '6C', '6C', 9, 'N'),
	(0000252, 00011, '5A', '5A', 9, 'N'),
	(0000253, 00011, '5B', '5B', 10, 'N'),
	(0000254, 00011, '5C', '5C', 11, 'N'),
	(0000255, 00011, '4A', '4A', 12, 'N'),
	(0000256, 00011, '4B', '4B', 13, 'N'),
	(0000257, 00011, '4C', '4C', 14, 'N'),
	(0000258, 00011, 'B3', 'B3', 15, 'N'),
	(0000259, 00012, 'A', 'A', 1, 'N'),
	(0000260, 00012, 'A/B', 'A/B', 2, 'N'),
	(0000261, 00012, 'B', 'B', 3, 'N'),
	(0000262, 00012, 'B/C', 'B/C', 4, 'N'),
	(0000263, 00012, 'C', 'C', 5, 'N'),
	(0000264, 00012, 'C/D', 'C/D', 6, 'N'),
	(0000265, 00012, 'D', 'D', 7, 'N'),
	(0000266, 00012, 'D/E', 'D/E', 8, 'N'),
	(0000267, 00012, 'E', 'E', 9, 'N'),
	(0000268, 00012, 'E/F', 'E/F', 10, 'N'),
	(0000269, 00012, 'F', 'F', 11, 'N'),
	(0000270, 00012, 'G', 'G', 12, 'N'),
	(0000271, 00012, 'U', 'Unclassified', 13, 'N'),
	(0000272, 00010, '141', '141', 29, 'N'),
	(0000273, 00013, '7', '7', 1, 'N'),
	(0000274, 00013, '6', '6', 2, 'N'),
	(0000275, 00013, '5', '5', 3, 'N'),
	(0000276, 00013, '4', '4', 4, 'N'),
	(0000277, 00013, '3', '3', 5, 'N'),
	(0000278, 00013, '2', '2', 6, 'N'),
	(0000279, 00013, '1', '1', 7, 'N'),
	(0000280, 00014, '45', '45', 1, 'N'),
	(0000281, 00014, '44', '44', 2, 'N'),
	(0000282, 00014, '43', '43', 3, 'N'),
	(0000283, 00014, '42', '42', 4, 'N'),
	(0000284, 00014, '41', '41', 5, 'N'),
	(0000285, 00014, '40', '40', 6, 'N'),
	(0000286, 00014, '39', '39', 7, 'N'),
	(0000287, 00014, '38', '38', 8, 'N'),
	(0000288, 00014, '37', '37', 9, 'N'),
	(0000289, 00014, '36', '36', 10, 'N'),
	(0000290, 00014, '35', '35', 11, 'N'),
	(0000291, 00014, '34', '34', 12, 'N'),
	(0000292, 00014, '33', '33', 13, 'N'),
	(0000293, 00014, '32', '32', 14, 'N'),
	(0000294, 00014, '31', '31', 15, 'N'),
	(0000295, 00014, '30', '30', 16, 'N'),
	(0000296, 00014, '29', '29', 17, 'N'),
	(0000297, 00014, '28', '28', 18, 'N'),
	(0000298, 00014, '27', '27', 19, 'N'),
	(0000299, 00014, '26', '26', 20, 'N'),
	(0000300, 00014, '25', '25', 21, 'N'),
	(0000301, 00014, '24', '24', 22, 'N'),
	(0000302, 00014, '23', '23', 23, 'N'),
	(0000303, 00014, '22', '22', 24, 'N'),
	(0000304, 00014, '21', '21', 25, 'N'),
	(0000305, 00014, '20', '20', 26, 'N'),
	(0000306, 00014, '19', '19', 27, 'N'),
	(0000307, 00014, '18', '18', 28, 'N'),
	(0000308, 00014, '17', '17', 29, 'N'),
	(0000309, 00014, '16', '16', 30, 'N'),
	(0000310, 00014, '15', '15', 31, 'N'),
	(0000311, 00014, '14', '14', 32, 'N'),
	(0000312, 00014, '13', '13', 33, 'N'),
	(0000313, 00014, '12', '12', 34, 'N'),
	(0000314, 00014, '11', '11', 35, 'N'),
	(0000315, 00014, '10', '10', 36, 'N'),
	(0000316, 00014, '9', '9', 37, 'N'),
	(0000317, 00014, '8', '8', 38, 'N'),
	(0000318, 00014, '7', '7', 39, 'N'),
	(0000319, 00014, '6', '6', 40, 'N'),
	(0000320, 00014, '5', '5', 41, 'N'),
	(0000321, 00014, '4', '4', 42, 'N'),
	(0000322, 00014, '3', '3', 43, 'N'),
	(0000323, 00014, '2', '2', 44, 'N'),
	(0000324, 00014, '1', '1', 45, 'N'),
	(0000325, 00015, '8', 'Level 8', 1, 'N'),
	(0000326, 00015, '7', 'Level 7', 2, 'N'),
	(0000327, 00015, '6', 'Level 6', 3, 'N'),
	(0000328, 00015, '5', 'Level 5', 4, 'N'),
	(0000329, 00015, '4', 'Level 4', 5, 'N'),
	(0000330, 00015, '3', 'Level 3', 6, 'N');
/*!40000 ALTER TABLE `gibbonscalegrade` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibbonschoolyear
CREATE TABLE IF NOT EXISTS `gibbonschoolyear` (
  `gibbonSchoolYearID` int(3) unsigned zerofill NOT NULL,
  `name` varchar(9) NOT NULL DEFAULT '',
  `status` enum('Past','Current','Upcoming') NOT NULL DEFAULT 'Upcoming',
  `sequenceNumber` int(3) NOT NULL,
  `firstDay` date DEFAULT NULL,
  `lastDay` date DEFAULT NULL,
  PRIMARY KEY (`gibbonSchoolYearID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibbonschoolyear: ~2 rows (approximately)
/*!40000 ALTER TABLE `gibbonschoolyear` DISABLE KEYS */;
INSERT INTO `gibbonschoolyear` (`gibbonSchoolYearID`, `name`, `status`, `sequenceNumber`, `firstDay`, `lastDay`) VALUES
	(025, '2020-2021', 'Current', 3, '2020-06-19', '2021-06-30'),
	(026, '2021-2022', 'Upcoming', 4, '2021-08-16', '2022-06-29');
/*!40000 ALTER TABLE `gibbonschoolyear` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibbonschoolyearspecialday
CREATE TABLE IF NOT EXISTS `gibbonschoolyearspecialday` (
  `gibbonSchoolYearSpecialDayID` int(10) unsigned zerofill NOT NULL,
  `gibbonSchoolYearTermID` int(5) unsigned zerofill NOT NULL,
  `type` enum('School Closure','Timing Change') NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `schoolOpen` time DEFAULT NULL,
  `schoolStart` time DEFAULT NULL,
  `schoolEnd` time DEFAULT NULL,
  `schoolClose` time DEFAULT NULL,
  PRIMARY KEY (`gibbonSchoolYearSpecialDayID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibbonschoolyearspecialday: ~0 rows (approximately)
/*!40000 ALTER TABLE `gibbonschoolyearspecialday` DISABLE KEYS */;
/*!40000 ALTER TABLE `gibbonschoolyearspecialday` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibbonschoolyearterm
CREATE TABLE IF NOT EXISTS `gibbonschoolyearterm` (
  `gibbonSchoolYearTermID` int(5) unsigned zerofill NOT NULL,
  `gibbonSchoolYearID` int(3) unsigned zerofill NOT NULL,
  `sequenceNumber` int(5) NOT NULL,
  `name` varchar(20) NOT NULL,
  `nameShort` varchar(4) NOT NULL,
  `firstDay` date NOT NULL,
  `lastDay` date NOT NULL,
  PRIMARY KEY (`gibbonSchoolYearTermID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibbonschoolyearterm: ~6 rows (approximately)
/*!40000 ALTER TABLE `gibbonschoolyearterm` DISABLE KEYS */;
INSERT INTO `gibbonschoolyearterm` (`gibbonSchoolYearTermID`, `gibbonSchoolYearID`, `sequenceNumber`, `name`, `nameShort`, `firstDay`, `lastDay`) VALUES
	(00034, 025, 31, 'Term 1', 'T1', '2020-06-19', '2020-12-15'),
	(00035, 025, 32, 'Term 2', 'T2', '2021-01-11', '2021-03-28'),
	(00036, 025, 33, 'Term 3', 'T3', '2021-04-19', '2021-06-28'),
	(00037, 026, 34, 'Term 1', 'T1', '2021-06-19', '2021-12-15'),
	(00038, 026, 35, 'Term 2', 'T2', '2022-01-10', '2022-03-25'),
	(00039, 026, 36, 'Term 3', 'T3', '2022-04-18', '2022-06-29');
/*!40000 ALTER TABLE `gibbonschoolyearterm` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibbonsetting
CREATE TABLE IF NOT EXISTS `gibbonsetting` (
  `gibbonSettingID` int(5) unsigned zerofill NOT NULL,
  `scope` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `nameDisplay` varchar(60) NOT NULL,
  `description` varchar(255) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`gibbonSettingID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibbonsetting: ~278 rows (approximately)
/*!40000 ALTER TABLE `gibbonsetting` DISABLE KEYS */;
INSERT INTO `gibbonsetting` (`gibbonSettingID`, `scope`, `name`, `nameDisplay`, `description`, `value`) VALUES
	(00001, 'System', 'absoluteURL', 'Base URL', 'The address at which the whole system resides.', 'http://fakmsc.bidyaan.com/'),
	(00002, 'System', 'organisationName', 'Organisation Name', '', 'Bidyaan'),
	(00003, 'System', 'organisationNameShort', 'Organisation Initials', '', 'Complete Education Management System'),
	(00006, 'System', 'pagination', 'Pagination Count', 'Must be numeric. Number of records shown per page.', '50'),
	(00007, 'System', 'systemName', 'System Name', '', 'Bidyaan'),
	(00008, 'System', 'indexText', 'Index Page Text', 'Text displayed in system\'s welcome page.', 'Welcome to Gibbon, the free, open, flexible school platform. Designed by teachers for learning, Gibbon gives you the school tools you need.'),
	(00009, 'System', 'absolutePath', 'Base Path', 'The local FS path to the system', 'E:\\xamp\\htdocs\\bidyaan'),
	(00011, 'System', 'timezone', 'Timezone', 'The timezone where the school is located', 'Asia/Dhaka'),
	(00013, 'System', 'analytics', 'Analytics', 'Javascript code to integrate statistics, such as Google Analytics', ''),
	(00014, 'System', 'emailLink', 'Link To Email', 'The link that points to the school/\'s email system', ''),
	(00015, 'System', 'webLink', 'Link To Web', 'The link that points to the school/\'s website', ''),
	(00018, 'System', 'defaultAssessmentScale', 'Default Assessment Scale', 'This is the scale used as a default where assessment scales need to be selected.', '00007'),
	(00021, 'System', 'country', 'Country', 'The country the school is located in', 'Bangladesh'),
	(00022, 'System', 'organisationLogo', 'Logo', 'Relative path to site logo (400 x 100px)', 'themes/Default/img/logo.png'),
	(00023, 'System', 'calendarFeed', 'School Google Calendar ID', 'Google Calendar ID for your school calendar. Only enables timetable integration when logging in via Google.', ''),
	(00024, 'Activities', 'access', 'Access', 'System-wide access control', 'Register'),
	(00025, 'Activities', 'payment', 'Payment', 'Payment system', 'Per Activity'),
	(00026, 'Activities', 'enrolmentType', 'Enrolment Type', 'Enrolment process type', 'Competitive'),
	(00027, 'Activities', 'backupChoice', 'Backup Choice', 'Allow students to choose a backup, in case enroled activity is full.', 'Y'),
	(00028, 'Activities', 'activityTypes', 'Activity Types', 'Comma-seperated list of the different activity types available in school. Leave blank to disalbe this feature.', 'Creativity,Action,Service'),
	(00029, 'Application Form', 'introduction', 'Introduction', 'Information to display before the form', ''),
	(00030, 'Application Form', 'postscript', 'Postscript', 'Information to display at the end of the form', ''),
	(00031, 'Application Form', 'scholarships', 'Scholarships', 'Information to display before the scholarship options', ''),
	(00032, 'Application Form', 'agreement', 'Agreement', 'Without this text, which is displayed above the agreement, users will not be asked to agree to anything', ''),
	(00033, 'Application Form', 'publicApplications', 'Public Applications?', 'If yes, members of the public can submit applications', 'Y'),
	(00034, 'Behaviour', 'positiveDescriptors', 'Positive Descriptors', 'Allowable choices for positive behaviour', 'Attitude to learning,Collaboration,Community spirit,Creativity,Effort,Leadership,Participation,Persistence,Problem solving,Quality of work,Values'),
	(00035, 'Behaviour', 'negativeDescriptors', 'Negative Descriptors', 'Allowable choices for negative behaviour', 'Classwork - Late,Classwork - Incomplete,Classwork - Unacceptable,Disrespectful,Disruptive,Homework - Late,Homework - Incomplete,Homework - Unacceptable,ICT Misuse,Truancy,Other'),
	(00036, 'Behaviour', 'levels', 'Levels', 'Allowable choices for severity level (from lowest to highest)', ',Stage 1,Stage 1 (Actioned),Stage 2,Stage 2 (Actioned),Stage 3,Stage 3 (Actioned),Actioned'),
	(00037, 'Resources', 'categories', 'Categories', 'Allowable choices for category', 'Article,Book,Document,Graphic,Idea,Music,Object,Painting,Person,Photo,Place,Poetry,Prose,Rubric,Text,Video,Website,Work Sample,Other'),
	(00038, 'Resources', 'purposesGeneral', 'Purposes (General)', 'Allowable choices for purpose when creating a resource', 'Assessment Aid,Concept,Inspiration,Learner Profile,Mass Mailer Attachment,Provocation,Skill,Teaching and Learning Strategy,Other'),
	(00039, 'System', 'version', 'Version', 'The version of the Gibbon database', '20.0.00'),
	(00040, 'Resources', 'purposesRestricted', 'Purposes (Restricted)', 'Additional allowable choices for purpose when creating a resource, for those with "Manage All Resources" rights', ''),
	(00041, 'System', 'organisationEmail', 'Organisation Email', 'General email address for the school', 'rejaul.2005@gmail.com'),
	(00042, 'Activities', 'dateType', 'Date Type', 'Should activities be organised around dates (flexible) or terms (easy)?', 'Term'),
	(00043, 'System', 'installType', 'Install Type', 'The purpose of this installation of Gibbon', 'Development'),
	(00044, 'System', 'statsCollection', 'Statistics Collection', 'To track Gibbon uptake, the system tracks basic data (current URL, install type, organisation name) on each install. Do you want to help?', 'N'),
	(00045, 'Activities', 'maxPerTerm', 'Maximum Activities per Term', 'The most a student can sign up for in one term. Set to 0 for unlimited.', '0'),
	(00046, 'Planner', 'lessonDetailsTemplate', 'Lesson Details Template', 'Template to be inserted into Lesson Details field', ''),
	(00047, 'Planner', 'teachersNotesTemplate', 'Teacher\'s Notes Template', 'Template to be inserted into Teacher\'s Notes field', ''),
	(00048, 'Planner', 'smartBlockTemplate', 'Smart Block Template', 'Template to be inserted into new block in Smart Unit', ''),
	(00049, 'Planner', 'unitOutlineTemplate', 'Unit Outline Template', 'Template to be inserted into Unit Outline section of planner', ''),
	(00050, 'Application Form', 'milestones', 'Milestones', 'Comma-separated list of the major steps in the application process. Applicants can be tracked through the various stages.', ''),
	(00051, 'Library', 'defaultLoanLength', 'Default Loan Length', 'The standard loan length for a library item, in days', '7'),
	(00052, 'Behaviour', 'policyLink', 'Policy Link', 'A link to the school behaviour policy.', ''),
	(00053, 'Library', 'browseBGColor', 'Browse Library BG Color', 'RGB Hex value, without leading #. Background color used behind library browsing screen.', ''),
	(00054, 'Library', 'browseBGImage', 'Browse Library BG Image', 'URL to background image used behind library browsing screen.', ''),
	(00055, 'System', 'passwordPolicyAlpha', 'Password - Alpha Requirement', 'Require both upper and lower case alpha characters?', 'Y'),
	(00056, 'System', 'passwordPolicyNumeric', 'Password - Numeric Requirement', 'Require at least one numeric character?', 'Y'),
	(00057, 'System', 'passwordPolicyNonAlphaNumeric', 'Password - Non-Alphanumeric Requirement', 'Require at least one non-alphanumeric character (e.g. punctuation mark or space)?', 'N'),
	(00058, 'System', 'passwordPolicyMinLength', 'Password - Minimum Length', 'Minimum acceptable password length.', '8'),
	(00059, 'User Admin', 'ethnicity', 'Ethnicity', 'Comma-separated list of ethnicities available in system', ''),
	(00060, 'User Admin', 'nationality', 'Nationality', 'Comma-separated list of nationalities available in system. If blank, system will default to list of countries', ''),
	(00061, 'User Admin', 'residencyStatus', 'Residency Status', 'Comma-separated list of residency status available in system. If blank, system will allow text input', ''),
	(00063, 'User Admin', 'personalDataUpdaterRequiredFields', 'Personal Data Updater Required Fields', 'Serialized array listed personal fields in data updater, and whether or not they are required.', 'a:47:{s:5:"title";s:1:"N";s:7:"surname";s:1:"Y";s:9:"firstName";s:1:"N";s:10:"otherNames";s:1:"N";s:13:"preferredName";s:1:"Y";s:12:"officialName";s:1:"Y";s:16:"nameInCharacters";s:1:"N";s:3:"dob";s:1:"N";s:5:"email";s:1:"N";s:14:"emailAlternate";s:1:"N";s:8:"address1";s:1:"Y";s:16:"address1District";s:1:"N";s:15:"address1Country";s:1:"N";s:8:"address2";s:1:"N";s:16:"address2District";s:1:"N";s:15:"address2Country";s:1:"N";s:10:"phone1Type";s:1:"N";s:17:"phone1CountryCode";s:1:"N";s:6:"phone1";s:1:"N";s:6:"phone2";s:1:"N";s:6:"phone3";s:1:"N";s:6:"phone4";s:1:"N";s:13:"languageFirst";s:1:"N";s:14:"languageSecond";s:1:"N";s:13:"languageThird";s:1:"N";s:14:"countryOfBirth";s:1:"N";s:9:"ethnicity";s:1:"N";s:12:"citizenship1";s:1:"N";s:20:"citizenship1Passport";s:1:"N";s:12:"citizenship2";s:1:"N";s:20:"citizenship2Passport";s:1:"N";s:8:"religion";s:1:"N";s:20:"nationalIDCardNumber";s:1:"N";s:15:"residencyStatus";s:1:"N";s:14:"visaExpiryDate";s:1:"N";s:10:"profession";s:1:"N";s:8:"employer";s:1:"N";s:8:"jobTitle";s:1:"N";s:14:"emergency1Name";s:1:"N";s:17:"emergency1Number1";s:1:"N";s:17:"emergency1Number2";s:1:"N";s:22:"emergency1Relationship";s:1:"N";s:14:"emergency2Name";s:1:"N";s:17:"emergency2Number1";s:1:"N";s:17:"emergency2Number2";s:1:"N";s:22:"emergency2Relationship";s:1:"N";s:19:"vehicleRegistration";s:1:"N";}'),
	(00065, 'School Admin', 'primaryExternalAssessmentByYearGroup', 'Primary External Assessment By Year Group', 'Serialized array connected gibbonExternalAssessmentID to gibbonYearGroupID, and specify which field set to use.', 'a:7:{s:3:"001";s:1:"-";s:3:"002";s:1:"-";s:3:"003";s:1:"-";s:3:"004";s:1:"-";s:3:"005";s:1:"-";s:3:"006";s:1:"-";s:3:"007";s:1:"-";}'),
	(00066, 'Markbook', 'markbookType', 'Markbook Type', 'Comma-separated list of types to make available in the Markbook.', 'Essay,Exam,Homework,Reflection,Test,Unit,End of Year,Other'),
	(00067, 'System', 'allowableHTML', 'Allowable HTML', 'TinyMCE-style list of acceptable HTML tags and options.', 'br[style],strong[style],em[style],span[style],p[style],address[style],pre[style|class],h1[style],h2[style],h3[style],h4[style],h5[style],h6[style],table[style],thead[style],tbody[style],tfoot[style],tr[style],td[style|colspan|rowspan],ol[style],ul[style],li[style],blockquote[style],a[style|target|href],img[style|class|src|width|height],video[style],source[style],hr[style],iframe[style|width|height|src|frameborder|allowfullscreen],embed[style],div[style],sup[style],sub[style],code[style|class],details[style|class],summary[style|class]'),
	(00068, 'Application Form', 'howDidYouHear', 'How Did Your Hear?', 'Comma-separated list', 'Advertisement,Personal Recommendation,World Wide Web,Others'),
	(00070, 'Messenger', 'smsUsername', 'SMS Username', 'SMS gateway username.', ''),
	(00071, 'Messenger', 'smsPassword', 'SMS Password', 'SMS gateway password.', ''),
	(00072, 'Messenger', 'smsURL', 'SMS URL', 'SMS gateway URL for send requests.', ''),
	(00073, 'Messenger', 'smsURLCredit', 'SMS URL Credit', 'SMS gateway URL for checking credit.', ''),
	(00074, 'System', 'currency', 'Currency', 'System-wde currency for financial transactions. Support for online payment in this currency depends on your credit card gateway: please consult their support documentation.', 'BDT ó'),
	(00075, 'System', 'enablePayments', 'Enable Payments', 'Should payments be enabled across the system?', 'N'),
	(00076, 'System', 'paypalAPIUsername', 'PayPal API Username', 'API Username provided by PayPal.', ''),
	(00077, 'System', 'paypalAPIPassword', 'PayPal API Password', 'API Password provided by PayPal.', ''),
	(00078, 'System', 'paypalAPISignature', 'PayPal API Signature', 'API Signature provided by PayPal.', ''),
	(00079, 'Application Form', 'applicationFee', 'Application Fee', 'The cost of applying to the school.', '0'),
	(00080, 'Application Form', 'requiredDocuments', 'Required Documents', 'Comma-separated list of documents which must be submitted electronically with the application form.', ''),
	(00081, 'Application Form', 'requiredDocumentsCompulsory', 'Required Documents Compulsory?', 'Are the required documents compulsory?', 'N'),
	(00082, 'Application Form', 'requiredDocumentsText', 'Required Documents Text', 'Explanatory text to appear with the required documents?', ''),
	(00083, 'Application Form', 'notificationStudentDefault', 'Student Notification Default', 'Should student acceptance email be turned on or off by default.', 'On'),
	(00084, 'Application Form', 'languageOptionsActive', 'Language Options Active', 'Should the Language Options section be turned on?', 'Off'),
	(00085, 'Application Form', 'languageOptionsBlurb', 'Language Options Blurb', 'Introductory text if Language Options section is turned on.', ''),
	(00086, 'Application Form', 'languageOptionsLanguageList', 'Language Options Language List', 'Comma-separated list of available language selections if Language Options section is turned on.', ''),
	(00088, 'User Admin', 'personalBackground', 'Personal Background', 'Should users be allowed to set their own personal backgrounds?', 'Y'),
	(00091, 'User Admin', 'dayTypeOptions', 'Day-Type Options', 'Comma-separated list of options to make available (e.g. half-day, full-day). If blank, this field will not show up in the application form.', ''),
	(00092, 'User Admin', 'dayTypeText', 'Day-Type Text', 'Explanatory text to include with Day-Type Options.', ''),
	(00095, 'Markbook', 'showStudentAttainmentWarning', 'Show Student Attainment Warning', 'Show low attainment grade visual warning to students?', 'Y'),
	(00096, 'Markbook', 'showStudentEffortWarning', 'Show Student Effort Warning', 'Show low effort grade visual warning to students?', 'Y'),
	(00097, 'Markbook', 'showParentAttainmentWarning', 'Show Parent Attainment Warning', 'Show low attainment grade visual warning to parents?', 'Y'),
	(00098, 'Markbook', 'showParentEffortWarning', 'Show Parent Effort Warning', 'Show low effort grade visual warning to parents?', 'Y'),
	(00099, 'Planner', 'allowOutcomeEditing', 'Allow Outcome Editing', 'Should the text within outcomes be editable when planning lessons and units?', 'Y'),
	(00100, 'User Admin', 'privacy', 'Privacy', 'Should privacy options be turned on across the system?', 'N'),
	(00101, 'User Admin', 'privacyBlurb', 'Privacy Blurb', 'Descriptive text to accompany image privacy option when shown to users.', ''),
	(00102, 'Finance', 'invoiceText', 'Invoice Text', 'Text to appear in invoice, above invoice details and fees.', ''),
	(00103, 'Finance', 'invoiceNotes', 'Invoice Notes', 'Text to appear in invoice, below invoice details and fees.', ''),
	(00104, 'Finance', 'receiptText', 'Receipt Text', 'Text to appear in receipt, above receipt details and fees.', ''),
	(00105, 'Finance', 'receiptNotes', 'Receipt Notes', 'Text to appear in receipt, below receipt details and fees.', ''),
	(00106, 'Finance', 'reminder1Text', 'Reminder 1 Text', 'Text to appear in first level reminder level, above invoice details and fees.', ''),
	(00107, 'Finance', 'reminder2Text', 'Reminder 2 Text', 'Text to appear in second level reminder level, above invoice details and fees.', ''),
	(00108, 'Finance', 'reminder3Text', 'Reminder 3 Text', 'Text to appear in third level reminder level, above invoice details and fees.', ''),
	(00109, 'Finance', 'email', 'Email', 'Email address to send finance emails from.', 'rejaul.2005@gmail.com'),
	(00110, 'Application Form', 'notificationParentsDefault', 'Parents Notification Default', 'Should parent acceptance email be turned on or off by default.', 'On'),
	(00111, 'User Admin', 'privacyOptions', 'Privacy Options', 'Comma-separated list of choices to make available if privacy options are turned on. If blank, privacy fields will not be displayed.', ''),
	(00112, 'Planner', 'sharingDefaultParents', 'Sharing Default: Parents', 'When adding lessons and deploying units, should sharing default for parents be Y or N?', 'Y'),
	(00113, 'Planner', 'sharingDefaultStudents', 'Sharing Default: Students', 'When adding lessons and deploying units, should sharing default for students be Y or N?', 'Y'),
	(00115, 'Students', 'extendedBriefProfile', 'Extended Brief Profile', 'The extended version of the brief student profile includes contact information of parents.', 'N'),
	(00116, 'Application Form', 'notificationParentsMessage', 'Parents Notification Message', 'A custom message to add to the standard email to parents on acceptance.', ''),
	(00117, 'Application Form', 'notificationStudentMessage', 'Student Notification Message', 'A custom message to add to the standard email to students on acceptance.', ''),
	(00118, 'Finance', 'invoiceNumber', 'Invoice Number Style', 'How should invoice numbers be constructed?', 'Invoice ID'),
	(00119, 'User Admin', 'departureReasons', 'Departure Reasons', 'Comma-separated list of reasons for departure from school. If blank, user can enter any text.', ''),
	(00120, 'System', 'googleOAuth', 'Google Integration', 'Enable Gibbon-wide integration with the Google APIs?', 'N'),
	(00122, 'System', 'googleClientName', 'Google Developers Client Name', 'Name of Google Project in Developers Console.', ''),
	(00123, 'System', 'googleClientID', 'Google Developers Client ID', 'Client ID for Google Project In Developers Console.', ''),
	(00124, 'System', 'googleClientSecret', 'Google Developers Client Secret', 'Client Secret for Google Project In Developers Console.', ''),
	(00125, 'System', 'googleRedirectUri', 'Google Developers Redirect Url', 'Google Redirect on sucessful auth.', ''),
	(00126, 'System', 'googleDeveloperKey', 'Google Developers Developer Key', 'Google project Developer Key.', ''),
	(00127, 'Markbook', 'personalisedWarnings', 'Personalised Warnings', 'Should markbook warnings be based on personal targets, if they are available?', 'Y'),
	(00128, 'Activities', 'disableExternalProviderSignup', 'Disable External Provider Signup', 'Should we turn off the option to sign up for activities provided by an outside agency?', 'N'),
	(00129, 'Activities', 'hideExternalProviderCost', 'Hide External Provider Cost', 'Should we hide the cost of activities provided by an outside agency from the Activities View?', 'N'),
	(00130, 'System', 'cuttingEdgeCode', 'Cutting Edge Code', 'Are you running cutting edge code, instead of stable versions?', 'N'),
	(00131, 'System', 'cuttingEdgeCodeLine', 'Cutting Edge Code Line', 'What line of SQL code did the last cutting edge update hit?', ''),
	(00132, 'System', 'gibboneduComOrganisationName', 'gibbonedu.com Organisation Name', 'Name of organisation, as registered with gibbonedu.com, for access to value-added services.', ''),
	(00133, 'System', 'gibboneduComOrganisationKey', 'gibbonedu.com Organisation Key', 'Organisation\'s private key, as registered with gibbonedu.com, for access to value-added services.', ''),
	(00134, 'Application Form', 'studentDefaultEmail', 'Student Default Email', 'Set default email for students on acceptance, using [username] to insert username.', ''),
	(00135, 'Application Form', 'studentDefaultWebsite', 'Student Default Website', 'Set default website for students on acceptance, using [username] to insert username.', ''),
	(00136, 'School Admin', 'studentAgreementOptions', 'Student Agreement Options', 'Comma-separated list of agreements that students might be asked to sign in school (e.g. ICT Policy).', ''),
	(00137, 'Markbook', 'attainmentAlternativeName', 'Attainment Alternative Name', 'A name to use instead of "Attainment" in the first grade column of the markbook.', ''),
	(00138, 'Markbook', 'effortAlternativeName', 'Effort Alternative Name', 'A name to use instead of "Effort" in the second grade column of the markbook.', ''),
	(00139, 'Markbook', 'attainmentAlternativeNameAbrev', 'Attainment Alternative Name Abbreviation', 'A short name to use instead of "Attainment" in the first grade column of the markbook.', ''),
	(00140, 'Markbook', 'effortAlternativeNameAbrev', 'Effort Alternative Name Abbreviation', 'A short name to use instead of "Effort" in the second grade column of the markbook..', ''),
	(00141, 'Planner', 'parentWeeklyEmailSummaryIncludeBehaviour', 'Parent Weekly Email Summary Include Behaviour', 'Should behaviour information be included in the weekly planner email summary that goes out to parents?', 'Y'),
	(00142, 'Finance', 'financeOnlinePaymentEnabled', 'Enable Online Payment', 'Should invoices be payable online, via an encrypted link in the invoice? Requires correctly configured payment gateway in System Settings.', 'N'),
	(00143, 'Finance', 'financeOnlinePaymentThreshold', 'Online Payment Threshold', 'If invoices are payable online, what is the maximum payment allowed? Useful for controlling payment fees. No value means unlimited.', ''),
	(00144, 'Departments', 'makeDepartmentsPublic', 'Make Departments Public', 'Should department information be made available to the public, via the Gibbon homepage?', 'N'),
	(00145, 'System', 'sessionDuration', 'Session Duration', 'Time, in seconds, before system logs a user out. Should be less than PHP\'s session.gc_maxlifetime option.', '1200'),
	(00146, 'Planner', 'makeUnitsPublic', 'Make Units Public', 'Enables a public listing of units, with teachers able to opt in to share units.', 'N'),
	(00147, 'Messenger', 'messageBubbleWidthType', 'Message Bubble Width Type', 'Should the message bubble be regular or wide?', 'Regular'),
	(00148, 'Messenger', 'messageBubbleBGColor', 'Message Bubble Background Color', 'Message bubble background color in RGBA (e.g. 100,100,100,0.50). If blank, theme default will be used.', ''),
	(00149, 'Messenger', 'messageBubbleAutoHide', 'Message Bubble Auto Hide', 'Should message bubble fade out automatically?', 'Y'),
	(00150, 'Students', 'enableStudentNotes', 'Enable Student Notes', 'Should student notes be turned on?', 'Y'),
	(00151, 'Finance', 'budgetCategories', 'Budget Categories', 'Comma-separated list of budget categories.', 'Academic, Administration, Capital'),
	(00153, 'Finance', 'expenseApprovalType', 'Expense Approval Type', 'How should expense approval be dealt with?', 'One Of'),
	(00154, 'Finance', 'budgetLevelExpenseApproval', 'Budget Level Expense Approval', 'Should approval from a budget member with Full access be required?', 'Y'),
	(00155, 'Finance', 'expenseRequestTemplate', 'Expense Request Template', 'An HTML template to be used in the description field of expense requests.', ''),
	(00156, 'Finance', 'purchasingOfficer', 'Purchasing Officer', 'User responsible for purchasing for the school.', ''),
	(00157, 'Finance', 'reimbursementOfficer', 'Reimbursement Officer', 'User responsible for reimbursing expenses.', ''),
	(00158, 'Messenger', 'enableHomeScreenWidget', 'Enable Home Screen Widget', 'Adds a Message Wall widget to the home page, hihglighting current messages.', 'N'),
	(00159, 'User Admin', 'enablePublicRegistration', 'Enable Public Registration', 'Allows members of the public to register to use the system.', 'N'),
	(00160, 'User Admin', 'publicRegistrationMinimumAge', 'Public Registration Minimum Age', 'The minimum age, in years, permitted to register.', '13'),
	(00161, 'User Admin', 'publicRegistrationDefaultStatus', 'Public Registration Default Status', 'Should new users be \'Full\' or \'Pending Approval\'?', 'Pending Approval'),
	(00162, 'User Admin', 'publicRegistrationDefaultRole', 'Public Registration Default Role', 'System role to be assigned to registering members of the public.', '003'),
	(00163, 'User Admin', 'publicRegistrationIntro', 'Public Registration Introductory Text', 'HTML text that will appear above the public registration form.', ''),
	(00164, 'User Admin', 'publicRegistrationPrivacyStatement', 'Public Registration Privacy Statement', 'HTML text that will appear above the Submit button, explaining privacy policy.', 'By registering for this site you are giving permission for your personal data to be used and shared within this organisation and its websites. We will not share your personal data outside our organisation.'),
	(00165, 'User Admin', 'publicRegistrationAgreement', 'Public Registration Agreement', 'Agreement that user must confirm before joining. Blank for no agreement.', 'In joining this site, and checking the box below, I agree to act lawfully, ethically and with respect for others. I agree to use this site for learning purposes only, and understand that access may be withdrawn at any time, at the discretion of the site\'s administrators.'),
	(00166, 'User Admin', 'publicRegistrationPostscript', 'Public Registration Postscript', 'HTML text that will appear underneath the public registration form.', ''),
	(00167, 'System', 'alarm', 'Alarm', 'Sound a system wide alarm to all staff.', 'None'),
	(00168, 'Behaviour', 'enableDescriptors', 'Enable Descriptors', 'Setting to No reduces complexity of behaviour tracking.', 'Y'),
	(00169, 'Behaviour', 'enableLevels', 'Enable Levels', 'Setting to No reduces complexity of behaviour tracking.', 'Y'),
	(00170, 'Formal Assessment', 'internalAssessmentTypes', 'Internal Assessment Types', 'Comma-separated list of types to make available in Internal Assessments.', 'Expected Grade,Predicted Grade,Target Grade'),
	(00171, 'System Admin', 'customAlarmSound', 'Custom Alarm Sound', 'A custom alarm sound file.', ''),
	(00172, 'School Admin', 'facilityTypes', 'FacilityTypes', 'A comma-separated list of types for facilities.', 'Classroom,Hall,Laboratory,Library,Office,Outdoor,Performance,Staffroom,Storage,Study,Undercover,Other'),
	(00173, 'Finance', 'allowExpenseAdd', 'Allow Expense Add', 'Allows privileged users to add expenses without going through request process.', 'Y'),
	(00174, 'System', 'organisationAdministrator', 'System Administrator', 'The staff member who receives notifications for system events.', '1'),
	(00175, 'System', 'organisationDBA', 'Database Administrator', 'The staff member who receives notifications for data events.', '1'),
	(00176, 'System', 'organisationAdmissions', 'Admissions Administrator', 'The staff member who receives notifications for admissions events.', '1'),
	(00177, 'Finance', 'hideItemisation', 'Hide Itemisation', 'Hide fee and payment details in receipts?', 'N'),
	(00178, 'Application Form', 'autoHouseAssign', 'Auto House Assign', 'Attempt to automatically place student in a house?', 'N'),
	(00179, 'Tracking', 'externalAssessmentDataPoints', 'External Assessment Data Points', 'Stores the external assessment choices for data points output in tracking.', ''),
	(00180, 'Tracking', 'internalAssessmentDataPoints', 'Internal Assessment Data Points', 'Stores the internal assessment choices for data points output in tracking.', ''),
	(00181, 'Behaviour', 'enableBehaviourLetters', 'Enable Behaviour Letters', 'Should automated behaviour letter functionality be enabled?', 'N'),
	(00182, 'Behaviour', 'behaviourLettersLetter1Count', 'Letter 1 Count', 'After how many negative records should letter 1 be sent?', '3'),
	(00183, 'Behaviour', 'behaviourLettersLetter1Text', 'Letter 1 Text', 'The contents of letter 1, as HTML.', 'Dear Parent/Guardian,<br/><br/>This letter has been automatically generated to alert you to the fact that your child, [studentName], has reached [behaviourCount] negative behaviour incidents. Please see the list below for the details of these incidents:<br/><br/>[behaviourRecord]<br/><br/>This letter represents the first communication in a sequence of 3 potential alerts, each of which is more critical than the last.<br/><br/>If you would like more information on this matter, please contact your child\'s tutor.'),
	(00184, 'Behaviour', 'behaviourLettersLetter2Count', 'Letter 2 Count', 'After how many negative records should letter 2 be sent?', '6'),
	(00185, 'Behaviour', 'behaviourLettersLetter2Text', 'Letter 2 Text', 'The contents of letter 2, as HTML.', 'Dear Parent/Guardian,<br/><br/>This letter has been automatically generated to alert you to the fact that your child, [studentName], has reached [behaviourCount] negative behaviour incidents. Please see the list below for the details of these incidents:<br/><br/>[behaviourRecord]<br/><br/>This letter represents the second communication in a sequence of 3 potential alerts, each of which is more critical than the last.<br/><br/>If you would like more information on this matter, please contact your child\'s tutor.'),
	(00186, 'Behaviour', 'behaviourLettersLetter3Count', 'Letter 3 Count', 'After how many negative records should letter 3 be sent?', '9'),
	(00187, 'Behaviour', 'behaviourLettersLetter3Text', 'Letter 3 Text', 'The contents of letter 3, as HTML.', 'Dear Parent/Guardian,<br/><br/>This letter has been automatically generated to alert you to the fact that your child, [studentName], has reached [behaviourCount] negative behaviour incidents. Please see the list below for the details of these incidents:<br/><br/>[behaviourRecord]<br/><br/>This letter represents the final communication in a sequence of 3 potential alerts, each of which is more critical than the last.<br/><br/>If you would like more information on this matter, please contact your child\'s tutor.'),
	(00188, 'Markbook', 'enableColumnWeighting', 'Enable Column Weighting', 'Should column weighting and total scores be enabled in the Markbook?', 'N'),
	(00189, 'System', 'firstDayOfTheWeek', 'First Day Of The Week', 'On which day should the week begin?', 'Monday'),
	(00190, 'Application Form', 'usernameFormat', 'Username Format', 'How should usernames be formated? Choose from [preferredName], [preferredNameInitial], [surname].', '[preferredNameInitial][surname]'),
	(00191, 'Staff', 'jobOpeningDescriptionTemplate', 'Job Opening Description Template', 'Default HTML contents for the Job Opening Description field.', '<table style=\'width: 100%\'>\n	<tr>\n		<td colspan=2 style=\'vertical-align: top\'>\n			<span style=\'text-decoration: underline; font-weight: bold\'>Job Description</span><br/>\n			<br/>\n		</td>\n	</tr>\n	<tr>\n		<td style=\'width: 50%; vertical-align: top\'>\n			<span style=\'text-decoration: underline; font-weight: bold\'>Responsibilities</span><br/>\n			<ul style=\'margin-top:0px\'>\n				<li></li>\n				<li></li>\n			</ul>\n		</td>\n		<td style=\'width: 50%; vertical-align: top\'>\n			<span style=\'text-decoration: underline; font-weight: bold\'>Required Skills/Characteristics</span><br/>\n			<ul style=\'margin-top:0px\'>\n				<li></li>\n				<li></li>\n			</ul>\n		</td>\n	</tr>\n	<tr>\n		<td style=\'width: 50%; vertical-align: top\'>\n			<span style=\'text-decoration: underline; font-weight: bold\'>Remuneration</span><br/>\n			<ul style=\'margin-top:0px\'>\n				<li></li>\n				<li></li>\n			</ul>\n		</td>\n		<td style=\'width: 50%; vertical-align: top\'>\n			<span style=\'text-decoration: underline; font-weight: bold\'>Other Details </span><br/>\n			<ul style=\'margin-top:0px\'>\n				<li></li>\n				<li></li>\n			</ul>\n		</td>\n	</tr>\n</table>'),
	(00192, 'Staff', 'staffApplicationFormIntroduction', 'Introduction', 'Information to display before the form', ''),
	(00193, 'Staff', 'staffApplicationFormPostscript', 'Postscript', 'Information to display at the end of the form', ''),
	(00194, 'Staff', 'staffApplicationFormAgreement', 'Agreement', 'Without this text, which is displayed above the agreement, users will not be asked to agree to anything', 'In submitting this form, I confirm that all information provided above is accurate and complete to the best of my knowledge.'),
	(00195, 'Staff', 'staffApplicationFormMilestones', 'Milestones', 'Comma-separated list of the major steps in the application process. Applicants can be tracked through the various stages.', 'Short List, First Interview, Second Interview, Offer Made, Offer Accepted, Contact Issued, Contact Signed'),
	(00196, 'Staff', 'staffApplicationFormRequiredDocuments', 'Required Documents', 'Comma-separated list of documents which must be submitted electronically with the application form.', 'Curriculum Vitae'),
	(00197, 'Staff', 'staffApplicationFormRequiredDocumentsCompulsory', 'Required Documents Compulsory?', 'Are the required documents compulsory?', 'Y'),
	(00198, 'Staff', 'staffApplicationFormRequiredDocumentsText', 'Required Documents Text', 'Explanatory text to appear with the required documents?', 'Please submit the following document(s) to ensure your application can be processed without delay.'),
	(00199, 'Staff', 'staffApplicationFormNotificationDefault', 'Notification Default', 'Should acceptance email be turned on or off by default.', 'Y'),
	(00200, 'Staff', 'staffApplicationFormNotificationMessage', 'Notification Message', 'A custom message to add to the standard email on acceptance.', ''),
	(00201, 'Staff', 'staffApplicationFormDefaultEmail', 'Default Email', 'Set default email on acceptance, using [username] to insert username.', ''),
	(00202, 'Staff', 'staffApplicationFormDefaultWebsite', 'Default Website', 'Set default website on acceptance, using [username] to insert username.', ''),
	(00203, 'Staff', 'staffApplicationFormUsernameFormat', 'Username Format', 'How should usernames be formated? Choose from [preferredName], [preferredNameInitial], [surname].', '[preferredNameInitial].[surname]'),
	(00204, 'System', 'organisationHR', 'Human Resources Administrator', 'The staff member who receives notifications for staffing events.', '1'),
	(00205, 'Staff', 'staffApplicationFormQuestions', 'Application Questions', 'HTML text that will appear as questions for the applicant to answer.', '<span style=\'text-decoration: underline; font-weight: bold\'>Why are you applying for this role?</span><br/><p></p>'),
	(00206, 'Staff', 'salaryScalePositions', 'Salary Scale Positions', 'Comma-separated list of salary scale positions, from lowest to highest.', '1,2,3,4,5,6,7,8,9,10'),
	(00207, 'Staff', 'responsibilityPosts', 'Responsibility Posts', 'Comma-separated list of posts carrying extra responsibilities.', ''),
	(00208, 'Students', 'applicationFormSENText', 'Application Form SEN Text', 'Text to appear with the Special Educational Needs section of the student application form.', 'Please indicate whether or not your child has any known, or suspected, special educational needs, or whether they have been assessed for any such needs in the past. Provide any comments or information concerning your child\'s development that may be relevant to your child\'s performance in the classroom or elsewhere? Incorrect or withheld information may affect continued enrolment.'),
	(00209, 'Students', 'applicationFormRefereeLink', 'Application Form Referee Link', 'Link to an external form that will be emailed to a referee of the applicant\'s choosing.', ''),
	(00210, 'User Admin', 'religions', 'Religions', 'Comma-separated list of ethnicities available in system', ',Nonreligious/Agnostic/Atheist,Buddhism,Christianity,Hinduism,Islam,Judaism,Other'),
	(00211, 'Staff', 'applicationFormRefereeLink', 'Application Form Referee Link', 'Link to an external form that will be emailed to a referee of the applicant\'s choosing.', ''),
	(00212, 'Markbook', 'enableRawAttainment', 'Enable Raw Attainment Marks', 'Should recording of raw marks be enabled in the Markbook?', 'N'),
	(00213, 'Markbook', 'enableGroupByTerm', 'Group Columns by Term', 'Should columns and total scores be grouped by term?', 'N'),
	(00214, 'Markbook', 'enableEffort', 'Enable Effort', 'Should columns have the Effort section enabled?', 'Y'),
	(00215, 'Markbook', 'enableRubrics', 'Enable Rubrics', 'Should columns have Rubrics section enabled?', 'Y'),
	(00216, 'School Admin', 'staffDashboardDefaultTab', 'Staff Dashboard Default Tab', 'The default landing tab for the staff dashboard.', ''),
	(00217, 'School Admin', 'studentDashboardDefaultTab', 'Student Dashboard Default Tab', 'The default landing tab for the student dashboard.', ''),
	(00218, 'School Admin', 'parentDashboardDefaultTab', 'Parent Dashboard Default Tab', 'The default landing tab for the parent dashboard.', ''),
	(00219, 'System', 'enableMailerSMTP', 'Enable SMTP Mail', 'Adds PHPMailer settings for servers with an SMTP connection.', 'N'),
	(00220, 'System', 'mailerSMTPHost', 'SMTP Host', 'Set the hostname of the mail server.', ''),
	(00221, 'System', 'mailerSMTPPort', 'SMTP Port', 'Set the SMTP port number - likely to be 25, 465 or 587.', '25'),
	(00222, 'System', 'mailerSMTPUsername', 'SMTP Username', 'Username to use for SMTP authentication. Leave blank for no authentication.', ''),
	(00223, 'System', 'mailerSMTPPassword', 'SMTP Password', 'Password to use for SMTP authentication. Leave blank for no authentication.', ''),
	(00229, 'System', 'mainMenuCategoryOrder', 'Main Menu Category Order', 'A comma separated list of module categories in display order.', 'Admin,Assess,Learn,People,Other'),
	(00232, 'Attendance', 'attendanceReasons', 'Attendance Reasons', 'Comma-separated list of reasons which are available when taking attendance.', 'Pending,Education,Family,Medical,Other'),
	(00233, 'Attendance', 'attendanceMedicalReasons', 'Medical Reasons', 'Comma-separated list of allowable medical reasons.', 'Medical'),
	(00234, 'Attendance', 'attendanceEnableMedicalTracking', 'Enable Symptom Tracking', 'Attach a symptom report to attendance logs with a medical reason.', 'N'),
	(00235, 'Students', 'medicalIllnessSymptoms', 'Predefined Illness Symptoms', 'Comma-separated list of illness symptoms.', 'Fever,Cough,Cold,Vomiting,Diarrhea'),
	(00236, 'Staff Application Form', 'staffApplicationFormPublicApplications', 'Public Applications?', 'If yes, members of the public can submit staff applications', 'Y'),
	(00237, 'Individual Needs', 'targetsTemplate', 'Targets Template', 'An HTML template to be used in the targets field.', ''),
	(00238, 'Individual Needs', 'teachingStrategiesTemplate', 'Teaching Strategies Template', 'An HTML template to be used in the teaching strategies field.', ''),
	(00239, 'Individual Needs', 'notesReviewTemplate', 'Notes & Review Template', 'An HTML template to be used in the notes and review field.', ''),
	(00240, 'Attendance', 'attendanceCLINotifyByRollGroup', 'Enable Notifications by Roll Group', '', 'Y'),
	(00241, 'Attendance', 'attendanceCLINotifyByClass', 'Enable Notifications by Class', '', 'Y'),
	(00242, 'Attendance', 'attendanceCLIAdditionalUsers', 'Additional Users to Notify', 'Send the school-wide daily attendance report to additional users. Restricted to roles with permission to access Roll Groups Not Registered or Classes Not Registered.', ''),
	(00243, 'Students', 'noteCreationNotification', 'Note Creation Notification', 'Determines who to notify when a new student note is created.', 'Tutors'),
	(00244, 'Finance', 'invoiceeNameStyle', 'Invoicee Name Style', 'Determines how invoicee name appears on invoices and receipts.', 'Surname, Preferred Name'),
	(00245, 'Planner', 'shareUnitOutline', 'Share Unit Outline', 'Allow users who do not have access to the unit planner to see Unit Outlines via the lesson planner?', 'N'),
	(00246, 'Attendance', 'studentSelfRegistrationIPAddresses', 'Student Self Registration IP Addresses', 'Comma-separated list of IP addresses within which students can self register.', ''),
	(00247, 'Application Form', 'internalDocuments', 'Internal Documents', 'Comma-separated list of documents for internal upload and use.', ''),
	(00248, 'Attendance', 'countClassAsSchool', 'Count Class Attendance as School Attendance', 'Should attendance from the class context be used to prefill and inform school attendance?', 'N'),
	(00251, 'Attendance', 'defaultRollGroupAttendanceType', 'Default Roll Group Attendance Type', 'The default selection for attendance type when taking Roll Group attendance', 'Present'),
	(00252, 'Attendance', 'defaultClassAttendanceType', 'Default Class Attendance Type', 'The default selection for attendance type when taking Class attendance', 'Present'),
	(00253, 'Students', 'academicAlertLowThreshold', 'Low Academic Alert Threshold', 'The number of Markbook concerns needed in the past 60 days to raise a low level academic alert on a student.', '3'),
	(00254, 'Students', 'academicAlertMediumThreshold', 'Medium Academic Alert Threshold', 'The number of Markbook concerns needed in the past 60 days to raise a medium level academic alert on a student.', '5'),
	(00255, 'Students', 'academicAlertHighThreshold', 'High Academic Alert Threshold', 'The number of Markbook concerns needed in the past 60 days to raise a high level academic alert on a student.', '9'),
	(00256, 'Students', 'behaviourAlertLowThreshold', 'Low Behaviour Alert Threshold', 'The number of Behaviour concerns needed in the past 60 days to raise a low level alert on a student.', '3'),
	(00257, 'Students', 'behaviourAlertMediumThreshold', 'Medium Behaviour Alert Threshold', 'The number of Behaviour concerns needed in the past 60 days to raise a medium level alert on a student.', '5'),
	(00258, 'Students', 'behaviourAlertHighThreshold', 'High Behaviour Alert Threshold', 'The number of Behaviour concerns needed in the past 60 days to raise a high level alert on a student.', '9'),
	(00259, 'Markbook', 'enableDisplayCumulativeMarks', 'Enable Display Cumulative Marks', 'Should cumulative marks be displayed on the View Markbook page for Students and Parents and in Student Profiles?', 'N'),
	(00260, 'Application Form', 'scholarshipOptionsActive', 'Scholarship Options Active', 'Should the Scholarship Options section be turned on?', 'Y'),
	(00261, 'Application Form', 'paymentOptionsActive', 'Payment Options Active', 'Should the Payment section be turned on?', 'Y'),
	(00262, 'Application Form', 'senOptionsActive', 'Special Education Needs Active', 'Should the Special Education Needs section be turned on?', 'Y'),
	(00263, 'Timetable Admin', 'autoEnrolCourses', 'Auto-Enrol Courses Default', 'Should auto-enrolment of new students into courses be turned on or off by default?', 'N'),
	(00264, 'Application Form', 'availableYearsOfEntry', 'Available Years of Entry', 'Which school years should be available to apply to?', ''),
	(00265, 'Application Form', 'enableLimitedYearsOfEntry', 'Enable Limited Years of Entry', 'If yes, applicants choices for Year of Entry can be limited to specific school years.', 'N'),
	(00266, 'User Admin', 'uniqueEmailAddress', 'Unique Email Address', 'Are primary email addresses required to be unique?', 'N'),
	(00267, 'Planner', 'parentWeeklyEmailSummaryIncludeMarkbook', 'Parent Weekly Email Summary Include Markbook', 'Should Markbook information be included in the weekly planner email summary that goes out to parents?', 'N'),
	(00268, 'System', 'nameFormatStaffFormal', 'Formal Name Format', '', '[title] [preferredName:1]. [surname]'),
	(00269, 'System', 'nameFormatStaffFormalReversed', 'Formal Name Reversed', '', '[title] [surname], [preferredName:1].'),
	(00270, 'System', 'nameFormatStaffInformal', 'Informal Name Format', '', '[preferredName] [surname]'),
	(00271, 'System', 'nameFormatStaffInformalReversed', 'Informal Name Reversed', '', '[surname], [preferredName]'),
	(00272, 'Attendance', 'selfRegistrationRedirect', 'Self Registration Redirect', 'Should self registration redirect to Message Wall?', 'N'),
	(00273, 'Data Updater', 'cutoffDate', 'Cutoff Date', 'Earliest acceptable date when checking if data updates are required.', ''),
	(00274, 'Data Updater', 'redirectByRoleCategory', 'Data Updater Redirect', 'Which types of users should be redirected to the Data Updater if updates are required.', 'Parent'),
	(00275, 'Data Updater', 'requiredUpdates', 'Required Updates?', 'Should the data updater highlight updates that are required?', 'N'),
	(00276, 'Data Updater', 'requiredUpdatesByType', 'Required Update Types', 'Which type of data updates should be required.', 'Personal,Family'),
	(00277, 'Markbook', 'enableModifiedAssessment', 'Enable Modified Assessment', 'Allows teachers to specify "Modified Assessment" for students with individual needs.', 'N'),
	(00278, 'Messenger', 'messageBcc', 'Message Bcc', 'Comma-separated list of recipients to bcc all messenger emails to.', ''),
	(00279, 'System', 'organisationBackground', 'Background', 'Relative path to background image. Overrides theme background.', ''),
	(00280, 'Messenger', 'smsGateway', 'SMS Gateway', '', ''),
	(00281, 'Messenger', 'smsSenderID', 'SMS Sender ID', 'The sender name or phone number. Depends on the gateway used.', ''),
	(00282, 'System Admin', 'exportDefaultFileType', 'Default Export File Type', '', 'Excel2007'),
	(00283, 'System', 'mailerSMTPSecure', 'SMTP Encryption', 'Automatically sets the encryption based on the port, otherwise select one manually.', 'auto'),
	(00284, 'Staff', 'substituteTypes', 'Substitute Types', 'A comma-separated list.', 'Internal Substitute,External Substitute'),
	(00285, 'Staff', 'urgencyThreshold', 'Urgency Threshold', 'Notifications in this time-span are sent immediately, day or night.', '3'),
	(00286, 'Staff', 'urgentNotifications', 'Urgent Notifications', 'If enabled, urgent notifications will be sent by SMS as well as email.', 'N'),
	(00287, 'Staff', 'absenceApprovers', 'Absence Approvers', 'Users who can approve staff absences. Leave this blank if approval is not used.', ''),
	(00288, 'Staff', 'absenceFullDayThreshold', 'Full Day Absence', 'The minumum number of hours for an absence to count as a full day (1.0)', '6.0'),
	(00289, 'Staff', 'absenceHalfDayThreshold', 'Half Day Absence', 'The minumum number of hours for an absence to count as a half day (0.5). Absences less than this count as 0', '2.0'),
	(00290, 'Staff', 'absenceNotificationGroups', 'Notification Groups', 'Which messenger groups can staff members send absence notifications to?', ''),
	(00291, 'Attendance', 'crossFillClasses', 'Cross-Fill Classes', 'Should classes prefill with data from other classes?', 'N'),
	(00292, 'Attendance', 'recordFirstClassAsSchool', 'Enable First Class as School Attendance', 'Should the first class attendance taken in a day have the option to record as school-wide attendance?', 'N'),
	(00293, 'Behaviour', 'notifyEducationalAssistants', 'Enable Notifications for Educational Assistants', 'Should the Educational Assistants for a student be notified of new behaviour records?', 'N'),
	(00294, 'Behaviour', 'notifyTutors', 'Enable Notifications for Roll Group Tutors', 'Should the Roll Group Tutors of a student be notified of new behaviour records?', 'Y'),
	(00295, 'Staff', 'substituteInfo', 'Substitute Information', 'Text or HTML to display on the My Coverage page for substitutes, such as contact information or emergency procedures.', ''),
	(00296, 'Staff', 'coverageFullDayThreshold', 'Full Day Coverage', 'The minumum number of hours for staff coverage to count as a full day (1.0), otherwise it will count as a half-day (0.5)', '4.0'),
	(00297, 'Staff', 'absenceCommentTemplate', 'Absence Comment Template', 'Default text for the Comment field in New Absence.', ''),
	(00298, 'Individual Needs', 'investigationNotificationRole', 'Investigations Notification Role', 'Users to notify when an Investigation is complete.', ''),
	(00299, 'Students', 'firstAidDescriptionTemplate', 'First Aid Description Template', 'Template text to be included in the Description field of a First Aid Record.', ''),
	(00300, 'Messenger', 'pinnedMessagesOnHome', 'Enable Pinned Messages on Home', 'Displays pinned messages on the home page, above the dashboard.', 'N'),
	(00301, 'Staff', 'biographicalGroupingOrder', 'Biographical Grouping Order', 'Comma-separated list of biographical groupings displayed in the staff directory.', ''),
	(00302, 'Reports', 'debugMode', 'Debug Mode', 'Enable additional options to inspect reporting data.', 'N'),
	(00303, 'Reports', 'customAssetPath', 'Custom Asset Path', 'Relative to the Gibbon root directory.', '/uploads/reports'),
	(00304, 'Reports', 'archiveInformation', 'Archive Information', 'Text to display before the Archive by Student section.', ''),
	(00305, 'System', 'backgroundProcessing', 'Background Processing', 'Should the system start an external process for long-running commands?', 'Y'),
	(00306, 'Students', 'applicationFormRefereeRequired', 'Application Form Referee Required', 'Should the referee email address field be required?', 'Y');
/*!40000 ALTER TABLE `gibbonsetting` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibbonspace
CREATE TABLE IF NOT EXISTS `gibbonspace` (
  `gibbonSpaceID` int(10) unsigned zerofill NOT NULL,
  `name` varchar(30) NOT NULL,
  `type` varchar(50) NOT NULL,
  `capacity` int(5) NOT NULL,
  `computer` enum('N','Y') NOT NULL,
  `computerStudent` int(3) NOT NULL DEFAULT '0',
  `projector` enum('N','Y') NOT NULL,
  `tv` enum('N','Y') NOT NULL,
  `dvd` enum('N','Y') NOT NULL,
  `hifi` enum('N','Y') NOT NULL,
  `speakers` enum('N','Y') NOT NULL,
  `iwb` enum('N','Y') NOT NULL,
  `phoneInternal` varchar(5) NOT NULL,
  `phoneExternal` varchar(20) NOT NULL,
  `comment` text NOT NULL,
  PRIMARY KEY (`gibbonSpaceID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibbonspace: ~0 rows (approximately)
/*!40000 ALTER TABLE `gibbonspace` DISABLE KEYS */;
/*!40000 ALTER TABLE `gibbonspace` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibbonspaceperson
CREATE TABLE IF NOT EXISTS `gibbonspaceperson` (
  `gibbonSpacePersonID` int(12) unsigned zerofill NOT NULL,
  `gibbonSpaceID` int(10) unsigned zerofill NOT NULL,
  `gibbonPersonID` int(10) unsigned zerofill NOT NULL,
  `usageType` enum('','Teaching','Office','Other') COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`gibbonSpacePersonID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table bidyaan_fakmsc.gibbonspaceperson: ~0 rows (approximately)
/*!40000 ALTER TABLE `gibbonspaceperson` DISABLE KEYS */;
/*!40000 ALTER TABLE `gibbonspaceperson` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibbonstaff
CREATE TABLE IF NOT EXISTS `gibbonstaff` (
  `gibbonStaffID` int(10) unsigned zerofill NOT NULL,
  `gibbonPersonID` int(10) unsigned zerofill NOT NULL,
  `type` varchar(20) NOT NULL,
  `initials` varchar(4) DEFAULT NULL,
  `jobTitle` varchar(100) NOT NULL,
  `firstAidQualified` enum('','N','Y') NOT NULL DEFAULT '',
  `firstAidExpiry` date DEFAULT NULL,
  `countryOfOrigin` varchar(80) NOT NULL,
  `qualifications` varchar(255) NOT NULL,
  `biography` text NOT NULL,
  `biographicalGrouping` varchar(100) NOT NULL COMMENT 'Used for group staff when creating a staff directory.',
  `biographicalGroupingPriority` int(3) NOT NULL,
  PRIMARY KEY (`gibbonStaffID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibbonstaff: ~1 rows (approximately)
/*!40000 ALTER TABLE `gibbonstaff` DISABLE KEYS */;
INSERT INTO `gibbonstaff` (`gibbonStaffID`, `gibbonPersonID`, `type`, `initials`, `jobTitle`, `firstAidQualified`, `firstAidExpiry`, `countryOfOrigin`, `qualifications`, `biography`, `biographicalGrouping`, `biographicalGroupingPriority`) VALUES
	(0000000001, 0000000001, 'Teaching', NULL, '', '', NULL, '', '', '', '', 0);
/*!40000 ALTER TABLE `gibbonstaff` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibbonstaffabsence
CREATE TABLE IF NOT EXISTS `gibbonstaffabsence` (
  `gibbonStaffAbsenceID` int(14) unsigned zerofill NOT NULL,
  `gibbonStaffAbsenceTypeID` int(6) unsigned zerofill NOT NULL,
  `gibbonSchoolYearID` int(3) unsigned zerofill NOT NULL,
  `gibbonPersonID` int(10) unsigned zerofill NOT NULL,
  `reason` varchar(60) DEFAULT NULL,
  `comment` text,
  `commentConfidential` text,
  `status` enum('Pending Approval','Approved','Declined') DEFAULT 'Approved',
  `coverageRequired` enum('N','Y') DEFAULT 'N',
  `gibbonPersonIDApproval` int(10) unsigned zerofill DEFAULT NULL,
  `timestampApproval` timestamp NULL DEFAULT NULL,
  `notesApproval` text,
  `gibbonPersonIDCreator` int(10) unsigned zerofill NOT NULL,
  `timestampCreator` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `notificationSent` enum('N','Y') DEFAULT 'N',
  `notificationList` text,
  `gibbonGroupID` int(8) unsigned zerofill DEFAULT NULL,
  `googleCalendarEventID` text,
  PRIMARY KEY (`gibbonStaffAbsenceID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibbonstaffabsence: ~0 rows (approximately)
/*!40000 ALTER TABLE `gibbonstaffabsence` DISABLE KEYS */;
/*!40000 ALTER TABLE `gibbonstaffabsence` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibbonstaffabsencedate
CREATE TABLE IF NOT EXISTS `gibbonstaffabsencedate` (
  `gibbonStaffAbsenceDateID` int(14) unsigned zerofill NOT NULL,
  `gibbonStaffAbsenceID` int(14) unsigned zerofill DEFAULT NULL,
  `date` date DEFAULT NULL,
  `allDay` enum('N','Y') DEFAULT 'Y',
  `timeStart` time DEFAULT NULL,
  `timeEnd` time DEFAULT NULL,
  `value` decimal(3,2) NOT NULL DEFAULT '1.00',
  PRIMARY KEY (`gibbonStaffAbsenceDateID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibbonstaffabsencedate: ~0 rows (approximately)
/*!40000 ALTER TABLE `gibbonstaffabsencedate` DISABLE KEYS */;
/*!40000 ALTER TABLE `gibbonstaffabsencedate` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibbonstaffabsencetype
CREATE TABLE IF NOT EXISTS `gibbonstaffabsencetype` (
  `gibbonStaffAbsenceTypeID` int(6) unsigned zerofill NOT NULL,
  `name` varchar(60) DEFAULT NULL,
  `nameShort` varchar(10) DEFAULT NULL,
  `active` enum('N','Y') DEFAULT 'Y',
  `requiresApproval` enum('N','Y') DEFAULT 'N',
  `reasons` text,
  `sequenceNumber` int(3) NOT NULL,
  PRIMARY KEY (`gibbonStaffAbsenceTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibbonstaffabsencetype: ~4 rows (approximately)
/*!40000 ALTER TABLE `gibbonstaffabsencetype` DISABLE KEYS */;
INSERT INTO `gibbonstaffabsencetype` (`gibbonStaffAbsenceTypeID`, `name`, `nameShort`, `active`, `requiresApproval`, `reasons`, `sequenceNumber`) VALUES
	(000001, 'Sick Leave', 'S', 'Y', 'N', '', 1),
	(000002, 'Personal Leave', 'P', 'Y', 'N', '', 2),
	(000003, 'Non-paid Leave', 'NP', 'Y', 'N', '', 3),
	(000004, 'School Related', 'D', 'Y', 'N', 'PD,Sports Trip,Offsite Event,Other', 4);
/*!40000 ALTER TABLE `gibbonstaffabsencetype` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibbonstaffapplicationform
CREATE TABLE IF NOT EXISTS `gibbonstaffapplicationform` (
  `gibbonStaffApplicationFormID` int(12) unsigned zerofill NOT NULL,
  `gibbonStaffJobOpeningID` int(10) unsigned zerofill NOT NULL,
  `gibbonPersonID` int(10) unsigned zerofill DEFAULT NULL,
  `surname` varchar(60) DEFAULT NULL,
  `firstName` varchar(60) DEFAULT NULL,
  `preferredName` varchar(60) DEFAULT NULL,
  `officialName` varchar(150) DEFAULT NULL,
  `nameInCharacters` varchar(60) DEFAULT NULL,
  `gender` enum('M','F') DEFAULT NULL,
  `status` enum('Pending','Accepted','Rejected','Withdrawn') NOT NULL DEFAULT 'Pending',
  `dob` date DEFAULT NULL,
  `email` varchar(75) DEFAULT NULL,
  `homeAddress` mediumtext,
  `homeAddressDistrict` varchar(255) DEFAULT NULL,
  `homeAddressCountry` varchar(255) DEFAULT NULL,
  `phone1Type` enum('','Mobile','Home','Work','Fax','Pager','Other') DEFAULT NULL,
  `phone1CountryCode` varchar(7) DEFAULT NULL,
  `phone1` varchar(20) DEFAULT NULL,
  `countryOfBirth` varchar(30) DEFAULT NULL,
  `citizenship1` varchar(255) DEFAULT NULL,
  `citizenship1Passport` varchar(30) DEFAULT NULL,
  `nationalIDCardNumber` varchar(30) DEFAULT NULL,
  `residencyStatus` varchar(255) DEFAULT NULL,
  `visaExpiryDate` date DEFAULT NULL,
  `languageFirst` varchar(30) DEFAULT NULL,
  `languageSecond` varchar(30) DEFAULT NULL,
  `languageThird` varchar(30) DEFAULT NULL,
  `agreement` enum('N','Y') DEFAULT NULL,
  `timestamp` timestamp NULL DEFAULT NULL,
  `priority` int(1) NOT NULL DEFAULT '0',
  `milestones` text NOT NULL,
  `notes` text NOT NULL,
  `dateStart` date DEFAULT NULL,
  `questions` text NOT NULL,
  `fields` text NOT NULL COMMENT 'Serialised array of custom field values',
  `referenceEmail1` varchar(100) NOT NULL,
  `referenceEmail2` varchar(100) NOT NULL,
  PRIMARY KEY (`gibbonStaffApplicationFormID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibbonstaffapplicationform: ~0 rows (approximately)
/*!40000 ALTER TABLE `gibbonstaffapplicationform` DISABLE KEYS */;
/*!40000 ALTER TABLE `gibbonstaffapplicationform` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibbonstaffapplicationformfile
CREATE TABLE IF NOT EXISTS `gibbonstaffapplicationformfile` (
  `gibbonStaffApplicationFormFileID` int(14) unsigned zerofill NOT NULL,
  `gibbonStaffApplicationFormID` int(12) unsigned zerofill NOT NULL,
  `name` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  PRIMARY KEY (`gibbonStaffApplicationFormFileID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibbonstaffapplicationformfile: ~0 rows (approximately)
/*!40000 ALTER TABLE `gibbonstaffapplicationformfile` DISABLE KEYS */;
/*!40000 ALTER TABLE `gibbonstaffapplicationformfile` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibbonstaffcontract
CREATE TABLE IF NOT EXISTS `gibbonstaffcontract` (
  `gibbonStaffContractID` int(12) unsigned zerofill NOT NULL,
  `gibbonStaffID` int(10) unsigned zerofill NOT NULL,
  `title` varchar(100) NOT NULL,
  `status` enum('','Pending','Active','Expired') NOT NULL DEFAULT '',
  `dateStart` date NOT NULL,
  `dateEnd` date DEFAULT NULL,
  `salaryScale` varchar(255) DEFAULT NULL,
  `salaryAmount` decimal(12,2) DEFAULT NULL,
  `salaryPeriod` enum('','Week','Month','Year','Contract') DEFAULT NULL,
  `responsibility` varchar(255) DEFAULT NULL,
  `responsibilityAmount` decimal(12,2) DEFAULT NULL,
  `responsibilityPeriod` enum('','Week','Month','Year','Contract') DEFAULT NULL,
  `housingAmount` decimal(12,2) DEFAULT NULL,
  `housingPeriod` enum('','Week','Month','Year','Contract') DEFAULT NULL,
  `travelAmount` decimal(12,2) DEFAULT NULL,
  `travelPeriod` enum('','Week','Month','Year','Contract') DEFAULT NULL,
  `retirementAmount` decimal(12,2) DEFAULT NULL,
  `retirementPeriod` enum('','Week','Month','Year','Contract') DEFAULT NULL,
  `bonusAmount` decimal(12,2) DEFAULT NULL,
  `bonusPeriod` enum('','Week','Month','Year','Contract') DEFAULT NULL,
  `education` text NOT NULL,
  `notes` text NOT NULL,
  `contractUpload` varchar(255) DEFAULT NULL,
  `gibbonPersonIDCreator` int(10) unsigned zerofill NOT NULL,
  `timestampCreator` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`gibbonStaffContractID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibbonstaffcontract: ~0 rows (approximately)
/*!40000 ALTER TABLE `gibbonstaffcontract` DISABLE KEYS */;
/*!40000 ALTER TABLE `gibbonstaffcontract` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibbonstaffcoverage
CREATE TABLE IF NOT EXISTS `gibbonstaffcoverage` (
  `gibbonStaffCoverageID` int(14) unsigned zerofill NOT NULL,
  `gibbonStaffAbsenceID` int(14) unsigned zerofill DEFAULT NULL,
  `gibbonSchoolYearID` int(3) unsigned zerofill NOT NULL,
  `gibbonPersonID` int(10) unsigned zerofill NOT NULL,
  `status` enum('Requested','Accepted','Declined','Cancelled') DEFAULT 'Requested',
  `requestType` enum('Individual','Broadcast','Assigned') DEFAULT 'Broadcast',
  `substituteTypes` varchar(255) DEFAULT NULL,
  `gibbonPersonIDStatus` int(10) unsigned zerofill NOT NULL,
  `timestampStatus` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `notesStatus` text,
  `gibbonPersonIDCoverage` int(10) unsigned zerofill DEFAULT NULL,
  `timestampCoverage` timestamp NULL DEFAULT NULL,
  `notesCoverage` text,
  `attachmentType` enum('File','HTML','Link') DEFAULT NULL,
  `attachmentContent` text,
  `notificationSent` enum('N','Y') DEFAULT 'N',
  `notificationList` text,
  PRIMARY KEY (`gibbonStaffCoverageID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibbonstaffcoverage: ~0 rows (approximately)
/*!40000 ALTER TABLE `gibbonstaffcoverage` DISABLE KEYS */;
/*!40000 ALTER TABLE `gibbonstaffcoverage` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibbonstaffcoveragedate
CREATE TABLE IF NOT EXISTS `gibbonstaffcoveragedate` (
  `gibbonStaffCoverageDateID` int(14) unsigned zerofill NOT NULL,
  `gibbonStaffCoverageID` int(14) unsigned zerofill DEFAULT NULL,
  `gibbonStaffAbsenceDateID` int(14) unsigned zerofill DEFAULT NULL,
  `date` date DEFAULT NULL,
  `allDay` enum('N','Y') DEFAULT 'Y',
  `timeStart` time DEFAULT NULL,
  `timeEnd` time DEFAULT NULL,
  `value` decimal(3,2) NOT NULL DEFAULT '1.00',
  `gibbonPersonIDUnavailable` int(10) unsigned zerofill DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`gibbonStaffCoverageDateID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibbonstaffcoveragedate: ~0 rows (approximately)
/*!40000 ALTER TABLE `gibbonstaffcoveragedate` DISABLE KEYS */;
/*!40000 ALTER TABLE `gibbonstaffcoveragedate` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibbonstaffjobopening
CREATE TABLE IF NOT EXISTS `gibbonstaffjobopening` (
  `gibbonStaffJobOpeningID` int(10) unsigned zerofill NOT NULL,
  `type` varchar(20) NOT NULL,
  `jobTitle` varchar(100) NOT NULL,
  `dateOpen` date NOT NULL,
  `active` enum('Y','N') NOT NULL DEFAULT 'Y',
  `description` text NOT NULL,
  `gibbonPersonIDCreator` int(10) unsigned zerofill NOT NULL,
  `timestampCreator` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`gibbonStaffJobOpeningID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibbonstaffjobopening: ~0 rows (approximately)
/*!40000 ALTER TABLE `gibbonstaffjobopening` DISABLE KEYS */;
/*!40000 ALTER TABLE `gibbonstaffjobopening` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibbonstring
CREATE TABLE IF NOT EXISTS `gibbonstring` (
  `gibbonStringID` int(8) unsigned zerofill NOT NULL,
  `original` varchar(100) NOT NULL,
  `replacement` varchar(100) NOT NULL,
  `mode` enum('Whole','Partial') NOT NULL,
  `caseSensitive` enum('Y','N') NOT NULL,
  `priority` int(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`gibbonStringID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibbonstring: ~0 rows (approximately)
/*!40000 ALTER TABLE `gibbonstring` DISABLE KEYS */;
/*!40000 ALTER TABLE `gibbonstring` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibbonstudentenrolment
CREATE TABLE IF NOT EXISTS `gibbonstudentenrolment` (
  `gibbonStudentEnrolmentID` int(8) unsigned zerofill NOT NULL,
  `gibbonPersonID` int(10) unsigned zerofill NOT NULL,
  `gibbonSchoolYearID` int(3) unsigned zerofill NOT NULL,
  `gibbonYearGroupID` int(3) unsigned zerofill NOT NULL,
  `gibbonRollGroupID` int(5) unsigned zerofill NOT NULL,
  `rollOrder` int(2) DEFAULT NULL,
  PRIMARY KEY (`gibbonStudentEnrolmentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibbonstudentenrolment: ~0 rows (approximately)
/*!40000 ALTER TABLE `gibbonstudentenrolment` DISABLE KEYS */;
/*!40000 ALTER TABLE `gibbonstudentenrolment` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibbonstudentnote
CREATE TABLE IF NOT EXISTS `gibbonstudentnote` (
  `gibbonStudentNoteID` int(12) unsigned zerofill NOT NULL,
  `gibbonPersonID` int(10) unsigned zerofill NOT NULL,
  `gibbonStudentNoteCategoryID` int(5) unsigned zerofill DEFAULT NULL,
  `title` varchar(50) NOT NULL,
  `note` text NOT NULL,
  `gibbonPersonIDCreator` int(10) unsigned zerofill NOT NULL,
  `timestamp` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`gibbonStudentNoteID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibbonstudentnote: ~0 rows (approximately)
/*!40000 ALTER TABLE `gibbonstudentnote` DISABLE KEYS */;
/*!40000 ALTER TABLE `gibbonstudentnote` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibbonstudentnotecategory
CREATE TABLE IF NOT EXISTS `gibbonstudentnotecategory` (
  `gibbonStudentNoteCategoryID` int(5) unsigned zerofill NOT NULL,
  `name` varchar(30) NOT NULL,
  `template` text NOT NULL,
  `active` enum('Y','N') NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`gibbonStudentNoteCategoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibbonstudentnotecategory: ~4 rows (approximately)
/*!40000 ALTER TABLE `gibbonstudentnotecategory` DISABLE KEYS */;
INSERT INTO `gibbonstudentnotecategory` (`gibbonStudentNoteCategoryID`, `name`, `template`, `active`) VALUES
	(00006, 'Academic', '', 'Y'),
	(00007, 'Pastoral', '', 'Y'),
	(00008, 'Behaviour', '', 'Y'),
	(00009, 'Other', '', 'Y');
/*!40000 ALTER TABLE `gibbonstudentnotecategory` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibbonsubstitute
CREATE TABLE IF NOT EXISTS `gibbonsubstitute` (
  `gibbonSubstituteID` int(10) unsigned zerofill NOT NULL,
  `gibbonPersonID` int(10) unsigned zerofill NOT NULL,
  `active` enum('Y','N') DEFAULT 'Y',
  `type` varchar(60) DEFAULT NULL,
  `details` varchar(255) DEFAULT NULL,
  `priority` int(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`gibbonSubstituteID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibbonsubstitute: ~0 rows (approximately)
/*!40000 ALTER TABLE `gibbonsubstitute` DISABLE KEYS */;
/*!40000 ALTER TABLE `gibbonsubstitute` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibbontheme
CREATE TABLE IF NOT EXISTS `gibbontheme` (
  `gibbonThemeID` int(4) unsigned zerofill NOT NULL,
  `name` varchar(30) NOT NULL,
  `description` varchar(100) NOT NULL,
  `active` enum('N','Y') NOT NULL DEFAULT 'N',
  `version` varchar(6) NOT NULL,
  `author` varchar(40) NOT NULL,
  `url` varchar(255) NOT NULL,
  PRIMARY KEY (`gibbonThemeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibbontheme: ~1 rows (approximately)
/*!40000 ALTER TABLE `gibbontheme` DISABLE KEYS */;
INSERT INTO `gibbontheme` (`gibbonThemeID`, `name`, `description`, `active`, `version`, `author`, `url`) VALUES
	(0013, 'Default', 'Gibbon\'s 2015 look and feel.', 'Y', '1.0.00', 'Ross Parker', 'http://rossparker.org');
/*!40000 ALTER TABLE `gibbontheme` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibbontt
CREATE TABLE IF NOT EXISTS `gibbontt` (
  `gibbonTTID` int(8) unsigned zerofill NOT NULL,
  `gibbonSchoolYearID` int(3) unsigned zerofill NOT NULL,
  `name` varchar(30) NOT NULL,
  `nameShort` varchar(12) NOT NULL,
  `nameShortDisplay` enum('Day Of The Week','Timetable Day Short Name','') NOT NULL DEFAULT 'Day Of The Week',
  `gibbonYearGroupIDList` varchar(255) NOT NULL,
  `active` enum('Y','N') NOT NULL,
  PRIMARY KEY (`gibbonTTID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibbontt: ~0 rows (approximately)
/*!40000 ALTER TABLE `gibbontt` DISABLE KEYS */;
/*!40000 ALTER TABLE `gibbontt` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibbonttcolumn
CREATE TABLE IF NOT EXISTS `gibbonttcolumn` (
  `gibbonTTColumnID` int(6) unsigned zerofill NOT NULL,
  `name` varchar(30) NOT NULL,
  `nameShort` varchar(12) NOT NULL,
  PRIMARY KEY (`gibbonTTColumnID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibbonttcolumn: ~0 rows (approximately)
/*!40000 ALTER TABLE `gibbonttcolumn` DISABLE KEYS */;
/*!40000 ALTER TABLE `gibbonttcolumn` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibbonttcolumnrow
CREATE TABLE IF NOT EXISTS `gibbonttcolumnrow` (
  `gibbonTTColumnRowID` int(8) unsigned zerofill NOT NULL,
  `gibbonTTColumnID` int(6) unsigned zerofill NOT NULL,
  `name` varchar(12) NOT NULL,
  `nameShort` varchar(4) NOT NULL,
  `timeStart` time NOT NULL,
  `timeEnd` time NOT NULL,
  `type` enum('Lesson','Pastoral','Sport','Break','Service','Other') NOT NULL,
  PRIMARY KEY (`gibbonTTColumnRowID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibbonttcolumnrow: ~0 rows (approximately)
/*!40000 ALTER TABLE `gibbonttcolumnrow` DISABLE KEYS */;
/*!40000 ALTER TABLE `gibbonttcolumnrow` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibbonttday
CREATE TABLE IF NOT EXISTS `gibbonttday` (
  `gibbonTTDayID` int(10) unsigned zerofill NOT NULL,
  `gibbonTTID` int(8) unsigned zerofill NOT NULL,
  `gibbonTTColumnID` int(6) unsigned zerofill NOT NULL,
  `name` varchar(12) NOT NULL,
  `nameShort` varchar(4) NOT NULL,
  `color` varchar(6) NOT NULL,
  `fontColor` varchar(6) NOT NULL,
  PRIMARY KEY (`gibbonTTDayID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibbonttday: ~0 rows (approximately)
/*!40000 ALTER TABLE `gibbonttday` DISABLE KEYS */;
/*!40000 ALTER TABLE `gibbonttday` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibbonttdaydate
CREATE TABLE IF NOT EXISTS `gibbonttdaydate` (
  `gibbonTTDayDateID` int(10) unsigned zerofill NOT NULL,
  `gibbonTTDayID` int(10) unsigned zerofill NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`gibbonTTDayDateID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibbonttdaydate: ~0 rows (approximately)
/*!40000 ALTER TABLE `gibbonttdaydate` DISABLE KEYS */;
/*!40000 ALTER TABLE `gibbonttdaydate` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibbonttdayrowclass
CREATE TABLE IF NOT EXISTS `gibbonttdayrowclass` (
  `gibbonTTDayRowClassID` int(12) unsigned zerofill NOT NULL,
  `gibbonTTColumnRowID` int(8) unsigned zerofill NOT NULL,
  `gibbonTTDayID` int(10) unsigned zerofill NOT NULL,
  `gibbonCourseClassID` int(8) unsigned zerofill NOT NULL,
  `gibbonSpaceID` int(10) unsigned zerofill DEFAULT NULL,
  PRIMARY KEY (`gibbonTTDayRowClassID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibbonttdayrowclass: ~0 rows (approximately)
/*!40000 ALTER TABLE `gibbonttdayrowclass` DISABLE KEYS */;
/*!40000 ALTER TABLE `gibbonttdayrowclass` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibbonttdayrowclassexception
CREATE TABLE IF NOT EXISTS `gibbonttdayrowclassexception` (
  `gibbonTTDayRowClassExceptionID` int(14) unsigned zerofill NOT NULL,
  `gibbonTTDayRowClassID` int(12) unsigned zerofill NOT NULL,
  `gibbonPersonID` int(10) unsigned zerofill NOT NULL,
  PRIMARY KEY (`gibbonTTDayRowClassExceptionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibbonttdayrowclassexception: ~0 rows (approximately)
/*!40000 ALTER TABLE `gibbonttdayrowclassexception` DISABLE KEYS */;
/*!40000 ALTER TABLE `gibbonttdayrowclassexception` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibbonttimport
CREATE TABLE IF NOT EXISTS `gibbonttimport` (
  `gibbonTTImportID` int(14) unsigned zerofill NOT NULL,
  `courseNameShort` varchar(12) NOT NULL DEFAULT '',
  `classNameShort` varchar(8) NOT NULL DEFAULT '',
  `dayName` varchar(12) NOT NULL,
  `rowName` varchar(12) NOT NULL,
  `teacherUsernameList` text NOT NULL,
  `spaceName` varchar(30) NOT NULL,
  PRIMARY KEY (`gibbonTTImportID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibbonttimport: ~0 rows (approximately)
/*!40000 ALTER TABLE `gibbonttimport` DISABLE KEYS */;
/*!40000 ALTER TABLE `gibbonttimport` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibbonttspacebooking
CREATE TABLE IF NOT EXISTS `gibbonttspacebooking` (
  `gibbonTTSpaceBookingID` int(12) unsigned zerofill NOT NULL,
  `foreignKey` enum('gibbonSpaceID','gibbonLibraryItemID') NOT NULL DEFAULT 'gibbonSpaceID',
  `foreignKeyID` int(10) unsigned zerofill NOT NULL,
  `gibbonPersonID` int(10) unsigned zerofill NOT NULL,
  `date` date NOT NULL,
  `timeStart` time NOT NULL,
  `timeEnd` time NOT NULL,
  PRIMARY KEY (`gibbonTTSpaceBookingID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibbonttspacebooking: ~0 rows (approximately)
/*!40000 ALTER TABLE `gibbonttspacebooking` DISABLE KEYS */;
/*!40000 ALTER TABLE `gibbonttspacebooking` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibbonttspacechange
CREATE TABLE IF NOT EXISTS `gibbonttspacechange` (
  `gibbonTTSpaceChangeID` int(12) unsigned zerofill NOT NULL,
  `gibbonTTDayRowClassID` int(12) unsigned zerofill NOT NULL,
  `gibbonSpaceID` int(10) unsigned zerofill DEFAULT NULL,
  `date` date NOT NULL,
  `gibbonPersonID` int(10) unsigned zerofill NOT NULL,
  PRIMARY KEY (`gibbonTTSpaceChangeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibbonttspacechange: ~0 rows (approximately)
/*!40000 ALTER TABLE `gibbonttspacechange` DISABLE KEYS */;
/*!40000 ALTER TABLE `gibbonttspacechange` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibbonunit
CREATE TABLE IF NOT EXISTS `gibbonunit` (
  `gibbonUnitID` int(10) unsigned zerofill NOT NULL,
  `gibbonCourseID` int(8) unsigned zerofill NOT NULL,
  `name` varchar(40) NOT NULL,
  `active` enum('Y','N') NOT NULL DEFAULT 'Y',
  `description` text NOT NULL,
  `tags` text NOT NULL,
  `map` enum('Y','N') NOT NULL DEFAULT 'Y' COMMENT 'Should this unit be included in curriculum maps and other summaries?',
  `ordering` int(2) NOT NULL DEFAULT '0',
  `attachment` varchar(255) NOT NULL,
  `details` text NOT NULL,
  `license` varchar(50) DEFAULT NULL,
  `sharedPublic` enum('Y','N') DEFAULT NULL,
  `gibbonPersonIDCreator` int(10) unsigned zerofill NOT NULL,
  `gibbonPersonIDLastEdit` int(10) unsigned zerofill NOT NULL,
  PRIMARY KEY (`gibbonUnitID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibbonunit: ~0 rows (approximately)
/*!40000 ALTER TABLE `gibbonunit` DISABLE KEYS */;
/*!40000 ALTER TABLE `gibbonunit` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibbonunitblock
CREATE TABLE IF NOT EXISTS `gibbonunitblock` (
  `gibbonUnitBlockID` int(12) unsigned zerofill NOT NULL,
  `gibbonUnitID` int(10) unsigned zerofill NOT NULL,
  `title` varchar(100) NOT NULL,
  `type` varchar(50) NOT NULL,
  `length` varchar(3) NOT NULL,
  `contents` text NOT NULL,
  `teachersNotes` text NOT NULL,
  `sequenceNumber` int(4) NOT NULL,
  PRIMARY KEY (`gibbonUnitBlockID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibbonunitblock: ~0 rows (approximately)
/*!40000 ALTER TABLE `gibbonunitblock` DISABLE KEYS */;
/*!40000 ALTER TABLE `gibbonunitblock` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibbonunitclass
CREATE TABLE IF NOT EXISTS `gibbonunitclass` (
  `gibbonUnitClassID` int(12) unsigned zerofill NOT NULL,
  `gibbonUnitID` int(10) unsigned zerofill NOT NULL,
  `gibbonCourseClassID` int(8) unsigned zerofill NOT NULL,
  `running` enum('N','Y') NOT NULL DEFAULT 'N',
  PRIMARY KEY (`gibbonUnitClassID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibbonunitclass: ~0 rows (approximately)
/*!40000 ALTER TABLE `gibbonunitclass` DISABLE KEYS */;
/*!40000 ALTER TABLE `gibbonunitclass` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibbonunitclassblock
CREATE TABLE IF NOT EXISTS `gibbonunitclassblock` (
  `gibbonUnitClassBlockID` int(14) unsigned zerofill NOT NULL,
  `gibbonUnitClassID` int(12) unsigned zerofill NOT NULL,
  `gibbonPlannerEntryID` int(14) unsigned zerofill NOT NULL,
  `gibbonUnitBlockID` int(12) unsigned zerofill NOT NULL,
  `title` varchar(100) NOT NULL,
  `type` varchar(50) NOT NULL,
  `length` varchar(3) NOT NULL,
  `contents` text NOT NULL,
  `teachersNotes` text NOT NULL,
  `sequenceNumber` int(4) NOT NULL,
  `complete` enum('Y','N') NOT NULL DEFAULT 'N',
  PRIMARY KEY (`gibbonUnitClassBlockID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibbonunitclassblock: ~0 rows (approximately)
/*!40000 ALTER TABLE `gibbonunitclassblock` DISABLE KEYS */;
/*!40000 ALTER TABLE `gibbonunitclassblock` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibbonunitoutcome
CREATE TABLE IF NOT EXISTS `gibbonunitoutcome` (
  `gibbonUnitOutcomeID` int(12) unsigned zerofill NOT NULL,
  `gibbonUnitID` int(10) unsigned zerofill NOT NULL,
  `gibbonOutcomeID` int(8) unsigned zerofill NOT NULL,
  `sequenceNumber` int(4) NOT NULL,
  `content` text NOT NULL,
  PRIMARY KEY (`gibbonUnitOutcomeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibbonunitoutcome: ~0 rows (approximately)
/*!40000 ALTER TABLE `gibbonunitoutcome` DISABLE KEYS */;
/*!40000 ALTER TABLE `gibbonunitoutcome` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibbonusernameformat
CREATE TABLE IF NOT EXISTS `gibbonusernameformat` (
  `gibbonUsernameFormatID` int(3) unsigned zerofill NOT NULL,
  `gibbonRoleIDList` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `format` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `isDefault` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `isNumeric` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `numericValue` int(12) unsigned NOT NULL DEFAULT '0',
  `numericIncrement` int(3) unsigned NOT NULL DEFAULT '1',
  `numericSize` int(3) unsigned NOT NULL DEFAULT '4',
  PRIMARY KEY (`gibbonUsernameFormatID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table bidyaan_fakmsc.gibbonusernameformat: ~2 rows (approximately)
/*!40000 ALTER TABLE `gibbonusernameformat` DISABLE KEYS */;
INSERT INTO `gibbonusernameformat` (`gibbonUsernameFormatID`, `gibbonRoleIDList`, `format`, `isDefault`, `isNumeric`, `numericValue`, `numericIncrement`, `numericSize`) VALUES
	(001, '003', '[preferredName:1][surname]', 'Y', 'N', 0, 1, 4),
	(002, '001,002,006', '[preferredName:1].[surname]', 'N', 'N', 0, 1, 4);
/*!40000 ALTER TABLE `gibbonusernameformat` ENABLE KEYS */;

-- Dumping structure for table bidyaan_fakmsc.gibbonyeargroup
CREATE TABLE IF NOT EXISTS `gibbonyeargroup` (
  `gibbonYearGroupID` int(3) unsigned zerofill NOT NULL,
  `name` varchar(15) NOT NULL,
  `nameShort` varchar(4) NOT NULL,
  `sequenceNumber` int(3) NOT NULL,
  `gibbonPersonIDHOY` int(10) unsigned zerofill DEFAULT NULL,
  PRIMARY KEY (`gibbonYearGroupID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bidyaan_fakmsc.gibbonyeargroup: ~7 rows (approximately)
/*!40000 ALTER TABLE `gibbonyeargroup` DISABLE KEYS */;
INSERT INTO `gibbonyeargroup` (`gibbonYearGroupID`, `name`, `nameShort`, `sequenceNumber`, `gibbonPersonIDHOY`) VALUES
	(001, 'Year 7', 'Y07', 1, NULL),
	(002, 'Year 8', 'Y08', 2, NULL),
	(003, 'Year 9', 'Y09', 3, NULL),
	(004, 'Year 10', 'Y10', 4, NULL),
	(005, 'Year 11', 'Y11', 5, NULL),
	(006, 'Year 12', 'Y12', 6, NULL),
	(007, 'Year 13', 'Y13', 7, NULL);
/*!40000 ALTER TABLE `gibbonyeargroup` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
