function [plot, compareMatrix, label1, label2]=filter(okno, prog,fasta1, fasta2)

sequence1=fasta1.sequence;
sequence2=fasta2.sequence;

label1=fasta1.header;
label2=fasta2.header;

plot=createDotPlot(sequence1, sequence2);
[x,y]=size(plot);

if okno>x || okno>y
    error('Zmniejsz rozmiar okna!');
end

compareMatrix=zeros(x,y);

for i=okno:x 
    for j=okno:y 
       movingFrame=(plot(i-okno+1:i,j-okno+1:j)) ;
        if sum(diag(movingFrame))>=okno-prog 
          compareMatrix(i-okno+1:i,j-okno+1:j)=eye(okno);
        end
    end
end
makingPlots(plot,compareMatrix,label1, label2);
end
