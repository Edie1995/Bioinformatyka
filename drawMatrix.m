%Funkcja odpowiedzialna za rysowanie macierzy kosztu w kolorach
%odpowiadaj�cym odpowiednim warto�ciom. 
function [] = drawMatrix(firstMatrix, aligmentMatrix,seq1,seq2)
figure
hold on

imagesc(firstMatrix);

spy(aligmentMatrix);

xlabel(seq2);
ylabel(seq1);

colorbar
ax = gca;

ax.XAxisLocation = 'top';
hold off
end