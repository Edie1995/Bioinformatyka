%INPUTFILEFASTA Odczytuje plik w formacie fasta i zapisuje go w fomie
%�a�cucha znak�w
%
%path, fileName - �cie�ka i nazwa pliku do odczytu
function text = inputFileFasta(path, fileName)
sciezkaOdczytu = path+"\"+fileName;
text = fileread(sciezkaOdczytu);
end