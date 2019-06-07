function [] = main(miss,match,gap,path,fileName,varargin)
if(miss<match || gap<match)
    warning ("cena za gap lub miss jest wieksza od match, wyniki moga byc niepoprawne!");    
    %% 
end
k=0;
for i = 1: length(varargin)
    if(contains(varargin(i),'.fasta'))
        fileSequenceStruct = readFasta(inputFileFasta(char(varargin(i))));
        for j = 1: length(fileSequenceStruct) 
            k=k+1;
            seqenceStruct(k) = fileSequenceStruct(j);
        end
    else
        fileSequenceStruct = readFasta(fetchFasta(char(varargin(i))));
        k=k+1;
        seqenceStruct(k) = fileSequenceStruct;
    end
end
idx = searchingCenter(miss,match,gap,seqenceStruct);
[aligmentSeqences, tabHelper] = searchAligment(miss,match,gap,idx,seqenceStruct);
matchSequences = addGapSign(aligmentSeqences,idx,tabHelper);
starAligment = addStar(matchSequences);
toTextFile(matchSequences,path,fileName,starAligment,seqenceStruct);
toFastaFile(matchSequences,seqenceStruct,path,fileName);
[~, lastMatrix] = searchingCenter(miss,match,gap,matchSequences);
divideMatrix(lastMatrix,seqenceStruct);

end