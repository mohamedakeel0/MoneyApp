
import 'package:moneyapp/features/login/domain/entities/loginEntity.dart';

class LoginModel extends LoginEntity {
  LoginModel({

    required super.message,
    required super. isAuthenticated,
    required super.  email,
    required super.  username,
    required super.  roles,
    required super.  token,
    required super.  expiresOn,

  });
  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      message: json['message']??'' ,
      isAuthenticated: json['isAuthenticated']??false ,
      email: json['email'],
      username: json['username'] ,
      roles: List<String>.from(json['roles'].map((e) => e))  ,
      token: json['token'] ,
      expiresOn: json['expiresOn'] ,
    );

  }}
