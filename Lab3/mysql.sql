DROP DATABASE IF EXISTS twitter ;
CREATE DATABASE twitter;
USE twitter;
CREATE TABLE IF NOT EXISTS users (
    name CHAR(24) NOT NULL,
    surname CHAR(24) NOT NULL,
    username CHAR(24) NOT NULL,
    gender CHAR(24) NOT NULL,
    email VARCHAR(244) NOT NULL,
    password CHAR(24) NOT NULL,
    isAdmin boolean NOT NULL,
    nickName CHAR(24),
    dateOfBirth CHAR(24),
    address VARCHAR(24),
    phoneNumber varchar(9),
    PRIMARY KEY (username),
    KEY (email)
);

CREATE TABLE IF NOT EXISTS tweets(
    id INT(10) unsigned NOT NULL AUTO_INCREMENT,
    tweet_text VARCHAR(120) NOT NULL,
    date    DATETIME  NOT NULL,
    username CHAR(24) NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY(username) REFERENCES users(username) ON DELETE CASCADE,
    KEY(date)
);

CREATE TABLE IF NOT EXISTS likeTweet(
    tweet_id INT(10) unsigned NOT NULL,
    user_username CHAR(24) NOT NULL, 
    PRIMARY KEY(tweet_id,user_username),
    foreign key(tweet_id) references tweets(id) ON DELETE CASCADE,
    foreign key(user_username) references users(username) ON DELETE CASCADE
);



CREATE TABLE IF NOT EXISTS commentTweet(
	id INT(10) unsigned NOT NULL AUTO_INCREMENT,
    tweet_id INT(10) unsigned NOT NULL,
    user_username CHAR(24) NOT NULL, 
    commentary CHAR(24) NOT NULL,
    date    DATETIME  NOT NULL,
    PRIMARY KEY(id),
    foreign key(tweet_id) references tweets(id) ON DELETE CASCADE,
    foreign key(user_username) references users(username) ON DELETE CASCADE
 
);

CREATE TABLE IF NOT EXISTS likeComment(
    comment_id INT(10) unsigned NOT NULL,
    user_username CHAR(24) NOT NULL, 
    PRIMARY KEY(comment_id,user_username),
    foreign key(comment_id) references commentTweet(id) ON DELETE CASCADE,
    foreign key(user_username) references users(username) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS follow(
    follower CHAR(24) NOT NULL,
    followed CHAR(24) NOT NULL,
    PRIMARY KEY(follower,followed),
    FOREIGN KEY(followed) REFERENCES users(username) ON DELETE CASCADE,
    FOREIGN KEY(follower) REFERENCES users(username) ON DELETE CASCADE
);

INSERT INTO users(name,surname,username,gender,email,password,isAdmin) VALUES
('Arnau','Guinart','guini','Male','guinartarnau@gmail.com','pass1',true),
('Jorge','Aleman','drako','Female','jale@gm.com','asda1@',true),
('Arnau2','Guinart2','guini2','Male','2guinartarnau@gmail.com','pass1',false),
('Jorge2','Aleman2','drako2','Female','2jale@gm.com','asda1@',false),
('Arnau3','Guinart3','guini3','Male','3guinartarnau@gmail.com','pass1',false),
('Jorge3','Aleman3','drako3','Female','3jale@gm.com','asda1@',false);

INSERT INTO tweets(tweet_text, date,username) VALUES
('first tweet of drako by db','2017-06-08','drako'),
('second tweet of guini by db','2017-06-09','guini'),
('third tweet of drako by db','2017-06-10','drako'),
('first tweet of guini by db','2017-06-08','guini'),
('second tweet of drako by db','2017-06-09','drako'),
('third tweet of guini by db','2017-06-10','guini'),
('first tweet of drako by db','2017-06-08','drako');

INSERT INTO follow VALUES ('guini','drako');
INSERT INTO follow VALUES ('drako','guini');

INSERT INTO `twitter`.`likeTweet` (`tweet_id`, `user_username`) VALUES ('2', 'drako3');



