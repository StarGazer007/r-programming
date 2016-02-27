corr <- function(directory, threshold = 0) {
  
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  list_files <-list.files(directory,full.names = TRUE)
  airquality_data  <- vector(mode = "numeric", length = 0)
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  for (i in 1:length(list_files)) {
    monitor_id <- read.csv( list_files [i])
    csum <- sum((!is.na(monitor_id $sulfate)) & (!is.na(monitor_id$nitrate)))
    if (csum > threshold) {
      tmp <- monitor_id[which(!is.na(monitor_id$sulfate)), ]
      submoni_i <- tmp[which(!is.na(tmp$nitrate)), ]
      airquality_data  <- c(airquality_data , cor(submoni_i$sulfate, submoni_i$nitrate))
    }
  }
  ## Return a numeric vector of correlations
  ## NOTE: Do not round the result!
  airquality_data 
}
