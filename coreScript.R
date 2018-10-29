#####
# R version 3.5.1
# Phsycometrics Job Availability Project
# by Bri Barnes, University of Massachusetts Amherst, School of Public Policy
####

#####
# Load Evironment

library(Rcrawler)


#####
# Crawling Scripts
Rcrawler("https://www.indeed.com/jobs?q=Psychometrician", no_cores = 2, no_conn = 2, MaxDepth = 1)


















