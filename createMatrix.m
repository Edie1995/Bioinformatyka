%Funkcja tworz�ca macierz koszt�w.
%miss-warto�� jak� przyjmujemy dla niezgodno�ci sekwencji
%match-dopasowanie, warto�� jak� przyjmujemy za dopasowanie
%gap-warto�� jak� przyjmujemy za przerw�
%fasta1-pierwszy plik fasta, z kt�rego mo�emy pobra� sekwencj�
%fasta2-drugi plik fasta, z kt�rego mo�emy pobra� sekwencj�
function firstMatrix = createMatrix (miss,match,gap,fasta1,fasta2)
sequence1 = fasta1.sequence;
sequence2 = fasta2.sequence;
firstMatrix = zeros(length(sequence1)+1,length(sequence2)+1);
%p�tle odpowiedzialna za wype�nienie brzegowych kolumn warto�ciami b�d�cymi
%wielokrotno�ci� punktacji za przerw�
for i = 1:length(sequence1)
    firstMatrix(i, 1) = ((i - 1) * gap);
end
for i=1:length(sequence2)
    firstMatrix(1,i) = ((i - 1) * gap);
end
%Uzupe�nienie macierzy kosztu maksymaln� warto�ciami z trzech (uko�na, z
%g�ry, z lewej), dla ka�dego jej elementu. Najpierw za warto�� maksymaln�
%obierana jest warto�� uzyskana z lewej strony, je�eli jest mniejsza od
%warto�ci uzyskanej po skosie zostaje maksem, jak nie podmieniana jest
%maksymalna warto��. Nast�pnie analogicznie por�wnianie z warto�ci� z g�ry.
for i = 2:(length(sequence1)+1)
    for j = 2:(length(sequence2)+1)
        max = firstMatrix(i - 1,j) + gap;
        num1 = firstMatrix (i,j - 1) + gap;
         if(sequence1(i-1) == sequence2(j-1))   
           num2 = firstMatrix(i - 1,j - 1) + match;
         else
           num2 = firstMatrix(i - 1,j - 1) + miss;
         end
         if(max < num1)
             max = num1;
         end
         if(max < num2)
             max = num2;
         end
         firstMatrix(i,j) = max;
    end   
end
end