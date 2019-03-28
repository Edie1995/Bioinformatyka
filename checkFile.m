% Funkcja ta ma za zadanie sprawdziæ, czy nasza sekwencja zawiera wy³¹cznie poprawne znaki,
% dopuszczone s¹ znaki A, C, G, T, U oraz pusty znak i znak nowej linii. W
% przypadku, gdy wczytana sekwencja nie jest poprawna, wyœwietlany jest
% b³¹d i program zostaje zatrzymany.
function [] = checkFile(sequence)
permission = '[A,C,G,T,U,"",newline]';
for i = 1:length(sequence)
   if(~regexp(permission,sequence(i)))
      error("zly kod");
   end
end
end
