% MAIN Glowan funkcja wywolujaca program
% miss - punkty za niezgodnosc
% match - punkty za zgodnosc
% gap - punkty za przerwe
% path - sciezka do zapisu pliku
% filename - nazwa pliku do zapisu
% varargin - sciezki do plikow lub identyfikatory do sekwencji

function [] = main(miss,match,gap,path,fileName,varargin)

for i = 1 : length(varargin)
    if (contains(varargin(i),'.fasta'))
        emptySequences(i) = readFasta(inputFileFasta(varargin(i)));
    else
        emptySequences(i) = readFasta(fetchFasta(varargin(i)));
    end
end
score = searchingCostWay(match,miss,gap,emptySequences);
[M,I] = chooseCenterSequence(score);
[comparedSequences,tabHelper] = searchingBestAligment(match,miss,gap,I,emptySequences);
matchSequences = addGapSign(comparedSequences,I,tabHelper);
starAligment = addStar(matchSequences);
toTextFile(matchSequences,path,fileName,starAligment,emptySequences);
toFastaFile(matchSequences,emptySequences,path,fileName)
end