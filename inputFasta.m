%Funkcja ta odpowiedzialna jest za pobieranie danych dotycących sekwencji
%od użytkownika z klawiatury, oraz przypisanie ich w odpowiedniej formie do
%danej wyjściowej.
function fastaContent = inputFasta()
fastaContent = struct('header',input('header: ', 's'),'sequence',input('sequence: ','s')); 
checkFile(fastaContent.sequence);
end

