DROP DATABASE IF EXISTS login ;
CREATE DATABASE login;
USE login;
CREATE TABLE IF NOT EXISTS users (
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

CREATE TABLE IF NOT EXISTS tweets(
    tweet_id INT(4) unsigned NOT NULL,
    tweet_text VARCHAR(120) NOT NULL,
    date    VARCHAR(24)  NOT NULL,
    username CHAR(24) NOT NULL,
    profile_image VARCHAR(120) DEFAULT NULL,
    PRIMARY KEY(tweet_id),
    KEY(username),
    KEY(date)
);

CREATE TABLE IF NOT EXISTS follow(
    follower CHAR(24) NOT NULL,
    followed CHAR(24) NOT NULL,
    PRIMARY KEY(follower,followed),
    KEY(followed,follower)
);

INSERT INTO users(name,surname,username,gender,email,password) VALUES
('Arnau','Guinart','guini','Male','guinartarnau@gmail.com','pass1'),
('Jorge','Aleman','drako','Female','jale@gm.com','asda1@');

INSERT INTO follow VALUES ('guini','drako');

INSERT INTO tweets VALUES
('1','first tweet of guini by db','09/06/2017','guini',NULL),
('2','first tweet of drako by db','09/06/2017','drako',NULL);