mydata = importdata('NUMBERS2.dat');

disp(mydata(1));

for i = 2:length(mydata)
    myproduct = mydata(i) * (mydata(i-1));
    
    if myproduct < 0
        disp(mydata(i));
        break;
    end
    
    if myproduct > 0
        disp(mydata(i));
    end
        
    
end
