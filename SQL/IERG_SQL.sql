/*
# delete tables
DROP TABLE `ucc_ierg`.`cd170`;
DROP TABLE `ucc_ierg`.`zt30`;
DROP TABLE `ucc_ierg`.`zt37vsd`;

*/


#create table for cd170 dryer. Needs P_id as primary key to be able to work with data in Excel
CREATE TABLE `ucc_ierg`.`cd170` (P_Id int NOT NULL, `YYYY-MM-DD HH:MM:SS Time` datetime, `Machine Running` text, `Vessel A (Bar)` double,
 `Vessel B (Bar)` double, `Inlet Dryer (degC)` double, `Dryer P Dewpoint (degC)` double, 
 `Emergency Stop` text, `Rem. Start/Stop` text, `Running Hours` double, `Module Hours` double, PRIMARY KEY (P_Id));

CREATE TABLE `ucc_ierg`.`zt30` (P_Id int NOT NULL, `YYYY-MM-DD HH:MM:SS Time` datetime,	`Machine Running` text,	
`Compressor Outlet (Bar)` double, `Oil Pressure (Bar)` double,	`Intercooler (Bar)` double,	`Element 1 Outlet (degC)` double,
`Element 2 Inlet (degC)` double, `Element 2 Outlet (degC)` double,	`Emergency Stop` text,	`Remote Start/Stop` text,
`Remote Load/Unload` text, `Remote Pressure Sensing` text,	`Overload Motor` text,	`Overload Fanmotor` text,
`PB1 open / PB2 closed` text, `Running Hours` double,	`Loaded Hours` double,	`Motor Starts` double,	`Module Hours` double,
`Load Relay` double, `Dryer Starts` double, PRIMARY KEY (P_Id));

CREATE TABLE `ucc_ierg`.`zt37vsd` (P_Id int NOT NULL, `YYYY-MM-DD HH:MM:SS Time` datetime,	`Machine Running` text,
`Compressor Outlet Pressure (Bar)` double,	`Oil Pressure (Bar)` double,	`Intercooler Pressure (Bar)` double, 
`Element 1 Outlet (degC)` double,	`Element 2 Outlet (degC)` double,	`Converter Cabinet Temp (degC)` double,
`Emergency Stop` text,	`Remote Start/Stop` text,	`Overload Fanmotor` text,	`PB1 open / PB2 closed` text,
`Running Hours` double,	`Motor Starts` double,	`Module Hours` double,	`Accumulated Volume` double,	`Load Relay` double,
`VSD 1-20% RPM` double,	`VSD 20-40% RPM` double, `VSD 40-60% RPM` double,	`VSD 60-80% RPM` double,	`VSD 80-100% RPM` double,
`Dryer Starts` double,	`Fan Starts` double, PRIMARY KEY (P_Id));



# basic queries
# SELECT * FROM cd170;
# SELECT COUNT(*) FROM cd170;