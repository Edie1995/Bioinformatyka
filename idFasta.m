%IDFASTA Odziela specyficzny dla sekwencji identyfikator od pe�nej nazwy
%nag��wka

% header - naglowek do rozdzielnia

% id - otrzymany identyfikator
function id = idFasta(header)
idLine = split(header);
idFirst = idLine{1,1};
id = idFirst(1:end);
end