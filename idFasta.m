%IDFASTA Odziela specyficzny dla sekwencji identyfikator od pe³nej nazwy
%nag³ówka
function id = idFasta(header)
idLine = split(header);
idFirst = idLine{1,1};
id = idFirst(2:end);
end