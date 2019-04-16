%Funkcja ta ma za zadanie wybra� odpowiedni filtr w zale�no�ci od tego,
%jakie parametry zosat�y podane.  
function [] = main(miss,match,gap,path,jpgFileName,txtFileName,varargin)
%Je�li brak parametr�w, oznacza to, �e
%u�ytkownik chce wpisa� dane z klawiatury
if(length(varargin) < 1)
    fasta1 = inputFasta;
    fasta2 = inputFasta; 
%Je�li jest tylko jeden parametr, traktowany on jest jako identyfikator
%do strony, natomiast drug� sekwencj� wpisuje si� z klawiatury.
elseif(length(varargin) == 1)
    fasta1 = readFasta(fetchFasta(varargin(1)));
    fasta2 = inputFasta; 
%W przypadku dw�ch parametr�w, je�li drugi argument 
%nie zawiera rozszerzenia fasta obie sekwencje pobierane s� ze strony. W
%przecownym wypadku, jedna z sekwencji wpisywana jest przez u�ytkownika a
%druga pobierana z pliku. 
elseif(length(varargin) == 2)
    if(contains(varargin(2),'.fasta'))
       fasta1 = readFasta(inputFileFasta(varargin(1),varargin(2)));
       fasta2 = inputFasta;
    else
       fasta1 = readFasta(fetchFasta(varargin(1)));
       fasta2 = readFasta(fetchFasta(varargin(2))); 
    end
%W przypadku trzech parametr�w, je�li drugi argument 
%zawiera rozszerzenie fasta pierwsza sekwencja pobierana jest z pliku a druga ze strony.
%W przecownym wypadku, jedna z sekwencji wpisywana jest przez u�ytkownika a
%druga pobierana z pliku.     
elseif(length(varargin) == 3)
    if(contains(varargin(2),'.fasta'))
       fasta1 = readFasta(inputFileFasta(varargin(1),varargin(2)));
       fasta2 = readFasta(fetchFasta(varargin(3)));
    else
       fasta1 = readFasta(fetchFasta(varargin(1)));
       fasta2 = readFasta(inputFileFasta(varargin(2),varargin(3))); 
    end
%Przy 4 parametrach varargon, obie sekwencje pobierane s� z plik�w    
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