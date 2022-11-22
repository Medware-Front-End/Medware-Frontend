class Employee {
  final String id;
  final String nationalId;
  final String fName;
  final String mName;
  final String lName;
  final String phoneNumber;
  final String password;
  final int profilePic;
  final int role;
  final int department;

  const Employee({
    required this.id,
    required this.nationalId,
    required this.fName,
    required this.mName,
    required this.lName,
    required this.phoneNumber,
    required this.password,
    required this.profilePic,
    required this.role,
    required this.department,
  });
  // late final String employeeFirstName;
  // late final String employeeMiddleName;
  // late final String employeeLastName;
  // late final String employeeNationalId;
  // late final bool employeeIsAdmin;
  // late final String employeePhoneNumber;
  // late final int employeeRole;
  // late final int employeeDepartment;
  // late final String employeePassword;

  static Employee fromJson(Map<String, dynamic> json) => Employee(
        id: json['id'],
        nationalId: json['nationalId'],
        fName: json['fName'],
        mName: json['mName'],
        lName: json['lName'],
        phoneNumber: json['phoneNumber'],
        password: json['password'],
        profilePic: int.parse(json['pic']),
        role: int.parse(json['role']),
        department: int.parse(json['department']),
      );
}
