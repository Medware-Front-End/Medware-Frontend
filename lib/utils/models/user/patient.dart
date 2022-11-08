class Patient {
  final int patientHNId;
  final String patientEmail;
  final String patientFirstName;
  final String patientPhoneNumber;
  final int patientBloodType;
  final int patientGender;
  final String patientPassword;
  final int patientNationalId;

  const Patient(
      {required this.patientHNId,
      required this.patientEmail,
      required this.patientFirstName,
      required this.patientPhoneNumber,
      required this.patientBloodType,
      required this.patientGender,
      required this.patientPassword,
      required this.patientNationalId});

  static Patient fromJson(json) => Patient(
      patientHNId: json['patientHNId'],
      patientEmail: json['patientEmail'],
      patientFirstName: json['patientFirstName'],
      patientPhoneNumber: json['patientPhoneNumber'],
      patientBloodType: json['patientBloodType'],
      patientGender: json['patientGender'],
      patientPassword: json['patientPassword'],
      patientNationalId: json['patientNationalId']);
}
