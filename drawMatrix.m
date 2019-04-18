%DRWAWMATRIX rysuje macierz kosztu w kolorach
%odpowiadaj�cym odpowiednim warto�ciom oraz nanosi na macierz �cie�k�
%dopasowania
%
%firstMatrix - stworzona macierz kosztu
%aligmentMatrix - macie� optymalnego globalnego dopasowania zawieraj�ca
%jedynki w miejsu w kt�rym ma si� znale�� punkt
%seq1-nag��wek sekwencji pierwszej 
%seq2-nag��wek sekwencji drugiej
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