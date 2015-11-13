rel_power = [TestDataMatlab.KW, TestDataMatlab.I1, TestDataMatlab.I2, ...
    TestDataMatlab.I3];
for i = 1:10
    [my_cluster_idx, my_cluster_c] = kmeans(rel_power, i);
    subplot(5,2,i), scatter(rel_power(:,1),rel_power(:,2),[], my_cluster_idx);
    hold on
    c = linspace(1,i,size(my_cluster_c,1));
    c = c';
    scatter(my_cluster_c(:,1),my_cluster_c(:,2),1000,c,'x')
    i_str = num2str(i);
    title_string = strcat(i_str, ' Clusters');
    title(title_string);
    grid on;
    grid minor;
end


