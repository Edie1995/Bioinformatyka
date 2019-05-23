%CHECKFILE Sprawdza, czy podana sekwencja nie zawiera niedopuszczalnych
%znaków, je¿eli tak, funkcj koñczy program zwracaj¹c b³¹d "z³y kod"
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