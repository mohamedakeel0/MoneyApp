import 'package:dartz/dartz.dart';
import 'package:moneyapp/core/error/exceptions.dart';
import 'package:moneyapp/core/error/faliure.dart';
import 'package:moneyapp/features/forget_password/data/data_sources/ForgetPasswordRemoteDataSource.dart';
import 'package:moneyapp/features/forget_password/data/models/forget_password_model.dart';
import 'package:moneyapp/features/forget_password/domain/repositories/ForgetPasswordRepo.dart';

class ForgetPasswordRepository extends BaseForgetPasswordRepository {
  final BaseForgetPasswordRemoteDataSource baseForgetPasswordRemoteDataSource;

  ForgetPasswordRepository(this.baseForgetPasswordRemoteDataSource);

  @override
  Future<Either<Failure, ForgetPasswordModel>> forgetPassword(
      String email) async {
    final result =
        await baseForgetPasswordRemoteDataSource.forgetPassword(email);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      print("0000000000${failure.errorMessageModel.errors![0]}");
      print(failure.errorMessageModel.message);
      return Left(ServerFailure(failure.errorMessageModel.errors![0] ??
          failure.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, String>> code(String email) async {
    final result =
    await baseForgetPasswordRemoteDataSource.code(email);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      print("0000000000${failure.errorMessageModel.errors![0]}");
      print(failure.errorMessageModel.message);
      return Left(ServerFailure(failure.errorMessageModel.errors![0] ??
          failure.errorMessageModel.message));
    }
  }

}
