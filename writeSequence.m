%Funkcja odpowiedzialna za stworzenie odpowiednich ci�g�w sekwencji
%nukleotyd�w i ich przerw oraz znak�w dopasowania.
function writeSequence = writeSequence(aligmentMatrix, fasta1,fasta2)
%Odczytanie odpowiednich warto�ci z argument�w wej�ciowych i przyspisanie
%ich do zmiennych
%seq1 - pierwsza sekwencja
%seq2 - druga sekwencja
seq1 = fasta1.sequence;
seq2 = fasta2.sequence;
%D�go�ci przekazanych do funkcji sekwencji
numSeq1 = length(seq1);
numSeq2 = length(seq2);
[x,y] = size(aligmentMatrix);
%Stworzenie nowych sekwecji, w kt�re wstawiane b�d� znaki przerw
madeSeq1 = seq1(numSeq1);
madeSeq2 = seq2(numSeq2);
%Przypisanie pocz�tkowych warto�ci zmienych odpowiedzialnych za ilo��
%przerw, ilo�� dopasowa� oraz d�ugo�� drogi.
gaps = 0;
identity = 0;
lengthWay = 1;
%P�tla ta wyszukuje, czy �cie�ka idzie po skosie, w lewo, czy do g�ry. W
%zalezno�ci od wyniku (je�li w g�r� to generowany jest znak przerwy '-'
%w pierwszej sekwencji, je�li w bok to znak przerwy w drugiej sekwencji,
%jesli po skosie przepisywane s� oba znaki bez zmian.
while x >= 2 && y >= 2
        if(aligmentMatrix(x - 1,y) == 1)
           numSeq1 = numSeq1 - 1;
           if(numSeq1 > 0)
           madeSeq1 = strcat(seq1(numSeq1),madeSeq1);
           end
           madeSeq2 = strcat('-',madeSeq2);
           a = x - 1;
           b = y;
           gaps = gaps + 1;
        elseif(aligmentMatrix(x,y - 1) == 1)
           madeSeq1 = strcat('-',madeSeq1);
           numSeq2 = numSeq2 - 1;
           if(numSeq2 > 0)
           madeSeq2 = strcat(seq2(numSeq2),madeSeq2);
           end
           a = x;
           b = y - 1;
           gaps = gaps + 1;
            
        else
           numSeq1 = numSeq1 - 1;
           numSeq2 = numSeq2 - 1;
            if(numSeq1 > 0)
                madeSeq1 = strcat(seq1(numSeq1),madeSeq1);
            end
            if(numSeq2 > 0)
                madeSeq2 = strcat(seq2(numSeq2),madeSeq2);
            end
            a = x - 1;
            b = y - 1;
        end
        x = a;
        y = b;
     lengthWay = lengthWay + 1;       
end
%Uzupe�nianie '-' je�li jedna z macierzy sko�czy si� szybciej ni� druga
while a > 1
   if (aligmentMatrix(a - 1,b) == 1)
           numSeq1 = numSeq1 - 1;
           if(numSeq1 > 0)
           madeSeq1 = strcat(seq1(numSeq1),madeSeq1);
           end
           madeSeq2 = strcat('-',madeSeq2);
           gaps = gaps + 1;
           lengthWay = lengthWay + 1;       
   end 
   a = a - 1;
end

while b > 1
  if(aligmentMatrix(a,b - 1) == 1)
             madeSeq1 = strcat('-',madeSeq1);
           numSeq2 = numSeq2 - 1;
           if(numSeq2 > 0)
           madeSeq2 = strcat(seq2(numSeq2),madeSeq2);
           end
         
           gaps = gaps + 1;  
           lengthWay = lengthWay + 1;       
  end
    b = b - 1;
end

if(length(madeSeq1) < length(madeSeq2))
    n = length(madeSeq1);
else
    n = length(madeSeq2);
end
madeSeq3 = '';
%Por�wnywanie kolejnych znak�w nowych macierzy, je�li pojawi� si� takie
%same na tych samych miejscach i nie jest to znak przerwy, w�wczas
%generowany jest znak zgodno�ci w trzeciej sekwencji.
for i = 1:n
    if(madeSeq1(i) == madeSeq2(i))
        madeSeq3 = strcat(madeSeq3,"|");
        identity = identity + 1;
    else
         madeSeq3 = strcat(madeSeq3," ");
    end    
end
writeSequence = struct('gaps',gaps,'identity',identity,'lengthWay',lengthWay,'madeSeq1',madeSeq1,'madeSeq2',madeSeq2,'madeSeq3',madeSeq3); 
end