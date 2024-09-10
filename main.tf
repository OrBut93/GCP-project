provider "google" {
    credentials = file(var.folder_service_account_key_path)
    project = "management-project" // the management project! 
    region = var.region
}

data "external" "students"{
   program = ["python3", "${path.module}/read_csv.py", "students.csv"] 
}

#Iterate over each student and create resources
resource "google_project" "student_project" {
  for_each = { for student in data.data.external.students.result.students :  "${student["first_name"]}-${student["last_name"]}" => student }

  name       = "${each.value.first_name}-${each.value.last_name}"
  project_id = lower("${each.value.first_name}-${each.value.last_name}-project")
  org_id     = "<your_org_id>"  # Replace with your organization ID
  billing_account = "<your_billing_account>"  # Replace with your billing account ID
}

resource "google_folder" "course_folder" {
    display_name = var.course_folder_name
    parent = "organization/	912009230618" // Bynet organization id
}

resource "google_project" "student_project" {
  for_each       = var.student_projects
  name           = each.key
  project_id     = each.key
  folder_id      = google_folder.course_folder.id
  billing_account = var.sub_billing_account 
}

