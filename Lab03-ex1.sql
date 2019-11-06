DROP TABLE IF EXISTS Professor;
DROP TABLE IF EXISTS Project;
DROP TABLE IF EXISTS Graduate;
DROP TABLE IF EXISTS Dept;
DROP TABLE IF EXISTS work_in;
DROP TABLE IF EXISTS work_dept;
DROP TABLE IF EXISTS work_proj;
DROP TABLE IF EXISTS advise;

--This is format of comment
CREATE TABLE Professor(
	ssn CHAR(11) NOT NULL,
	name CHAR(30) NOT NULL,
	age INTEGER,
	rank CHAR(30) NOT NULL,
	specialty CHAR(30) NOT NULL,
	--=====================
	PRIMARY KEY(ssn),
	);

CREATE TABLE Dept(
	dno CHAR(11) NOT NULL,
	dname CHAR(30) NOT NULL,
	office CHAR(30) NOT NULL,
	--====================
	runs CHAR(11) NOT NULL,
	PRIMARY KEY(dno),
	FOREIGN KEY(runs) REFERENCES Professor(ssn),
	);

CREATE TABLE Project(
	pno CHAR(11) NOT NULL,
	sponsor CHAR(30) NOT NULL,
	start_date DATE NOT NULL,
	end_date DATE NOT NULL,
	budget INTEGER,
	--====================
	manage CHAR(30),
	PRIMARY KEY(pno), 
	FOREIGN KEY(manage) REFEREMCES Professor(ssn),
);

CREATE TABLE Graduate(
	SSN CHAR(11) NOT NULL,
	name CHAR(30) NOT NULL,
	age INTEGER,
	deg_pg CHAR(30) NOT NULL,
	--===================
	major CHAR(30),
	PRIMARY KEY(SSN),
	FOREIGN KEY(major) REFEREMCES Dept(dno); 
);

CREATE TABLE work_in(
	ssn CHAR(11) NOT NULL,
	pno CHAR(11) NOT NULL,
	PRIMARY KEY(ssn, pno),
	FOREIGN KEY(ssn) REFERENCES Professor(ssn),
	FOREIGN KEY(pno) REFERENCES Project(pno),
);

CREATE TABLE work_dept(
	ssn CHAR(11) NOT NULL,
	dno CHAR(11) NOT NULL,
	time_pc INTEGER,
	PRIMARY KEY(ssn, dno),
	FOREIGN KEY(ssn) REFERENCES Professor(ssn),
	FOREIGN KEY(dno) REFERENCES Dept(dno),
);

CREATE TABLE work_proj(
	pno CHAR(11) NOT NULL,
	SSN CHAR(11) NOT NULL,
	since DATE,
	--===================
	supervise CHAR(30),
	PRIMARY KEY(pno, SSN),
	FOREIGN KEY(pno) REFERENCES Project(pno),
	FOREIGN KEY(SSN) REFERENCES Graduate(SSN),
	FOREIGN KEY(supervise) REFERENCES Professor(ssn),
);

CREATE TABLE advsie(
	grad CHAR(30) NOT NULL, 
	senior CHAR(30) NOT NULL,
	PRIMARY KEY(grad),
	FOREIGN KEY(grad) REFERENCES Graduate(SSN),
	FOREIGN KEY(senior) REFERENCES Graduate(SSN),
);

--====================================================
