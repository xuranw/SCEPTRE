# sceptre function arguments; these arguments should be defined in terms of "offsite_dir"
# offsite_dir <- "/Volumes/tims_new_drive/research/sceptre_files"
small_example <- FALSE

processed_dir <- paste0(offsite_dir, "/data/xie/processed")
results_dir_negbin <- paste0(offsite_dir, "/results/xie/negative_binomial")
bulk_regions <- readRDS(paste0(processed_dir, "/bulk_region_names.rds"))
gRNA_gene_pairs <- read.fst(paste0(processed_dir, "/gRNA_gene_pairs.fst"))
covariate_matrix <- read.fst(paste0(processed_dir, "/covariate_model_matrix.fst"))
cell_gene_expression_matrix <- readRDS(paste0(processed_dir, "/exp_mat_metadata.rds")) %>% load_fbm
ordered_gene_ids <- readRDS(paste0(processed_dir, "/ordered_gene_ids.RDS"))
gRNA_indicator_matrix_fp <- paste0(processed_dir, "/gRNA_indicator_matrix.fst")
regularization_amount <- 3
cell_subset <- readRDS(paste0(processed_dir, "/cell_subsets.rds"))[["all_cells"]]
seed <- 1234
B <- 500
pod_sizes <- c(gene = 100, gRNA = 100, pair = 500)
storage_location <- c(gene_precomp_dir = paste0(offsite_dir, "/data/xie/precomp/gene"), gRNA_precomp_dir = paste0(offsite_dir, "/data/xie/precomp/gRNA"), results_dir = paste0(offsite_dir, "/results/xie/sceptre"), log_dir = paste0(offsite_dir, "/logs/xie"))
gene_precomp_dir <- storage_location[["gene_precomp_dir"]]
gRNA_precomp_dir <- storage_location[["gRNA_precomp_dir"]]
results_dir <- storage_location[["results_dir"]]
log_dir <- storage_location[["log_dir"]]

if (small_example) {
  gRNA_gene_pairs <- slice_sample(gRNA_gene_pairs, n = 20)
  pod_sizes <- c(gene = 2, gRNA = 5, pair = 5)
}
