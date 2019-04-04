%Funkcja odpowiedzialna za stowrzenie najoptymalnijeszej �ciezki
%dopasowania.
function [aligmentMatrix,score] = searchingWay(firstMatrix)
%Pobieranie rozmiar�w macierzy kosztu
[x,y] = size(firstMatrix);
%Tworzenie macierzy o rozmiarach takich jak macierz kosztu
aligmentMatrix = zeros(x,y);
aligmentMatrix(x,y) = 1;
score = firstMatrix(x,y);
%P�tla odpowiedzialna za wygenerowanie odpowiedniej �ciezki. Szukana jest
%maksymalna warto�� z 3 ( na prawo, do g�ry, po skosie), pobierane s�
%wsp�rz�dne elementu macierzy z maksymaln� warto�ci�. W miejscu macierzy 
%dopasowania w znalezione pole wpisywana jest warto�� 1 Nast�pnie p�tla
%przechodzi do tego punktu i szuka analogicznie kolejnego. 
while x >= 2 && y >= 2
        max = firstMatrix(x - 1,y - 1);
        a = x - 1;
        b = y - 1;
        if(max < firstMatrix(x - 1,y))
            max = firstMatrix(x - 1,y);
            a = x-1;
            b = y;
        end
        if(max < firstMatrix(x,y - 1))
            a = x;
            b = y - 1;
        end
        
        aligmentMatrix(a,b) = 1;
        x = a; 
        y = b;
end
end