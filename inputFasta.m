%INPUTFASTA Pobiera dane dotyce sekwencji
%od użytkownika z klawiatury, oraz przypisuje je w odpowiedniej formie do
%struktury wyjściowej.
function fastaContent = inputFasta()
fastaContent = struct('header',input('header: ', 's'),'sequence',input('sequence: ','s')); 
checkFile(fastaContent.sequence);
end

