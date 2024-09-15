create database podcast;
use podcast;

CREATE TABLE `user_type` (
  `type_id` int NOT NULL,
  `type_desc` varchar(100) NOT NULL,
  PRIMARY KEY (`type_id`)
);

CREATE TABLE `users` (
  `User_id` int NOT NULL,
  `Username` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `regdate` varchar(45) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `loginstatus` int NOT NULL,
  `user_type` int NOT NULL,
  PRIMARY KEY (`User_id`),
  KEY `user_types_idx` (`user_type`),
  CONSTRAINT `user_types` FOREIGN KEY (`user_type`) REFERENCES `user_type` (`type_id`)
);

CREATE TABLE `admin` (
  `Admin_id` int NOT NULL,
  `Admin_name` varchar(100) NOT NULL,
  PRIMARY KEY (`Admin_id`),
  KEY `user_admin_idx` (`Admin_id`),
  CONSTRAINT `Admin_users` FOREIGN KEY (`Admin_id`) REFERENCES `users` (`User_id`)
);

CREATE TABLE `categories` (
  `cat_id` int NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(100) NOT NULL,
  PRIMARY KEY (`cat_id`)
);

CREATE TABLE `nationality` (
  `nat_id` int NOT NULL AUTO_INCREMENT,
  `nat_name` varchar(100) NOT NULL,
  PRIMARY KEY (`nat_id`)
);

CREATE TABLE `end_user` (
  `name` varchar(100) NOT NULL,
  `address` varchar(100) DEFAULT NULL,
  `DOB` varchar(45) DEFAULT NULL,
  `POB` varchar(100) DEFAULT NULL,
  `Gender` char(1) DEFAULT NULL,
  `Nat_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`user_id`),
  KEY `users_end_idx` (`user_id`),
  KEY `nat_user_idx` (`Nat_id`),
  CONSTRAINT `nat_user` FOREIGN KEY (`Nat_id`) REFERENCES `nationality` (`nat_id`),
  CONSTRAINT `user_Users` FOREIGN KEY (`user_id`) REFERENCES `users` (`User_id`)
) ;

CREATE TABLE `playlist` (
  `PL_id` int NOT NULL,
  `PL_name` varchar(100) NOT NULL,
  `isdeleted` int NOT NULL DEFAULT '0',
  `cat_id` int NOT NULL,
  `creation_date` varchar(45) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`PL_id`,`user_id`),
  KEY `pl_cat_idx` (`cat_id`),
  KEY `pl_users_idx` (`user_id`),
  CONSTRAINT `pl_cat` FOREIGN KEY (`cat_id`) REFERENCES `categories` (`cat_id`),
  CONSTRAINT `pl_users` FOREIGN KEY (`user_id`) REFERENCES `end_user` (`user_id`)
);

CREATE TABLE `randomqas` (
  `episodesno` int NOT NULL,
  `podcastprogramno` int DEFAULT NULL,
  `chooseintrest` varchar(100) DEFAULT NULL,
  `listenORwatch` varchar(100) DEFAULT NULL,
  `nonArabic` varchar(100) DEFAULT NULL,
  `User_id` int NOT NULL,
  PRIMARY KEY (`User_id`),
  KEY `user_id_QAs_idx` (`User_id`),
  CONSTRAINT `user_id_QAs` FOREIGN KEY (`User_id`) REFERENCES `end_user` (`user_id`)
);

CREATE TABLE `sound` (
  `PodcastType` int NOT NULL,
  `Url_id` varchar(300) DEFAULT NULL,
  `rate` int DEFAULT NULL,
  `albumName` varchar(100) DEFAULT NULL,
  `singer` varchar(100) DEFAULT NULL,
  `PodcastName` varchar(100) DEFAULT NULL,
  `sound_id` int NOT NULL,
  `Hoster` varchar(100) DEFAULT NULL,
  `PodcastEpisodes` int DEFAULT NULL,
  `episodeTitle` varchar(100) DEFAULT NULL,
  `publishdate` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`sound_id`),
  KEY `soundcat_idx` (`PodcastType`),
  CONSTRAINT `soundcat` FOREIGN KEY (`PodcastType`) REFERENCES `categories` (`cat_id`)
);

CREATE TABLE `playlist_sound` (
  `PL_id` int NOT NULL,
  `sound_id` int NOT NULL,
  `insert_date` varchar(45) NOT NULL,
  `isdeleted` int DEFAULT '0',
  `Rate` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`PL_id`,`sound_id`,`user_id`),
  KEY `pl_sound_idx` (`PL_id`),
  KEY `sound_pl_idx` (`sound_id`),
  KEY `user_plylst_idx` (`user_id`),
  CONSTRAINT `pl_sound` FOREIGN KEY (`PL_id`) REFERENCES `playlist` (`PL_id`),
  CONSTRAINT `sound_pl` FOREIGN KEY (`sound_id`) REFERENCES `sound` (`sound_id`),
  CONSTRAINT `user_plylst` FOREIGN KEY (`user_id`) REFERENCES `users` (`User_id`)
);

INSERT INTO `user_type` VALUES (1,'admin'),(2,'user');

INSERT INTO `users` VALUES 
(1,'shatha','123','1/1/2024','0096765','shataa@gmail.com',0,1),
(2,'lojain','876','6/1/2022','0096530','Loj2@gmail.com',0,1),
(3,'Noura','789','18/3/2022','0096653','noura112@gmail.com',0,2),
(4,'shahad','479','28/5/2022','0096007','Shahad21@gmail.com',0,2),
(5,'Amal','983','10/7/2023','0096987','Amal.5@gmail.com',0,2),
(6,'Reema','783','8/3/2024','0096955','Reema45@gmail.com',0,2),
(7,'Rahaf','003','2/1/2022','0096667','Rahaff22@gmail.com',0,2), 
(8,'Reem', '1111','23/4/2023','0096674', 'reem@gmail.com',0,2),
(9,'Shikah', '1260','2/8/2023','009694', 'Shikah@gmail.com',0,2),
(10,'jumanah', '1911','2/4/2021','0096008','jojo984@gmail.com',0,2),
(11,'sondos', '9484','5/3/2023','0096986', 'soso998@gmail.com',0,2),
(12,'rfeef', '23500','20/11/2022','0096238', 'fofo34@gmail.com',0,2),
(13,'jood', '2311','24/12/2022','0096932', 'jood334@gmail.com',0,2),
(14,'Laila', '6841','11/1/2021','0096655', 'laila32@gmail.com',0,2),
(15,'Reemas', '5511','7/6/2022','00966986', 'Reemas@gmail.com',0,2);

INSERT INTO `nationality` VALUES (1,'Saudi Arabia'),(2,'United Arab Emirates'),(3,'Jordan'),(4,'Qater'),
(5,'Palestine'),(6,'Afghanistan'),(7,'Angola'),(8,'Anguilla'),(9,'Albania'),(10,'Andorra'),
(11,'Netherlands Antilles'),(12,'Argentina'),(13,'Armenia'),(14,'American Samoa'),(15,'Antarctica'),
(16,'French Southern territories'),(17,'Antigua and Barbuda'),(18,'Australia'),(19,'Austria'),(20,'Azerbaijan'),
(21,'Burundi'),(22,'Belgium'),(23,'Benin'),(24,'Burkina Faso'),(25,'Bangladesh'),(26,'Bulgaria'),(27,'Bahrain'),
(28,'Zimbabwe'),(29,'Bahamas'),(30,'Bosnia and Herzegovina'),(31,'Belarus'),(32,'Belize'),(33,'Bermuda'),(34,'Bolivia'),
(35,'Brazil'),(36,'Barbados'),(37,'Brunei'),(38,'Bhutan'),(39,'Bouvet Island'),(40,'Botswana'),(41,'Central African Republic'),
(42,'Canada'),(43,'Cocos (Keeling) Islands'),(44,'Switzerland'),(45,'Chile'),(46,'China'),(47,'Zambia'),(48,'Cameroon'),
(49,'Congo, The Democratic Republic of the'),(50,'Congo'),(51,'Cook Islands'),(52,'Colombia'),(53,'Comoros'),
(54,'Cape Verde'),(55,'Costa Rica'),(56,'Cuba'),(57,'Christmas Island'),(58,'Cayman Islands'),(59,'Cyprus'),(60,'Czech Republic'),
(61,'Germany'),(62,'Djibouti'),(63,'Dominica'),(64,'Denmark'),(65,'Dominican Republic'),(66,'Algeria'),(67,'Ecuador'),(68,'Egypt'),
(69,'Eritrea'),(70,'Western Sahara'),(71,'Spain'),(72,'Estonia'),(73,'Ethiopia'),(74,'Finland'),(75,'Fiji Islands'),
(76,'Falkland Islands'),(77,'France'),(78,'Faroe Islands'),(79,'Micronesia, Federated States of'),(80,'Gabon'),(81,'United Kingdom'),
(82,'Georgia'),(83,'Ghana'),(84,'Gibraltar'),(85,'Guinea'),(86,'Guadeloupe'),(87,'Gambia'),(88,'Guinea-Bissau'),(89,'Equatorial Guinea'),
(90,'Greece'),(91,'Grenada'),(92,'Greenland'),(93,'Guatemala'),(94,'French Guiana'),(95,'Guam'),(96,'Guyana'),(97,'Hong Kong'),
(98,'Heard Island and McDonald Islands'),(99,'Honduras'),(100,'Croatia'),(101,'Haiti'),(102,'Hungary'),(103,'Indonesia'),(104,'India'),
(105,'British Indian Ocean Territory'),(106,'Ireland'),(107,'Iran'),(108,'Iraq'),(109,'Iceland'),(110,'Israel'),(111,'Italy'),
(112,'Jamaica'),(114,'Japan'),(115,'Kazakstan'),(116,'Kenya'),(117,'Kyrgyzstan'),(118,'Cambodia'),(119,'Kiribati'),
(120,'Saint Kitts and Nevis'),(121,'South Korea'),(122,'Kuwait'),(123,'Laos'),(124,'Lebanon'),(125,'Liberia'),
(126,'Libyan Arab Jamahiriya'),(127,'Saint Lucia'),(128,'Liechtenstein'),(129,'Sri Lanka'),(130,'Lesotho'),(131,'Lithuania'),
(132,'Luxembourg'),(133,'Latvia'),(134,'Macao'),(135,'Morocco'),(136,'Monaco'),(137,'Moldova'),(138,'Madagascar'),(139,'Maldives'),
(140,'Mexico'),(141,'Marshall Islands'),(142,'Macedonia'),(143,'Mali'),(144,'Malta'),(145,'Myanmar'),(146,'Mongolia'),
(147,'Northern Mariana Islands'),(148,'Mozambique'),(149,'Mauritania'),(150,'Montserrat'),(151,'Martinique'),(152,'Mauritius'),
(153,'Malawi'),(154,'Malaysia'),(155,'Mayotte'),(156,'Namibia'),(157,'New Caledonia'),(158,'Niger'),(159,'Norfolk Island'),
(160,'Nigeria'),(161,'Nicaragua'),(162,'Niue'),(163,'Netherlands'),(164,'Norway'),(165,'Nepal'),(166,'Nauru'),(167,'New Zealand'),
(168,'Oman'),(169,'Pakistan'),(170,'Panama'),(171,'Pitcairn'),(172,'Peru'),(173,'Philippines'),(174,'Palau'),(175,'Papua New Guinea'),
(176,'Poland'),(177,'Puerto Rico'),(178,'North Korea'),(179,'Portugal'),(180,'Paraguay'),(181,'Aruba'),(182,'French Polynesia'),
(183,'Yemen'),(184,'Yugoslavia'),(185,'South Africa'),(186,'Russian Federation'),(187,'Rwanda'),(189,'Sudan'),(190,'Senegal'),
(191,'Singapore'),(192,'South Georgia and the South Sandwich Islands'),(193,'Saint Helena'),(194,'Svalbard and Jan Mayen'),
(195,'Solomon Islands'),(196,'Sierra Leone'),(197,'El Salvador'),(198,'San Marino'),(199,'Somalia'),(200,'Saint Pierre and Miquelon'),
(201,'Sao Tome and Principe'),(202,'Suriname'),(203,'Slovakia'),(204,'Slovenia'),(205,'Sweden'),(206,'Swaziland'),(207,'Seychelles'),
(208,'Syria'),(209,'Turks and Caicos Islands'),(210,'Chad'),(211,'Togo'),(212,'Thailand'),(213,'Tajikistan'),(214,'Tokelau'),
(215,'Turkmenistan'),(216,'East Timor'),(217,'Tonga'),(218,'Trinidad and Tobago'),(219,'Tunisia'),(220,'Turkey'),(221,'Tuvalu'),
(222,'Taiwan'),(223,'Tanzania'),(224,'Uganda'),(225,'Ukraine'),(226,'United States Minor Outlying Islands'),(227,'Uruguay'),
(228,'United States'),(229,'Uzbekistan'),(230,'Holy See (Vatican City State)'),(231,'Saint Vincent and the Grenadines'),
(232,'Venezuela'),(233,'Virgin Islands, British'),(234,'Virgin Islands, U.S.'),(235,'Vietnam'),(236,'Vanuatu'),
(237,'Wallis and Futuna'),(238,'Samoa'),(244,'Rawanda');

INSERT INTO `end_user` VALUES 
('Noura','Saudi Arabia','18/03/2003','Khobar','F',1,3),
('shahad','Kuwait','28/05/2003','Al Jahra','F',20,4),
('Amal','Saudi Arabia','10/07/2003','Dhahran','F',1,5),
('Rahaf','UAE','01/11/1998','Dubai','F',2,7),
('Reema','Qatar','01/04/1996','Doha','F',3,6),
('Reem','Saudi Arabia','02/08/1999','Riyad','F',1,8),
('Shikah','Jordan','22/11/1990','beirut','F',5,9),
('jumanah','Kuwait','01/04/1996','Ali sabah alsalem','F',20,10),
('sondos','Qatar','13/9/2004','alrayan','F',3,11),
('rfeef','UAE','24/10/1994','abu dhabi','F',2,12),
('jood','Armenia','14/01/2006','yerevan','F',13,13),
('Laila','Austria','24/8/1999','vienna','F',19,14),
('Reemas','Australia','14/06/2000','canberra','F',18,15);

INSERT INTO `randomqas` VALUES 
(3,8,'food','watch','yes',3),
(4,4,'comedy','listen','No',4),
(5,5,'Comedy','listen','yes',5),
(2,3,'Stories','listen','No',6),
(2,9,'Stories','listen','yes',7),
(7,20,'song','listen','yes',10),
(8,9,'Educational','watch','yes',15),
(1,5,'History','listen','yes',9),
(10,10,'Food','watch','yes',8),
(3,9,'Comedy','listen','no',11),
(1,1,'movie','watch','no',12),
(2,8,'Stories','listen','yes',13),
(5,7,'Self improvement','listen','yes',14);

INSERT INTO `admin` VALUES 
(1,'shatha ahmed'),
(2,'lojain');

INSERT INTO `categories` VALUES 
(1,'song'),
(2,'movie'),
(3,'Story'),
(4,'Educational'),
(5,'Food'),
(6,'History'),
(7,'Comedy'),
(8, 'Self improvement');

INSERT INTO `playlist` VALUES
(1001, 'Sh-list' , 0 , 2 ,  '2023-07-02' , 4 ),
(2001, 'AmalList' , 0 , 1 , '2023-02-12', 5 ),
(6001, 'NNN' , 0 , 3, '2023-03-18',  3 ),
(4001, 'Therapy', 0 ,  2 , '2023-10-09' , 7 ),
(5001, 'RList' ,  0 ,  3, '2023-01-01' , 6 ),
(7001, 'improvementlist' ,  0 ,  8, '2023-07-06' , 6 ),
(9001,'ShList', 0 , 1  , '2023-06-28',4),
(1011,'ShStories',0, 3 ,'2023-07-01',4),
(3001,'ReemList',0, 4 ,'2023-07-02 ',8),
(8001, 'ShikahL', 0, 6, '2023-07-03', 9),
(10001, 'JojoList', 0 , 7, '2023-07-04',10),
(2004, 'S-List', 0 , 4 , '2023-03-02', 11),
(1009, 'JoodList', 0 , 3 , '2022-04-24', 13),
(3002, 'RafeefList', 0 , 3 , '2020-04-12', 12),
(4005, 'Laila-List', 0 , 5 , '2022-03-18', 14);

INSERT INTO `sound` VALUES
(3, 'https://podcasts.apple.com/sa/podcast/%D9%85%D9%86-%D9%88%D9%82%D8%AA-%D8%A7%D9%84%D9%89-%D8%A7%D8%AE%D8%B1-%D9%85%D8%B9-%D9%85%D9%86%D8%A8%D8%AA/id1535591764?i=1000649193179', 3.5, null, null,'Manbet', 1116, 'Sowt', 123, 'S6 E10', '21-03-2024'),
(3, 'https://podcasts.apple.com/sa/podcast/%D9%85%D9%86-%D9%88%D9%82%D8%AA-%D8%A7%D9%84%D9%89-%D8%A7%D8%AE%D8%B1-%D9%85%D8%B9-%D9%85%D9%86%D8%A8%D8%AA/id1535591764?i=1000647635683', 4.0, null, null, 'Manbet', 1103, 'Sowt', 123, 'S6 E8', '07-03-2024'),
(3, 'https://podcasts.apple.com/sa/podcast/%D9%85%D9%86-%D9%88%D9%82%D8%AA-%D8%A7%D9%84%D9%89-%D8%A7%D8%AE%D8%B1-%D9%85%D8%B9-%D9%85%D9%86%D8%A8%D8%AA/id1535591764?i=1000620482290', 4.2, null, null, 'Manbet', 1117,'Sowt', 123, 'S5 E8', '10-07-2024'),
(3, 'https://podcasts.apple.com/sa/podcast/%D9%85%D9%86-%D9%88%D9%82%D8%AA-%D8%A7%D9%84%D9%89-%D8%A7%D8%AE%D8%B1-%D9%85%D8%B9-%D9%85%D9%86%D8%A8%D8%AA/id1535591764?i=1000571220835', 3.9, null, null , 'Manbet', 1111,'Sowt',123, 'S4 E11', '26-07-2022'),
(3, 'https://podcasts.apple.com/sa/podcast/%D9%85%D9%86-%D9%88%D9%82%D8%AA-%D8%A7%D9%84%D9%89-%D8%A7%D8%AE%D8%B1-%D9%85%D8%B9-%D9%85%D9%86%D8%A8%D8%AA/id1535591764?i=1000567247729', 4.8, null, null, 'Manbet', 1101,'Sowt', 123, 'S4 E9', '21-06-2022'),
(5, 'https://podcasts.apple.com/sa/podcast/foodcast/id1717311912?i=1000644925765', 3.6, null, null, 'FoodCast', 1119, 'Amer Sherif', 20, 'FoodCast13', '11-02-2024'),
(5, 'https://podcasts.apple.com/sa/podcast/foodcast/id1717311912?i=1000643254337', 4.1, null, null, 'FoodCast',1120 , 'Amer Sherif', 20, 'FoodCast11', '28-01-2024'),
(5, 'https://podcasts.apple.com/sa/podcast/foodcast/id1717311912?i=1000641589995', 4.5, null, null, 'FoodCast',  1102, 'Amer Sherif', 20, 'FoodCast9', '14-01-2024'),
(5, 'https://podcasts.apple.com/sa/podcast/foodcast/id1717311912?i=1000638433658', 3.0, null, null, 'FoodCast',  1106, 'Amer Sherif', 20, 'FoodCast12', '04-02-2024'),
(5, 'https://podcasts.apple.com/sa/podcast/foodcast/id1717311912?i=1000636825187', 3.7, null, null, 'FoodCast', 1107, 'Amer Sherif', 20, 'FoodCast8', '07-01-2024'),
(7, 'https://podcasts.apple.com/us/podcast/kristen-stewart/id1521578868?i=1000649351541', 4.7, null, null,'Smartless',  1112, 'JasonBateman&SeanHayes&WillArnett', 20, 'Kirsten Stewart', '01-04-2024'),
(7, 'https://podcasts.apple.com/us/podcast/jake-gyllenhaal/id1521578868?i=1000649123947', 4.7, null, null, 'Smartless', 1113, 'JasonBateman&SeanHayes&WillArnett', 20, 'Jake Gyllenhaal', '25-03-2024'),
(7, 'https://podcasts.apple.com/us/podcast/smartless/id1521578868?i=1000648403143', 4.7, null, null, 'Smartless',  1114, 'JasonBateman&SeanHayes&WillArnett', 20, 'John Oliver', '18-03-2024'),
(7, 'https://podcasts.apple.com/us/podcast/smartless/id1521578868?i=1000647724458', 4.7, null, null, 'Smartless', 1115, 'JasonBateman&SeanHayes&WillArnett', 20, 'Amy Schumer', '11-03-2024'),
(7, 'https://podcasts.apple.com/us/podcast/smartless/id1521578868?i=1000646719815', 4.7,null, null,  'Smartless', 1123, 'JasonBateman&SeanHayes&WillArnett', 20, 'Josh Brolin', '04-03-2024'),
(7, 'https://podcasts.apple.com/sa/podcast/27-%D8%A7%D8%B3%D8%AA%D8%B9%D8%B7%D8%A7%D9%81-', 4.4, null, null, 'YsierKheir', 1124, 'AbdullahAlhussain', 10, '#27', '20-03-2024'),
(7, 'https://podcasts.apple.com/sa/podcast/23-%D9%85%D8%AA%D9%81%D9%87%D9%85-', 4.6,null, null,  'YsierKheir', 1125, 'AbdullahAlhussain', 10, '#23', '14-02-2024'),
(3, 'https://podcasts.apple.com/sa/podcast/%D8%AC%D9%8A%D8%A9/id1529103794?i=100059', 4.6, null, null ,'Jinaya', 1126,  'MohamedAlbeez', 30, 'Wahsh al daherh', '29-05-2023'),
(3, 'https://podcasts.apple.com/sa/podcast/%D8%AC%D9%8A%D8%A9/id1529103794?i=1000623932260', 4.0, null, null, 'Jinaya', 1110,'MohamedAlbeez', 30, 'Khatem sulaiman', '22-05-2023'),
(3, 'https://podcasts.apple.com/sa/podcast/%D8%AC%D9%8A%D8%A9/id1529103794?i=1000623932260', 4.0, null, null, 'Jinaya',1109,'MohamedAlbeez', 30, 'Haqibah al ahlam', '10-04-2023'),
(3, 'https://podcasts.apple.com/sa/podcast/%D8%AC%D9%8A%D8%A9/id1529103794?i=1000623932260', 4.0, null, null, 'Jinaya', 1108,'MohamedAlbeez', 30, 'Manzl mubark', '27-03-2023'),    
(8,'https://podcasts.apple.com/us/podcast/how-to-be-self-aware/id1587046024?i=1000537524820' ,4.6, null , Null ,'How to keep time'  ,1127,'The Atlantic' ,7,'How to be self-aware', '05-10-2021'),
(8,'https://podcasts.apple.com/us/podcast/how-to-know-youre-lonely/id1587046024?i=1000538350763' ,3.6, null ,Null,'How to keep time',1128, 'The Atlantic',7, 'How to know you are lonely', '12-10-2021'),
(8,'https://podcasts.apple.com/us/podcast/how-not-to-be-your-own-worst-enemy/id1587046024?i=1000539054449'  ,4.5, null ,Null,'How to keep time',1129, 'The Atlantic',7, 'How not to be your worst enemy', '19-10-2021'),
(8,' https://podcasts.apple.com/us/podcast/how-to-know-that-you-know-nothing/id1587046024?i=1000539760495' ,4.9,null ,Null,'How to keep time',1130, 'The Atlantic',7, 'How to know that you know nothing' , '26-10-2021'),
(8,' https://podcasts.apple.com/us/podcast/how-to-find-the-secret-to-meaningful-work/id1587046024?i=1000540502958'  ,4.8, null ,Null,'How to keep time',1131, 'The Atlantic',7, 'How to find the secret to meaningful work', '02-11-2021'),
(8,' https://podcasts.apple.com/us/podcast/how-to-live-when-youre-in-pain/id1587046024?i=1000541225374 ' ,4.6,null ,Null,'How to keep time',1132, 'The Atlantic',7, 'How too live  when you are in pain' , '09-11-2021'),
(8,' https://podcasts.apple.com/us/podcast/how-to-identify-what-you-enjoy/id1587046024?i=1000542856535' ,5.0, null ,Null ,'How to keep time',1133, 'The Atlantic',7, 'How to identify what you enjoy', '23-11-2021'),
(1, 'https://podcasts.apple.com/sa/podcast/lana-del-rey-summer-wine/id1651290930?i=1000624979758' , 4.0 , ' SONGS' , 'Lana' , ' UNRELEASED SONGS', 1134, null , '4', null ,'19-08-2022'),
(1,'https://podcasts.apple.com/sa/podcast/taylor-swift-song-by-song-all-too-well/id1729264531', 4.3, 'Taylor', 'corboo ' , 'Taylor Swift Song' , 1135, null , '10' , null ,'01-01-2022'),
(4,'https://podcasts.apple.com/sa/podcast/ielts-podcast/id524002915',4.9,'IELTS ', null,'IELTS Podcast', 1136, 'Ben Worthington','20',null, '20-02-2020'),
(4,'https://podcasts.apple.com/sa/podcast/voa-learning-english-podcast-voa-learning-english/id109522474',3.8,'Learning English', null,'VOA Learning English Podcast', 1137, 'Loie','20',null,'20-02-2021'),
(6,'https://podcasts.apple.com/sa/podcast/islamic-history-exclusive/id1574237653',4.6,'History',null,'Islamic History',1138,'Mohammed', '93' ,null, '01-03-2020'),
(6,'https://podcasts.apple.com/sa/podcast/the-rest-is-history/id1537788786',3.2,'HistoryR',null, 'The Rest Is History',1139,'Tom,Dominic','611',null,'12-02-2020'),
(7,'https://podcasts.apple.com/sa/podcast/gold-minds-with-kevin-hart/id1549388085',4.9,'ComedyPodcasts',null,'Gold Minds ',1140,'Kevin','140',null,'20-06-2021'),
(7,'https://podcasts.apple.com/sa/podcast/the-daily-show-ears-edition/id1334878780',4.2,'DailyPodcast',null,'The Daily Show',1141,'Jon','2000',null,'16-04-2021'),
(4,'https://podcasts.apple.com/sa/podcast/english-listening-what-i-learned-from-teaching/id1556878879?i=1000654795557',3.8,'English Practice','Conner Pe','Listening Time',1142,'Conner', 154 ,'What I Learned From Teaching','07-05-2024'),
(4, 'https://podcasts.apple.com/sa/podcast/english-listening-my-experience-learning-italian/id1556878879?i=1000653322444', 3.7,'English Practice','Conner Pe','Listening Time',1143,'Conner', 151 , 'My Experience Learning Italian','23-04-2024'),
(4, 'https://podcasts.apple.com/sa/podcast/english-listening-how-i-learned-spanish/id1556878879?i=1000652604802', 4.0, 'English Practice','Conner Pe','Listening Time',1144,'Conner', 150,'How I Learned Spanish', '16-04-2024'),
(4, 'https://podcasts.apple.com/sa/podcast/english-listening-time-management/id1556878879?i=1000648894621', 3.5, 'English Practice','Conner Pe','Listening Time',1145,'Conner', 145, 'TimeManagement','12-03-2024');


INSERT INTO `playlist_sound` VALUES
(1001,1116,'21-03-2024',0,4.4,4),
(2001,1103,'01-07-2023',0,4.7,5),
(1001,1117,'15-02-2024',0,4.6,4),
(4001,1111,'02-04-2024',0,4.7,7),
(5001,1101,'10-04-2024',0,4.0,6),
(1001,1119,'02-09-2023',0,4.0,4),
(1001,1120,'11-10-2023',0,4.1,4),
(5001,1102,'05-04-2024',0,4.0,6),
(4001,1112,'26-03-2024',0,4.7,7),
(4001,1113,'19-03-2024',0,4.7,7),
(4001,1114,'12-03-2024',0,4.7,7),
(4001,1115,'05-03-2024',0,4.7,7),
(2001,1106,'13-02-2024',0,3.6,5),
(2001,1107,'30-01-2024',0,4.1,5),
(2001,1108,'15-01-2024',0,4.5,5),
(2001,1109,'05-02-2024',0,3.0,5),
(2001,1110,'10-01-2024',0,3.7,5),
(6001,1123,'22-05-2023',0,4.1,3),
(6001,1124,'10-04-2023',0,4.3,3),
(6001,1125,'27-03-2023',0,3.5,3),
(9001,1134,'27-08-2023',0,3.9,4),
(1011,1135,'28-09-2023',0,3.2,4),
(3001,1136,'19-08-2023',0,3.9,8),
(3001,1137,'18-08-2023',0,4.6,8),
(8001,1138,'19-09-2023',0,4.2,9),
(8001,1139,'20-09-2023',0,4.3,9),
(10001,1140,'02-10-2023',0,4.0,10),
(10001,1141,'03-10-2023',0,3.5,10),
(2004,1142, '03-04-2024',0,3.9,11),
(1009,1143, '20-02-2023',0,4.0,13),
(3002,1144, '12-05-2021',0,3.5,12),
(4005,1145, '20-06-2023',0,3.8,14);

SELECT user_type, COUNT(*) AS total_users 
FROM users GROUP BY user_type;

SELECT * FROM users
ORDER BY regdate DESC;

SELECT * FROM playlist 
WHERE cat_id = 1;

SELECT * FROM randomqas 
WHERE listenORwatch = 'Listen';

SELECT * FROM randomqas 
WHERE User_id = 3;

SELECT * FROM sound 
WHERE PodcastType = 4;

SELECT * FROM sound 
WHERE publishdate = '2022-01-01';

DELETE FROM playlist_sound 
WHERE PL_id = '1001';


SELECT * FROM end_user 
WHERE DOB BETWEEN '2000-01-01' AND '2005-12-31';


SELECT users.User_id, users.Username, COALESCE(p.total_playlists, 0) AS total_playlists
FROM users
LEFT JOIN (
SELECT user_id, COUNT(*) AS total_playlists
FROM playlist
GROUP BY user_id
) AS p ON users.User_id = p.user_id;

select * FROM sound
WHERE Hoster LIKE '%MohamedAlbeez%';

UPDATE playlist
SET PL_name = 'Favorites'
WHERE PL_id = 6001 AND user_id = 3; 


CREATE INDEX idx_user_id ON users (User_id);

SELECT User_id, Username, Email, NULL AS address, NULL AS DOB
FROM users
UNION
SELECT user_id, NULL AS Username, NULL AS Email, address, DOB
FROM end_user;

SELECT User_id FROM users
INTERSECT
SELECT user_id FROM end_user;

SELECT User_id FROM users
EXCEPT
SELECT user_id FROM end_user;


SELECT s.PodcastName, AVG(ps.Rate) AS avg_rate
FROM sound s
JOIN playlist_sound ps ON s.sound_id = ps.sound_id
GROUP BY s.PodcastName
HAVING AVG(ps.Rate) > 4.5;


SELECT *
FROM categories
WHERE NOT cat_id = 1;

SELECT DISTINCT Username
FROM users;

SELECT *
FROM sound
WHERE PodcastType IN (1, 2, 3);

SELECT 
COUNT(sound_id) AS total_sounds,
AVG(rate) AS average_rate
FROM sound;

SELECT *
FROM sound
WHERE albumName IS NULL;

SELECT *
FROM end_user
WHERE user_id > ANY (SELECT user_id FROM users);

SELECT PL_name, creation_date
FROM playlist
WHERE user_id IN (
SELECT user_id
FROM end_user
WHERE Nat_id = 1
);

SELECT u.Username
FROM users u
WHERE EXISTS (
SELECT 1
FROM playlist_sound ps
WHERE ps.user_id = u.User_id
);

CREATE TRIGGER
update_last_login
BEFORE UPDATE ON users
FOR EACH ROW
SET new.regdate = NOW();

SHOW TRIGGERS LIKE 'update_last_login';

SELECT
Username,
regdate,
   CASE
      WHEN regdate BETWEEN '2023-01-01' AND '2023-12-31' THEN '2023 User'
      WHEN regdate BETWEEN '2022-01-01' AND '2022-12-31' THEN '2022 User'
         ELSE 'Other'
    END AS registration_year
FROM users;


SELECT *
FROM sound
WHERE PodcastType IN (
        SELECT cat_id
        FROM categories
        WHERE cat_name = 'Food'
    )
    OR PodcastType IN (
        SELECT cat_id
        FROM categories
        WHERE cat_name = 'song'
    );
    
 
DELIMITER $$
CREATE PROCEDURE GetAllUsers()
BEGIN
    SELECT * FROM users;
END$$
DELIMITER ;

CALL GetAllUsers();
    

DELIMITER $$
CREATE FUNCTION CountUserPlaylists(userId INT) 
RETURNS INT DETERMINISTIC
BEGIN
    DECLARE playlistCount INT;
    
    SELECT COUNT(*) INTO playlistCount
    FROM playlist
    WHERE User_id = userId;
    RETURN playlistCount;
END$$

DELIMITER ;

SELECT CountUserPlaylists(5);

 /*-----------------------*/
 
 
select *  from user_type;
select *  from users;
select *  from categories;
select *  from sound;
select *  from nationality;
select *  from playlist;
select *  from playlist_sound;
select *  from admin;
select *  from end_user;
select *  from randomqas;

