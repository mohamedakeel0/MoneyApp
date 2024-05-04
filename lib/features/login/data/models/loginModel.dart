
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
      message: json['message'] as Null,
      isAuthenticated: json['isAuthenticated'] as bool,
      email: json['email'] as String,
      username: json['username'] as String,
      roles: (json['roles'] as List<dynamic>).map((role) => role.toString()).toList(),
      token: json['token'] as String,
      expiresOn: json['expiresOn'] as String,
    );

  }}
