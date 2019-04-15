%INPUTFASTA Na podstawie wprowadzanych z klawiatury danych, generuje plik
%sekwencji nukleotydów reprezentujący plik fasta
%
%fastaContent = inputFasta() tworzy strukturę danych zawierającą
%identyfikator, sekwencję oraz nagłówek
function fastaContent = inputFasta()
fastaContent = struct('identifier',input('identifier: ', 's'),'sequence',input('sequence: ','s'),'header',input('header: ', 's')); 
checkFile(fastaContent.sequence);
end

