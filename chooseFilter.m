%Funkcja ta ma za zadanie wybraæ odpowiedni filtr w zale¿noœci od tego,
%jakie parametry zosat³y podane. Jeœli brak parametrów, oznacza to, ¿e
%u¿ytkownik chce wpisaæ dane z klawiatury, jeœli jest tylko jeden parametr,
%traktowany on jest jako identyfikator do strony, natomiast drug¹ sekwencjê
%wpisuje siê z klawiatury. W przypadku dwóch parametrów, obie sekwencje
%pobierane s¹ ze strony.
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