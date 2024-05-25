import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
class RegisterParameters {
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  String? confirmPassword;
  String? phoneNumber;

  RegisterParameters(
      {this.firstName,
        this.lastName,
        this.email,
        this.password,
        this.confirmPassword,
        this.phoneNumber});

  RegisterParameters.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    password = json['password'];
    confirmPassword = json['confirmPassword'];
    phoneNumber = json['phoneNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['email'] = this.email;
    data['password'] = this.password;
    data['confirmPassword'] = this.confirmPassword;
    data['phoneNumber'] = this.phoneNumber;
    return data;
  }
}