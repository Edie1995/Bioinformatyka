%POINTSTABLE Odczytuje macierz substytucji w postaci tabeli z pliku o
%określonej przez urzytkownika nazwie i lokalizacji
function pointsTable = readTableOfPoints(source,name)
path = source + "\" + name;
pointsTable = readtable(path,'ReadRowNames',true);
end