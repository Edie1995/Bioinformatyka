%CREATEMATRIX tworzy macierz kosztów.
%
%miss-wartoœæ jak¹ przyjmujemy dla niezgodnoœci sekwencji
%match-dopasowanie, wartoœæ jak¹ przyjmujemy za dopasowanie
%gap-wartoœæ jak¹ przyjmujemy za przerwê
%fasta1-pierwszy plik fasta, z którego mo¿emy pobraæ sekwencjê
%fasta2-drugi plik fasta, z którego mo¿emy pobraæ sekwencjê
%
%firstMatrix = createMatrix (miss,match,gap,fasta1,fasta2)-stworzona
%macierz kosztu
function firstMatrix = createMatrix (miss,match,gap,fasta1,fasta2)
sequence1 = fasta1.sequence;
sequence2 = fasta2.sequence;
firstMatrix = zeros(length(sequence1)+1,length(sequence2)+1);

for i = 1:length(sequence1)+1
    firstMatrix(i, 1) = ((i - 1) * gap);
end
for i=1:length(sequence2)+1
    firstMatrix(1,i) = ((i - 1) * gap);
end

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