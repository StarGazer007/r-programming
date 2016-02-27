complete <- function(directory, id=1:332){
  
  ##'directory' is a character vector of length 1 indication 
  ## the location of the CSV files
  list_files <-list.files(directory,full.names = TRUE)
  
  ##Return a data frame of the form
  airquality_data = data.frame()
  
  
  ##'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  for (i in id) {
    
    monitor_id <- read.csv(list_files[i])
    nobs  <- sum(complete.cases(monitor_id))
    temp <- data.frame(i,nobs)
    airquality_data <- rbind(airquality_data,temp)
    
  }
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  colnames(airquality_data) <- c("id","nobs")
  airquality_data
}
  

