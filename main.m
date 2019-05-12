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
function [] = main(zadanie, path, fileName, varargin)
if(zadanie == 1)
    if(length(varargin) < 3)
        fasta1 = inputFasta;
        fasta2 = inputFasta;
        okno = varargin(1);
        prog = varargin(2);
    elseif(length(varargin) == 3)
        fasta1 = readFasta(fetchFasta(varargin(1)));
        fasta2 = inputFasta;
        okno = varargin(2);
        prog = varargin(3);
    elseif(length(varargin) == 4)
        if(contains(varargin(2),'.fasta'))
            fasta1 = readFasta(inputFileFasta(varargin(1),varargin(2)));
            fasta2 = inputFasta;
        else
            fasta1 = readFasta(fetchFasta(varargin(1)));
            fasta2 = readFasta(fetchFasta(varargin(2)));
        end
        okno = varargin(3);
        prog = varargin(4);
    elseif(length(varargin) == 5)
        if(contains(varargin(2),'.fasta'))
            fasta1 = readFasta(inputFileFasta(varargin(1),varargin(2)));
            fasta2 = readFasta(fetchFasta(varargin(3)));
        else
            fasta1 = readFasta(fetchFasta(varargin(1)));
            fasta2 = readFasta(inputFileFasta(varargin(2),varargin(3)));
        end
        okno = varargin(4);
        prog = varargin(5);
    elseif(length(varargin) == 6)
        fasta1 = readFasta(inputFileFasta(varargin(1),varargin(2)));
        fasta2 = readFasta(inputFileFasta(varargin(3),varargin(4)));
        okno = varargin(5);
        prog = varargin(6);
    end
    dotPlot = createDotPlot(fasta1.sequence,fasta2.sequence);
    compareMatrix = filterFile(okno,prog,dotPlot);
    makingPlots(dotPlot,compareMatrix,fasta1.header,fasta2.header);
    saveFile(path,fileName);
    
elseif(zadanie == 2)
    if(length(varargin) < 5)
        fasta1 = inputFasta;
        fasta2 = inputFasta;
        mode = varargin(1);
        match = varargin(2);
        miss = varargin(3);
        gap = varargin(4);
    elseif(length(varargin) == 5)
        fasta1 = readFasta(fetchFasta(varargin(1)));
        fasta2 = inputFasta;
        mode = varargin(2);
        match = varargin(3);
        miss = varargin(4);
        gap = varargin(5);
    elseif(length(varargin) == 6)
        if(contains(varargin(2),'.fasta'))
            fasta1 = readFasta(inputFileFasta(varargin(1),varargin(2)));
            fasta2 = inputFasta;
        else
            fasta1 = readFasta(fetchFasta(varargin(1)));
            fasta2 = readFasta(fetchFasta(varargin(2)));
        end
        mode = varargin(3);
        match = varargin(4);
        miss = varargin(5);
        gap = varargin(6);
    elseif(length(varargin) == 7)
        if(contains(varargin(2),'.fasta'))
            fasta1 = readFasta(inputFileFasta(varargin(1),varargin(2)));
            fasta2 = readFasta(fetchFasta(varargin(3)));
        else
            fasta1 = readFasta(fetchFasta(varargin(1)));
            fasta2 = readFasta(inputFileFasta(varargin(2),varargin(3)));
        end
        mode = varargin(4);
        match = varargin(5);
        miss = varargin(6);
        gap = varargin(7);
    elseif(length(varargin) == 8)
        fasta1 = readFasta(inputFileFasta(varargin(1),varargin(2)));
        fasta2 = readFasta(inputFileFasta(varargin(3),varargin(4)));
        mode = varargin(5);
        match = varargin(6);
        miss = varargin(7);
        gap = varargin(8);
    end
    
    firstMatrix = createMatrix(miss,match,gap,fasta1,fasta2,mode);
    [aligmentMatrix,score] = searchingWay(firstMatrix,match,miss,gap,fasta1.sequence,fasta2.sequence);
    drawMatrix(firstMatrix,aligmentMatrix,fasta1.header,fasta2.header);
    writingSequence = writeSequence(aligmentMatrix,fasta1,fasta2);
    toTextFile(writingSequence,match,miss,gap,fasta1,fasta2,score,path,fileName,mode);
    saveFile(path,fileName);
    
elseif(zadanie == 3)
    if(length(varargin) < 4)
        fasta1 = inputFasta;
        fasta2 = inputFasta;
        pointsPath = varargin(1);
        pointsName = varargin(2);
        gap = varargin(3);
    elseif(length(varargin) == 4)
        fasta1 = readFasta(fetchFasta(varargin(1)));
        fasta2 = inputFasta;
        pointsPath = varargin(2);
        pointsName = varargin(3);
        gap = varargin(4);
    elseif(length(varargin) == 5)
        if(contains(varargin(2),'.fasta'))
            fasta1 = readFasta(inputFileFasta(varargin(1),varargin(2)));
            fasta2 = inputFasta;
        else
            fasta1 = readFasta(fetchFasta(varargin(1)));
            fasta2 = readFasta(fetchFasta(varargin(2)));
        end
        pointsPath = varargin(3);
        pointsName = varargin(4);
        gap = varargin(5);
    elseif(length(varargin) == 6)
        if(contains(varargin(2),'.fasta'))
            fasta1 = readFasta(inputFileFasta(varargin(1),varargin(2)));
            fasta2 = readFasta(fetchFasta(varargin(3)));
        else
            fasta1 = readFasta(fetchFasta(varargin(1)));
            fasta2 = readFasta(inputFileFasta(varargin(2),varargin(3)));
        end
        pointsPath = varargin(4);
        pointsName = varargin(5);
        gap = varargin(6);
    elseif(length(varargin) == 7)
        fasta1 = readFasta(inputFileFasta(varargin(1),varargin(2)));
        fasta2 = readFasta(inputFileFasta(varargin(3),varargin(4)));
        pointsPath = varargin(5);
        pointsName = varargin(6);
        gap = varargin(7);
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
end