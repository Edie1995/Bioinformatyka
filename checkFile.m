%CHECKFILE Sprawdza, czy odczytane sewkwencje nie zawieraj�
%niedopuszczalnych zank�w. Je�eli tak, program jest przerywany i
%wy�wietlany jest error o tre�ci "z�y kod". Je�eli sekwencje s� poprawne,
%funkcja nic nie zwraca.
%permission - lista dopuszczalnych znak�w w sekwencji
function [] = checkFile(sequence)
permission = '[A,C,G,T,U,"",newline]';
for i = 1:length(sequence)
   if(~regexp(permission,sequence(i)))
      error("zly kod");
   end
end
end
