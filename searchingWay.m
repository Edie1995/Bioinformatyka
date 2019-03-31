function [aligmentMatrix,score]=searchingWay(firstMatrix)

[x,y]=size(firstMatrix);
aligmentMatrix=zeros(x,y);
aligmentMatrix(x,y)=1;
score=firstMatrix(x,y);
while x>=2&&y>=2
        max=firstMatrix(x-1,y-1);
        a=x-1;
        b=y-1;
        if(max<firstMatrix(x-1,y))
            max=firstMatrix(x-1,y);
            a=x-1;
            b=y;
        end
        if(max<firstMatrix(x,y-1))
            a=x;
            b=y-1;
        end
        
        aligmentMatrix(a,b)=1;
        x=a; 
        y=b;
end
end