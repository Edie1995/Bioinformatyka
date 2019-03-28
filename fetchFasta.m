%Funkcja ta ma za zadanie pobranie danych FASTA o okre�lonym identyfikatorze 
%ze strony internetowej NCBI.
function fastaContent = fetchFasta(identifier)
URL = 'https://eutils.ncbi.nlm.nih.gov/entrez/eutils/efetch.fcgi';
fastaContent = urlread(URL,'get',{'db','nucleotide','rettype','fasta','id',identifier});
end