%Funkcja ta odpowiedzialna jest za stworzenie 2 wykresów w jedym oknie.
%Jeden z nich to macierz zgodnoœci przed przepuszczeniem przez filtr, drugi
%po przepuszczeniu przez filtr. Aby wykres po przefiltrowaniu zawiera³
%tylko faktyczne miejsca, gdzie wystêpowa³a przed filtrowaniem zgodnoœæ,
%na macierzy wejœciowej i porównawczej stosowany jest operator &, który
%powoduje, ¿e ostatecznie na wykresie widzimy jedynie czêœæ wspóln¹ obu
%macierzy.
function [] = makingPlots(plot, compareMatrix, label1, label2)
filtered = plot & compareMatrix;

figure
subplot(1,2,1)
spy(plot);
xlabel(label1);
ylabel(label2);
title('Matrix before Filter')

subplot(1,2,2)
spy(filtered);
xlabel(label1);
ylabel(label2);
title('Matrix after Filter')
end