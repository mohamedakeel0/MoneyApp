import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:moneyapp/core/error/faliure.dart';
import 'package:moneyapp/core/usecase/base_usecase.dart';
import 'package:moneyapp/features/login/domain/entities/loginEntity.dart';
import 'package:moneyapp/features/regisiter/domain/entities/parameterLogin.dart';
import 'package:moneyapp/features/regisiter/domain/repository/base_register_repository.dart';


class RegisterUseCase extends BaseUseCase<LoginEntity,RegisterParameters>{
  final BaseRegisterRepository baseRegisterRepository;
  RegisterUseCase(this.baseRegisterRepository);

  @override
  Future<Either<Failure, LoginEntity>> call(RegisterParameters parameters) async{
    return await baseRegisterRepository.register(parameters);
  }


}

