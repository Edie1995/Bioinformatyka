%SAVEFILE zapisuje obraz macierzy kosztu oraz optymalnych œcie¿ek do pliku
%jpeg
function [] = saveFile(path,filename)
sciezka = path + "\" + filename;
print(sciezka,'-djpeg');
end