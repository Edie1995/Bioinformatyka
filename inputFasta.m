%INPUTFASTA Na podstawie wprowadzanych z klawiatury danych, generuje plik
%sekwencji nukleotydów reprezentuj¹cy plik fasta
%
%fastaContent = inputFasta() tworzy strukturê danych zawieraj¹c¹
%identyfikator, sekwencjê oraz nag³ówek
function fastaContent = inputFasta()
fastaContent = struct('header',input('header: ', 's'),'sequence',input('sequence: ','s')); 
checkFile(fastaContent.sequence);
end
