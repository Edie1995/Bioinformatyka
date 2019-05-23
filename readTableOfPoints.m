%POINTSTABLE Odczytuje macierz substytucji w postaci tabeli z pliku o
%okre�lonej przez urzytkownika nazwie i lokalizacji
function pointsTable = readTableOfPoints(source,name)
path = char(source + "/" + name);
pointsTable = readtable(path,'ReadRowNames',true);
end