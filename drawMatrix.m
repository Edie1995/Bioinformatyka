%Funkcja odpowiedzialna za rysowanie macierzy kosztu w kolorach
%odpowiadaj¹cym odpowiednim wartoœciom. 
function [] = drawMatrix(firstMatrix, aligmentMatrix,seq1,seq2)
figure
hold on
%rysowanie macierzy kosztu
imagesc(firstMatrix);
%naniesienie kropkowanej najoptymalniejszej œcie¿ki
spy(aligmentMatrix);
%podpisy osi
xlabel(seq2);
ylabel(seq1);
%ustawienie legendy kolorów
colorbar
ax = gca;
%zmiana lokalizacji podpisów osi x na górê
ax.XAxisLocation = 'top';
hold off
end