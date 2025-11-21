###############################################
########## LOAD REQUIRED PACKAGES #############
###############################################

library(dplyr)
library(stringr)
library(openxlsx)
library(msigdbr)
library(rrvgo)
library(org.Hs.eg.db)
library(GO.db)


###############################################
########## RRVGO FOR C5 GO CATEGORIES #########
###############################################
# This loop runs rrvgo for:
#   - GO:BP (Biological Process)
#   - GO:MF (Molecular Function)
#   - GO:CC (Cellular Component)
# and generates a conversion table (child GO → parent GO)
# for each ontology, writing one Excel file per ontology.

go_settings = data.frame(
  ont      = c("BP",   "MF",    "CC"),
  subcat   = c("GO:BP","GO:MF","GO:CC"),
  prefix   = c("GOBP","GOMF","GOCC"),
  stringsAsFactors = FALSE
)

for (i in seq_len(nrow(go_settings))) {
  
  ont    = go_settings$ont[i]      # "BP", "MF", "CC"
  subcat = go_settings$subcat[i]   # "GO:BP", "GO:MF", "GO:CC"
  prefix = go_settings$prefix[i]   # "GOBP", "GOMF", "GOCC"
  
  message("Processing ontology: ", ont, " (", subcat, ")")
  
  ##############################
  # 1) Get C5 GO gene sets
  ##############################
  c5_sets = msigdbr(
    species    = "Homo sapiens",
    category   = "C5",
    subcategory = subcat
  )
  
  # Extract GO ID from gs_url
  sets_GO = c5_sets %>%
    distinct(gs_name, gs_id, gs_url) %>%
    mutate(GO_ID = stringr::str_extract(gs_url, "GO:\\d+")) %>%
    filter(!is.na(GO_ID))
  
  ##############################
  # 2) Semantic similarity matrix
  ##############################
  simMatrix = calculateSimMatrix(
    sets_GO$GO_ID,
    orgdb  = "org.Hs.eg.db",
    ont    = ont,    # "BP", "MF", or "CC"
    method = "Rel"   # "Resnik", "Lin", "Rel", "Jiang", "Wang"
  )
  
  ##############################
  # 3) Reduce redundant GO terms
  ##############################
  reducedTerms = reduceSimMatrix(
    simMatrix,
    threshold = 0.7,        # Medium similarity threshold
    orgdb     = "org.Hs.eg.db"
  )
  
  ##############################
  # 4) Build conversion table
  ##############################
  conversion_table = reducedTerms %>%
    dplyr::select(go, parent, term, parentTerm)
  
  # Sanity check: all reduced terms exist in the MSigDB set
  stopifnot(all(conversion_table$go %in% sets_GO$GO_ID))
  
  sets_GO_clean = sets_GO %>%
    dplyr::select(gs_name, GO_ID)
  
  # Rename to generic names (prefix-dependent)
  colnames(sets_GO_clean) = c(paste0(prefix, "_Name"), "go")
  
  # Merge to attach full pathway names to child GO IDs
  conversion_table = merge(
    conversion_table,
    sets_GO_clean,
    by = "go"
  )
  
  # Reorder columns
  conversion_table = conversion_table %>%
    dplyr::select(
      dplyr::all_of(paste0(prefix, "_Name")),
      term,
      parentTerm,
      go,
      parent
    )
  
  # Final column names
  colnames(conversion_table) = c(
    paste0(prefix, "_Name"),         # Original MSigDB name
    paste0(prefix, "_Name_rrvgo"),   # Reduced term name (rrvgo term)
    "ParentalGroup",                 # Parent term name
    paste0(prefix, "_ID"),           # Child GO ID
    paste0(prefix, "_Parental")      # Parent GO ID
  )
  
  ##############################
  # 5) Write Excel file
  ##############################
  out_file = paste0("~/Conversion_table_", prefix, "_Parental.xlsx")
  
  write.xlsx(
    conversion_table,
    out_file
  )
  
  message("Written: ", out_file, "\n")
}

