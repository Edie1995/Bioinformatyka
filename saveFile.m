%SAVEFILE zapisuje obraz macierzy kosztu oraz optymalnych �cie�ek do pliku
%jpeg
function [] = saveFile(path,filename)
sciezka = path + "\" + filename;
print(sciezka,'-djpeg');
end