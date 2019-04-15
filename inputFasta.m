%INPUTFASTA Na podstawie wprowadzanych z klawiatury danych, generuje plik
%sekwencji nukleotydów reprezentuj¹cy plik fasta
%
%fastaContent = inputFasta() tworzy strukturê danych zawieraj¹c¹
%identyfikator, sekwencjê oraz nag³ówek
function fastaContent = inputFasta()
fastaContent = struct('identifier',input('identifier: ', 's'),'sequence',input('sequence: ','s'),'header',input('header: ', 's')); 
checkFile(fastaContent.sequence);
end

