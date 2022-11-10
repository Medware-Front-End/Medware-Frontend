class Patient {
  final String id;
  final String nationalId;
  final String fName;
  final String mName;
  final String lName;
  final String phoneNumber;
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
        bloodType: int.parse(json['bloodType']),
        profilePic: int.parse(json['pic']),
        medicalConditions: json['medicalConditions'] != ''
            ? json['medicalConditions'].split(',')
            : [],
        drugAllergies:
            json['drugAllergies'] != '' ? json['drugAllergies'].split(',') : [],
        allergies: json['allergies'] != '' ? json['allergies'].split(',') : [],
      );
}
