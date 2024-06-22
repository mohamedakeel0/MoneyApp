import 'package:dartz/dartz.dart';
import 'package:moneyapp/core/error/exceptions.dart';
import 'package:moneyapp/core/error/faliure.dart';
import 'package:moneyapp/features/login/data/data_sources/loginRemoteDataSource.dart';
import 'package:moneyapp/features/login/data/models/loginModel.dart';
import 'package:moneyapp/features/login/domain/entities/loginEntity.dart';
import 'package:moneyapp/features/login/domain/entities/parameterLogin.dart';
import 'package:moneyapp/features/login/domain/repositories/loginRepo.dart';

class UserLoginRepository extends BaseUserLoginRepository{
  final BaseUserLoginRemoteDataSource baseUserLoginRemoteDataSource;

  UserLoginRepository(this.baseUserLoginRemoteDataSource);



  @override
  Future<Either<Failure, LoginModel>> userLogin(LoginParameters loginParameters) async {
    final result= await baseUserLoginRemoteDataSource.userLogin(loginParameters);
    try{
      return Right(result);
    }on ServerException catch(failure){
      print("0000000000${failure.errorMessageModel.errors![0]}");
      print(failure.errorMessageModel.message);
      return Left(ServerFailure(failure.errorMessageModel.errors![0]??
      failure.errorMessageModel.message));
    }
  }





}