%MAIN G³ówna funkcja programu, wywo³ywane s¹ w niej wszystkie pozosta³e
%funkcje pozosta³e funkcje programu
%
%pointsPath - œcie¿ka do pliku, w którym znajduje siê macierz substytucji
%pointsName - nazwa pliku, w którym znajduje siê macierz substytucji
%gap - kara za przerwê
%path - œcie¿ka, pod któr¹ maj¹ zapisywaæ siê okreœlone pliki
%fileName - podstawowa nazwa plików utorzonych za pomoc¹ programu
%varargin zawiera informacje odnoœnie sposobu wprowadzania formató fasta do
%programu
%
%length(varargin) < 1 obie sekwencje wpisywane s¹ z klawiatury
%
%length(varargin) == 1 jedna sekwencja pobierana jest ze strony, druga
%wpisywana z klawiatury
%
%length(varargin) == 2 je¿eli drugi element wejœciowy zawiera rozszerzenie
%fasta wówczas jest jedna sekwencja pobierana jest z pliku, druga z
%kawiatury. W przeciwnym wypadku obie sekwencje pobierane s¹ ze strony
%internetowej
%
%length(varargin) == 3 je¿eli drugi element wejœciowy zawiera rozszerzenie
%fasta wówczas jest jedna sekwencja pobierana jest z pliku, druga ze
%strony internetowej. W przeciwnym wypadku odczyt jest w odwrotnej
%kolejnoœci
%
%length(varargin) == 4 obie sekwencje poierane s¹ z pliku
function [] = main(pointsPath,pointsName,gap,path,fileName,varargin)

if(length(varargin) < 1)
    fasta1 = inputFasta;
    fasta2 = inputFasta; 

elseif(length(varargin) == 1)
    fasta1 = readFasta(fetchFasta(varargin(1)));
    fasta2 = inputFasta; 

elseif(length(varargin) == 2)
    if(contains(varargin(2),'.fasta'))
       fasta1 = readFasta(inputFileFasta(varargin(1),varargin(2)));
       fasta2 = inputFasta;
    else
       fasta1 = readFasta(fetchFasta(varargin(1)));
       fasta2 = readFasta(fetchFasta(varargin(2))); 
    end
    
elseif(length(varargin) == 3)
    if(contains(varargin(2),'.fasta'))
       fasta1 = readFasta(inputFileFasta(varargin(1),varargin(2)));
       fasta2 = readFasta(fetchFasta(varargin(3)));
    else
       fasta1 = readFasta(fetchFasta(varargin(1)));
       fasta2 = readFasta(inputFileFasta(varargin(2),varargin(3))); 
    end
    
elseif(length(varargin) == 4)
    fasta1 = readFasta(inputFileFasta(varargin(1),varargin(2)));
    fasta2 = readFasta(inputFileFasta(varargin(3),varargin(4))); 
end 
points = readTableOfPoints(pointsPath, pointsName);

firstMatrix = createMatrix(points,gap,fasta1,fasta2);

[aligmentCell,score,rowsOfMaxes, colsOfMaxes,rowsOfEnd, colsOfEnd] = searchingWay(firstMatrix,gap,fasta1.sequence,fasta2.sequence,points);

drawMatrix(firstMatrix,aligmentCell,fasta1.header,fasta2.header);

writingSequence = writeSequence(aligmentCell,rowsOfMaxes, colsOfMaxes,fasta1,fasta2);

toTextFile(points,writingSequence,gap,fasta1,fasta2,score,path,fileName);

toFastaFile(writingSequence,rowsOfMaxes, colsOfMaxes,rowsOfEnd,colsOfEnd,fasta1,fasta2,path,fileName);

saveFile(path,fileName);
end