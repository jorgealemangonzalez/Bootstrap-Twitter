DROP DATABASE ts1;
CREATE DATABASE ts1;
USE ts1;
CREATE TABLE taula (
	nom CHAR(24),
	descripcio VARCHAR(255),
	id INTEGER NOT NULL AUTO_INCREMENT,
	telefon INTEGER,
    PRIMARY KEY (id) );
    
INSERT INTO taula(nom,descripcio,telefon) VALUES
('Arnau','Student',6354984),
('Jorge','Computer Science Student',6551561),
('Marc','Web Developer',54512121),
('Steve','C++ Master',65656565),
('Paul','Teacher at Universitat Pompeu Fabra',2151145),
('Jonathan','Specialize in Forensic',8486898);


    