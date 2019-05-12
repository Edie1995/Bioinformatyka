%Funkcja ta ma za zadanie na podstawie dw�ch sekwencji wczytanych ze strony
%lub z klawiatury, wygenerowanie macierzy dwu wymiarowej, kt�ra w miejscu
%zgodno�ci danych wej�cioweych b�dzie podawa�a 1 jako prawda, pozosta�e
%miejsca (miejsca niezgodno�ci) zostan� wype�nione 0.
function dots = createDotPlot(sequence1,sequence2)
x = length(sequence1);
y = length(sequence2);
dots = zeros(x,y);
for i = 1:x
    for j = 1:y
        if(sequence1(i) == sequence2(j))
            dots(i,j) = 1;
        end
    end
end
end
