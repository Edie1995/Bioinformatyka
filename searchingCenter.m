% SEARCHINGCENTER Funkcja odpowiedzialna za znalezienie centralnej sekwencji
% 
% miss,match,gap - punktacje za poszczegolne nietrafienia, trafienia i prerwy
% seqenceStruct - struktura zawierajaca struktury z sekwencjami
% 
% idx - indeks macierzy centralnej
function [idx,pointMatrix] = searchingCenter(miss,match,gap,seqenceStruct)
pointMatrix = zeros(length(seqenceStruct));
for i = 1:length(seqenceStruct)
    for j = 1:length(seqenceStruct)
        if strcmp(seqenceStruct(i).sequence,seqenceStruct(j).sequence)
            pointMatrix(i,j) = 0;
        else
            seq1 = seqenceStruct(i).sequence;
            seq2 = seqenceStruct(j).sequence;
            pointMatrix(i,j) = createMatrix(miss,match,gap,seq1,seq2);
        end
    end
end
suma = sum(pointMatrix,2);
Y = find(suma == min(suma(:)));
idx = Y(1);
end