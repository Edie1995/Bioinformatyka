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
function [] = toFastaFile(writingSequence,fasta,path,fileName)
sciezkaZapisu = char(path + "/" + fileName + ".fasta");
fileID = fopen(sciezkaZapisu,'w');


for i = 1:length(writingSequence)
    header1 = fasta(i).header;
    fprintf(fileID,'>%s \n', header1);
    fprintf(fileID,'%s\n',writingSequence(i).lastSeq);

end

fclose(fileID);

disp(fileread(sciezkaZapisu));
end