DROP TABLE IF EXISTS Place CASCADE;
DROP TABLE IF EXISTS Telephone CASCADE;
DROP TABLE IF EXISTS Musicians CASCADE;
DROP TABLE IF EXISTS INSTRUMENT CASCADE;
DROP TABLE IF EXISTS Album CASCADE;
DROP TABLE IF EXISTS Songs CASCADE;
DROP TABLE IF EXISTS Plays CASCADE;
DROP TABLE IF EXISTS Perform CASCADE;

CREATE TABLE Place(
        address CHAR(30) NOT NULL,
        PRIMARY KEY(address),
);

CREATE TABLE Telephone(
        phone_no INTEGER,
        address CHAR(30),
        PRIMARY KEY(phone_no),
        FOREIGN KEY(address) REFERENCES Place(address),
);

CREATE TABLE Musicains(
	ssn CHAR(11) NOT NULL,
	name CHAR(30) NOT NULL,
	--=========================
	--Lives CHAR(30),
	address CHAR(30) NOT NULL,
	PRIMARY KEY(ssn),
	FOREIGN KEY(address) REFERENCES Place(address),
);

CREATE TABLE Instrument(
	instrid INTEGER,
	dname CHAR(30),
	key CHAR(30),
	PRIMARY KEY(instrid),
);

CREATE TABLE Album(
	albumidentifier CHAR(30) NOT NULL,
	copyrightDate DATE,
	speed CHAR(30) NOT NULL,
	title CHAR(30) NOT NULL,
	--=====================
	Producer CHAR(30) NOT NULL,
	ssn CHAR(11),
	PRIMARY KEY(albumidentifier) 
 	FOREIGN KEY(Producer) REFERENCES Musicians(ssn),
);

CREATE TABLE Songs(
	songid CHAR(30) NOT NULL,
	author CHAR(30) NOT NULL,
	title CHAR(30) NOT NULL,
	--===================
	albumidentifier CHAR(30),
	Appears CHAR(30),
	PRIMARY KEY(songid),
	FOREIGN KEY(Appears) REFERENCES Album(albumidentifier),
);

CREATE TABLE Plays(
	instrid INTEGER,
	ssn CHAR(11),
	PRIMARY KEY(ssn, instrid),
	FOREIGN KEY(ssn) REFERENCES Musicians(ssn),
	FOREIGN KEY(instrid) REFERENCES Instrument(instrid),
);

CREATE TABLE Perform(
	songid CHAR(30),
	ssn CHAR(11),
	PRIMARY(songid, ssn),
	FOREIGN KEY(ssn) REFERENCES Musicians(ssn),
	FOREIGN KEY(songid) REFERENCES Songs(songid),
);
