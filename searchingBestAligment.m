%SEARCHINGWAY Tworzy najoptymalnijesz� �cie�k� dopasowania
%
%firstMatrix - macierz kosztu
%match - punkty za dopasowanie
%miss - kara za nietrafienie
%gap - kara za przerw�
% idx -indeks maciezry centralnej
% seqenceCell - struktura zwierajaca poszczegolne sekwencji
%
% comparedSequences - struktura zwierajca dopasowane sekwencje
% tabHelper - ciag zawierajacy oznaczenia dotyczace wystepowania kolejnych przerw
function [comparedSequences,tabHelper] = searchingBestAligment(match,miss,gap,idx,sequenceCell)
centerSequence =  sequenceCell(idx).sequence;
tabHelper='';
for i=1:length(centerSequence)
    tabHelper = strcat(tabHelper,'0');
end
for i = 1:length(sequenceCell)
    seq1 = centerSequence;
    seq2 = sequenceCell(i).sequence;
    bestMatrix = createMatrix (miss,match,gap,seq1,seq2);
    [x,y] = size(bestMatrix);
    aligmentMatrix = zeros(x,y);
    aligmentMatrix(x,y) = 1;
    a = x;
    b = y;
    if(~strcmp(seq1,seq2))
        while x >= 2 || y >= 2
            if( y >= 2 && bestMatrix(x,y) - bestMatrix(x,y - 1) == gap)
                max=bestMatrix(x,y - 1);
                a = x;
                b = y - 1;
            end
            if(x >= 2 && y >= 2 && bestMatrix(x,y) - bestMatrix(x - 1,y - 1) == match && seq1(x-1)==seq2(y-1))
                if(a ~= x || b ~= y)
                    if(max < bestMatrix(x - 1,y - 1))
                        max = bestMatrix(x - 1,y - 1);
                        a = x - 1;
                        b = y - 1;
                    end
                else
                    
                    max = bestMatrix(x - 1,y - 1);
                    a = x - 1;
                    b = y - 1;
                end
            end
            if(x >= 2 && y >= 2 && bestMatrix(x,y) - bestMatrix(x - 1,y - 1) == miss && seq1(x-1)~=seq2(y-1))
                if(a ~= x || b ~= y)
                    if(max < bestMatrix(x - 1,y - 1))
                        max = bestMatrix(x - 1,y - 1);
                        a = x - 1;
                        b = y - 1;
                    end
                else
                    
                    max = bestMatrix(x - 1,y - 1);
                    a = x - 1;
                    b = y - 1;
                end
            end
            if(x >= 2 && bestMatrix(x,y) -bestMatrix(x - 1,y) == gap)
                if(a ~= x || b ~= y)
                    if(max<bestMatrix(x - 1,y))
                        max=bestMatrix(x - 1,y);
                        a = x - 1;
                        b = y;
                    end
                else
                    
                    max=bestMatrix(x - 1,y);
                    a = x - 1;
                    b = y;
                end
            end
            aligmentMatrix(a,b) = 1;
            x = a;
            y = b;
        end
        [helperSequence,comparedSequences(i),tab] = writeSequence(aligmentMatrix,seq1, seq2,tabHelper,i);
        comparedSequences(idx) = helperSequence;
        centerSequence =  helperSequence.madeSeq2;
        tabHelper = tab.tab;
    end
end
end