clf

%   Reciprocating
x = [10, 1000, 700, 40, 10];
y = [0.1, 0.1, 30, 200, 200];
c = [1 0.8 0.3];
fill(x, y, 'b', 'FaceAlpha', 0.4)

set(gca,'xscale','log');
set(gca,'yscale','log');

hold on

%   Centrifugal
x = [600, 30000, 30000, 25000, 600];
y = [0.1, 0.1, 10, 40, 40];
c = [1 0.8 0.3];
h_centrif = fill(x, y, 'g', 'FaceAlpha', 0.4);
%   set(h_centrif, 'LineStyle', '--');

% Rotary
x = [10, 4000, 4000, 2000, 20, 10];
y = [0.1, 0.1, 10, 15, 15, 10];
c = [1 0.8 0.3];
fill(x, y, c, 'FaceAlpha', 0.4)

axis square;

xlabel('Compressor Capacity (l/s)')
ylabel('Pressure (bar)')
title('Compressor Application Ranges')

text(30, 2, 'Rotary', 'EdgeColor', 'black', 'BackgroundColor', 'white');
text(20, 40, 'Reciprocating', 'EdgeColor', 'black', 'BackgroundColor', 'white');
text(3000, 25, 'Centrifugal', 'EdgeColor', 'black', 'BackgroundColor', 'white');