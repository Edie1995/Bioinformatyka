function [] = chooseFunction(okno, prog,path,filename, varargin)
if(length(varargin)<1)
    filterFile(okno,prog,inputFasta,inputFasta);
elseif(length(varargin)==1)
    filterFile(okno, prog,readFasta(fetchFasta(varargi(1)),inputFasta))
elseif(length(varargin)==2)
    
    filterFile(okno,prog, readFasta(fetchFasta(varargin(1))),readFasta(fetchFasta(varargin(2))));
     
end 
    saveFile(path,filename);
end