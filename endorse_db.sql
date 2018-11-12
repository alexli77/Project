DROP TABLE IF EXISTS `endorse_contract`;
DROP TABLE IF EXISTS `brandid_athleteid`;
DROP TABLE IF EXISTS `endorse_athlete`;
DROP TABLE IF EXISTS `endorse_brand`;
DROP TABLE IF EXISTS `endorse_sport`;
DROP TABLE IF EXISTS `endorse_country`;

CREATE TABLE `endorse_brand` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`bname` varchar(20) NOT NULL,
	`ceo` varchar(20) NOT NULL,
	`foundyear` int(11) NOT NULL,
	PRIMARY KEY(`id`)
) ENGINE=InnoDB;

CREATE TABLE `endorse_sport` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`sname` varchar(20) NOT NULL,
	PRIMARY KEY(`id`)
) ENGINE=InnoDB;

CREATE TABLE `endorse_country` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`cname` varchar(20) NOT NULL,
	PRIMARY KEY(`id`)
) ENGINE=InnoDB;

CREATE TABLE `endorse_athlete` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`fname` varchar(20) NOT NULL,
	`lname` varchar(20) NOT NULL,
	`gender` varchar(1) NOT NULL,
	`countryid` int(11) NOT NULL,
	`sportid` int(11) NOT NULL,
	PRIMARY KEY(`id`),
	KEY `countryid`(`countryid`),
	KEY `sportid`(`sportid`),
	CONSTRAINT `fk_endorse_athlete1` FOREIGN KEY(`countryid`) REFERENCES `endorse_country`(`id`) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT `fk_endorse_athlete2` FOREIGN KEY(`sportid`) REFERENCES `endorse_sport`(`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE `brandid_athleteid` (
	`brandid` int(11) NOT NULL,
	`athleteid` int(11) NOT NULL,
	PRIMARY KEY(`brandid`, `athleteid`),
	CONSTRAINT `fk_has1` FOREIGN KEY(`brandid`) REFERENCES `endorse_brand`(`id`) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT `fk_has2` FOREIGN KEY(`athleteid`) REFERENCES `endorse_athlete`(`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB; 

CREATE TABLE `endorse_contract` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`total` tinyint NOT NULL,
	`length` tinyint NOT NULL,
	`yearly` tinyint NOT NULL,
	`athleteid` int(11) NOT NULL,
	PRIMARY KEY(`id`),
	KEY `athleteid`(`athleteid`),
	CONSTRAINT `fk_endorse_contract` FOREIGN KEY(`athleteid`) REFERENCES `endorse_athlete`(`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;

INSERT INTO `endorse_brand` (`bname`, `ceo`, `foundyear`) VALUES ('Adidas', 'Kasper Rorsted', 1949), ('Nike', 'Mark Parker', 1964), ('Under Armour', 'Kevin Plank', 1996), ('Uniqlo', 'Tadashi Yanai', 1949), ('Li-Ning', 'Li Ning', 1990), ('Asics', 'Kiyomi Wada', 1949);
INSERT INTO `endorse_sport` (`sname`) VALUES ('football'), ('basketball'), ('tennis'), ('soccer'), ('golf');  	
INSERT INTO `endorse_country` (`cname`)  VALUES ('United States'), ('Portugal'), ('Switzerland'), ('Serbia'), ('Japan'), ('Argentina');
INSERT INTO `endorse_athlete`(`fname`, `lname`, `gender`, `sportid`, `countryid`)  VALUES ( 'James', 'Harden', 'M', 2, 1), ('Odell', 'Beckham Jr.', 'M', 1, 1), ('Derrick', 'Rose', 'M', 2, 1);
INSERT INTO `brandid_athleteid` (`brandid`, `athleteid`) VALUES (1, 1), (2, 2), (1, 3);
INSERT INTO `endorse_contract` (`total`, `length`, `yearly`, `athleteid`) VALUES (100, 4, 25, 1), (60, 3, 20, 2), (18, 1, 18, 3);
