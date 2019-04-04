%Funkcja odpowiedzialna za rysowanie macierzy kosztu w kolorach
%odpowiadaj�cym odpowiednim warto�ciom. 
function [] = drawMatrix(firstMatrix, aligmentMatrix,seq1,seq2)
figure
hold on
%rysowanie macierzy kosztu
imagesc(firstMatrix);
%naniesienie kropkowanej najoptymalniejszej �cie�ki
spy(aligmentMatrix);
%podpisy osi
xlabel(seq2);
ylabel(seq1);
%ustawienie legendy kolor�w
colorbar
ax = gca;
%zmiana lokalizacji podpis�w osi x na g�r�
ax.XAxisLocation = 'top';
hold off
end