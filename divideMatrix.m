% DIVIDEMATRIX Funkcja, ktora dzielac odpowiednio macierze kosztow tworzy 
% zapis drzewa w formacie Newick
% 
% lastMatrix - ostateczna macierz po dopasowaniu sekwencji
% seqenceStruct - struktura zawierajaca pierwotne sekwecje
function [] = divideMatrix(lastMatrix,seqenceStruct)
childMatrix = lastMatrix;
tabHelper = zeros(length(lastMatrix)-2,1);
tabNumbers = 1:1:length(lastMatrix);
for i = 1: length(lastMatrix)- 2
    [x,y] = minDistance(childMatrix);
    childMatrix (x,:) = [];
    childMatrix (:,x) = [];
    a = find(tabHelper == x,1,'last');
    b = find(tabHelper == y,1,'last');
    if(isempty(a) && isempty(b))
        n1 = tabNumbers(x);
        n2 = tabNumbers(y);
        newickTable(i).leaf = [tabNumbers(x) tabNumbers(y)];
        string1 = seqenceStruct(n1).identifier;
        string2 = seqenceStruct(n2).identifier;
        tabNumbers = tabNumbers(tabNumbers~=tabNumbers(x));
        d1=0;
        d2=0;
    elseif(isempty(a) && ~isempty(b))
        n1 = newickTable(b).leaf;
        n2 = tabNumbers(x);
        newickTable(i).leaf = [newickTable(b).leaf tabNumbers(x)];
        string1 = newickTable(b).string;
        string2 = seqenceStruct(n2).identifier;
        tabNumbers = tabNumbers(tabNumbers~=tabNumbers(x));
        d1=b;
        d2=0;
    elseif(~isempty(a) && isempty(b))
        d1=a;
        d2=0;
        n1 = newickTable(a).leaf;
        n2 = tabNumbers(y);
        newickTable(i).leaf = [newickTable(a).leaf tabNumbers(y)];
        
        string1 = char(newickTable(b).string);
        string2 = seqenceStruct(n2).identifier;
        tabNumbers = tabNumbers(tabNumbers~=tabNumbers(y));
    else
        d1=a;
        d2=b;
        n1 = newickTable(a).leaf;
        n2 = newickTable(b).leaf;
        newickTable(i).leaf = [newickTable(a).leaf newickTable(b).leaf];
        string1 = newickTable(a).string;
        string2 = newickTable(b).string;
    end
    suma=0;
    for k=1:length(n1)
        for z = 1:length(n2)
            suma = suma + lastMatrix(n1(k),n2(z));
        end
    end
    newickTable(i).distance = suma/(length(n1)+length(n2));
    if(d1 == 0 && d2 ~= 0)
        d1 = newickTable(i).distance;
        d2 =  newickTable(i).distance - newickTable(d2).distance;
    elseif(d1 ~= 0 && d2 == 0)
        d2 = newickTable(i).distance;
        d1 =  newickTable(i).distance - newickTable(d1).distance;
    elseif(d1 ~= 0 && d2 ~= 0)
        d1 =  newickTable(i).distance - newickTable(d1).distance;
        d2 =  newickTable(i).distance - newickTable(d2).distance;
    else
        d1 = newickTable(i).distance;
        d2 = newickTable(i).distance;
    end
    
    newickTable(i).indeks = y;
    newickTable(i).string = char("("+string1+":"+d1+","+string2+":"+d2+")");
    disp(newickTable(i).string);
    tabHelper(i) = newickTable(i).indeks;
    idx = i;
    childMatrix = subchildMatrix(lastMatrix,childMatrix,newickTable,tabNumbers,idx,tabHelper);
end
end