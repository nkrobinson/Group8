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
