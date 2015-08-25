%   First let's take the ZT30 compressor and draw intelligent plots for it

%   Get the column names
ColNames = zt30.Properties.VarNames;
ColNames = transpose(ColNames);

x = zt30.TimeMatlab;
 

y1a = zt30.MachineRunningMatlab;
y1b = zt30.CompressorOutlet_P_Bar;
y1c = zt30.OilPressure_Bar;
y1d = zt30.IntercoolerPressure_Bar;

y2a = zt30.Element1Outlet_C;
y2b = zt30.Element2Inlet_C;
y2c = zt30.Element2Outlet_C;

%plot(x,y1b,x,y1c,x,y1d,x,y2a,x,y2b,x,y2c)
[ax, h1, h2] = plotyy(x, [y1a, y1b, y1c, y1d], x, [y2a, y2b, y2c]);

leg1 = 'Machine Running';
leg2 = 'Compressor Outlet Pressure';
leg3 = 'Oil Pressure';
leg4 = 'Intercooler Pressure';
leg5 = 'Element 1 Outlet Temperature';
leg6 = 'Element 2 Inlet Temperature';
leg7 = 'Element 2 Outlet Temperature';

myLegend = {leg1, leg2, leg3, leg4, leg5, leg6, leg7};

legend(myLegend)

title('ZT30 Fixed Speed Compressor')
xlabel('Time');
ylabel(ax(1),'Pressure (Bar)')
ylabel(ax(2),'Temperature (^{\circ}C)')

 %%
    date_frmt = 'dd-mmm-yyyy HH:MM:SS';
    beginTime= datestr(zt30.TimeMatlab(1)); 
    finishTime = datestr(zt30.TimeMatlab(end-1)); 
    %%
  
    
    %%
    set(ax(1),'XLim', ... 
         [datenum(beginTime,date_frmt),datenum(finishTime,date_frmt)]) 
    set(ax(2),'XLim', ... 
         [datenum(beginTime,date_frmt),datenum(finishTime,date_frmt)]) 



