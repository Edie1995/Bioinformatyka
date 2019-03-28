%Funkcja ta ma za zadanie wybra� odpowiedni filtr w zale�no�ci od tego,
%jakie parametry zosat�y podane. Je�li brak parametr�w, oznacza to, �e
%u�ytkownik chce wpisa� dane z klawiatury, je�li jest tylko jeden parametr,
%traktowany on jest jako identyfikator do strony, natomiast drug� sekwencj�
%wpisuje si� z klawiatury. W przypadku dw�ch parametr�w, obie sekwencje
%pobierane s� ze strony.
function [] = chooseFilter(okno,prog,path,filename,varargin)
if(length(varargin) < 1)
    filterFile(okno,prog,inputFasta,inputFasta);
elseif(length(varargin) == 1)
    filterFile(okno,prog,readFasta(fetchFasta(varargin(1)),inputFasta))
elseif(length(varargin) == 2)
    filterFile(okno,prog, readFasta(fetchFasta(varargin(1))),readFasta(fetchFasta(varargin(2))));
end 
saveFile(path,filename);
end