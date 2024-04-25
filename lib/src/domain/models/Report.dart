// To parse this JSON data, do
//
//     final report = reportFromJson(jsonString);

import 'dart:convert';

Report reportFromJson(String str) => Report.fromJson(json.decode(str));

String reportToJson(Report data) => json.encode(data.toJson());

class Report {
  String x;
  int y;

  Report({
    required this.x,
    required this.y,
  });

  static List<Report> fromJsonListreport(List<dynamic> jsonList) {
    List<Report> toList = [];
    jsonList.forEach((item) {
      Report report = Report.fromJson(item);
      toList.add(report);
    });
    return toList;
  }

  factory Report.fromJson(Map<String, dynamic> json) => Report(
        x: json["x"],
        y: json["y"],
      );

  Map<String, dynamic> toJson() => {
        "x": x,
        "y": y,
      };
}
