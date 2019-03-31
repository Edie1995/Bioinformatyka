%Funkcja ta ma za zadanie wybra� odpowiedni filtr w zale�no�ci od tego,
%jakie parametry zosat�y podane. Je�li brak parametr�w, oznacza to, �e
%u�ytkownik chce wpisa� dane z klawiatury, je�li jest tylko jeden parametr,
%traktowany on jest jako identyfikator do strony, natomiast drug� sekwencj�
%wpisuje si� z klawiatury. W przypadku dw�ch parametr�w, obie sekwencje
%pobierane s� ze strony.
function [] = chooseFilter(miss,match,gap,path,jpgFileName,txtFileName,varargin)
if(length(varargin) < 1)
    fasta1=inputFasta;
    fasta2=inputFasta;    
elseif(length(varargin) == 1)
    fasta1=readFasta(fetchFasta(varargin(1)));
    fasta2=inputFasta;   
elseif(length(varargin) == 2)
    fasta1=readFasta(fetchFasta(varargin(1)));
    fasta2=readFasta(fetchFasta(varargin(2))); 
elseif(length(varargin)==4)
    fasta1=readFasta(inputFileFasta(varargin(1),varargin(2)));
    fasta2=readFasta(inputFileFasta(varargin(3),varargin(4))); 
end 
 firstMatrix=createMatrix(miss,match,gap,fasta1,fasta2);
[aligmentMatrix,score]=searchingWay(firstMatrix);
drawMatrix(firstMatrix,aligmentMatrix,'seq1','seq2');
writingSequence=writeSequence(aligmentMatrix,fasta1,fasta2);
toTextFile(writingSequence,match,miss,gap,fasta1,fasta2,score,path,txtFileName);
saveFile(path,jpgFileName);
end