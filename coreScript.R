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

library(Rcrawler,jsonlite)

from#####
# Search Variables

## Indeed Variables
indURL <- "https://www.indeed.com/q-Psychometrician-jobs.html"
indFilter <- c("/job/", "/jobs/", "/viewjob", "vjk", "/rc/")
indExcludeURL <- c("rbl", "jt", "rbc", "explvl", "mailto", "javascript")

## Career Builder Variables
cbURL <- "https://www.careerbuilder.com/jobs-psychometric"
cbFilter <- "/job/"
cbExcludeURL <- c("emp", "pay", "company", "cat1", "cat2", "cat3")

## Chronicle Vitae Variables
cvURL <- "chroniclevitae.com/job_search?job_search%5Bkeywords%5D=psychomentric"
cvFilter <- "/jobs/"
cvExcludeURL <- c("position_type", "institution_type", "employment_type", "location", "zip_code", "distance_from_zip")

## Monster Variables
monURL <- "https://www.monster.com/jobs/search/?q=psychometrician&stpage=1&page=10"
monFilter <- "job-openings."


# Keyword Variables
## Initial KW Grouping
keyword1 <- c("assessment", "test")
keyword2 <- c("psychometric", "assessment", "test")

#####
# Crawling Scripts

## Indeed Crawling Script
Rcrawler(
  Website = indURL, 
  no_cores = 4, 
  no_conn = 4, 
  KeywordsFilter = keyword1, 
  KeywordsAccuracy = 40, 
  MaxDepth = 3,
  dataUrlfilter = indFilter,
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
  Encod = "UTF-8",
  KeywordsFilter = keyword2, 
  KeywordsAccuracy = 60,
  MaxDepth = 3,
  dataUrlfilter = cbFilter,
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
  KeywordsFilter = keyword2, 
  KeywordsAccuracy = 40, 
  MaxDepth = 3,
  dataUrlfilter = cvFilter,
  ignoreUrlParams = cvExcludeURL,
  DIR = "./test"
)
cvIndex <- INDEX
rm(INDEX)

## Monster Crawling Script
Rcrawler(
  Website = monURL, 
  no_cores = 4, 
  no_conn = 4, 
  KeywordsFilter = keyword2, 
  KeywordsAccuracy = 50, 
  MaxDepth = 3,
  dataUrlfilter = monFilter,
  DIR = "./test"
)
monIndex <- INDEX
rm(INDEX)


#####
# Scraping Scripts

## Indeed Scraping Script
indScrapingURLList <- indIndex$Url
  
indData <- ContentScraper(Url = indScrapingURLList, 
                         CssPatterns = c("title", ".jobsearch-JobInfoHeader-subtitle", ".jobsearch-JobComponent-description"),
                         PatternsName = c("positionTitle", "positionLocation", "positionDescription"),
                         asDataFrame = TRUE
                         )
indData$url <- indScrapingURLList
                         
## Careerbuilder Scraping Script
cbScrapingURLList <- cbIndex$Url
  
cbData <- ContentScraper(Url = cbScrapingURLList, 
                         CssPatterns = c("title", "#job-company-name", ".address", ".description"),
                         PatternsName = c("positionTitle", "companyName", "positionLocation", "positionDescription"),
                         asDataFrame = TRUE
                         )
cbData$url <- cbScrapingURLList

## Chronicle Vitae Scraping Script
cvScrapingURLList <- 

cvData <- ContentScraper(Url = cvScrapingURLList, 
                         CssPatterns = c(".page-title h1", ".job-listing__location", ".job-listing__content__description"),
                         PatternsName = c("positionTitle", "positionLocation", "positionDescription"),
                         asDataFrame = TRUE
                         )

## Monster Scraping Script
monScrapingURLList <- monIndex$Url

monScriptType <- "application/ld+json"
  
monData <- ContentScraper(Url = monScrapingURLList, 
                          CssPatterns = c(".heading > .title", ".heading > .subtitle", "#JobDescription"),
                          PatternsName = c("positionTitle", "positionLocation", "positionDescription"),
                          asDataFrame = TRUE
                          )
monData$url <- monScrapingURLList


#####
# Testing Code Section
LinkExtractor(indURL)