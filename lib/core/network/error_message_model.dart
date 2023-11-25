import 'package:equatable/equatable.dart';

class ErrorMessageModel extends Equatable{
  final bool statusCode;

final List<dynamic>? errors;
final String? message;


  const ErrorMessageModel(

      this.message,
      {required this.statusCode,

        required this.errors,


      });
  factory ErrorMessageModel.fromJson(Map<String, dynamic> json)=>
      ErrorMessageModel(json['message'],statusCode: json['status'],
        errors: json['error']==null? [json['message']] : List<dynamic>.from(json['error'].map((e) => e)) ,
     );
  @override
  List<Object?> get props =>
      [statusCode,errors ,message];
}