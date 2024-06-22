import 'package:dartz/dartz.dart';
import 'package:moneyapp/core/error/exceptions.dart';
import 'package:moneyapp/core/error/faliure.dart';
import 'package:moneyapp/features/change_password/data/data_sources/change_password_RemoteDataSource.dart';
import 'package:moneyapp/features/change_password/domain/repositories/change_password_Repo.dart';
import 'package:moneyapp/features/change_password/domain/use_cases/change_password_use_case.dart';

class ChangePasswordRepository extends BaseChangePasswordRepository {
  final BaseChangePasswordRemoteDataSource baseChangePasswordRemoteDataSource;

  ChangePasswordRepository(this.baseChangePasswordRemoteDataSource);


  @override
  Future<Either<Failure, String>> changePassword(ChangePasswordParameter changePasswordParameter)  async {
    final result =
    await baseChangePasswordRemoteDataSource.changePassword(changePasswordParameter);
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
