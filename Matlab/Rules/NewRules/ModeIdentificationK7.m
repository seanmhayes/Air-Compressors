%  Try kmeans with K set to 3 to try to identify unloaded and
%   unloaded and idle modes

%set starting positions for reproducibility
%starting_centroids = [21 8 1];
%starting_centroids = starting_centroids';

[idx_kw_7, centroids_kw_7] = kmeans(TestDataMatlab.KW, 7);%, 'Start', starting_centroids);


scatter(TestDataMatlab.ID,TestDataMatlab.KW,[],idx_kw_7,'x');
colormap jet;

title('7-Means Clustering of Compressor Power')
xlabel('Point ID')
ylabel('kW')

centroid_colors = [1:7]';

hold on
xval_centroids = ones(7,1)*(757/2);
scatter(xval_centroids,centroids_kw_7,500,centroid_colors,'filled');
text(xval_centroids(1)+50,centroids_kw_7(1),sprintf('c^{(1)} = %0.1f ', centroids_kw_7(1)),'BackgroundColor','w', ...
    'EdgeColor','k');
text(xval_centroids(1)+50,centroids_kw_7(2),sprintf('c^{(2)} = %0.1f ', centroids_kw_7(2)),...
    'BackgroundColor','w', 'EdgeColor','k');
text(xval_centroids(1)+50,centroids_kw_7(3),sprintf('c^{(3)} = %0.1f ', centroids_kw_7(3)),...
    'BackgroundColor','w', 'EdgeColor','k');
text(xval_centroids(1)+50,centroids_kw_7(4),sprintf('c^{(4)} = %0.1f ', centroids_kw_7(4)),...
    'BackgroundColor','w', 'EdgeColor','k');
text(xval_centroids(1)+50,centroids_kw_7(5),sprintf('c^{(5)} = %0.1f ', centroids_kw_7(5)),...
    'BackgroundColor','w', 'EdgeColor','k');
text(xval_centroids(1)+50,centroids_kw_7(6),sprintf('c^{(6)} = %0.1f ', centroids_kw_7(6)),...
    'BackgroundColor','w', 'EdgeColor','k');
text(xval_centroids(1)+50,centroids_kw_7(7),sprintf('c^{(7)} = %0.1f ', centroids_kw_7(7)),...
    'BackgroundColor','w', 'EdgeColor','k');

hold off
axis square;
