%INPUTFILEFASTA Odczytuje plik fasta
%
%path - �cie�ka do odczytywanego pliku
%fileName - nazwa pliku
%
%text = inputFileFasta(path, fileName) - na podstawie przekazanych danych
%odczytuje plik i zapisuje go w postaci ci�gu znak�w
function text = inputFileFasta(path)
sciezkaOdczytu = path;
text = fileread(sciezkaOdczytu);
end