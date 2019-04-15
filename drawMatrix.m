%DRAWMATRIX Na podstawie dostarczonej macierzy kosztu oraz œcie¿kek
%dopasowania generowana jest wizaulna interpretacja podanych danych.
%
%firstMatrix - macierz kosztu
%aligmentCell - komórka zawieraj¹ca poszczególne macierze kropkowe
%reprezentuj¹ce œcie¿kê dopasowania
%seq1, seq2 - identyfikatory odpowiednich sekwencji
function [] = drawMatrix(firstMatrix, aligmentCell,seq1,seq2)
figure
hold on
imagesc(firstMatrix);
colors = ['r','g','b','y','o','w','m','c','k'];
for i = 1:size(aligmentCell)
    hold on
    spy(cell2mat(aligmentCell{i}),colors(i))
end

xlabel(seq2);
ylabel(seq1);
legend;

colorbar
ax = gca;

ax.XAxisLocation = 'top';
hold off
end