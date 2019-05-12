%Funkcja ta ma za zadanie na podstawie dwóch sekwencji wczytanych ze strony
%lub z klawiatury, wygenerowanie macierzy dwu wymiarowej, która w miejscu
%zgodnoœci danych wejœcioweych bêdzie podawa³a 1 jako prawda, pozosta³e
%miejsca (miejsca niezgodnoœci) zostan¹ wype³nione 0.
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
