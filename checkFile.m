% Funkcja ta ma za zadanie sprawdzi�, czy nasza sekwencja zawiera wy��cznie poprawne znaki,
% dopuszczone s� znaki A, C, G, T, U oraz pusty znak i znak nowej linii. W
% przypadku, gdy wczytana sekwencja nie jest poprawna, wy�wietlany jest
% b��d i program zostaje zatrzymany.
function [] = checkFile(sequence)
permission = '[A,C,G,T,U,"",newline]';
for i = 1:length(sequence)
   if(~regexp(permission,sequence(i)))
      error("zly kod");
   end
end
end
