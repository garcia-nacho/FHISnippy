# Phylogenetic tree of samples from Group A Streptococcus (GAS)

The analysis is based on [snippy](https://github.com/tseemann/snippy) and it runs:   

1. SNP identification analysis against SASM4_Duke reference
2. Aligment cleaning operations ( snippy-core + snippy-clean_full_aln + run_gubbins + snp-sites)
3. Tree generation via FastTree

## Running the analysis.
To run the analysis you need to copy the fastq files from the GAS samples inside a folder (e.g ./fastq) and run the following command where <code>-e inputfodler= </code> points to the fodler that you have created.

 <code>docker run -it --rm -v $(pwd):/Data -e inputfolder="fastq" ghcr.io/garcia-nacho/fhisnippy</code>


## Results.
The results will be found in a folder called **"SnippyResults"** and it includes the SNPs aligned and a phylogenetic tree that you can drop with or without metadata in [Microreact](https://microreact.org/) to visualize it. 
