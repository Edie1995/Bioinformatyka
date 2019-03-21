function [] = chooseFunction(okno, prog,path,filename, varargin)
if(length(varargin)<1)
    filter(okno,prog,inputFasta,inputFasta);
elseif(length(varargin)==1)
    filter(okno, prog,readFasta(fetchFasta(varargin{1})),inputFasta)
elseif(length(varargin)==2)
    
    filter(okno,prog, readFasta(fetchFasta(varargin{1})),readFasta(fetchFasta(varargin{2})));
     
end 
    saveFile(path,filename);
end