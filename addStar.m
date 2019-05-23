% ADDSTAR Funkcja tworzaca ciag skladajacy sie ze spacji i * w miejscach w ktorych wystepuje pelne dopasownie
% 
% bestAligment - struktura zawierajaca ostatecznie dopasowane sekwencje
% 
% starAligment - lancuch dopasowanych *
function starAligment = addStar(bestAligment)
best = bestAligment(1).lastSeq;
starAligment = "";
for j = 1:length(best)
    helper = 0;
    for i = 2:length(bestAligment)
      if(bestAligment(i).lastSeq(j) == bestAligment(i-1).lastSeq(j)&& bestAligment(i).lastSeq(j)~='-')
          helper = helper + 1;
      end
    end
    if(helper == length(bestAligment)-1)
        starAligment = strcat(starAligment,"*");
    else
        starAligment = strcat(starAligment," ");
    end
end
end