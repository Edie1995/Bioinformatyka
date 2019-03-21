function []=saveFile(path,filename)
sciezka=path+"\"+filename;
print(sciezka,'-djpeg');
end