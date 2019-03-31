function []=toTextFile(gaps,identity,lengthWay,seq1,seq2,seq3,match,mismatch,gap,score)
fileID = fopen('lab2.txt','w');
percentIdentity=identity/lengthWay*100;
percentGaps=gaps/lengthWay*100;
fprintf(fileID,'#1: %s\n#2: %s\n#Mode: distance\n#Match: %-10d\n#Mismatch: %-10d\n#Gap: %-10d\n#Score: %d\n#Length: %-10d\n','seq1','seq2',match,mismatch,gap,score,lengthWay);
fprintf(fileID,'#Indentity: %d%c%d(%.0f%%)\n#Gaps: %d%c%d(%.0f%%)\n',identity,'/',lengthWay,percentIdentity,gaps,'/',lengthWay,percentGaps);
fprintf(fileID,'%s\n%s\n%s',seq1,seq3,seq2); 
fclose(fileID);
end