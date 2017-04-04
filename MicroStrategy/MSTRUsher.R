library("RCurl")
library("rjson")

# Accept SSL certificates issued by public Certificate Authorities
options(RCurlOptions = list(cainfo = system.file("CurlSSL", "cacert.pem", package = "RCurl")))

h = basicTextGatherer()
hdr = basicHeaderGatherer()

req =  list(
    Inputs = list(
            "input1"= list(
                list(
                        'Year' = "1",
                        'Quarter' = "1",
                        'Month' = "1",
                        'DayofMonth' = "1",
                        'DayOfWeek' = "1",
                        'Carrier' = "",
                        'OriginAirportID' = "1",
                        'DestAirportID' = "1",
                        'CRSDepTime' = "1",
                        'DepTimeBlk' = "",
                        'DepDelay' = "1",
                        'DepDel15' = "1",
                        'CRSArrTime' = "1",
                        'ArrTimeBlk' = "",
                        'ArrDelay' = "1",
                        'ArrDel15' = "1",
                        'Cancelled' = "1",
                        'Diverted' = "1"
                    )
            )
        ),
        GlobalParameters = setNames(fromJSON('{}'), character(0))
)

body = enc2utf8(toJSON(req))
api_key = "BLABLABLABLA" # Replace this with the API key for the web service
authz_hdr = paste('Bearer', api_key, sep=' ')

h$reset()
curlPerform(url = "PutTheURIHere",
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
print(fromJSON(result))