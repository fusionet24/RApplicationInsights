.onAttach <- function(libname,pkgname){

  packageStartupMessage("Application Insights is a Microsoft Product, please make sure you have your API KEY and Application ID available.")

}
ua <- user_agent("https://github.com/fusionet24/RApplicationInsights")
CheckCredentialsExist <- function(){

  if (length(Sys.getenv("AI-API-KEY")) > 1 & length(Sys.getenv("AI-HOSTNAME")) > 1 & length(Sys.getenv("AI-ApplicationID")) > 1){
    return(TRUE)
  }
  else if(length(as.character(Sys.getenv("AI-API-KEY"))) == 1 && length(Sys.getenv("AI-HOSTNAME")) == 1 && length(Sys.getenv("AI-ApplicationID")) == 1)
  {
    print("Credentials have not been set")
    return(FALSE)
  }
  if (length(as.character(Sys.getenv("AI-API-KEY")))  <= 1){
    print("API KEY has not been SET")
    return(FALSE)
  }
  if (length(Sys.getenv("AI-HOSTNAME"))  <= 1){
    print("API HOSTNAME has not been SET")
    return(FALSE)
  }
  if (length(Sys.getenv("AI-ApplicationID"))   <= 1){
    print("Application ID has not been SET")
  }
  return(FALSE)




}
GenerateBaseRequest <- function(){
  if (Sys.getenv("AI-HOSTNAME") == 'api.applicationinsights.io')
  {
    root <- paste0("https://",Sys.getenv("AI-HOSTNAME"))
    base_url <- paste(root, "beta","apps", Sys.getenv("AI-ApplicationID"),sep = "/")
    print(base_url)
  }
}

GetAPIKey <- function(){
  APIKey <- Sys.getenv("AI-API-KEY")
  if(identical(APIKey,"")){
    stop("API KEY has not been set",call. = FALSE)
  }
  APIKey

}
