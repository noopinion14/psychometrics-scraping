#####
# R version 3.5.1
# Phsycometrics Job Availability Project | Fall 2018
# Core Crawling Script
#
# Code by:
# Bri Barnes, University of Massachusetts Amherst, School of Public Policy | brianbarnes@umass.edu
####

#####
# Load Evironment

library(Rcrawler)

#####
# Search Variables
## Chronicle Vitae Start Page
cvURL <- "https://chroniclevitae.com/job_search?utf8=%E2%9C%93&job_search%5Bkeywords%5D=&job_search%5Bposition_type%5D=&job_search%5Binstitution_type%5D=&job_search%5Bemployment_type%5D=&job_search%5Blocation%5D=&job_search%5Bzip_code%5D=&job_search%5Bdistance_from_zip%5D=10&job_search%5Bstart_date%5D=&job_search%5Bkeywords%5D=psychometrician"
cvFilter <- "/jobs/"
cvExcludeURL <- c("rbl", "jt", "rbc", "explvl")

## Career Builder Start Page
cbURL <- "https://www.careerbuilder.com/jobs-psycometrician?keywords=psycometrician&location="
cbFilter <- "/jobs/"
cbExcludeURL <- c("emp", "pay", "company", "cat1", "cat2", "cat3")

## Indeed Variables
indURL <- "https://www.indeed.com/jobs?q=Psychometrician"
indFilter <- "/rc/"
indExcludeURL <- c("rbl", "jt", "rbc", "explvl")

# Keyword Variables
## Initial KW Grouping
keyword1 <- c("assessment", "test")
keyword2 <- c("psychometric", "test")

#####
# Crawling Script

## Indeed Crawling Script
Rcrawler(
  Website = indURL, 
  no_cores = 4, 
  no_conn = 4, 
  KeywordsFilter = keyword1, 
  KeywordsAccuracy = 50, 
  urlregexfilter = indFilter,
  ignoreUrlParams = indExcludeURL,
  DIR = "./test"
  )
indIndex <- INDEX
rm(INDEX)


## Career Builder Crawling Script
Rcrawler(
  Website = cbURL, 
  no_cores = 4, 
  no_conn = 4, 
  KeywordsFilter = keyword1, 
  KeywordsAccuracy = 50, 
  urlregexfilter = cbFilter,
  ignoreUrlParams = cbExcludeURL,
  DIR = "./test"
)
cbIndex <- INDEX
rm(INDEX)

## Chronicle Vitae Crawling Script
Rcrawler(
  Website = cvURL, 
  no_cores = 4, 
  no_conn = 4, 
  KeywordsFilter = keyword1, 
  KeywordsAccuracy = 50, 
  urlregexfilter = cvFilter,
  ignoreUrlParams = cvExcludeURL,
  DIR = "./test"
)
cvIndex <- INDEX
rm(INDEX)


#####
# Testing Code Section
LinkExtractor(inURL)