%CHECKFILE Sprawdza, czy podana sekwencja nie zawiera niedopuszczalnych
%znak�w, je�eli tak, funkcj ko�czy program zwracaj�c b��d "z�y kod"
%
%sequence - sekwencja do sprawdzenia
function [] = checkFile(sequence)
permission = '[A,C,G,T,U,"",newline]';
for i = 1:length(sequence)
   if(~regexp(permission,sequence(i)))
      error("zly kod");
   end
end
end