import 'package:dartz/dartz.dart';
import 'package:moneyapp/core/error/exceptions.dart';
import 'package:moneyapp/core/error/faliure.dart';
import 'package:moneyapp/features/add_report/data/data_sources/add_report_RemoteDataSource.dart';
import 'package:moneyapp/features/add_report/data/models/add_report_model.dart';
import 'package:moneyapp/features/add_report/domain/repositories/add_report_Repo.dart';
import 'package:moneyapp/features/add_report/domain/use_cases/add_report_use_case.dart';
import 'package:moneyapp/features/forget_password/data/data_sources/ForgetPasswordRemoteDataSource.dart';
import 'package:moneyapp/features/forget_password/data/models/forget_password_model.dart';
import 'package:moneyapp/features/forget_password/domain/repositories/ForgetPasswordRepo.dart';

class AddReportRepository extends BaseAddReportRepository {
  final BaseAddReportRemoteDataSource baseAddReportRemoteDataSource;

  AddReportRepository(this.baseAddReportRemoteDataSource);

  @override
  Future<Either<Failure, AddReportModel>> addReport(AddReportParameter addReportParameter) async {
    final result =
        await baseAddReportRemoteDataSource.addReport(addReportParameter);
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
