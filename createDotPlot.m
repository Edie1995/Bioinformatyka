function dots = createDotPlot(matrix1,matrix2)
x=length(matrix1);
y=length(matrix2);

dots=zeros(x,y);
for i=1:x
    for j=1:y
    if(matrix1(i)==matrix2(j))
        dots(i,j)=1;
    end
    end
end

end
