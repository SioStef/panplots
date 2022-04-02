# panplots
A small R script for generating pangenome accumulation curves


This R script will compute three type of pangenome-related accumulation curves (gene cluster accumulation, core genome and accumulation unique gene clusters) for a number of randomly sampled genomes based on a user defined number of permutations. The output is a table summerizing the permutation results using "matrixStats" R package (https://github.com/HenrikBengtsson/matrixStats).

**Usage**  
source(“panplots.R”)  
panplots(*data*, *curve*, *iterations*)

**Arguments**  
*data* = a matrix with gene cluster presence-absence data with genomes as rows and gene clusters as columns.  
*curve* = type of curve data to generate: "pan" for gene cluster accumulation curve, "core" for core genome accumulation curve, and "uniq" for unique gene clusters accumulation curve (default "pan").  
*iterations* = the number of random genome permutations (default 100). 
