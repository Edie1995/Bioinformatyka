%TOFASTAFILE Zapisuje otrzymane w parametrach wejœciowych dane w formacie
%fasta oraz wyœwietla zapis w konsoli
%
%writingSequence - komórka zawieraj¹ca zapisane sekwencje w formacie z
%przerwamie
%
%rowsOfMaxes, colsOfMaxes - tablice zawieraj¹ce pocz¹tkowe elementy
%sekwencji poczas odczytywania œcie¿ek, czyli te o najdalszych indeksach
%
%rowsOfEnd,colsOfEnd - tablice zawieraj¹ce koñcowe elementy wyznaczania
%sekwencji poczas odczytywania œcie¿ek, czyli te o najni¿szych indeksach
%
%fasta1,fasta2 - formatowane struktury zawieraj¹ce nag³ówki sekwencji
%
%path,fileName - œcie¿ka i nazwa pliku, do którego zapisany ma byæ
%wygenerowany plik fasta
function [] = toFastaFile(writingSequence,rowsOfMaxes, colsOfMaxes,rowsOfEnd,colsOfEnd,fasta1,fasta2,path,fileName)
sciezkaZapisu = (path + "\" + fileName + ".fasta");
fileID = fopen(sciezkaZapisu,'w');
header1 = fasta1.header;
header2 = fasta2.header;

for i =1:length(writingSequence)
    fprintf(fileID,'>%s %d-%d\n', header1,rowsOfEnd(i),rowsOfMaxes(i));
    fprintf(fileID,'%s\n',writingSequence(i).madeSeq1);
    fprintf(fileID,'>%s %d-%d\n', header2,colsOfEnd(i),colsOfMaxes(i));
    fprintf(fileID,'%s\n\n',writingSequence(i).madeSeq2);
end

fclose(fileID);

disp(fileread(sciezkaZapisu));
end