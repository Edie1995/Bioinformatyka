% INPUTFILEFASTA odczytuje pliki fasta
% filrName - nazwa i ciezka do pliku do odczytu
function text = inputFileFasta(fileName)
sciezkaOdczytu = char(fileName);
text = fileread(sciezkaOdczytu);
end