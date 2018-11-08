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
cvURL <- "https://chroniclevitae.com/job_search?job_search%5Bkeywords%5D=Psychometric&job_search%5Bstart_date%5D=180&utf8=%E2%9C%93"
cvFilter <- "/jobs/"
cvExcludeURL <- c("position_type", "institution_type", "employment_type", "location", "zip_code", "distance_from_zip")

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
# Scraping Scripts

## Careerbuilder Scraping Script
cbScrapingURLList <- 
  
cbData <- ContentScraper(Url = cvScrapingURLList, 
                          CssPatterns = c(".page-title h1", ".job-listing__location", ".job-listing__content__description"),
                          PatternsName = c("positionTitle", "positionLocation", "positionDescription")
                         )

## Chronicle Vitae Scraping Script
cvScrapingURLList <- 

cvData <- ContentScraper(Url = cvScrapingURLList, 
                         CssPatterns = c(".page-title h1", ".job-listing__location", ".job-listing__content__description"),
                         PatternsName = c("positionTitle", "positionLocation", "positionDescription")
                         )

## Indeed Scraping Script
indScrapingURLList <- 
  
indData <- ContentScraper(Url = cvScrapingURLList, 
                         CssPatterns = c(".page-title h1", ".job-listing__location", ".job-listing__content__description"),
                         PatternsName = c("positionTitle", "positionLocation", "positionDescription")
                         )

#####
# Testing Code Section
LinkExtractor(inURL)