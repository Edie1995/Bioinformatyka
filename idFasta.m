%IDFASTA Z nag³owka tekstu FASTA odseparowuje samo ID
%
%header - nag³ówek sekwencji fasta
function id = idFasta(header)
idLine = split(header);
idFirst = idLine{1,1};
id = idFirst(2:end);
end