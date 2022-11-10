import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medware/components/action_button.dart';
import 'package:medware/components/cancel_button.dart';
import 'package:medware/screens/main/profile/edit_profile/change_password.dart';
import 'package:medware/screens/main/profile/view_profile/components/body/detail.dart';
import 'package:medware/screens/main/profile/view_profile/components/header/header.dart';
import 'package:medware/screens/main/profile/view_profile/components/body/label.dart';
import 'package:medware/utils/api/user/get_employee_by_id.dart';
import 'package:medware/utils/colors.dart';
import 'package:medware/utils/models/user/employee.dart';
import 'package:medware/utils/shared_preference/shared_preference.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  Employee employee = Employee(
    id: 'XXXXX',
    nationalId: 'XXXXXXXXXXXXX',
    fName: 'F',
    mName: 'M',
    lName: 'L',
    profilePic: 0,
    phoneNumber: 'XXXXXXXXXX',
    role: 0,
    department: 0,
  );

  Future _loadEmployee() async {
    var temp = await getEmployeeById();
    setState(() => employee = temp);
  }

  @override
  void initState() {
    super.initState();
    _loadEmployee();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: RefreshIndicator(
        onRefresh: _loadEmployee,
        triggerMode: RefreshIndicatorTriggerMode.anywhere,
        backgroundColor: quaternaryColor,
        color: primaryColor,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(
            parent: BouncingScrollPhysics(),
          ),
          padding: const EdgeInsets.only(bottom: 120),
          child: Column(
            children: [
              Header(
                role: 0,
                path: SharedPreference.profilePictures[employee.profilePic],
                refresh: _loadEmployee,
              ),
              Container(
                width: size.width * 0.85,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: size.width * 0.03,
                      ),
                      child: Label(
                        fName: employee.fName,
                        mName: employee.mName,
                        lName: employee.lName,
                        role: SharedPreference.employeeRoles[employee.role],
                      ),
                    ),
                    Detail(
                      title: 'หมายเลขประจำตัวบัตรประชาชน',
                      detail: employee.nationalId,
                      icon: Icons.badge_outlined,
                    ),
                    Detail(
                      title: 'เลขที่ใบประกอบวิชาชีพเวชกรรม',
                      detail: employee.id,
                      icon: Icons.medical_information_outlined,
                    ),
                    Detail(
                      title: 'แผนกประจำ',
                      detail: SharedPreference.departments[employee.department],
                      icon: Icons.person_pin_circle_outlined,
                    ),
                    Detail(
                      title: 'เบอร์โทรศัพท์',
                      detail: employee.phoneNumber,
                      icon: Icons.phone_rounded,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: size.width * 0.075,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ActionButton(
                            text: 'เปลี่ยนรหัสผ่าน',
                            action: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ChangePassword(),
                              ),
                            ),
                            percentWidth: 35,
                          ),
                          SizedBox(
                            width: size.width * 0.1,
                          ),
                          CancelButton(
                            text: 'ออกจากระบบ',
                            action: () {
                              HapticFeedback.lightImpact();
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: const Text('คุณแน่ใจหรือไม่?'),
                                  content: const Text(
                                      'คุณแน่ใจที่จะออกจากระบบหรือไม่?'),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: const Text('ไม่'),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text('ใช่'),
                                    ),
                                  ],
                                ),
                              );
                            },
                            percentWidth: 35,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
