# Conversion tables for mapping GO TERMS C5 pathways from GSEA to Parental Groups

Using the rrvgo R package, which leverages semantic similarity to cluster and reduce redundancy among Gene Ontology (GO) terms, we processed and formatted the resulting tables to link pathways to their corresponding GOBP names and GO IDs. The reduction was performed using a similarity threshold of 0.7, meaning that GO terms sharing ≥70% semantic similarity were grouped together under a representative “parent” term. This approach streamlines redundant GO terms into coherent functional blocks, facilitating the summarization and interpretation of biological processes at a higher level. The resulting conversion tables are designed so that users can easily generate their own customized plots or summaries, adapting the functional grouping to their specific analyses or visualization needs.

- C5 GO BP: [Conversion_table_GOBP_Parental.xlsx](Conversion_table_GOBP_Parental.xlsx)
- C5 GO MF: [Conversion_table_GOMF_Parental.xlsx](Conversion_table_GOMF_Parental.xlsx)
- C5 GO CC: [Conversion_table_GOCC_Parental.xlsx](Conversion_table_GOCC_Parental.xlsx)


- **C5 GO Biological Process (BP)** → [Download XLSX](https://github.com/guilledelavega/GO-C5-Pathways-to-Parental-Groups/raw/main/Conversion_table_GOBP_Parental.xlsx)
- **C5 GO Molecular Function (MF)** → [Download XLSX](https://github.com/guilledelavega/GO-C5-Pathways-to-Parental-Groups/raw/main/Conversion_table_GOMF_Parental.xlsx)
- **C5 GO Cellular Component (CC)** → [Download XLSX](https://github.com/guilledelavega/GO-C5-Pathways-to-Parental-Groups/raw/main/Conversion_table_GOCC_Parental.xlsx)
