%READFASTA Fomatuje tekst w formacie fasta na nag��wek, identyfikator oraz
%sekwencje
%
%file - odczytany z pliku lub ze strony tekst w formacie fasta
function dataFasta = readFasta(file)
newStr = splitlines(file);
lines = 0;
sequence = '';
header = "";
helper = 0;
for i = 1:size(newStr)
    if(strncmpi(newStr(i,1),'>',1))
        if(helper == 1)
            lines = lines + 1;
            id = idFasta(header);
            sequence(sequence == ' ') = [];
            checkFile(char(sequence));
            dataFasta(lines) = struct('identifier',id,'sequence',strtrim(sequence),'header',header);
            sequence = '';
        end
        headerF = char(newStr(i,:));
        header = headerF(2:end);
    else
        strpom = [sequence,newStr(i,:)];
        sequence = strjoin(strpom);
        helper = 1;
    end
end
lines = lines + 1;
id = idFasta(header);
sequence(sequence == ' ') = [];
checkFile(char(sequence));
dataFasta(lines) = struct('identifier',id,'sequence',strtrim(sequence),'header',header);
end