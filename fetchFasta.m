% FETCHFASTA funkja odpowiedzialna za pobieranie sekwencji fasta ze strony NCBI
% 
% identifier - identyfikator szukanej sekwencji
% 
% fastaContent - struktura zwierajaca sformatowana sekwencje fasta
function fastaContent = fetchFasta(identifier)
URL = 'https://eutils.ncbi.nlm.nih.gov/entrez/eutils/efetch.fcgi';
fastaContent = urlread(URL,'get',{'db','nucleotide','rettype','fasta','id',identifier});
end