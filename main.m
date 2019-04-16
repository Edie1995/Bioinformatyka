%Funkcja ta ma za zadanie wybraæ odpowiedni filtr w zale¿noœci od tego,
%jakie parametry zosat³y podane.  
function [] = main(miss,match,gap,path,jpgFileName,txtFileName,varargin)
%Jeœli brak parametrów, oznacza to, ¿e
%u¿ytkownik chce wpisaæ dane z klawiatury
if(length(varargin) < 1)
    fasta1 = inputFasta;
    fasta2 = inputFasta; 
%Jeœli jest tylko jeden parametr, traktowany on jest jako identyfikator
%do strony, natomiast drug¹ sekwencjê wpisuje siê z klawiatury.
elseif(length(varargin) == 1)
    fasta1 = readFasta(fetchFasta(varargin(1)));
    fasta2 = inputFasta; 
%W przypadku dwóch parametrów, jeœli drugi argument 
%nie zawiera rozszerzenia fasta obie sekwencje pobierane s¹ ze strony. W
%przecownym wypadku, jedna z sekwencji wpisywana jest przez u¿ytkownika a
%druga pobierana z pliku. 
elseif(length(varargin) == 2)
    if(contains(varargin(2),'.fasta'))
       fasta1 = readFasta(inputFileFasta(varargin(1),varargin(2)));
       fasta2 = inputFasta;
    else
       fasta1 = readFasta(fetchFasta(varargin(1)));
       fasta2 = readFasta(fetchFasta(varargin(2))); 
    end
%W przypadku trzech parametrów, jeœli drugi argument 
%zawiera rozszerzenie fasta pierwsza sekwencja pobierana jest z pliku a druga ze strony.
%W przecownym wypadku, jedna z sekwencji wpisywana jest przez u¿ytkownika a
%druga pobierana z pliku.     
elseif(length(varargin) == 3)
    if(contains(varargin(2),'.fasta'))
       fasta1 = readFasta(inputFileFasta(varargin(1),varargin(2)));
       fasta2 = readFasta(fetchFasta(varargin(3)));
    else
       fasta1 = readFasta(fetchFasta(varargin(1)));
       fasta2 = readFasta(inputFileFasta(varargin(2),varargin(3))); 
    end
%Przy 4 parametrach varargon, obie sekwencje pobierane s¹ z plików    
elseif(length(varargin) == 4)
    fasta1 = readFasta(inputFileFasta(varargin(1),varargin(2)));
    fasta2 = readFasta(inputFileFasta(varargin(3),varargin(4))); 
end 

firstMatrix = createMatrix(miss,match,gap,fasta1,fasta2);
[aligmentMatrix,score] = searchingWay(firstMatrix,match,miss,gap);
drawMatrix(firstMatrix,aligmentMatrix,fasta1.header,fasta2.header);
writingSequence = writeSequence(aligmentMatrix,fasta1,fasta2);
toTextFile(writingSequence,match,miss,gap,fasta1,fasta2,score,path,txtFileName);
saveFile(path,jpgFileName);
end