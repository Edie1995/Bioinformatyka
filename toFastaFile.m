%TOFASTAFILE Zapisuje otrzymane w parametrach wejsciowych dane w formacie
%fasta oraz wyswietla zapis w konsoli
%
%writingSequence - komorka zawierajaca zapisane sekwencje w formacie z
%przerwami
%fasta - formatowane struktury zawierajace naglowki sekwencji
%path,fileName - sciezka i nazwa pliku, do ktorego zapisany ma byc
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