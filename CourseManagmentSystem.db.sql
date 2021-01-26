CREATE TABLE IF NOT EXISTS "department" (
	"department_Id"	INTEGER NOT NULL,
	"department_Name"	TEXT NOT NULL,
	PRIMARY KEY("department_Id" AUTOINCREMENT),
	UNIQUE("department_Id")
);

CREATE TABLE IF NOT EXISTS "course" (
	"Course_Id"	INTEGER NOT NULL,
	"department_Id"	INTEGER NOT NULL,
	"Course_Name"	TEXT,
	"Course_Type"	TEXT,
	FOREIGN KEY("department_Id") REFERENCES "department"("department_Id"),
	PRIMARY KEY("Course_Id" AUTOINCREMENT),
	UNIQUE("Course_Id")
);

CREATE TABLE IF NOT EXISTS "student" (
	"student_Id"	INTEGER NOT NULL,
	"student_Name"	INTEGER NOT NULL,
	"Course_Id"	INTEGER ,
	FOREIGN KEY("Course_Id") REFERENCES "course"("Course_Id"),
	PRIMARY KEY("student_Id" AUTOINCREMENT),
	UNIQUE("student_Id")
);

CREATE TABLE IF NOT EXISTS "Module" (
	"Module_Id"	INTEGER NOT NULL,
	"Module_Name"	TEXT NOT NULL,
	"Course_Id"	INTEGER NOT NULL,
	FOREIGN KEY("Course_Id") REFERENCES "Course"("Course_Id"),
	PRIMARY KEY("Module_Id" AUTOINCREMENT),
	UNIQUE("Module_Id")
);

CREATE TABLE IF NOT EXISTS "Course_Module" (
	"Course_Module_Id"	INTEGER NOT NULL,
	"Course_Id"	INTEGER NOT NULL,
	"Module_Id"	INTEGER NOT NULL,
	FOREIGN KEY("Course_Id") REFERENCES "Course"("Course_Id"),
	PRIMARY KEY("Module_Id" AUTOINCREMENT),
	UNIQUE("Module_Id")
);

CREATE TABLE IF NOT EXISTS "Exam" (
	"Exam_Id"	INTEGER NOT NULL,
	"student_Id"	INTEGER NOT NULL,
	"Course_Module_Id"	INTEGER NOT NULL,
	"Total_Marks"	NUMERIC NOT NULL,
	"Date"	TEXT NOT NULL,
	FOREIGN KEY("student_Id") REFERENCES "student"("student_Id"),
	FOREIGN KEY("Course_Module_Id") REFERENCES "Course_Module"("Course_Module_Id"),
	PRIMARY KEY("Exam_Id" AUTOINCREMENT),
	UNIQUE("Exam_Id")
);

