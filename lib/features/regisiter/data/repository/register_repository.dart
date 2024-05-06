import 'package:dartz/dartz.dart';
import 'package:moneyapp/core/error/exceptions.dart';
import 'package:moneyapp/core/error/faliure.dart';
import 'package:moneyapp/features/login/data/models/loginModel.dart';
import 'package:moneyapp/features/regisiter/data/datasource/register_remote_data_source.dart';
import 'package:moneyapp/features/regisiter/domain/entities/parameterLogin.dart';
import 'package:moneyapp/features/regisiter/domain/repository/base_register_repository.dart';

class RegisterRepository extends BaseRegisterRepository{
  final BaseRegisterRemoteDataSource baseRegisterRemoteDataSource;

  RegisterRepository(this.baseRegisterRemoteDataSource);
  @override
  Future<Either<Failure, LoginModel>>register(RegisterParameters registerParameters) async {
    final result= await baseRegisterRemoteDataSource.register(registerParameters);
    try{
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.errors![0]??
          failure.errorMessageModel.message));
    }
  }



}