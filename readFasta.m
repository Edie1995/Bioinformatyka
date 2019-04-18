%READFASTA Podzia³ odczytanego pliku FASTA na
%nag³ówek oraz sekwencjê. Pomijane s¹ puste linie. Pierwsza niepusta linia
%przypisywana jest nag³ówkowi, ka¿da kolejan niepusta, sekwencji.
%
%file - plik w formacie fasta
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
