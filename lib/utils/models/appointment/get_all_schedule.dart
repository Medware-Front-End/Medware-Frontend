// To parse this JSON data, do
//
//     final allschedules = allschedulesFromJson(jsonString);

import 'dart:convert';

List<Allschedules> allschedulesFromJson(String str) => List<Allschedules>.from(json.decode(str).map((x) => Allschedules.fromJson(x)));

String allschedulesToJson(List<Allschedules> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Allschedules {
    Allschedules({
        required this.scheduleId,
        required this.scheduleCapacity,
        required this.scheduleStart,
        required this.scheduleEnd,
        required this.scheduleDate,
        required this.scheduleLocation,
        required this.scheduleStatus,
        required this.scheduleType,
    });

    int scheduleId;
    int scheduleCapacity;
    DateTime scheduleStart;
    DateTime scheduleEnd;
    DateTime scheduleDate;
    String scheduleLocation;
    bool scheduleStatus;
    int scheduleType;

    factory Allschedules.fromJson(Map<String, dynamic> json) => Allschedules(
        scheduleId: json["scheduleId"],
        scheduleCapacity: json["scheduleCapacity"],
        scheduleStart: DateTime.parse(json["scheduleStart"]),
        scheduleEnd: DateTime.parse(json["scheduleEnd"]),
        scheduleDate: DateTime.parse(json["scheduleDate"]),
        scheduleLocation: json["scheduleLocation"],
        scheduleStatus: json["scheduleStatus"],
        scheduleType: json["scheduleType"],
    );

    Map<String, dynamic> toJson() => {
        "scheduleId": scheduleId,
        "scheduleCapacity": scheduleCapacity,
        "scheduleStart": scheduleStart.toIso8601String(),
        "scheduleEnd": scheduleEnd.toIso8601String(),
        "scheduleDate": "${scheduleDate.year.toString().padLeft(4, '0')}-${scheduleDate.month.toString().padLeft(2, '0')}-${scheduleDate.day.toString().padLeft(2, '0')}",
        "scheduleLocation": scheduleLocation,
        "scheduleStatus": scheduleStatus,
        "scheduleType": scheduleType,
    };
}
