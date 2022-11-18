class Patient {
  final String id;
  final String nationalId;
  final String fName;
  final String mName;
  final String lName;
  final String phoneNumber;
  final String password;
  final DateTime birthDate;
  final int bloodType;
  final int profilePic;
  final List<String> medicalConditions;
  final List<String> drugAllergies;
  final List<String> allergies;

  const Patient({
    required this.id,
    required this.nationalId,
    required this.fName,
    required this.mName,
    required this.lName,
    required this.phoneNumber,
    required this.password,
    required this.birthDate,
    required this.bloodType,
    required this.profilePic,
    required this.medicalConditions,
    required this.drugAllergies,
    required this.allergies,
  });

  static Patient fromJson(Map<String, dynamic> json) => Patient(
        id: json['hnId'],
        nationalId: json['nationalId'],
        fName: json['fName'],
        mName: json['mName'],
        lName: json['lName'],
        phoneNumber: json['phoneNumber'],
        password: json['password'],
        birthDate: DateTime.parse(json['birthDate']),
        bloodType: int.parse(json['bloodType']),
        profilePic: int.parse(json['pic']),
        medicalConditions: json['medicalConditions'] != ''
            ? json['medicalConditions'].split(',')
            : [],
        drugAllergies:
            json['drugAllergies'] != '' ? json['drugAllergies'].split(',') : [],
        allergies: json['allergies'] != '' ? json['allergies'].split(',') : [],
      );
  // final int patientHNId;
  // final String patientEmail;
  // final String patientFirstName;
  // final String patientPhoneNumber;
  // final int patientGender;
  // final String patientPassword;
  // final int patientNationalId;
  // final String token;

  // const Patient(
  //     {required this.patientHNId,
  //     required this.patientEmail,
  //     required this.patientFirstName,
  //     required this.patientPhoneNumber,
  //     required this.patientGender,
  //     required this.patientPassword,
  //     required this.patientNationalId,
  //     required this.token});

  // static Patient fromJson(json) => Patient(
  //     patientHNId: json['patientHNId'],
  //     patientEmail: json['patientEmail'],
  //     patientFirstName: json['patientFirstName'],
  //     patientPhoneNumber: json['patientPhoneNumber'],
  //     patientGender: json['patientGender'],
  //     patientPassword: json['patientPassword'],
  //     patientNationalId: json['patientNationalId'],
  //     token: json['token']);

  // //Use for debug
  // void printAttributes() {
  //   print("id: ${this.patientHNId}\n");
  //   print("email: ${this.patientEmail}\n");
  //   print("phone: ${this.patientFirstName}\n");
  //   print("name: ${this.patientPhoneNumber}\n");
  //   print("name: ${this.patientGender}\n");
  //   print("name: ${this.patientPassword}\n");
  //   print("name: ${this.patientNationalId}\n");
  //   print("token: ${this.token}\n");
  // }
}
