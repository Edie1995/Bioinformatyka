%CEATEMATRIX Tworzy macierz kosztów.
%Na podstawie wprowadzonych sekwencji i ich dopasowania tworzy macierz
%wybieraj¹c najwiêksz¹ wartoœæ z trzech poprzedzaj¹cych wartoœci z lewej
%strony, z góry lub po skosie z lewej strony.
%
%pointsTable - tabla punktacji zgodnoœci i niezgodnoœci wprowadzona przez
%u¿ytkownika
%gap - punktacja za przerwy
%fasta1 - struktura fasta zawieraj¹ca pierwsz¹ sekwencjê
%fasta2 - struktóra fasta zawieraj¹ca drug¹ sekwencjê
%
%firstMatrix = createMatrix (pointsTable,gap,fasta1,fasta2) tworzy tablicê
%kosztu porównania dwóch sekwencji, zgodnie z zadan¹ punktacj¹ przez
%u¿ytkownika
function firstMatrix = createMatrix (pointsTable,gap,fasta1,fasta2)
sequence1 = fasta1.sequence;
sequence2 = fasta2.sequence;
firstMatrix = zeros(length(sequence1) + 1,length(sequence2) + 1);

for i = 2:(length(sequence1) + 1)
    for j = 2:(length(sequence2) + 1)
        max = firstMatrix(i - 1,j) + gap;
        num1 = firstMatrix (i,j - 1) + gap;
        point =  pointsTable(sequence1(i - 1),sequence2(j - 1));
        point = point{:,:};
        num2 = firstMatrix(i - 1,j - 1) + point;
        num3 = 0;
        if(max < num1)
            max = num1;
        end
        if(max < num2)
            max = num2;
        end
        if(max < num3)
            max = num3;
        end
        firstMatrix(i,j) = max;
    end
end
end