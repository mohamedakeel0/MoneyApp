import 'package:equatable/equatable.dart';

class LoginEntity extends Equatable {
  String? message;
  bool? isAuthenticated;
  String? email;
  String? username;
  List<String>? roles;
  String? token;
  String? expiresOn;

  LoginEntity(
      {this.message,
      this.isAuthenticated,
      this.email,
      this.username,
      this.roles,
      this.token,
      this.expiresOn});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['isAuthenticated'] = this.isAuthenticated;
    data['email'] = this.email;
    data['username'] = this.username;
    data['roles'] = this.roles;
    data['token'] = this.token;
    data['expiresOn'] = this.expiresOn;
    return data;
  }

  @override
  List<Object?> get props => [
        message,
        isAuthenticated,
        email,
        username,
        roles,
        token,
        expiresOn,
      ];
}
