%INPUTFASTA Na podstawie wprowadzanych z klawiatury danych, generuje plik
%sekwencji nukleotydów reprezentujący plik fasta
%
%fastaContent = inputFasta() tworzy strukturę danych zawierającą
%identyfikator, sekwencję oraz nagłówek
function fastaContent = inputFasta()
fastaContent = struct('header',input('header: ', 's'),'sequence',input('sequence: ','s')); 
checkFile(fastaContent.sequence);
end
