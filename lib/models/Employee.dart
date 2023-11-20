class Employee {
  final int? id;
  final String? name;
  final String? designation;
  final String? department;
  final String? salary;
  final String? age;
  static final columns = [
    "id",
    "name",
    "designation",
    "department",
    "Salary",
    "age"
  ];
  Employee({
    this.id,
    required this.name,
    required this.designation,
    required this.department,
    required this.salary,
    required this.age,
  });
  factory Employee.fromMap(Map<String, dynamic> data) {
    return Employee(
      id: data['id'],
      name: data['name'],
      designation: data['designation'],
      department: data['department'],
      salary: data['salary'],
      age: data['age'],
    );
  }
  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "designation": designation,
        "department": department,
        "Salary": salary,
        "age": age
      };

  getName() {
    return name ?? '';
  }

  getDesignation() {
    return designation ?? '';
  }

  getDepartment() {
    return department ?? '';
  }

  getSalary() {
    return salary ?? '';
  }

  getAge() {
    return age ?? '';
  }

  getId() {
    return id ?? -1;
  }
}
