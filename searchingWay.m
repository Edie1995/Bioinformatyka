%SEARCHINGWAY Tworzy optymalne œcie¿ki dopasowania dla ka¿dej z
%maksymalnych wartoœci w macierzy kosztu
%
%firstMatrix - macierz kosztu
%gap - kara za przerwê
%
%C - komórka zwieraj¹ca wszystkie z wygenerowanych œcie¿ek w postaci
%macie¿y puntacji 0 1
%
%score - wartoœæ maksymalnej wartoœci
%
%rowsOfMaxes, colsOfMaxes - tabice indeksów wierszy i kolumn zaweiraj¹cych
%maksymalne wartoœci w macierzy kosztu
%
%rowsOfEnd, colsOfEnd - tablice indeksów miejsc, w których koñczy siê
%wyznaczanie œcie¿ek
%dopasowania lokalnego, czyli miejsca otoczone z trzech stron zerami
function [C,score,rowsOfMaxes, colsOfMaxes, rowsOfEnd, colsOfEnd] = searchingWay(firstMatrix,gap,seq1,seq2,pointsTable)
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
        a=x;
        b=y;
        point =  pointsTable(seq1(x - 1),seq2(y - 1));
        point = point{:,:};
        if(x >= 2 && y >= 2 && firstMatrix(x,y) - firstMatrix(x - 1,y - 1) == point  && seq1(x-1)==seq2(y-1))
            maksimum = firstMatrix(x - 1,y - 1);
            a = x - 1;
            b = y - 1;
        end
        if( y >= 2 && firstMatrix(x,y) - firstMatrix(x,y - 1) == gap)
            if(a ~= x || b ~= y)
                if(maksimum < firstMatrix(x,y - 1))
                    maksimum=firstMatrix(x,y - 1);
                    a = x;
                    b = y - 1;
                end
            else
                maksimum = firstMatrix(x,y - 1);
                a = x;
                b = y - 1;
            end
        end
        if(x >= 2 && firstMatrix(x,y) - firstMatrix(x - 1,y) == gap)
            if(a ~= x || b ~= y)
                if(maksimum<firstMatrix(x - 1,y))
                    maksimum=firstMatrix(x - 1,y);
                    a = x - 1;
                    b = y;
                end
            else
                maksimum=firstMatrix(x - 1,y);
                a = x - 1;
                b = y;
            end
        end
        if(maksimum==0)
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