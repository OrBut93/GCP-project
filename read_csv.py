import csv
import sys
import json

def main():
    file_name = sys.argv[1]
    result = []
    with open(file_name, mode='r') as csv_file:
        csv_reader = csv.DictReader(csv_file)
        for row in csv_reader:
            result.append({
                "first_name": row["first_name"],
                "last_name": row["last_name"],
                "email": row["email"]
            })
    print(json.dumps({"students": result}))

if __name__ == "__main__":
    main()
