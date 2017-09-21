requireNamespace("httr", quietly = TRUE)
#' Connect To API Method
#'
#' @param APIKEY Your Azure Application Insights API KEY
#' @param ApplicationID Your applications ID
#' @param Hostname The Hostname of the API. Default is api.applicationinsights.io
#'
#' @export
#'
#' @examples
#' SetUpAPICredentials(APIKEY ="DEMO_KEY", Hostname ="https://api.applicationinsights.io/", ApplicationID = "DEMO_APP") # COnnect to the API Demo Application
SetUpAPICredentials <- function(APIKEY,ApplicationID, Hostname = 'api.applicationinsights.io'){
  Sys.setenv("AI-API-KEY" =APIKEY, "AI-HOSTNAME" = Hostname, "AI-ApplicationID" = ApplicationID)
  print(Sys.getenv("AI-API-KEY"))
  print(Sys.getenv("AI-HOSTNAME"))
  print(Sys.getenv("AI-ApplicationID"))
}
#' Check API Crendtials
#'
#' @return Prints API Details from Enviroment to Console.
#' @export
#'
#' @examples
#' CheckAPICredenrials
#' > CheckAPICredentials()
#' [1] "API KEY: "
#' [1] "AI HostName: "
#' [1] "Application ID "
CheckAPICredentials <- function(){
  print(paste("API KEY:", Sys.getenv("AI-API-KEY"),sep = " "))
  print(paste("AI HostName:", Sys.getenv("AI-HOSTNAME"), sep = " "))
  print(paste("Application ID",Sys.getenv("AI-ApplicationID"), sep = " "))
}
#' Remove API Credientals
#' Used to remove API values from Environment. For Security Reasons or expired Credentials etc
#'
#'
#'
#' @examples
#' RemoveAPICredentials()
RemoveAPICredentials <- function()
{
  ##TODO: Make Check Credentials Funciton/Functions() to return errors and wrap arround every useful func

  if (length(Sys.getenv("AI-API-KEY")) > 1|| length(Sys.getenv("AI-HOSTNAME")) > 1 || length(Sys.getenv("AI-ApplicationID")) > 1){
    Sys.unsetenv("AI-API-KEY","AI-HOSTNAME", "AI-ApplicationID")
  }
  else{
    print("Credentials have not been set")
  }

}
