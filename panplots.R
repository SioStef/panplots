library(matrixStats)
panplots <- function(data, curve = "pan", iterations = 100) {
  # This script will compute pangenome-related accumulation curves for a certain number of sampled genomes based
  # on a user defined number of permutations.
  # Arguments:
  # data = a matrix with gene cluster presence-absence data with genomes as rows and gene clusters as columns
  # curve = type of curve data to generate ("pan" for gene cluster accumulation plot, "core" for core genome 
  #         accumulation plot, and "uniq" for unique gene clusters accumulation plot ("pan" by default))
  # iterations = the number of random permutations to perform (100 by default)
  
  nr_rows <- nrow(data);
  nr_iterations <- iterations; #the number of iterations (100 by default) 
  #create empty matrix to store temp results
  temp <- matrix(data=NA,nrow=nr_rows,ncol=nr_iterations)
  
  if(curve == "core") {
    ## compute core_genome_accumulation_curve data for the number of iterations
    for(times in 1:nr_iterations){
      # random sampling of genomes
      for (i in 2: nr_rows){
        t=data[sample(nr_rows, i), ,drop=F]
        temp[i,times]=length(which(colSums(t) == i))
      }
    }
  } 
  
  if(curve == "pan") {
    ## compute gene_cluster_accumulation_curve data for the number of iterations
    for(times in 1:nr_iterations){
      # random sampling of genomes
      for (i in 1: nr_rows){
        t=data[sample(nr_rows, i), ,drop=F]
        temp[i,times]=length(which(colSums(t) > 0))
      }
    }
  } 
  
  if(curve == "uniq") {
    ## compute unique gene_cluster_accumulation_curve data for the number of iterations
    for(times in 1:nr_iterations){
      # random sampling of genomes
      for (i in 2: nr_rows){
        t=data[sample(nr_rows, i), ,drop=F]
        temp[i,times]=length(which(colSums(t) == 1))
      }
    }
  }
  
  # summerize permutation results using "matrixStats" library
  summary <- data.frame(genomes=c(1:nr_rows)) 
  summary$mean=rowMeans2(temp[,c(-1)])
  summary$sd=rowSds(temp[,c(-1)])
  summary$group=deparse(substitute(data))
  return(summary)
}




