%  Try kmeans with K set to 3 to try to identify unloaded and
%   unloaded and idle modes

%set starting positions for reproducibility
%starting_centroids = [21 8 1];
%starting_centroids = starting_centroids';

% 5-Means Clustering Visualisation
% ModeIdentificationK5.m

[idx_kw_5, centroids_kw_5] = kmeans(TestDataMatlab.KW, 5);%, 'Start', starting_centroids);


scatter(TestDataMatlab.ID,TestDataMatlab.KW,[],idx_kw_5,'x');
colormap jet;

title('5-Means Clustering of Compressor Power')
xlabel('Point ID')
ylabel('kW')

centroid_colors = [1:5]';

hold on
xval_centroids = ones(5,1)*(757/2);
scatter(xval_centroids,centroids_kw_5,500,centroid_colors,'filled');
text(xval_centroids(1)+50,centroids_kw_5(1),sprintf('c^{(1)} = %0.1f ', centroids_kw_5(1)),'BackgroundColor','w', ...
    'EdgeColor','k');
text(xval_centroids(1)+50,centroids_kw_5(2),sprintf('c^{(2)} = %0.1f ', centroids_kw_5(2)),...
    'BackgroundColor','w', 'EdgeColor','k');
text(xval_centroids(1)+50,centroids_kw_5(3),sprintf('c^{(3)} = %0.1f ', centroids_kw_5(3)),...
    'BackgroundColor','w', 'EdgeColor','k');
text(xval_centroids(1)+50,centroids_kw_5(4),sprintf('c^{(4)} = %0.1f ', centroids_kw_5(4)),...
    'BackgroundColor','w', 'EdgeColor','k');
text(xval_centroids(1)+50,centroids_kw_5(5),sprintf('c^{(5)} = %0.1f ', centroids_kw_5(5)),...
    'BackgroundColor','w', 'EdgeColor','k');

hold off
axis square;
