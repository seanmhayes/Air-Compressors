%Set preferences with setdbprefs.
setdbprefs('DataReturnFormat', 'cellarray');
setdbprefs('NullNumberRead', 'NaN');
setdbprefs('NullStringRead', 'null');


%Make connection to database.  Note that the password has been omitted.
%Using JDBC driver.
conn = database('', 'b4eff1157b749e', '3ebce275', 'Vendor', 'MYSQL', 'Server', 'eu-cdbr-azure-west-c.cloudapp.net', 'PortNumber', 3306);

%Read data from database.
curs = exec(conn, ['SELECT 	zt37vsd.P_Id'...
    ' ,	zt37vsd.Time'...
    ' ,	zt37vsd.MachineRunning'...
    ' ,	zt37vsd.CompressorOutletP_Bar'...
    ' ,	zt37vsd.OilPressure_Bar'...
    ' ,	zt37vsd.IntercoolerPressure_Bar'...
    ' ,	zt37vsd.Element1Outlet_C'...
    ' ,	zt37vsd.Element2Outlet_C'...
    ' ,	zt37vsd.ConverterCabinetTemp_C'...
    ' ,	zt37vsd.EmergencyStop'...
    ' ,	zt37vsd.Remote_StartStop'...
    ' ,	zt37vsd.OverloadFanmotor'...
    ' ,	zt37vsd.PB1open_PB2closed'...
    ' ,	zt37vsd.RunningHours'...
    ' ,	zt37vsd.MotorStarts'...
    ' ,	zt37vsd.ModuleHours'...
    ' ,	zt37vsd.AccumulatedVolume'...
    ' ,	zt37vsd.LoadRelay'...
    ' ,	zt37vsd.VSD1_20_RPM'...
    ' ,	zt37vsd.VSD20_40_RPM'...
    ' ,	zt37vsd.VSD40_60_RPM'...
    ' ,	zt37vsd.VSD60_80_RPM'...
    ' ,	zt37vsd.VSD_80_100_RPM'...
    ' ,	zt37vsd.DryerStarts'...
    ' ,	zt37vsd.FanStarts'...
    ' FROM 	ucc_ierg.zt37vsd ']);

curs = fetch(curs);
close(curs);

%Assign data to output variable
zt37vsd = curs.Data;

%Close database connection.
close(conn);

%Clear variables
clear curs conn