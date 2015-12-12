%  Try kmeans with K set to 3 to try to identify unloaded and
%   unloaded and idle modes

%set starting positions for reproducibility
starting_centroids = [21 8 1];
starting_centroids = starting_centroids';

[idx_kw_3, centroids_kw_3] = kmeans(TestDataMatlab.KW, 3, 'Start', starting_centroids);


scatter(TestDataMatlab.ID,TestDataMatlab.KW,[],idx_kw_3,'x');
colormap jet;

title('3-Means Clustering of Compressor Power')
xlabel('Point ID')
ylabel('kW')

centroid_colors = [1:3]';

hold on
xval_centroids = ones(3,1)*(757/2);
scatter(xval_centroids,centroids_kw_3,500,colors,'filled');
text(xval_centroids(1)+50,centroids_kw_3(1),sprintf('c^{(1)} = %0.1f ', centroids_kw_3(1)),'BackgroundColor','w', ...
    'EdgeColor','k');
text(xval_centroids(1)+50,centroids_kw_3(2),sprintf('c^{(2)} = %0.1f ', centroids_kw_3(2)),...
    'BackgroundColor','w', 'EdgeColor','k');
text(xval_centroids(1)+50,centroids_kw_3(3),sprintf('c^{(3)} = %0.1f ', centroids_kw_3(3)),...
    'BackgroundColor','w', 'EdgeColor','k');

hold off
%axis square;
