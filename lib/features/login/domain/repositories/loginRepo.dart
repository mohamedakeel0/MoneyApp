import 'package:dartz/dartz.dart';
import 'package:moneyapp/core/error/faliure.dart';
import 'package:moneyapp/features/login/domain/entities/loginEntity.dart';
import 'package:moneyapp/features/login/domain/entities/parameterLogin.dart';

abstract class BaseUserLoginRepository {


  Future <Either<Failure, LoginEntity>> userLogin(LoginParameters loginParameters);






}