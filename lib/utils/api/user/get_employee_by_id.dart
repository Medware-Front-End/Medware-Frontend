import 'package:medware/utils/models/user/employee.dart';

Future<Employee> getEmployeeById() async {
  const data = {
    'id': '12345',
    'nationalId': '1234567890123',
    'fName': 'สวัสดี',
    'mName': '',
    'lName': 'จ้าาา',
    'pic': '1',
    'phoneNumber': '0123456789',
    'password' : '12345678',
    'role': '1',
    'department': '0',
  };

  return Employee.fromJson(data);
}
