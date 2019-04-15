%SEARCHINGWAY Tworzy optymalne �cie�ki dopasowania dla ka�dej z
%maksymalnych warto�ci w macierzy kosztu
%
%firstMatrix - macierz kosztu
%gap - kara za przerw�
%
%C - kom�rka zwieraj�ca wszystkie z wygenerowanych �cie�ek w postaci
%macie�y puntacji 0 1
%
%score - warto�� maksymalnej warto�ci
%
%rowsOfMaxes, colsOfMaxes - tabice indeks�w wierszy i kolumn zaweiraj�cych
%maksymalne warto�ci w macierzy kosztu
%
%rowsOfEnd, colsOfEnd - tablice indeks�w miejsc, w kt�rych ko�czy si�
%wyznaczanie �cie�ek
%dopasowania lokalnego, czyli miejsca otoczone z trzech stron zerami
function [C,score,rowsOfMaxes, colsOfMaxes, rowsOfEnd, colsOfEnd] = searchingWay(firstMatrix,gap)
[maxValue] = max(firstMatrix(:));
[rowsOfMaxes, colsOfMaxes] = find(firstMatrix == maxValue);
C = cell(length(rowsOfMaxes),1);
score = maxValue;
rowsOfEnd = zeros(length(rowsOfMaxes));
colsOfEnd = zeros(length(rowsOfMaxes));
for i = 1:length(rowsOfMaxes)
    x = rowsOfMaxes(i);
    y = colsOfMaxes(i);
    aligmentMatrix = zeros(x,y);
    aligmentMatrix(x,y) = 1;
    while x >= 1 || y >= 1
        maxim = firstMatrix(x - 1,y - 1);
        a = x - 1;
        b = y - 1;
        if(maxim < firstMatrix(x - 1,y))
            if(firstMatrix(x,y) - firstMatrix(x - 1,y) == gap)
                maxim = firstMatrix(x - 1,y);
                a = x - 1;
                b = y;
            end
        end
        if(maxim < firstMatrix(x,y - 1))
            if(firstMatrix(x,y) - firstMatrix(x,y - 1) == gap)
                maxim = firstMatrix(x,y - 1);
                a = x;
                b = y - 1;
            end
        end
        if maxim == 0
            break;
        end
        aligmentMatrix(a,b) = 1;
        x = a;
        y = b;
    end
    rowsOfEnd(i) = x;
    colsOfEnd(i) = y;
    C{i,1} = num2cell(aligmentMatrix);
end
end