%Funkcja ta odpowiedzialna jest za pobieranie danych dotyc¹cych sekwencji
%od u¿ytkownika z klawiatury, oraz przypisanie ich w odpowiedniej formie do
%danej wyjœciowej.
function fastaContent=inputFasta()
fastaContent = struct('identifier',input('identifier: ', 's'),'sequence',input('sequence: ','s'),'header',input('header: ', 's')); 
checkFile(fastaContent.sequence);
end

