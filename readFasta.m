function dataFasta = readFasta(file)
newStr = splitlines(file);
lines=0;
sequence="";
header="";
for i=1:length(newStr)
    if(newStr(i,:)~="")
        if(lines==0)
        header=newStr(i,:);
        lines=lines+1;
        else
        sequence=strjoin(newStr(i,:));
        end
    end
end
id=idFasta(header);
checkFile(sequence);
dataFasta = struct('identifier',id ,'sequence',sequence,'header',header); 
end
