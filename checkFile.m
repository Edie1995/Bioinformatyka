function [] = checkFile(sequence)
permission='[A,C,G,T,U,"",newline]';
for i=1:length(sequence)
   if(regexp(permission,sequence(i)))
   else
      error("zly kod");
   end
end
end
