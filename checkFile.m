% CHECKFILE Funkcja sprawdzajaca, czy znaki znajdujace sie w sekwencji sa dpuszczalne
% 
% sequence - sekwencja do sprawdzenia
function [] = checkFile(sequence)
permission = '[A,C,D,E,F,G,H,I,K,L,M,N,P,Q,R,S,T,V,W,Y,U,"",newline]';
for i = 1:length(sequence)
   if(~regexp(permission,sequence(i)))
      error("zly kod");
   end
end
end