[idx_kw_2, centroids_kw_2] = kmeans(TestDataMatlab.KW, 2);

scatter(TestDataMatlab.ID,TestDataMatlab.KW,[],idx_kw_2);
