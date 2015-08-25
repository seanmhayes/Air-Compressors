x = 0:0.1:2*pi;
y1 = sin(x);
y2 = cos(x);
y3 = tan(x);
[ax, h1, h2] = plotyy(x, [y1.' y2.'], x, y3);