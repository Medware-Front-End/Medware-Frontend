class Patient {
  final int patientHNId;
  final String patientEmail;
  final String patientFirstName;
  final String patientPhoneNumber;
  final int patientBloodType;
  final int patientGender;
  final String patientPassword;
  final int patientPersonalID;

  const Patient(
      {required this.patientHNId,
      required this.patientEmail,
      required this.patientFirstName,
      required this.patientPhoneNumber,
      required this.patientBloodType,
      required this.patientGender,
      required this.patientPassword,
      required this.patientPersonalID});

  static Patient fromJson(json) => Patient(
      patientHNId: json['patientHNId'],
      patientEmail: json['patientEmail'],
      patientFirstName: json['patientFirstName'],
      patientPhoneNumber: json['patientPhoneNumber'],
      patientBloodType: json['patientBloodType'],
      patientGender: json['patientGender'],
      patientPassword: json['patientPassword'],
      patientPersonalID: json['patientPersonalID']);
}
