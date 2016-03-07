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
