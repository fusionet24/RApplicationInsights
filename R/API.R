requireNamespace("httr", quietly = TRUE)
requireNamespace("devtools",quietly = TRUE)


#' Title
#'
#' @return
#' @export
#'
#' @examples


#' Direct API Call
#'
#' @param RequestType
#' @param Request
#'
#' @return
#' @export
#'
#' @examples
AppInsightsAPI <- function(RequestType = "metrics", Request){
base_url <- GenerateBaseRequest()
if(RequestType == 'metrics'|| RequestType == 'events' || RequestType == 'query'){
  url <- paste(base_url, RequestType, Request, sep = "/")
  print(url)
}
else{
  return("Can't generate API request")

  }

}

#' @title Pass to Query API
#' @description Used to pass queries that you construct using the Log Analytics/App Insights Query Language.
#' @references https://docs.loganalytics.io/
#' @param Query  Query String used for calling API
#'
#' @return Parsed JSON
#'
#'
#' @examples Query(Query="requests%7C%20where%20timestamp%20%3E%3D%20ago(24h)%7C%20count") # Counts Server Request from last 24hours
#' @examples Query(Query=paste("requests | where timestamp >= ago(",hours,"h) | summarize percentiles(duration,50,95)") )
Query <- function(Query){

  if(missing(Query)){
    return("Error")
  }
  browser()
  QueryURL <- paste(GenerateBaseRequest(), "/query?query=", URLencode(Query), sep ="" )
  Res <- httr::GET(url = QueryURL,add_headers('X-Api-Key' = GetAPIKey() ))
  content(Res)
}

