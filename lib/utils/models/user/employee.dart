class Employee {
  final int employeeID;
  final String employeeFirstName;
  final bool employeeIsAdmin;
  final String employeePhoneNumber;
  final int employeeRole;
  final int employeeDepartment;
  final String employeePassword;

  const Employee({
    required this.employeeID,
    required this.employeeFirstName,
    required this.employeeIsAdmin,
    required this.employeePhoneNumber,
    required this.employeeRole,
    required this.employeeDepartment,
    required this.employeePassword,
  });

  static Employee fromJson(json) => Employee(
      employeeID: json['employeeID'],
      employeeFirstName: json['employeeFirstName'],
      employeeIsAdmin: json['employeeIsAdmin'],
      employeePhoneNumber: json['employeePhoneNumber'],
      employeeRole: json['employeeRole'],
      employeeDepartment: json['employeeDepartment'],
      employeePassword: json['employeePassword']);
}
