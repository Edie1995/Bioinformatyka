%TOFASTAFILE Zapisuje otrzymane w parametrach wej�ciowych dane w formacie
%fasta oraz wy�wietla zapis w konsoli
%
%writingSequence - kom�rka zawieraj�ca zapisane sekwencje w formacie z
%przerwamie
%
%rowsOfMaxes, colsOfMaxes - tablice zawieraj�ce pocz�tkowe elementy
%sekwencji poczas odczytywania �cie�ek, czyli te o najdalszych indeksach
%
%rowsOfEnd,colsOfEnd - tablice zawieraj�ce ko�cowe elementy wyznaczania
%sekwencji poczas odczytywania �cie�ek, czyli te o najni�szych indeksach
%
%fasta1,fasta2 - formatowane struktury zawieraj�ce nag��wki sekwencji
%
%path,fileName - �cie�ka i nazwa pliku, do kt�rego zapisany ma by�
%wygenerowany plik fasta
function [] = toFastaFile(writingSequence,rowsOfMaxes, colsOfMaxes,rowsOfEnd,colsOfEnd,fasta1,fasta2,path,fileName)
sciezkaZapisu = char(path + "/" + fileName + ".fasta");
fileID = fopen(sciezkaZapisu,'w');
header1 = fasta1.header;
header2 = fasta2.header;

for i = 1:length(writingSequence)
    fprintf(fileID,'>%s %d-%d\n', header1,(rowsOfEnd(i)-1),(rowsOfMaxes(i)-1));
    fprintf(fileID,'%s\n',writingSequence(i).madeSeq1);
    fprintf(fileID,'>%s %d-%d\n', header2,(colsOfEnd(i)-1),(colsOfMaxes(i)-1));
    fprintf(fileID,'%s\n\n',writingSequence(i).madeSeq2);
end

fclose(fileID);

disp(fileread(sciezkaZapisu));
end