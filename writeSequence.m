%WRIETSEQUENCE Tworzenie zapisu odpowiednich ci�g�w sekwencji nukleotyd�w i
%ich przerw oraz znak�w dopasowania.
%
%aligmentMatrix - macierz wyznaczaj�ca si��k� dopasowania
%fasta1 - pierwsza struktura zawieraj�ca sekwencj� odczytan� z formatu
%fasta
%fasta2 - druga struktura zawieraj�ca sekwencj� odczytan� z formatu
%fasta
%tabHelper - tablica zawierajaca informacje na tamet przerw w macierzy centarlnej
% k - indeks przyrownywanej sekwencji
% 
%writeSequence1 - struktura zawiraj�ca dopasowana sekwencje centralna w postaci ci�gu
%znak�w oraz ilo�� przerw, ilo�� dopasowa� oraz d�ugo�� drogi optymalnego
%dopasowania
%writeSequence2 - struktura zawiraj�ca dopasowana sekwencje druga w postaci ci�gu
%znak�w oraz ilo�� przerw, ilo�� dopasowa� oraz d�ugo�� drogi optymalnego
% dopasowania
% doneTab - tablica zawierajaca informacje na tamet przerw w macierzy centarlnej
function [writeSequence1,writeSequence2,doneTab] = writeSequence(aligmentMatrix, fasta1,fasta2,tabHelper,k)
seq1 = fasta1;
seq2 = fasta2;
numSeq1 = length(seq1) + 1;
numSeq2 = length(seq2) + 1;
numTab = length(char(tabHelper)) + 1;
[x,y] = size(aligmentMatrix);
madeSeq1 = '';
madeSeq2 = '';
madeHelper = '';
while x >= 2 && y >= 2
    if(aligmentMatrix(x - 1,y) == 1)
        numSeq1 = numSeq1 - 1;
        numTab = numTab - 1;
        if(numSeq1 > 0)
            madeSeq1 = strcat(seq1(numSeq1),madeSeq1);
            madeHelper = strcat(tabHelper(numTab),madeHelper);
        end
        madeSeq2 = strcat('-',madeSeq2);
        a = x - 1;
        b = y;
    elseif(aligmentMatrix(x,y - 1) == 1)
        madeSeq1 = strcat('-',madeSeq1);
        madeHelper = strcat(num2str(k),madeHelper);
        numSeq2 = numSeq2 - 1;
        if(numSeq2 > 0)
            madeSeq2 = strcat(seq2(numSeq2),madeSeq2);
        end
        a = x;
        b = y - 1;
        
    else
        numSeq1 = numSeq1 - 1;
        numTab = numTab - 1;
        numSeq2 = numSeq2 - 1;
        if(numSeq1 > 0)
            madeSeq1 = strcat(seq1(numSeq1),madeSeq1);
            madeHelper = strcat(tabHelper(numTab),madeHelper);
        end
        if(numSeq2 > 0)
            madeSeq2 = strcat(seq2(numSeq2),madeSeq2);
        end
        a = x - 1;
        b = y - 1;
    end
    x = a;
    y = b;
end
while a > 1
    if (aligmentMatrix(a - 1,b) == 1)
        numSeq1 = numSeq1 - 1;
        numTab = numTab - 1;
        if(numSeq1 > 0)
            madeSeq1 = strcat(seq1(numSeq1),madeSeq1);
            madeHelper = strcat(tabHelper(numTab),madeHelper);
        end
        madeSeq2 = strcat('-',madeSeq2);
        
    end
    a = a - 1;
end

while b > 1
    if(aligmentMatrix(a,b - 1) == 1)
        madeSeq1 = strcat('-',madeSeq1);
        madeHelper = strcat(num2str(k),madeHelper);
        numSeq2 = numSeq2 - 1;
        if(numSeq2 > 0)
            madeSeq2 = strcat(seq2(numSeq2),madeSeq2);
        end
        
    end
    b = b - 1;
end

writeSequence1 = struct('madeSeq2',madeSeq1);
writeSequence2 = struct('madeSeq2',madeSeq2);
doneTab = struct('tab',madeHelper);
end