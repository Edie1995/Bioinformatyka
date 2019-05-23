%INPUTFASTA Na podstawie wprowadzanych z klawiatury danych, generuje plik
%sekwencji nukleotyd�w reprezentuj�cy plik fasta
%
%fastaContent = inputFasta() tworzy struktur� danych zawieraj�c�
%identyfikator, sekwencj� oraz nag��wek
function fastaContent = inputFasta()
fastaContent = struct('header',input('header: ', 's'),'sequence',input('sequence: ','s')); 
checkFile(fastaContent.sequence);
end
