%DRWAWMATRIX rysuje macierz kosztu w kolorach
%odpowiadaj¹cym odpowiednim wartoœciom oraz nanosi na macierz œcie¿kê
%dopasowania
%
%firstMatrix - stworzona macierz kosztu
%aligmentMatrix - macie¿ optymalnego globalnego dopasowania zawieraj¹ca
%jedynki w miejsu w którym ma siê znaleŸæ punkt
%seq1-nag³ówek sekwencji pierwszej 
%seq2-nag³ówek sekwencji drugiej
function [] = drawMatrix(firstMatrix, aligmentMatrix,seq1,seq2)
figure
hold on
imagesc(firstMatrix);
spy(aligmentMatrix,'r');
xlabel(seq2);
ylabel(seq1);
colorbar
ax = gca;
ax.XAxisLocation = 'top';
hold off
end