function text = inputFileFasta(path, fileName)
sciezkaOdczytu=path+"\"+fileName;
text=fileread(sciezkaOdczytu);
end