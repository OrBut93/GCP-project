################################
#CREDENTIALS
################################
variable "folder_service_account_key_path" {
  description = "folder - The path to the service account key file"
  type        = string
}

################################
#REGION
################################

## this defined the Region for VM ## 
variable "zone" {
  default = "europe-west3-c"
}

##This defind the Zone for VPC##
variable "region" {
    default = "europe-west3" 
}

variable "course_folder_name" {
  description = "the GCP folder for the course"
  type = string
}

variable "student_projects" {
  description = "A map of student project names to their email addresses"
  type = map(string)
}

