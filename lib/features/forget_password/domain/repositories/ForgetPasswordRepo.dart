import 'package:dartz/dartz.dart';
import 'package:moneyapp/core/error/faliure.dart';
import 'package:moneyapp/features/forget_password/domain/entities/forget_password_entity.dart';

abstract class BaseForgetPasswordRepository {


  Future <Either<Failure, ForgetPasswordEntity>> forgetPassword(String email);
  Future <Either<Failure, String>> code(String email);






}