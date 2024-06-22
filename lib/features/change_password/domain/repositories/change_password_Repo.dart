import 'package:dartz/dartz.dart';
import 'package:moneyapp/core/error/faliure.dart';
import 'package:moneyapp/features/change_password/domain/use_cases/change_password_use_case.dart';
import 'package:moneyapp/features/forget_password/domain/entities/forget_password_entity.dart';

abstract class BaseChangePasswordRepository {


  Future <Either<Failure, String>> changePassword(ChangePasswordParameter changePasswordParameter);







}