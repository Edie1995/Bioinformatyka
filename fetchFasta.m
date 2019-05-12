%FETCHFASTA Odczytuje pliki fasta o podanym identyfikatorze spod okre�lonego adresu
%
%fastaContent = fetchFasta(identifier) zwraca struktur� danych,
%reprezentuj�cych plik fasta
function fastaContent = fetchFasta(identifier)
URL = 'https://eutils.ncbi.nlm.nih.gov/entrez/eutils/efetch.fcgi';
fastaContent = urlread(URL,'get',{'db','nucleotide','rettype','fasta','id',identifier});
end