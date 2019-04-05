function nextMatrix = readTable(source,name,fasta1, fasta2)
T = readtable('C:\Users\Student.DESKTOP-VNR47RU\Desktop\matrix.txt','ReadRowNames',true)
fasta1 = readFasta(fetchFasta('FJ185310.1'));
fasta2 = readFasta(fetchFasta('FJ185309.1'));
seq1=fasta1.sequence;
seq2=fasta2.sequence;

X=T(1,1);
X=X{:,:};

for i = 1:length(seq1)
    if(
end
end