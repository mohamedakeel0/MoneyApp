import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:moneyapp/core/error/faliure.dart';
import 'package:moneyapp/features/change_password/domain/repositories/change_password_Repo.dart';
import 'package:moneyapp/features/forget_password/domain/entities/forget_password_entity.dart';
import 'package:moneyapp/features/forget_password/domain/repositories/ForgetPasswordRepo.dart';
import 'package:moneyapp/features/forget_password/domain/use_cases/ForgetPasswordUseCase.dart';

import '../../../../core/usecase/base_usecase.dart';

class ChangePasswordUseCase extends BaseUseCase<String, ChangePasswordParameter> {
  final BaseChangePasswordRepository baseChangePasswordRepository;

  ChangePasswordUseCase(this.baseChangePasswordRepository);

  @override
  Future<Either<Failure, String>> call(ChangePasswordParameter changePasswordParameter) async {
    return await baseChangePasswordRepository.changePassword(changePasswordParameter);
  }


}

class ChangePasswordParameter {
  final String newPassword;
  final String confirmPassword;
  final String email;

  ChangePasswordParameter(
      {required this.email, required this.confirmPassword, required this.newPassword,});

  factory ChangePasswordParameter.fromJson(Map<String, dynamic> json) {
    return ChangePasswordParameter(
      email: json['email'],
      confirmPassword: json['confirmPassword'],
      newPassword: json['newPassword'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'confirmPassword': confirmPassword,
      'newPassword': newPassword,
    };
  }
}