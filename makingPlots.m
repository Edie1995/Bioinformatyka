%Funkcja ta odpowiedzialna jest za stworzenie 2 wykres�w w jedym oknie.
%Jeden z nich to macierz zgodno�ci przed przepuszczeniem przez filtr, drugi
%po przepuszczeniu przez filtr. Aby wykres po przefiltrowaniu zawiera�
%tylko faktyczne miejsca, gdzie wyst�powa�a przed filtrowaniem zgodno��,
%na macierzy wej�ciowej i por�wnawczej stosowany jest operator &, kt�ry
%powoduje, �e ostatecznie na wykresie widzimy jedynie cz�� wsp�ln� obu
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