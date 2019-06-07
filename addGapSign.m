% ADDGAPSIGN dodaje znaki przerw w miejscach, w których występują one w sekwencji głównej
% 
% comparedSequences - dopasowane pojedyncze sekwencje do sekwencji glownej
% idx - indeks sekwencji glownej
% tabHelper - tablica okreslajaca gdzie znajdowac sie maja przerwy
% 
% matchSequences - ostatecznie dopasowane sekwencje
function matchSequences = addGapSign(comparedSequences,idx,tabHelper)
mainSequence = comparedSequences(idx).sequence;
matchSequences(idx) = struct('sequence',mainSequence);
for i = 1: length(comparedSequences)
    sequenceToCopare = comparedSequences(i).sequence;
    if(~strcmp(mainSequence, sequenceToCopare))
        lastSeq1 = '';
        numSeq = 1;
        for j = 1:length(mainSequence)
            if(numSeq<=length(sequenceToCopare))
                licznik = str2num(tabHelper(j));
                if(licznik > i)
                    addStr = '-';
                    lastSeq1 = strcat(lastSeq1,addStr);
                else
                    lastSeq1 = strcat(lastSeq1,sequenceToCopare(numSeq));
                    numSeq = numSeq + 1;
                end
            else
                addStr = '-';
                lastSeq1 = strcat(lastSeq1,addStr);
            end
        end
        matchStruct = struct('sequence',lastSeq1);
        matchSequences(i) = matchStruct;
    end
end
end