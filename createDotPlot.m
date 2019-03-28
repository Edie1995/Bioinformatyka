%Funkcja ta ma za zadanie na podstawie dwóch sekwencji wczytanych ze strony
%lub z klawiatury, wygenerowanie macierzy dwu wymiarowej, która w miejscu
%zgodnoœci danych wejœcioweych bêdzie podawa³a 1 jako prawda, pozosta³e
%miejsca (miejsca niezgodnoœci) zostan¹ wype³nione 0.
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
