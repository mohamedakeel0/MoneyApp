import 'package:dartz/dartz.dart';
import 'package:moneyapp/core/error/faliure.dart';
import 'package:moneyapp/features/login/domain/entities/loginEntity.dart';
import 'package:moneyapp/features/regisiter/domain/entities/parameterLogin.dart';

abstract class BaseRegisterRepository {


  Future <Either<Failure, LoginEntity>> register(RegisterParameters registerParameters);



}
