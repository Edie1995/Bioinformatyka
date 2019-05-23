%TOTEXTFILE Formatowanie tekstu i zapis go do pliku.
%
%writingSequence - zapisane sekwencje wraz z przerwami w postaci '-' oraz
%dopasowaniami w postaci '|'
%match - punkty za identyczno��
%mismatch - kara za nietrafienie
%gap - kara za przerw�
%fasta1 - pierwszy tekst w fromacie fasta zawieraj�cy sekwencj�
%fasta2 - drugi tekst w fromacie fasta zawieraj�cy sekwencj�
%score - warto�� w prawym dolnym rogu macierzy kosztu
%path - �cie�ka do zapisu pliku
%txtFileName - nazwa pliku do zapisu
function [] = toTextFile(bestAligment,path,txtFileName,starAligment,emptySequences)
sciezkaZapisu = char(path + "/" + txtFileName + ".txt");
fileID = fopen(sciezkaZapisu,'w');
start = 1;
counter = 60;
sum1=zeros(length(emptySequences));
starIdentifier = '';
max=0;
for j = 1:length(emptySequences)
    if(max<length(emptySequences(j).identifier))
        max = length(emptySequences(j).identifier);
    end
end

for i = 1:max
    starIdentifier = strcat(starIdentifier," ");
end

for k = 1:(length(bestAligment(1).lastSeq)/60)+1
    for i = 1: length(emptySequences)
        fprintf(fileID,'%s\t',emptySequences(i).identifier);
        for j = start: counter
            seq = bestAligment(i).lastSeq;
            if(j <= length(seq))
                fprintf(fileID,'%s',seq(j));
                if(seq(j)~='-')
                    sum1(i)=sum1(i)+1;
                end
            end
        end
        fprintf(fileID,'\t%d\n',sum1(i));
        sum1(i)=sum1(i);
    end
    fprintf(fileID,'%s\t',starIdentifier);
    for z = start: counter
        star=char(starAligment);
        if(z <= length(star))
            fprintf(fileID,'%s',star(z));
        end
    end
    fprintf(fileID,'\t\n');
    start = counter+1;
    counter = counter + 60;
    fprintf(fileID,'\n');
end
fclose(fileID);
disp(fileread(sciezkaZapisu));
end