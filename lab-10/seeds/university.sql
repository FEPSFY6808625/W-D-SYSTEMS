DROP DATABASE IF EXISTS university_web;

CREATE DATABASE university_web;

USE university_web;

DROP TABLE IF EXISTS Department;

CREATE TABLE
    Department (
        Dept_No INT UNSIGNED,
        Dept_Name VARCHAR(255) NOT NULL,
        Dept_Location VARCHAR(5),
        HOD INT UNSIGNED,
        HOD_Start DATE,
        PRIMARY KEY(Dept_No),
        UNIQUE (Dept_Name)
    );

INSERT INTO Department
VALUES (
        010,
        'Department of Computer Science',
        'BB 02',
        111114,
        '2020-08-20'
    );

INSERT INTO Department
VALUES (
        020,
        'Department of Electronics and Electrical Engineering',
        'BB 01',
        111127,
        '2018-08-20'
    );

INSERT INTO Department
VALUES (
        030,
        'Department of Physics',
        'BB 03',
        111128,
        '2017-08-20'
    );

DROP TABLE IF EXISTS Academic;

CREATE TABLE
    Academic (
        Acad_ID INT UNSIGNED,
        Acad_Title ENUM(
            'Dr',
            'Prof',
            'Mr',
            'Mrs',
            'Miss',
            'Ms'
        ),
        Acad_FName VARCHAR(255) NOT NULL,
        Acad_LName VARCHAR(255) NOT NULL,
        Acad_Position ENUM(
            'Teaching Fellow',
            'Lecturer',
            'Senior Teaching Fellow',
            'Senior Lecturer',
            'Reader',
            'Professor'
        ),
        Acad_Age TINYINT,
        Acad_Gender ENUM('M', 'F'),
        Acad_Salary DECIMAL (15, 2),
        Acad_Office VARCHAR(2),
        Acad_Phone VARCHAR(4) DEFAULT '0000',
        Acad_Email VARCHAR(255),
        Acad_Dept INT UNSIGNED,
        CHECK (Acad_Age > 21),
        PRIMARY KEY (Acad_ID),
        FOREIGN KEY (Acad_Dept) REFERENCES Department (Dept_No)
    );

INSERT INTO Academic
VALUES (
        111111,
        'Prof',
        'Helen',
        'Treharne',
        'Professor',
        45,
        'F',
        80000.00,
        '12',
        '3161',
        'h.treharne@surrey.ac.uk',
        010
    );

INSERT INTO Academic
VALUES (
        111112,
        'Prof',
        'Steve',
        'Schnieder',
        'Professor',
        55,
        'M',
        90000.00,
        '08',
        '2357',
        's.schneider@surrey.ac.uk',
        010
    );

INSERT INTO Academic
VALUES (
        111113,
        'Prof',
        'Paul',
        'Krause',
        'Professor',
        60,
        'M',
        100000.00,
        '32',
        '8907',
        'p.krause@surrey.ac.uk',
        010
    );

INSERT INTO Academic
VALUES (
        111114,
        'Dr',
        'Mark',
        'Manulis',
        'Reader',
        43,
        'M',
        70000.00,
        '29',
        '6058',
        'm.manulis@surrey.ac.uk',
        010
    );

INSERT INTO Academic
VALUES (
        111115,
        'Dr',
        'Lee',
        'Gillam',
        'Reader',
        44,
        'M',
        65000.00,
        '25',
        '0000',
        'l.gillam@surrey.ac.uk',
        010
    );

INSERT INTO Academic
VALUES (
        111116,
        'Dr',
        'Lilian',
        'Tang',
        'Reader',
        45,
        'F',
        65000.00,
        '10',
        '0000',
        'l.gillam@surrey.ac.uk',
        010
    );

INSERT INTO Academic
VALUES (
        111117,
        'Dr',
        'Frank',
        'Guerin',
        'Senior Lecturer',
        38,
        'M',
        55000.00,
        '17',
        '9195',
        'f.guerin@surrey.ac.uk',
        010
    );

INSERT INTO Academic
VALUES (
        111118,
        'Dr',
        'Brijesh',
        'Dongol',
        'Senior Lecturer',
        36,
        'M',
        60000.00,
        '09',
        '2233',
        'b.dongol@surrey.ac.uk',
        010
    );

INSERT INTO Academic
VALUES (
        111119,
        'Dr',
        'Yunpeng',
        'Li',
        'Lecturer',
        28,
        'M',
        45000.00,
        '14',
        '1324',
        'yunpeng.li@surrey.ac.uk',
        010
    );

INSERT INTO Academic
VALUES (
        111120,
        'Dr',
        'Zhenhua',
        'Feng',
        'Lecturer',
        32,
        'M',
        47000.00,
        '18',
        '7845',
        'z.feng@surrey.ac.uk',
        010
    );

INSERT INTO Academic
VALUES (
        111121,
        'Dr',
        'Yongxin',
        'Yang',
        'Lecturer',
        29,
        'M',
        45000.00,
        '39',
        '1324',
        'yongxin.yang@surrey.ac.uk',
        020
    );

INSERT INTO Academic
VALUES (
        111122,
        'Dr',
        'Stefan',
        'Wesemayer',
        'Teaching Fellow',
        34,
        'M',
        50000.00,
        '07',
        '3632',
        's.wesemayer@surrey.ac.uk',
        010
    );

INSERT INTO Academic
VALUES (
        111123,
        'Dr',
        'Joey',
        'Lam',
        'Teaching Fellow',
        30,
        'F',
        45000.00,
        '13',
        '3423',
        'j.lam@surrey.ac.uk',
        010
    );

INSERT INTO Academic
VALUES (
        111124,
        'Dr',
        'Mariam',
        'Cirovic',
        'Teaching Fellow',
        35,
        'F',
        40000.00,
        '13',
        '6343',
        'm.cirovic@surrey.ac.uk',
        010
    );

INSERT INTO Academic
VALUES (
        111125,
        'Dr',
        'Andrew',
        'Crossan',
        'Senior Teaching Fellow',
        40,
        'M',
        60000.00,
        '02',
        '3399',
        'a.crossan@surrey.ac.uk',
        010
    );

INSERT INTO Academic
VALUES (
        111126,
        'Prof',
        'Mark',
        'Plumbly',
        'Professor',
        55,
        'M',
        120000.00,
        '03',
        '9120',
        'm.plumbley@surrey.ac.uk',
        020
    );

INSERT INTO Academic
VALUES (
        111127,
        'Prof',
        'David',
        'Carey',
        'Professor',
        54,
        'M',
        120000.00,
        '09',
        '9768',
        'david.carey@surrey.ac.uk',
        020
    );

INSERT INTO Academic
VALUES (
        111128,
        'Prof',
        'Justin',
        'Read',
        'Professor',
        60,
        'M',
        120000.00,
        '01',
        '1234',
        'j.read@surrey.ac.uk',
        030
    );

DROP TABLE IF EXISTS Course;

CREATE TABLE
    Course (
        Crs_Code INT UNSIGNED NOT NULL,
        Crs_Title VARCHAR(255) NOT NULL,
        Crs_Enrollment INT UNSIGNED,
        Crs_Dept INT UNSIGNED NOT NULL,
        Crs_Lead INT UNSIGNED UNIQUE,
        PRIMARY KEY (Crs_code),
        FOREIGN KEY (Crs_Dept) REFERENCES Department (Dept_No) ON DELETE CASCADE,
        FOREIGN KEY (Crs_Lead) REFERENCES Academic (Acad_ID) ON DELETE RESTRICT
    );

INSERT INTO Course
VALUES (
        100,
        'BSc Computer Science',
        100,
        010,
        111125
    ), (
        101,
        'BSc Computer Information Technology',
        20,
        010,
        111122
    ), (
        200,
        'MSc Data Science',
        100,
        010,
        111113
    ), (
        201,
        'MSc Security',
        50,
        010,
        111112
    ), (
        110,
        'BEng Electronics',
        100,
        020,
        111127
    ), (
        111,
        'BEng Electrical Engineering',
        100,
        020,
        111121
    ), (
        210,
        'MSc Electrical Engineering',
        100,
        020,
        111126
    ), (
        211,
        'MSc Physics',
        100,
        020,
        111128
    );

DROP TABLE IF EXISTS Student;

CREATE TABLE
    Student (
        URN INT UNSIGNED NOT NULL,
        Stu_FName VARCHAR(255) NOT NULL,
        Stu_LName VARCHAR(255) NOT NULL,
        Stu_DOB DATE,
        Stu_Gender ENUM('M', 'F'),
        Stu_Phone VARCHAR(12),
        Stu_Course INT UNSIGNED NOT NULL,
        Stu_Type ENUM('UG', 'PG'),
        PRIMARY KEY (URN),
        FOREIGN KEY (Stu_Course) REFERENCES Course (Crs_Code) ON DELETE RESTRICT
    );

INSERT INTO Student
VALUES (
        612345,
        'John',
        'Smith',
        '2002-06-20',
        'M',
        '01483112233',
        100,
        'UG'
    ), (
        612346,
        'Pierre',
        'Gervais',
        '2002-03-12',
        'M',
        '01483223344',
        100,
        'UG'
    ), (
        612347,
        'Patrick',
        'O-Hara',
        '2001-05-03',
        'M',
        '01483334455',
        100,
        'UG'
    ), (
        612348,
        'Iyabo',
        'Ogunsola',
        '2002-04-21',
        'F',
        '01483445566',
        100,
        'UG'
    ), (
        612349,
        'Omar',
        'Sharif',
        '2001-12-29',
        'M',
        '01483778899',
        100,
        'UG'
    ), (
        612350,
        'Yunli',
        'Guo',
        '2002-06-07',
        'F',
        '01483123456',
        100,
        'UG'
    ), (
        612351,
        'Costas',
        'Spiliotis',
        '2002-07-02',
        'M',
        '01483234567',
        100,
        'UG'
    ), (
        612352,
        'Tom',
        'Jones',
        '2001-10-24',
        'M',
        '01483456789',
        101,
        'UG'
    ), (
        612353,
        'Simon',
        'Larson',
        '2002-08-23',
        'M',
        '01483998877',
        101,
        'UG'
    ), (
        612354,
        'Sue',
        'Smith',
        '2002-05-16',
        'F',
        '01483776655',
        101,
        'UG'
    );

DROP TABLE IF EXISTS Undergraduate;

CREATE TABLE
    Undergraduate (
        UG_URN INT UNSIGNED NOT NULL,
        UG_Credits INT NOT NULL,
        CHECK (60 <= UG_Credits <= 150),
        PRIMARY KEY (UG_URN),
        FOREIGN KEY (UG_URN) REFERENCES Student(URN) ON DELETE CASCADE
    );

INSERT INTO Undergraduate
VALUES (612345, 120), (612346, 90), (612347, 150), (612348, 120), (612349, 120), (612350, 60), (612351, 60), (612352, 90), (612353, 120), (612354, 90);

DROP TABLE IF EXISTS Postgraduate;

CREATE TABLE
    Postgraduate (
        PG_URN INT UNSIGNED NOT NULL,
        Thesis VARCHAR(512) NOT NULL,
        PRIMARY KEY (PG_URN),
        FOREIGN KEY (PG_URN) REFERENCES Student(URN) ON DELETE CASCADE
    );

DROP TABLE IF EXISTS Student_Email;

CREATE TABLE
    Student_Email (
        Stu_URN INT UNSIGNED NOT NULL,
        Stu_Email VARCHAR(255),
        PRIMARY KEY (Stu_URN, Stu_Email),
        FOREIGN KEY (Stu_URN) REFERENCES Student(URN) ON DELETE CASCADE
    );

INSERT INTO Student_Email
VALUES (
        612345,
        'j.smith@surrey.ac.uk'
    ), (612345, 'j.smith@gmail.com'), (
        612346,
        'p.gervais@surrey.ac.uk'
    ), (
        612347,
        'p.o-Hara@surrey.ac.uk'
    ), (
        612348,
        'i.ogunsola@surrey.ac.uk'
    ), (
        612348,
        'iyabo.ogun20@yahoo.com'
    ), (
        612349,
        'o.sharif@surrey.ac.uk'
    ), (612350, 'y.guo@surrey.ac.uk');
    
  SELECT COUNT(*) FROM Student;
