% SAVEFILE Zapisuje pod okreœlon¹ w parametrach œcie¿k¹ plik w formacie
%jpeg.
function [] = saveFile(path,filename)
sciezka = path + "\" + filename;
print(char(sciezka),'-djpeg');
end