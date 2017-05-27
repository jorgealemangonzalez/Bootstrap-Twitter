DROP DATABASE IF EXISTS login ;
CREATE DATABASE login;
USE login;
CREATE TABLE taula (
    name CHAR(24) NOT NULL,
    surname CHAR(24) NOT NULL,
    username CHAR(24) NOT NULL,
    gender CHAR(24) NOT NULL,
    email VARCHAR(244) NOT NULL,
    password CHAR(24) NOT NULL,
    nickName CHAR(24),
    dateOfBirth CHAR(24),
    address VARCHAR(24),
    phoneNumber varchar(9),
    PRIMARY KEY (username),
    KEY (email)
);

INSERT INTO taula(name,surname,username,gender,email,password) VALUES
('Arnau','Guinart','guini','Male','guinartarnau@gmail.com','pass1');
    
