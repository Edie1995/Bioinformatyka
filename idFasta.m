%Funkcja ta z nag³owka tekstu FASTA odseparowuje samo ID
function id = idFasta(header)
idLine = split(header);
idFirst = idLine{1,1};
id = idFirst(2:end);
end