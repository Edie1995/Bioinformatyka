%INPUTFASTA Pobiera dane dotyce sekwencji
%od u¿ytkownika z klawiatury, oraz przypisuje je w odpowiedniej formie do
%struktury wyjœciowej.
function fastaContent = inputFasta()
fastaContent = struct('header',input('header: ', 's'),'sequence',input('sequence: ','s')); 
checkFile(fastaContent.sequence);
end

