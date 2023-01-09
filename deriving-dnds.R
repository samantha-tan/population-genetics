library(biomartr)

# download all coding sequences for Covid-19
Covid_19_file <- biomartr::getCDS(organism = "GCF_009858895.2", path = getwd())

# download all coding sequences for SARS
SARS_file <- biomartr::getCDS(organism = "GCF_000864885.1", path = getwd())

# compute dN/dS values for SARS and Covid-19
Covid_19_vs_Sars_dNdS <- 
  dNdS(query_file      = Covid_19_file,
       subject_file    = SARS_file,
       delete_corrupt_cds = FALSE,
       ortho_detection = "RBH", 
       aa_aln_type     = "multiple",
       aa_aln_tool     = "clustalo", 
       codon_aln_tool  = "pal2nal", 
       dnds_est.method = "Comeron", 
       comp_cores      = 1 )

# store result in Excel readable csv file
install.packages("readr")
readr::write_excel_csv(Covid_19_vs_Sars_dNdS, "Covid_19_vs_Sars_dNdS.csv")
