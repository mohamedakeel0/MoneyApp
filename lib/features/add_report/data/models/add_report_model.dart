
import 'package:moneyapp/features/add_report/domain/entities/add_report_entity.dart';

class AddReportModel extends AddReportEntity {
  AddReportModel({
    required int? id,
    required String? name,
    required DateTime? dateTime,
    required String? location,
    required String? image,
  }) : super(
    id: id,
    name: name,
    dateTime: dateTime,
    location: location,
    image: image,
  );

  factory AddReportModel.fromJson(Map<String, dynamic> json) {
    return AddReportModel(
      id: json['id'],
      name: json['name'],
      dateTime: json['dateTime'] != null ? DateTime.parse(json['dateTime']) : null,
      location: json['location'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'dateTime': dateTime?.toIso8601String(),
      'location': location,
      'image': image,
    };
  }
}
