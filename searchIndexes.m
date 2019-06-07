function [X,Y] = searchIndexes(lastMatrix)

[X,Y] = find(lastMatrix == min(lastMatrix>0),1,'first');
end