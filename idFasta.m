%IDFASTA Z nag�owka tekstu FASTA odseparowuje samo ID
%
%header - nag��wek sekwencji fasta
function id = idFasta(header)
idLine = split(header);
idFirst = idLine{1,1};
id = idFirst(2:end);
end