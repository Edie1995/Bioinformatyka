%Funkcja ta odpowiedzialna jest za pobieranie danych dotycących sekwencji
%od użytkownika z klawiatury, oraz przypisanie ich w odpowiedniej formie do
%danej wyjściowej.
function fastaContent=inputFasta()
fastaContent = struct('identifier',input('identifier: ', 's'),'sequence',input('sequence: ','s'),'header',input('header: ', 's')); 
checkFile(fastaContent.sequence);
end

