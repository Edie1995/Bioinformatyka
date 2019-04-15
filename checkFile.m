%CHECKFILE Sprawdza, czy odczytane sewkwencje nie zawieraj¹
%niedopuszczalnych zanków. Je¿eli tak, program jest przerywany i
%wyœwietlany jest error o treœci "z³y kod". Je¿eli sekwencje s¹ poprawne,
%funkcja nic nie zwraca.
%permission - lista dopuszczalnych znaków w sekwencji
function [] = checkFile(sequence)
permission = '[A,C,G,T,U,"",newline]';
for i = 1:length(sequence)
   if(~regexp(permission,sequence(i)))
      error("zly kod");
   end
end
end
