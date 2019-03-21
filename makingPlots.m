function []= makingPlots(plot, compareMatrix, label1, label2)
filtered=and(compareMatrix,plot);
figure
subplot(1,2,1)
spy(plot);
xlabel (label1);
ylabel(label2);
title('Matrix before Filter')
subplot(1,2,2)
spy(filtered);
xlabel (label1);
ylabel(label2);
title('Matrix after Filter')


end