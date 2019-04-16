%Funkcja odpowiedzialna za sformatowanie tekstu i zapis go do pliku. 
function [] = toTextFile(writingSequence,match,mismatch,gap,fasta1,fasta2,score,path,txtFileName)
%Pobranie poszczególnych wartoœci przekazanych z funkcji writingSequence
identity = writingSequence.identity;
lengthWay = writingSequence.lengthWay;
gaps = writingSequence.gaps;
seq1 = writingSequence.madeSeq1;
seq2 = writingSequence.madeSeq2;
seq3 = writingSequence.madeSeq3;
%Obliczenie procenta dopasowania i przerw
percentIdentity = identity / lengthWay * 100;
percentGaps = gaps / lengthWay * 100;
%Zapis do pliku pod okreœlonym adresem
sciezkaZapisu = path + "\" + txtFileName;
fileID = fopen(sciezkaZapisu,'w');
fprintf(fileID,'#1: %s\n#2: %s\n#Mode: distance\n#Match: %-10d\n#Mismatch: %-10d\n#Gap: %-10d\n#Score: %d\n#Length: %-10d\n',fasta1.header,fasta2.header,match,mismatch,gap,score,lengthWay);
fprintf(fileID,'#Indentity: %d%c%d(%.0f%%)\n#Gaps: %d%c%d(%.0f%%)\n',identity,'/',lengthWay,percentIdentity,gaps,'/',lengthWay,percentGaps);
fprintf(fileID,'%s\n%s\n%s',seq1,seq3,seq2);
fclose(fileID);
%Wyœwietlenie zapisanego pliku
disp(fileread(char(sciezkaZapisu)));
end