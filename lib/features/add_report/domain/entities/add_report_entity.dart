import 'package:equatable/equatable.dart';

class AddReportEntity extends Equatable {
  final int? id;
  final String? name;
  final DateTime? dateTime;
  final String? location;
  final String? image;

  AddReportEntity({
    this.id,
    this.name,
    this.dateTime,
    this.location,
    this.image,
  });

  @override
  List<Object?> get props => [
    id,
    name,
    dateTime,
    location,
    image,
  ];
}
