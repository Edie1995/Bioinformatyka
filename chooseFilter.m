%Funkcja ta ma za zadanie wybraæ odpowiedni filtr w zale¿noœci od tego,
%jakie parametry zosat³y podane. Jeœli brak parametrów, oznacza to, ¿e
%u¿ytkownik chce wpisaæ dane z klawiatury, jeœli jest tylko jeden parametr,
%traktowany on jest jako identyfikator do strony, natomiast drug¹ sekwencjê
%wpisuje siê z klawiatury. W przypadku dwóch parametrów, obie sekwencje
%pobierane s¹ ze strony.
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