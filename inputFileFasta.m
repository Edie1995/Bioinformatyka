%INPUTFILEFASTA Odczytuje plik fasta
%
%path - œcie¿ka do odczytywanego pliku
%fileName - nazwa pliku
%
%text = inputFileFasta(path, fileName) - na podstawie przekazanych danych
%odczytuje plik i zapisuje go w postaci ci¹gu znaków
function text = inputFileFasta(path, fileName)
sciezkaOdczytu = path+"\"+fileName;
text = fileread(sciezkaOdczytu);
end