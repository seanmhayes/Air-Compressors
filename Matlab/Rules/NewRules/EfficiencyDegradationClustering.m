clf;

starting_centroids = [1 8 20 27 44];
starting_centroids = starting_centroids';

for i  =10:height(TestDataMatlab)
    [idx_running5, centroids_running5] = kmeans(TestDataMatlab.KW(1:i),5, 'Start', starting_centroids);
    for j = 1:5
        TestDataMatlab.Centroids(i,j) = centroids_running5(j);
    end
end

for k = 1:5
    plot(TestDataMatlab.Centroids(:,k));
    hold on
end

legend('c^{(1)}', 'c^{(2)}', 'c^{(3)}', 'c^{(4)}', 'c^{(5)}');
xlabel('Point ID');
ylabel('kW');
title('Clustering for Efficiency Monitoring');
grid on;
grid minor;
axis square;
