function fastaContent=inputFasta()

fastaContent = struct('identifier',input('identifier: ', 's') ,'sequence',input('sequence: ','s'),'header',input('header: ', 's')); 
checkFile(fastaContent.sequence);
end

