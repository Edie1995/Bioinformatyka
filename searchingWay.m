%SEARCHINGWAY Tworzy najoptymalnijesz¹ œcie¿kê dopasowania
%
%firstMatrix - macierz kosztu
%match - punkty za dopasowanie
%miss - kara za nietrafienie
%gap - kara za przerwê
%
%aligmentMatrix - macierz okreœlaj¹ca optymaln¹ drogê globalnego
%dopasowania
%score - wartoœæ w prawym dolnym rogu macierzy
function [aligmentMatrix,score] = searchingWay(firstMatrix,match,miss,gap,seq1,seq2)

[x,y] = size(firstMatrix);
aligmentMatrix = zeros(x,y);
aligmentMatrix(x,y) = 1;
score = firstMatrix(x,y);
a = x;
b = y;
while x >= 2 || y >= 2
    if( y >= 2 && firstMatrix(x,y) - firstMatrix(x,y - 1) == gap)
        max=firstMatrix(x,y - 1);
        a = x;
        b = y - 1;
    end
    if(x >= 2 && y >= 2 && firstMatrix(x,y) - firstMatrix(x - 1,y - 1) == match && seq1(x-1)==seq2(y-1))
        if(a ~= x || b ~= y)
            if(max < firstMatrix(x - 1,y - 1))
                max = firstMatrix(x - 1,y - 1);
                a = x - 1;
                b = y - 1;
            end
        else
            max = firstMatrix(x - 1,y - 1);
            a = x - 1;
            b = y - 1;
        end
    end
    if(x >= 2 && y >= 2 && firstMatrix(x,y) - firstMatrix(x - 1,y - 1) == miss && seq1(x-1)~=seq2(y-1))
        if(a ~= x || b ~= y)
            if(max < firstMatrix(x - 1,y - 1))
                max = firstMatrix(x - 1,y - 1);
                a = x - 1;
                b = y - 1;
            end
        else
            max = firstMatrix(x - 1,y - 1);
            a = x - 1;
            b = y - 1;
        end
    end
    if(x >= 2 && firstMatrix(x,y) - firstMatrix(x - 1,y) == gap)
        if(a ~= x || b ~= y)
            if(max<firstMatrix(x - 1,y))
                max=firstMatrix(x - 1,y);
                a = x - 1;
                b = y;
            end
        else
            
            
            max=firstMatrix(x - 1,y);
            a = x - 1;
            b = y;
        end
    end
    aligmentMatrix(a,b) = 1;
    x = a;
    y = b;
    
end
end
