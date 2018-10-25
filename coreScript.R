#####
# R version 3.5.1
# Phsycometrics Job Availability Project
# by Bri Barnes, University of Massachusetts Amherst, School of Public Policy
####

crawler(Website = "https://www.careerbuilder.com/jobs-psycometrician?keywords=Psycometrician&location=", no_cores, no_conn, MaxDepth, DIR, RequestsDelay = 0,
        Obeyrobots = FALSE, Useragent, Encod, Timeout = 5,
        URLlenlimit = 255, urlExtfilter, urlregexfilter, ignoreUrlParams,
        KeywordsFilter, KeywordsAccuracy, FUNPageFilter, ExtractXpathPat,
        ExtractCSSPat, PatternsNames, ExcludeXpathPat, ExcludeCSSPat,
        ExtractAsText = TRUE, ManyPerPattern = FALSE, NetworkData = FALSE,
        NetwExtLinks = FALSE, statslinks = FALSE)