%   First let's take the ZT37VSD compressor and draw intelligent plots for it

%   Get the column names
ColNames = zt37vsd.Properties.VarNames;
ColNames = transpose(ColNames);

x = zt37vsd.TimeMatlab;
 

y1a = zt37vsd.MachineRunningMatlab;
y1b = zt37vsd.CompressorOutletP_Bar;
y1c = zt37vsd.OilPressure_Bar;
y1d = zt37vsd.IntercoolerPressure_Bar;

y2a = zt37vsd.Element1Outlet_C;
y2b = zt37vsd.Element2_InletTemp;
y2c = zt37vsd.Element2Outlet_C;
y2d = zt37vsd.ConverterCabinetTemp_C;

%plot(x,y1b,x,y1c,x,y1d,x,y2a,x,y2b,x,y2c)
[ax, h1, h2] = plotyy(x, [y1a, y1b, y1c, y1d], x, [y2a, y2b, y2c, y2d]);

leg1 = 'Machine Running';
leg2 = 'Compressor Outlet Pressure';
leg3 = 'Oil Pressure';
leg4 = 'Intercooler Pressure';
leg5 = 'Element 1 Outlet Temperature';
leg6 = 'Element 2 Inlet Temperature';
leg7 = 'Element 2 Outlet Temperature';
leg8 = 'Converter Cabinet Temperature';

myLegend = {leg1, leg2, leg3, leg4, leg5, leg6, leg7, leg8};

legend(myLegend)

title('ZT37VSD Fixed Speed Compressor')
xlabel('Time');
ylabel(ax(1),'Pressure (Bar)')
ylabel(ax(2),'Temperature (^{\circ}C)')

 %%
    date_frmt = 'dd-mmm-yyyy HH:MM:SS';
    beginTime= datestr(zt37vsd.TimeMatlab(1)); 
    finishTime = datestr(zt37vsd.TimeMatlab(end-1)); 
    %%
  
    
    %%
    set(ax(1),'XLim', ... 
         [datenum(beginTime,date_frmt),datenum(finishTime,date_frmt)]) 
    set(ax(2),'XLim', ... 
         [datenum(beginTime,date_frmt),datenum(finishTime,date_frmt)]) 



