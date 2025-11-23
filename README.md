# attendance_app

A new Flutter project.

## Getting Started

This project is a final project point for a Flutter application to solve education quality.

A few resources to get you started if this is your first Flutter project:

🌍 SDG: Student Attendance Assurance & Learning Continuity
Goal: Ensure accurate monitoring of student attendance to improve learning continuity, reduce dropouts, and enhance academic performance.
This SDG ensures every student is present, accounted for, and supported through technology-driven attendance tracking.
________________________________________
🎯 Core Objective
To create a unified, digital, and transparent system for capturing, analyzing, and improving student attendance metrics at classroom, school, and national levels.
________________________________________
🔄 Complete Scenario & Workflow Overview
Below is a complete end-to-end conceptualization, covering people, process, technology, edge cases, policies, and future enhancements.
________________________________________
👥 Stakeholders
1.	Students
2.	Teachers
3.	Head of Department / Principal
4.	Parents / Guardians
5.	School Administration
6.	Government Education Boards
7.	System Developers (Flutter/Firebase team)
________________________________________
🏫 Scenario Breakdown
________________________________________
1. Student Enrollment Scenario
•	Each student is registered in the system.
•	Data includes:
o	Student ID, Name, Class, Section
o	Parent contact details
o	Attendance tracking preferences (QR, RFID, Face recognition, manual)
•	Students can be activated/deactivated (transfer, graduation).
________________________________________
2. Classroom Session Scenario
•	Teacher opens today’s class session on a Flutter web app.
•	Session metadata:
o	Course name
o	Grade/section
o	Date/time
o	Teacher ID
o	Session type (lecture, lab, exam)
________________________________________
3. Attendance Collection Methods
Your system may support multiple methods:
3.1 QR Code-based Attendance
•	Teacher displays a unique QR code on screen.
•	Students scan via mobile.
•	Firebase validates:
o	Time validity (QR expires in X seconds)
o	Student-device ID (prevents sharing QR)
o	Location-based rules (optional)
3.2 RFID Scanning (Smart Card)
•	Scanners at classroom doors.
•	Attendance recorded automatically as students walk in.
3.3 Face Recognition
•	Camera captures student face.
•	System matches in database.
•	Works offline + syncs later.
3.4 Manual Marking
•	Teacher marks present/absent/late for each student.
•	Used for fallback situations.
________________________________________
4. Attendance Validation Scenario
To prevent cheating:
•	Limit attendance to specific time window.
•	Device authentication (prevent scanning from outside class).
•	Geofencing (optional).
•	Randomized QR regeneration.
•	Cross-check with teacher’s device.
________________________________________
5. Absence Follow-up Scenario
If a student is absent:
1.	Parent gets auto-notification (SMS/Email/Push):
o	“Your child was absent today.”
2.	Teacher may record a reason (if known):
o	Sick
o	Travel
o	Suspended
o	Unknown
3.	System sends reminders if absence continues.
________________________________________
6. Late Arrival Scenario
•	Student marked Late automatically if scanned after threshold.
•	System logs arrival time.
•	Teacher can override if justified.
________________________________________
7. Special Cases Scenario
7.1 Student Forgets Device
•	Teacher marks manually.
•	Student signs a verification slip.
7.2 Power/Internet Outage
•	Offline-first app saves entries locally.
•	Syncs to Firebase when online.
7.3 Substitute Teacher
•	Substitute accesses the class session with limited rights.
•	System maintains teacher-of-record for accountability.
7.4 Student Leaves Early
•	Exit attendance recorded separately (RFID or manual).
________________________________________
8. Reports & Dashboard Scenario
For Teachers:
•	Daily attendance sheet
•	Late arrivals log
•	Absent reasons summary
For Admin:
•	Attendance trends per class
•	Chronic absentee list
•	Heatmap of attendance peaks/drops
For Parents:
•	Monthly attendance card
•	Alerts for low attendance %
For Government:
•	School-level attendance compliance data
•	Dropout prediction models
________________________________________
9. Intervention Scenario
If a student is absent for:
•	3 days → Notify parent
•	7 days → Counselor outreach
•	14 days → Home visit trigger
•	30 days → Possible dropout case flagged
ML models predict:
•	Risk of dropout
•	Declining performance due to attendance patterns
________________________________________
10. Data Security Scenario
•	Students’ data encrypted in Firebase.
•	Auth via Firebase Authentication.
•	Role-based access:
o	Teacher → Only their classes.
o	Admin → All classes.
o	Parents → Only their children.
________________________________________
11. Technology Implementation Scenario
Flutter Web + Firebase Backend
•	Firebase Auth (Teachers/Parents/Admin)
•	Firestore (attendance logs, student profiles)
•	Firebase Functions (notifications, QR generation, time validation)
•	Firebase Storage (face recognition images)
•	Firebase Messaging (push alerts)
•	Cloud Vision API (optional: for face detection)
