%Fukcja ta na podsatwie otrzymanego rozmiaru okna i progu b��du sprawdza,
%czy wystarczaj�ca ilo�� gen�w w ramach jednegej przek�tnej okna jest ze sob� zgodna,
%je�li tak, w macierzy por�wnawczej miejsca te wype�niane s� jedynkami, w przeciwnym wypadku s�
%zerowane. Na przek�tnej musi znajdowa� si� co najmniej okno-prog
%pozytywnych warto�ci.
function [compareMatrix] = filterFile(okno,prog,dotPlot)

[x,y] = size(dotPlot);
v = ones(1, okno);

if okno > x || okno > y
    error('Zmniejsz okno!');
end

compareMatrix = zeros(x,y);

for i = okno:x 
    for j = okno:y 
       movingFrame = dotPlot(i - okno + 1:i,j - okno + 1:j) ;
       if sum(diag(movingFrame)) >= okno - prog 
           compareMatrix(i - okno + 1:i,j - okno + 1:j) = diag(v);
       end
    end
end
end
