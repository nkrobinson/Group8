INSERT INTO NODETYPE (name) VALUES ("Discipline");
INSERT INTO NODETYPE (name) VALUES ("Course");
INSERT INTO NODETYPE (name) VALUES ("Location");

SET @nodetype=(SELECT typeID FROM NODETYPE WHERE name="Discipline");
INSERT INTO NODELIST (name, typeID) VALUES ("Computing", @nodetype);
INSERT INTO NODELIST (name, typeID) VALUES ("Chemistry", @nodetype);
INSERT INTO NODELIST (name, typeID) VALUES ("Mathematics", @nodetype);
INSERT INTO NODELIST (name, typeID) VALUES ("Biology", @nodetype);
INSERT INTO NODELIST (name, typeID) VALUES ("Physics", @nodetype);
SET @nodetype=0;
SET @nodetype=(SELECT typeID FROM NODETYPE WHERE name="Course");
INSERT INTO NODELIST (name, typeID) VALUES ("Computer Science", @nodetype);
INSERT INTO NODELIST (name, typeID) VALUES ("Information Systems", @nodetype);
INSERT INTO NODELIST (name, typeID) VALUES ("Computer Systems", @nodetype);
INSERT INTO NODELIST (name, typeID) VALUES ("Chemistry", @nodetype);
INSERT INTO NODELIST (name, typeID) VALUES ("Pharmaceutical Chemistry", @nodetype);
INSERT INTO NODELIST (name, typeID) VALUES ("Computational Chemistry", @nodetype);
INSERT INTO NODELIST (name, typeID) VALUES ("Mathematics", @nodetype);
INSERT INTO NODELIST (name, typeID) VALUES ("Statistical Modelling", @nodetype);
INSERT INTO NODELIST (name, typeID) VALUES ("Financial Mathematics", @nodetype);
INSERT INTO NODELIST (name, typeID) VALUES ("Theoretical Physics", @nodetype);
SET @nodetype=0;
SET @nodetype=(SELECT typeID FROM NODETYPE WHERE name="Location");
INSERT INTO NODELIST (name, typeID) VALUES ("Heriot-Watt University", @nodetype);
INSERT INTO NODELIST (name, typeID) VALUES ("Edinburgh University", @nodetype);
INSERT INTO NODELIST (name, typeID) VALUES ("Stirling University", @nodetype);
SET @nodetype=0;


INSERT INTO RELATIONLIST (parentID, childID) VALUES ((SELECT nodeID FROM NODELIST WHERE name="Computing" AND typeID=1), (SELECT nodeID FROM NODELIST WHERE name="Computer Science" AND typeID=2));
INSERT INTO RELATIONLIST (parentID, childID) VALUES ((SELECT nodeID FROM NODELIST WHERE name="Computing" AND typeID=1), (SELECT nodeID FROM NODELIST WHERE name="Information Systems" AND typeID=2));
INSERT INTO RELATIONLIST (parentID, childID) VALUES ((SELECT nodeID FROM NODELIST WHERE name="Computing" AND typeID=1), (SELECT nodeID FROM NODELIST WHERE name="Computer Systems" AND typeID=2));
INSERT INTO RELATIONLIST (parentID, childID) VALUES ((SELECT nodeID FROM NODELIST WHERE name="Chemistry" AND typeID=1), (SELECT nodeID FROM NODELIST WHERE name="Chemistry" AND typeID=2));
INSERT INTO RELATIONLIST (parentID, childID) VALUES ((SELECT nodeID FROM NODELIST WHERE name="Chemistry" AND typeID=1), (SELECT nodeID FROM NODELIST WHERE name="Pharmaceutical Chemistry" AND typeID=2));
INSERT INTO RELATIONLIST (parentID, childID) VALUES ((SELECT nodeID FROM NODELIST WHERE name="Chemistry" AND typeID=1), (SELECT nodeID FROM NODELIST WHERE name="Computational Chemistry" AND typeID=2));
INSERT INTO RELATIONLIST (parentID, childID) VALUES ((SELECT nodeID FROM NODELIST WHERE name="Mathematics" AND typeID=1), (SELECT nodeID FROM NODELIST WHERE name="Mathematics" AND typeID=2));
INSERT INTO RELATIONLIST (parentID, childID) VALUES ((SELECT nodeID FROM NODELIST WHERE name="Mathematics" AND typeID=1), (SELECT nodeID FROM NODELIST WHERE name="Statistical Modelling" AND typeID=2));
INSERT INTO RELATIONLIST (parentID, childID) VALUES ((SELECT nodeID FROM NODELIST WHERE name="Mathematics" AND typeID=1), (SELECT nodeID FROM NODELIST WHERE name="Financial Mathematics" AND typeID=2));
INSERT INTO RELATIONLIST (parentID, childID) VALUES ((SELECT nodeID FROM NODELIST WHERE name="Physics" AND typeID=1), (SELECT nodeID FROM NODELIST WHERE name="Theoretical Physics" AND typeID=2));



INSERT INTO RELATIONLIST (parentID, childID) VALUES ((SELECT nodeID FROM NODELIST WHERE name="Computer Science" AND typeID=2), (SELECT nodeID FROM NODELIST WHERE name="Heriot-Watt University" AND typeID=3));
INSERT INTO RELATIONLIST (parentID, childID) VALUES ((SELECT nodeID FROM NODELIST WHERE name="Computer Science" AND typeID=2), (SELECT nodeID FROM NODELIST WHERE name="Edinburgh University" AND typeID=3));
INSERT INTO RELATIONLIST (parentID, childID) VALUES ((SELECT nodeID FROM NODELIST WHERE name="Computer Science" AND typeID=2), (SELECT nodeID FROM NODELIST WHERE name="Stirling University" AND typeID=3));

INSERT INTO RELATIONLIST (parentID, childID) VALUES ((SELECT nodeID FROM NODELIST WHERE name="Information Systems" AND typeID=2), (SELECT nodeID FROM NODELIST WHERE name="Heriot-Watt University" AND typeID=3));
INSERT INTO RELATIONLIST (parentID, childID) VALUES ((SELECT nodeID FROM NODELIST WHERE name="Information Systems" AND typeID=2), (SELECT nodeID FROM NODELIST WHERE name="Edinburgh University" AND typeID=3));
INSERT INTO RELATIONLIST (parentID, childID) VALUES ((SELECT nodeID FROM NODELIST WHERE name="Information Systems" AND typeID=2), (SELECT nodeID FROM NODELIST WHERE name="Stirling University" AND typeID=3));

INSERT INTO RELATIONLIST (parentID, childID) VALUES ((SELECT nodeID FROM NODELIST WHERE name="Computer Systems" AND typeID=2), (SELECT nodeID FROM NODELIST WHERE name="Heriot-Watt University" AND typeID=3));
INSERT INTO RELATIONLIST (parentID, childID) VALUES ((SELECT nodeID FROM NODELIST WHERE name="Computer Systems" AND typeID=2), (SELECT nodeID FROM NODELIST WHERE name="Edinburgh University" AND typeID=3));
INSERT INTO RELATIONLIST (parentID, childID) VALUES ((SELECT nodeID FROM NODELIST WHERE name="Computer Systems" AND typeID=2), (SELECT nodeID FROM NODELIST WHERE name="Stirling University" AND typeID=3));

INSERT INTO RELATIONLIST (parentID, childID) VALUES ((SELECT nodeID FROM NODELIST WHERE name="Chemistry" AND typeID=2), (SELECT nodeID FROM NODELIST WHERE name="Heriot-Watt University" AND typeID=3));
INSERT INTO RELATIONLIST (parentID, childID) VALUES ((SELECT nodeID FROM NODELIST WHERE name="Chemistry" AND typeID=2), (SELECT nodeID FROM NODELIST WHERE name="Edinburgh University" AND typeID=3));
INSERT INTO RELATIONLIST (parentID, childID) VALUES ((SELECT nodeID FROM NODELIST WHERE name="Chemistry" AND typeID=2), (SELECT nodeID FROM NODELIST WHERE name="Stirling University" AND typeID=3));

INSERT INTO RELATIONLIST (parentID, childID) VALUES ((SELECT nodeID FROM NODELIST WHERE name="Pharmaceutical Chemistry" AND typeID=2), (SELECT nodeID FROM NODELIST WHERE name="Heriot-Watt University" AND typeID=3));
INSERT INTO RELATIONLIST (parentID, childID) VALUES ((SELECT nodeID FROM NODELIST WHERE name="Pharmaceutical Chemistry" AND typeID=2), (SELECT nodeID FROM NODELIST WHERE name="Edinburgh University" AND typeID=3));
INSERT INTO RELATIONLIST (parentID, childID) VALUES ((SELECT nodeID FROM NODELIST WHERE name="Pharmaceutical Chemistry" AND typeID=2), (SELECT nodeID FROM NODELIST WHERE name="Stirling University" AND typeID=3));

INSERT INTO RELATIONLIST (parentID, childID) VALUES ((SELECT nodeID FROM NODELIST WHERE name="Computational Chemistry" AND typeID=2), (SELECT nodeID FROM NODELIST WHERE name="Heriot-Watt University" AND typeID=3));
INSERT INTO RELATIONLIST (parentID, childID) VALUES ((SELECT nodeID FROM NODELIST WHERE name="Computational Chemistry" AND typeID=2), (SELECT nodeID FROM NODELIST WHERE name="Edinburgh University" AND typeID=3));
INSERT INTO RELATIONLIST (parentID, childID) VALUES ((SELECT nodeID FROM NODELIST WHERE name="Computational Chemistry" AND typeID=2), (SELECT nodeID FROM NODELIST WHERE name="Stirling University" AND typeID=3));

INSERT INTO RELATIONLIST (parentID, childID) VALUES ((SELECT nodeID FROM NODELIST WHERE name="Mathematics" AND typeID=2), (SELECT nodeID FROM NODELIST WHERE name="Heriot-Watt University" AND typeID=3));
INSERT INTO RELATIONLIST (parentID, childID) VALUES ((SELECT nodeID FROM NODELIST WHERE name="Mathematics" AND typeID=2), (SELECT nodeID FROM NODELIST WHERE name="Edinburgh University" AND typeID=3));
INSERT INTO RELATIONLIST (parentID, childID) VALUES ((SELECT nodeID FROM NODELIST WHERE name="Mathematics" AND typeID=2), (SELECT nodeID FROM NODELIST WHERE name="Stirling University" AND typeID=3));

INSERT INTO RELATIONLIST (parentID, childID) VALUES ((SELECT nodeID FROM NODELIST WHERE name="Statistical Modelling" AND typeID=2), (SELECT nodeID FROM NODELIST WHERE name="Heriot-Watt University" AND typeID=3));
INSERT INTO RELATIONLIST (parentID, childID) VALUES ((SELECT nodeID FROM NODELIST WHERE name="Statistical Modelling" AND typeID=2), (SELECT nodeID FROM NODELIST WHERE name="Edinburgh University" AND typeID=3));
INSERT INTO RELATIONLIST (parentID, childID) VALUES ((SELECT nodeID FROM NODELIST WHERE name="Statistical Modelling" AND typeID=2), (SELECT nodeID FROM NODELIST WHERE name="Stirling University" AND typeID=3));

INSERT INTO RELATIONLIST (parentID, childID) VALUES ((SELECT nodeID FROM NODELIST WHERE name="Financial Mathematics" AND typeID=2), (SELECT nodeID FROM NODELIST WHERE name="Heriot-Watt University" AND typeID=3));
INSERT INTO RELATIONLIST (parentID, childID) VALUES ((SELECT nodeID FROM NODELIST WHERE name="Financial Mathematics" AND typeID=2), (SELECT nodeID FROM NODELIST WHERE name="Edinburgh University" AND typeID=3));
INSERT INTO RELATIONLIST (parentID, childID) VALUES ((SELECT nodeID FROM NODELIST WHERE name="Financial Mathematics" AND typeID=2), (SELECT nodeID FROM NODELIST WHERE name="Stirling University" AND typeID=3));

INSERT INTO RELATIONLIST (parentID, childID) VALUES ((SELECT nodeID FROM NODELIST WHERE name="Theoretical Physics" AND typeID=2), (SELECT nodeID FROM NODELIST WHERE name="Heriot-Watt University" AND typeID=3));
INSERT INTO RELATIONLIST (parentID, childID) VALUES ((SELECT nodeID FROM NODELIST WHERE name="Theoretical Physics" AND typeID=2), (SELECT nodeID FROM NODELIST WHERE name="Edinburgh University" AND typeID=3));
INSERT INTO RELATIONLIST (parentID, childID) VALUES ((SELECT nodeID FROM NODELIST WHERE name="Theoretical Physics" AND typeID=2), (SELECT nodeID FROM NODELIST WHERE name="Stirling University" AND typeID=3));

INSERT INTO NODEDESCRIPTION (nodeID, description) VALUES ((SELECT nodeID FROM NODELIST WHERE name="Heriot-Watt University" AND typeID=3) ,"University based in the west of Edinbugh. Named after George Heriot and James Watt.");

INSERT INTO USERLIST (username, password) VALUES ("ab123","qwerty");
INSERT INTO USERLIST (username, password) VALUES ("or385","melons");
INSERT INTO USERLIST (username, password) VALUES ("ng957","twenty");
INSERT INTO USERLIST (username, password) VALUES ("ug456","little");
INSERT INTO USERLIST (username, password) VALUES ("og975","bleeps");

SET @user=0;
SET @courselocation=0;
SET @user=(SELECT userID FROM USERLIST WHERE username="ab123");
SET @courselocation=(SELECT relationID FROM RELATIONLIST WHERE parentID=(SELECT nodeID FROM NODELIST WHERE name="Computational Chemistry" AND typeID=2) AND childID=((SELECT nodeID FROM NODELIST WHERE name="Heriot-Watt University" AND typeID=3)));
INSERT INTO USERNODELIST (userID, nodeID) VALUES (@user, @courselocation);
SET @user=0;
SET @courselocation=0;
SET @user=(SELECT userID FROM USERLIST WHERE username="or385");
SET @courselocation=(SELECT relationID FROM RELATIONLIST WHERE parentID=(SELECT nodeID FROM NODELIST WHERE name="Information Systems" AND typeID=2) AND childID=((SELECT nodeID FROM NODELIST WHERE name="Stirling University" AND typeID=3)));
INSERT INTO USERNODELIST (userID, nodeID) VALUES (@user, @courselocation);
SET @user=0;
SET @courselocation=0;
SET @user=(SELECT userID FROM USERLIST WHERE username="ng957");
SET @courselocation=(SELECT relationID FROM RELATIONLIST WHERE parentID=(SELECT nodeID FROM NODELIST WHERE name="Statistical Modelling" AND typeID=2) AND childID=((SELECT nodeID FROM NODELIST WHERE name="Stirling University" AND typeID=3)));
INSERT INTO USERNODELIST (userID, nodeID) VALUES (@user, @courselocation);
SET @user=0;
SET @courselocation=0;
SET @user=(SELECT userID FROM USERLIST WHERE username="ug456");
SET @courselocation=(SELECT relationID FROM RELATIONLIST WHERE parentID=(SELECT nodeID FROM NODELIST WHERE name="Computer Systems" AND typeID=2) AND childID=((SELECT nodeID FROM NODELIST WHERE name="Edinburgh University" AND typeID=3)));
INSERT INTO USERNODELIST (userID, nodeID) VALUES (@user, @courselocation);
INSERT INTO GRADELIST (userID, courseID, grade) VALUES (@user, @courselocation, 2);
SET @user=0;
SET @courselocation=0;
SET @user=(SELECT userID FROM USERLIST WHERE username="og975");
SET @courselocation=(SELECT relationID FROM RELATIONLIST WHERE parentID=(SELECT nodeID FROM NODELIST WHERE name="Financial Mathematics" AND typeID=2) AND childID=((SELECT nodeID FROM NODELIST WHERE name="Heriot-Watt University" AND typeID=3)));
INSERT INTO USERNODELIST (userID, nodeID) VALUES (@user, @courselocation);
INSERT INTO GRADELIST (userID, courseID, grade) VALUES (@user, @courselocation, 1);
SET @user=0;
SET @courselocation=0;


