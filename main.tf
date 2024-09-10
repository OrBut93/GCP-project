provider "google" {
    credentials = file(var.folder_service_account_key_path)
    project = "management-project" // the management project! 
    region = var.region
  
}