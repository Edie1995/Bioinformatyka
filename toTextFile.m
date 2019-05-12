%TOTEXTFILE Formatuje plik tekstowy utworzony z danych wejœciowych oraz zapisuje go
%
%pointsTable - macierz substytucji
%
%writingSequence - struktura cell zawieraj¹ca trzy wygenerowane sekwencjê
%(sekwencja pierwsza i druga z przerwami oraz ci¹g ich dopasowañ)
%
%gap - kara za przerwê
%
%fasta1,fasta2 - struktury danych z formatu fasta
%
%score - maksymalna wartoœæ w macierzy kosztu
%
%path,txtFileName - œcie¿ka i nazwa pliku, do którego ma zostaæ zapisany
%sformatowany tekst
function [] = toTextFile(pointsTable,writingSequence,gap,fasta1,fasta2,score,path,txtFileName)

sciezkaZapisu = path + "\" + txtFileName + ".txt";
fileID = fopen(sciezkaZapisu,'w');

rows = char(pointsTable.Properties.RowNames);
columns = char(pointsTable.Properties.VariableNames);

chr(1,1) = '#';
for i = 1: length(rows)
    chr(i + 1,1) = rows(i);
    for j = 2:2:length(columns) * 2
        if(i == 1)
            chr(i,j:j + 1) = [' ' columns(j / 2)];
        end
        point = pointsTable(rows(i),columns(j / 2));
        point = point{:,:};
        if(point < 0)
            chr(i + 1,j:j + 1) = num2str(point);
        else
            chr(i + 1,j:j + 1) =[' ' num2str(point)];
        end
        
    end
end
c = cellstr(chr);

for i = 1:length(writingSequence)
    identity = writingSequence(i).identity;
    lengthWay = writingSequence(i).lengthWay;
    gaps = writingSequence(i).gaps;
    seq1 = writingSequence(i).madeSeq1;
    seq2 = writingSequence(i).madeSeq2;
    seq3 = writingSequence(i).madeSeq3;
    
    percentIdentity = identity / lengthWay * 100;
    percentGaps = gaps / lengthWay * 100;
    
    fprintf(fileID,'\n#1: %s\n#2: %s\n#Mode: distance\n',fasta1.header,fasta2.header);
    fprintf(fileID,'#Table:\n');
    fprintf(fileID,'%s\n',c{:});
    fprintf(fileID,'#Gap: %-10d\n#Score: %d\n#Length: %-10d\n',gap,score,lengthWay);
    fprintf(fileID,'#Indentity: %d%c%d(%.0f%%)\n#Gaps: %d%c%d(%.0f%%)\n',identity,'/',lengthWay,percentIdentity,gaps,'/',lengthWay,percentGaps);
    fprintf(fileID,'%s\n%s\n%s',seq1,seq3,seq2);
end
fclose(fileID);

disp(fileread(sciezkaZapisu));
end