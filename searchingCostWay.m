%SEARCHINGWAY Tworzy najoptymalnijesz� �cie�k� dopasowania
%
%firstMatrix - macierz kosztu
%match - punkty za dopasowanie
%miss - kara za nietrafienie
%gap - kara za przerw�
% sequenceCell - struktura zwierajaca sekwencje pobrane ze strony lub z pliku
%

%score - warto�� w prawym dolnym rogu macierzy
function [score] = searchingCostWay(match,miss,gap,sequenceCell)
score = zeros(length(sequenceCell));
for i = 1:length(sequenceCell)
    for j = 1:length(sequenceCell)
        seq1 = sequenceCell(i).sequence;
        seq2 = sequenceCell(j).sequence;
        if(~strcmp(seq1,seq2))
            firstMatrix = createMatrix(miss,match,gap,seq1,seq2);
            [x,y] = size(firstMatrix);
            a = x;
            b = y;
            while x >= 2 && y >= 2
                if( y >= 2 && firstMatrix(x,y) - firstMatrix(x,y - 1) == gap)
                    max=firstMatrix(x,y - 1);
                    points = gap;
                    a = x;
                    b = y - 1;
                end
                if(x >= 2 && y >= 2 && firstMatrix(x,y) - firstMatrix(x - 1,y - 1) == match && seq1(x-1)==seq2(y-1))
                    if(a ~= x || b ~= y)
                        if(max < firstMatrix(x - 1,y - 1))
                            points = match;
                            max = firstMatrix(x - 1,y - 1);
                            a = x - 1;
                            b = y - 1;
                        end
                    else
                        points = match;
                        max = firstMatrix(x - 1,y - 1);
                        a = x - 1;
                        b = y - 1;
                    end
                end
                if(x >= 2 && y >= 2 && firstMatrix(x,y) - firstMatrix(x - 1,y - 1) == miss && seq1(x-1)~=seq2(y-1))
                    if(a ~= x || b ~= y)
                        if(max < firstMatrix(x - 1,y - 1))
                            points = miss;
                            max = firstMatrix(x - 1,y - 1);
                            a = x - 1;
                            b = y - 1;
                        end
                    else
                        points = miss;
                        max = firstMatrix(x - 1,y - 1);
                        a = x - 1;
                        b = y - 1;
                    end
                end
                if(x >= 2 && firstMatrix(x,y) - firstMatrix(x - 1,y) == gap)
                    if(a ~= x || b ~= y)
                        if(max<firstMatrix(x - 1,y))
                            points = gap;
                            max=firstMatrix(x - 1,y);
                            a = x - 1;
                            b = y;
                        end
                    else
                        points = gap;
                        max=firstMatrix(x - 1,y);
                        a = x - 1;
                        b = y;
                    end
                end
                score(i,j) = score(i,j) + points;
                x = a;
                y = b;
            end
        else
            score(i,j) = 0;
        end
    end
end
end