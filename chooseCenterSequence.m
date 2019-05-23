% CHOOSECENTERSEQUENCE funkcja wybierajaca sekwencje srodkowa
% 
% score - macierz poszczegolnych punktacji dopasowan 
function [M,I] = chooseCenterSequence(score)
sums = zeros(length(score),1);
for i = 1:length(score)
    for j = 1:length(score)
        sums(i) = sums(i) + score(i,j);
    end
end
[M,I] = min(sums);
end