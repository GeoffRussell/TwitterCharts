library(tidyverse)
getWorldBankData <- function(id='SP.POP.TOTL', date='1960:2021',
                             value="value", per.page=20000){ 
  require(RJSONIO)
  url <- paste("http://api.worldbank.org/countries/all/indicators/", id,
               "?date=", date, "&format=json&per_page=", per.page,
               sep="")
  cat(url)
 
  wbData <- fromJSON(url)[[2]]
 
  wbData = data.frame(
    year = as.numeric(sapply(wbData, "[[", "date")), 
    value = as.numeric(sapply(wbData, function(x)
      ifelse(is.null(x[["value"]]),NA, x[["value"]]))),  
    country.name = sapply(wbData, function(x) x[["country"]]['value']),
    country.id = sapply(wbData, function(x) x[["country"]]['id'])    
    )
 
  names(wbData)[2] <- value
 
  return(wbData)
}
dfpop<-getWorldBankData() %>% mutate(population=value)
write_csv(dfpop,"worldBankPopulation2021.csv")
