# 🧬 GO-C5 Pathways → Parental Groups Conversion Tables  

Using the **rrvgo** R package, which leverages *semantic similarity* to cluster and reduce redundancy among **Gene Ontology (GO)** terms, we processed and formatted tables that link pathways to their corresponding GO names and IDs.  

Reduction was performed using a **similarity threshold of 0.7**, meaning that GO terms sharing ≥70% semantic similarity were grouped under a representative *“parent”* term.  
This approach streamlines redundant GO terms into coherent functional blocks, facilitating biological interpretation at a higher level.  

These conversion tables allow users to easily build customized plots or summaries, adapting the functional grouping to their specific analyses or visualization needs.  

---

### 🧩 Reproducibility  
The full code used for generating the parental GO mapping tables is available here:
[rrvgo Code](https://github.com/guilledelavega/GO-C5-Pathways-to-Parental-Groups/blob/main/rrvgo_GO_parent_mapping.R)

All tables were generated from **MSigDB C5 gene sets** (`GO:BP`, `GO:MF`, `GO:CC`) using:  
- [`rrvgo`](https://bioconductor.org/packages/rrvgo/) for semantic reduction  
- [`msigdbr`](https://cran.r-project.org/package=msigdbr) for GO term retrieval  
- [`org.Hs.eg.db`](https://bioconductor.org/packages/org.Hs.eg.db/) for ontology mapping
 

**Similarity method:** `Rel`  
**Threshold:** `0.7` (medium reduction)  
**Organism:** *Homo sapiens* 🧍‍♂️  

---


### 📊 Download Conversion Tables  

| Ontology Category | Description | Download Link |
|-------------------|--------------|----------------|
| 🧠 **Biological Process (BP)** | Grouped functional biological processes | [⬇️ Download GO:BP](https://github.com/guilledelavega/GO-C5-Pathways-to-Parental-Groups/raw/main/Conversion_table_GOBP_Parental.xlsx) |
| ⚙️ **Molecular Function (MF)** | Clustered molecular function terms | [⬇️ Download GO:MF](https://github.com/guilledelavega/GO-C5-Pathways-to-Parental-Groups/raw/main/Conversion_table_GOMF_Parental.xlsx) |
| 🧫 **Cellular Component (CC)** | Consolidated cellular component categories | [⬇️ Download GO:CC](https://github.com/guilledelavega/GO-C5-Pathways-to-Parental-Groups/raw/main/Conversion_table_GOCC_Parental.xlsx) |

---

