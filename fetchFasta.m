% FETCHFATSA Funkcja umozliwiajaca pobranie ze strony ncbi sekwencji o okreslonym identyfikatorze
% 
% identifier - identyfikator w bazie NCBI
% 
% fastaContent - struktura zawierajaca sekwencje fasta
function fastaContent = fetchFasta(identifier)
URL = 'https://eutils.ncbi.nlm.nih.gov/entrez/eutils/efetch.fcgi';
fastaContent = urlread(URL,'get',{'db','nucleotide','rettype','fasta','id',identifier});
end