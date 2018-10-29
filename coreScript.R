#####
# R version 3.5.1
# Phsycometrics Job Availability Project
# by Bri Barnes, University of Massachusetts Amherst, School of Public Policy
####

#####
# Load Evironment

library(Rcrawler)

#####
# Search Variables
cvURL <- "https://chroniclevitae.com/job_search?utf8=%E2%9C%93&job_search%5Bkeywords%5D=&job_search%5Bposition_type%5D=&job_search%5Binstitution_type%5D=&job_search%5Bemployment_type%5D=&job_search%5Blocation%5D=&job_search%5Bzip_code%5D=&job_search%5Bdistance_from_zip%5D=10&job_search%5Bstart_date%5D=&job_search%5Bkeywords%5D=psychometrician"
cbURL <- "https://www.careerbuilder.com/"
inURL <- "https://www.indeed.com/jobs?q=Psychometrician"


#####
# Crawling Script


Rcrawler(Website = inURL, no_cores = 4, no_conn = 4, KeywordsFilter = c("psychometrician", "assessment", "testing"), KeywordsAccuracy = 50, MaxDepth = 2, DIR = "./test")

LinkExtractor("https://www.careerbuilder.com")
