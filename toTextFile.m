%TOTEXTFILE Formatowanie tekstu i zapis go do pliku. 
%
%writingSequence - zapisane sekwencje wraz z przerwami w postaci '-' oraz
%dopasowaniami w postaci '|'
%match - punkty za identycznoœæ
%mismatch - kara za nietrafienie
%gap - kara za przerwê
%fasta1 - pierwszy tekst w fromacie fasta zawieraj¹cy sekwencjê
%fasta2 - drugi tekst w fromacie fasta zawieraj¹cy sekwencjê
%score - wartoœæ w prawym dolnym rogu macierzy kosztu
%path - œcie¿ka do zapisu pliku
%txtFileName - nazwa pliku do zapisu
function [] = toTextFile(writingSequence,match,mismatch,gap,fasta1,fasta2,score,path,txtFileName,mode)
identity = writingSequence.identity;
lengthWay = writingSequence.lengthWay;
gaps = writingSequence.gaps;
seq1 = writingSequence.madeSeq1;
seq2 = writingSequence.madeSeq2;
seq3 = writingSequence.madeSeq3;
percentIdentity = identity / lengthWay * 100;
percentGaps = gaps / lengthWay * 100;
if(mode==1)
    modeString = 'similarity';
elseif(mode==2)
    modeString = 'distance';
else
    error('nie ma takiego trybu!');
end
    
sciezkaZapisu = path + "\" + txtFileName + ".txt";
fileID = fopen(char(sciezkaZapisu),'w');
fprintf(fileID,'#1: %s\n#2: %s\n#Mode: %s\n#Match: %-10d\n#Mismatch: %-10d\n#Gap: %-10d\n#Score: %d\n#Length: %-10d\n',fasta1.header,fasta2.header,modeString,match,mismatch,gap,score,lengthWay);
fprintf(fileID,'#Indentity: %d%c%d(%.0f%%)\n#Gaps: %d%c%d(%.0f%%)\n',identity,'/',lengthWay,percentIdentity,gaps,'/',lengthWay,percentGaps);
fprintf(fileID,'%s\n%s\n%s',seq1,seq3,seq2);
fclose(fileID);
disp(fileread(sciezkaZapisu));
end