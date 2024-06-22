import 'package:dartz/dartz.dart';
import 'package:moneyapp/core/error/exceptions.dart';
import 'package:moneyapp/core/error/faliure.dart';
import 'package:moneyapp/features/Reporting/data/data_sources/reports_RemoteDataSource.dart';
import 'package:moneyapp/features/Reporting/domain/repositories/reports_Repo.dart';
import 'package:moneyapp/features/add_report/data/models/add_report_model.dart';

class ReportsRepository extends BaseReportsRepository {
  final BaseReportsRemoteDataSource reportsRemoteDataSource;

  ReportsRepository(this.reportsRemoteDataSource);

  @override
  Future<Either<Failure, List<AddReportModel>>> reports( ) async {
    final result =
        await reportsRemoteDataSource.reports();
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
