DROP TABLE REQUIREMENTLIST;
DROP TABLE GROUPLISTLIST;
DROP TABLE GROUPLIST;
DROP TABLE USERNODERELATIONLIST;
DROP TABLE GRADELIST;
DROP TABLE USERNODELIST;
DROP TABLE USERLIST;
DROP TABLE NODERELATIONLIST;
DROP TABLE NODEDESCRIPTIONLIST;
DROP TABLE NODELIST;
DROP TABLE QUALIFICATIONLIST;
DROP TABLE NODETYPELIST;


CREATE TABLE NODETYPELIST (
typeID INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(30)
)ENGINE=INNODB;

CREATE TABLE QUALIFICATIONLIST (
qualID INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(30) NOT NULL,
description VARCHAR(140) NOT NULL
)ENGINE=INNODB;

CREATE TABLE NODELIST (
nodeID INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(64),
typeID INT,
FOREIGN KEY (typeID) REFERENCES NODETYPELIST (typeID)
)ENGINE=INNODB;

CREATE TABLE NODEDESCRIPTIONLIST (
nodeID INT PRIMARY KEY,
description VARCHAR(140) NOT NULL,
FOREIGN KEY (nodeID) REFERENCES NODELIST (nodeID)
)ENGINE=INNODB;

CREATE TABLE NODERELATIONLIST (
parentID INT NOT NULL,
childID INT NOT NULL,
FOREIGN KEY (parentID) REFERENCES NODELIST (nodeID),
FOREIGN KEY (childID) REFERENCES NODELIST (nodeID),
PRIMARY KEY relationID (parentID, childID)
)ENGINE=INNODB;

CREATE TABLE USERLIST (
userID INT AUTO_INCREMENT PRIMARY KEY,
username VARCHAR(255) NOT NULL,
password VARCHAR(255) NOT NULL,
email  VARCHAR(255) NOT NULL,
active VARCHAR(255) NOT NULL,
resetToken VARCHAR(255) NOT NULL,
resetComplete VARCHAR(3) NOT NULL
)ENGINE=INNODB;

CREATE TABLE USERNODELIST (
userNodeID INT AUTO_INCREMENT PRIMARY KEY,
userID INT NOT NULL,
nodeID INT NOT NULL,
FOREIGN KEY (userID) REFERENCES USERLIST (userID),
FOREIGN KEY (nodeID) REFERENCES NODELIST (nodeID)
)ENGINE=INNODB;

CREATE TABLE GRADELIST (
userNodeID INT PRIMARY KEY,
qualID INT NOT NULL,
grade INT NOT NULL,
FOREIGN KEY (userNodeID) REFERENCES USERNODELIST (userNodeID),
FOREIGN KEY (qualID) REFERENCES QUALIFICATIONLIST (qualID)
)ENGINE=INNODB;

CREATE TABLE USERNODERELATIONLIST (
parentID INT NOT NULL,
childID INT NOT NULL,
FOREIGN KEY (parentID) REFERENCES USERNODELIST (nodeID),
FOREIGN KEY (childID) REFERENCES USERNODELIST (nodeID),
PRIMARY KEY userRelationID (parentID, childID)
)ENGINE=INNODB;

CREATE TABLE GROUPLIST (
groupListID INT PRIMARY KEY,
groupID INT NOT NULL,
qualID INT NOT NULL,
minGrade INT,
typeID INT,
FOREIGN KEY (qualID) REFERENCES QUALIFICATIONLIST (qualID),
FOREIGN KEY (typeID) REFERENCES NODETYPELIST (typeID)
)ENGINE=INNODB;

CREATE TABLE GROUPLISTLIST (
groupLLID INT AUTO_INCREMENT PRIMARY KEY,
groupID INT NOT NULL
)ENGINE=INNODB;

CREATE TABLE REQUIREMENTLIST (
nodeID INT NOT NULL,
groupLLID INT NOT NULL,
FOREIGN KEY (nodeID) REFERENCES NODELIST (nodeID),
FOREIGN KEY (groupLLID) REFERENCES GROUPLISTLIST (groupLLID),
PRIMARY KEY requirementID (nodeID, groupLLID)
)ENGINE=INNODB;
