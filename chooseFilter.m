%Funkcja ta ma za zadanie wybra� odpowiedni filtr w zale�no�ci od tego,
%jakie parametry zosat�y podane. Je�li brak parametr�w, oznacza to, �e
%u�ytkownik chce wpisa� dane z klawiatury, je�li jest tylko jeden parametr,
%traktowany on jest jako identyfikator do strony, natomiast drug� sekwencj�
%wpisuje si� z klawiatury. W przypadku dw�ch parametr�w, obie sekwencje
%pobierane s� ze strony.
function [] = chooseFilter(miss,match,gap,path,filename,varargin)
if(length(varargin) < 1)
    fasta1=inputFasta;
    fasta2=inputFasta;    
elseif(length(varargin) == 1)
    fasta1=readFasta(fetchFasta(varargin(1)));
    fasta2=inputFasta;   
elseif(length(varargin) == 2)
    fasta1=readFasta(fetchFasta(varargin(1)));
    fasta2=readFasta(fetchFasta(varargin(2)));    
end 
 firstMatrix=createMatrix(miss,match,gap,fasta1,fasta2);
[aligmentMatrix,score]=searchingWay(firstMatrix);
drawMatrix(firstMatrix,aligmentMatrix,'seq1','seq2');
[gaps,identity,lengthWay,madeSeq1,madeSeq2,madeSeq3]=writeSequence(aligmentMatrix,fasta1,fasta2);
toTextFile(gaps,identity,lengthWay,madeSeq1,madeSeq2,madeSeq3,match,miss,gap,score);
saveFile(path,filename);
end