import 'package:moneyapp/features/forget_password/domain/entities/forget_password_entity.dart';

class ForgetPasswordModel extends ForgetPasswordEntity {
  ForgetPasswordModel({
    required super.email,
  });

  factory ForgetPasswordModel.fromJson(Map<String, dynamic> json) {
    return ForgetPasswordModel(
      email: json['email'],
    );
  }
}
