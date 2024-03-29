INSERT INTO NODETYPELIST (name) VALUES ("Discipline");
INSERT INTO NODETYPELIST (name) VALUES ("Course");
INSERT INTO NODETYPELIST (name) VALUES ("Location");
INSERT INTO NODETYPELIST (name) VALUES ("Course & Location");




SET @name="Advanced Higher";
SET @desc="";
INSERT INTO QUALIFICATIONLIST (name, description, grade, points) VALUES (@name, @desc, 1, 130);
INSERT INTO QUALIFICATIONLIST (name, description, grade, points) VALUES (@name, @desc, 2, 110);
INSERT INTO QUALIFICATIONLIST (name, description, grade, points) VALUES (@name, @desc, 3, 90);
INSERT INTO QUALIFICATIONLIST (name, description, grade, points) VALUES (@name, @desc, 4, 72);
SET @name="Higher";
SET @desc="";
INSERT INTO QUALIFICATIONLIST (name, description, grade, points) VALUES (@name, @desc, 1, 80);
INSERT INTO QUALIFICATIONLIST (name, description, grade, points) VALUES (@name, @desc, 2, 65);
INSERT INTO QUALIFICATIONLIST (name, description, grade, points) VALUES (@name, @desc, 3, 50);
INSERT INTO QUALIFICATIONLIST (name, description, grade, points) VALUES (@name, @desc, 4, 36);
SET @name="SNC";
SET @desc="Scottish National Certificate (C is higest grade)";
INSERT INTO QUALIFICATIONLIST (name, description, grade, points) VALUES (@name, @desc, 1, 125);
INSERT INTO QUALIFICATIONLIST (name, description, grade, points) VALUES (@name, @desc, 2, 100);
INSERT INTO QUALIFICATIONLIST (name, description, grade, points) VALUES (@name, @desc, 3, 75);
SET @name="";
SET @desc="";




SET @nodetype=(SELECT typeID FROM NODETYPELIST WHERE name="Discipline");
INSERT INTO NODELIST (name, typeID) VALUES ("Computing", @nodetype);
INSERT INTO NODELIST (name, typeID) VALUES ("Chemistry", @nodetype);
INSERT INTO NODELIST (name, typeID) VALUES ("Mathematics", @nodetype);
INSERT INTO NODELIST (name, typeID) VALUES ("Biology", @nodetype);
INSERT INTO NODELIST (name, typeID) VALUES ("Physics", @nodetype);
SET @nodetype=0;


SET @nodetype=(SELECT typeID FROM NODETYPELIST WHERE name="Course");
INSERT INTO NODELIST (name, typeID) VALUES ("Computer Science", @nodetype);
INSERT INTO NODELIST (name, typeID) VALUES ("Information Systems", @nodetype);
INSERT INTO NODELIST (name, typeID) VALUES ("Computer Systems", @nodetype);
INSERT INTO NODELIST (name, typeID) VALUES ("Chemistry", @nodetype);
INSERT INTO NODELIST (name, typeID) VALUES ("Pharmaceutical Chemistry", @nodetype);
INSERT INTO NODELIST (name, typeID) VALUES ("Computational Chemistry", @nodetype);
INSERT INTO NODELIST (name, typeID) VALUES ("Mathematics", @nodetype);
INSERT INTO NODELIST (name, typeID) VALUES ("Statistical Modelling", @nodetype);
INSERT INTO NODELIST (name, typeID) VALUES ("Financial Mathematics", @nodetype);
INSERT INTO NODELIST (name, typeID) VALUES ("Biology", @nodetype);
INSERT INTO NODELIST (name, typeID) VALUES ("Theoretical Physics", @nodetype);
SET @nodetype=0;


SET @nodetype=(SELECT typeID FROM NODETYPELIST WHERE name="Location");
INSERT INTO NODELIST (name, typeID) VALUES ("Heriot-Watt University", @nodetype);
INSERT INTO NODELIST (name, typeID) VALUES ("Edinburgh University", @nodetype);
INSERT INTO NODELIST (name, typeID) VALUES ("Stirling University", @nodetype);
SET @nodetype=0;


SET @nodetype=(SELECT typeID FROM NODETYPELIST WHERE name="Course & Location");
INSERT INTO NODELIST (name, typeID) VALUES ("Computer Science at Heriot-Watt University", @nodetype);
INSERT INTO NODELIST (name, typeID) VALUES ("Information Systems at Heriot-Watt University", @nodetype);
INSERT INTO NODELIST (name, typeID) VALUES ("Computer Systems at Heriot-Watt University", @nodetype);
INSERT INTO NODELIST (name, typeID) VALUES ("Chemistry at Heriot-Watt University", @nodetype);
INSERT INTO NODELIST (name, typeID) VALUES ("Pharmaceutical Chemistry at Heriot-Watt University", @nodetype);
INSERT INTO NODELIST (name, typeID) VALUES ("Computational Chemistry at Heriot-Watt University", @nodetype);
INSERT INTO NODELIST (name, typeID) VALUES ("Mathematics at Heriot-Watt University", @nodetype);
INSERT INTO NODELIST (name, typeID) VALUES ("Statistical Modelling at Heriot-Watt University", @nodetype);
INSERT INTO NODELIST (name, typeID) VALUES ("Financial Mathematics at Heriot-Watt University", @nodetype);
INSERT INTO NODELIST (name, typeID) VALUES ("Biology at Heriot-Watt University", @nodetype);
INSERT INTO NODELIST (name, typeID) VALUES ("Theoretical Physics at Heriot-Watt University", @nodetype);

INSERT INTO NODELIST (name, typeID) VALUES ("Computer Science at Edinburgh University", @nodetype);
INSERT INTO NODELIST (name, typeID) VALUES ("Information Systems at Edinburgh University", @nodetype);
INSERT INTO NODELIST (name, typeID) VALUES ("Computer Systems at Edinburgh University", @nodetype);
INSERT INTO NODELIST (name, typeID) VALUES ("Chemistry at Edinburgh University", @nodetype);
INSERT INTO NODELIST (name, typeID) VALUES ("Pharmaceutical Chemistry at Edinburgh University", @nodetype);
INSERT INTO NODELIST (name, typeID) VALUES ("Computational Chemistry at Edinburgh University", @nodetype);
INSERT INTO NODELIST (name, typeID) VALUES ("Mathematics at Edinburgh University", @nodetype);
INSERT INTO NODELIST (name, typeID) VALUES ("Statistical Modelling at Edinburgh University", @nodetype);
INSERT INTO NODELIST (name, typeID) VALUES ("Financial Mathematics at Edinburgh University", @nodetype);
INSERT INTO NODELIST (name, typeID) VALUES ("Biology at Edinburgh University", @nodetype);
INSERT INTO NODELIST (name, typeID) VALUES ("Theoretical Physics at Edinburgh University", @nodetype);

INSERT INTO NODELIST (name, typeID) VALUES ("Computer Science at Stirling University", @nodetype);
INSERT INTO NODELIST (name, typeID) VALUES ("Information Systems at Stirling University", @nodetype);
INSERT INTO NODELIST (name, typeID) VALUES ("Computer Systems at Stirling University", @nodetype);
INSERT INTO NODELIST (name, typeID) VALUES ("Chemistry at Stirling University", @nodetype);
INSERT INTO NODELIST (name, typeID) VALUES ("Pharmaceutical Chemistry at Stirling University", @nodetype);
INSERT INTO NODELIST (name, typeID) VALUES ("Computational Chemistry at Stirling University", @nodetype);
INSERT INTO NODELIST (name, typeID) VALUES ("Mathematics at Stirling University", @nodetype);
INSERT INTO NODELIST (name, typeID) VALUES ("Statistical Modelling at Stirling University", @nodetype);
INSERT INTO NODELIST (name, typeID) VALUES ("Financial Mathematics at Stirling University", @nodetype);
INSERT INTO NODELIST (name, typeID) VALUES ("Biology at Stirling University", @nodetype);
INSERT INTO NODELIST (name, typeID) VALUES ("Theoretical Physics at Stirling University", @nodetype);
SET @nodetype=0;




INSERT INTO NODERELATIONLIST (parentID, childID) VALUES ((SELECT nodeID FROM NODELIST WHERE name="Computing" AND typeID=1), (SELECT nodeID FROM NODELIST WHERE name="Computer Science" AND typeID=2));
INSERT INTO NODERELATIONLIST (parentID, childID) VALUES ((SELECT nodeID FROM NODELIST WHERE name="Computing" AND typeID=1), (SELECT nodeID FROM NODELIST WHERE name="Information Systems" AND typeID=2));
INSERT INTO NODERELATIONLIST (parentID, childID) VALUES ((SELECT nodeID FROM NODELIST WHERE name="Computing" AND typeID=1), (SELECT nodeID FROM NODELIST WHERE name="Computer Systems" AND typeID=2));
INSERT INTO NODERELATIONLIST (parentID, childID) VALUES ((SELECT nodeID FROM NODELIST WHERE name="Chemistry" AND typeID=1), (SELECT nodeID FROM NODELIST WHERE name="Chemistry" AND typeID=2));
INSERT INTO NODERELATIONLIST (parentID, childID) VALUES ((SELECT nodeID FROM NODELIST WHERE name="Chemistry" AND typeID=1), (SELECT nodeID FROM NODELIST WHERE name="Pharmaceutical Chemistry" AND typeID=2));
INSERT INTO NODERELATIONLIST (parentID, childID) VALUES ((SELECT nodeID FROM NODELIST WHERE name="Chemistry" AND typeID=1), (SELECT nodeID FROM NODELIST WHERE name="Computational Chemistry" AND typeID=2));
INSERT INTO NODERELATIONLIST (parentID, childID) VALUES ((SELECT nodeID FROM NODELIST WHERE name="Mathematics" AND typeID=1), (SELECT nodeID FROM NODELIST WHERE name="Mathematics" AND typeID=2));
INSERT INTO NODERELATIONLIST (parentID, childID) VALUES ((SELECT nodeID FROM NODELIST WHERE name="Mathematics" AND typeID=1), (SELECT nodeID FROM NODELIST WHERE name="Statistical Modelling" AND typeID=2));
INSERT INTO NODERELATIONLIST (parentID, childID) VALUES ((SELECT nodeID FROM NODELIST WHERE name="Mathematics" AND typeID=1), (SELECT nodeID FROM NODELIST WHERE name="Financial Mathematics" AND typeID=2));
INSERT INTO NODERELATIONLIST (parentID, childID) VALUES ((SELECT nodeID FROM NODELIST WHERE name="Biology" AND typeID=1), (SELECT nodeID FROM NODELIST WHERE name="Biology" AND typeID=2));
INSERT INTO NODERELATIONLIST (parentID, childID) VALUES ((SELECT nodeID FROM NODELIST WHERE name="Physics" AND typeID=1), (SELECT nodeID FROM NODELIST WHERE name="Theoretical Physics" AND typeID=2));

INSERT INTO NODERELATIONLIST (parentID, childID) VALUES ((SELECT nodeID FROM NODELIST WHERE name="Computer Science" AND typeID=2), (SELECT nodeID FROM NODELIST WHERE name="Computer Science at Heriot-Watt University" AND typeID=4));
INSERT INTO NODERELATIONLIST (parentID, childID) VALUES ((SELECT nodeID FROM NODELIST WHERE name="Heriot-Watt University" AND typeID=3), (SELECT nodeID FROM NODELIST WHERE name="Computer Science at Heriot-Watt University" AND typeID=4));
INSERT INTO NODERELATIONLIST (parentID, childID) VALUES ((SELECT nodeID FROM NODELIST WHERE name="Computer Science" AND typeID=2), (SELECT nodeID FROM NODELIST WHERE name="Computer Science at Edinburgh University" AND typeID=4));
INSERT INTO NODERELATIONLIST (parentID, childID) VALUES ((SELECT nodeID FROM NODELIST WHERE name="Edinburgh University" AND typeID=3), (SELECT nodeID FROM NODELIST WHERE name="Computer Science at Edinburgh University" AND typeID=4));
INSERT INTO NODERELATIONLIST (parentID, childID) VALUES ((SELECT nodeID FROM NODELIST WHERE name="Computer Science" AND typeID=2), (SELECT nodeID FROM NODELIST WHERE name="Computer Science at Stirling University" AND typeID=4));
INSERT INTO NODERELATIONLIST (parentID, childID) VALUES ((SELECT nodeID FROM NODELIST WHERE name="Stirling University" AND typeID=3), (SELECT nodeID FROM NODELIST WHERE name="Computer Science at Stirling University" AND typeID=4));

INSERT INTO NODERELATIONLIST (parentID, childID) VALUES ((SELECT nodeID FROM NODELIST WHERE name="Information Systems" AND typeID=2), (SELECT nodeID FROM NODELIST WHERE name="Information Systems at Heriot-Watt University" AND typeID=4));
INSERT INTO NODERELATIONLIST (parentID, childID) VALUES ((SELECT nodeID FROM NODELIST WHERE name="Heriot-Watt University" AND typeID=3), (SELECT nodeID FROM NODELIST WHERE name="Information Systems at Heriot-Watt University" AND typeID=4));
INSERT INTO NODERELATIONLIST (parentID, childID) VALUES ((SELECT nodeID FROM NODELIST WHERE name="Information Systems" AND typeID=2), (SELECT nodeID FROM NODELIST WHERE name="Information Systems at Edinburgh University" AND typeID=4));
INSERT INTO NODERELATIONLIST (parentID, childID) VALUES ((SELECT nodeID FROM NODELIST WHERE name="Edinburgh University" AND typeID=3), (SELECT nodeID FROM NODELIST WHERE name="Information Systems at Edinburgh University" AND typeID=4));
INSERT INTO NODERELATIONLIST (parentID, childID) VALUES ((SELECT nodeID FROM NODELIST WHERE name="Information Systems" AND typeID=2), (SELECT nodeID FROM NODELIST WHERE name="Information Systems at Stirling University" AND typeID=4));
INSERT INTO NODERELATIONLIST (parentID, childID) VALUES ((SELECT nodeID FROM NODELIST WHERE name="Stirling University" AND typeID=3), (SELECT nodeID FROM NODELIST WHERE name="Information Systems at Stirling University" AND typeID=4));

INSERT INTO NODERELATIONLIST (parentID, childID) VALUES ((SELECT nodeID FROM NODELIST WHERE name="Computer Systems" AND typeID=2), (SELECT nodeID FROM NODELIST WHERE name="Computer Systems at Heriot-Watt University" AND typeID=4));
INSERT INTO NODERELATIONLIST (parentID, childID) VALUES ((SELECT nodeID FROM NODELIST WHERE name="Heriot-Watt University" AND typeID=3), (SELECT nodeID FROM NODELIST WHERE name="Computer Systems at Heriot-Watt University" AND typeID=4));
INSERT INTO NODERELATIONLIST (parentID, childID) VALUES ((SELECT nodeID FROM NODELIST WHERE name="Computer Systems" AND typeID=2), (SELECT nodeID FROM NODELIST WHERE name="Computer Systems at Edinburgh University" AND typeID=4));
INSERT INTO NODERELATIONLIST (parentID, childID) VALUES ((SELECT nodeID FROM NODELIST WHERE name="Edinburgh University" AND typeID=3), (SELECT nodeID FROM NODELIST WHERE name="Computer Systems at Edinburgh University" AND typeID=4));
INSERT INTO NODERELATIONLIST (parentID, childID) VALUES ((SELECT nodeID FROM NODELIST WHERE name="Computer Systems" AND typeID=2), (SELECT nodeID FROM NODELIST WHERE name="Computer Systems at Stirling University" AND typeID=4));
INSERT INTO NODERELATIONLIST (parentID, childID) VALUES ((SELECT nodeID FROM NODELIST WHERE name="Stirling University" AND typeID=3), (SELECT nodeID FROM NODELIST WHERE name="Computer Systems at Stirling University" AND typeID=4));

INSERT INTO NODERELATIONLIST (parentID, childID) VALUES ((SELECT nodeID FROM NODELIST WHERE name="Chemistry" AND typeID=2), (SELECT nodeID FROM NODELIST WHERE name="Chemistry at Heriot-Watt University" AND typeID=4));
INSERT INTO NODERELATIONLIST (parentID, childID) VALUES ((SELECT nodeID FROM NODELIST WHERE name="Heriot-Watt University" AND typeID=3), (SELECT nodeID FROM NODELIST WHERE name="Chemistry at Heriot-Watt University" AND typeID=4));
INSERT INTO NODERELATIONLIST (parentID, childID) VALUES ((SELECT nodeID FROM NODELIST WHERE name="Chemistry" AND typeID=2), (SELECT nodeID FROM NODELIST WHERE name="Chemistry at Edinburgh University" AND typeID=4));
INSERT INTO NODERELATIONLIST (parentID, childID) VALUES ((SELECT nodeID FROM NODELIST WHERE name="Edinburgh University" AND typeID=3), (SELECT nodeID FROM NODELIST WHERE name="Chemistry at Edinburgh University" AND typeID=4));
INSERT INTO NODERELATIONLIST (parentID, childID) VALUES ((SELECT nodeID FROM NODELIST WHERE name="Chemistry" AND typeID=2), (SELECT nodeID FROM NODELIST WHERE name="Chemistry at Stirling University" AND typeID=4));
INSERT INTO NODERELATIONLIST (parentID, childID) VALUES ((SELECT nodeID FROM NODELIST WHERE name="Stirling University" AND typeID=3), (SELECT nodeID FROM NODELIST WHERE name="Chemistry at Stirling University" AND typeID=4));

INSERT INTO NODERELATIONLIST (parentID, childID) VALUES ((SELECT nodeID FROM NODELIST WHERE name="Pharmaceutical Chemistry" AND typeID=2), (SELECT nodeID FROM NODELIST WHERE name="Pharmaceutical Chemistry at Heriot-Watt University" AND typeID=4));
INSERT INTO NODERELATIONLIST (parentID, childID) VALUES ((SELECT nodeID FROM NODELIST WHERE name="Heriot-Watt University" AND typeID=3), (SELECT nodeID FROM NODELIST WHERE name="Pharmaceutical Chemistry at Heriot-Watt University" AND typeID=4));
INSERT INTO NODERELATIONLIST (parentID, childID) VALUES ((SELECT nodeID FROM NODELIST WHERE name="Pharmaceutical Chemistry" AND typeID=2), (SELECT nodeID FROM NODELIST WHERE name="Pharmaceutical Chemistry at Edinburgh University" AND typeID=4));
INSERT INTO NODERELATIONLIST (parentID, childID) VALUES ((SELECT nodeID FROM NODELIST WHERE name="Edinburgh University" AND typeID=3), (SELECT nodeID FROM NODELIST WHERE name="Pharmaceutical Chemistry at Edinburgh University" AND typeID=4));
INSERT INTO NODERELATIONLIST (parentID, childID) VALUES ((SELECT nodeID FROM NODELIST WHERE name="Pharmaceutical Chemistry" AND typeID=2), (SELECT nodeID FROM NODELIST WHERE name="Pharmaceutical Chemistry at Stirling University" AND typeID=4));
INSERT INTO NODERELATIONLIST (parentID, childID) VALUES ((SELECT nodeID FROM NODELIST WHERE name="Stirling University" AND typeID=3), (SELECT nodeID FROM NODELIST WHERE name="Pharmaceutical Chemistry at Stirling University" AND typeID=4));

INSERT INTO NODERELATIONLIST (parentID, childID) VALUES ((SELECT nodeID FROM NODELIST WHERE name="Computational Chemistry" AND typeID=2), (SELECT nodeID FROM NODELIST WHERE name="Computational Chemistry at Heriot-Watt University" AND typeID=4));
INSERT INTO NODERELATIONLIST (parentID, childID) VALUES ((SELECT nodeID FROM NODELIST WHERE name="Heriot-Watt University" AND typeID=3), (SELECT nodeID FROM NODELIST WHERE name="Computational Chemistry at Heriot-Watt University" AND typeID=4));
INSERT INTO NODERELATIONLIST (parentID, childID) VALUES ((SELECT nodeID FROM NODELIST WHERE name="Computational Chemistry" AND typeID=2), (SELECT nodeID FROM NODELIST WHERE name="Computational Chemistry at Edinburgh University" AND typeID=4));
INSERT INTO NODERELATIONLIST (parentID, childID) VALUES ((SELECT nodeID FROM NODELIST WHERE name="Edinburgh University" AND typeID=3), (SELECT nodeID FROM NODELIST WHERE name="Computational Chemistry at Edinburgh University" AND typeID=4));
INSERT INTO NODERELATIONLIST (parentID, childID) VALUES ((SELECT nodeID FROM NODELIST WHERE name="Computational Chemistry" AND typeID=2), (SELECT nodeID FROM NODELIST WHERE name="Computational Chemistry at Stirling University" AND typeID=4));
INSERT INTO NODERELATIONLIST (parentID, childID) VALUES ((SELECT nodeID FROM NODELIST WHERE name="Stirling University" AND typeID=3), (SELECT nodeID FROM NODELIST WHERE name="Computational Chemistry at Stirling University" AND typeID=4));

INSERT INTO NODERELATIONLIST (parentID, childID) VALUES ((SELECT nodeID FROM NODELIST WHERE name="Mathematics" AND typeID=2), (SELECT nodeID FROM NODELIST WHERE name="Mathematics at Heriot-Watt University" AND typeID=4));
INSERT INTO NODERELATIONLIST (parentID, childID) VALUES ((SELECT nodeID FROM NODELIST WHERE name="Heriot-Watt University" AND typeID=3), (SELECT nodeID FROM NODELIST WHERE name="Mathematics at Heriot-Watt University" AND typeID=4));
INSERT INTO NODERELATIONLIST (parentID, childID) VALUES ((SELECT nodeID FROM NODELIST WHERE name="Mathematics" AND typeID=2), (SELECT nodeID FROM NODELIST WHERE name="Mathematics at Edinburgh University" AND typeID=4));
INSERT INTO NODERELATIONLIST (parentID, childID) VALUES ((SELECT nodeID FROM NODELIST WHERE name="Edinburgh University" AND typeID=3), (SELECT nodeID FROM NODELIST WHERE name="Mathematics at Edinburgh University" AND typeID=4));
INSERT INTO NODERELATIONLIST (parentID, childID) VALUES ((SELECT nodeID FROM NODELIST WHERE name="Mathematics" AND typeID=2), (SELECT nodeID FROM NODELIST WHERE name="Mathematics at Stirling University" AND typeID=4));
INSERT INTO NODERELATIONLIST (parentID, childID) VALUES ((SELECT nodeID FROM NODELIST WHERE name="Stirling University" AND typeID=3), (SELECT nodeID FROM NODELIST WHERE name="Mathematics at Stirling University" AND typeID=4));

INSERT INTO NODERELATIONLIST (parentID, childID) VALUES ((SELECT nodeID FROM NODELIST WHERE name="Statistical Modelling" AND typeID=2), (SELECT nodeID FROM NODELIST WHERE name="Statistical Modelling at Heriot-Watt University" AND typeID=4));
INSERT INTO NODERELATIONLIST (parentID, childID) VALUES ((SELECT nodeID FROM NODELIST WHERE name="Heriot-Watt University" AND typeID=3), (SELECT nodeID FROM NODELIST WHERE name="Statistical Modelling at Heriot-Watt University" AND typeID=4));
INSERT INTO NODERELATIONLIST (parentID, childID) VALUES ((SELECT nodeID FROM NODELIST WHERE name="Statistical Modelling" AND typeID=2), (SELECT nodeID FROM NODELIST WHERE name="Statistical Modelling at Edinburgh University" AND typeID=4));
INSERT INTO NODERELATIONLIST (parentID, childID) VALUES ((SELECT nodeID FROM NODELIST WHERE name="Edinburgh University" AND typeID=3), (SELECT nodeID FROM NODELIST WHERE name="Statistical Modelling at Edinburgh University" AND typeID=4));
INSERT INTO NODERELATIONLIST (parentID, childID) VALUES ((SELECT nodeID FROM NODELIST WHERE name="Statistical Modelling" AND typeID=2), (SELECT nodeID FROM NODELIST WHERE name="Statistical Modelling at Stirling University" AND typeID=4));
INSERT INTO NODERELATIONLIST (parentID, childID) VALUES ((SELECT nodeID FROM NODELIST WHERE name="Stirling University" AND typeID=3), (SELECT nodeID FROM NODELIST WHERE name="Statistical Modelling at Stirling University" AND typeID=4));

INSERT INTO NODERELATIONLIST (parentID, childID) VALUES ((SELECT nodeID FROM NODELIST WHERE name="Financial Mathematics" AND typeID=2), (SELECT nodeID FROM NODELIST WHERE name="Financial Mathematics at Heriot-Watt University" AND typeID=4));
INSERT INTO NODERELATIONLIST (parentID, childID) VALUES ((SELECT nodeID FROM NODELIST WHERE name="Heriot-Watt University" AND typeID=3), (SELECT nodeID FROM NODELIST WHERE name="Financial Mathematics at Heriot-Watt University" AND typeID=4));
INSERT INTO NODERELATIONLIST (parentID, childID) VALUES ((SELECT nodeID FROM NODELIST WHERE name="Financial Mathematics" AND typeID=2), (SELECT nodeID FROM NODELIST WHERE name="Financial Mathematics at Edinburgh University" AND typeID=4));
INSERT INTO NODERELATIONLIST (parentID, childID) VALUES ((SELECT nodeID FROM NODELIST WHERE name="Edinburgh University" AND typeID=3), (SELECT nodeID FROM NODELIST WHERE name="Financial Mathematics at Edinburgh University" AND typeID=4));
INSERT INTO NODERELATIONLIST (parentID, childID) VALUES ((SELECT nodeID FROM NODELIST WHERE name="Financial Mathematics" AND typeID=2), (SELECT nodeID FROM NODELIST WHERE name="Financial Mathematics at Stirling University" AND typeID=4));
INSERT INTO NODERELATIONLIST (parentID, childID) VALUES ((SELECT nodeID FROM NODELIST WHERE name="Stirling University" AND typeID=3), (SELECT nodeID FROM NODELIST WHERE name="Financial Mathematics at Stirling University" AND typeID=4));

INSERT INTO NODERELATIONLIST (parentID, childID) VALUES ((SELECT nodeID FROM NODELIST WHERE name="Biology" AND typeID=2), (SELECT nodeID FROM NODELIST WHERE name="Biology at Heriot-Watt University" AND typeID=4));
INSERT INTO NODERELATIONLIST (parentID, childID) VALUES ((SELECT nodeID FROM NODELIST WHERE name="Heriot-Watt University" AND typeID=3), (SELECT nodeID FROM NODELIST WHERE name="Biology at Heriot-Watt University" AND typeID=4));
INSERT INTO NODERELATIONLIST (parentID, childID) VALUES ((SELECT nodeID FROM NODELIST WHERE name="Biology" AND typeID=2), (SELECT nodeID FROM NODELIST WHERE name="Biology at Edinburgh University" AND typeID=4));
INSERT INTO NODERELATIONLIST (parentID, childID) VALUES ((SELECT nodeID FROM NODELIST WHERE name="Edinburgh University" AND typeID=3), (SELECT nodeID FROM NODELIST WHERE name="Biology at Edinburgh University" AND typeID=4));
INSERT INTO NODERELATIONLIST (parentID, childID) VALUES ((SELECT nodeID FROM NODELIST WHERE name="Biology" AND typeID=2), (SELECT nodeID FROM NODELIST WHERE name="Biology at Stirling University" AND typeID=4));
INSERT INTO NODERELATIONLIST (parentID, childID) VALUES ((SELECT nodeID FROM NODELIST WHERE name="Stirling University" AND typeID=3), (SELECT nodeID FROM NODELIST WHERE name="Biology at Stirling University" AND typeID=4));

INSERT INTO NODERELATIONLIST (parentID, childID) VALUES ((SELECT nodeID FROM NODELIST WHERE name="Theoretical Physics" AND typeID=2), (SELECT nodeID FROM NODELIST WHERE name="Theoretical Physics at Heriot-Watt University" AND typeID=4));
INSERT INTO NODERELATIONLIST (parentID, childID) VALUES ((SELECT nodeID FROM NODELIST WHERE name="Heriot-Watt University" AND typeID=3), (SELECT nodeID FROM NODELIST WHERE name="Theoretical Physics at Heriot-Watt University" AND typeID=4));
INSERT INTO NODERELATIONLIST (parentID, childID) VALUES ((SELECT nodeID FROM NODELIST WHERE name="Theoretical Physics" AND typeID=2), (SELECT nodeID FROM NODELIST WHERE name="Theoretical Physics at Edinburgh University" AND typeID=4));
INSERT INTO NODERELATIONLIST (parentID, childID) VALUES ((SELECT nodeID FROM NODELIST WHERE name="Edinburgh University" AND typeID=3), (SELECT nodeID FROM NODELIST WHERE name="Theoretical Physics at Edinburgh University" AND typeID=4));
INSERT INTO NODERELATIONLIST (parentID, childID) VALUES ((SELECT nodeID FROM NODELIST WHERE name="Theoretical Physics" AND typeID=2), (SELECT nodeID FROM NODELIST WHERE name="Theoretical Physics at Stirling University" AND typeID=4));
INSERT INTO NODERELATIONLIST (parentID, childID) VALUES ((SELECT nodeID FROM NODELIST WHERE name="Stirling University" AND typeID=3), (SELECT nodeID FROM NODELIST WHERE name="Theoretical Physics at Stirling University" AND typeID=4));




INSERT INTO NODEDESCRIPTIONLIST (nodeID, description) VALUES ((SELECT nodeID FROM NODELIST WHERE name="Heriot-Watt University" AND typeID=3) ,"University based in the west of Edinbugh. Named after George Heriot and James Watt.");




INSERT INTO USERLIST (username, password, email, active, resetToken, resetComplete) VALUES ("ab123","qwerty","test1@test.test","YES","0","0");
INSERT INTO USERLIST (username, password, email, active, resetToken, resetComplete) VALUES ("or385","melons","test2@test.test","YES","0","0");
INSERT INTO USERLIST (username, password, email, active, resetToken, resetComplete) VALUES ("ng957","twenty","test3@test.test","YES","0","0");
INSERT INTO USERLIST (username, password, email, active, resetToken, resetComplete) VALUES ("ug456","little","test4@test.test","YES","0","0");
INSERT INTO USERLIST (username, password, email, active, resetToken, resetComplete) VALUES ("og975","bleeps","test5@test.test","YES","0","0");




SET @user=0;
SET @courselocation=0;
SET @user=(SELECT userID FROM USERLIST WHERE username="ab123");
SET @courselocation=(SELECT nodeID FROM NODELIST WHERE name="Computational Chemistry at Heriot-Watt University" AND typeID=4);
INSERT INTO USERNODELIST (userID, nodeID) VALUES (@user, @courselocation);
INSERT INTO GRADELIST (userNodeID, grade) VALUES ((SELECT userNodeID FROM USERNODELIST WHERE userID=@user AND nodeID=@courselocation), 1);
SET @user=0;
SET @courselocation=0;

SET @user=(SELECT userID FROM USERLIST WHERE username="or385");
SET @courselocation=(SELECT nodeID FROM NODELIST WHERE name="Information Systems at Stirling University" AND typeID=4);
INSERT INTO USERNODELIST (userID, nodeID) VALUES (@user, @courselocation);
INSERT INTO GRADELIST (userNodeID, grade) VALUES ((SELECT userNodeID FROM USERNODELIST WHERE userID=@user AND nodeID=@courselocation), 1);
SET @user=0;
SET @courselocation=0;

SET @user=(SELECT userID FROM USERLIST WHERE username="ng957");
SET @courselocation=(SELECT nodeID FROM NODELIST WHERE name="Statistical Modelling at Edinburgh University" AND typeID=4);
INSERT INTO USERNODELIST (userID, nodeID) VALUES (@user, @courselocation);
INSERT INTO GRADELIST (userNodeID, grade) VALUES ((SELECT userNodeID FROM USERNODELIST WHERE userID=@user AND nodeID=@courselocation), 1);
SET @user=0;
SET @courselocation=0;

SET @user=(SELECT userID FROM USERLIST WHERE username="ug456");
SET @courselocation=(SELECT nodeID FROM NODELIST WHERE name="Computer Systems at Edinburgh University" AND typeID=4);
INSERT INTO USERNODELIST (userID, nodeID) VALUES (@user, @courselocation);
INSERT INTO GRADELIST (userNodeID, grade) VALUES ((SELECT userNodeID FROM USERNODELIST WHERE userID=@user AND nodeID=@courselocation), 2);
SET @user=0;
SET @courselocation=0;

SET @user=(SELECT userID FROM USERLIST WHERE username="og975");
SET @courselocation=(SELECT nodeID FROM NODELIST WHERE name="Financial Mathematics at Heriot-Watt University" AND typeID=4);
INSERT INTO USERNODELIST (userID, nodeID) VALUES (@user, @courselocation);
INSERT INTO GRADELIST (userNodeID, grade) VALUES ((SELECT userNodeID FROM USERNODELIST WHERE userID=@user AND nodeID=@courselocation), 1);
SET @user=0;
SET @courselocation=0;



