%INPUTFILEFASTA Odczytuje plik w formacie fasta i zapisuje go w fomie
%³añcucha znaków
%
%path, fileName - œcie¿ka i nazwa pliku do odczytu
function text = inputFileFasta(path, fileName)
sciezkaOdczytu = path+"\"+fileName;
text = fileread(sciezkaOdczytu);
end