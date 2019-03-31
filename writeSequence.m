function writeSequence = writeSequence(aligmentMatrix, fasta1,fasta2)
seq1=fasta1.sequence;
seq2=fasta2.sequence;
numSeq1=length(seq1);
numSeq2=length(seq2);
[x,y]=size(aligmentMatrix);
madeSeq1=seq1(numSeq1);
madeSeq2=seq2(numSeq2);
gaps=0;
identity=0;
lengthWay=1;
while x>=2&&y>=2
        if(aligmentMatrix(x-1,y)==1)
           numSeq1=numSeq1-1;
           if(numSeq1>0)
           madeSeq1=strcat(seq1(numSeq1),madeSeq1);
           end
           madeSeq2=strcat('-',madeSeq2);
           a=x-1;
           b=y;
           gaps=gaps+1;
        elseif(aligmentMatrix(x,y-1)==1)
             madeSeq1=strcat('-',madeSeq1);
           numSeq2=numSeq2-1;
           if(numSeq2>0)
           madeSeq2=strcat(seq2(numSeq2),madeSeq2);
           end
           a=x;
           b=y-1;
           gaps=gaps+1;
            
        else
           numSeq1=numSeq1-1;
            numSeq2=numSeq2-1;
            if(numSeq1>0)
           madeSeq1=strcat(seq1(numSeq1),madeSeq1);
            end
            if(numSeq2>0)
           madeSeq2=strcat(seq2(numSeq2),madeSeq2);
            end
            a=x-1;
            b=y-1;
        end
        x=a;
        y=b;
     lengthWay=lengthWay+1;       
end

while a>1
   if (aligmentMatrix(a-1,b)==1)
           numSeq1=numSeq1-1;
           if(numSeq1>0)
           madeSeq1=strcat(seq1(numSeq1),madeSeq1);
           end
           madeSeq2=strcat('-',madeSeq2);
           
           gaps=gaps+1;
           lengthWay=lengthWay+1;       
   end 
   a=a-1;
end
while b>1
  if(aligmentMatrix(a,b-1)==1)
             madeSeq1=strcat('-',madeSeq1);
           numSeq2=numSeq2-1;
           if(numSeq2>0)
           madeSeq2=strcat(seq2(numSeq2),madeSeq2);
           end
         
           gaps=gaps+1;  
           lengthWay=lengthWay+1;       
  end
    b=b-1;
end

if(length(madeSeq1)<length(madeSeq2))
    n=length(madeSeq1);
else
    n=length(madeSeq2);
end
madeSeq3='';
for i=1:n
    if(madeSeq1(i)==madeSeq2(i))
        madeSeq3=strcat(madeSeq3,"|");
        identity=identity+1;
    else
         madeSeq3=strcat(madeSeq3," ");
    end    
end
writeSequence = struct('gaps',gaps,'identity',identity,'lengthWay',lengthWay,'madeSeq1',madeSeq1,'madeSeq2',madeSeq2,'madeSeq3',madeSeq3); 
end