function fastaContent=inputFasta()
% = ['>' input('identifier: ', 's'), char(10),input('sequence: ','s')];
fastaContent = struct('identifier',input('identifier: ', 's') ,'sequence',input('sequence: ','s'),'header',input('header: ', 's')); 
checkFile(fastaContent.sequence);
end

