%Funkcja ta ma za zadanie na podstawie dw�ch sekwencji wczytanych ze strony
%lub z klawiatury, wygenerowanie macierzy dwu wymiarowej, kt�ra w miejscu
%zgodno�ci danych wej�cioweych b�dzie podawa�a 1 jako prawda, pozosta�e
%miejsca (miejsca niezgodno�ci) zostan� wype�nione 0.
function dots = createDotPlot(matrix1,matrix2)
x = length(matrix1);
y = length(matrix2);

dots = zeros(x,y);
for i = 1:x
    for j = 1:y
        if(matrix1(i) == matrix2(j))
            dots(i,j) = 1;
        end
    end
end
end
