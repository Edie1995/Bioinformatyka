%Funkcja odpowiedzialna za odczyt konkretnego pliku z podanej œcie¿ki
function text = inputFileFasta(path, fileName)
sciezkaOdczytu = path+"\"+fileName;
text = fileread(sciezkaOdczytu);
end