close(gcf)

figure

% axis([0 100000 0 100])
xlim([0 100000]);
ylim([0 100])
set(gca,'xscale','log');
set(gca,'yscale','log');

%    rectangle('Position',[0 0 1000 100])
rectangle('Position',[1 2 800 90],'FaceColor','r')
axis([0 100000 0 100])

rectangle('Position',[700 2 50000 60],'FaceColor','g')

rectangle('Position',[1 2 4000 45],'LineStyle','--')

xlabel('Compressor Capacity (l/s)')
ylabel('Pressure (bar)')
title('Compressor Application Ranges')

annotation('textbox', [0.2,0.4,0.1,0.1], 'BackgroundColor', 'w','String', 'Rotary');
annotation('textbox', [0.2,0.8,0.1,0.1], 'BackgroundColor', 'w','String', 'Reciprocating');
annotation('textbox', [0.7,0.6,0.1,0.1], 'BackgroundColor', 'w','String', 'Centrifugal');