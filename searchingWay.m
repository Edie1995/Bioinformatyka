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
function [aligmentMatrix,score] = searchingWay(firstMatrix,match,miss,gap)

[x,y] = size(firstMatrix);

aligmentMatrix = zeros(x,y);
aligmentMatrix(x,y) = 1;
score = firstMatrix(x,y);
a=x;
b=y;
while x >= 2 || y >= 2
    if(x < 2)
        x = 2;
    end
    if(y < 2)
        y = 2;
    end
    if(firstMatrix(x,y) - firstMatrix(x,y - 1) == gap)
        max=firstMatrix(x,y - 1);
        a = x;
        b = y - 1;
    end
    if(firstMatrix(x,y) - firstMatrix(x - 1,y - 1) == match)
        if(a ~= x && b ~=y)
            if(max<firstMatrix(x - 1,y - 1))
                max=firstMatrix(x - 1,y - 1);
                a = x - 1;
                b = y - 1;
            end
        else
            max=firstMatrix(x - 1,y - 1);
            a = x - 1;
            b = y - 1;
        end
    end
    if(firstMatrix(x,y) - firstMatrix(x - 1,y) == gap)
       if(a ~= x && b ~=y)
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
    if(firstMatrix(x,y) - firstMatrix(x - 1,y - 1) == miss)
       if(a ~= x && b ~=y)
            if(max<firstMatrix(x - 1,y - 1))
                max=firstMatrix(x - 1,y - 1);
                a = x - 1;
                b = y - 1;
            end
       else
            a = x - 1;
            b = y - 1;
        end
    end
    aligmentMatrix(a,b) = 1;
    x = a;
    y = b;
    
end
end