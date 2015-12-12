%   First try kmeans with K set to 2 to try to identify unloaded and
%   unloaded

[idx_kw_2, centroids_kw_2] = kmeans(TestDataMatlab.KW, 2);

for i = 1:height(TestDataMatlab)
   if idx_kw_2(i) == 1
       TestDataMatlab.Color2K(i) = 'r';
   elseif idx_kw_2(i) == 2
       TestDataMatlab.Color2K(i) = 'b';
   end
end

scatter(TestDataMatlab.ID,TestDataMatlab.KW,[],idx_kw_2,'x');
colormap jet;

title('2-Means Clustering of Compressor Power')
xlabel('Point ID')
ylabel('kW')

hold on
xval_centroids = ones(2,1)*(757/2);
scatter(xval_centroids,centroids_kw_2,500,[1:2],'filled');
text(xval_centroids(1)+50,centroids_kw_2(1),sprintf('c^{(1)} = %0.1f ', centroids_kw_2(1)),'BackgroundColor','w', ...
    'EdgeColor','k');
text(xval_centroids(1)+50,centroids_kw_2(2),sprintf('c^{(2)} = %0.1f ', centroids_kw_2(2)),...
    'BackgroundColor','w', 'EdgeColor','k');
axis square;
