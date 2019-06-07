% MINDISTANCE Funkcja szukajaca najmniejszej wartosci dopasowania
% 
% lastMatrix - macierz odleglosci dla wszystkich sekwencji
% 
% x,y - indeksy minimalej odleglosci w macierzy
function [x,y] = minDistance(lastMatrix)
[X,Y] = find(lastMatrix == min(lastMatrix(:)));
for i =1:length(X)
    k=0;
    if(X(i) ~=Y(i))
        x=X(i);
        y=Y(i);
        k=1;
        break; 
    end
end
if k==0
   [x,y] = find(lastMatrix == min(lastMatrix(lastMatrix>0)),1,'first');
end
end