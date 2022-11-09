class Employee {
  final int employeeID;
  final String employeeFirstName;
  final bool employeeIsAdmin;
  final String employeePhoneNumber;
  final int employeeRole;
  final int employeeDepartment;
  final String employeePassword;
  final String token;

  const Employee({
    required this.employeeID,
    required this.employeeFirstName,
    required this.employeeIsAdmin,
    required this.employeePhoneNumber,
    required this.employeeRole,
    required this.employeeDepartment,
    required this.employeePassword,
    required this.token,
  });

  static Employee fromJson(json) => Employee(
      employeeID: json['employeeID'],
      employeeFirstName: json['employeeFirstName'],
      employeeIsAdmin: json['employeeIsAdmin'],
      employeePhoneNumber: json['employeePhoneNumber'],
      employeeRole: json['employeeRole'],
      employeeDepartment: json['employeeDepartment'],
      employeePassword: json['employeePassword'],
      token: json['token']);

  //Use for debug
  void printAttributes() {
    print("id: ${this.employeeID}\n");
    print("email: ${this.employeeFirstName}\n");
    print("phone: ${this.employeeIsAdmin}\n");
    print("name: ${this.employeePhoneNumber}\n");
    print("name: ${this.employeeRole}\n");
    print("name: ${this.employeeDepartment}\n");
    print("name: ${this.employeePassword}\n");
    print("token: ${this.token}\n");
  }
}
