% SAVEFILE Zapisuje pod okre�lon� w parametrach �cie�k� plik w formacie
%jpeg.
function [] = saveFile(path,filename)
sciezka = path + "\" + filename;
print(char(sciezka),'-djpeg');
end