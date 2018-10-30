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
## Chronicle Vitae Start Page
cvURL <- "https://chroniclevitae.com/job_search?utf8=%E2%9C%93&job_search%5Bkeywords%5D=&job_search%5Bposition_type%5D=&job_search%5Binstitution_type%5D=&job_search%5Bemployment_type%5D=&job_search%5Blocation%5D=&job_search%5Bzip_code%5D=&job_search%5Bdistance_from_zip%5D=10&job_search%5Bstart_date%5D=&job_search%5Bkeywords%5D=psychometrician"

## Career Builder Start Page
cbURL <- "https://www.careerbuilder.com/"

## Indeed Start Page
inURL <- "https://www.indeed.com/jobs?q=Psychometrician"

# Keyword Variables
## Initial KW Grouping
kw1 <- c("assessment", "testing")

#####
# Crawling Script

## Indeed Crawling Script
Rcrawler(
  Website = inURL, 
  no_cores = 4, 
  no_conn = 4, 
  KeywordsFilter = c("assessment", "testing"), 
  KeywordsAccuracy = 50, 
  urlregexfilter = "/jobs/",
  ignoreUrlParams = c("rbl", "jt", "rbc", "explvl"),
  DIR = "./test"
  )
inIndex <- INDEX
rm(INDEX)


## Career Builder Crawling Script
Rcrawler(
  Website = cbURL, 
  no_cores = 4, 
  no_conn = 4, 
  KeywordsFilter = c("assessment", "testing"), 
  KeywordsAccuracy = 50, 
  urlregexfilter = "/jobs/",
  ignoreUrlParams = c("p"),
  DIR = "./test"
)
cbIndex <- INDEX
rm(INDEX)

## Chronicle Vitae Crawling Script
Rcrawler(
  Website = cvURL, 
  no_cores = 4, 
  no_conn = 4, 
  KeywordsFilter = c("assessment", "testing"), 
  KeywordsAccuracy = 50, 
  urlregexfilter = "/jobs/",
  ignoreUrlParams = c(),
  DIR = "./test"
)
cvIndex <- INDEX
rm(INDEX)


#####
# Testing Code Section
LinkExtractor(inURL)