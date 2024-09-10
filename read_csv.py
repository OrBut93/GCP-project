import csv


# Read CSV file and save the students as variables in variables.tf

with open('students.csv', mode='r') as file:
    reader = csv.DictReader(file)
    with open('terraform.tfvars', 'w') as tfvars:
        for row in reader:
            student_name = row['first_name'] + row['last_name']
            student_email = row['email']
            tfvars.write(f'student_projects["{student_name}"] = "{student_email}"\n')
