class Patient {
  final int patientHNId;
  final String patientEmail;
  final String patientFirstName;
  final String patientPhoneNumber;
  final int patientGender;
  final String patientPassword;
  final int patientNationalId;
  final String token;

  const Patient(
      {required this.patientHNId,
      required this.patientEmail,
      required this.patientFirstName,
      required this.patientPhoneNumber,
      required this.patientGender,
      required this.patientPassword,
      required this.patientNationalId,
      required this.token});

  static Patient fromJson(json) => Patient(
      patientHNId: json['patientHNId'],
      patientEmail: json['patientEmail'],
      patientFirstName: json['patientFirstName'],
      patientPhoneNumber: json['patientPhoneNumber'],
      patientGender: json['patientGender'],
      patientPassword: json['patientPassword'],
      patientNationalId: json['patientNationalId'],
      token: json['token']);

  //Use for debug
  void printAttributes() {
    print("id: ${this.patientHNId}\n");
    print("email: ${this.patientEmail}\n");
    print("phone: ${this.patientFirstName}\n");
    print("name: ${this.patientPhoneNumber}\n");
    print("name: ${this.patientGender}\n");
    print("name: ${this.patientPassword}\n");
    print("name: ${this.patientNationalId}\n");
    print("token: ${this.token}\n");
  }
}
