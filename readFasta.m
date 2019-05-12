%READFASTA Fomatuje tekst w formacie fasta na nag³ówek, identyfikator oraz
%sekwencje
%
%file - odczytany z pliku lub ze strony tekst w formacie fasta
function dataFasta = readFasta(file)
newStr = splitlines(file);
lines = 0;
sequence = '';
header = "";
for i = 1:size(newStr)
    if(newStr(i,:) ~= "")
        if(lines == 0)
            header = newStr(i,:);
            lines = lines+1;
        else
            strpom = [sequence,newStr(i,:)];
            sequence = strjoin(strpom);
        end
    end
end
id = idFasta(header);
sequence(sequence == ' ') = [];
checkFile(char(sequence));
dataFasta = struct('identifier',id,'sequence',strtrim(sequence),'header',header); 
end
