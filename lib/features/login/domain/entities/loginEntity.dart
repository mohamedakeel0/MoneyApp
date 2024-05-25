import 'package:equatable/equatable.dart';

class LoginEntity extends Equatable {
  String? message;
  bool? isAuthenticated;
  String? email;
  String? username;
  List<String>? roles;
  String? token;
  String? expiresOn;
  String? phone;
  String? image;

  LoginEntity(
      {this.message,
      this.isAuthenticated,
      this.email,
      this.username,
      this.roles,
      this.token,
      this.phone,
      this.image,
      this.expiresOn});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = message;
    data['isAuthenticated'] = isAuthenticated;
    data['email'] = email;
    data['username'] = username;
    data['roles'] = roles;
    data['token'] = token;
    data['expiresOn'] = expiresOn;
    data['image'] = image;
    data['phone'] = phone;
    return data;
  }

  @override
  List<Object?> get props => [
        message,
        isAuthenticated,
        image,
        email,
        username,
        roles,
        token,
        expiresOn,
        phone,
      ];
}
