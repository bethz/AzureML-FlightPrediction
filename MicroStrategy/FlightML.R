#MICROSTRATEGY_BEGIN
#
#RVAR year -input -numeric -vector
#RVAR quarter -input -numeric -vector
#RVAR month -input -numeric -vector
#RVAR dayofmonth -input -numeric -vector
#RVAR dayofweek -input -numeric -vector
#RVAR carrier -input -string -vector
#RVAR originairportid -input -vector
#RVAR destairportid -input -numeric -vector
#RVAR crsdeptime -input -numeric -vector
#RVAR deptimeblk -input -string -vector
#RVAR depdelay -input -numeric -vector
#RVAR depdel15 -input -numeric -vector
#RVAR crsarrtime -input -numeric -vector
#RVAR arrtimeblk -input -string -vector
#RVAR arrdelay -input -numeric -vector
#RVAR arrdel15 -input -numeric -vector
#RVAR cancelled -input -numeric -vector
#RVAR diverted -input -numeric -vector
#
#RVAR outputParam -parameter StringParam1
#
#RVAR predict_result -output -string -vector  #Metric Expression: RScript<_RScriptFile="C:\MSTRUsher.R", _InputNames="year, quarter, month, dayofmonth, dayofweek, carrier, originairportid, destairportid, crsdeptime, deptimeblk, depdelay, depdel15, crsarrtime, arrtimeblk, arrdelay, arrdel15, cancelled, diverted">(year, quarter, month, dayofmonth, dayofweek, carrier, originairportid, destairportid, crsdeptime, deptimeblk, depdelay, depdel15, crsarrtime, arrtimeblk, arrdelay, arrdel15, cancelled, diverted)
if(exists("mstr.WorkingDir")) setwd(mstr.WorkingDir)  #Working Directory if executed by MicroStrategy
#
#MICROSTRATEGY_END

  
#Check to see if package(s) are installed, install if not and then load
CheckInstallPackages <- function(pkgs) {                     #pkgs is a vector of strings with length >= 1
  x <- lapply(pkgs, function(pkg){                           #For each pkg in pkgs (attempt to load each package one at a time):
    if(!do.call("require", list(pkg))) {                     #  Load the package if available,
      try(install.packages(pkg, lib=.Library,
                           repos="http://cran.rstudio.com")) #    Silently attempt to install into the default library
      tryCatch(do.call("library", list(pkg)),                #    Now attempt to load the package, catch error if it wasn't installed
               error = function(err) {                              #    Catch if we're unable to install into the default library
                 if(!interactive()) {                               #      If non-interactive, install into this user's personal library
                   personalLibPath <- Sys.getenv("R_LIBS_USER")     #        Get the path to this user's personal library
                   if(is.na(match(personalLibPath, .libPaths()))) { #        If the personal library is not in the list of libraries
                     dir.create(personalLibPath, recursive = TRUE)  #          Then create the personal library
                     .libPaths(personalLibPath)                     #          And add the personal library to the list of libraries
                   }
                   install.packages(pkg, lib=personalLibPath,       #        Attempt to install the package into the personal library
                                    repos="http://cran.rstudio.com") #          if this fails, raise the error back to the report
                   do.call("library", list(pkg))                    #        Finally, attempt to load the package
                 }
               }
      )
    }
  })
}
CheckInstallPackages(c("RCurl", 'rjson'))
# Accept SSL certificates issued by public Certificate Authorities
options(RCurlOptions = list(cainfo = system.file("CurlSSL", "cacert.pem", package = "RCurl")))
h = basicTextGatherer()
hdr = basicHeaderGatherer()
#Covert data types for several input parameters
year <- as.character(year)
quarter <- as.character(quarter)
month <- as.character(month)
dayofmonth <- as.character(dayofmonth)
dayofweek <- as.character(dayofweek)
originairportid <- as.character(originairportid)
destairportid <- as.character(destairportid)
crsdeptime <- as.character(crsdeptime)
depdelay <- as.character(depdelay)
depdel15 <- as.character(depdel15)
crsarrtime <- as.character(crsarrtime)
arrdelay <- as.character(arrdelay)
arrdel15 <- as.character(arrdel15)
cancelled <- as.character(cancelled)
diverted <- as.character(diverted)
# Define the request
input <- list()
for(i in (1: length(year)))
  input[[i]] <- list(
    'Year' = year[i],
    'Quarter' = quarter[i],
    'Month' = month[i],
    'DayofMonth' = dayofmonth[i],
    'DayOfWeek' = dayofweek[i],
    'Carrier' = carrier[i],
    'OriginAirportID' = originairportid[i],
    'DestAirportID' = destairportid[i],
    'CRSDepTime' = crsdeptime[i],
    'DepTimeBlk' = deptimeblk[i],
    'DepDelay' = depdelay[i],
    'DepDel15' = depdel15[i],
    'CRSArrTime' = crsarrtime[i],
    'ArrTimeBlk' = arrtimeblk[i],
    'ArrDelay' = arrdelay[i],
    'ArrDel15' = arrdel15[i],
    'Cancelled' = cancelled[i],
    'Diverted' = diverted[i]
  )
req =  list(
  Inputs = list(
    "input1"= input
  ),
  GlobalParameters = setNames(fromJSON('{}'), character(0))
)
body = enc2utf8(toJSON(req))
api_key = "u78j7hyQbp1MuzSvaIdJ58eGaHvxOoby3X233VTAYGExbT9Fy3mpd9wlWK5KhxNMSiFDmLFcX4pyg1h0gRl56g==" # Replace this with the API key for the web service
authz_hdr = paste('Bearer', api_key, sep=' ')
h$reset()
curlPerform(url = "https://ussouthcentral.services.azureml.net/workspaces/fee0bd5c127e471c88ab563ee215101c/services/999b501513db4859b49750eda2aab3e8/execute?api-version=2.0&details=true&format=swagger",
            httpheader=c('Content-Type' = "application/json", 'Authorization' = authz_hdr),
            postfields=body,
            writefunction = h$update,
            headerfunction = hdr$update,
            verbose = TRUE
)
headers = hdr$value()
httpStatus = headers["status"]
if (httpStatus >= 400)
{
  print(paste("The request failed with status code:", httpStatus, sep=" "))
  # Print the headers - they include the requert ID and the timestamp, which are useful for debugging the failure
  print(headers)
}
print("Result:")
result = h$value()
#Collect the result
output <- fromJSON(result)$Results$output1
predict_result <- character(length(year))
for(i in (1 : length(year)))
  predict_result[i] <- output[[i]][[outputParam]]
