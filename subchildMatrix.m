% CHILDMATRIX Funkcja odpowiedzialna za tworzenie macierzy potomnej
% 
% lastMatrix - ostatnia macierz kosztu po dopasowaniu sekwencji
% childMatrixIn - potomna macierz odleglosci przed pomniejszeniem
% newickTable - struktura przechowujaca dane dotyczace poszczegolnych galezi
% tabNumbers - numery nie polaczone jeszcze z zadna galezia
% idx - indeks w macierzy do porownania
% tabHelper -macierz pomocnicza zawierajaca indeksy wczesniejszych dopasowan
% 
% childMatrix - nowa macierz potomna
function childMatrix = subchildMatrix(lastMatrix,childMatrixIn,newickTable,tabNumbers, idx,tabHelper)
name = newickTable(idx).leaf;
id = newickTable(idx).indeks;
left = 1:1:length(childMatrixIn);
left = left(left~=id);
childMatrix = childMatrixIn;
for i =1:length(left)
    suma=0;
    if(~isempty(find(tabNumbers == left(i),1)))
        for j=1:length(name)
            suma = suma + lastMatrix(name(j), left(i));
        end
        b = left(i);
        childMatrix(id,b) = suma/(length(name));
        childMatrix(b,id) = suma/(length(name));
    else
        a = find(tabHelper == left(i),1,'last');
        if(~isempty(a))
            leaf2 = newickTable(a).leaf;
            disp("suma2")
            for j=1:length(name)
                for k= 1:length(leaf2)
                    suma = suma + lastMatrix(name(j), leaf2(k));
                end
            end
            b = left(i);
            childMatrix(id,b) = left(i)/(length(name) + length(leaf2));
            childMatrix(b,id) = left(i)/(length(name) + length(leaf2));
        end
    end
end
end