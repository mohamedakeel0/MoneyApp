import 'package:equatable/equatable.dart';
class ForgetPasswordEntity extends Equatable {
  String? email;

  ForgetPasswordEntity({this.email});


  @override
  List<Object?> get props => [
    email,
  ];

}

