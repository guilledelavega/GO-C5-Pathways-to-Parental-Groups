# Conversion tables for mapping GO TERMS C5 pathways from GSEA to Parental Groups

Using the rrvgo R package, which leverages semantic similarity to cluster and reduce redundancy among Gene Ontology (GO) terms, we processed and formatted the resulting tables to link pathways to their corresponding GOBP names and GO IDs. The reduction was performed using a similarity threshold of 0.7, meaning that GO terms sharing ≥70% semantic similarity were grouped together under a representative “parent” term. This approach streamlines redundant GO terms into coherent functional blocks, facilitating the summarization and interpretation of biological processes at a higher level. The resulting conversion tables are designed so that users can easily generate their own customized plots or summaries, adapting the functional grouping to their specific analyses or visualization needs.

- C5 GO BP: 
