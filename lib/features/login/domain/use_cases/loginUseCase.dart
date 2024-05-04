import 'package:dartz/dartz.dart';
import 'package:moneyapp/core/error/faliure.dart';
import 'package:moneyapp/features/login/domain/entities/loginEntity.dart';
import 'package:moneyapp/features/login/domain/entities/parameterLogin.dart';
import 'package:moneyapp/features/login/domain/repositories/loginRepo.dart';


import '../../../../core/usecase/base_usecase.dart';

class UserLoginUseCase extends BaseUseCase<LoginEntity,LoginParameters>{
  final BaseUserLoginRepository baseUserLoginRepository;
  UserLoginUseCase(this.baseUserLoginRepository);
  @override
  Future<Either<Failure, LoginEntity>> call(LoginParameters parameters) async{
    return await baseUserLoginRepository.userLogin(parameters);
  }



}
