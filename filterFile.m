%Fukcja ta na podsatwie otrzymanego rozmiaru okna i progu b��du sprawdza,
%czy wystarczaj�ca ilo�� gen�w w ramach jednegej przek�tnej okna jest ze sob� zgodna,
%je�li tak, w macierzy por�wnawczej miejsca te wype�niane s� jedynkami, w przeciwnym wypadku s�
%zerowane. Na przek�tnej musi znajdowa� si� co najmniej okno-prog
%pozytywnych warto�ci.
function [dotPlot,compareMatrix,label1,label2] = filterFile(okno,prog,fasta1,fasta2)

sequence1 = fasta1.sequence;
sequence2 = fasta2.sequence;

label1 = fasta1.header;
label2 = fasta2.header;

dotPlot = createDotPlot(sequence1,sequence2);
[x,y] = size(dotPlot);

if okno > x || okno > y
    error('Zmniejsz okno!');
end

compareMatrix = zeros(x,y);

for i = okno:x 
    for j = okno:y 
       movingFrame = dotPlot(i - okno + 1:i,j - okno + 1:j) ;
       if sum(diag(movingFrame)) >= okno - prog 
           compareMatrix(i - okno + 1:i,j - okno + 1:j) = eye(okno);
       end
    end
end

makingPlots(dotPlot,compareMatrix,label1,label2);

end
