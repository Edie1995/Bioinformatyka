%Funkcja ta odpowiedzialna jest za podzia� odczytanego pliku FASTA na
%nag��wek oraz sekwencj�. Pomijane s� puste linie. Pierwsza niepusta linia
%przypisywana jest nag��wkowi, ka�da kolejan niepusta, sekwencji.
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
